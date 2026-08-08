unit Testes.Integracao.Persistencia.SQLite;

interface

uses
  DUnitX.TestFramework,
  Deskprompter.Aplicacao.Comandos,
  Deskprompter.Aplicacao.Contratos.Repositorios,
  Deskprompter.Aplicacao.Preferencias,
  Deskprompter.Infraestrutura.Persistencia.SQLite.Banco;

type
  [TestFixture]
  TTestesPersistenciaSQLite = class
  private
    FBancoDados: TBancoDadosSQLite;
    FCaminhoBanco: string;
    FRepositorioGrupos: IRepositorioGrupos;
    FRepositorioPreferencias: IRepositorioPreferencias;
    FRepositorioTextos: IRepositorioTextos;
  public
    [Setup]
    procedure Preparar;

    [TearDown]
    procedure Limpar;

    [Test]
    procedure PersistirGrupoETexto;

    [Test]
    procedure ExcluirGrupoEmCascata;

    [Test]
    procedure TrocarOrdemDosGrupos;

    [Test]
    procedure MoverTextoEntreGrupos;

    [Test]
    procedure PersistirPreferenciasEAtalhos;
  end;

implementation

uses
  System.Generics.Collections,
  System.IOUtils,
  System.SysUtils,
  Deskprompter.Dominio.Grupos,
  Deskprompter.Dominio.Textos,
  Deskprompter.Infraestrutura.Persistencia.SQLite.Repositorios;

procedure TTestesPersistenciaSQLite.ExcluirGrupoEmCascata;
var
  Grupo: TGrupo;
  Textos: TObjectList<TTexto>;
  Texto: TTexto;
begin
  Grupo := TGrupo.Novo('Grupo temporario');
  try
    FRepositorioGrupos.Adicionar(Grupo);
    Texto := TTexto.Novo(Grupo.Identificador, 'Texto temporario');
    try
      FRepositorioTextos.Adicionar(Texto);
    finally
      Texto.Free;
    end;

    FRepositorioGrupos.Excluir(Grupo.Identificador);
    Textos := FRepositorioTextos.ListarDoGrupo(Grupo.Identificador);
    try
      Assert.AreEqual(0, Integer(Textos.Count));
    finally
      Textos.Free;
    end;
  finally
    Grupo.Free;
  end;
end;

procedure TTestesPersistenciaSQLite.Limpar;
begin
  FRepositorioPreferencias := nil;
  FRepositorioTextos := nil;
  FRepositorioGrupos := nil;
  FreeAndNil(FBancoDados);
  if TFile.Exists(FCaminhoBanco) then
    TFile.Delete(FCaminhoBanco);
  if TFile.Exists(FCaminhoBanco + '-shm') then
    TFile.Delete(FCaminhoBanco + '-shm');
  if TFile.Exists(FCaminhoBanco + '-wal') then
    TFile.Delete(FCaminhoBanco + '-wal');
end;

procedure TTestesPersistenciaSQLite.PersistirPreferenciasEAtalhos;
var
  Carregadas: TPreferencias;
  Conflito: TComando;
  Preferencias: TPreferencias;
begin
  Preferencias := FRepositorioPreferencias.Carregar;
  try
    Preferencias.NomeFonte := 'Arial';
    Preferencias.TamanhoFonte := 42;
    Preferencias.Margem := 88;
    Preferencias.Velocidade := 125;
    Preferencias.EspelhoHorizontal := True;
    Assert.IsTrue(Preferencias.Atalhos.Definir(
      cmdInicio,
      0,
      TAtalho.Criar(Ord('P'), [maControle, maAlt]),
      Conflito));
    FRepositorioPreferencias.Salvar(Preferencias);
  finally
    Preferencias.Free;
  end;

  Carregadas := FRepositorioPreferencias.Carregar;
  try
    Assert.AreEqual('Arial', Carregadas.NomeFonte);
    Assert.AreEqual(42, Carregadas.TamanhoFonte);
    Assert.AreEqual(88, Carregadas.Margem);
    Assert.AreEqual(125, Carregadas.Velocidade);
    Assert.IsTrue(Carregadas.EspelhoHorizontal);
    Assert.IsTrue(Carregadas.Atalhos.Atalho(
      cmdInicio,
      0).Igual(TAtalho.Criar(Ord('P'), [maControle, maAlt])));
  finally
    Carregadas.Free;
  end;
end;

procedure TTestesPersistenciaSQLite.PersistirGrupoETexto;
var
  Grupo: TGrupo;
  Grupos: TObjectList<TGrupo>;
  Texto: TTexto;
  Textos: TObjectList<TTexto>;
begin
  Grupo := TGrupo.Novo('Apresentacao', 0);
  try
    FRepositorioGrupos.Adicionar(Grupo);
    Texto := TTexto.Novo(Grupo.Identificador, 'Abertura', 0);
    try
      Texto.AlterarConteudo('Bom dia a todos');
      FRepositorioTextos.Adicionar(Texto);
      Texto.AlterarConteudo('Conteudo revisado');
      FRepositorioTextos.Atualizar(Texto);
    finally
      Texto.Free;
    end;

    Grupos := FRepositorioGrupos.Listar;
    try
      Assert.AreEqual(1, Integer(Grupos.Count));
      Assert.AreEqual('Apresentacao', Grupos[0].Nome);
    finally
      Grupos.Free;
    end;

    Textos := FRepositorioTextos.ListarDoGrupo(Grupo.Identificador);
    try
      Assert.AreEqual(1, Integer(Textos.Count));
      Assert.AreEqual('Abertura', Textos[0].Titulo);
      Assert.AreEqual('Conteudo revisado', Textos[0].Conteudo);
    finally
      Textos.Free;
    end;
  finally
    Grupo.Free;
  end;
end;

procedure TTestesPersistenciaSQLite.MoverTextoEntreGrupos;
var
  GrupoDestino: TGrupo;
  GrupoOrigem: TGrupo;
  Texto: TTexto;
  Textos: TObjectList<TTexto>;
begin
  GrupoOrigem := TGrupo.Novo('Origem', 0);
  GrupoDestino := TGrupo.Novo('Destino', 1);
  try
    FRepositorioGrupos.Adicionar(GrupoOrigem);
    FRepositorioGrupos.Adicionar(GrupoDestino);
    Texto := TTexto.Novo(GrupoOrigem.Identificador, 'Texto movido', 0);
    try
      FRepositorioTextos.Adicionar(Texto);
      Texto.MoverParaGrupo(GrupoDestino.Identificador, 0);
      FRepositorioTextos.Atualizar(Texto);
    finally
      Texto.Free;
    end;

    Textos := FRepositorioTextos.ListarDoGrupo(GrupoOrigem.Identificador);
    try
      Assert.AreEqual(0, Integer(Textos.Count));
    finally
      Textos.Free;
    end;
    Textos := FRepositorioTextos.ListarDoGrupo(GrupoDestino.Identificador);
    try
      Assert.AreEqual(1, Integer(Textos.Count));
      Assert.AreEqual('Texto movido', Textos[0].Titulo);
    finally
      Textos.Free;
    end;
  finally
    GrupoDestino.Free;
    GrupoOrigem.Free;
  end;
end;

procedure TTestesPersistenciaSQLite.Preparar;
var
  Identificador: TGUID;
  NomeArquivo: string;
begin
  CreateGUID(Identificador);
  NomeArquivo := StringReplace(
    GUIDToString(Identificador),
    '-',
    '',
    [rfReplaceAll]);
  FCaminhoBanco := TPath.Combine(
    TPath.GetTempPath,
    'deskprompter-testes-' + NomeArquivo + '.db');
  FBancoDados := TBancoDadosSQLite.Create(FCaminhoBanco);
  FRepositorioGrupos := TRepositorioGruposSQLite.Create(FBancoDados.Conexao);
  FRepositorioPreferencias :=
    TRepositorioPreferenciasSQLite.Create(FBancoDados.Conexao);
  FRepositorioTextos := TRepositorioTextosSQLite.Create(FBancoDados.Conexao);
end;

procedure TTestesPersistenciaSQLite.TrocarOrdemDosGrupos;
var
  GrupoDois: TGrupo;
  GrupoUm: TGrupo;
  Grupos: TObjectList<TGrupo>;
begin
  GrupoUm := TGrupo.Novo('Um', 0);
  GrupoDois := TGrupo.Novo('Dois', 1);
  try
    FRepositorioGrupos.Adicionar(GrupoUm);
    FRepositorioGrupos.Adicionar(GrupoDois);
    FRepositorioGrupos.TrocarOrdem(GrupoUm, GrupoDois);

    Grupos := FRepositorioGrupos.Listar;
    try
      Assert.AreEqual('Dois', Grupos[0].Nome);
      Assert.AreEqual('Um', Grupos[1].Nome);
    finally
      Grupos.Free;
    end;
  finally
    GrupoDois.Free;
    GrupoUm.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesPersistenciaSQLite);

end.
