unit Deskprompter.Infraestrutura.Windows.PosicionamentoJanela;

interface

uses
  Deskprompter.Aplicacao.Contratos.PosicionamentoJanela;

type
  TPosicionamentoJanelaWindows = class(
    TInterfacedObject,
    IPosicionamentoJanela)
  public
    function DefinirSempreNoTopo(
      const AIdentificadorJanela: NativeUInt;
      const AAtivo: Boolean): TResultadoPosicionamentoJanela;
  end;

implementation

uses
  System.SysUtils,
  Winapi.Windows;

function TPosicionamentoJanelaWindows.DefinirSempreNoTopo(
  const AIdentificadorJanela: NativeUInt;
  const AAtivo: Boolean): TResultadoPosicionamentoJanela;
var
  CodigoErro: Cardinal;
  Posicao: HWND;
begin
  if AIdentificadorJanela = 0 then
    Exit(TResultadoPosicionamentoJanela.Criar(
      False,
      'Identificador de janela invalido'));

  if AAtivo then
    Posicao := HWND_TOPMOST
  else
    Posicao := HWND_NOTOPMOST;

  SetLastError(ERROR_SUCCESS);
  if not SetWindowPos(
    HWND(AIdentificadorJanela),
    Posicao,
    0,
    0,
    0,
    0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE) then
  begin
    CodigoErro := GetLastError;
    Exit(TResultadoPosicionamentoJanela.Criar(
      False,
      Format(
        'Falha ao alterar o posicionamento da janela. Erro do Windows: %d',
        [CodigoErro]),
      CodigoErro));
  end;

  if AAtivo then
    Result := TResultadoPosicionamentoJanela.Criar(
      True,
      'Modo sempre no topo ativo')
  else
    Result := TResultadoPosicionamentoJanela.Criar(
      True,
      'Modo sempre no topo inativo');
end;

end.
