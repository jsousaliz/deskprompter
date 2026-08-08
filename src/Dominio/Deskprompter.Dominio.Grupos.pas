unit Deskprompter.Dominio.Grupos;

interface

uses
  System.SysUtils;

type
  ENomeGrupoInvalido = class(Exception);

  TGrupo = class
  private
    FIdentificador: TGUID;
    FNome: string;
    FOrdem: Integer;
    procedure DefinirNome(const ANome: string);
  public
    constructor Create(const AIdentificador: TGUID; const ANome: string;
      const AOrdem: Integer = 0);
    class function Novo(const ANome: string;
      const AOrdem: Integer = 0): TGrupo; static;

    procedure DefinirOrdem(const AOrdem: Integer);
    procedure Renomear(const ANovoNome: string);

    property Identificador: TGUID read FIdentificador;
    property Nome: string read FNome;
    property Ordem: Integer read FOrdem;
  end;

implementation

resourcestring
  SNomeGrupoObrigatorio = 'O nome do grupo e obrigatorio';

constructor TGrupo.Create(const AIdentificador: TGUID; const ANome: string;
  const AOrdem: Integer);
begin
  inherited Create;
  FIdentificador := AIdentificador;
  FOrdem := AOrdem;
  DefinirNome(ANome);
end;

procedure TGrupo.DefinirOrdem(const AOrdem: Integer);
begin
  FOrdem := AOrdem;
end;

procedure TGrupo.DefinirNome(const ANome: string);
var
  NomeNormalizado: string;
begin
  NomeNormalizado := Trim(ANome);
  if NomeNormalizado.IsEmpty then
    raise ENomeGrupoInvalido.Create(SNomeGrupoObrigatorio);

  FNome := NomeNormalizado;
end;

class function TGrupo.Novo(const ANome: string;
  const AOrdem: Integer): TGrupo;
var
  Identificador: TGUID;
begin
  CreateGUID(Identificador);
  Result := TGrupo.Create(Identificador, ANome, AOrdem);
end;

procedure TGrupo.Renomear(const ANovoNome: string);
begin
  DefinirNome(ANovoNome);
end;

end.
