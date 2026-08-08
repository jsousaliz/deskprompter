unit Deskprompter.VCL.ControladorComandos;

interface

uses
  System.Classes,
  Vcl.Controls,
  Deskprompter.Aplicacao.Comandos;

type
  TEventoExecutarComando = procedure(const AComando: TComando) of object;

  TControladorComandos = class
  private
    FCatalogo: TCatalogoAtalhos;
    FExecutarComando: TEventoExecutarComando;
  public
    constructor Create(
      const ACatalogo: TCatalogoAtalhos;
      const AExecutarComando: TEventoExecutarComando);
    class function AtalhoDaTecla(
      const ATecla: Word;
      const AShift: TShiftState): TAtalho; static;
    class function AtalhoParaTexto(const AAtalho: TAtalho): string; static;
    function ProcessarTecla(
      const ATecla: Word;
      const AShift: TShiftState): Boolean;
    class function TeclaModificadora(const ATecla: Word): Boolean; static;
  end;

implementation

uses
  System.SysUtils,
  Winapi.Windows;

constructor TControladorComandos.Create(
  const ACatalogo: TCatalogoAtalhos;
  const AExecutarComando: TEventoExecutarComando);
begin
  inherited Create;
  FCatalogo := ACatalogo;
  FExecutarComando := AExecutarComando;
end;

class function TControladorComandos.AtalhoDaTecla(
  const ATecla: Word;
  const AShift: TShiftState): TAtalho;
var
  Modificadores: TModificadoresAtalho;
begin
  Modificadores := [];
  if ssCtrl in AShift then
    Include(Modificadores, maControle);
  if ssAlt in AShift then
    Include(Modificadores, maAlt);
  if ssShift in AShift then
    Include(Modificadores, maShift);
  Result := TAtalho.Criar(ATecla, Modificadores);
end;

class function TControladorComandos.AtalhoParaTexto(
  const AAtalho: TAtalho): string;
var
  NomeTecla: string;
begin
  if AAtalho.Vazio then
    Exit('Nao definido');

  case AAtalho.Tecla of
    VK_SPACE: NomeTecla := 'Espaco';
    VK_ESCAPE: NomeTecla := 'Esc';
    VK_PRIOR: NomeTecla := 'Page Up';
    VK_NEXT: NomeTecla := 'Page Down';
    VK_HOME: NomeTecla := 'Home';
    VK_LEFT: NomeTecla := 'Esquerda';
    VK_UP: NomeTecla := 'Cima';
    VK_RIGHT: NomeTecla := 'Direita';
    VK_DOWN: NomeTecla := 'Baixo';
    VK_F1..VK_F24: NomeTecla := 'F' + IntToStr(AAtalho.Tecla - VK_F1 + 1);
    VK_OEM_PLUS: NomeTecla := '+';
    VK_OEM_MINUS: NomeTecla := '-';
  else
    if ((AAtalho.Tecla >= Ord('A')) and (AAtalho.Tecla <= Ord('Z'))) or
       ((AAtalho.Tecla >= Ord('0')) and (AAtalho.Tecla <= Ord('9'))) then
      NomeTecla := Char(AAtalho.Tecla)
    else
      NomeTecla := 'Tecla ' + IntToStr(AAtalho.Tecla);
  end;

  Result := '';
  if maControle in AAtalho.Modificadores then
    Result := Result + 'Ctrl+';
  if maAlt in AAtalho.Modificadores then
    Result := Result + 'Alt+';
  if maShift in AAtalho.Modificadores then
    Result := Result + 'Shift+';
  Result := Result + NomeTecla;
end;

function TControladorComandos.ProcessarTecla(
  const ATecla: Word;
  const AShift: TShiftState): Boolean;
var
  Comando: TComando;
begin
  Result := FCatalogo.Localizar(AtalhoDaTecla(ATecla, AShift), Comando);
  if Result and Assigned(FExecutarComando) then
    FExecutarComando(Comando);
end;

class function TControladorComandos.TeclaModificadora(
  const ATecla: Word): Boolean;
begin
  Result := ATecla in [VK_SHIFT, VK_CONTROL, VK_MENU,
    VK_LSHIFT, VK_RSHIFT, VK_LCONTROL, VK_RCONTROL, VK_LMENU, VK_RMENU];
end;

end.
