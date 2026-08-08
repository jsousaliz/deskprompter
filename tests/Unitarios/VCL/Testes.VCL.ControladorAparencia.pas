unit Testes.VCL.ControladorAparencia;

interface

uses
  DUnitX.TestFramework,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
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
    procedure EspelhamentosRespeitamMargensLaterais;
    [Test]
    procedure ReaplicaMargemAoAtivarTexto;
  end;

implementation

uses
  System.SysUtils,
  System.Types,
  Winapi.Messages,
  Winapi.RichEdit,
  Winapi.Windows;

procedure ObterLimitesHorizontaisDoTexto(
  const AImagem: Vcl.Graphics.TBitmap;
  out AEsquerda, ADireita: Integer;
  out AEncontrouTexto: Boolean);
var
  X: Integer;
  Y: Integer;
begin
  AEsquerda := AImagem.Width;
  ADireita := -1;
  AEncontrouTexto := False;
  for Y := 0 to AImagem.Height - 1 do
    for X := 0 to AImagem.Width - 1 do
      if ColorToRGB(AImagem.Canvas.Pixels[X, Y]) <> ColorToRGB(clBlack) then
      begin
        AEncontrouTexto := True;
        if X < AEsquerda then
          AEsquerda := X;
        if X > ADireita then
          ADireita := X;
      end;
end;

procedure TTestesControladorAparencia.EspelhamentosRespeitamMargensLaterais;
const
  ALTURA_IMAGEM = 160;
  LARGURA_IMAGEM = 360;
  MARGEM_ESPERADA = 40;
var
  Direita: Integer;
  EncontrouTexto: Boolean;
  Esquerda: Integer;
  Imagem: Vcl.Graphics.TBitmap;
  ImagemOriginal: Vcl.Graphics.TBitmap;
  IndiceEspelhamento: Integer;
  X: Integer;
  XOriginal: Integer;
  Y: Integer;
  YOriginal: Integer;
begin
  FEditor.Color := clBlack;
  FEditor.Font.Color := clWhite;
  FEditor.Font.Name := 'Segoe UI';
  FEditor.Font.Size := 24;
  FEditor.Text := 'Texto espelhado';
  FControlador.DefinirMargem(MARGEM_ESPERADA);

  Imagem := Vcl.Graphics.TBitmap.Create;
  ImagemOriginal := Vcl.Graphics.TBitmap.Create;
  try
    Imagem.PixelFormat := pf32bit;
    Imagem.SetSize(LARGURA_IMAGEM, ALTURA_IMAGEM);
    ImagemOriginal.PixelFormat := pf32bit;
    ImagemOriginal.SetSize(LARGURA_IMAGEM, ALTURA_IMAGEM);
    FControlador.DefinirEspelhoHorizontal(False);
    FControlador.DefinirEspelhoVertical(False);
    FControlador.PintarEspelho(
      ImagemOriginal.Canvas,
      Rect(0, 0, LARGURA_IMAGEM, ALTURA_IMAGEM),
      0);

    for IndiceEspelhamento := 0 to 2 do
    begin
      FControlador.DefinirEspelhoHorizontal(
        IndiceEspelhamento in [0, 2]);
      FControlador.DefinirEspelhoVertical(
        IndiceEspelhamento in [1, 2]);
      FControlador.PintarEspelho(
        Imagem.Canvas,
        Rect(0, 0, LARGURA_IMAGEM, ALTURA_IMAGEM),
        0);

      ObterLimitesHorizontaisDoTexto(
        Imagem,
        Esquerda,
        Direita,
        EncontrouTexto);
      Assert.IsTrue(
        EncontrouTexto,
        Format('Texto nao encontrado no espelhamento %d',
          [IndiceEspelhamento]));
      Assert.IsTrue(
        Esquerda >= MARGEM_ESPERADA - 1,
        Format('Margem esquerda %d no espelhamento %d',
          [Esquerda, IndiceEspelhamento]));
      Assert.IsTrue(
        Direita <= LARGURA_IMAGEM - MARGEM_ESPERADA,
        Format('Margem direita %d no espelhamento %d',
          [Direita, IndiceEspelhamento]));

      for Y := 0 to ALTURA_IMAGEM - 1 do
        for X := 0 to LARGURA_IMAGEM - 1 do
        begin
          if IndiceEspelhamento in [0, 2] then
            XOriginal := LARGURA_IMAGEM - 1 - X
          else
            XOriginal := X;
          if IndiceEspelhamento in [1, 2] then
            YOriginal := ALTURA_IMAGEM - 1 - Y
          else
            YOriginal := Y;

          if ColorToRGB(Imagem.Canvas.Pixels[X, Y]) <>
             ColorToRGB(ImagemOriginal.Canvas.Pixels[XOriginal, YOriginal]) then
            Assert.Fail(Format(
              'Pixel divergente em (%d, %d) no espelhamento %d',
              [X, Y, IndiceEspelhamento]));
        end;
    end;
  finally
    ImagemOriginal.Free;
    Imagem.Free;
  end;
end;

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
