[CmdletBinding()]
param(
  [ValidatePattern('^\d+\.\d+\.\d+$')]
  [string]$Versao = '0.1.0'
)

$ErrorActionPreference = 'Stop'

$DiretorioScript = Split-Path -Parent $MyInvocation.MyCommand.Path
$RaizProjeto = [IO.Path]::GetFullPath((Join-Path $DiretorioScript '..\..'))
$DiretorioDelphi = 'C:\Program Files (x86)\Embarcadero\Studio\23.0'
$ArquivoMSBuild = 'C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe'
$ProjetoAplicacao = Join-Path $RaizProjeto 'src\Deskprompter.dproj'
$ProjetoTestes = Join-Path $RaizProjeto 'tests\Deskprompter.Testes.dproj'
$ExecutavelAplicacao = Join-Path $RaizProjeto 'bin\app\Deskprompter.exe'
$ExecutavelTestes = Join-Path $RaizProjeto 'bin\tests\Deskprompter.Testes.exe'
$DiretorioDistribuicao = Join-Path $RaizProjeto 'dist'
$NomeInstalador = "Deskprompter-Setup-$Versao.exe"
$InstaladorGerado = Join-Path $RaizProjeto "bin\instalador\$NomeInstalador"
$InstaladorDistribuicao = Join-Path $DiretorioDistribuicao $NomeInstalador

function Confirmar-DentroDoProjeto([string]$Caminho) {
  $Resolvido = [IO.Path]::GetFullPath($Caminho)
  if (-not $Resolvido.StartsWith($RaizProjeto, [StringComparison]::OrdinalIgnoreCase)) {
    throw "Caminho fora do projeto: $Resolvido"
  }
}

function Obter-InnoSetup {
  $Candidatos = @(
    'C:\Program Files (x86)\Inno Setup 6\ISCC.exe',
    'C:\Program Files\Inno Setup 6\ISCC.exe',
    (Join-Path $env:LOCALAPPDATA 'Programs\Inno Setup 6\ISCC.exe')
  )

  foreach ($Candidato in $Candidatos) {
    if (Test-Path -LiteralPath $Candidato -PathType Leaf) {
      return $Candidato
    }
  }

  throw 'Inno Setup 6 nao encontrado. Instale-o no runner antes de gerar uma release.'
}

function Compilar-Projeto(
  [string]$Projeto,
  [string[]]$ParametrosAdicionais = @()
) {
  $Parametros = @(
    $Projeto,
    '/t:Build',
    '/p:Platform=Win64',
    '/p:Config=Release',
    '/nologo',
    '/verbosity:minimal'
  ) + $ParametrosAdicionais

  & $ArquivoMSBuild @Parametros
  if ($LASTEXITCODE -ne 0) {
    throw "Falha ao compilar $Projeto."
  }
}

if (-not (Test-Path -LiteralPath $ArquivoMSBuild -PathType Leaf)) {
  throw 'MSBuild do Delphi 12 nao encontrado.'
}

if (-not (Test-Path -LiteralPath $DiretorioDelphi -PathType Container)) {
  throw 'Delphi 12 nao encontrado.'
}

$env:BDS = $DiretorioDelphi
$env:BDSINCLUDE = Join-Path $DiretorioDelphi 'include'
$env:BDSCOMMONDIR = 'C:\Users\Public\Documents\Embarcadero\Studio\23.0'
$env:LANGDIR = 'EN'

Compilar-Projeto $ProjetoTestes
& $ExecutavelTestes
if ($LASTEXITCODE -ne 0) {
  throw "Os testes falharam com o codigo $LASTEXITCODE."
}

$PartesVersao = $Versao.Split('.')
$ParametrosVersao = @(
  "/p:VerInfo_MajorVer=$($PartesVersao[0])",
  "/p:VerInfo_MinorVer=$($PartesVersao[1])",
  "/p:VerInfo_Release=$($PartesVersao[2])",
  '/p:VerInfo_Build=0'
)
Compilar-Projeto $ProjetoAplicacao $ParametrosVersao

$InformacoesVersao = [Diagnostics.FileVersionInfo]::GetVersionInfo($ExecutavelAplicacao)
$VersaoArquivoEsperada = "$Versao.0"
if ($InformacoesVersao.FileVersion -ne $VersaoArquivoEsperada) {
  throw "FileVersion inesperada: $($InformacoesVersao.FileVersion). Esperada: $VersaoArquivoEsperada."
}
if ($InformacoesVersao.ProductVersion -ne $Versao) {
  throw "ProductVersion inesperada: $($InformacoesVersao.ProductVersion). Esperada: $Versao."
}

$ArquivoInnoSetup = Obter-InnoSetup
& $ArquivoInnoSetup "/DVersaoAplicativo=$Versao" (Join-Path $DiretorioScript 'Deskprompter.iss')
if ($LASTEXITCODE -ne 0) {
  throw 'Falha ao compilar o instalador do Deskprompter.'
}

if (-not (Test-Path -LiteralPath $InstaladorGerado -PathType Leaf)) {
  throw "Instalador nao encontrado: $InstaladorGerado"
}

Confirmar-DentroDoProjeto $DiretorioDistribuicao
if (Test-Path -LiteralPath $DiretorioDistribuicao) {
  Remove-Item -LiteralPath $DiretorioDistribuicao -Recurse -Force
}
New-Item -ItemType Directory -Path $DiretorioDistribuicao -Force | Out-Null
Copy-Item -LiteralPath $InstaladorGerado -Destination $InstaladorDistribuicao

$Hash = (Get-FileHash -LiteralPath $InstaladorDistribuicao -Algorithm SHA256).Hash.ToLowerInvariant()
"$Hash  $NomeInstalador" |
  Set-Content -LiteralPath "$InstaladorDistribuicao.sha256" -Encoding Ascii

Write-Host "Instalador: $InstaladorDistribuicao"
Write-Host "SHA-256: $Hash"
Write-Host "Versao: $Versao"
