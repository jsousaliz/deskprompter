unit Deskprompter.Aplicacao.Preferencias;

interface

uses
  Deskprompter.Aplicacao.Comandos;

type
  TPreferencias = class
  private
    FAtalhos: TCatalogoAtalhos;
    FCorFundo: Integer;
    FCorFonte: Integer;
    FEspelhoHorizontal: Boolean;
    FEspelhoVertical: Boolean;
    FOcultarIconeBarraTarefas: Boolean;
    FMargem: Integer;
    FNomeFonte: string;
    FOpacidade: Integer;
    FTamanhoFonte: Integer;
    FVelocidade: Integer;
    FProtecaoCaptura: Boolean;
    FSempreNoTopo: Boolean;
    procedure SetMargem(const AValor: Integer);
    procedure SetNomeFonte(const AValor: string);
    procedure SetOpacidade(const AValor: Integer);
    procedure SetTamanhoFonte(const AValor: Integer);
    procedure SetVelocidade(const AValor: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure RestaurarAparenciaPadrao;
    procedure RestaurarEstadosJanelaPadrao;
    procedure RestaurarPadroes;

    property Atalhos: TCatalogoAtalhos read FAtalhos;
    property CorFundo: Integer read FCorFundo write FCorFundo;
    property CorFonte: Integer read FCorFonte write FCorFonte;
    property EspelhoHorizontal: Boolean
      read FEspelhoHorizontal write FEspelhoHorizontal;
    property EspelhoVertical: Boolean
      read FEspelhoVertical write FEspelhoVertical;
    property Margem: Integer read FMargem write SetMargem;
    property NomeFonte: string read FNomeFonte write SetNomeFonte;
    property OcultarIconeBarraTarefas: Boolean
      read FOcultarIconeBarraTarefas write FOcultarIconeBarraTarefas;
    property Opacidade: Integer read FOpacidade write SetOpacidade;
    property ProtecaoCaptura: Boolean
      read FProtecaoCaptura write FProtecaoCaptura;
    property SempreNoTopo: Boolean read FSempreNoTopo write FSempreNoTopo;
    property TamanhoFonte: Integer read FTamanhoFonte write SetTamanhoFonte;
    property Velocidade: Integer read FVelocidade write SetVelocidade;
  end;

implementation

uses
  System.Math,
  System.SysUtils;

constructor TPreferencias.Create;
begin
  inherited Create;
  FAtalhos := TCatalogoAtalhos.Create;
  RestaurarPadroes;
end;

destructor TPreferencias.Destroy;
begin
  FAtalhos.Free;
  inherited;
end;

procedure TPreferencias.RestaurarPadroes;
begin
  RestaurarAparenciaPadrao;
  RestaurarEstadosJanelaPadrao;
  FAtalhos.RestaurarPadroes;
end;

procedure TPreferencias.RestaurarEstadosJanelaPadrao;
begin
  FProtecaoCaptura := True;
  FSempreNoTopo := False;
  FOcultarIconeBarraTarefas := False;
end;

procedure TPreferencias.RestaurarAparenciaPadrao;
begin
  FNomeFonte := 'Segoe UI';
  FTamanhoFonte := 28;
  FCorFonte := $00FFFFFF;
  FCorFundo := $00151515;
  FOpacidade := 100;
  FMargem := 40;
  FVelocidade := 60;
  FEspelhoHorizontal := False;
  FEspelhoVertical := False;
end;

procedure TPreferencias.SetMargem(const AValor: Integer);
begin
  FMargem := EnsureRange(AValor, 0, 200);
end;

procedure TPreferencias.SetNomeFonte(const AValor: string);
begin
  if AValor.Trim.IsEmpty then
    FNomeFonte := 'Segoe UI'
  else
    FNomeFonte := AValor.Trim;
end;

procedure TPreferencias.SetOpacidade(const AValor: Integer);
begin
  FOpacidade := EnsureRange(AValor, 20, 100);
end;

procedure TPreferencias.SetTamanhoFonte(const AValor: Integer);
begin
  FTamanhoFonte := EnsureRange(AValor, 12, 96);
end;

procedure TPreferencias.SetVelocidade(const AValor: Integer);
begin
  FVelocidade := EnsureRange(AValor, 10, 300);
end;

end.
