unit Testes.Dominio.Textos;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTestesTexto = class
  public
    [Test]
    procedure CriarTextoValido;

    [Test]
    procedure AlterarConteudo;

    [Test]
    procedure RejeitarTituloVazio;
  end;

implementation

uses
  System.SysUtils,
  Deskprompter.Dominio.Textos;

procedure TTestesTexto.AlterarConteudo;
var
  GrupoIdentificador: TGUID;
  Texto: TTexto;
begin
  CreateGUID(GrupoIdentificador);
  Texto := TTexto.Novo(GrupoIdentificador, 'Abertura');
  try
    Texto.AlterarConteudo('Novo conteudo');
    Assert.AreEqual('Novo conteudo', Texto.Conteudo);
  finally
    Texto.Free;
  end;
end;

procedure TTestesTexto.CriarTextoValido;
var
  GrupoIdentificador: TGUID;
  Texto: TTexto;
begin
  CreateGUID(GrupoIdentificador);
  Texto := TTexto.Novo(GrupoIdentificador, '  Texto principal  ', 2);
  try
    Assert.AreEqual('Texto principal', Texto.Titulo);
    Assert.AreEqual(2, Texto.Ordem);
    Assert.AreEqual(GrupoIdentificador, Texto.GrupoIdentificador);
  finally
    Texto.Free;
  end;
end;

procedure TTestesTexto.RejeitarTituloVazio;
var
  GrupoIdentificador: TGUID;
begin
  CreateGUID(GrupoIdentificador);
  Assert.WillRaise(
    procedure
    var
      Texto: TTexto;
    begin
      Texto := TTexto.Novo(GrupoIdentificador, '   ');
      Texto.Free;
    end,
    ETituloTextoInvalido);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesTexto);

end.

