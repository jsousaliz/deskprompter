unit Deskprompter.Infraestrutura.Diagnostico.Depurador;

interface

uses
  Deskprompter.Aplicacao.Contratos.Diagnostico;

type
  TRegistroDiagnosticoDepurador = class(
    TInterfacedObject,
    IRegistroDiagnostico)
  private
    function NomeNivel(const ANivel: TNivelRegistro): string;
  public
    procedure Registrar(
      const ANivel: TNivelRegistro;
      const AMensagem: string);
  end;

implementation

uses
  Winapi.Windows,
  System.SysUtils;

function TRegistroDiagnosticoDepurador.NomeNivel(
  const ANivel: TNivelRegistro): string;
begin
  case ANivel of
    nrInformacao:
      Result := 'INFORMACAO';
    nrAviso:
      Result := 'AVISO';
    nrErro:
      Result := 'ERRO';
  else
    Result := 'DESCONHECIDO';
  end;
end;

procedure TRegistroDiagnosticoDepurador.Registrar(
  const ANivel: TNivelRegistro;
  const AMensagem: string);
var
  Linha: string;
begin
  Linha := Format('[Deskprompter] [%s] %s', [NomeNivel(ANivel), AMensagem]);
  OutputDebugString(PChar(Linha));
end;

end.

