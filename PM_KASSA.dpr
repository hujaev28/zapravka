program PM_KASSA;
uses
  Forms,
  Dialogs,
  fs_haridor in 'fs_haridor.pas' {s_haridor},
  fs_haridor_edit in 'fs_haridor_edit.pas' {s_haridor_edit},
  fvozvrat in 'fvozvrat.pas' {vozvrat},
  fyangilash in 'fyangilash.pas' {yangilash},
  janFX in 'janFX.pas',
  MultiTWAIN in 'MultiTWAIN.pas',
  splash in 'splash.pas' {splashForm},
  fqarzdorlik in 'fqarzdorlik.pas' {qarzdorlik},
  foshxona in 'foshxona.pas' {oshxona},
  fkafe in 'fkafe.pas' {kafe},
  fulanish_k in 'fulanish_k.pas' {ulanish_k},
  fdms in 'fdms.pas' {DMS: TDataModule},
  fkassa in 'fkassa.pas' {kassa},
  fkassa_h_edit in 'fkassa_h_edit.pas' {kassa_h_edit},
  fkassa_kv in 'fkassa_kv.pas' {kassa_kv};

{$R *.res}
var shato:string;
begin
try
  SplashForm := TSplashForm.Create(Application);splashForm.Show;
  splashForm.Update;
  Application.Initialize;
  splashForm.Hide;
  shato:='DMS';
  //try
  Application.CreateForm(TDMS, DMS);
  shato:='ulanish_k';
  Application.CreateForm(Tulanish_k, ulanish_k);
  shato:='kassa_h_edit';
  Application.CreateForm(Tkassa_h_edit, kassa_h_edit);
  shato:='s_haridor';
  Application.CreateForm(Tkassa_kv, kassa_kv);
  shato:='s_kv';
  Application.CreateForm(Ts_haridor, s_haridor);
  shato:='s_haridor_edit';
  Application.CreateForm(Ts_haridor_edit, s_haridor_edit);
  shato:='vozvrat';
  Application.CreateForm(Tvozvrat, vozvrat);
  shato:='yangilash';
  Application.CreateForm(Tyangilash, yangilash);
  shato:='splashForm';
  Application.CreateForm(TsplashForm, splashForm);
  shato:='qarzdorlik';
  Application.CreateForm(Tqarzdorlik, qarzdorlik);
  shato:='oshxona';
  Application.CreateForm(Toshxona, oshxona);
  shato:='kafe';
  Application.CreateForm(Tkafe, kafe);
  shato:='kassa';
  Application.CreateForm(Tkassa, kassa);
  //except
  //  showmessage(shato);
  //end;
  finally

  splashForm.Free;
  end;

  Application.Run;
end.
