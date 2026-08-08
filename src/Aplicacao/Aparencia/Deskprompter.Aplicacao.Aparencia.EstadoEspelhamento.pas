unit Deskprompter.Aplicacao.Aparencia.EstadoEspelhamento;

interface

type
  TEstadoEspelhamento = class
  private
    FHorizontal: Boolean;
    FVertical: Boolean;
  public
    procedure AlternarHorizontal;
    procedure AlternarVertical;
    procedure DefinirHorizontal(const AAtivo: Boolean);
    procedure DefinirVertical(const AAtivo: Boolean);
    function Ativo: Boolean;
    property Horizontal: Boolean read FHorizontal;
    property Vertical: Boolean read FVertical;
  end;

implementation

procedure TEstadoEspelhamento.AlternarHorizontal;
begin
  FHorizontal := not FHorizontal;
end;

procedure TEstadoEspelhamento.AlternarVertical;
begin
  FVertical := not FVertical;
end;

procedure TEstadoEspelhamento.DefinirHorizontal(const AAtivo: Boolean);
begin
  FHorizontal := AAtivo;
end;

procedure TEstadoEspelhamento.DefinirVertical(const AAtivo: Boolean);
begin
  FVertical := AAtivo;
end;

function TEstadoEspelhamento.Ativo: Boolean;
begin
  Result := FHorizontal or FVertical;
end;

end.
