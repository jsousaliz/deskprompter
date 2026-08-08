unit Deskprompter.Inicializacao.RaizComposicao;

interface

uses
  Deskprompter.Aplicacao.Contratos.Diagnostico,
  Deskprompter.Aplicacao.Contratos.ProtecaoCaptura,
  Deskprompter.Aplicacao.Contratos.Repositorios,
  Deskprompter.Aplicacao.Contratos.Tempo;

type
  TRaizComposicao = class
  private
    FRegistroDiagnostico: IRegistroDiagnostico;
    FRelogio: IRelogio;
    FProtecaoCaptura: IProtecaoCaptura;
    FRepositorioGrupos: IRepositorioGrupos;
    FRepositorioPreferencias: IRepositorioPreferencias;
    FRepositorioTextos: IRepositorioTextos;
    FBancoDados: TObject;
  public
    constructor Create;
    destructor Destroy; override;

    property RegistroDiagnostico: IRegistroDiagnostico
      read FRegistroDiagnostico;
    property Relogio: IRelogio read FRelogio;
    property ProtecaoCaptura: IProtecaoCaptura read FProtecaoCaptura;
    property RepositorioGrupos: IRepositorioGrupos read FRepositorioGrupos;
    property RepositorioPreferencias: IRepositorioPreferencias
      read FRepositorioPreferencias;
    property RepositorioTextos: IRepositorioTextos read FRepositorioTextos;
  end;

implementation

uses
  System.IOUtils,
  System.SysUtils,
  Deskprompter.Infraestrutura.Diagnostico.Depurador,
  Deskprompter.Infraestrutura.Persistencia.SQLite.Banco,
  Deskprompter.Infraestrutura.Persistencia.SQLite.Repositorios,
  Deskprompter.Infraestrutura.Tempo.RelogioSistema,
  Deskprompter.Infraestrutura.Windows.ProtecaoCaptura;

constructor TRaizComposicao.Create;
var
  BancoDados: TBancoDadosSQLite;
  DiretorioDados: string;
begin
  inherited Create;
  FRegistroDiagnostico := TRegistroDiagnosticoDepurador.Create;
  FRelogio := TRelogioSistema.Create;
  FProtecaoCaptura := TProtecaoCapturaWindows.Create;

  DiretorioDados := GetEnvironmentVariable('LOCALAPPDATA');
  if DiretorioDados.IsEmpty then
    DiretorioDados := TPath.GetHomePath;
  DiretorioDados := TPath.Combine(DiretorioDados, 'Deskprompter');

  BancoDados := TBancoDadosSQLite.Create(
    TPath.Combine(DiretorioDados, 'deskprompter.db'));
  FBancoDados := BancoDados;
  FRepositorioGrupos := TRepositorioGruposSQLite.Create(BancoDados.Conexao);
  FRepositorioPreferencias :=
    TRepositorioPreferenciasSQLite.Create(BancoDados.Conexao);
  FRepositorioTextos := TRepositorioTextosSQLite.Create(BancoDados.Conexao);
end;

destructor TRaizComposicao.Destroy;
begin
  FRepositorioTextos := nil;
  FRepositorioPreferencias := nil;
  FRepositorioGrupos := nil;
  FBancoDados.Free;
  inherited;
end;

end.
