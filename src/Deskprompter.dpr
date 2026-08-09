program Deskprompter;

uses
  System.SysUtils,
  Vcl.Forms,
  Deskprompter.Aplicacao.Aparencia.EstadoEspelhamento in 'Aplicacao\Aparencia\Deskprompter.Aplicacao.Aparencia.EstadoEspelhamento.pas',
  Deskprompter.Aplicacao.Comandos in 'Aplicacao\Comandos\Deskprompter.Aplicacao.Comandos.pas',
  Deskprompter.Aplicacao.Preferencias in 'Aplicacao\Preferencias\Deskprompter.Aplicacao.Preferencias.pas',
  Deskprompter.Aplicacao.Contratos.Diagnostico in 'Aplicacao\Contratos\Deskprompter.Aplicacao.Contratos.Diagnostico.pas',
  Deskprompter.Aplicacao.Contratos.PosicionamentoJanela in 'Aplicacao\Contratos\Deskprompter.Aplicacao.Contratos.PosicionamentoJanela.pas',
  Deskprompter.Aplicacao.Contratos.ProtecaoCaptura in 'Aplicacao\Contratos\Deskprompter.Aplicacao.Contratos.ProtecaoCaptura.pas',
  Deskprompter.Aplicacao.Contratos.Repositorios in 'Aplicacao\Contratos\Deskprompter.Aplicacao.Contratos.Repositorios.pas',
  Deskprompter.Aplicacao.Contratos.Tempo in 'Aplicacao\Contratos\Deskprompter.Aplicacao.Contratos.Tempo.pas',
  Deskprompter.Aplicacao.Rolagem.Motor in 'Aplicacao\Rolagem\Deskprompter.Aplicacao.Rolagem.Motor.pas',
  Deskprompter.Infraestrutura.Diagnostico.Depurador in 'Infraestrutura\Diagnostico\Deskprompter.Infraestrutura.Diagnostico.Depurador.pas',
  Deskprompter.Infraestrutura.Persistencia.SQLite.Banco in 'Infraestrutura\Persistencia\SQLite\Deskprompter.Infraestrutura.Persistencia.SQLite.Banco.pas',
  Deskprompter.Infraestrutura.Persistencia.SQLite.Repositorios in 'Infraestrutura\Persistencia\SQLite\Deskprompter.Infraestrutura.Persistencia.SQLite.Repositorios.pas',
  Deskprompter.Infraestrutura.Tempo.RelogioSistema in 'Infraestrutura\Tempo\Deskprompter.Infraestrutura.Tempo.RelogioSistema.pas',
  Deskprompter.Infraestrutura.Windows.PosicionamentoJanela in 'Infraestrutura\Windows\Deskprompter.Infraestrutura.Windows.PosicionamentoJanela.pas',
  Deskprompter.Infraestrutura.Windows.ProtecaoCaptura in 'Infraestrutura\Windows\Deskprompter.Infraestrutura.Windows.ProtecaoCaptura.pas',
  Deskprompter.Inicializacao.RaizComposicao in 'Inicializacao\Deskprompter.Inicializacao.RaizComposicao.pas',
  Deskprompter.Dominio.Textos in 'Dominio\Deskprompter.Dominio.Textos.pas',
  Deskprompter.VCL.ControladorAparencia in 'VCL\Deskprompter.VCL.ControladorAparencia.pas',
  Deskprompter.VCL.ControladorBiblioteca in 'VCL\Deskprompter.VCL.ControladorBiblioteca.pas',
  Deskprompter.VCL.ControladorComandos in 'VCL\Deskprompter.VCL.ControladorComandos.pas',
  Deskprompter.VCL.ControladorRolagem in 'VCL\Deskprompter.VCL.ControladorRolagem.pas',
  Deskprompter.VCL.ControladorSempreNoTopo in 'VCL\Deskprompter.VCL.ControladorSempreNoTopo.pas',
  Deskprompter.VCL.FormularioAtalhos in 'VCL\Deskprompter.VCL.FormularioAtalhos.pas' {FormularioAtalhos},
  Deskprompter.VCL.Icones in 'VCL\Deskprompter.VCL.Icones.pas',
  Deskprompter.VCL.FormularioPrincipal in 'VCL\Deskprompter.VCL.FormularioPrincipal.pas' {FormularioPrincipal};

{$R *.res}

var
  RaizComposicao: TRaizComposicao;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  try
    RaizComposicao := TRaizComposicao.Create;
    try
      RaizComposicao.RegistroDiagnostico.Registrar(
        nrInformacao,
        'Aplicacao Deskprompter iniciada');

      Application.CreateForm(TFormularioPrincipal, FormularioPrincipal);
      FormularioPrincipal.Configurar(
        RaizComposicao.RegistroDiagnostico,
        RaizComposicao.Relogio,
        RaizComposicao.PosicionamentoJanela,
        RaizComposicao.ProtecaoCaptura,
        RaizComposicao.RepositorioGrupos,
        RaizComposicao.RepositorioTextos,
        RaizComposicao.RepositorioPreferencias);
      Application.Run;
    finally
      RaizComposicao.Free;
    end;
  except
    on E: Exception do
    begin
      Application.ShowException(E);
      System.ExitCode := 1;
    end;
  end;
end.
