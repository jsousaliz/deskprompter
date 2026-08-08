unit Testes.Aplicacao.Aparencia.EstadoEspelhamento;

interface

uses
  DUnitX.TestFramework,
  Deskprompter.Aplicacao.Aparencia.EstadoEspelhamento;

type
  [TestFixture]
  TTestesEstadoEspelhamento = class
  private
    FEstado: TEstadoEspelhamento;
  public
    [Setup]
    procedure Preparar;
    [TearDown]
    procedure Finalizar;

    [Test]
    procedure IniciaSemEspelhamento;
    [Test]
    procedure AlternaEspelhamentoHorizontal;
    [Test]
    procedure AlternaEspelhamentoVertical;
    [Test]
    procedure CombinaEspelhamentosHorizontalEVertical;
  end;

implementation

procedure TTestesEstadoEspelhamento.AlternaEspelhamentoHorizontal;
begin
  FEstado.AlternarHorizontal;
  Assert.IsTrue(FEstado.Horizontal);
  Assert.IsTrue(FEstado.Ativo);

  FEstado.AlternarHorizontal;
  Assert.IsFalse(FEstado.Horizontal);
  Assert.IsFalse(FEstado.Ativo);
end;

procedure TTestesEstadoEspelhamento.AlternaEspelhamentoVertical;
begin
  FEstado.AlternarVertical;
  Assert.IsTrue(FEstado.Vertical);
  Assert.IsTrue(FEstado.Ativo);

  FEstado.AlternarVertical;
  Assert.IsFalse(FEstado.Vertical);
  Assert.IsFalse(FEstado.Ativo);
end;

procedure TTestesEstadoEspelhamento.CombinaEspelhamentosHorizontalEVertical;
begin
  FEstado.AlternarHorizontal;
  FEstado.AlternarVertical;

  Assert.IsTrue(FEstado.Horizontal);
  Assert.IsTrue(FEstado.Vertical);
  Assert.IsTrue(FEstado.Ativo);

  FEstado.AlternarHorizontal;
  Assert.IsFalse(FEstado.Horizontal);
  Assert.IsTrue(FEstado.Vertical);
  Assert.IsTrue(FEstado.Ativo);
end;

procedure TTestesEstadoEspelhamento.Finalizar;
begin
  FEstado.Free;
end;

procedure TTestesEstadoEspelhamento.IniciaSemEspelhamento;
begin
  Assert.IsFalse(FEstado.Horizontal);
  Assert.IsFalse(FEstado.Vertical);
  Assert.IsFalse(FEstado.Ativo);
end;

procedure TTestesEstadoEspelhamento.Preparar;
begin
  FEstado := TEstadoEspelhamento.Create;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesEstadoEspelhamento);

end.
