program Deskprompter.Testes;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  DUnitX.Loggers.Console,
  DUnitX.TestFramework,
  Deskprompter.Dominio.Grupos in '..\src\Dominio\Deskprompter.Dominio.Grupos.pas',
  Deskprompter.Dominio.Textos in '..\src\Dominio\Deskprompter.Dominio.Textos.pas',
  Deskprompter.Aplicacao.Aparencia.EstadoEspelhamento in '..\src\Aplicacao\Aparencia\Deskprompter.Aplicacao.Aparencia.EstadoEspelhamento.pas',
  Deskprompter.Aplicacao.Comandos in '..\src\Aplicacao\Comandos\Deskprompter.Aplicacao.Comandos.pas',
  Deskprompter.Aplicacao.Preferencias in '..\src\Aplicacao\Preferencias\Deskprompter.Aplicacao.Preferencias.pas',
  Deskprompter.Aplicacao.Contratos.Diagnostico in '..\src\Aplicacao\Contratos\Deskprompter.Aplicacao.Contratos.Diagnostico.pas',
  Deskprompter.Aplicacao.Contratos.ProtecaoCaptura in '..\src\Aplicacao\Contratos\Deskprompter.Aplicacao.Contratos.ProtecaoCaptura.pas',
  Deskprompter.Aplicacao.Contratos.Repositorios in '..\src\Aplicacao\Contratos\Deskprompter.Aplicacao.Contratos.Repositorios.pas',
  Deskprompter.Aplicacao.Rolagem.Motor in '..\src\Aplicacao\Rolagem\Deskprompter.Aplicacao.Rolagem.Motor.pas',
  Deskprompter.Infraestrutura.Persistencia.SQLite.Banco in '..\src\Infraestrutura\Persistencia\SQLite\Deskprompter.Infraestrutura.Persistencia.SQLite.Banco.pas',
  Deskprompter.Infraestrutura.Persistencia.SQLite.Repositorios in '..\src\Infraestrutura\Persistencia\SQLite\Deskprompter.Infraestrutura.Persistencia.SQLite.Repositorios.pas',
  Deskprompter.VCL.ControladorComandos in '..\src\VCL\Deskprompter.VCL.ControladorComandos.pas',
  Deskprompter.VCL.ControladorProtecaoCaptura in '..\src\VCL\Deskprompter.VCL.ControladorProtecaoCaptura.pas',
  Deskprompter.VCL.FormularioAtalhos in '..\src\VCL\Deskprompter.VCL.FormularioAtalhos.pas' {FormularioAtalhos},
  Testes.Dominio.Grupos in 'Unitarios\Dominio\Testes.Dominio.Grupos.pas',
  Testes.Dominio.Textos in 'Unitarios\Dominio\Testes.Dominio.Textos.pas',
  Testes.Aplicacao.Aparencia.EstadoEspelhamento in 'Unitarios\Aplicacao\Testes.Aplicacao.Aparencia.EstadoEspelhamento.pas',
  Testes.Aplicacao.Comandos in 'Unitarios\Aplicacao\Testes.Aplicacao.Comandos.pas',
  Testes.Aplicacao.Rolagem.Motor in 'Unitarios\Aplicacao\Testes.Aplicacao.Rolagem.Motor.pas',
  Testes.VCL.FormularioAtalhos in 'Unitarios\VCL\Testes.VCL.FormularioAtalhos.pas',
  Testes.VCL.ControladorProtecaoCaptura in 'Unitarios\VCL\Testes.VCL.ControladorProtecaoCaptura.pas',
  Testes.Integracao.Persistencia.SQLite in 'Integracao\Persistencia\Testes.Integracao.Persistencia.SQLite.pas';

var
  Executor: ITestRunner;
  Resultados: IRunResults;
  Registrador: ITestLogger;

begin
  TDUnitX.CheckCommandLine;
  Executor := TDUnitX.CreateRunner;
  Executor.UseRTTI := True;
  Executor.FailsOnNoAsserts := True;

  Registrador := TDUnitXConsoleLogger.Create(True);
  Executor.AddLogger(Registrador);
  Resultados := Executor.Execute;

  if not Resultados.AllPassed then
    System.ExitCode := EXIT_ERRORS;
end.
