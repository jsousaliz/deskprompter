unit Deskprompter.Infraestrutura.Tempo.RelogioSistema;

interface

uses
  System.SysUtils,
  Deskprompter.Aplicacao.Contratos.Tempo;

type
  TRelogioSistema = class(TInterfacedObject, IRelogio)
  public
    function AgoraLocal: TDateTime;
    function MilissegundosMonotonicos: UInt64;
  end;

implementation

uses
  Winapi.Windows;

function TRelogioSistema.AgoraLocal: TDateTime;
begin
  Result := Now;
end;

function TRelogioSistema.MilissegundosMonotonicos: UInt64;
begin
  Result := GetTickCount64;
end;

end.
