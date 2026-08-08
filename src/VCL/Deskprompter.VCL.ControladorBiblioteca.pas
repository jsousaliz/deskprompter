unit Deskprompter.VCL.ControladorBiblioteca;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  Vcl.ComCtrls,
  Vcl.Controls,
  Deskprompter.Aplicacao.Contratos.Repositorios,
  Deskprompter.Dominio.Grupos,
  Deskprompter.Dominio.Textos;

type
  TEventoSelecionarTexto = procedure(const ATexto: TTexto) of object;
  TEventoSalvarTexto = procedure of object;

  TControladorBiblioteca = class
  private
    FArvore: TTreeView;
    FGrupos: TObjectList<TGrupo>;
    FRepositorioGrupos: IRepositorioGrupos;
    FRepositorioTextos: IRepositorioTextos;
    FSelecionarTexto: TEventoSelecionarTexto;
    FSalvarTexto: TEventoSalvarTexto;
    FTextoApresentado: TTexto;
    FTextos: TObjectList<TTexto>;
    function TextoSelecionadoNaArvore: TTexto;
  public
    constructor Create(
      const AArvore: TTreeView;
      const ASelecionarTexto: TEventoSelecionarTexto;
      const ASalvarTexto: TEventoSalvarTexto);
    destructor Destroy; override;

    procedure AlterarSelecao(const ANo: TTreeNode);
    procedure Carregar(const ASelecionar: TGUID);
    procedure Configurar(
      const ARepositorioGrupos: IRepositorioGrupos;
      const ARepositorioTextos: IRepositorioTextos);
    procedure ExcluirSelecionado;
    function GrupoSelecionado: TGrupo;
    procedure MoverTexto(const AX, AY: Integer);
    procedure NavegarTexto(const ADeslocamento: Integer);
    procedure NovoGrupo;
    procedure NovoTexto;
    function PodeReordenarSelecionado(const ADeslocamento: Integer): Boolean;
    function PodeMoverTexto(const AX, AY: Integer): Boolean;
    procedure RenomearSelecionado;
    procedure ReordenarSelecionado(const ADeslocamento: Integer);
    procedure SalvarAntesDeAlterarSelecao;
    procedure SalvarTextoApresentado;
    function TextoApresentado: TTexto;
  end;

implementation

uses
  System.UITypes,
  Vcl.Dialogs;

procedure TControladorBiblioteca.AlterarSelecao(const ANo: TTreeNode);
var
  PrimeiroTexto: TTreeNode;
begin
  FTextoApresentado := nil;
  if Assigned(ANo) and (ANo.Level = 0) then
  begin
    PrimeiroTexto := ANo.GetFirstChild;
    if Assigned(PrimeiroTexto) and Assigned(PrimeiroTexto.Data) then
      FTextoApresentado := TTexto(PrimeiroTexto.Data);
  end;

  if Assigned(ANo) and (ANo.Level = 1) and Assigned(ANo.Data) then
    FTextoApresentado := TTexto(ANo.Data);

  FSelecionarTexto(FTextoApresentado);
end;

procedure TControladorBiblioteca.Carregar(const ASelecionar: TGUID);
var
  Grupo: TGrupo;
  ListaTextos: TObjectList<TTexto>;
  NoGrupo: TTreeNode;
  NoSelecionar: TTreeNode;
  NoTexto: TTreeNode;
  Texto: TTexto;
begin
  SalvarAntesDeAlterarSelecao;
  FArvore.Items.BeginUpdate;
  try
    FArvore.Items.Clear;
    FTextoApresentado := nil;
    FTextos.Clear;
    FGrupos.Free;
    FGrupos := FRepositorioGrupos.Listar;

    NoSelecionar := nil;
    for Grupo in FGrupos do
    begin
      NoGrupo := FArvore.Items.AddObject(nil, Grupo.Nome, Grupo);
      if IsEqualGUID(Grupo.Identificador, ASelecionar) then
        NoSelecionar := NoGrupo;

      ListaTextos := FRepositorioTextos.ListarDoGrupo(Grupo.Identificador);
      try
        while ListaTextos.Count > 0 do
        begin
          Texto := ListaTextos.Extract(ListaTextos[0]);
          FTextos.Add(Texto);
          NoTexto := FArvore.Items.AddChildObject(
            NoGrupo,
            Texto.Titulo,
            Texto);
          if IsEqualGUID(Texto.Identificador, ASelecionar) then
            NoSelecionar := NoTexto;
        end;
      finally
        ListaTextos.Free;
      end;
      NoGrupo.Expand(False);
    end;

    if not Assigned(NoSelecionar) and (FArvore.Items.Count > 0) then
    begin
      NoSelecionar := FArvore.Items[0];
      if NoSelecionar.GetFirstChild <> nil then
        NoSelecionar := NoSelecionar.GetFirstChild;
    end;
    FArvore.Selected := NoSelecionar;
    if Assigned(NoSelecionar) then
      NoSelecionar.MakeVisible;
  finally
    FArvore.Items.EndUpdate;
  end;

  if not Assigned(NoSelecionar) then
    FSelecionarTexto(nil);
end;

procedure TControladorBiblioteca.Configurar(
  const ARepositorioGrupos: IRepositorioGrupos;
  const ARepositorioTextos: IRepositorioTextos);
begin
  FRepositorioGrupos := ARepositorioGrupos;
  FRepositorioTextos := ARepositorioTextos;
end;

constructor TControladorBiblioteca.Create(
  const AArvore: TTreeView;
  const ASelecionarTexto: TEventoSelecionarTexto;
  const ASalvarTexto: TEventoSalvarTexto);
begin
  inherited Create;
  FArvore := AArvore;
  FSelecionarTexto := ASelecionarTexto;
  FSalvarTexto := ASalvarTexto;
  FGrupos := TObjectList<TGrupo>.Create(True);
  FTextos := TObjectList<TTexto>.Create(True);
end;

destructor TControladorBiblioteca.Destroy;
begin
  FTextos.Free;
  FGrupos.Free;
  inherited;
end;

procedure TControladorBiblioteca.ExcluirSelecionado;
var
  Grupo: TGrupo;
  IdentificadorSelecionado: TGUID;
  Texto: TTexto;
begin
  if MessageDlg(
    'Deseja excluir o item selecionado?',
    mtConfirmation,
    [mbYes, mbNo],
    0) <> mrYes then
    Exit;

  SalvarAntesDeAlterarSelecao;
  Texto := TextoSelecionadoNaArvore;
  if Assigned(Texto) then
  begin
    IdentificadorSelecionado := Texto.GrupoIdentificador;
    FRepositorioTextos.Excluir(Texto.Identificador);
  end
  else
  begin
    Grupo := GrupoSelecionado;
    if not Assigned(Grupo) then
      Exit;
    IdentificadorSelecionado := TGUID.Empty;
    FRepositorioGrupos.Excluir(Grupo.Identificador);
  end;
  Carregar(IdentificadorSelecionado);
end;

function TControladorBiblioteca.GrupoSelecionado: TGrupo;
var
  NoSelecionado: TTreeNode;
begin
  Result := nil;
  NoSelecionado := FArvore.Selected;
  if not Assigned(NoSelecionado) then
    Exit;
  if NoSelecionado.Level = 1 then
    NoSelecionado := NoSelecionado.Parent;
  if Assigned(NoSelecionado.Data) then
    Result := TGrupo(NoSelecionado.Data);
end;

procedure TControladorBiblioteca.MoverTexto(const AX, AY: Integer);
var
  GrupoDestino: TGrupo;
  NoDestino: TTreeNode;
  NoGrupoDestino: TTreeNode;
  NoOrigem: TTreeNode;
  Texto: TTexto;
begin
  NoOrigem := FArvore.Selected;
  NoDestino := FArvore.GetNodeAt(AX, AY);
  if not Assigned(NoOrigem) or (NoOrigem.Level <> 1) or
     not Assigned(NoDestino) then
    Exit;

  if NoDestino.Level = 0 then
    NoGrupoDestino := NoDestino
  else
    NoGrupoDestino := NoDestino.Parent;
  if NoOrigem.Parent = NoGrupoDestino then
    Exit;

  SalvarAntesDeAlterarSelecao;
  Texto := TTexto(NoOrigem.Data);
  GrupoDestino := TGrupo(NoGrupoDestino.Data);
  Texto.MoverParaGrupo(GrupoDestino.Identificador, NoGrupoDestino.Count);
  FRepositorioTextos.Atualizar(Texto);
  Carregar(Texto.Identificador);
end;

procedure TControladorBiblioteca.NavegarTexto(const ADeslocamento: Integer);
var
  Destino: TTreeNode;
  Selecionado: TTreeNode;
begin
  Selecionado := FArvore.Selected;
  if not Assigned(Selecionado) then
    Exit;

  if Selecionado.Level = 0 then
  begin
    Destino := Selecionado.GetFirstChild;
    while Assigned(Destino) and (Destino.Data <> FTextoApresentado) do
      Destino := Destino.GetNextSibling;
    if not Assigned(Destino) then
      Exit;
    if ADeslocamento > 0 then
      Destino := Destino.GetNextSibling
    else
      Destino := Destino.GetPrevSibling;
    if Assigned(Destino) then
    begin
      SalvarAntesDeAlterarSelecao;
      FTextoApresentado := TTexto(Destino.Data);
      FSelecionarTexto(FTextoApresentado);
      Destino.MakeVisible;
    end;
    Exit;
  end;

  if Selecionado.Level <> 1 then
    Exit;
  if ADeslocamento > 0 then
    Destino := Selecionado.GetNextSibling
  else
    Destino := Selecionado.GetPrevSibling;
  if Assigned(Destino) then
  begin
    FArvore.Selected := Destino;
    Destino.MakeVisible;
  end;
end;

procedure TControladorBiblioteca.NovoGrupo;
var
  Grupo: TGrupo;
  Nome: string;
begin
  Nome := 'Novo grupo';
  if not InputQuery('Novo grupo', 'Nome:', Nome) then
    Exit;

  Grupo := TGrupo.Novo(Nome, FGrupos.Count);
  try
    FRepositorioGrupos.Adicionar(Grupo);
    Carregar(Grupo.Identificador);
  finally
    Grupo.Free;
  end;
end;

procedure TControladorBiblioteca.NovoTexto;
var
  Grupo: TGrupo;
  GrupoNovo: Boolean;
  GrupoPersistido: Boolean;
  NomeGrupo: string;
  NoGrupo: TTreeNode;
  OrdemTexto: Integer;
  Texto: TTexto;
  Titulo: string;
begin
  Grupo := GrupoSelecionado;
  GrupoNovo := not Assigned(Grupo);
  GrupoPersistido := False;

  if GrupoNovo then
  begin
    NomeGrupo := 'Novo grupo';
    if not InputQuery('Novo grupo', 'Nome:', NomeGrupo) then
      Exit;
    Grupo := TGrupo.Novo(NomeGrupo, FGrupos.Count);
  end;

  try
    Titulo := 'Novo texto';
    if not InputQuery('Novo texto', 'Titulo:', Titulo) then
      Exit;

    if GrupoNovo then
      OrdemTexto := 0
    else
    begin
      NoGrupo := FArvore.Selected;
      if NoGrupo.Level = 1 then
        NoGrupo := NoGrupo.Parent;
      OrdemTexto := NoGrupo.Count;
    end;

    Texto := TTexto.Novo(Grupo.Identificador, Titulo, OrdemTexto);
    try
      if GrupoNovo then
      begin
        FRepositorioGrupos.Adicionar(Grupo);
        GrupoPersistido := True;
      end;
      try
        FRepositorioTextos.Adicionar(Texto);
      except
        if GrupoPersistido then
          FRepositorioGrupos.Excluir(Grupo.Identificador);
        raise;
      end;
      Carregar(Texto.Identificador);
    finally
      Texto.Free;
    end;
  finally
    if GrupoNovo then
      Grupo.Free;
  end;
end;

function TControladorBiblioteca.PodeReordenarSelecionado(
  const ADeslocamento: Integer): Boolean;
var
  NoSelecionado: TTreeNode;
begin
  NoSelecionado := FArvore.Selected;
  if not Assigned(NoSelecionado) then
    Exit(False);

  if ADeslocamento < 0 then
    Result := NoSelecionado.GetPrevSibling <> nil
  else
    Result := NoSelecionado.GetNextSibling <> nil;
end;

function TControladorBiblioteca.PodeMoverTexto(
  const AX, AY: Integer): Boolean;
var
  NoDestino: TTreeNode;
  NoGrupoDestino: TTreeNode;
  NoOrigem: TTreeNode;
begin
  Result := False;
  NoOrigem := FArvore.Selected;
  NoDestino := FArvore.GetNodeAt(AX, AY);
  if not Assigned(NoOrigem) or (NoOrigem.Level <> 1) or
     not Assigned(NoDestino) then
    Exit;
  if NoDestino.Level = 0 then
    NoGrupoDestino := NoDestino
  else
    NoGrupoDestino := NoDestino.Parent;
  Result := NoOrigem.Parent <> NoGrupoDestino;
end;

procedure TControladorBiblioteca.RenomearSelecionado;
var
  Grupo: TGrupo;
  Identificador: TGUID;
  Nome: string;
  Texto: TTexto;
begin
  SalvarAntesDeAlterarSelecao;
  Texto := TextoSelecionadoNaArvore;
  if Assigned(Texto) then
  begin
    Nome := Texto.Titulo;
    if not InputQuery('Renomear texto', 'Titulo:', Nome) then
      Exit;
    Texto.Renomear(Nome);
    FRepositorioTextos.Atualizar(Texto);
    Identificador := Texto.Identificador;
  end
  else
  begin
    Grupo := GrupoSelecionado;
    if not Assigned(Grupo) then
      Exit;
    Nome := Grupo.Nome;
    if not InputQuery('Renomear grupo', 'Nome:', Nome) then
      Exit;
    Grupo.Renomear(Nome);
    FRepositorioGrupos.Atualizar(Grupo);
    Identificador := Grupo.Identificador;
  end;
  Carregar(Identificador);
end;

procedure TControladorBiblioteca.ReordenarSelecionado(
  const ADeslocamento: Integer);
var
  GrupoAtual: TGrupo;
  GrupoDestino: TGrupo;
  Identificador: TGUID;
  NoDestino: TTreeNode;
  NoSelecionado: TTreeNode;
  TextoAtual: TTexto;
  TextoDestino: TTexto;
begin
  SalvarAntesDeAlterarSelecao;
  NoSelecionado := FArvore.Selected;
  if not Assigned(NoSelecionado) then
    Exit;
  if ADeslocamento < 0 then
    NoDestino := NoSelecionado.GetPrevSibling
  else
    NoDestino := NoSelecionado.GetNextSibling;
  if not Assigned(NoDestino) then
    Exit;

  if NoSelecionado.Level = 0 then
  begin
    GrupoAtual := TGrupo(NoSelecionado.Data);
    GrupoDestino := TGrupo(NoDestino.Data);
    FRepositorioGrupos.TrocarOrdem(GrupoAtual, GrupoDestino);
    Identificador := GrupoAtual.Identificador;
  end
  else
  begin
    TextoAtual := TTexto(NoSelecionado.Data);
    TextoDestino := TTexto(NoDestino.Data);
    FRepositorioTextos.TrocarOrdem(TextoAtual, TextoDestino);
    Identificador := TextoAtual.Identificador;
  end;
  Carregar(Identificador);
end;

procedure TControladorBiblioteca.SalvarAntesDeAlterarSelecao;
begin
  if Assigned(FSalvarTexto) then
    FSalvarTexto;
end;

procedure TControladorBiblioteca.SalvarTextoApresentado;
begin
  if Assigned(FTextoApresentado) and Assigned(FRepositorioTextos) then
    FRepositorioTextos.Atualizar(FTextoApresentado);
end;

function TControladorBiblioteca.TextoApresentado: TTexto;
begin
  Result := FTextoApresentado;
end;

function TControladorBiblioteca.TextoSelecionadoNaArvore: TTexto;
begin
  Result := nil;
  if Assigned(FArvore.Selected) and
     (FArvore.Selected.Level = 1) and
     Assigned(FArvore.Selected.Data) then
    Result := TTexto(FArvore.Selected.Data);
end;

end.
