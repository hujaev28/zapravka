program verum;

{%File 'ftoluv.~pas'}

uses
  Forms,
  fchiqim in 'fchiqim.pas' {chiqim},
  fdms in 'fdms.pas' {DMS: TDataModule},
  fkassa in 'fkassa.pas' {kassa},
  fkassa_h_edit in 'fkassa_h_edit.pas' {kassa_h_edit},
  fkirim in 'fkirim.pas' {kirim},
  fkirim_asos in 'fkirim_asos.pas' {kirim_asos},
  fotch_oborot_tovar in 'fotch_oborot_tovar.pas' {otch_oborot_tovar},
  fparolizm in 'fparolizm.pas' {parolizm},
  fqarzdorlik in 'fqarzdorlik.pas' {qarzdorlik},
  fs_asos in 'fs_asos.pas' {s_asos},
  fs_birlik in 'fs_birlik.pas' {s_birlik},
  fs_client in 'fs_client.pas' {s_client},
  fs_client_edit in 'fs_client_edit.pas' {s_client_edit},
  fs_haridor in 'fs_haridor.pas' {s_haridor},
  fs_haridor_edit in 'fs_haridor_edit.pas' {s_haridor_edit},
  fs_kat in 'fs_kat.pas' {s_kat},
  fs_kassa_edit in 'fs_kassa_edit.pas' {s_kassa_edit},
  fs_nom in 'fs_nom.pas' {s_nom},
  fs_ombor in 'fs_ombor.pas' {s_ombor},
  fs_ombor_edit in 'fs_ombor_edit.pas' {s_ombor_edit},
  fs_ostatka in 'fs_ostatka.pas' {s_ostatka},
  fs_tovar in 'fs_tovar.pas' {s_tovar},
  fs_tovar_edit in 'fs_tovar_edit.pas' {s_tovar_edit},
  fs_tovar_kirim in 'fs_tovar_kirim.pas' {s_tovar_kirim},
  fs_xodim in 'fs_xodim.pas' {s_xodim},
  fs_xodim_edit in 'fs_xodim_edit.pas' {s_xodim_edit},
  fsert in 'fsert.pas' {sertifikat},
  fsert_edit in 'fsert_edit.pas' {sert_edit},
  fsertovar_edit in 'fsertovar_edit.pas' {serttovar_edit},
  fsetup in 'fsetup.pas' {setup},
  fshartnoma in 'fshartnoma.pas' {shartnomalar},
  fulanish in 'fulanish.pas' {ulanish},
  fvetrina_edit in 'fvetrina_edit.pas' {vetrina_edit},
  fvitrina in 'fvitrina.pas' {vitrina},
  fvitrina_asos in 'fvitrina_asos.pas' {vitrina_asos},
  fvozvrat in 'fvozvrat.pas' {vozvrat},
  fyangilash in 'fyangilash.pas' {yangilash},
  fzavod in 'fzavod.pas' {zavod},
  janFX in 'janFX.pas',
  MultiTWAIN in 'MultiTWAIN.pas',
  splash in 'splash.pas' {splashForm},
  fmain in 'fmain.pas' {main},
  fkirim_edit in 'fkirim_edit.pas' {kirim_edit},
  fs_diler in 'fs_diler.pas' {s_diler},
  fs_diler_edit in 'fs_diler_edit.pas' {s_diler_edit},
  fkassa_izoh_edit in 'fkassa_izoh_edit.pas' {kassa_izoh_edit},
  fs_kassa in 'fs_kassa.pas' {s_kassa},
  fpl in 'fpl.pas' {pl},
  ftarozi in 'ftarozi.pas' {tarozi};

{$R *.res}

begin
try
  SplashForm := TSplashForm.Create(Application);splashForm.Show;
  splashForm.Update;
  Application.Initialize;
  splashForm.Hide;
  finally
  splashForm.Free;
  end;
  Application.CreateForm(TDMS, DMS);
  Application.CreateForm(Tulanish, ulanish);
  Application.CreateForm(Tchiqim, chiqim);
  Application.CreateForm(Tkassa, kassa);
  Application.CreateForm(Tkassa_h_edit, kassa_h_edit);
  Application.CreateForm(Tkirim, kirim);
  Application.CreateForm(Tkirim_asos, kirim_asos);
  Application.CreateForm(Totch_oborot_tovar, otch_oborot_tovar);
  Application.CreateForm(Tparolizm, parolizm);
  Application.CreateForm(Tqarzdorlik, qarzdorlik);
  Application.CreateForm(Ts_birlik, s_birlik);
  Application.CreateForm(Ts_asos, s_asos);
  Application.CreateForm(Ts_client, s_client);
  Application.CreateForm(Ts_client_edit, s_client_edit);
  Application.CreateForm(Ts_haridor, s_haridor);
  Application.CreateForm(Ts_haridor_edit, s_haridor_edit);
  Application.CreateForm(Ts_kat, s_kat);
  Application.CreateForm(Ts_kassa_edit, s_kassa_edit);
  Application.CreateForm(Ts_nom, s_nom);
  Application.CreateForm(Ts_ombor, s_ombor);
  Application.CreateForm(Ts_ombor_edit, s_ombor_edit);
  Application.CreateForm(Ts_ostatka, s_ostatka);
  Application.CreateForm(Ts_tovar, s_tovar);
  Application.CreateForm(Ts_tovar_edit, s_tovar_edit);
  Application.CreateForm(Ts_tovar_kirim, s_tovar_kirim);
  Application.CreateForm(Ts_xodim, s_xodim);
  Application.CreateForm(Ts_xodim_edit, s_xodim_edit);
  Application.CreateForm(Tsertifikat, sertifikat);
  Application.CreateForm(Tsert_edit, sert_edit);
  Application.CreateForm(Tserttovar_edit, serttovar_edit);
  Application.CreateForm(Tsetup, setup);
  Application.CreateForm(Tshartnomalar, shartnomalar);
  Application.CreateForm(Tvetrina_edit, vetrina_edit);
  Application.CreateForm(Tvitrina, vitrina);
  Application.CreateForm(Tvitrina_asos, vitrina_asos);
  Application.CreateForm(Tvozvrat, vozvrat);
  Application.CreateForm(Tyangilash, yangilash);
  Application.CreateForm(Tzavod, zavod);
  Application.CreateForm(TsplashForm, splashForm);
  Application.CreateForm(Tmain, main);
  Application.CreateForm(Tkirim_edit, kirim_edit);
  Application.CreateForm(Ts_diler, s_diler);
  Application.CreateForm(Ts_diler_edit, s_diler_edit);
  Application.CreateForm(Tkassa_izoh_edit, kassa_izoh_edit);
  Application.CreateForm(Ts_kassa, s_kassa);
  Application.CreateForm(Tpl, pl);
  Application.CreateForm(Ttarozi, tarozi);
  Application.Run;
end.
