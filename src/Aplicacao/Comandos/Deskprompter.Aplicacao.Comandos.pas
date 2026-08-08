unit Deskprompter.Aplicacao.Comandos;

interface

type
  TModificadorAtalho = (maControle, maAlt, maShift);
  TModificadoresAtalho = set of TModificadorAtalho;

  TAtalho = record
  private
    FTecla: Word;
    FModificadores: TModificadoresAtalho;
  public
    class function Criar(
      const ATecla: Word;
      const AModificadores: TModificadoresAtalho): TAtalho; static;
    class function DoCodigo(
      const ATecla: Word;
      const ACodigoModificadores: Integer): TAtalho; static;
    function CodigoModificadores: Integer;
    function Igual(const AOutro: TAtalho): Boolean;
    function Vazio: Boolean;
    property Tecla: Word read FTecla;
    property Modificadores: TModificadoresAtalho read FModificadores;
  end;

  TComando = (
    cmdReproduzirPausar,
    cmdTextoSeguinte,
    cmdTextoAnterior,
    cmdAvancarRolagem,
    cmdRecuarRolagem,
    cmdAumentarVelocidade,
    cmdDiminuirVelocidade,
    cmdAumentarFonte,
    cmdDiminuirFonte,
    cmdEspelhoHorizontal,
    cmdEspelhoVertical,
    cmdInicio,
    cmdTelaCheia,
    cmdAlternarOpcoes,
    cmdSairTelaCheia);

  TCatalogoAtalhos = class
  private
    FAtalhos: array[TComando, 0..1] of TAtalho;
    procedure DefinirPadrao(
      const AComando: TComando;
      const AIndice: Integer;
      const ATecla: Word;
      const AModificadores: TModificadoresAtalho = []);
  public
    constructor Create;
    function Atalho(
      const AComando: TComando;
      const AIndice: Integer): TAtalho;
    function Definir(
      const AComando: TComando;
      const AIndice: Integer;
      const ANovoAtalho: TAtalho;
      out AComandoConflitante: TComando): Boolean;
    procedure DefinirPersistido(
      const AComando: TComando;
      const AIndice: Integer;
      const AAtalho: TAtalho);
    function Localizar(
      const AAtalho: TAtalho;
      out AComando: TComando): Boolean;
    class function NomeComando(const AComando: TComando): string; static;
    procedure RestaurarPadroes;
  end;

implementation

const
  TECLA_ESPACO = $20;
  TECLA_PAGE_UP = $21;
  TECLA_PAGE_DOWN = $22;
  TECLA_END = $23;
  TECLA_HOME = $24;
  TECLA_ESQUERDA = $25;
  TECLA_CIMA = $26;
  TECLA_DIREITA = $27;
  TECLA_BAIXO = $28;
  TECLA_ESCAPE = $1B;
  TECLA_F5 = $74;
  TECLA_F10 = $79;
  TECLA_F11 = $7A;
  TECLA_MAIS = $BB;
  TECLA_MENOS = $BD;

function TCatalogoAtalhos.Atalho(
  const AComando: TComando;
  const AIndice: Integer): TAtalho;
begin
  if (AIndice < 0) or (AIndice > 1) then
    Exit(Default(TAtalho));
  Result := FAtalhos[AComando, AIndice];
end;

constructor TCatalogoAtalhos.Create;
begin
  inherited Create;
  RestaurarPadroes;
end;

function TCatalogoAtalhos.Definir(
  const AComando: TComando;
  const AIndice: Integer;
  const ANovoAtalho: TAtalho;
  out AComandoConflitante: TComando): Boolean;
var
  Comando: TComando;
  Indice: Integer;
begin
  Result := False;
  AComandoConflitante := Low(TComando);
  if (AIndice < 0) or (AIndice > 1) then
    Exit;

  if not ANovoAtalho.Vazio then
    for Comando := Low(TComando) to High(TComando) do
      for Indice := 0 to 1 do
        if ((Comando <> AComando) or (Indice <> AIndice)) and
           FAtalhos[Comando, Indice].Igual(ANovoAtalho) then
        begin
          AComandoConflitante := Comando;
          Exit;
        end;

  FAtalhos[AComando, AIndice] := ANovoAtalho;
  Result := True;
end;

procedure TCatalogoAtalhos.DefinirPadrao(
  const AComando: TComando;
  const AIndice: Integer;
  const ATecla: Word;
  const AModificadores: TModificadoresAtalho);
begin
  FAtalhos[AComando, AIndice] := TAtalho.Criar(
    ATecla,
    AModificadores);
end;

procedure TCatalogoAtalhos.DefinirPersistido(
  const AComando: TComando;
  const AIndice: Integer;
  const AAtalho: TAtalho);
begin
  if (AIndice >= 0) and (AIndice <= 1) then
    FAtalhos[AComando, AIndice] := AAtalho;
end;

function TCatalogoAtalhos.Localizar(
  const AAtalho: TAtalho;
  out AComando: TComando): Boolean;
var
  Comando: TComando;
  Indice: Integer;
begin
  Result := False;
  AComando := Low(TComando);
  if AAtalho.Vazio then
    Exit;

  for Comando := Low(TComando) to High(TComando) do
    for Indice := 0 to 1 do
      if FAtalhos[Comando, Indice].Igual(AAtalho) then
      begin
        AComando := Comando;
        Exit(True);
      end;
end;

class function TCatalogoAtalhos.NomeComando(
  const AComando: TComando): string;
begin
  case AComando of
    cmdReproduzirPausar: Result := 'Reproduzir/Pausar';
    cmdTextoSeguinte: Result := 'Texto seguinte';
    cmdTextoAnterior: Result := 'Texto anterior';
    cmdAvancarRolagem: Result := 'Avancar rolagem';
    cmdRecuarRolagem: Result := 'Recuar rolagem';
    cmdAumentarVelocidade: Result := 'Aumentar velocidade';
    cmdDiminuirVelocidade: Result := 'Diminuir velocidade';
    cmdAumentarFonte: Result := 'Aumentar fonte';
    cmdDiminuirFonte: Result := 'Diminuir fonte';
    cmdEspelhoHorizontal: Result := 'Espelho horizontal';
    cmdEspelhoVertical: Result := 'Espelho vertical';
    cmdInicio: Result := 'Ir ao inicio';
    cmdTelaCheia: Result := 'Tela cheia';
    cmdAlternarOpcoes: Result := 'Mostrar/Ocultar opcoes';
    cmdSairTelaCheia: Result := 'Sair da tela cheia';
  else
    Result := 'Comando';
  end;
end;

procedure TCatalogoAtalhos.RestaurarPadroes;
begin
  FillChar(FAtalhos, SizeOf(FAtalhos), 0);
  DefinirPadrao(cmdReproduzirPausar, 0, TECLA_F5);
  DefinirPadrao(cmdReproduzirPausar, 1, TECLA_ESPACO, [maControle]);
  DefinirPadrao(cmdTextoSeguinte, 0, TECLA_DIREITA, [maControle]);
  DefinirPadrao(cmdTextoAnterior, 0, TECLA_ESQUERDA, [maControle]);
  DefinirPadrao(cmdAvancarRolagem, 0, TECLA_DIREITA);
  DefinirPadrao(cmdAvancarRolagem, 1, TECLA_PAGE_DOWN);
  DefinirPadrao(cmdRecuarRolagem, 0, TECLA_ESQUERDA);
  DefinirPadrao(cmdRecuarRolagem, 1, TECLA_PAGE_UP);
  DefinirPadrao(cmdAumentarVelocidade, 0, TECLA_CIMA, [maControle]);
  DefinirPadrao(cmdDiminuirVelocidade, 0, TECLA_BAIXO, [maControle]);
  DefinirPadrao(cmdAumentarFonte, 0, TECLA_MAIS, [maControle]);
  DefinirPadrao(cmdDiminuirFonte, 0, TECLA_MENOS, [maControle]);
  DefinirPadrao(cmdEspelhoHorizontal, 0, Ord('H'), [maControle, maAlt]);
  DefinirPadrao(cmdEspelhoVertical, 0, Ord('V'), [maControle, maAlt]);
  DefinirPadrao(cmdInicio, 0, TECLA_HOME);
  DefinirPadrao(cmdTelaCheia, 0, TECLA_F11);
  DefinirPadrao(cmdAlternarOpcoes, 0, TECLA_F10);
  DefinirPadrao(cmdSairTelaCheia, 0, TECLA_ESCAPE);
end;

function TAtalho.CodigoModificadores: Integer;
begin
  Result := 0;
  if maControle in FModificadores then
    Result := Result or 1;
  if maAlt in FModificadores then
    Result := Result or 2;
  if maShift in FModificadores then
    Result := Result or 4;
end;

class function TAtalho.Criar(
  const ATecla: Word;
  const AModificadores: TModificadoresAtalho): TAtalho;
begin
  Result.FTecla := ATecla;
  Result.FModificadores := AModificadores;
end;

class function TAtalho.DoCodigo(
  const ATecla: Word;
  const ACodigoModificadores: Integer): TAtalho;
var
  Modificadores: TModificadoresAtalho;
begin
  Modificadores := [];
  if (ACodigoModificadores and 1) <> 0 then
    Include(Modificadores, maControle);
  if (ACodigoModificadores and 2) <> 0 then
    Include(Modificadores, maAlt);
  if (ACodigoModificadores and 4) <> 0 then
    Include(Modificadores, maShift);
  Result := Criar(ATecla, Modificadores);
end;

function TAtalho.Igual(const AOutro: TAtalho): Boolean;
begin
  Result := (FTecla = AOutro.FTecla) and
    (FModificadores = AOutro.FModificadores);
end;

function TAtalho.Vazio: Boolean;
begin
  Result := FTecla = 0;
end;

end.
