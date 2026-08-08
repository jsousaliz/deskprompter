unit Testes.Aplicacao.Rolagem.Motor;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTestesMotorRolagem = class
  public
    [Test]
    procedure CalcularDeslocamentoPeloTempoDecorrido;

    [Test]
    procedure PausarSemAlterarPosicao;

    [Test]
    procedure RespeitarLimiteEPararReproducao;

    [Test]
    procedure LimitarAvancoERecuoManual;

    [Test]
    procedure ReiniciarAoReproduzirNoFim;

    [Test]
    procedure RejeitarVelocidadeNegativa;
  end;

implementation

uses
  Deskprompter.Aplicacao.Rolagem.Motor;

procedure TTestesMotorRolagem.CalcularDeslocamentoPeloTempoDecorrido;
var
  Motor: TMotorRolagem;
begin
  Motor := TMotorRolagem.Create;
  try
    Motor.DefinirLimite(1000);
    Motor.DefinirVelocidade(50);
    Motor.Reproduzir(1000);
    Motor.Atualizar(3000);

    Assert.AreEqual(100.0, Motor.Posicao, 0.001);
    Assert.AreEqual(erReproduzindo, Motor.Estado);
  finally
    Motor.Free;
  end;
end;

procedure TTestesMotorRolagem.LimitarAvancoERecuoManual;
var
  Motor: TMotorRolagem;
begin
  Motor := TMotorRolagem.Create;
  try
    Motor.DefinirLimite(200);
    Motor.Avancar(500);
    Assert.AreEqual(200.0, Motor.Posicao, 0.001);

    Motor.Recuar(500);
    Assert.AreEqual(0.0, Motor.Posicao, 0.001);
  finally
    Motor.Free;
  end;
end;

procedure TTestesMotorRolagem.PausarSemAlterarPosicao;
var
  Motor: TMotorRolagem;
begin
  Motor := TMotorRolagem.Create;
  try
    Motor.DefinirLimite(1000);
    Motor.DefinirVelocidade(100);
    Motor.Reproduzir(500);
    Motor.Atualizar(1000);
    Motor.Pausar;
    Motor.Atualizar(5000);

    Assert.AreEqual(50.0, Motor.Posicao, 0.001);
    Assert.AreEqual(erPausada, Motor.Estado);
  finally
    Motor.Free;
  end;
end;

procedure TTestesMotorRolagem.ReiniciarAoReproduzirNoFim;
var
  Motor: TMotorRolagem;
begin
  Motor := TMotorRolagem.Create;
  try
    Motor.DefinirLimite(100);
    Motor.DefinirPosicao(100);
    Motor.Reproduzir(1000);

    Assert.AreEqual(0.0, Motor.Posicao, 0.001);
    Assert.AreEqual(erReproduzindo, Motor.Estado);
  finally
    Motor.Free;
  end;
end;

procedure TTestesMotorRolagem.RejeitarVelocidadeNegativa;
var
  Motor: TMotorRolagem;
begin
  Motor := TMotorRolagem.Create;
  try
    Assert.WillRaise(
      procedure
      begin
        Motor.DefinirVelocidade(-1);
      end,
      EVelocidadeRolagemInvalida);
  finally
    Motor.Free;
  end;
end;

procedure TTestesMotorRolagem.RespeitarLimiteEPararReproducao;
var
  Motor: TMotorRolagem;
begin
  Motor := TMotorRolagem.Create;
  try
    Motor.DefinirLimite(80);
    Motor.DefinirVelocidade(100);
    Motor.Reproduzir(0);
    Motor.Atualizar(1000);

    Assert.AreEqual(80.0, Motor.Posicao, 0.001);
    Assert.AreEqual(erPausada, Motor.Estado);
  finally
    Motor.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestesMotorRolagem);

end.

