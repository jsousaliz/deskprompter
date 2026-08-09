unit Deskprompter.Aplicacao.Contratos.PosicionamentoJanela;

interface

type
  TResultadoPosicionamentoJanela = record
    Sucesso: Boolean;
    CodigoErro: Cardinal;
    Mensagem: string;
    class function Criar(
      const ASucesso: Boolean;
      const AMensagem: string;
      const ACodigoErro: Cardinal = 0): TResultadoPosicionamentoJanela; static;
  end;

  IPosicionamentoJanela = interface
    ['{B5F74165-F6CE-40EA-AC39-C2C32B4442B8}']
    function DefinirSempreNoTopo(
      const AIdentificadorJanela: NativeUInt;
      const AAtivo: Boolean): TResultadoPosicionamentoJanela;
  end;

implementation

class function TResultadoPosicionamentoJanela.Criar(
  const ASucesso: Boolean;
  const AMensagem: string;
  const ACodigoErro: Cardinal): TResultadoPosicionamentoJanela;
begin
  Result.Sucesso := ASucesso;
  Result.CodigoErro := ACodigoErro;
  Result.Mensagem := AMensagem;
end;

end.
