unit Deskprompter.VCL.ControladorAparencia;

interface

uses
  System.Types,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Graphics,
  Deskprompter.Aplicacao.Aparencia.EstadoEspelhamento;

type
  TControladorAparencia = class
  private
    FBotaoEspelhoHorizontal: TSpeedButton;
    FBotaoEspelhoVertical: TSpeedButton;
    FEditorTexto: TRichEdit;
    FEstadoEspelhamento: TEstadoEspelhamento;
    FMargem: Integer;
    FPainelEspelho: TPanel;
    FPainelTextos: TPanel;
    FTextoAtivo: Boolean;
    procedure AplicarMargemNoEditor;
    procedure AtualizarBotoesEspelho;
    procedure AtualizarVisibilidadeEspelho;
    procedure RedesenharEditor;
  public
    constructor Create(
      const AEditorTexto: TRichEdit;
      const APainelTextos, APainelEspelho: TPanel;
      const ABotaoEspelhoHorizontal,
      ABotaoEspelhoVertical: TSpeedButton);
    destructor Destroy; override;

    procedure AlternarEspelhoHorizontal;
    procedure AlternarEspelhoVertical;
    procedure DefinirCorFundo(const ACor: TColor);
    procedure DefinirCorFonte(const ACor: TColor);
    procedure DefinirEspelhoHorizontal(const AAtivo: Boolean);
    procedure DefinirEspelhoVertical(const AAtivo: Boolean);
    procedure DefinirFonte(const ANome: string);
    procedure DefinirMargem(const AMargem: Integer);
    procedure DefinirTamanhoFonte(const ATamanho: Integer);
    procedure DefinirTextoAtivo(const AAtivo: Boolean);
    procedure InvalidarEspelho;
    function EspelhoHorizontal: Boolean;
    function EspelhoVertical: Boolean;
    procedure PintarEspelho(
      const ACanvas: TCanvas;
      const AArea: TRect;
      const APosicaoRolagem: Double);

  end;

implementation

uses
  System.Math,
  System.SysUtils,
  Winapi.Messages,
  Winapi.RichEdit,
  Winapi.Windows,
  Deskprompter.VCL.Icones;

constructor TControladorAparencia.Create(
  const AEditorTexto: TRichEdit;
  const APainelTextos, APainelEspelho: TPanel;
  const ABotaoEspelhoHorizontal,
  ABotaoEspelhoVertical: TSpeedButton);
begin
  inherited Create;
  FEditorTexto := AEditorTexto;
  FPainelTextos := APainelTextos;
  FPainelEspelho := APainelEspelho;
  FBotaoEspelhoHorizontal := ABotaoEspelhoHorizontal;
  FBotaoEspelhoVertical := ABotaoEspelhoVertical;
  FEstadoEspelhamento := TEstadoEspelhamento.Create;
  FMargem := 48;
  AtualizarBotoesEspelho;
  AtualizarVisibilidadeEspelho;
end;

destructor TControladorAparencia.Destroy;
begin
  FEstadoEspelhamento.Free;
  inherited;
end;

procedure TControladorAparencia.AlternarEspelhoHorizontal;
begin
  FEstadoEspelhamento.AlternarHorizontal;
  AtualizarBotoesEspelho;
  AtualizarVisibilidadeEspelho;
end;

procedure TControladorAparencia.AlternarEspelhoVertical;
begin
  FEstadoEspelhamento.AlternarVertical;
  AtualizarBotoesEspelho;
  AtualizarVisibilidadeEspelho;
end;

procedure TControladorAparencia.AplicarMargemNoEditor;
begin
  if not FEditorTexto.HandleAllocated then
    Exit;

  FEditorTexto.Perform(
    EM_SETMARGINS,
    EC_LEFTMARGIN or EC_RIGHTMARGIN,
    MakeLParam(FMargem, FMargem));
end;

procedure TControladorAparencia.AtualizarBotoesEspelho;
begin
  if FEstadoEspelhamento.Horizontal then
  begin
    FBotaoEspelhoHorizontal.Hint := 'Desativar espelhamento horizontal';
    FBotaoEspelhoHorizontal.ImageIndex :=
      Ord(iiaEspelhoHorizontalAtivo);
  end
  else
  begin
    FBotaoEspelhoHorizontal.Hint := 'Ativar espelhamento horizontal';
    FBotaoEspelhoHorizontal.ImageIndex := Ord(iiaEspelhoHorizontal);
  end;

  if FEstadoEspelhamento.Vertical then
  begin
    FBotaoEspelhoVertical.Hint := 'Desativar espelhamento vertical';
    FBotaoEspelhoVertical.ImageIndex := Ord(iiaEspelhoVerticalAtivo);
  end
  else
  begin
    FBotaoEspelhoVertical.Hint := 'Ativar espelhamento vertical';
    FBotaoEspelhoVertical.ImageIndex := Ord(iiaEspelhoVertical);
  end;
end;

procedure TControladorAparencia.AtualizarVisibilidadeEspelho;
begin
  FPainelEspelho.Visible := FTextoAtivo and
    FEstadoEspelhamento.Ativo;
  if FPainelEspelho.Visible then
  begin
    FPainelEspelho.BringToFront;
    FPainelEspelho.Invalidate;
  end;
end;

procedure TControladorAparencia.DefinirCorFundo(const ACor: TColor);
begin
  FEditorTexto.Color := ACor;
  FPainelTextos.Color := ACor;
  FPainelEspelho.Color := ACor;
  InvalidarEspelho;
end;

procedure TControladorAparencia.DefinirCorFonte(const ACor: TColor);
begin
  FEditorTexto.Font.Color := ACor;
  InvalidarEspelho;
end;

procedure TControladorAparencia.DefinirEspelhoHorizontal(
  const AAtivo: Boolean);
begin
  FEstadoEspelhamento.DefinirHorizontal(AAtivo);
  AtualizarBotoesEspelho;
  AtualizarVisibilidadeEspelho;
end;

procedure TControladorAparencia.DefinirEspelhoVertical(
  const AAtivo: Boolean);
begin
  FEstadoEspelhamento.DefinirVertical(AAtivo);
  AtualizarBotoesEspelho;
  AtualizarVisibilidadeEspelho;
end;

procedure TControladorAparencia.DefinirFonte(const ANome: string);
begin
  if ANome.IsEmpty then
    Exit;
  FEditorTexto.Font.Name := ANome;
  RedesenharEditor;
  InvalidarEspelho;
end;

procedure TControladorAparencia.DefinirMargem(const AMargem: Integer);
begin
  FMargem := Max(0, AMargem);
  AplicarMargemNoEditor;
  RedesenharEditor;
  InvalidarEspelho;
end;

procedure TControladorAparencia.DefinirTamanhoFonte(const ATamanho: Integer);
begin
  FEditorTexto.Font.Size := EnsureRange(ATamanho, 8, 120);
  RedesenharEditor;
  InvalidarEspelho;
end;

procedure TControladorAparencia.DefinirTextoAtivo(const AAtivo: Boolean);
begin
  FTextoAtivo := AAtivo;
  if FTextoAtivo then
    AplicarMargemNoEditor;
  AtualizarVisibilidadeEspelho;
end;

procedure TControladorAparencia.InvalidarEspelho;
begin
  if FPainelEspelho.Visible then
    FPainelEspelho.Invalidate;
end;

function TControladorAparencia.EspelhoHorizontal: Boolean;
begin
  Result := FEstadoEspelhamento.Horizontal;
end;

function TControladorAparencia.EspelhoVertical: Boolean;
begin
  Result := FEstadoEspelhamento.Vertical;
end;

procedure TControladorAparencia.PintarEspelho(
  const ACanvas: TCanvas;
  const AArea: TRect;
  const APosicaoRolagem: Double);
var
  AreaTexto: TRect;
  AlturaDestino: Integer;
  DestinoX: Integer;
  DestinoY: Integer;
  EstadoDC: Integer;
  ImagemTexto: Vcl.Graphics.TBitmap;
  LarguraDestino: Integer;
  TopoTexto: Integer;
begin
  if (AArea.Width <= 0) or (AArea.Height <= 0) then
    Exit;

  ImagemTexto := Vcl.Graphics.TBitmap.Create;
  try
    ImagemTexto.PixelFormat := pf32bit;
    ImagemTexto.SetSize(AArea.Width, AArea.Height);
    ImagemTexto.Canvas.Brush.Color := FEditorTexto.Color;
    ImagemTexto.Canvas.FillRect(Rect(0, 0, AArea.Width, AArea.Height));
    ImagemTexto.Canvas.Font.Assign(FEditorTexto.Font);
    ImagemTexto.Canvas.Brush.Style := bsClear;

    TopoTexto := -Round(APosicaoRolagem);
    AreaTexto := Rect(
      FMargem,
      TopoTexto,
      Max(FMargem + 1, AArea.Width - FMargem),
      TopoTexto + 100000);
    DrawText(
      ImagemTexto.Canvas.Handle,
      PChar(FEditorTexto.Text),
      Length(FEditorTexto.Text),
      AreaTexto,
      DT_LEFT or DT_TOP or DT_WORDBREAK or DT_NOPREFIX);

    DestinoX := AArea.Left;
    DestinoY := AArea.Top;
    LarguraDestino := AArea.Width;
    AlturaDestino := AArea.Height;
    if FEstadoEspelhamento.Horizontal then
    begin
      DestinoX := AArea.Right - 1;
      LarguraDestino := -AArea.Width;
    end;
    if FEstadoEspelhamento.Vertical then
    begin
      DestinoY := AArea.Bottom - 1;
      AlturaDestino := -AArea.Height;
    end;

    EstadoDC := SaveDC(ACanvas.Handle);
    try
      SetStretchBltMode(ACanvas.Handle, COLORONCOLOR);
      StretchBlt(
        ACanvas.Handle,
        DestinoX,
        DestinoY,
        LarguraDestino,
        AlturaDestino,
        ImagemTexto.Canvas.Handle,
        0,
        0,
        ImagemTexto.Width,
        ImagemTexto.Height,
        SRCCOPY);
    finally
      RestoreDC(ACanvas.Handle, EstadoDC);
    end;
  finally
    ImagemTexto.Free;
  end;
end;

procedure TControladorAparencia.RedesenharEditor;
begin
  if not FEditorTexto.HandleAllocated then
    Exit;

  RedrawWindow(
    FEditorTexto.Handle,
    nil,
    0,
    RDW_INVALIDATE or RDW_ERASE or RDW_FRAME or RDW_UPDATENOW);
end;

end.
