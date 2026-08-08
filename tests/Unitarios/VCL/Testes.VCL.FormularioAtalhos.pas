unit Testes.VCL.FormularioAtalhos;

interface

uses
  System.Classes,
  DUnitX.TestFramework,
  Deskprompter.Aplicacao.Comandos,
  Deskprompter.VCL.FormularioAtalhos;

type
  [TestFixture]
  TTestesFormularioAtalhos = class
  private
    FCatalogo: TCatalogoAtalhos;
    FFormulario: TFormularioAtalhos;
  public
    [Setup]
    procedure Preparar;
    [TearDown]
    procedure Finalizar;

    [Test]
    procedure EditaAtalhoDiretamenteNaGrade;
    [Test]
    procedure LimpaAtalhoDiretamenteNaGrade;
  end;

implementation

uses
  Winapi.Windows,
  Vcl.Controls;

procedure TTestesFormularioAtalhos.EditaAtalhoDiretamenteNaGrade;
var
  AtalhoEsperado: TAtalho;
  Key: Word;
begin
  Key := Ord('P');
  FFormulario.GradeAtalhos.Col := 1;
  FFormulario.GradeAtalhos.Row := 1;
  FFormulario.GradeAtalhosKeyDown(
    FFormulario.GradeAtalhos,
    Key,
    [ssCtrl, ssAlt]);

  AtalhoEsperado := TAtalho.Criar(Ord('P'), [maControle, maAlt]);
  Assert.IsTrue(FCatalogo.Atalho(
    cmdReproduzirPausar,
    0).Igual(AtalhoEsperado));
  Assert.IsTrue(FFormulario.Alterado);
  Assert.AreEqual('Ctrl+Alt+P', FFormulario.GradeAtalhos.Cells[1, 1]);
end;

procedure TTestesFormularioAtalhos.LimpaAtalhoDiretamenteNaGrade;
var
  Key: Word;
begin
  FFormulario.GradeAtalhos.Col := 1;
  FFormulario.GradeAtalhos.Row := 1;
  Key := VK_DELETE;
  FFormulario.GradeAtalhosKeyDown(
    FFormulario.GradeAtalhos,
    Key,
    []);

  Assert.IsTrue(FCatalogo.Atalho(cmdReproduzirPausar, 0).Vazio);
  Assert.AreEqual('Nao definido', FFormulario.GradeAtalhos.Cells[1, 1]);
  Assert.IsTrue(FFormulario.Alterado);
end;

procedure TTestesFormularioAtalhos.Finalizar;
begin
  FFormulario.Free;
  FCatalogo.Free;
end;

procedure TTestesFormularioAtalhos.Preparar;
begin
  FCatalogo := TCatalogoAtalhos.Create;
  FFormulario := TFormularioAtalhos.Create(nil);
  FFormulario.Configurar(FCatalogo);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesFormularioAtalhos);

end.
