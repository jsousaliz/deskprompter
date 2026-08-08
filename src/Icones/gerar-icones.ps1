param(
  [string] $Navegador
)

$ErrorActionPreference = 'Stop'
$diretorio = Split-Path -Parent $MyInvocation.MyCommand.Path
$svg = Join-Path $diretorio 'Deskprompter.svg'
$diretorioPng = Join-Path $diretorio 'png'
$pngMestre = Join-Path $diretorioPng 'Deskprompter-1024.png'
$ico = Join-Path $diretorio 'Deskprompter.ico'
$tamanhosPng = @(16, 24, 32, 48, 64, 128, 256, 512)
$tamanhosIco = @(16, 24, 32, 48, 64, 128, 256)

if (-not $Navegador) {
  $candidatos = @(
    'C:\Program Files\Google\Chrome\Application\chrome.exe',
    'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe',
    'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe',
    'C:\Program Files\Microsoft\Edge\Application\msedge.exe'
  )
  $Navegador = $candidatos |
    Where-Object { Test-Path -LiteralPath $_ } |
    Select-Object -First 1
}

if (-not $Navegador -or -not (Test-Path -LiteralPath $Navegador)) {
  throw 'Microsoft Edge ou Google Chrome não encontrado para renderizar o SVG.'
}

New-Item -ItemType Directory -Path $diretorioPng -Force | Out-Null
$uriSvg = [Uri]::new($svg).AbsoluteUri
$perfilNavegador = Join-Path $env:TEMP ('DeskprompterIcones-' + [Guid]::NewGuid())
try {
  & $Navegador @(
    '--headless=new',
    '--disable-gpu-compositing',
    '--hide-scrollbars',
    '--no-first-run',
    '--no-default-browser-check',
    "--user-data-dir=$perfilNavegador",
    '--force-device-scale-factor=1',
    '--default-background-color=00000000',
    '--window-size=1024,1024',
    "--screenshot=$pngMestre",
    $uriSvg
  ) | Out-Null
}
finally {
  $perfilResolvido = [System.IO.Path]::GetFullPath($perfilNavegador)
  $temporarioResolvido = [System.IO.Path]::GetFullPath($env:TEMP)
  if ($perfilResolvido.StartsWith($temporarioResolvido) -and
      (Test-Path -LiteralPath $perfilResolvido)) {
    Remove-Item -LiteralPath $perfilResolvido -Recurse -Force
  }
}

if (-not (Test-Path -LiteralPath $pngMestre)) {
  throw 'O navegador não gerou o PNG mestre.'
}

Add-Type -AssemblyName System.Drawing
$imagemMestre = [System.Drawing.Image]::FromFile($pngMestre)
try {
  foreach ($tamanho in $tamanhosPng) {
    $destino = Join-Path $diretorioPng "Deskprompter-$tamanho.png"
    $bitmap = [System.Drawing.Bitmap]::new(
      $tamanho,
      $tamanho,
      [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $grafico = [System.Drawing.Graphics]::FromImage($bitmap)
    try {
      $grafico.Clear([System.Drawing.Color]::Transparent)
      $grafico.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceCopy
      $grafico.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
      $grafico.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
      $grafico.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
      $grafico.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
      $grafico.DrawImage($imagemMestre, 0, 0, $tamanho, $tamanho)
      $bitmap.Save($destino, [System.Drawing.Imaging.ImageFormat]::Png)
    }
    finally {
      $grafico.Dispose()
      $bitmap.Dispose()
    }
  }
}
finally {
  $imagemMestre.Dispose()
}

$imagensIco = foreach ($tamanho in $tamanhosIco) {
  $caminho = Join-Path $diretorioPng "Deskprompter-$tamanho.png"
  [PSCustomObject]@{
    Tamanho = $tamanho
    Bytes = [System.IO.File]::ReadAllBytes($caminho)
  }
}

$fluxo = [System.IO.File]::Create($ico)
$gravador = [System.IO.BinaryWriter]::new($fluxo)
try {
  $gravador.Write([UInt16] 0)
  $gravador.Write([UInt16] 1)
  $gravador.Write([UInt16] $imagensIco.Count)

  $deslocamento = 6 + (16 * $imagensIco.Count)
  foreach ($imagem in $imagensIco) {
    $dimensao = if ($imagem.Tamanho -eq 256) { 0 } else { $imagem.Tamanho }
    $gravador.Write([Byte] $dimensao)
    $gravador.Write([Byte] $dimensao)
    $gravador.Write([Byte] 0)
    $gravador.Write([Byte] 0)
    $gravador.Write([UInt16] 1)
    $gravador.Write([UInt16] 32)
    $gravador.Write([UInt32] $imagem.Bytes.Length)
    $gravador.Write([UInt32] $deslocamento)
    $deslocamento += $imagem.Bytes.Length
  }

  foreach ($imagem in $imagensIco) {
    $gravador.Write($imagem.Bytes)
  }
}
finally {
  $gravador.Dispose()
  $fluxo.Dispose()
}

Write-Output "SVG: $svg"
Write-Output "ICO: $ico"
Write-Output "PNGs: $diretorioPng"
