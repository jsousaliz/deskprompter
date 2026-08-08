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
  EstadoDC: Integer;
  Transformacao: TXForm;
begin
  ACanvas.Brush.Color := FEditorTexto.Color;
  ACanvas.FillRect(AArea);
  ACanvas.Font.Assign(FEditorTexto.Font);
  ACanvas.Brush.Style := bsClear;

  EstadoDC := SaveDC(ACanvas.Handle);
  try
    SetGraphicsMode(ACanvas.Handle, GM_ADVANCED);
    Transformacao.eM11 := 1;
    Transformacao.eM12 := 0;
    Transformacao.eM21 := 0;
    Transformacao.eM22 := 1;
    Transformacao.eDx := 0;
    Transformacao.eDy := 0;
    if FEstadoEspelhamento.Horizontal then
    begin
      Transformacao.eM11 := -1;
      Transformacao.eDx := AArea.Width;
    end;
    if FEstadoEspelhamento.Vertical then
    begin
      Transformacao.eM22 := -1;
      Transformacao.eDy := AArea.Height;
    end;
    SetWorldTransform(ACanvas.Handle, Transformacao);

    AreaTexto := Rect(
      FMargem,
      FMargem - Round(APosicaoRolagem),
      Max(FMargem, AArea.Width - FMargem),
      FMargem - Round(APosicaoRolagem) + 100000);
    DrawText(
      ACanvas.Handle,
      PChar(FEditorTexto.Text),
      Length(FEditorTexto.Text),
      AreaTexto,
      DT_LEFT or DT_TOP or DT_WORDBREAK or DT_NOPREFIX);
  finally
    RestoreDC(ACanvas.Handle, EstadoDC);
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
