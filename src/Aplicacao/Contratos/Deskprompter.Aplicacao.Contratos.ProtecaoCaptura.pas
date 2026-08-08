unit Deskprompter.Aplicacao.Contratos.ProtecaoCaptura;

interface

type
  TEstadoProtecaoCaptura = (
    epcNaoVerificada,
    epcAtiva,
    epcIndisponivel,
    epcFalhou
  );

  TResultadoProtecaoCaptura = record
    Estado: TEstadoProtecaoCaptura;
    CodigoErro: Cardinal;
    Mensagem: string;
    class function Criar(
      const AEstado: TEstadoProtecaoCaptura;
      const AMensagem: string;
      const ACodigoErro: Cardinal = 0): TResultadoProtecaoCaptura; static;
  end;

  IProtecaoCaptura = interface
    ['{45769DC5-B17F-4865-A335-8FC4B055EE0B}']
    function Ativar(
      const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
    function Desativar(
      const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
  end;

implementation

class function TResultadoProtecaoCaptura.Criar(
  const AEstado: TEstadoProtecaoCaptura;
  const AMensagem: string;
  const ACodigoErro: Cardinal): TResultadoProtecaoCaptura;
begin
  Result.Estado := AEstado;
  Result.CodigoErro := ACodigoErro;
  Result.Mensagem := AMensagem;
end;

end.

