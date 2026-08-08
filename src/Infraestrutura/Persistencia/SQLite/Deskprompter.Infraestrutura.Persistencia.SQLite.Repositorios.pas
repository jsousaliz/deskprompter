unit Deskprompter.Infraestrutura.Persistencia.SQLite.Repositorios;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  Deskprompter.Aplicacao.Contratos.Repositorios,
  Deskprompter.Aplicacao.Comandos,
  Deskprompter.Aplicacao.Preferencias,
  Deskprompter.Dominio.Grupos,
  Deskprompter.Dominio.Textos;

type
  TRepositorioGruposSQLite = class(TInterfacedObject, IRepositorioGrupos)
  private
    FConexao: TFDConnection;
  public
    constructor Create(const AConexao: TFDConnection);
    procedure Adicionar(const AGrupo: TGrupo);
    procedure Atualizar(const AGrupo: TGrupo);
    procedure Excluir(const AIdentificador: TGUID);
    function Listar: TObjectList<TGrupo>;
    procedure TrocarOrdem(const APrimeiro, ASegundo: TGrupo);
  end;

  TRepositorioTextosSQLite = class(TInterfacedObject, IRepositorioTextos)
  private
    FConexao: TFDConnection;
  public
    constructor Create(const AConexao: TFDConnection);
    procedure Adicionar(const ATexto: TTexto);
    procedure Atualizar(const ATexto: TTexto);
    procedure Excluir(const AIdentificador: TGUID);
    function ListarDoGrupo(
      const AGrupoIdentificador: TGUID): TObjectList<TTexto>;
    procedure TrocarOrdem(const APrimeiro, ASegundo: TTexto);
  end;

  TRepositorioPreferenciasSQLite = class(
    TInterfacedObject,
    IRepositorioPreferencias)
  private
    FConexao: TFDConnection;
  public
    constructor Create(const AConexao: TFDConnection);
    function Carregar: TPreferencias;
    procedure Salvar(const APreferencias: TPreferencias);
  end;

implementation

function GuidTexto(const AIdentificador: TGUID): string;
begin
  Result := GUIDToString(AIdentificador);
end;

procedure ExecutarTrocaOrdem(
  const AConexao: TFDConnection;
  const ATabela: string;
  const APrimeiroIdentificador: TGUID;
  const APrimeiraOrdem: Integer;
  const ASegundoIdentificador: TGUID;
  const ASegundaOrdem: Integer);
var
  Consulta: TFDQuery;
begin
  AConexao.StartTransaction;
  try
    Consulta := TFDQuery.Create(nil);
    try
      Consulta.Connection := AConexao;
      Consulta.SQL.Text := Format(
        'UPDATE %s SET ordem = :ordem, atualizado_em = CURRENT_TIMESTAMP ' +
        'WHERE id = :id',
        [ATabela]);

      Consulta.ParamByName('ordem').AsInteger := ASegundaOrdem;
      Consulta.ParamByName('id').AsString := GuidTexto(APrimeiroIdentificador);
      Consulta.ExecSQL;

      Consulta.ParamByName('ordem').AsInteger := APrimeiraOrdem;
      Consulta.ParamByName('id').AsString := GuidTexto(ASegundoIdentificador);
      Consulta.ExecSQL;
    finally
      Consulta.Free;
    end;
    AConexao.Commit;
  except
    AConexao.Rollback;
    raise;
  end;
end;

procedure TRepositorioGruposSQLite.Adicionar(const AGrupo: TGrupo);
var
  Consulta: TFDQuery;
begin
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := FConexao;
    Consulta.SQL.Text :=
      'INSERT INTO grupos (id, nome, ordem) VALUES (:id, :nome, :ordem)';
    Consulta.ParamByName('id').AsString := GuidTexto(AGrupo.Identificador);
    Consulta.ParamByName('nome').AsWideString := AGrupo.Nome;
    Consulta.ParamByName('ordem').AsInteger := AGrupo.Ordem;
    Consulta.ExecSQL;
  finally
    Consulta.Free;
  end;
end;

procedure TRepositorioGruposSQLite.Atualizar(const AGrupo: TGrupo);
var
  Consulta: TFDQuery;
begin
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := FConexao;
    Consulta.SQL.Text :=
      'UPDATE grupos SET nome = :nome, ordem = :ordem, ' +
      'atualizado_em = CURRENT_TIMESTAMP WHERE id = :id';
    Consulta.ParamByName('nome').AsWideString := AGrupo.Nome;
    Consulta.ParamByName('ordem').AsInteger := AGrupo.Ordem;
    Consulta.ParamByName('id').AsString := GuidTexto(AGrupo.Identificador);
    Consulta.ExecSQL;
  finally
    Consulta.Free;
  end;
end;

constructor TRepositorioGruposSQLite.Create(const AConexao: TFDConnection);
begin
  inherited Create;
  FConexao := AConexao;
end;

procedure TRepositorioGruposSQLite.Excluir(const AIdentificador: TGUID);
begin
  FConexao.ExecSQL(
    'DELETE FROM grupos WHERE id = ?',
    [GuidTexto(AIdentificador)]);
end;

function TRepositorioGruposSQLite.Listar: TObjectList<TGrupo>;
var
  Consulta: TFDQuery;
begin
  Result := TObjectList<TGrupo>.Create(True);
  Consulta := TFDQuery.Create(nil);
  try
    try
      Consulta.Connection := FConexao;
      Consulta.SQL.Text :=
        'SELECT id, nome, ordem FROM grupos ORDER BY ordem, nome';
      Consulta.Open;
      while not Consulta.Eof do
      begin
        Result.Add(TGrupo.Create(
          StringToGUID(Consulta.FieldByName('id').AsString),
          Consulta.FieldByName('nome').AsWideString,
          Consulta.FieldByName('ordem').AsInteger));
        Consulta.Next;
      end;
    except
      Result.Free;
      raise;
    end;
  finally
    Consulta.Free;
  end;
end;

procedure TRepositorioGruposSQLite.TrocarOrdem(
  const APrimeiro, ASegundo: TGrupo);
begin
  ExecutarTrocaOrdem(
    FConexao,
    'grupos',
    APrimeiro.Identificador,
    APrimeiro.Ordem,
    ASegundo.Identificador,
    ASegundo.Ordem);
end;

function TRepositorioPreferenciasSQLite.Carregar: TPreferencias;
var
  Atalho: TAtalho;
  Comando: Integer;
  Consulta: TFDQuery;
  Indice: Integer;
begin
  Result := TPreferencias.Create;
  Consulta := TFDQuery.Create(nil);
  try
    try
      Consulta.Connection := FConexao;
      Consulta.SQL.Text :=
        'SELECT nome_fonte, tamanho_fonte, cor_fonte, cor_fundo, ' +
        'opacidade, margem, velocidade, espelho_horizontal, ' +
        'espelho_vertical FROM preferencias WHERE id = 1';
      Consulta.Open;
      if not Consulta.Eof then
      begin
        Result.NomeFonte := Consulta.FieldByName('nome_fonte').AsWideString;
        Result.TamanhoFonte :=
          Consulta.FieldByName('tamanho_fonte').AsInteger;
        Result.CorFonte := Consulta.FieldByName('cor_fonte').AsInteger;
        Result.CorFundo := Consulta.FieldByName('cor_fundo').AsInteger;
        Result.Opacidade := Consulta.FieldByName('opacidade').AsInteger;
        Result.Margem := Consulta.FieldByName('margem').AsInteger;
        Result.Velocidade := Consulta.FieldByName('velocidade').AsInteger;
        Result.EspelhoHorizontal :=
          Consulta.FieldByName('espelho_horizontal').AsInteger <> 0;
        Result.EspelhoVertical :=
          Consulta.FieldByName('espelho_vertical').AsInteger <> 0;
      end;

      Consulta.Close;
      Consulta.SQL.Text :=
        'SELECT comando, indice, tecla, modificadores FROM atalhos ' +
        'ORDER BY comando, indice';
      Consulta.Open;
      while not Consulta.Eof do
      begin
        Comando := Consulta.FieldByName('comando').AsInteger;
        Indice := Consulta.FieldByName('indice').AsInteger;
        if (Comando >= Ord(Low(TComando))) and
           (Comando <= Ord(High(TComando))) and
           (Indice >= 0) and (Indice <= 1) then
        begin
          Atalho := TAtalho.DoCodigo(
            Consulta.FieldByName('tecla').AsInteger,
            Consulta.FieldByName('modificadores').AsInteger);
          Result.Atalhos.DefinirPersistido(
            TComando(Comando),
            Indice,
            Atalho);
        end;
        Consulta.Next;
      end;
    except
      Result.Free;
      raise;
    end;
  finally
    Consulta.Free;
  end;
end;

constructor TRepositorioPreferenciasSQLite.Create(
  const AConexao: TFDConnection);
begin
  inherited Create;
  FConexao := AConexao;
end;

procedure TRepositorioPreferenciasSQLite.Salvar(
  const APreferencias: TPreferencias);
var
  Atalho: TAtalho;
  Comando: TComando;
  Consulta: TFDQuery;
  Indice: Integer;
begin
  FConexao.StartTransaction;
  try
    Consulta := TFDQuery.Create(nil);
    try
      Consulta.Connection := FConexao;
      Consulta.SQL.Text :=
        'UPDATE preferencias SET nome_fonte = :nome_fonte, ' +
        'tamanho_fonte = :tamanho_fonte, cor_fonte = :cor_fonte, ' +
        'cor_fundo = :cor_fundo, opacidade = :opacidade, ' +
        'margem = :margem, velocidade = :velocidade, ' +
        'espelho_horizontal = :espelho_horizontal, ' +
        'espelho_vertical = :espelho_vertical, ' +
        'atualizado_em = CURRENT_TIMESTAMP WHERE id = 1';
      Consulta.ParamByName('nome_fonte').AsWideString :=
        APreferencias.NomeFonte;
      Consulta.ParamByName('tamanho_fonte').AsInteger :=
        APreferencias.TamanhoFonte;
      Consulta.ParamByName('cor_fonte').AsInteger := APreferencias.CorFonte;
      Consulta.ParamByName('cor_fundo').AsInteger := APreferencias.CorFundo;
      Consulta.ParamByName('opacidade').AsInteger := APreferencias.Opacidade;
      Consulta.ParamByName('margem').AsInteger := APreferencias.Margem;
      Consulta.ParamByName('velocidade').AsInteger := APreferencias.Velocidade;
      Consulta.ParamByName('espelho_horizontal').AsInteger :=
        Ord(APreferencias.EspelhoHorizontal);
      Consulta.ParamByName('espelho_vertical').AsInteger :=
        Ord(APreferencias.EspelhoVertical);
      Consulta.ExecSQL;

      FConexao.ExecSQL('DELETE FROM atalhos');
      Consulta.SQL.Text :=
        'INSERT INTO atalhos (comando, indice, tecla, modificadores) ' +
        'VALUES (:comando, :indice, :tecla, :modificadores)';
      for Comando := Low(TComando) to High(TComando) do
        for Indice := 0 to 1 do
        begin
          Atalho := APreferencias.Atalhos.Atalho(Comando, Indice);
          Consulta.ParamByName('comando').AsInteger := Ord(Comando);
          Consulta.ParamByName('indice').AsInteger := Indice;
          Consulta.ParamByName('tecla').AsInteger := Atalho.Tecla;
          Consulta.ParamByName('modificadores').AsInteger :=
            Atalho.CodigoModificadores;
          Consulta.ExecSQL;
        end;
    finally
      Consulta.Free;
    end;
    FConexao.Commit;
  except
    FConexao.Rollback;
    raise;
  end;
end;

procedure TRepositorioTextosSQLite.Adicionar(const ATexto: TTexto);
var
  Consulta: TFDQuery;
begin
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := FConexao;
    Consulta.SQL.Text :=
      'INSERT INTO textos (id, grupo_id, titulo, conteudo, ordem) ' +
      'VALUES (:id, :grupo_id, :titulo, :conteudo, :ordem)';
    Consulta.ParamByName('id').AsString := GuidTexto(ATexto.Identificador);
    Consulta.ParamByName('grupo_id').AsString :=
      GuidTexto(ATexto.GrupoIdentificador);
    Consulta.ParamByName('titulo').AsWideString := ATexto.Titulo;
    Consulta.ParamByName('conteudo').AsWideString := ATexto.Conteudo;
    Consulta.ParamByName('ordem').AsInteger := ATexto.Ordem;
    Consulta.ExecSQL;
  finally
    Consulta.Free;
  end;
end;

procedure TRepositorioTextosSQLite.Atualizar(const ATexto: TTexto);
var
  Consulta: TFDQuery;
begin
  Consulta := TFDQuery.Create(nil);
  try
    Consulta.Connection := FConexao;
    Consulta.SQL.Text :=
      'UPDATE textos SET grupo_id = :grupo_id, titulo = :titulo, conteudo = :conteudo, ' +
      'ordem = :ordem, atualizado_em = CURRENT_TIMESTAMP WHERE id = :id';
    Consulta.ParamByName('grupo_id').AsString :=
      GuidTexto(ATexto.GrupoIdentificador);
    Consulta.ParamByName('titulo').AsWideString := ATexto.Titulo;
    Consulta.ParamByName('conteudo').AsWideString := ATexto.Conteudo;
    Consulta.ParamByName('ordem').AsInteger := ATexto.Ordem;
    Consulta.ParamByName('id').AsString := GuidTexto(ATexto.Identificador);
    Consulta.ExecSQL;
  finally
    Consulta.Free;
  end;
end;

constructor TRepositorioTextosSQLite.Create(const AConexao: TFDConnection);
begin
  inherited Create;
  FConexao := AConexao;
end;

procedure TRepositorioTextosSQLite.Excluir(const AIdentificador: TGUID);
begin
  FConexao.ExecSQL(
    'DELETE FROM textos WHERE id = ?',
    [GuidTexto(AIdentificador)]);
end;

function TRepositorioTextosSQLite.ListarDoGrupo(
  const AGrupoIdentificador: TGUID): TObjectList<TTexto>;
var
  Consulta: TFDQuery;
begin
  Result := TObjectList<TTexto>.Create(True);
  Consulta := TFDQuery.Create(nil);
  try
    try
      Consulta.Connection := FConexao;
      Consulta.SQL.Text :=
        'SELECT id, grupo_id, titulo, conteudo, ordem FROM textos ' +
        'WHERE grupo_id = :grupo_id ORDER BY ordem, titulo';
      Consulta.ParamByName('grupo_id').AsString := GuidTexto(AGrupoIdentificador);
      Consulta.Open;
      while not Consulta.Eof do
      begin
        Result.Add(TTexto.Create(
          StringToGUID(Consulta.FieldByName('id').AsString),
          StringToGUID(Consulta.FieldByName('grupo_id').AsString),
          Consulta.FieldByName('titulo').AsWideString,
          Consulta.FieldByName('conteudo').AsWideString,
          Consulta.FieldByName('ordem').AsInteger));
        Consulta.Next;
      end;
    except
      Result.Free;
      raise;
    end;
  finally
    Consulta.Free;
  end;
end;

procedure TRepositorioTextosSQLite.TrocarOrdem(
  const APrimeiro, ASegundo: TTexto);
begin
  ExecutarTrocaOrdem(
    FConexao,
    'textos',
    APrimeiro.Identificador,
    APrimeiro.Ordem,
    ASegundo.Identificador,
    ASegundo.Ordem);
end;

end.
