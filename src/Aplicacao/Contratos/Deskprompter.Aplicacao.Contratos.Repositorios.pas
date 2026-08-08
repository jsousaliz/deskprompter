unit Deskprompter.Aplicacao.Contratos.Repositorios;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  Deskprompter.Aplicacao.Preferencias,
  Deskprompter.Dominio.Grupos,
  Deskprompter.Dominio.Textos;

type
  IRepositorioGrupos = interface
    ['{D418679B-590E-47FE-838A-8D92873BD44D}']
    procedure Adicionar(const AGrupo: TGrupo);
    procedure Atualizar(const AGrupo: TGrupo);
    procedure Excluir(const AIdentificador: TGUID);
    function Listar: TObjectList<TGrupo>;
    procedure TrocarOrdem(const APrimeiro, ASegundo: TGrupo);
  end;

  IRepositorioTextos = interface
    ['{649A1EC5-56DD-4BB7-81BC-5F07671005F1}']
    procedure Adicionar(const ATexto: TTexto);
    procedure Atualizar(const ATexto: TTexto);
    procedure Excluir(const AIdentificador: TGUID);
    function ListarDoGrupo(
      const AGrupoIdentificador: TGUID): TObjectList<TTexto>;
    procedure TrocarOrdem(const APrimeiro, ASegundo: TTexto);
  end;

  IRepositorioPreferencias = interface
    ['{B79CD89A-11CE-49F5-A6BA-60CF82E74836}']
    function Carregar: TPreferencias;
    procedure Salvar(const APreferencias: TPreferencias);
  end;

implementation

end.
