program PROFIT_MODEL;

{%File 'ftoluv.~pas'}

uses
  Forms,
  SysUtils,
  Messages,
  Dialogs,
  fchiqim in 'fchiqim.pas' {chiqim},
  fdms in 'fdms.pas' {DMS: TDataModule},
  fkirim_asos in 'fkirim_asos.pas' {kirim_asos},
  fsmsbot in 'fsmsbot.pas' {smsbot},
  fparolizm in 'fparolizm.pas' {parolizm},
  fqarzdorlik_diler in 'fqarzdorlik_diler.pas' {qarzdorlik_diler},
  fs_asos in 'fs_asos.pas' {s_asos},
  fs_client in 'fs_client.pas' {s_client},
  fs_client_edit in 'fs_client_edit.pas' {s_client_edit},
  fs_haridor in 'fs_haridor.pas' {s_haridor},
  fs_haridor_edit in 'fs_haridor_edit.pas' {s_haridor_edit},
  fs_t_otdel in 'fs_t_otdel.pas' {s_t_otdel},
  fs_ombor_komil in 'fs_ombor_komil.pas' {s_ombor_komil},
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
  janFX in 'janFX.pas',
  MultiTWAIN in 'MultiTWAIN.pas',
  splash in 'splash.pas' {splashForm},
  fkirim_edit in 'fkirim_edit.pas' {kirim_edit},
  fs_diler in 'fs_diler.pas' {s_diler},
  fs_diler_edit in 'fs_diler_edit.pas' {s_diler_edit},
  fpl_bank in 'fpl_bank.pas' {pl_bank},
  ftarozi in 'ftarozi.pas' {tarozi},
  fs_birlik in 'fs_birlik.pas' {s_birlik},
  fs_kat in 'fs_kat.pas' {s_kat},
  fpl_click in 'fpl_click.pas' {pl_click},
  fbank_aylanma in 'fbank_aylanma.pas' {bank_aylanma},
  fqarzdorlik in 'fqarzdorlik.pas' {qarzdorlik},
  fotch_reklama in 'fotch_reklama.pas' {otch_reklama},
  fotch_brand in 'fotch_brand.pas' {otch_brand},
  foshxona in 'foshxona.pas' {oshxona},
  fotch_kam in 'fotch_kam.pas' {otch_kam},
  fs_mobil in 'fs_mobil.pas' {s_mobil},
  fportizm in 'fportizm.pas' {protizm},
  fs_kurs in 'fs_kurs.pas' {s_kurs},
  fs_ombor in 'fs_ombor.pas' {s_ombor},
  fmain in 'fmain.pas' {main},
  fpl in 'fpl.pas' {pl},
  fyukla in 'fyukla.pas' {Yukla},
  fkassa_aylanma in 'fkassa_aylanma.pas' {kassa_aylanma},
  fclick_aylanma in 'fclick_aylanma.pas' {click_aylanma},
  fs_x_tur in 'fs_x_tur.pas' {s_x_tur},
  fjamiaylanma in 'fjamiaylanma.pas' {jamiaylanma},
  fotch_oborot_tovar in 'fotch_oborot_tovar.pas' {otch_oborot_tovar},
  fhato in 'fhato.pas' {hatolar},
  fotch_xarajat in 'fotch_xarajat.pas' {otch_xarajat},
  fNazorat in 'fNazorat.pas' {Nazorat},
  fkirim in 'fkirim.pas' {kirim},
  fkirimh in 'fkirimh.pas' {kirimh},
  fs_papka in 'fs_papka.pas' {s_papka};

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
  Application.CreateForm(Tmain, main);
  Application.CreateForm(Tchiqim, chiqim);
  Application.CreateForm(Tkirim_asos, kirim_asos);
  Application.CreateForm(Tsmsbot, smsbot);
  Application.CreateForm(Tparolizm, parolizm);
  Application.CreateForm(Tqarzdorlik_diler, qarzdorlik_diler);
  Application.CreateForm(Ts_asos, s_asos);
  Application.CreateForm(Ts_client, s_client);
  Application.CreateForm(Ts_client_edit, s_client_edit);
  Application.CreateForm(Ts_haridor, s_haridor);
  Application.CreateForm(Ts_haridor_edit, s_haridor_edit);
  Application.CreateForm(Ts_t_otdel, s_t_otdel);
  Application.CreateForm(Ts_ombor_komil, s_ombor_komil);
  Application.CreateForm(Ts_ostatka, s_ostatka);
  Application.CreateForm(Ts_tovar, s_tovar);
  Application.CreateForm(TNazorat, Nazorat);
  Application.CreateForm(Tkirim_edit, kirim_edit);
  Application.CreateForm(Tkirim, kirim);
  Application.CreateForm(Tkirimh, kirimh);
  Application.CreateForm(Ts_papka, s_papka);
  try
  Application.CreateForm(Ts_tovar_edit, s_tovar_edit);
  except
   ShowMessage('s_tovar_edit');
  end;
  //try
  Application.CreateForm(Ts_tovar_kirim, s_tovar_kirim);
  //except
  // ShowMessage('s_tovar_kirim');
  //end;
  Application.CreateForm(Ts_xodim, s_xodim);
  Application.CreateForm(Ts_xodim_edit, s_xodim_edit);
  Application.CreateForm(Tsertifikat, sertifikat);
  Application.CreateForm(Tsert_edit, sert_edit);
  Application.CreateForm(Tserttovar_edit, serttovar_edit);
  Application.CreateForm(Tsetup, setup);
  Application.CreateForm(Tshartnomalar, shartnomalar);
  try
  Application.CreateForm(Ts_diler, s_diler);
  except
   ShowMessage('s_diler');
  end;
  Application.CreateForm(Ts_diler_edit, s_diler_edit);
  Application.CreateForm(Tpl_bank, pl_bank);
  Application.CreateForm(Ttarozi, tarozi);
  Application.CreateForm(Ts_birlik, s_birlik);
  Application.CreateForm(Ts_kat, s_kat);
  Application.CreateForm(Tpl_click, pl_click);
  Application.CreateForm(Tbank_aylanma, bank_aylanma);
  Application.CreateForm(Tqarzdorlik, qarzdorlik);
  Application.CreateForm(Totch_reklama, otch_reklama);
  Application.CreateForm(Totch_brand, otch_brand);
  Application.CreateForm(Toshxona, oshxona);
  Application.CreateForm(Totch_kam, otch_kam);
  Application.CreateForm(Ts_papka, s_papka);
  Application.CreateForm(Ts_mobil, s_mobil);
  Application.CreateForm(Tprotizm, protizm);
  Application.CreateForm(Ts_kurs, s_kurs);
  Application.CreateForm(Ts_ombor, s_ombor);
  Application.CreateForm(Tpl, pl);
  Application.CreateForm(TYukla, Yukla);
  Application.CreateForm(Tkassa_aylanma, kassa_aylanma);
  Application.CreateForm(Tclick_aylanma, click_aylanma);
  Application.CreateForm(Ts_x_tur, s_x_tur);
  Application.CreateForm(Tjamiaylanma, jamiaylanma);
  Application.CreateForm(Totch_oborot_tovar, otch_oborot_tovar);
  Application.CreateForm(Thatolar, hatolar);
  Application.CreateForm(Totch_xarajat, otch_xarajat);
  Application.Run;
end.
