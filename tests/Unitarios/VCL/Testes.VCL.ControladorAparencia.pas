unit Testes.VCL.ControladorAparencia;

interface

uses
  DUnitX.TestFramework,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Deskprompter.VCL.ControladorAparencia;

type
  [TestFixture]
  TTestesControladorAparencia = class
  private
    FBotaoHorizontal: TSpeedButton;
    FBotaoVertical: TSpeedButton;
    FControlador: TControladorAparencia;
    FEditor: TRichEdit;
    FFormulario: TForm;
    FPainelEspelho: TPanel;
    FPainelTextos: TPanel;
  public
    [Setup]
    procedure Preparar;
    [TearDown]
    procedure Finalizar;

    [Test]
    procedure ReaplicaMargemAoAtivarTexto;
  end;

implementation

uses
  Winapi.Messages,
  Winapi.RichEdit,
  Winapi.Windows;

procedure TTestesControladorAparencia.Finalizar;
begin
  FControlador.Free;
  FFormulario.Free;
end;

procedure TTestesControladorAparencia.Preparar;
begin
  FFormulario := TForm.CreateNew(nil);
  FEditor := TRichEdit.Create(FFormulario);
  FEditor.Parent := FFormulario;
  FPainelTextos := TPanel.Create(FFormulario);
  FPainelTextos.Parent := FFormulario;
  FPainelEspelho := TPanel.Create(FFormulario);
  FPainelEspelho.Parent := FFormulario;
  FBotaoHorizontal := TSpeedButton.Create(FFormulario);
  FBotaoVertical := TSpeedButton.Create(FFormulario);
  FControlador := TControladorAparencia.Create(
    FEditor,
    FPainelTextos,
    FPainelEspelho,
    FBotaoHorizontal,
    FBotaoVertical);
end;

procedure TTestesControladorAparencia.ReaplicaMargemAoAtivarTexto;
const
  MARGEM_ESPERADA = 40;
var
  Margens: LRESULT;
begin
  Assert.AreNotEqual(NativeUInt(0), NativeUInt(FEditor.Handle));
  FControlador.DefinirMargem(MARGEM_ESPERADA);

  FEditor.Perform(
    EM_SETMARGINS,
    EC_LEFTMARGIN or EC_RIGHTMARGIN,
    MakeLParam(0, 0));
  FEditor.Text := 'Texto apresentado';

  FControlador.DefinirTextoAtivo(True);

  Margens := FEditor.Perform(EM_GETMARGINS, 0, 0);
  Assert.AreEqual(MARGEM_ESPERADA, Integer(LoWord(LongWord(Margens))));
  Assert.AreEqual(MARGEM_ESPERADA, Integer(HiWord(LongWord(Margens))));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesControladorAparencia);

end.
