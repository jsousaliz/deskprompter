unit Deskprompter.Aplicacao.Contratos.Tempo;

interface

uses
  System.SysUtils;

type
  IRelogio = interface
    ['{F96C9145-A1A5-4027-A520-A67A7399AE66}']
    function AgoraLocal: TDateTime;
    function MilissegundosMonotonicos: UInt64;
  end;

implementation

end.
