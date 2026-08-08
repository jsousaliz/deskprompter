unit Testes.Dominio.Grupos;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTestesGrupo = class
  public
    [Test]
    procedure CriarComNomeValido;

    [Test]
    procedure RemoverEspacosDoNome;

    [Test]
    procedure RejeitarNomeVazio;

    [Test]
    procedure RenomearGrupo;
  end;

implementation

uses
  System.SysUtils,
  Deskprompter.Dominio.Grupos;

procedure TTestesGrupo.CriarComNomeValido;
var
  Grupo: TGrupo;
begin
  Grupo := TGrupo.Novo('Apresentacao principal');
  try
    Assert.AreEqual('Apresentacao principal', Grupo.Nome);
    Assert.AreNotEqual(TGUID.Empty, Grupo.Identificador);
  finally
    Grupo.Free;
  end;
end;

procedure TTestesGrupo.RemoverEspacosDoNome;
var
  Grupo: TGrupo;
begin
  Grupo := TGrupo.Novo('  Grupo de abertura  ');
  try
    Assert.AreEqual('Grupo de abertura', Grupo.Nome);
  finally
    Grupo.Free;
  end;
end;

procedure TTestesGrupo.RejeitarNomeVazio;
begin
  Assert.WillRaise(
    procedure
    var
      Grupo: TGrupo;
    begin
      Grupo := TGrupo.Novo('   ');
      Grupo.Free;
    end,
    ENomeGrupoInvalido);
end;

procedure TTestesGrupo.RenomearGrupo;
var
  Grupo: TGrupo;
begin
  Grupo := TGrupo.Novo('Nome original');
  try
    Grupo.Renomear('Novo nome');
    Assert.AreEqual('Novo nome', Grupo.Nome);
  finally
    Grupo.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesGrupo);

end.

