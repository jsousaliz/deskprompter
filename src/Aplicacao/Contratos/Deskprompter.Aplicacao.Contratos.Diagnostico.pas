unit Deskprompter.Aplicacao.Contratos.Diagnostico;

interface

type
  TNivelRegistro = (
    nrInformacao,
    nrAviso,
    nrErro
  );

  IRegistroDiagnostico = interface
    ['{5EB9DB90-C31C-4E1F-A7EB-3F34E56A5EB2}']
    procedure Registrar(
      const ANivel: TNivelRegistro;
      const AMensagem: string);
  end;

implementation

end.

