unit Deskprompter.VCL.FormularioPrincipal;

interface

uses
  System.Classes,
  System.ImageList,
  System.Types,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  Deskprompter.Aplicacao.Comandos,
  Deskprompter.Aplicacao.Contratos.Diagnostico,
  Deskprompter.Aplicacao.Contratos.ProtecaoCaptura,
  Deskprompter.Aplicacao.Contratos.Repositorios,
  Deskprompter.Aplicacao.Contratos.Tempo,
  Deskprompter.Aplicacao.Preferencias,
  Deskprompter.VCL.ControladorAparencia,
  Deskprompter.VCL.ControladorBiblioteca,
  Deskprompter.VCL.ControladorComandos,
  Deskprompter.VCL.ControladorProtecaoCaptura,
  Deskprompter.VCL.ControladorRolagem,
  Deskprompter.VCL.FormularioAtalhos,
  Deskprompter.Dominio.Textos;

type
  TFormularioPrincipal = class(TForm)
    ArvoreConteudo: TTreeView;
    BarraEstado: TPanel;
    ChaveProtecaoCaptura: TToggleSwitch;
    BotaoBaixo: TSpeedButton;
    BotaoExcluir: TSpeedButton;
    BotaoNovoGrupo: TSpeedButton;
    BotaoNovoTexto: TSpeedButton;
    BotaoRenomear: TSpeedButton;
    BotaoCima: TSpeedButton;
    BarraRolagemEspelho: TScrollBar;
    Divisor: TSplitter;
    PainelAcoesBiblioteca: TPanel;
    PainelArvore: TPanel;
    LinhaDivisoriaAcoesBiblioteca: TPanel;
    LinhaDivisoriaControles: TPanel;
    LinhaDivisoriaEstado: TPanel;
    RotuloArvore: TLabel;
    RotuloEstadoCaptura: TLabel;
    RotuloSalvamento: TLabel;
    TemporizadorRolagem: TTimer;
    TemporizadorSalvamento: TTimer;
    TemporizadorPreferencias: TTimer;
    TemporizadorAvisoEspelhamento: TTimer;
    PanelTextos: TPanel;
    EditorTexto: TRichEdit;
    PainelGrupoTexto: TPanel;
    RotuloGrupoTexto: TLabel;
    PainelAvisoEspelhamento: TPanel;
    RotuloAvisoEspelhamento: TLabel;
    BotaoOcultarOpcoes: TSpeedButton;
    BotaoAtalhos: TSpeedButton;
    RotuloSemTexto: TLabel;
    BotaoCorFundo: TSpeedButton;
    BotaoCorFonte: TSpeedButton;
    DesenhoEspelho: TPaintBox;
    DialogoCorFundo: TColorDialog;
    DialogoCorFonte: TColorDialog;
    PainelEspelho: TPanel;
    BotaoRestaurarAparencia: TSpeedButton;
    PainelAcoes: TPanel;
    LinhaDivisoriaAcoes: TPanel;
    IconesBotoes: TImageList;
    BotaoReproduzir: TSpeedButton;
    BotaoInicio: TSpeedButton;
    BotaoRecuar: TSpeedButton;
    BotaoAvancar: TSpeedButton;
    LinhaGrupoRolagem: TPanel;
    BotaoTextoAnterior: TSpeedButton;
    BotaoProximoTexto: TSpeedButton;
    PainelMostrarOpcoes: TPanel;
    BotaoMostrarOpcoes: TSpeedButton;
    LinhaDivisoriaMostrarOpcoes: TPanel;
    PainelAcoesTela: TPanel;
    BotaoEspelhoHorizontal: TSpeedButton;
    BotaoEspelhoVertical: TSpeedButton;
    BotaoTelaCheia: TSpeedButton;
    PainelControles: TPanel;
    RotuloVelocidade: TLabel;
    RotuloTransparencia: TLabel;
    RotuloMargem: TLabel;
    RotuloFonte: TLabel;
    RotuloTamanhoFonte: TLabel;
    LinhaDivisoriaPainelControles: TPanel;
    PainelVelocidade: TPanel;
    PainelTransparencia: TPanel;
    Transparencia: TTrackBar;
    PainelMargem: TPanel;
    MargemTexto: TTrackBar;
    ListaFontes: TComboBox;
    PainelTamanhoFonte: TPanel;
    TamanhoFonte: TTrackBar;
    Velocidade: TTrackBar;
    procedure AparenciaChange(Sender: TObject);
    procedure BarraRolagemEspelhoChange(Sender: TObject);
    procedure ArvoreConteudoChange(Sender: TObject; Node: TTreeNode);
    procedure ArvoreConteudoChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure ArvoreConteudoCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ArvoreConteudoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ArvoreConteudoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure BotaoAvancarClick(Sender: TObject);
    procedure BotaoOcultarOpcoesClick(Sender: TObject);
    procedure BotaoAtalhosClick(Sender: TObject);
    procedure BotaoBaixoClick(Sender: TObject);
    procedure BotaoCimaClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BotaoCorFundoClick(Sender: TObject);
    procedure BotaoCorFonteClick(Sender: TObject);
    procedure BotaoEspelhoHorizontalClick(Sender: TObject);
    procedure BotaoEspelhoVerticalClick(Sender: TObject);
    procedure BotaoInicioClick(Sender: TObject);
    procedure BotaoMostrarOpcoesClick(Sender: TObject);
    procedure BotaoNovoGrupoClick(Sender: TObject);
    procedure BotaoNovoTextoClick(Sender: TObject);
    procedure BotaoRecuarClick(Sender: TObject);
    procedure BotaoRenomearClick(Sender: TObject);
    procedure BotaoReproduzirClick(Sender: TObject);
    procedure BotaoRestaurarAparenciaClick(Sender: TObject);
    procedure BotaoTelaCheiaClick(Sender: TObject);
    procedure BotaoTextoAnteriorClick(Sender: TObject);
    procedure BotaoProximoTextoClick(Sender: TObject);
    procedure ChaveProtecaoCapturaClick(Sender: TObject);
    procedure DesenhoEspelhoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DesenhoEspelhoPaint(Sender: TObject);
    procedure EditorTextoChange(Sender: TObject);
    procedure ListaFontesChange(Sender: TObject);
    procedure FormularioCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormularioCreate(Sender: TObject);
    procedure FormularioDestroy(Sender: TObject);
    procedure FormularioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormularioResize(Sender: TObject);
    procedure TemporizadorAvisoEspelhamentoTimer(Sender: TObject);
    procedure TemporizadorRolagemTimer(Sender: TObject);
    procedure TemporizadorPreferenciasTimer(Sender: TObject);
    procedure TemporizadorSalvamentoTimer(Sender: TObject);
    procedure ValoresChange(Sender: TObject);
  private
    FAlteracaoPendente: Boolean;
    FAtualizandoBarraRolagemEspelho: Boolean;
    FAtualizandoEditor: Boolean;
    FAtualizandoPreferencias: Boolean;
    FControladorAparencia: TControladorAparencia;
    FControladorBiblioteca: TControladorBiblioteca;
    FControladorComandos: TControladorComandos;
    FControladorProtecaoCaptura: TControladorProtecaoCaptura;
    FControladorRolagem: TControladorRolagem;
    FEstadoJanelaAnterior: TWindowState;
    FEstiloBordaAnterior: TFormBorderStyle;
    FLimitesAnteriores: TRect;
    FRegistroDiagnostico: IRegistroDiagnostico;
    FRepositorioPreferencias: IRepositorioPreferencias;
    FTelaCheia: Boolean;
    FOpcoesVisiveis: Boolean;
    FPassoDestaqueAvisoEspelhamento: Integer;
    FPreferencias: TPreferencias;
    FPreferenciasPendentes: Boolean;
    procedure AplicarOpacidade;
    procedure AplicarPreferencias;
    procedure AgendarSalvamentoPreferencias;
    procedure AtualizarAcoesBiblioteca;
    procedure AtualizarAreaDeTexto;
    procedure AtualizarAvisoEspelhamento;
    procedure AtualizarBarraRolagemEspelho;
    procedure AtualizarRotulosAparencia;
    procedure AtualizarRotulosValores;
    procedure AtualizarTituloApresentado(const ATexto: TTexto);
    procedure CarregarFontesDisponiveis;
    procedure ConfigurarFormularioEmTempoDeExecucao;
    procedure CriarControladores;
    procedure DefinirTelaCheia(const AAtivar: Boolean);
    procedure DefinirVisibilidadeOpcoes(const AVisiveis: Boolean);
    procedure DestacarAvisoEspelhamento;
    procedure ExecutarComando(const AComando: TComando);
    procedure InicializarEstadoDaInterface;
    procedure NotificarAlteracaoAparencia(
      const ARecalcularRolagem: Boolean = False);
    procedure ReaplicarProtecaoCaptura;
    procedure RolagemAlterada(Sender: TObject);
    procedure SalvarAlteracoesPendentes;
    procedure SalvarPreferencias;
    procedure SelecionarTexto(const ATexto: TTexto);
    function TextoSelecionado: TTexto;
  protected
    procedure CreateWnd; override;
  public
    procedure Configurar(
      const ARegistroDiagnostico: IRegistroDiagnostico;
      const ARelogio: IRelogio;
      const AProtecaoCaptura: IProtecaoCaptura;
      const ARepositorioGrupos: IRepositorioGrupos;
      const ARepositorioTextos: IRepositorioTextos;
      const ARepositorioPreferencias: IRepositorioPreferencias);
  end;

var
  FormularioPrincipal: TFormularioPrincipal;

implementation

{$R *.dfm}

uses
  System.Math,
  System.SysUtils,
  System.UITypes,
  Winapi.Windows,
  Vcl.Graphics,
  Deskprompter.Dominio.Grupos,
  Deskprompter.VCL.Icones;

const
  COR_AVISO_ESPELHAMENTO = $00303030;
  COR_AVISO_ESPELHAMENTO_DESTAQUE = $004040C0;
  COR_TEXTO_AVISO_ESPELHAMENTO = $0047A5FF;
  COR_ITEM_SELECIONADO_ARVORE = $003D3737;
  TOTAL_PASSOS_DESTAQUE_AVISO = 6;

procedure TFormularioPrincipal.AparenciaChange(Sender: TObject);
begin
  if Sender = TamanhoFonte then
    FControladorAparencia.DefinirTamanhoFonte(TamanhoFonte.Position)
  else if Sender = MargemTexto then
    FControladorAparencia.DefinirMargem(MargemTexto.Position);
  AtualizarRotulosAparencia;
  NotificarAlteracaoAparencia(True);
end;

procedure TFormularioPrincipal.BarraRolagemEspelhoChange(Sender: TObject);
begin
  if FAtualizandoBarraRolagemEspelho then
    Exit;

  FControladorRolagem.DefinirPosicao(BarraRolagemEspelho.Position);
end;

procedure TFormularioPrincipal.AgendarSalvamentoPreferencias;
begin
  if FAtualizandoPreferencias or not Assigned(FPreferencias) or
     not Assigned(FRepositorioPreferencias) then
    Exit;
  FPreferenciasPendentes := True;
  TemporizadorPreferencias.Enabled := False;
  TemporizadorPreferencias.Enabled := True;
end;

procedure TFormularioPrincipal.AplicarOpacidade;
var
  Percentual: Integer;
begin
  Percentual := EnsureRange(Transparencia.Position, 20, 100);
  AlphaBlend := Percentual < 100;
  AlphaBlendValue := Round(255 * (Percentual / 100));
  ReaplicarProtecaoCaptura;
end;

procedure TFormularioPrincipal.AplicarPreferencias;
var
  IndiceFonte: Integer;
begin
  if not Assigned(FPreferencias) then
    Exit;
  FAtualizandoPreferencias := True;
  try
    IndiceFonte := ListaFontes.Items.IndexOf(FPreferencias.NomeFonte);
    if IndiceFonte < 0 then
      IndiceFonte := ListaFontes.Items.IndexOf('Segoe UI');
    ListaFontes.ItemIndex := IndiceFonte;
    if IndiceFonte >= 0 then
      FControladorAparencia.DefinirFonte(ListaFontes.Text);

    TamanhoFonte.Position := FPreferencias.TamanhoFonte;
    MargemTexto.Position := FPreferencias.Margem;
    Transparencia.Position := FPreferencias.Opacidade;
    Velocidade.Position := FPreferencias.Velocidade;
    FControladorAparencia.DefinirTamanhoFonte(TamanhoFonte.Position);
    FControladorAparencia.DefinirMargem(MargemTexto.Position);
    FControladorAparencia.DefinirCorFonte(TColor(FPreferencias.CorFonte));
    FControladorAparencia.DefinirCorFundo(TColor(FPreferencias.CorFundo));
    FControladorAparencia.DefinirEspelhoHorizontal(
      FPreferencias.EspelhoHorizontal);
    FControladorAparencia.DefinirEspelhoVertical(
      FPreferencias.EspelhoVertical);
    FControladorRolagem.DefinirVelocidade(Velocidade.Position);
    AplicarOpacidade;
    AtualizarAvisoEspelhamento;
    AtualizarRotulosAparencia;
    AtualizarRotulosValores;
  finally
    FAtualizandoPreferencias := False;
  end;
end;

procedure TFormularioPrincipal.ArvoreConteudoChange(
  Sender: TObject;
  Node: TTreeNode);
begin
  FControladorBiblioteca.AlterarSelecao(Node);
  AtualizarAcoesBiblioteca;
end;

procedure TFormularioPrincipal.ArvoreConteudoChanging(
  Sender: TObject;
  Node: TTreeNode;
  var AllowChange: Boolean);
begin
  FControladorBiblioteca.SalvarAntesDeAlterarSelecao;
  AllowChange := True;
end;

procedure TFormularioPrincipal.ArvoreConteudoCustomDrawItem(
  Sender: TCustomTreeView;
  Node: TTreeNode;
  State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Node.Selected then
  begin
    Sender.Canvas.Brush.Color := COR_ITEM_SELECIONADO_ARVORE;
    Sender.Canvas.Font.Color := clWhite;
  end;
  DefaultDraw := True;
end;

procedure TFormularioPrincipal.ArvoreConteudoDragDrop(
  Sender, Source: TObject;
  X, Y: Integer);
begin
  if Source <> ArvoreConteudo then
    Exit;
  FControladorBiblioteca.MoverTexto(X, Y);
end;

procedure TFormularioPrincipal.ArvoreConteudoDragOver(
  Sender, Source: TObject;
  X, Y: Integer;
  State: TDragState;
  var Accept: Boolean);
begin
  Accept := (Source = ArvoreConteudo) and
    FControladorBiblioteca.PodeMoverTexto(X, Y);
end;

procedure TFormularioPrincipal.AtualizarAcoesBiblioteca;
var
  NoSelecionado: TTreeNode;
begin
  NoSelecionado := ArvoreConteudo.Selected;
  BotaoNovoTexto.Enabled := True;
  BotaoRenomear.Enabled := Assigned(NoSelecionado);
  BotaoExcluir.Enabled := Assigned(NoSelecionado);
  BotaoCima.Enabled := True;
  BotaoBaixo.Enabled := True;
end;

procedure TFormularioPrincipal.AtualizarAreaDeTexto;
begin
  if Assigned(FControladorRolagem) then
    FControladorRolagem.RecalcularLimite;
  if Assigned(FControladorAparencia) then
    FControladorAparencia.InvalidarEspelho;
  AtualizarBarraRolagemEspelho;
end;

procedure TFormularioPrincipal.AtualizarAvisoEspelhamento;
var
  AvisoVisivel: Boolean;
begin
  AvisoVisivel := False;
  if Assigned(FControladorAparencia) then
    AvisoVisivel := (TextoSelecionado <> nil) and
      (FControladorAparencia.EspelhoHorizontal() or
       FControladorAparencia.EspelhoVertical());
  PainelAvisoEspelhamento.Visible := AvisoVisivel;

  if AvisoVisivel then
    PainelAvisoEspelhamento.BringToFront
  else
  begin
    TemporizadorAvisoEspelhamento.Enabled := False;
    FPassoDestaqueAvisoEspelhamento := 0;
    PainelAvisoEspelhamento.Color := COR_AVISO_ESPELHAMENTO;
    RotuloAvisoEspelhamento.Font.Color := COR_TEXTO_AVISO_ESPELHAMENTO;
  end;
end;

procedure TFormularioPrincipal.AtualizarBarraRolagemEspelho;
var
  Limite: Integer;
begin
  if not Assigned(FControladorRolagem) then
    Exit;

  Limite := Max(0, Ceil(FControladorRolagem.Limite));
  FAtualizandoBarraRolagemEspelho := True;
  try
    BarraRolagemEspelho.Max := Limite;
    BarraRolagemEspelho.Enabled := Limite > 0;
    BarraRolagemEspelho.Position := EnsureRange(
      Round(FControladorRolagem.Posicao),
      BarraRolagemEspelho.Min,
      BarraRolagemEspelho.Max);
    BarraRolagemEspelho.LargeChange := Max(1, DesenhoEspelho.Height div 2);
  finally
    FAtualizandoBarraRolagemEspelho := False;
  end;
end;

procedure TFormularioPrincipal.AtualizarRotulosAparencia;
begin
  RotuloTamanhoFonte.Caption := Format(
    'Tamanho: %d',
    [TamanhoFonte.Position]);
  RotuloMargem.Caption := Format(
    'Margem: %d px',
    [MargemTexto.Position]);
end;

procedure TFormularioPrincipal.AtualizarRotulosValores;
begin
  RotuloTransparencia.Caption := Format(
    'Opacidade: %d%%',
    [Transparencia.Position]);
  RotuloVelocidade.Caption := Format(
    'Velocidade: %d px/s',
    [Velocidade.Position]);
end;

procedure TFormularioPrincipal.AtualizarTituloApresentado(
  const ATexto: TTexto);
var
  Grupo: TGrupo;
begin
  Grupo := FControladorBiblioteca.GrupoSelecionado;
  if not Assigned(Grupo) then
  begin
    RotuloGrupoTexto.Caption := '';
    Exit;
  end;

  if Assigned(ATexto) then
    RotuloGrupoTexto.Caption := Format(
      '%s - %s',
      [Grupo.Nome, ATexto.Titulo])
  else
    RotuloGrupoTexto.Caption := Grupo.Nome;
end;

procedure TFormularioPrincipal.BotaoAvancarClick(Sender: TObject);
begin
  FControladorRolagem.Avancar;
end;

procedure TFormularioPrincipal.BotaoOcultarOpcoesClick(Sender: TObject);
begin
  DefinirVisibilidadeOpcoes(not FOpcoesVisiveis);
end;

procedure TFormularioPrincipal.BotaoAtalhosClick(Sender: TObject);
var
  FormularioAtalhos: TFormularioAtalhos;
begin
  FormularioAtalhos := TFormularioAtalhos.Create(Self);
  try
    FormularioAtalhos.Configurar(FPreferencias.Atalhos);
    FormularioAtalhos.ShowModal;
    if FormularioAtalhos.Alterado then
      AgendarSalvamentoPreferencias;
  finally
    FormularioAtalhos.Free;
  end;
end;

procedure TFormularioPrincipal.BotaoCorFundoClick(Sender: TObject);
begin
  DialogoCorFundo.Color := EditorTexto.Color;
  if DialogoCorFundo.Execute then
  begin
    FControladorAparencia.DefinirCorFundo(DialogoCorFundo.Color);
    NotificarAlteracaoAparencia;
  end;
end;

procedure TFormularioPrincipal.BotaoCorFonteClick(Sender: TObject);
begin
  DialogoCorFonte.Color := EditorTexto.Font.Color;
  if DialogoCorFonte.Execute then
  begin
    FControladorAparencia.DefinirCorFonte(DialogoCorFonte.Color);
    NotificarAlteracaoAparencia;
  end;
end;

procedure TFormularioPrincipal.BotaoEspelhoHorizontalClick(Sender: TObject);
begin
  FControladorAparencia.AlternarEspelhoHorizontal;
  AtualizarAvisoEspelhamento;
  NotificarAlteracaoAparencia;
end;

procedure TFormularioPrincipal.BotaoEspelhoVerticalClick(Sender: TObject);
begin
  FControladorAparencia.AlternarEspelhoVertical;
  AtualizarAvisoEspelhamento;
  NotificarAlteracaoAparencia;
end;

procedure TFormularioPrincipal.BotaoBaixoClick(Sender: TObject);
begin
  if not FControladorBiblioteca.PodeReordenarSelecionado(1) then
    Exit;
  FControladorBiblioteca.ReordenarSelecionado(1);
end;

procedure TFormularioPrincipal.BotaoCimaClick(Sender: TObject);
begin
  if not FControladorBiblioteca.PodeReordenarSelecionado(-1) then
    Exit;
  FControladorBiblioteca.ReordenarSelecionado(-1);
end;

procedure TFormularioPrincipal.BotaoExcluirClick(Sender: TObject);
begin
  FControladorBiblioteca.ExcluirSelecionado;
end;

procedure TFormularioPrincipal.BotaoInicioClick(Sender: TObject);
begin
  FControladorRolagem.Inicio;
end;

procedure TFormularioPrincipal.BotaoMostrarOpcoesClick(Sender: TObject);
begin
  DefinirVisibilidadeOpcoes(True);
end;

procedure TFormularioPrincipal.BotaoNovoGrupoClick(Sender: TObject);
begin
  FControladorBiblioteca.NovoGrupo;
end;

procedure TFormularioPrincipal.BotaoNovoTextoClick(Sender: TObject);
begin
  FControladorBiblioteca.NovoTexto;
end;

procedure TFormularioPrincipal.BotaoRecuarClick(Sender: TObject);
begin
  FControladorRolagem.Recuar;
end;

procedure TFormularioPrincipal.BotaoRenomearClick(Sender: TObject);
begin
  FControladorBiblioteca.RenomearSelecionado;
end;

procedure TFormularioPrincipal.BotaoReproduzirClick(Sender: TObject);
begin
  FControladorRolagem.AlternarReproducao;
end;

procedure TFormularioPrincipal.BotaoRestaurarAparenciaClick(Sender: TObject);
begin
  if MessageDlg(
    'Restaurar fonte, cores, margem, velocidade, opacidade e espelhamentos?',
    mtConfirmation,
    [mbYes, mbNo],
    0) <> mrYes then
    Exit;
  FPreferencias.RestaurarAparenciaPadrao;
  AplicarPreferencias;
  NotificarAlteracaoAparencia(True);
end;

procedure TFormularioPrincipal.BotaoTelaCheiaClick(Sender: TObject);
begin
  DefinirTelaCheia(not FTelaCheia);
end;

procedure TFormularioPrincipal.BotaoTextoAnteriorClick(Sender: TObject);
begin
  FControladorBiblioteca.NavegarTexto(-1);
end;

procedure TFormularioPrincipal.BotaoProximoTextoClick(Sender: TObject);
begin
  FControladorBiblioteca.NavegarTexto(1);
end;

procedure TFormularioPrincipal.ChaveProtecaoCapturaClick(Sender: TObject);
begin
  FControladorProtecaoCaptura.DefinirAtiva(
    ChaveProtecaoCaptura.State = tssOn,
    NativeUInt(Handle));
end;

procedure TFormularioPrincipal.Configurar(
  const ARegistroDiagnostico: IRegistroDiagnostico;
  const ARelogio: IRelogio;
  const AProtecaoCaptura: IProtecaoCaptura;
  const ARepositorioGrupos: IRepositorioGrupos;
  const ARepositorioTextos: IRepositorioTextos;
  const ARepositorioPreferencias: IRepositorioPreferencias);
begin
  FRegistroDiagnostico := ARegistroDiagnostico;
  FControladorRolagem.ConfigurarRelogio(ARelogio);
  FControladorProtecaoCaptura.Configurar(
    ARegistroDiagnostico,
    AProtecaoCaptura);
  FRepositorioPreferencias := ARepositorioPreferencias;
  FPreferencias := FRepositorioPreferencias.Carregar;
  FControladorComandos := TControladorComandos.Create(
    FPreferencias.Atalhos,
    ExecutarComando);
  AplicarPreferencias;
  FControladorBiblioteca.Configurar(
    ARepositorioGrupos,
    ARepositorioTextos);
  FControladorBiblioteca.Carregar(TGUID.Empty);
  ReaplicarProtecaoCaptura;
  FRegistroDiagnostico.Registrar(
    nrInformacao,
    'Biblioteca e preferencias locais carregadas');
end;

procedure TFormularioPrincipal.CreateWnd;
begin
  inherited;
  ReaplicarProtecaoCaptura;
end;

procedure TFormularioPrincipal.DefinirTelaCheia(const AAtivar: Boolean);
var
  MonitorAtual: TMonitor;
begin
  if AAtivar = FTelaCheia then
    Exit;
  if AAtivar then
  begin
    FLimitesAnteriores := BoundsRect;
    FEstiloBordaAnterior := BorderStyle;
    FEstadoJanelaAnterior := WindowState;
    MonitorAtual := Self.Monitor;
    WindowState := wsNormal;
    BorderStyle := bsNone;
    SetBounds(
      MonitorAtual.BoundsRect.Left,
      MonitorAtual.BoundsRect.Top,
      MonitorAtual.BoundsRect.Width,
      MonitorAtual.BoundsRect.Height);
    FTelaCheia := True;
    BotaoTelaCheia.Hint := 'Sair da tela cheia';
    BotaoTelaCheia.ImageIndex := Ord(iibSairTelaCheia);
  end
  else
  begin
    BorderStyle := FEstiloBordaAnterior;
    WindowState := FEstadoJanelaAnterior;
    BoundsRect := FLimitesAnteriores;
    FTelaCheia := False;
    BotaoTelaCheia.Hint := 'Entrar em tela cheia';
    BotaoTelaCheia.ImageIndex := Ord(iibTelaCheia);
  end;
  ReaplicarProtecaoCaptura;
end;

procedure TFormularioPrincipal.DefinirVisibilidadeOpcoes(
  const AVisiveis: Boolean);
begin
  FOpcoesVisiveis := AVisiveis;
  if AVisiveis then
  begin
    PainelArvore.Visible := True;
    Divisor.Visible := True;
    PainelControles.Visible := True;
    BarraEstado.Visible := True;
    BotaoOcultarOpcoes.Visible := True;
    PainelMostrarOpcoes.Height := 1;
    BotaoMostrarOpcoes.Enabled := False;
  end
  else
  begin
    BotaoOcultarOpcoes.Visible := False;
    PainelArvore.Visible := False;
    Divisor.Visible := False;
    PainelControles.Visible := False;
    BarraEstado.Visible := False;
    PainelMostrarOpcoes.Height := 50;
    BotaoMostrarOpcoes.Enabled := True;
  end;

  if not AVisiveis then
    PainelMostrarOpcoes.BringToFront;
  AtualizarAreaDeTexto;
end;

procedure TFormularioPrincipal.ExecutarComando(const AComando: TComando);
begin
  case AComando of
    cmdReproduzirPausar:
      BotaoReproduzirClick(Self);
    cmdTextoSeguinte:
      BotaoProximoTextoClick(Self);
    cmdTextoAnterior:
      BotaoTextoAnteriorClick(Self);
    cmdAvancarRolagem:
      BotaoAvancarClick(Self);
    cmdRecuarRolagem:
      BotaoRecuarClick(Self);
    cmdAumentarVelocidade:
      begin
        Velocidade.Position := EnsureRange(
          Velocidade.Position + 10,
          Velocidade.Min,
          Velocidade.Max);
        ValoresChange(Velocidade);
      end;
    cmdDiminuirVelocidade:
      begin
        Velocidade.Position := EnsureRange(
          Velocidade.Position - 10,
          Velocidade.Min,
          Velocidade.Max);
        ValoresChange(Velocidade);
      end;
    cmdAumentarFonte:
      begin
        TamanhoFonte.Position := EnsureRange(
          TamanhoFonte.Position + 2,
          TamanhoFonte.Min,
          TamanhoFonte.Max);
        AparenciaChange(TamanhoFonte);
      end;
    cmdDiminuirFonte:
      begin
        TamanhoFonte.Position := EnsureRange(
          TamanhoFonte.Position - 2,
          TamanhoFonte.Min,
          TamanhoFonte.Max);
        AparenciaChange(TamanhoFonte);
      end;
    cmdEspelhoHorizontal:
      BotaoEspelhoHorizontalClick(Self);
    cmdEspelhoVertical:
      BotaoEspelhoVerticalClick(Self);
    cmdInicio:
      BotaoInicioClick(Self);
    cmdTelaCheia:
      BotaoTelaCheiaClick(Self);
    cmdAlternarOpcoes:
      BotaoOcultarOpcoesClick(Self);
    cmdSairTelaCheia:
      if FTelaCheia then
        DefinirTelaCheia(False);
  end;
end;

procedure TFormularioPrincipal.DesenhoEspelhoPaint(Sender: TObject);
begin
  FControladorAparencia.PintarEspelho(
    DesenhoEspelho.Canvas,
    DesenhoEspelho.ClientRect,
    FControladorRolagem.Posicao);
end;

procedure TFormularioPrincipal.DesenhoEspelhoMouseDown(
  Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer);
begin
  DestacarAvisoEspelhamento;
end;

procedure TFormularioPrincipal.DestacarAvisoEspelhamento;
begin
  if not PainelAvisoEspelhamento.Visible then
    Exit;

  TemporizadorAvisoEspelhamento.Enabled := False;
  FPassoDestaqueAvisoEspelhamento := 0;
  PainelAvisoEspelhamento.Color := COR_AVISO_ESPELHAMENTO_DESTAQUE;
  RotuloAvisoEspelhamento.Font.Color := clWhite;
  TemporizadorAvisoEspelhamento.Enabled := True;
end;

procedure TFormularioPrincipal.EditorTextoChange(Sender: TObject);
var
  Texto: TTexto;
begin
  if FAtualizandoEditor then
    Exit;
  Texto := TextoSelecionado;
  if Assigned(Texto) then
  begin
    Texto.AlterarConteudo(EditorTexto.Text);
    FAlteracaoPendente := True;
    TemporizadorSalvamento.Enabled := False;
    TemporizadorSalvamento.Enabled := True;
    RotuloSalvamento.Caption := 'Alteracoes pendentes';
  end;
  AtualizarAreaDeTexto;
end;

procedure TFormularioPrincipal.FormularioCloseQuery(
  Sender: TObject;
  var CanClose: Boolean);
begin
  SalvarAlteracoesPendentes;
  SalvarPreferencias;
  CanClose := not FAlteracaoPendente and not FPreferenciasPendentes;
end;

procedure TFormularioPrincipal.ConfigurarFormularioEmTempoDeExecucao;
begin
  EditorTexto.Align := alClient;
  PainelEspelho.Align := alClient;
  PainelEspelho.BorderStyle := bsNone;
  DesenhoEspelho.Align := alClient;
  RotuloSemTexto.Align := alClient;
  RotuloSemTexto.Transparent := True;
  PainelMostrarOpcoes.Height := 1;
  BotaoMostrarOpcoes.Enabled := False;
end;

procedure TFormularioPrincipal.CriarControladores;
begin
  FControladorBiblioteca := TControladorBiblioteca.Create(
    ArvoreConteudo,
    SelecionarTexto,
    SalvarAlteracoesPendentes);
  FControladorAparencia := TControladorAparencia.Create(
    EditorTexto,
    PanelTextos,
    PainelEspelho,
    BotaoEspelhoHorizontal,
    BotaoEspelhoVertical);
  FControladorRolagem := TControladorRolagem.Create(
    EditorTexto,
    BotaoReproduzir,
    RolagemAlterada);
  FControladorProtecaoCaptura := TControladorProtecaoCaptura.Create(
    RotuloEstadoCaptura);
end;

procedure TFormularioPrincipal.CarregarFontesDisponiveis;
begin
  ListaFontes.Items.Assign(Screen.Fonts);
  ListaFontes.ItemIndex := ListaFontes.Items.IndexOf(EditorTexto.Font.Name);
end;

procedure TFormularioPrincipal.InicializarEstadoDaInterface;
begin
  FControladorAparencia.DefinirMargem(MargemTexto.Position);
  FControladorAparencia.DefinirTamanhoFonte(TamanhoFonte.Position);
  AtualizarRotulosValores;
  AtualizarRotulosAparencia;
  AtualizarAcoesBiblioteca;
  DefinirVisibilidadeOpcoes(True);
end;

procedure TFormularioPrincipal.FormularioCreate(Sender: TObject);
begin
  ConfigurarFormularioEmTempoDeExecucao;
  CriarControladores;
  CarregarFontesDisponiveis;
  InicializarEstadoDaInterface;
end;

procedure TFormularioPrincipal.FormularioDestroy(Sender: TObject);
begin
  TemporizadorAvisoEspelhamento.Enabled := False;
  FControladorComandos.Free;
  FPreferencias.Free;
  FControladorProtecaoCaptura.Free;
  FControladorRolagem.Free;
  FControladorAparencia.Free;
  FControladorBiblioteca.Free;
end;

procedure TFormularioPrincipal.FormularioKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  if not Assigned(FControladorComandos) then
    Exit;

  if (ActiveControl = EditorTexto) and
     not (ssCtrl in Shift) and not (ssAlt in Shift) and
     (Key in [VK_LEFT, VK_RIGHT, VK_HOME, VK_PRIOR, VK_NEXT]) then
    Exit;

  if FControladorComandos.ProcessarTecla(Key, Shift) then
    Key := 0;
end;

procedure TFormularioPrincipal.FormularioResize(Sender: TObject);
begin
  if Assigned(PainelMostrarOpcoes) and not FOpcoesVisiveis then
    PainelMostrarOpcoes.BringToFront;
  AtualizarAreaDeTexto;
end;

procedure TFormularioPrincipal.ListaFontesChange(Sender: TObject);
begin
  FControladorAparencia.DefinirFonte(ListaFontes.Text);
  NotificarAlteracaoAparencia(True);
end;

procedure TFormularioPrincipal.NotificarAlteracaoAparencia(
  const ARecalcularRolagem: Boolean);
begin
  if ARecalcularRolagem then
    FControladorRolagem.RecalcularLimite;
  AgendarSalvamentoPreferencias;
end;

procedure TFormularioPrincipal.ReaplicarProtecaoCaptura;
begin
  if Assigned(FControladorProtecaoCaptura) and HandleAllocated then
    FControladorProtecaoCaptura.Aplicar(NativeUInt(Handle));
end;

procedure TFormularioPrincipal.SalvarPreferencias;
begin
  TemporizadorPreferencias.Enabled := False;
  if not FPreferenciasPendentes or not Assigned(FPreferencias) or
     not Assigned(FRepositorioPreferencias) then
    Exit;
  try
    FPreferencias.NomeFonte := EditorTexto.Font.Name;
    FPreferencias.TamanhoFonte := TamanhoFonte.Position;
    FPreferencias.CorFonte := EditorTexto.Font.Color;
    FPreferencias.CorFundo := EditorTexto.Color;
    FPreferencias.Opacidade := Transparencia.Position;
    FPreferencias.Margem := MargemTexto.Position;
    FPreferencias.Velocidade := Velocidade.Position;
    FPreferencias.EspelhoHorizontal :=
      FControladorAparencia.EspelhoHorizontal;
    FPreferencias.EspelhoVertical :=
      FControladorAparencia.EspelhoVertical;
    FRepositorioPreferencias.Salvar(FPreferencias);
    FPreferenciasPendentes := False;
    RotuloSalvamento.Caption := 'Preferencias salvas localmente';
  except
    on E: Exception do
    begin
      RotuloSalvamento.Caption := 'Falha ao salvar preferencias';
      TemporizadorPreferencias.Enabled := True;
      if Assigned(FRegistroDiagnostico) then
        FRegistroDiagnostico.Registrar(nrErro, E.Message);
    end;
  end;
end;

procedure TFormularioPrincipal.RolagemAlterada(Sender: TObject);
begin
  AtualizarBarraRolagemEspelho;
  FControladorAparencia.InvalidarEspelho;
end;

procedure TFormularioPrincipal.SalvarAlteracoesPendentes;
var
  Texto: TTexto;
begin
  TemporizadorSalvamento.Enabled := False;
  if not FAlteracaoPendente then
    Exit;
  Texto := TextoSelecionado;
  if not Assigned(Texto) then
    Exit;
  try
    FControladorBiblioteca.SalvarTextoApresentado;
    FAlteracaoPendente := False;
    RotuloSalvamento.Caption := 'Salvo localmente';
  except
    on E: Exception do
    begin
      RotuloSalvamento.Caption := 'Falha ao salvar';
      TemporizadorSalvamento.Enabled := True;
      if Assigned(FRegistroDiagnostico) then
        FRegistroDiagnostico.Registrar(nrErro, E.Message);
    end;
  end;
end;

procedure TFormularioPrincipal.SelecionarTexto(const ATexto: TTexto);
var
  TemTexto: Boolean;
begin
  TemTexto := Assigned(ATexto);
  FAtualizandoEditor := True;
  try
    if not TemTexto then
      EditorTexto.Clear
    else
    begin
      EditorTexto.Text := ATexto.Conteudo;
      EditorTexto.SelStart := 0;
      EditorTexto.SelLength := 0;
    end;
    FAlteracaoPendente := False;
    TemporizadorSalvamento.Enabled := False;
  finally
    FAtualizandoEditor := False;
  end;
  AtualizarTituloApresentado(ATexto);
  PainelControles.Enabled := TemTexto;
  PainelGrupoTexto.Enabled := True;
  BotaoReproduzir.Enabled := TemTexto;
  BotaoInicio.Enabled := TemTexto;
  BotaoRecuar.Enabled := TemTexto;
  BotaoAvancar.Enabled := TemTexto;
  BotaoTextoAnterior.Enabled := TemTexto;
  BotaoProximoTexto.Enabled := TemTexto;
  PainelAcoesTela.Enabled := TemTexto;
  EditorTexto.Enabled := TemTexto;
  EditorTexto.Visible := TemTexto;
  RotuloSemTexto.Visible := not TemTexto;
  FControladorAparencia.DefinirTextoAtivo(TemTexto);
  FControladorRolagem.DefinirTextoAtivo(TemTexto);
  AtualizarAreaDeTexto;
  AtualizarAvisoEspelhamento;
end;

procedure TFormularioPrincipal.TemporizadorAvisoEspelhamentoTimer(
  Sender: TObject);
begin
  Inc(FPassoDestaqueAvisoEspelhamento);
  if Odd(FPassoDestaqueAvisoEspelhamento) then
  begin
    PainelAvisoEspelhamento.Color := COR_AVISO_ESPELHAMENTO;
    RotuloAvisoEspelhamento.Font.Color := COR_TEXTO_AVISO_ESPELHAMENTO;
  end
  else
  begin
    PainelAvisoEspelhamento.Color := COR_AVISO_ESPELHAMENTO_DESTAQUE;
    RotuloAvisoEspelhamento.Font.Color := clWhite;
  end;

  if FPassoDestaqueAvisoEspelhamento >= TOTAL_PASSOS_DESTAQUE_AVISO then
  begin
    TemporizadorAvisoEspelhamento.Enabled := False;
    PainelAvisoEspelhamento.Color := COR_AVISO_ESPELHAMENTO;
    RotuloAvisoEspelhamento.Font.Color := COR_TEXTO_AVISO_ESPELHAMENTO;
  end;
end;

procedure TFormularioPrincipal.TemporizadorRolagemTimer(Sender: TObject);
begin
  FControladorRolagem.Atualizar;
end;

procedure TFormularioPrincipal.TemporizadorPreferenciasTimer(Sender: TObject);
begin
  SalvarPreferencias;
end;

procedure TFormularioPrincipal.TemporizadorSalvamentoTimer(Sender: TObject);
begin
  SalvarAlteracoesPendentes;
end;

function TFormularioPrincipal.TextoSelecionado: TTexto;
begin
  Result := FControladorBiblioteca.TextoApresentado;
end;

procedure TFormularioPrincipal.ValoresChange(Sender: TObject);
begin
  AtualizarRotulosValores;
  FControladorRolagem.DefinirVelocidade(Velocidade.Position);
  AplicarOpacidade;
  NotificarAlteracaoAparencia;
end;

end.
