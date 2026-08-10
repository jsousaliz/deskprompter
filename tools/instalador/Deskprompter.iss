#define NomeAplicativo "Deskprompter"
#ifndef VersaoAplicativo
#define VersaoAplicativo "1.1.0"
#endif
#define ExecutavelAplicativo "Deskprompter.exe"

[Setup]
AppId={{4AE3952B-DD9F-413F-A055-6A0001094686}
AppName={#NomeAplicativo}
AppVersion={#VersaoAplicativo}
AppVerName={#NomeAplicativo} {#VersaoAplicativo}
DefaultDirName={autopf}\{#NomeAplicativo}
DefaultGroupName={#NomeAplicativo}
UninstallDisplayIcon={app}\{#ExecutavelAplicativo}
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
MinVersion=10.0
PrivilegesRequired=admin
OutputDir=..\..\bin\instalador
OutputBaseFilename={#NomeAplicativo}-Setup-{#VersaoAplicativo}
SetupIconFile=..\..\src\Icones\Deskprompter.ico
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes
RestartApplications=no

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "iconearea"; Description: "Criar um atalho na área de trabalho"; GroupDescription: "Atalhos adicionais:"; Flags: unchecked

[Files]
Source: "..\..\bin\app\{#ExecutavelAplicativo}"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#NomeAplicativo}"; Filename: "{app}\{#ExecutavelAplicativo}"
Name: "{autodesktop}\{#NomeAplicativo}"; Filename: "{app}\{#ExecutavelAplicativo}"; Tasks: iconearea

[Run]
Filename: "{app}\{#ExecutavelAplicativo}"; Description: "Executar {#NomeAplicativo}"; Flags: nowait postinstall skipifsilent
