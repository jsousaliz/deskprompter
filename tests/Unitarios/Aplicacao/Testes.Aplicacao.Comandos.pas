unit Testes.Aplicacao.Comandos;

interface

uses
  DUnitX.TestFramework,
  Deskprompter.Aplicacao.Comandos;

type
  [TestFixture]
  TTestesCatalogoAtalhos = class
  private
    FCatalogo: TCatalogoAtalhos;
  public
    [Setup]
    procedure Preparar;
    [TearDown]
    procedure Finalizar;

    [Test]
    procedure LocalizaAtalhosPadraoPrimarioESecundario;
    [Test]
    procedure RecusaConflitoEntreComandos;
    [Test]
    procedure AceitaAtalhoPersonalizado;
    [Test]
    procedure RestauraAtalhosPadrao;
  end;

implementation

procedure TTestesCatalogoAtalhos.AceitaAtalhoPersonalizado;
var
  Comando: TComando;
  Conflito: TComando;
  NovoAtalho: TAtalho;
begin
  NovoAtalho := TAtalho.Criar(Ord('P'), [maControle, maAlt]);
  Assert.IsTrue(FCatalogo.Definir(cmdInicio, 0, NovoAtalho, Conflito));
  Assert.IsTrue(FCatalogo.Localizar(NovoAtalho, Comando));
  Assert.AreEqual(Ord(cmdInicio), Ord(Comando));
end;

procedure TTestesCatalogoAtalhos.Finalizar;
begin
  FCatalogo.Free;
end;

procedure TTestesCatalogoAtalhos.LocalizaAtalhosPadraoPrimarioESecundario;
var
  Comando: TComando;
begin
  Assert.IsTrue(FCatalogo.Localizar(TAtalho.Criar($74, []), Comando));
  Assert.AreEqual(Ord(cmdReproduzirPausar), Ord(Comando));
  Assert.IsTrue(FCatalogo.Atalho(cmdReproduzirPausar, 1).Vazio);
  Assert.IsTrue(FCatalogo.Localizar(
    TAtalho.Criar($27, [maAlt]),
    Comando));
  Assert.AreEqual(Ord(cmdTextoSeguinte), Ord(Comando));
  Assert.IsTrue(FCatalogo.Localizar(
    TAtalho.Criar($26, [maAlt]),
    Comando));
  Assert.AreEqual(Ord(cmdAumentarVelocidade), Ord(Comando));
end;

procedure TTestesCatalogoAtalhos.Preparar;
begin
  FCatalogo := TCatalogoAtalhos.Create;
end;

procedure TTestesCatalogoAtalhos.RecusaConflitoEntreComandos;
var
  Conflito: TComando;
begin
  Assert.IsFalse(FCatalogo.Definir(
    cmdTextoSeguinte,
    1,
    TAtalho.Criar($74, []),
    Conflito));
  Assert.AreEqual(Ord(cmdReproduzirPausar), Ord(Conflito));
end;

procedure TTestesCatalogoAtalhos.RestauraAtalhosPadrao;
var
  Conflito: TComando;
begin
  Assert.IsTrue(FCatalogo.Definir(
    cmdInicio,
    0,
    TAtalho.Criar(Ord('P'), [maControle, maAlt]),
    Conflito));
  FCatalogo.RestaurarPadroes;
  Assert.AreEqual($24, Integer(FCatalogo.Atalho(cmdInicio, 0).Tecla));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesCatalogoAtalhos);

end.
