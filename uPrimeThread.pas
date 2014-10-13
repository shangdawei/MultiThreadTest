unit uPrimeThread;

interface

uses
  System.Classes, System.SysUtils, Windows, Vcl.ComCtrls;

type
  TPrimeThread = class( TThread )
    FProgressBarPos : integer;
    FNumbersToCheck : integer;
    FProgressBar : TProgressBar;
    procedure UpdateProgressBar;
  protected
    procedure Execute; override;
  public
    Tag : integer;
    constructor Create( NumbersToCheck : integer; ProgressBar : TProgressBar;
      Tag : integer );
  end;

implementation

uses
  uMainThread;

{ TPrimeThread }

constructor TPrimeThread.Create( NumbersToCheck : integer;
  ProgressBar : TProgressBar; Tag : integer );
begin
  FNumbersToCheck := NumbersToCheck;
  FProgressBar := ProgressBar;
  Self.Tag := Tag;

  inherited Create;
  FreeOnTerminate := True;
end;

procedure TPrimeThread.Execute;
var
  N, M : integer;
  IsPrime : Boolean;
begin
  NameThreadForDebugging( 'PrimeThread' );
  { Place thread code here }

  // Finding prime numbers using a very low tech approach
  for N := 2 to FNumbersToCheck - 1 do
  begin
    if Terminated then
      Exit;

    IsPrime := True;
    for M := 2 to N - 1 do
    begin
      if N mod M = 0 then
      begin
        IsPrime := FALSE;
        Break;
      end;
    end;

    FProgressBarPos := MulDiv( N, 100, FNumbersToCheck );
    Synchronize( UpdateProgressBar );
  end;
end;

procedure TPrimeThread.UpdateProgressBar;
begin
  FProgressBar.Position := FProgressBarPos;
end;

end.
