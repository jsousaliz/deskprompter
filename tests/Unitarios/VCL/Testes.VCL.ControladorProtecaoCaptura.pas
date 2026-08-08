unit Testes.VCL.ControladorProtecaoCaptura;

interface

uses
  DUnitX.TestFramework,
  Vcl.StdCtrls,
  Deskprompter.Aplicacao.Contratos.Diagnostico,
  Deskprompter.Aplicacao.Contratos.ProtecaoCaptura,
  Deskprompter.VCL.ControladorProtecaoCaptura;

type
  TProtecaoCapturaFalsa = class(TInterfacedObject, IProtecaoCaptura)
  public
    Ativacoes: Integer;
    Desativacoes: Integer;
    function Ativar(
      const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
    function Desativar(
      const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
  end;

  TRegistroDiagnosticoFalso = class(TInterfacedObject, IRegistroDiagnostico)
  public
    QuantidadeRegistros: Integer;
    UltimoNivel: TNivelRegistro;
    procedure Registrar(
      const ANivel: TNivelRegistro;
      const AMensagem: string);
  end;

  [TestFixture]
  TTestesControladorProtecaoCaptura = class
  private
    FControlador: TControladorProtecaoCaptura;
    FProtecao: IProtecaoCaptura;
    FProtecaoFalsa: TProtecaoCapturaFalsa;
    FRegistro: IRegistroDiagnostico;
    FRegistroFalso: TRegistroDiagnosticoFalso;
    FRotulo: TLabel;
  public
    [Setup]
    procedure Preparar;
    [TearDown]
    procedure Finalizar;

    [Test]
    procedure AtivaProtecaoEAtualizaEstado;
    [Test]
    procedure DesativaProtecaoEAtualizaEstado;
  end;

implementation

function TProtecaoCapturaFalsa.Ativar(
  const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
begin
  Inc(Ativacoes);
  Result := TResultadoProtecaoCaptura.Criar(
    epcAtiva,
    'Protecao ativada');
end;

function TProtecaoCapturaFalsa.Desativar(
  const AIdentificadorJanela: NativeUInt): TResultadoProtecaoCaptura;
begin
  Inc(Desativacoes);
  Result := TResultadoProtecaoCaptura.Criar(
    epcNaoVerificada,
    'Protecao desativada');
end;

procedure TRegistroDiagnosticoFalso.Registrar(
  const ANivel: TNivelRegistro;
  const AMensagem: string);
begin
  Inc(QuantidadeRegistros);
  UltimoNivel := ANivel;
end;

procedure TTestesControladorProtecaoCaptura.AtivaProtecaoEAtualizaEstado;
begin
  FControlador.Aplicar(123);

  Assert.AreEqual(1, FProtecaoFalsa.Ativacoes);
  Assert.AreEqual(0, FProtecaoFalsa.Desativacoes);
  Assert.AreEqual('Prote' + #$00E7 + 'ao de captura ativa', FRotulo.Caption);
  Assert.AreEqual(1, FRegistroFalso.QuantidadeRegistros);
  Assert.AreEqual(nrInformacao, FRegistroFalso.UltimoNivel);
end;

procedure TTestesControladorProtecaoCaptura.DesativaProtecaoEAtualizaEstado;
begin
  FControlador.DefinirAtiva(False, 123);

  Assert.AreEqual(0, FProtecaoFalsa.Ativacoes);
  Assert.AreEqual(1, FProtecaoFalsa.Desativacoes);
  Assert.AreEqual('Prote' + #$00E7 + 'ao de captura inativa', FRotulo.Caption);
  Assert.AreEqual(1, FRegistroFalso.QuantidadeRegistros);
  Assert.AreEqual(nrInformacao, FRegistroFalso.UltimoNivel);
end;

procedure TTestesControladorProtecaoCaptura.Finalizar;
begin
  FControlador.Free;
  FRotulo.Free;
  FRegistro := nil;
  FProtecao := nil;
end;

procedure TTestesControladorProtecaoCaptura.Preparar;
begin
  FRotulo := TLabel.Create(nil);
  FProtecaoFalsa := TProtecaoCapturaFalsa.Create;
  FProtecao := FProtecaoFalsa;
  FRegistroFalso := TRegistroDiagnosticoFalso.Create;
  FRegistro := FRegistroFalso;
  FControlador := TControladorProtecaoCaptura.Create(FRotulo);
  FControlador.Configurar(FRegistro, FProtecao);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesControladorProtecaoCaptura);

end.
