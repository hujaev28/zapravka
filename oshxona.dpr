program oshxona;





uses
  Forms,
  janFX in 'janFX.pas',
  MultiTWAIN in 'MultiTWAIN.pas',
  foshxona_timer in 'foshxona_timer.pas' {oshxona_timer};

{$R *.res}

begin
try
  Application.Initialize;
  finally
  end;
  Application.CreateForm(Toshxona_timer, oshxona_timer);
  Application.Run;
end.
