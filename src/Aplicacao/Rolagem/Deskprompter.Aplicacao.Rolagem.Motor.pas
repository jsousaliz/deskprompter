unit Deskprompter.Aplicacao.Rolagem.Motor;

interface

uses
  System.SysUtils;

type
  EVelocidadeRolagemInvalida = class(Exception);
  ELimiteRolagemInvalido = class(Exception);

  TEstadoRolagem = (
    erParada,
    erReproduzindo,
    erPausada
  );

  TMotorRolagem = class
  private
    FEstado: TEstadoRolagem;
    FLimite: Double;
    FPosicao: Double;
    FUltimaMedicao: UInt64;
    FVelocidade: Double;
    procedure AjustarPosicaoAosLimites;
  public
    constructor Create;

    procedure Atualizar(const AAgora: UInt64);
    procedure Avancar(const AQuantidade: Double);
    procedure DefinirLimite(const ALimite: Double);
    procedure DefinirPosicao(const APosicao: Double);
    procedure DefinirVelocidade(const AVelocidade: Double);
    procedure Parar;
    procedure Pausar;
    procedure Recuar(const AQuantidade: Double);
    procedure Reproduzir(const AAgora: UInt64);

    property Estado: TEstadoRolagem read FEstado;
    property Limite: Double read FLimite;
    property Posicao: Double read FPosicao;
    property Velocidade: Double read FVelocidade;
  end;

implementation

resourcestring
  SVelocidadeInvalida = 'A velocidade da rolagem nao pode ser negativa';
  SLimiteInvalido = 'O limite da rolagem nao pode ser negativo';

procedure TMotorRolagem.AjustarPosicaoAosLimites;
begin
  if FPosicao < 0 then
    FPosicao := 0
  else if FPosicao > FLimite then
    FPosicao := FLimite;
end;

procedure TMotorRolagem.Atualizar(const AAgora: UInt64);
var
  TempoDecorrido: UInt64;
begin
  if FEstado <> erReproduzindo then
    Exit;

  if AAgora < FUltimaMedicao then
  begin
    FUltimaMedicao := AAgora;
    Exit;
  end;

  TempoDecorrido := AAgora - FUltimaMedicao;
  FUltimaMedicao := AAgora;
  FPosicao := FPosicao + (TempoDecorrido / 1000) * FVelocidade;
  AjustarPosicaoAosLimites;

  if FPosicao >= FLimite then
    FEstado := erPausada;
end;

procedure TMotorRolagem.Avancar(const AQuantidade: Double);
begin
  FPosicao := FPosicao + AQuantidade;
  AjustarPosicaoAosLimites;
end;

constructor TMotorRolagem.Create;
begin
  inherited Create;
  FEstado := erParada;
  FLimite := 0;
  FPosicao := 0;
  FVelocidade := 60;
end;

procedure TMotorRolagem.DefinirLimite(const ALimite: Double);
begin
  if ALimite < 0 then
    raise ELimiteRolagemInvalido.Create(SLimiteInvalido);

  FLimite := ALimite;
  AjustarPosicaoAosLimites;
end;

procedure TMotorRolagem.DefinirPosicao(const APosicao: Double);
begin
  FPosicao := APosicao;
  AjustarPosicaoAosLimites;
end;

procedure TMotorRolagem.DefinirVelocidade(const AVelocidade: Double);
begin
  if AVelocidade < 0 then
    raise EVelocidadeRolagemInvalida.Create(SVelocidadeInvalida);

  FVelocidade := AVelocidade;
end;

procedure TMotorRolagem.Parar;
begin
  FEstado := erParada;
  FPosicao := 0;
  FUltimaMedicao := 0;
end;

procedure TMotorRolagem.Pausar;
begin
  if FEstado = erReproduzindo then
    FEstado := erPausada;
end;

procedure TMotorRolagem.Recuar(const AQuantidade: Double);
begin
  FPosicao := FPosicao - AQuantidade;
  AjustarPosicaoAosLimites;
end;

procedure TMotorRolagem.Reproduzir(const AAgora: UInt64);
begin
  if FPosicao >= FLimite then
    FPosicao := 0;

  FUltimaMedicao := AAgora;
  FEstado := erReproduzindo;
end;

end.

