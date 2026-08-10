unit Testes.VCL.ControladorSempreNoTopo;

interface

uses
  DUnitX.TestFramework,
  Vcl.StdCtrls,
  Deskprompter.Aplicacao.Contratos.Diagnostico,
  Deskprompter.Aplicacao.Contratos.PosicionamentoJanela,
  Deskprompter.VCL.ControladorSempreNoTopo;

type
  TPosicionamentoJanelaFalso = class(TInterfacedObject, IPosicionamentoJanela)
  public
    Aplicacoes: Integer;
    AtivoRecebido: Boolean;
    Falhar: Boolean;
    function DefinirSempreNoTopo(
      const AIdentificadorJanela: NativeUInt;
      const AAtivo: Boolean): TResultadoPosicionamentoJanela;
  end;

  TRegistroSempreNoTopoFalso = class(
    TInterfacedObject,
    IRegistroDiagnostico)
  public
    QuantidadeRegistros: Integer;
    UltimoNivel: TNivelRegistro;
    procedure Registrar(
      const ANivel: TNivelRegistro;
      const AMensagem: string);
  end;

  [TestFixture]
  TTestesControladorSempreNoTopo = class
  private
    FControlador: TControladorSempreNoTopo;
    FPosicionamento: IPosicionamentoJanela;
    FPosicionamentoFalso: TPosicionamentoJanelaFalso;
    FRegistro: IRegistroDiagnostico;
    FRegistroFalso: TRegistroSempreNoTopoFalso;
    FRotulo: TLabel;
  public
    [Setup]
    procedure Preparar;
    [TearDown]
    procedure Finalizar;

    [Test]
    procedure IniciaInativoEAplicaPosicionamento;
    [Test]
    procedure AtivaPosicionamento;
    [Test]
    procedure InformaFalhaAoAplicarPosicionamento;
  end;

implementation

function TPosicionamentoJanelaFalso.DefinirSempreNoTopo(
  const AIdentificadorJanela: NativeUInt;
  const AAtivo: Boolean): TResultadoPosicionamentoJanela;
begin
  Inc(Aplicacoes);
  AtivoRecebido := AAtivo;
  if Falhar then
    Result := TResultadoPosicionamentoJanela.Criar(
      False,
      'Falha simulada',
      5)
  else
    Result := TResultadoPosicionamentoJanela.Criar(
      True,
      'Posicionamento aplicado');
end;

procedure TRegistroSempreNoTopoFalso.Registrar(
  const ANivel: TNivelRegistro;
  const AMensagem: string);
begin
  Inc(QuantidadeRegistros);
  UltimoNivel := ANivel;
end;

procedure TTestesControladorSempreNoTopo.AtivaPosicionamento;
begin
  FControlador.DefinirAtivo(True, 123);

  Assert.IsTrue(FControlador.Ativo);
  Assert.IsTrue(FPosicionamentoFalso.AtivoRecebido);
  Assert.AreEqual('Sempre no topo ativo', FRotulo.Caption);
  Assert.AreEqual(nrInformacao, FRegistroFalso.UltimoNivel);
end;

procedure TTestesControladorSempreNoTopo.Finalizar;
begin
  FControlador.Free;
  FRotulo.Free;
  FRegistro := nil;
  FPosicionamento := nil;
end;

procedure TTestesControladorSempreNoTopo.InformaFalhaAoAplicarPosicionamento;
begin
  FPosicionamentoFalso.Falhar := True;

  FControlador.Aplicar(123);

  Assert.AreEqual('Falha ao alterar sempre no topo', FRotulo.Caption);
  Assert.AreEqual(nrAviso, FRegistroFalso.UltimoNivel);
end;

procedure TTestesControladorSempreNoTopo.IniciaInativoEAplicaPosicionamento;
begin
  FControlador.Aplicar(123);

  Assert.IsFalse(FControlador.Ativo);
  Assert.AreEqual(1, FPosicionamentoFalso.Aplicacoes);
  Assert.IsFalse(FPosicionamentoFalso.AtivoRecebido);
  Assert.AreEqual('Sempre no topo inativo', FRotulo.Caption);
  Assert.AreEqual($004040FF, Integer(FRotulo.Font.Color));
  Assert.AreEqual(nrInformacao, FRegistroFalso.UltimoNivel);
end;

procedure TTestesControladorSempreNoTopo.Preparar;
begin
  FRotulo := TLabel.Create(nil);
  FPosicionamentoFalso := TPosicionamentoJanelaFalso.Create;
  FPosicionamento := FPosicionamentoFalso;
  FRegistroFalso := TRegistroSempreNoTopoFalso.Create;
  FRegistro := FRegistroFalso;
  FControlador := TControladorSempreNoTopo.Create(FRotulo);
  FControlador.Configurar(FRegistro, FPosicionamento);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesControladorSempreNoTopo);

end.
