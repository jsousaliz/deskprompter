unit Deskprompter.Dominio.Textos;

interface

uses
  System.SysUtils;

type
  ETituloTextoInvalido = class(Exception);

  TTexto = class
  private
    FConteudo: string;
    FGrupoIdentificador: TGUID;
    FIdentificador: TGUID;
    FOrdem: Integer;
    FTitulo: string;
    procedure DefinirTitulo(const ATitulo: string);
  public
    constructor Create(
      const AIdentificador: TGUID;
      const AGrupoIdentificador: TGUID;
      const ATitulo, AConteudo: string;
      const AOrdem: Integer = 0);
    class function Novo(
      const AGrupoIdentificador: TGUID;
      const ATitulo: string;
      const AOrdem: Integer = 0): TTexto; static;

    procedure AlterarConteudo(const AConteudo: string);
    procedure DefinirOrdem(const AOrdem: Integer);
    procedure MoverParaGrupo(const AGrupoIdentificador: TGUID;
      const AOrdem: Integer);
    procedure Renomear(const ANovoTitulo: string);

    property Conteudo: string read FConteudo;
    property GrupoIdentificador: TGUID read FGrupoIdentificador;
    property Identificador: TGUID read FIdentificador;
    property Ordem: Integer read FOrdem;
    property Titulo: string read FTitulo;
  end;

implementation

resourcestring
  STituloTextoObrigatorio = 'O titulo do texto e obrigatorio';

procedure TTexto.AlterarConteudo(const AConteudo: string);
begin
  FConteudo := AConteudo;
end;

constructor TTexto.Create(
  const AIdentificador: TGUID;
  const AGrupoIdentificador: TGUID;
  const ATitulo, AConteudo: string;
  const AOrdem: Integer);
begin
  inherited Create;
  FIdentificador := AIdentificador;
  FGrupoIdentificador := AGrupoIdentificador;
  FConteudo := AConteudo;
  FOrdem := AOrdem;
  DefinirTitulo(ATitulo);
end;

procedure TTexto.DefinirOrdem(const AOrdem: Integer);
begin
  FOrdem := AOrdem;
end;

procedure TTexto.DefinirTitulo(const ATitulo: string);
var
  TituloNormalizado: string;
begin
  TituloNormalizado := Trim(ATitulo);
  if TituloNormalizado.IsEmpty then
    raise ETituloTextoInvalido.Create(STituloTextoObrigatorio);
  FTitulo := TituloNormalizado;
end;

procedure TTexto.MoverParaGrupo(const AGrupoIdentificador: TGUID;
  const AOrdem: Integer);
begin
  FGrupoIdentificador := AGrupoIdentificador;
  FOrdem := AOrdem;
end;

class function TTexto.Novo(
  const AGrupoIdentificador: TGUID;
  const ATitulo: string;
  const AOrdem: Integer): TTexto;
var
  Identificador: TGUID;
begin
  CreateGUID(Identificador);
  Result := TTexto.Create(
    Identificador,
    AGrupoIdentificador,
    ATitulo,
    '',
    AOrdem);
end;

procedure TTexto.Renomear(const ANovoTitulo: string);
begin
  DefinirTitulo(ANovoTitulo);
end;

end.
