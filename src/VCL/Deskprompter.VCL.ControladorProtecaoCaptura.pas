unit Deskprompter.VCL.ControladorProtecaoCaptura;

interface

uses
  Vcl.StdCtrls,
  Deskprompter.Aplicacao.Contratos.Diagnostico,
  Deskprompter.Aplicacao.Contratos.ProtecaoCaptura;

type
  TControladorProtecaoCaptura = class
  private
    FAtivacaoDesejada: Boolean;
    FProtecaoCaptura: IProtecaoCaptura;
    FRegistroDiagnostico: IRegistroDiagnostico;
    FResultado: TResultadoProtecaoCaptura;
    FRotuloEstado: TLabel;
    procedure AtualizarRotuloEstado;
    procedure RegistrarResultado;
  public
    constructor Create(const ARotuloEstado: TLabel);
    procedure Aplicar(const AIdentificadorJanela: NativeUInt);
    procedure Configurar(
      const ARegistroDiagnostico: IRegistroDiagnostico;
      const AProtecaoCaptura: IProtecaoCaptura);
    procedure DefinirAtiva(
      const AAtiva: Boolean;
      const AIdentificadorJanela: NativeUInt);
    property Ativa: Boolean read FAtivacaoDesejada;
  end;

implementation

uses
  Vcl.Graphics;

constructor TControladorProtecaoCaptura.Create(
  const ARotuloEstado: TLabel);
begin
  inherited Create;
  FRotuloEstado := ARotuloEstado;
  FAtivacaoDesejada := True;
  FResultado := TResultadoProtecaoCaptura.Criar(
    epcNaoVerificada,
    'Protecao de captura ainda nao verificada');
  AtualizarRotuloEstado;
end;

procedure TControladorProtecaoCaptura.Aplicar(
  const AIdentificadorJanela: NativeUInt);
begin
  if not Assigned(FProtecaoCaptura) or (AIdentificadorJanela = 0) then
    Exit;

  if FAtivacaoDesejada then
    FResultado := FProtecaoCaptura.Ativar(AIdentificadorJanela)
  else
    FResultado := FProtecaoCaptura.Desativar(AIdentificadorJanela);

  AtualizarRotuloEstado;
  RegistrarResultado;
end;

procedure TControladorProtecaoCaptura.AtualizarRotuloEstado;
begin
  if not FAtivacaoDesejada then
  begin
    FRotuloEstado.Caption := 'Prote' + #$00E7 +
      'ao de captura inativa';
    FRotuloEstado.Font.Color := $004040FF;
    Exit;
  end;

  case FResultado.Estado of
    epcAtiva:
      begin
        FRotuloEstado.Caption := 'Prote' + #$00E7 +
          'ao de captura ativa';
        FRotuloEstado.Font.Color := $0068D391;
      end;
    epcIndisponivel:
      begin
        FRotuloEstado.Caption := 'Protecao de captura indisponivel';
        FRotuloEstado.Font.Color := $0047A5FF;
      end;
    epcFalhou:
      begin
        FRotuloEstado.Caption := 'Falha ao ativar protecao de captura';
        FRotuloEstado.Font.Color := $006B6BFF;
      end;
  else
    FRotuloEstado.Caption := 'Prote' + #$00E7 +
      'ao de captura ainda nao verificada';
    FRotuloEstado.Font.Color := clSilver;
  end;
end;

procedure TControladorProtecaoCaptura.Configurar(
  const ARegistroDiagnostico: IRegistroDiagnostico;
  const AProtecaoCaptura: IProtecaoCaptura);
begin
  FRegistroDiagnostico := ARegistroDiagnostico;
  FProtecaoCaptura := AProtecaoCaptura;
end;

procedure TControladorProtecaoCaptura.DefinirAtiva(
  const AAtiva: Boolean;
  const AIdentificadorJanela: NativeUInt);
begin
  FAtivacaoDesejada := AAtiva;
  AtualizarRotuloEstado;
  Aplicar(AIdentificadorJanela);
end;

procedure TControladorProtecaoCaptura.RegistrarResultado;
begin
  if not Assigned(FRegistroDiagnostico) then
    Exit;

  if (FResultado.Estado = epcAtiva) or not FAtivacaoDesejada then
    FRegistroDiagnostico.Registrar(nrInformacao, FResultado.Mensagem)
  else
    FRegistroDiagnostico.Registrar(nrAviso, FResultado.Mensagem);
end;

end.
