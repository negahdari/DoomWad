program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {WadForm},
  Unit2 in 'Unit2.pas' {DumpForm},
  Unit3 in 'Unit3.pas',
  Unit4 in 'Unit4.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWadForm, WadForm);
  Application.CreateForm(TDumpForm, DumpForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
