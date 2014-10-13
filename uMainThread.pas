unit uMainThread;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmMain = class( TForm )
    btnStop : TButton;
    PB0 : TProgressBar;
    btnStart : TButton;
    edtNumberToCheck : TEdit;
    edtThreadCount : TEdit;
    PB1 : TProgressBar;
    PB3 : TProgressBar;
    PB2 : TProgressBar;
    PB7 : TProgressBar;
    PB6 : TProgressBar;
    PB5 : TProgressBar;
    PB4 : TProgressBar;
    Label1 : TLabel;
    Label2 : TLabel;
    procedure btnStartClick( Sender : TObject );
    procedure btnStopClick( Sender : TObject );
    procedure FormCreate( Sender : TObject );
    procedure PrimeThreadTerminate( Sender : TObject );
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain : TfrmMain;

implementation

{$R *.dfm}

uses
  uPrimeThread;

var
  ThreadCount : integer;
  ThreadTerminatedBitMap : integer;
  ProgressBarArray : array [ 0 .. 7 ] of TProgressBar;
  PrimeThreadArray : array [ 0 .. 7 ] of TPrimeThread;

procedure TfrmMain.btnStartClick( Sender : TObject );
var
  NumberToCheck : integer;
  I : integer;
begin
  btnStart.Enabled := False;
  btnStop.Enabled := True;

  ThreadTerminatedBitMap := 0;

  NumberToCheck := StrToInt( edtNumberToCheck.Text );
  ThreadCount := StrToInt( edtThreadCount.Text );
  if ThreadCount > 8 then
    ThreadCount := 8;

  for I := 0 to ThreadCount - 1 do
  begin
    PrimeThreadArray[ I ] := TPrimeThread.Create( NumberToCheck,
      ProgressBarArray[ I ], I );
    PrimeThreadArray[ I ].OnTerminate := PrimeThreadTerminate;
  end;
end;

procedure TfrmMain.btnStopClick( Sender : TObject );
var
  I : integer;
begin
  for I := 0 to ThreadCount - 1 do
  begin
    if Assigned( PrimeThreadArray[ I ] ) then
      PrimeThreadArray[ I ].Terminate;
  end;
end;

procedure TfrmMain.FormCreate( Sender : TObject );
begin
  ProgressBarArray[ 0 ] := PB0;
  ProgressBarArray[ 1 ] := PB1;
  ProgressBarArray[ 2 ] := PB2;
  ProgressBarArray[ 3 ] := PB3;
  ProgressBarArray[ 4 ] := PB4;
  ProgressBarArray[ 5 ] := PB5;
  ProgressBarArray[ 6 ] := PB6;
  ProgressBarArray[ 7 ] := PB7;
end;

procedure TfrmMain.PrimeThreadTerminate( Sender : TObject );
begin
  ThreadTerminatedBitMap := ThreadTerminatedBitMap or
    ( 1 shl ( Sender as TPrimeThread ).Tag );

  if ( ( 1 shl ThreadCount ) - 1 ) = ThreadTerminatedBitMap then
  begin
    btnStart.Enabled := True;
    btnStop.Enabled := False;
  end;
end;

end.
