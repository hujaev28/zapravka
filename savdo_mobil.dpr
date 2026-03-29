program savdo_mobil;





uses
  Forms,
  janFX in 'janFX.pas',
  MultiTWAIN in 'MultiTWAIN.pas',
  fsavdo_timer in 'fsavdo_timer.pas' {savdo_timer};

{$R *.res}

begin
try
  Application.Initialize;
  finally
  end;
  Application.CreateForm(Tsavdo_timer, savdo_timer);
  Application.Run;
end.
