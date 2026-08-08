unit Deskprompter.VCL.FormularioAtalhos;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Grids,
  Vcl.StdCtrls,
  Deskprompter.Aplicacao.Comandos;

type
  TFormularioAtalhos = class(TForm)
    BotaoFechar: TButton;
    BotaoRestaurar: TButton;
    GradeAtalhos: TStringGrid;
    PainelInferior: TPanel;
    RotuloTitulo: TLabel;
    RotuloInstrucao: TLabel;
    procedure BotaoRestaurarClick(Sender: TObject);
    procedure FormularioCreate(Sender: TObject);
    procedure FormularioShow(Sender: TObject);
    procedure GradeAtalhosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GradeAtalhosSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
  private
    FAlterado: Boolean;
    FCatalogo: TCatalogoAtalhos;
    FComandoSelecionado: TComando;
    FIndiceSelecionado: Integer;
    FSelecaoValida: Boolean;
    procedure AplicarAtalho(const AAtalho: TAtalho);
    procedure AtualizarGrade;
  public
    procedure Configurar(const ACatalogo: TCatalogoAtalhos);
    property Alterado: Boolean read FAlterado;
  end;

implementation

{$R *.dfm}

uses
  System.SysUtils,
  System.UITypes,
  Winapi.Windows,
  Vcl.Dialogs,
  Deskprompter.VCL.ControladorComandos;

procedure TFormularioAtalhos.AplicarAtalho(const AAtalho: TAtalho);
var
  Comando: TComando;
  ComandoConflitante: TComando;
  Indice: Integer;
begin
  if not Assigned(FCatalogo) or not FSelecaoValida then
    Exit;

  Comando := FComandoSelecionado;
  Indice := FIndiceSelecionado;
  if not FCatalogo.Definir(
    Comando,
    Indice,
    AAtalho,
    ComandoConflitante) then
  begin
    MessageDlg(
      'Este atalho ja esta vinculado ao comando "' +
      TCatalogoAtalhos.NomeComando(ComandoConflitante) + '".',
      mtWarning,
      [mbOK],
      0);
    AtualizarGrade;
    Exit;
  end;

  FAlterado := True;
  AtualizarGrade;
  if Visible and GradeAtalhos.CanFocus then
    GradeAtalhos.SetFocus;
end;

procedure TFormularioAtalhos.AtualizarGrade;
var
  Comando: TComando;
  Linha: Integer;
begin
  if not Assigned(FCatalogo) then
    Exit;

  GradeAtalhos.Cells[0, 0] := 'Comando';
  GradeAtalhos.Cells[1, 0] := 'Principal';
  GradeAtalhos.Cells[2, 0] := 'Secundario';
  for Comando := Low(TComando) to High(TComando) do
  begin
    Linha := Ord(Comando) + 1;
    GradeAtalhos.Cells[0, Linha] := TCatalogoAtalhos.NomeComando(Comando);
    GradeAtalhos.Cells[1, Linha] := TControladorComandos.AtalhoParaTexto(
      FCatalogo.Atalho(Comando, 0));
    GradeAtalhos.Cells[2, Linha] := TControladorComandos.AtalhoParaTexto(
      FCatalogo.Atalho(Comando, 1));
  end;
end;

procedure TFormularioAtalhos.BotaoRestaurarClick(Sender: TObject);
begin
  if MessageDlg(
    'Restaurar todos os atalhos para os valores padrao?',
    mtConfirmation,
    [mbYes, mbNo],
    0) <> mrYes then
    Exit;

  FCatalogo.RestaurarPadroes;
  FAlterado := True;
  AtualizarGrade;
end;

procedure TFormularioAtalhos.Configurar(const ACatalogo: TCatalogoAtalhos);
begin
  FCatalogo := ACatalogo;
  FAlterado := False;
  FComandoSelecionado := cmdReproduzirPausar;
  FIndiceSelecionado := 0;
  FSelecaoValida := True;
  AtualizarGrade;
  GradeAtalhos.Col := 1;
  GradeAtalhos.Row := 1;
end;

procedure TFormularioAtalhos.FormularioCreate(Sender: TObject);
begin
  GradeAtalhos.ColWidths[0] := 320;
  GradeAtalhos.ColWidths[1] := 155;
  GradeAtalhos.ColWidths[2] := 155;
end;

procedure TFormularioAtalhos.FormularioShow(Sender: TObject);
begin
  GradeAtalhos.SetFocus;
end;

procedure TFormularioAtalhos.GradeAtalhosKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
var
  Atalho: TAtalho;
begin
  if not FSelecaoValida or TControladorComandos.TeclaModificadora(Key) then
    Exit;

  if Key = VK_TAB then
    Exit;

  if Key in [VK_DELETE, VK_BACK] then
    Atalho := Default(TAtalho)
  else
    Atalho := TControladorComandos.AtalhoDaTecla(Key, Shift);

  AplicarAtalho(Atalho);
  Key := 0;
end;

procedure TFormularioAtalhos.GradeAtalhosSelectCell(
  Sender: TObject;
  ACol, ARow: LongInt;
  var CanSelect: Boolean);
begin
  CanSelect := (ARow > 0) and (ACol > 0) and (ACol <= 2);
  if not CanSelect or not Assigned(FCatalogo) then
    Exit;

  FComandoSelecionado := TComando(ARow - 1);
  FIndiceSelecionado := ACol - 1;
  FSelecaoValida := True;
end;

end.
