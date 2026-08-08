unit Deskprompter.Infraestrutura.Windows.ProtecaoCaptura;

interface

uses
  Deskprompter.Aplicacao.Contratos.ProtecaoCaptura;

type
  TProtecaoCapturaWindows = class(TInterfacedObject, IProtecaoCaptura)
  public
    function Ativar(
      const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
    function Desativar(
      const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
  end;

implementation

uses
  Winapi.Dwmapi,
  Winapi.Windows,
  System.SysUtils;

const
  AFINIDADE_NENHUMA = $00000000;
  AFINIDADE_EXCLUIR_DA_CAPTURA = $00000011;
  VERSAO_MINIMA_WINDOWS = 10;
  COMPILACAO_MINIMA_WINDOWS = 19041;

function TProtecaoCapturaWindows.Ativar(
  const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
var
  AfinidadeConfirmada: DWORD;
  ComposicaoAtiva: BOOL;
  CodigoErro: Cardinal;
  Janela: HWND;
begin
  if AIdentificadorJanela = 0 then
    Exit(TResultadoProtecaoCaptura.Criar(
      epcFalhou,
      'Identificador de janela invalido'));

  if (TOSVersion.Major < VERSAO_MINIMA_WINDOWS) or
     ((TOSVersion.Major = VERSAO_MINIMA_WINDOWS) and
      (TOSVersion.Build < COMPILACAO_MINIMA_WINDOWS)) then
    Exit(TResultadoProtecaoCaptura.Criar(
      epcIndisponivel,
      'A exclusao completa exige Windows 10 versao 2004 ou superior'));

  ComposicaoAtiva := False;
  if (DwmIsCompositionEnabled(ComposicaoAtiva) <> S_OK) or
     not ComposicaoAtiva then
    Exit(TResultadoProtecaoCaptura.Criar(
      epcIndisponivel,
      'O Gerenciador de Janelas da Area de Trabalho nao esta ativo'));

  Janela := HWND(AIdentificadorJanela);
  SetLastError(ERROR_SUCCESS);
  if not SetWindowDisplayAffinity(Janela, AFINIDADE_EXCLUIR_DA_CAPTURA) then
  begin
    CodigoErro := GetLastError;
    Exit(TResultadoProtecaoCaptura.Criar(
      epcFalhou,
      Format('Falha ao excluir a janela da captura. Erro do Windows: %d',
        [CodigoErro]),
      CodigoErro));
  end;

  AfinidadeConfirmada := AFINIDADE_NENHUMA;
  SetLastError(ERROR_SUCCESS);
  if not GetWindowDisplayAffinity(Janela, AfinidadeConfirmada) then
  begin
    CodigoErro := GetLastError;
    Exit(TResultadoProtecaoCaptura.Criar(
      epcFalhou,
      Format('Nao foi possivel confirmar a protecao. Erro do Windows: %d',
        [CodigoErro]),
      CodigoErro));
  end;

  if AfinidadeConfirmada <> AFINIDADE_EXCLUIR_DA_CAPTURA then
    Exit(TResultadoProtecaoCaptura.Criar(
      epcFalhou,
      'O Windows nao confirmou a afinidade de exclusao solicitada'));

  Result := TResultadoProtecaoCaptura.Criar(
    epcAtiva,
    'Protecao de captura ativa');
end;

function TProtecaoCapturaWindows.Desativar(
  const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
var
  CodigoErro: Cardinal;
begin
  SetLastError(ERROR_SUCCESS);
  if not SetWindowDisplayAffinity(
    HWND(AIdentificadorJanela),
    AFINIDADE_NENHUMA) then
  begin
    CodigoErro := GetLastError;
    Exit(TResultadoProtecaoCaptura.Criar(
      epcFalhou,
      Format('Falha ao desativar a protecao. Erro do Windows: %d',
        [CodigoErro]),
      CodigoErro));
  end;

  Result := TResultadoProtecaoCaptura.Criar(
    epcNaoVerificada,
    'Protecao de captura inativa');
end;

end.
