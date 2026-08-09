unit Deskprompter.VCL.ControladorSempreNoTopo;

interface

uses
  Vcl.StdCtrls,
  Deskprompter.Aplicacao.Contratos.Diagnostico,
  Deskprompter.Aplicacao.Contratos.PosicionamentoJanela;

type
  TControladorSempreNoTopo = class
  private
    FAtivacaoDesejada: Boolean;
    FPosicionamentoJanela: IPosicionamentoJanela;
    FRegistroDiagnostico: IRegistroDiagnostico;
    FResultado: TResultadoPosicionamentoJanela;
    FRotuloEstado: TLabel;
    procedure AtualizarRotuloEstado;
    procedure RegistrarResultado;
  public
    constructor Create(const ARotuloEstado: TLabel);
    procedure Aplicar(const AIdentificadorJanela: NativeUInt);
    procedure Configurar(
      const ARegistroDiagnostico: IRegistroDiagnostico;
      const APosicionamentoJanela: IPosicionamentoJanela);
    procedure DefinirAtivo(
      const AAtivo: Boolean;
      const AIdentificadorJanela: NativeUInt);
    property Ativo: Boolean read FAtivacaoDesejada;
  end;

implementation

uses
  Vcl.Graphics;

constructor TControladorSempreNoTopo.Create(const ARotuloEstado: TLabel);
begin
  inherited Create;
  FRotuloEstado := ARotuloEstado;
  FAtivacaoDesejada := True;
  FResultado := TResultadoPosicionamentoJanela.Criar(
    True,
    'Modo sempre no topo ativo');
  AtualizarRotuloEstado;
end;

procedure TControladorSempreNoTopo.Aplicar(
  const AIdentificadorJanela: NativeUInt);
begin
  if not Assigned(FPosicionamentoJanela) or
     (AIdentificadorJanela = 0) then
    Exit;

  FResultado := FPosicionamentoJanela.DefinirSempreNoTopo(
    AIdentificadorJanela,
    FAtivacaoDesejada);
  AtualizarRotuloEstado;
  RegistrarResultado;
end;

procedure TControladorSempreNoTopo.AtualizarRotuloEstado;
begin
  if not FResultado.Sucesso then
  begin
    FRotuloEstado.Caption := 'Falha ao alterar sempre no topo';
    FRotuloEstado.Font.Color := $006B6BFF;
    Exit;
  end;

  if FAtivacaoDesejada then
  begin
    FRotuloEstado.Caption := 'Sempre no topo ativo';
    FRotuloEstado.Font.Color := $0068D391;
  end
  else
  begin
    FRotuloEstado.Caption := 'Sempre no topo inativo';
    FRotuloEstado.Font.Color := clSilver;
  end;
end;

procedure TControladorSempreNoTopo.Configurar(
  const ARegistroDiagnostico: IRegistroDiagnostico;
  const APosicionamentoJanela: IPosicionamentoJanela);
begin
  FRegistroDiagnostico := ARegistroDiagnostico;
  FPosicionamentoJanela := APosicionamentoJanela;
end;

procedure TControladorSempreNoTopo.DefinirAtivo(
  const AAtivo: Boolean;
  const AIdentificadorJanela: NativeUInt);
begin
  FAtivacaoDesejada := AAtivo;
  FResultado := TResultadoPosicionamentoJanela.Criar(
    True,
    'Estado do modo sempre no topo alterado');
  AtualizarRotuloEstado;
  Aplicar(AIdentificadorJanela);
end;

procedure TControladorSempreNoTopo.RegistrarResultado;
begin
  if not Assigned(FRegistroDiagnostico) then
    Exit;

  if FResultado.Sucesso then
    FRegistroDiagnostico.Registrar(nrInformacao, FResultado.Mensagem)
  else
    FRegistroDiagnostico.Registrar(nrAviso, FResultado.Mensagem);
end;

end.
