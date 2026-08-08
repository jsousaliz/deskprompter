unit Deskprompter.Infraestrutura.Persistencia.SQLite.Banco;

interface

uses
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Stan.Def;

type
  TBancoDadosSQLite = class
  private
    FCaminhoArquivo: string;
    FConexao: TFDConnection;
    FDriverSQLite: TFDPhysSQLiteDriverLink;
    procedure AplicarMigracoes;
    procedure ConfigurarConexao;
    function VersaoAtual: Integer;
  public
    constructor Create(const ACaminhoArquivo: string);
    destructor Destroy; override;

    property CaminhoArquivo: string read FCaminhoArquivo;
    property Conexao: TFDConnection read FConexao;
  end;

implementation

uses
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  System.IOUtils,
  System.SysUtils;

procedure TBancoDadosSQLite.AplicarMigracoes;
begin
  FConexao.ExecSQL(
    'CREATE TABLE IF NOT EXISTS versoes_esquema (' +
    '  versao INTEGER NOT NULL PRIMARY KEY,' +
    '  aplicada_em TEXT NOT NULL' +
    ')');

  if VersaoAtual < 1 then
  begin
    FConexao.StartTransaction;
    try
      FConexao.ExecSQL(
        'CREATE TABLE grupos (' +
        '  id TEXT NOT NULL PRIMARY KEY,' +
        '  nome TEXT NOT NULL,' +
        '  ordem INTEGER NOT NULL,' +
        '  criado_em TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,' +
        '  atualizado_em TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP' +
        ')');
      FConexao.ExecSQL(
        'CREATE TABLE textos (' +
        '  id TEXT NOT NULL PRIMARY KEY,' +
        '  grupo_id TEXT NOT NULL,' +
        '  titulo TEXT NOT NULL,' +
        '  conteudo TEXT NOT NULL DEFAULT '''',' +
        '  ordem INTEGER NOT NULL,' +
        '  criado_em TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,' +
        '  atualizado_em TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,' +
        '  FOREIGN KEY (grupo_id) REFERENCES grupos(id) ON DELETE CASCADE' +
        ')');
      FConexao.ExecSQL(
        'CREATE INDEX indice_grupos_ordem ON grupos(ordem)');
      FConexao.ExecSQL(
        'CREATE INDEX indice_textos_grupo_ordem ON textos(grupo_id, ordem)');
      FConexao.ExecSQL(
        'INSERT INTO versoes_esquema (versao, aplicada_em) ' +
        'VALUES (1, CURRENT_TIMESTAMP)');
      FConexao.Commit;
    except
      FConexao.Rollback;
      raise;
    end;
  end;

  if VersaoAtual < 2 then
  begin
    FConexao.StartTransaction;
    try
      FConexao.ExecSQL(
        'CREATE TABLE preferencias (' +
        '  id INTEGER NOT NULL PRIMARY KEY CHECK (id = 1),' +
        '  nome_perfil TEXT NOT NULL DEFAULT ''Padrao'',' +
        '  nome_fonte TEXT NOT NULL,' +
        '  tamanho_fonte INTEGER NOT NULL,' +
        '  cor_fonte INTEGER NOT NULL,' +
        '  cor_fundo INTEGER NOT NULL,' +
        '  opacidade INTEGER NOT NULL,' +
        '  margem INTEGER NOT NULL,' +
        '  velocidade INTEGER NOT NULL,' +
        '  espelho_horizontal INTEGER NOT NULL,' +
        '  espelho_vertical INTEGER NOT NULL,' +
        '  atualizado_em TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP' +
        ')');
      FConexao.ExecSQL(
        'CREATE TABLE atalhos (' +
        '  comando INTEGER NOT NULL,' +
        '  indice INTEGER NOT NULL CHECK (indice BETWEEN 0 AND 1),' +
        '  tecla INTEGER NOT NULL,' +
        '  modificadores INTEGER NOT NULL,' +
        '  PRIMARY KEY (comando, indice)' +
        ')');
      FConexao.ExecSQL(
        'INSERT INTO preferencias (' +
        '  id, nome_fonte, tamanho_fonte, cor_fonte, cor_fundo, ' +
        '  opacidade, margem, velocidade, espelho_horizontal, ' +
        '  espelho_vertical' +
        ') VALUES (1, ''Segoe UI'', 28, 16777215, 1381653, ' +
        '100, 40, 60, 0, 0)');
      FConexao.ExecSQL(
        'INSERT INTO versoes_esquema (versao, aplicada_em) ' +
        'VALUES (2, CURRENT_TIMESTAMP)');
      FConexao.Commit;
    except
      FConexao.Rollback;
      raise;
    end;
  end;
end;

procedure TBancoDadosSQLite.ConfigurarConexao;
var
  Diretorio: string;
begin
  Diretorio := ExtractFileDir(FCaminhoArquivo);
  if not Diretorio.IsEmpty then
    ForceDirectories(Diretorio);

  FConexao.Params.Clear;
  FConexao.Params.DriverID := 'SQLite';
  FConexao.Params.Database := FCaminhoArquivo;
  FConexao.Params.Add('OpenMode=CreateUTF8');
  FConexao.Params.Add('LockingMode=Normal');
  FConexao.Params.Add('Synchronous=Normal');
  FConexao.LoginPrompt := False;
  FConexao.Connected := True;
  FConexao.ExecSQL('PRAGMA foreign_keys = ON');
end;

constructor TBancoDadosSQLite.Create(const ACaminhoArquivo: string);
begin
  inherited Create;
  FCaminhoArquivo := TPath.GetFullPath(ACaminhoArquivo);
  FDriverSQLite := TFDPhysSQLiteDriverLink.Create(nil);
  FConexao := TFDConnection.Create(nil);
  ConfigurarConexao;
  AplicarMigracoes;
end;

destructor TBancoDadosSQLite.Destroy;
begin
  FConexao.Free;
  FDriverSQLite.Free;
  inherited;
end;

function TBancoDadosSQLite.VersaoAtual: Integer;
begin
  Result := Integer(FConexao.ExecSQLScalar(
    'SELECT COALESCE(MAX(versao), 0) FROM versoes_esquema'));
end;

end.
