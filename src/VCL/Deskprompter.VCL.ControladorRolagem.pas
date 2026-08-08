unit Deskprompter.VCL.ControladorRolagem;

interface

uses
  System.Classes,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Deskprompter.Aplicacao.Contratos.Tempo,
  Deskprompter.Aplicacao.Rolagem.Motor;

type
  TControladorRolagem = class
  private
    FBotaoReproduzir: TSpeedButton;
    FEditorTexto: TRichEdit;
    FMotor: TMotorRolagem;
    FPosicaoAlterada: TNotifyEvent;
    FRelogio: IRelogio;
    FTextoAtivo: Boolean;
    procedure AplicarPosicao;
    procedure AtualizarBotaoReproduzir;
  public
    constructor Create(
      const AEditorTexto: TRichEdit;
      const ABotaoReproduzir: TSpeedButton;
      const APosicaoAlterada: TNotifyEvent);
    destructor Destroy; override;

    procedure AlternarReproducao;
    procedure Avancar;
    procedure ConfigurarRelogio(const ARelogio: IRelogio);
    procedure DefinirTextoAtivo(const AAtivo: Boolean);
    procedure DefinirVelocidade(const AVelocidade: Integer);
    procedure Inicio;
    function Posicao: Double;
    procedure RecalcularLimite;
    procedure Recuar;
    procedure Atualizar;
  end;

implementation

uses
  System.Math,
  System.Types,
  Winapi.Messages,
  Winapi.RichEdit,
  Winapi.Windows,
  Deskprompter.VCL.Icones;

const
  PASSO_MANUAL = 120;

procedure TControladorRolagem.AplicarPosicao;
var
  Posicao: TPoint;
begin
  if not FEditorTexto.HandleAllocated then
    Exit;

  Posicao.X := 0;
  Posicao.Y := Round(FMotor.Posicao);
  SendMessage(
    FEditorTexto.Handle,
    EM_SETSCROLLPOS,
    0,
    LPARAM(@Posicao));
  if Assigned(FPosicaoAlterada) then
    FPosicaoAlterada(Self);
end;

procedure TControladorRolagem.AlternarReproducao;
begin
  if not FTextoAtivo or not Assigned(FRelogio) then
    Exit;

  if FMotor.Estado = erReproduzindo then
    FMotor.Pausar
  else
    FMotor.Reproduzir(FRelogio.MilissegundosMonotonicos);
  AtualizarBotaoReproduzir;
end;

procedure TControladorRolagem.Atualizar;
begin
  if not FTextoAtivo or not Assigned(FRelogio) or
     (FMotor.Estado <> erReproduzindo) then
    Exit;

  RecalcularLimite;
  FMotor.Atualizar(FRelogio.MilissegundosMonotonicos);
  AplicarPosicao;
  AtualizarBotaoReproduzir;
end;

procedure TControladorRolagem.AtualizarBotaoReproduzir;
begin
  if FMotor.Estado = erReproduzindo then
  begin
    FBotaoReproduzir.Hint := 'Pausar rolagem';
    FBotaoReproduzir.ImageIndex := Ord(iiaPausar);
  end
  else
  begin
    FBotaoReproduzir.Hint := 'Reproduzir rolagem';
    FBotaoReproduzir.ImageIndex := Ord(iiaReproduzir);
  end;
end;

procedure TControladorRolagem.Avancar;
begin
  if not FTextoAtivo then
    Exit;

  FMotor.Avancar(PASSO_MANUAL);
  AplicarPosicao;
end;

procedure TControladorRolagem.ConfigurarRelogio(const ARelogio: IRelogio);
begin
  FRelogio := ARelogio;
end;

constructor TControladorRolagem.Create(
  const AEditorTexto: TRichEdit;
  const ABotaoReproduzir: TSpeedButton;
  const APosicaoAlterada: TNotifyEvent);
begin
  inherited Create;
  FEditorTexto := AEditorTexto;
  FBotaoReproduzir := ABotaoReproduzir;
  FPosicaoAlterada := APosicaoAlterada;
  FMotor := TMotorRolagem.Create;
  AtualizarBotaoReproduzir;
end;

procedure TControladorRolagem.DefinirTextoAtivo(const AAtivo: Boolean);
begin
  FTextoAtivo := AAtivo;
  FMotor.Parar;
  AplicarPosicao;
  AtualizarBotaoReproduzir;
  if FTextoAtivo then
    RecalcularLimite;
end;

procedure TControladorRolagem.DefinirVelocidade(const AVelocidade: Integer);
begin
  FMotor.DefinirVelocidade(AVelocidade);
end;

destructor TControladorRolagem.Destroy;
begin
  FMotor.Free;
  inherited;
end;

procedure TControladorRolagem.Inicio;
begin
  if not FTextoAtivo then
    Exit;

  FMotor.Parar;
  AplicarPosicao;
  AtualizarBotaoReproduzir;
end;

function TControladorRolagem.Posicao: Double;
begin
  Result := FMotor.Posicao;
end;

procedure TControladorRolagem.RecalcularLimite;
var
  InformacaoRolagem: TScrollInfo;
  Limite: Double;
begin
  if not FEditorTexto.HandleAllocated then
    Exit;

  InformacaoRolagem.cbSize := SizeOf(InformacaoRolagem);
  InformacaoRolagem.fMask := SIF_RANGE or SIF_PAGE;
  if GetScrollInfo(FEditorTexto.Handle, SB_VERT, InformacaoRolagem) then
    Limite := Max(
      0.0,
      InformacaoRolagem.nMax - Integer(InformacaoRolagem.nPage) + 1)
  else
    Limite := 0;
  FMotor.DefinirLimite(Limite);
end;

procedure TControladorRolagem.Recuar;
begin
  if not FTextoAtivo then
    Exit;

  FMotor.Recuar(PASSO_MANUAL);
  AplicarPosicao;
end;

end.
