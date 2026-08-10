unit Deskprompter.VCL.ControladorEstadoJanela;

interface

uses
  System.Types,
  Vcl.Forms,
  Deskprompter.Aplicacao.Preferencias;

type
  TControladorEstadoJanela = class
  private const
    ALTURA_MINIMA_JANELA = 480;
    ALTURA_MINIMA_VISIVEL = 50;
    LARGURA_MINIMA_JANELA = 640;
    LARGURA_MINIMA_VISIVEL = 100;
  private
    FFormulario: TForm;
    FUltimoEstadoNaoMinimizado: TWindowState;
    FUltimosLimitesNormais: TRect;
    function CentralizarNoMonitorPrincipal(const ALimites: TRect): TRect;
    function VisivelEmAlgumMonitor(const ALimites: TRect): Boolean;
  public
    constructor Create(const AFormulario: TForm);
    procedure Aplicar(const APreferencias: TPreferencias);
    procedure Atualizar(const ATelaCheia: Boolean);
    function Registrar(
      const APreferencias: TPreferencias;
      const ATelaCheia: Boolean;
      const ALimitesAnteriores: TRect;
      const AEstadoJanelaAnterior: TWindowState): Boolean;
  end;

implementation

uses
  System.Math,
  Winapi.Windows;

procedure TControladorEstadoJanela.Aplicar(
  const APreferencias: TPreferencias);
var
  Limites: TRect;
begin
  FUltimoEstadoNaoMinimizado := wsNormal;
  FUltimosLimitesNormais := FFormulario.BoundsRect;
  if not Assigned(APreferencias) or
     not APreferencias.PosicaoJanelaSalva then
    Exit;

  Limites := Rect(
    APreferencias.JanelaEsquerda,
    APreferencias.JanelaTopo,
    APreferencias.JanelaEsquerda + APreferencias.JanelaLargura,
    APreferencias.JanelaTopo + APreferencias.JanelaAltura);
  if (Limites.Width <= 0) or (Limites.Height <= 0) or
     not VisivelEmAlgumMonitor(Limites) then
    Limites := CentralizarNoMonitorPrincipal(Limites);

  FFormulario.Position := poDesigned;
  FFormulario.WindowState := wsNormal;
  FFormulario.SetBounds(
    Limites.Left,
    Limites.Top,
    Limites.Width,
    Limites.Height);
  FUltimosLimitesNormais := Limites;
  if APreferencias.JanelaMaximizada then
  begin
    FUltimoEstadoNaoMinimizado := wsMaximized;
    FFormulario.WindowState := wsMaximized;
  end;
end;

procedure TControladorEstadoJanela.Atualizar(const ATelaCheia: Boolean);
begin
  if ATelaCheia then
    Exit;
  if FFormulario.WindowState = wsNormal then
    FUltimosLimitesNormais := FFormulario.BoundsRect;
  if FFormulario.WindowState <> wsMinimized then
    FUltimoEstadoNaoMinimizado := FFormulario.WindowState;
end;

function TControladorEstadoJanela.CentralizarNoMonitorPrincipal(
  const ALimites: TRect): TRect;
var
  Altura: Integer;
  AreaUtil: TRect;
  Largura: Integer;
begin
  AreaUtil := Screen.PrimaryMonitor.WorkareaRect;
  Largura := ALimites.Width;
  Altura := ALimites.Height;
  if Largura <= 0 then
    Largura := FFormulario.Width;
  if Altura <= 0 then
    Altura := FFormulario.Height;
  Largura := Min(Max(Largura, LARGURA_MINIMA_JANELA), AreaUtil.Width);
  Altura := Min(Max(Altura, ALTURA_MINIMA_JANELA), AreaUtil.Height);
  Result := Rect(
    AreaUtil.Left + ((AreaUtil.Width - Largura) div 2),
    AreaUtil.Top + ((AreaUtil.Height - Altura) div 2),
    0,
    0);
  Result.Right := Result.Left + Largura;
  Result.Bottom := Result.Top + Altura;
end;

constructor TControladorEstadoJanela.Create(const AFormulario: TForm);
begin
  inherited Create;
  FFormulario := AFormulario;
  FUltimoEstadoNaoMinimizado := wsNormal;
  FUltimosLimitesNormais := FFormulario.BoundsRect;
end;

function TControladorEstadoJanela.Registrar(
  const APreferencias: TPreferencias;
  const ATelaCheia: Boolean;
  const ALimitesAnteriores: TRect;
  const AEstadoJanelaAnterior: TWindowState): Boolean;
var
  Limites: TRect;
  Maximizada: Boolean;
begin
  Result := False;
  if not Assigned(APreferencias) then
    Exit;

  if ATelaCheia then
  begin
    Maximizada := AEstadoJanelaAnterior = wsMaximized;
    if AEstadoJanelaAnterior = wsNormal then
      Limites := ALimitesAnteriores
    else
      Limites := FUltimosLimitesNormais;
  end
  else
  begin
    Maximizada := (FFormulario.WindowState = wsMaximized) or
      ((FFormulario.WindowState = wsMinimized) and
       (FUltimoEstadoNaoMinimizado = wsMaximized));
    if FFormulario.WindowState = wsNormal then
      Limites := FFormulario.BoundsRect
    else
      Limites := FUltimosLimitesNormais;
  end;

  if (Limites.Width <= 0) or (Limites.Height <= 0) then
    Exit;
  APreferencias.PosicaoJanelaSalva := True;
  APreferencias.JanelaEsquerda := Limites.Left;
  APreferencias.JanelaTopo := Limites.Top;
  APreferencias.JanelaLargura := Limites.Width;
  APreferencias.JanelaAltura := Limites.Height;
  APreferencias.JanelaMaximizada := Maximizada;
  Result := True;
end;

function TControladorEstadoJanela.VisivelEmAlgumMonitor(
  const ALimites: TRect): Boolean;
var
  Indice: Integer;
  Intersecao: TRect;
begin
  Result := False;
  for Indice := 0 to Screen.MonitorCount - 1 do
    if Winapi.Windows.IntersectRect(
      Intersecao,
      ALimites,
      Screen.Monitors[Indice].WorkareaRect) and
       (Intersecao.Width >= LARGURA_MINIMA_VISIVEL) and
       (Intersecao.Height >= ALTURA_MINIMA_VISIVEL) then
      Exit(True);
end;

end.
