program ThreadTest;

uses
  Vcl.Forms,
  uMainThread in 'uMainThread.pas' {frmMain},
  uPrimeThread in 'uPrimeThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
