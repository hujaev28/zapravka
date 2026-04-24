unit fmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, RzButton, Menus,
  ComObj, IniFiles,RzSplit, RzLabel, RzStatus, ImgList, jpeg, DB, ExtCtrls,
  RzPanel, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  Tmain = class(TForm)
    MainMenu2: TMainMenu;
    Button1: TButton;
    s_zavod: TZQuery;
    Spavochniklar1: TMenuItem;
    tovarlarbazasi: TMenuItem;
    Ishlabchiqaruvchilar1: TMenuItem;
    Sotuvchilar1: TMenuItem;
    Kassalar1: TMenuItem;
    Korxona1: TMenuItem;
    Moletkazuvchilar1: TMenuItem;
    Haridorlar1: TMenuItem;
    Qoshimchalar1: TMenuItem;
    Buxgalteriya1: TMenuItem;
    Buxgalteriya2: TMenuItem;
    Sertifikatlar1: TMenuItem;
    Qarzdorlik1: TMenuItem;
    olovnomalar1: TMenuItem;
    Omborxona1: TMenuItem;
    Kirimqilish1: TMenuItem;
    sotuvgaberish1: TMenuItem;
    Ombordagitovarlar1: TMenuItem;
    Qaytaribolish1: TMenuItem;
    Hisobotlar1: TMenuItem;
    Kassaamaliyoti1: TMenuItem;
    ovaraylanmasi1: TMenuItem;
    Yaroqsiztovarlar1: TMenuItem;
    Servis1: TMenuItem;
    Sozlash1: TMenuItem;
    Parolniozgartirish1: TMenuItem;
    arozi1: TMenuItem;
    Chiqish1: TMenuItem;
    Banktolovnomalari1: TMenuItem;
    Dilerqarzdorligi1: TMenuItem;
    Kassapulaylanmasi1: TMenuItem;
    Bankpulaylanmasi1: TMenuItem;
    Xarajatlar1: TMenuItem;
    Hatoliklar1: TMenuItem;
    Dollarkursi1: TMenuItem;
    Papka1: TMenuItem;
    Ozgarishlar1: TMenuItem;
    T1: TMenuItem;
    R1: TMenuItem;
    s_izm: TZQuery;
    C1: TMenuItem;
    Kassapulaylanmasi2: TMenuItem;
    S1: TMenuItem;
    K1: TMenuItem;
    Q1: TMenuItem;
    mnazorat: TMenuItem;
    Memom: TMemo;
    Yuklabolish1: TMenuItem;
    Yuklabolish2: TMenuItem;
    X1: TMenuItem;
    kirimtovarlarbrand1: TMenuItem;
    SMSbotlarjonatish1: TMenuItem;
    kabina1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grkassaItems0Click(Sender: TObject);
    procedure tovarlarbazasiClick(Sender: TObject);
    procedure Ishlabchiqaruvchilar1Click(Sender: TObject);
    procedure Sotuvchilar1Click(Sender: TObject);
    procedure Kassalar1Click(Sender: TObject);
    procedure Korxona1Click(Sender: TObject);
    procedure Moletkazuvchilar1Click(Sender: TObject);
    procedure Haridorlar1Click(Sender: TObject);
    procedure Qoshimchalar1Click(Sender: TObject);
    procedure Buxgalteriya2Click(Sender: TObject);
    procedure Sertifikatlar1Click(Sender: TObject);
    procedure Qarzdorlik1Click(Sender: TObject);
    procedure olovnomalar1Click(Sender: TObject);
    procedure Kirimqilish1Click(Sender: TObject);
    procedure sotuvgaberish1Click(Sender: TObject);
    procedure Ombordagitovarlar1Click(Sender: TObject);
    procedure Qaytaribolish1Click(Sender: TObject);
    procedure Kassaamaliyoti1Click(Sender: TObject);
    procedure ovaraylanmasi1Click(Sender: TObject);
    procedure Sozlash1Click(Sender: TObject);
    procedure Parolniozgartirish1Click(Sender: TObject);
    procedure arozi1Click(Sender: TObject);
    procedure Chiqish1Click(Sender: TObject);
    procedure Xarajatturlari1Click(Sender: TObject);
    procedure Banktolovnomalari1Click(Sender: TObject);
    procedure Dilerqarzdorligi1Click(Sender: TObject);
    procedure Kassapulaylanmasi1Click(Sender: TObject);
    procedure Bankpulaylanmasi1Click(Sender: TObject);
    procedure Xarajatlar1Click(Sender: TObject);
    procedure Hatoliklar1Click(Sender: TObject);
    procedure Dollarkursi1Click(Sender: TObject);
    procedure Papka1Click(Sender: TObject);
    procedure Ozgarishlar1Click(Sender: TObject);
    procedure Yaroqsiztovarlar1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure Kassapulaylanmasi2Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure Q1Click(Sender: TObject);
    procedure mnazoratClick(Sender: TObject);
    procedure Yuklabolish1Click(Sender: TObject);
    procedure Yuklabolish2Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure kirimtovarlarbrand1Click(Sender: TObject);
    procedure SMSbotlarjonatish1Click(Sender: TObject);
    procedure kabina1Click(Sender: TObject);
  private
    { Private declarations }
  public
     
    { Public declarations }
  end;

var
  main: Tmain;

implementation

uses fs_kassa, fulanish, fdms, fs_client, fs_tovar, fkassa,
  fs_diler, fs_ombor, fs_client_edit, fsetup, fchiqim, fkirim,
  fshartnoma, fotch_oborot_tovar, fparolizm,  fs_tovar_kirim,
  fs_xodim, fsert, fvozvrat, fqarzdorlik, fs_haridor, fs_kat,
  fpl, ftarozi, fs_x_tur, fpl_bank, fqarzdorlik_diler, fkassa_aylanma,
  fbank_aylanma, fotch_xarajat, fs_ombor_komil, fs_kurs,
  fs_papka, fportizm, fotch_kam, fs_t_otdel, fotch_reklama, fpl_click,
  fclick_aylanma, fjamiaylanma, fQraz, fNazorat, fyukla, fotch_brand,
  fsmsbot, fkirimh, fkirim_edit, fkirim_asos, fs_mobil;

{$R *.dfm}

procedure Tmain.Button1Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var s:string;i:integer;
ExlApp, Sheet: OLEVariant;
begin
  //создаем объект Excel
  //s_izm.Open;s_zavod.Open;
  ExlApp := CreateOleObject('Excel.Application');ExlApp.Visible := false;
  ExlApp.Workbooks.Open('d:\INFO_savdo\xl.xls');
  Sheet := ExlApp.Workbooks[ExtractFileName('d:\INFO_savdo\xl.xls')].WorkSheets[1];
  Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
  shortdateformat:='dd.mm.yy';s:='';
  for i:=1 to 3131 do begin
    s:=sheet.cells[i,2];
    if not s_izm.Locate('nom',s,[loCaseInsensitive]) then begin
      s_izm.Append;s_izm.FieldByName('nom').value:=s;s_izm.post;
    end;
    s:=sheet.cells[i,5];
    if not s_zavod.Locate('nom',s,[loCaseInsensitive]) then begin
      s_zavod.Append;s_zavod.FieldByName('nom').value:=s;s_zavod.post;
    end;
    s:=sheet.cells[i,1];if i<555 then s:=copy(s,5,length(s)-4);
    if not dms.s_tovar.Locate('nom',s,[loCaseInsensitive]) then begin
      DMS.s_tovar.Append;
      DMS.s_tovarnom.value:=s;
      DMS.s_tovarsotish.value:=sheet.cells[i,3];
      DMS.s_tovarupakavka.value:=sheet.cells[i,4];
      DMS.s_tovarizm_id.value:=s_izm.FieldByName('id').value;
      DMS.s_tovarzavod_id.value:=s_zavod.FieldByName('id').value;
      DMS.s_tovar.Post;
    end;
  end;
  ExlApp.Quit;
  ExlApp := Unassigned;
end;

procedure Tmain.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then
  begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
  //main.Caption:=s_ver+ulanish.GetLocalIP();
end;

procedure Tmain.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tmain.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ulanish.protinout.Enabled:=false;DMS.setup.Refresh;
  if DMS.protinout.Active then
  begin
  DMS.protinout.edit;
  DMS.protinout.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').AsVariant;
  DMS.protinout.FieldByName('flag').Value:=0;
  DMS.protinout.post;
  end;
      dms.s_user.Edit;
      DMS.s_user.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').Value;
      //DMS.s_user.FieldByName('flag').Value:=0;
      dms.s_user.post;
  ulanish.Close;
  //ShowWindow(Application.Handle, SW_RESTORE);
  //halt;
end;

procedure Tmain.grkassaItems0Click(Sender: TObject);
var s:string;
begin
  //if admin_type<>'1' then begin
  //  ShowMessage('Sotuvchi kirishi mumkin.');exit;
  //end;

  dms.s_client.Close;dms.s_client.SQL.Clear;
  dms.s_client.SQL.Add('select s_client.id as x_id,s_client.* from s_client WHERE del_flag=1 and id='+admin_clid);
  dms.s_client.Open;

  dms.setup.Refresh;s:=FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime);
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and client_id='+admin_clid+' and xodim_id='+admin_id+' and sana="'+s+'" order by diler_id');
  dms.asos.open;
  if dms.asos.RecordCount=0 then begin
    dms.asos.Append;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;
    dms.asos.Refresh;
  end;
  dms.asos_slave.Open;
  kassa.showmodal;

end;

procedure Tmain.tovarlarbazasiClick(Sender: TObject);
begin
  s_tovar.varaq.ActivePageIndex:=4;s_tovar.varaqClick(sender);
  s_tovar.varaq.ActivePageIndex:=3;s_tovar.varaqClick(sender);
  s_tovar.varaq.ActivePageIndex:=2;s_tovar.varaqClick(sender);
  s_tovar.varaq.ActivePageIndex:=1;s_tovar.varaqClick(sender);
  s_tovar.varaq.ActivePageIndex:=0;s_tovar.varaqClick(sender);
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  s_tovar.Refresh;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  //if admin_type='2' then
    dms.qoldiq.SQL.Add('SELECT * FROM asos_slave where del_flag=1 and tovar_id=:id  and tovar_nom is null  order by id desc');
  //else
  //  DMS.qoldiq.sql.add('SELECT * FROM asos_slave where del_flag=1 and tovar_id = :id and user_id = '+admin_id+'  and tovar_nom is null order by id desc');
  dms.qoldiq.open;
  dms.qoldiq.Refresh;
  s_tovar.showmodal;

end;

procedure Tmain.Ishlabchiqaruvchilar1Click(Sender: TObject);
begin
  //zavod.showmodal;
end;

procedure Tmain.Sotuvchilar1Click(Sender: TObject);
begin
  DMS.s_xodim.Refresh;
  s_xodim.showmodal;
end;

procedure Tmain.Kassalar1Click(Sender: TObject);
begin
  //s_kassa.Refresh;s_kassa.showmodal;
end;

procedure Tmain.Korxona1Click(Sender: TObject);
begin
  //if (admin_type='3') or (admin_type='10') then begin
  //  ShowMessage('Faqat adminstrator uchun');exit;
  //end;
  dms.client_edit.Open;
  dms.client_edit.Refresh;dms.s_opf.Refresh;
  dms.client_edit.Locate('id',strtoint(admin_clid),[loCaseInsensitive]);
  //if admin_type='2' then
  //  begin
   //   dms.client_edit.Edit;
      s_client_edit.showmodal;

  //  end
  //else
    //s_client.showmodal;
end;

procedure Tmain.Moletkazuvchilar1Click(Sender: TObject);
begin
  //if admin_type<>'2' then begin
  //  ShowMessage('Faqat korxona rahbarlari uchun');exit;
  //end;
  dms.s_diler.Refresh;dms.s_opf.Refresh;
  s_diler.showmodal;

end;

procedure Tmain.Haridorlar1Click(Sender: TObject);
begin
  //if admin_type<>'2' then begin
  //  ShowMessage('Faqat korxona rahbarlari uchun');exit;
  //end;
  dms.s_haridor.Open;
  dms.s_haridor.Refresh;
  s_haridor.showmodal;

end;

procedure Tmain.Qoshimchalar1Click(Sender: TObject);
begin
  if dms.s_kat.Active = false then dms.s_kat.Open else dms.s_kat.Refresh;
  if dms.s_brend.Active = false then dms.s_brend.Open else dms.s_brend.Refresh;
  s_kat.showmodal;
end;

procedure Tmain.Buxgalteriya2Click(Sender: TObject);
begin
  shartnomalar.showmodal;
end;

procedure Tmain.Sertifikatlar1Click(Sender: TObject);
begin
  sertifikat.sert.Close;sertifikat.sert.SQL.Clear;
  sertifikat.sert.sql.add('SELECT * FROM sert where del_flag=1 order by id desc');
  sertifikat.sert.open;sertifikat.serttovar.open;sertifikat.s_tovar.open;
  sertifikat.showmodal;
end;

procedure Tmain.Qarzdorlik1Click(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * from s_haridor WHERE del_flag=1 order by nom');
  dms.link.open;

  qarzdorlik.dan.Date:=StrToDate('01'+copy(datetostr(Date()),3,9));
  qarzdorlik.danc.Date:=StrToDate('01'+copy(datetostr(Date()),3,9));
  qarzdorlik.gacha.Date:=date();qarzdorlik.gachac.Date:=date();
  DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
  DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
  DMS.s_t_all.Open;
  qarzdorlik.clientnom.Value:=dms.link.fieldbyname('id').AsInteger;
  qarzdorlik.clientnomChange(Sender);
  
  DMS.k_slave.Open;qarzdorlik.main.Open;
  qarzdorlik.showmodal;
end;

procedure Tmain.olovnomalar1Click(Sender: TObject);
begin
  DMS.s_kurs.Open;
  pl.showmodal;
end;

procedure Tmain.Kirimqilish1Click(Sender: TObject);
begin
  DMS.s_diler.Open;DMS.s_haridor.Open;
  //kirim.sana1.Value:=Now();
  //kirim.sana2.Value:=Now();
  DMS.k_asos.close;DMS.k_asos.SQL.Clear;
  DMS.k_asos.sql.add('SELECT * FROM asos where tur_oper in (1,5) and del_flag=1 and client_id = '+admin_clid+' order by sana desc');
  DMS.k_asos.Open;DMS.k_asos.Last;
  if  dms.k_asos.RecordCount>0 then
  begin
    //kirim.sana1.Value:=dms.k_asossana.Value;
    //kirim.sana2.Value:=Now();
  end;
  DMS.k_asos.First;
  DMS.s_kurs.Open;DMS.s_kurs.Last;
  DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
  DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
  DMS.s_t_all.Open;
  DMS.k_slave1.Open;
  kirim.link.close;kirim.link.SQL.Clear;
  kirim.link.sql.add('SELECT s.id,s.main_id,main.serial FROM slave_main s,main where main.id=s.main_id and s.slave_id=:id order by id');
  kirim.link.Open;
  kirim.Caption:=inttostr(kirim.link.RecordCount);
  dms.s_client.Refresh;
  //if (dms.k_asossana.Value=null) or (dms.k_asossana.Value=0) then kirim.sana1.Value:=Now else
  //kirim.sana1.Value:=dms.k_asossana.Value;

  s_tovar_kirim.varaq.ActivePageIndex:=4;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.varaq.ActivePageIndex:=3;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.varaq.ActivePageIndex:=2;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.varaq.ActivePageIndex:=1;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.varaq.ActivePageIndex:=0;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  s_tovar_kirim.Refresh;
  kirimgl:='kirim';
  if kirimgl='kirim' then
  begin
    kirim_asos.diler.Visible:=true;kirim_asos.ldiler.Visible:=true;kirim_asos.Bdiler.Visible:=true;
    kirim_asos.haridor.Visible:=False;kirim_asos.Lharidor.Visible:=False;
    kirim.g_asos.Columns.Items[2].Visible:=true;
    kirim.g_asos.Columns.Items[3].Visible:=false;
    kirim_edit.diler.Visible:=true;kirim_edit.ldiler.Visible:=true;
    kirim_edit.haridor.Visible:=false;kirim_edit.Lharidor.Visible:=false;
  end;
  if kirimgl='kirim3' then
  begin
    kirim_asos.diler.Visible:=false;kirim_asos.ldiler.Visible:=false;kirim_asos.Bdiler.Visible:=false;
    kirim_asos.haridor.Visible:=true;kirim_asos.Lharidor.Visible:=true;
    kirim_asos.diler.Visible:=true;kirim_asos.ldiler.Visible:=true;kirim_asos.Bdiler.Visible:=true;
    kirim.g_asos.Columns.Items[2].Visible:=false;
    kirim.g_asos.Columns.Items[3].Visible:=true;
    kirim_edit.haridor.Visible:=true;kirim_edit.Lharidor.Visible:=true;
    kirim_edit.diler.Visible:=false;kirim_edit.ldiler.Visible:=false;
  end;
  kirim.showmodal;

end;

procedure Tmain.sotuvgaberish1Click(Sender: TObject);
begin
  //if admin_type<>'2' then begin ShowMessage('Yshbu bo`limga kirishga ruhsat yo`q');exit;end;
  DMS.k_asos.close;DMS.k_asos.SQL.Clear;
  DMS.k_asos.sql.add('SELECT * FROM asos where tur_oper=4 and del_flag=1 and client_id = '+admin_id+' order by sana');
  DMS.k_asos.Open;
  DMS.s_filial.Close;DMS.s_filial.SQL.Clear;
  DMS.s_filial.SQL.Add('SELECT * FROM s_client where del_flag=1 and glav_id='+admin_id);
  DMS.s_filial.Open;
  DMS.k_slave.Open;
  if  dms.k_asos.RecordCount=0 then begin kirim.sana1.Value:=Now();kirim.sana2.Value:=Now();end;
  if (dms.k_asossana.Value=null) or (dms.k_asossana.Value=0) then kirim.sana1.Value:=Now else
  //vitrina.sana1.Value:=dms.k_asossana.Value;
  //vitrina.showmodal;

end;

procedure Tmain.Ombordagitovarlar1Click(Sender: TObject);
begin
  //if admin_type<>'2' then begin ShowMessage('Yshbu bo`limga kirishga ruhsat yo`q');exit;end;
  s_ombor.Edit2.Text:='';
  DMS.s_ombor.close;DMS.s_ombor.SQL.Clear;
  case dms.s_clientdollar.AsInteger of
  2:begin
    //DMS.s_ombor.sql.add('SELECT t.id as tovar_id,0 as q_d,k.id as k_id,b.id as b_id,k.nom as knom,b.nom as bnom,t.shtrix,z.nom as znom,d.nom as dnom, ');
    //DMS.s_ombor.sql.add('s.kol*s.sena_d as summa_all,s.kol_ost*s.sena_d as q,s.kol_in_ost*s.sena_in_d as q_in, s.kol_ost*s.sotish_d as q_all,s.*,t.nom as s_tovar,z.nom as s_zavod,d.nom as s_diler ');
    //DMS.s_ombor.sql.add(' FROM asos a,asos_slave s,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend,s_diler d ');
    //DMS.s_ombor.sql.add(' where (a.tur_oper=1 or a.tur_oper=4 or a.tur_oper=5) and (s.kol_ost>0 or s.kol_in_ost>0) and d.id=a.diler_id and t.id=s.tovar_id and a.id=s.asos_id and a.id=s.asos_id and s.del_flag=1 and a.client_id = '+admin_clid);

    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol*q.kirim_d as summa_all,q.kirim_d as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim_d) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim_d)+if(q.dollar=2,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=2,sum(q.kol*q.kirim_d)+if(q.dollar=2,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');


    s_ombor.Edit2.Text:=DMS.s_ombor.sql.Text;
    //DMS.s_ombor.sql.add(' order by s_tovar');
    main.Memom.Lines.Add(DMS.s_ombor.sql.Text);
    DMS.s_ombor.Open;
    s_ombor_komil.showmodal;
    end;
  1:begin
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    DMS.s_ombor.Open;
    s_ombor.showmodal;
    end;
  else
  begin
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    main.Memom.Lines.Add(DMS.s_ombor.sql.Text);
    s_ombor.Edit2.Text:=DMS.s_ombor.sql.Text;
    DMS.s_ombor.Open;
    s_ombor.showmodal;
  end;
  end;
end;

procedure Tmain.Qaytaribolish1Click(Sender: TObject);
begin
  DMS.s_diler.Open;DMS.s_haridor.Open;
  //kirim.sana1.Value:=Now();
  //kirim.sana2.Value:=Now();
  DMS.k_asos.close;DMS.k_asos.SQL.Clear;
  DMS.k_asos.sql.add('SELECT * FROM asos where tur_oper in (3) and del_flag=1 and client_id = '+admin_clid+' order by sana desc');
  DMS.k_asos.Open;DMS.k_asos.Last;
  if  dms.k_asos.RecordCount>0 then
  begin
    //kirim.sana1.Value:=dms.k_asossana.Value;
    //kirim.sana2.Value:=Now();
  end;
  DMS.k_asos.First;
  DMS.s_kurs.Open;DMS.s_kurs.Last;
  DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
  DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
  DMS.s_t_all.Open;
  DMS.k_slave1.Open;
  kirim.link.close;kirim.link.SQL.Clear;
  kirim.link.sql.add('SELECT s.id,s.main_id,main.serial FROM slave_main s,main where main.id=s.main_id and s.slave_id=:id order by id');
  kirim.link.Open;
  kirim.Caption:=inttostr(kirim.link.RecordCount);
  dms.s_client.Refresh;
  //if (dms.k_asossana.Value=null) or (dms.k_asossana.Value=0) then kirim.sana1.Value:=Now else
  //kirim.sana1.Value:=dms.k_asossana.Value;

  s_tovar_kirim.varaq.ActivePageIndex:=4;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.varaq.ActivePageIndex:=3;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.varaq.ActivePageIndex:=2;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.varaq.ActivePageIndex:=1;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.varaq.ActivePageIndex:=0;s_tovar_kirim.varaqClick(sender);
  s_tovar_kirim.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  s_tovar_kirim.Refresh;
  kirimgl:='kirim3';
  if kirimgl='kirim' then
  begin
    kirim_asos.diler.Visible:=true;kirim_asos.ldiler.Visible:=true;kirim_asos.Bdiler.Visible:=true;
    kirim_asos.haridor.Visible:=False;kirim_asos.Lharidor.Visible:=False;
    kirim.g_asos.Columns.Items[2].Visible:=true;
    kirim.g_asos.Columns.Items[3].Visible:=false;
    kirim_edit.diler.Visible:=true;kirim_edit.ldiler.Visible:=true;
    kirim_edit.haridor.Visible:=false;kirim_edit.Lharidor.Visible:=false;
  end;
  if kirimgl='kirim3' then
  begin
    kirim_asos.diler.Visible:=false;kirim_asos.ldiler.Visible:=false;kirim_asos.Bdiler.Visible:=false;
    kirim_asos.haridor.Visible:=true;kirim_asos.Lharidor.Visible:=true;
    kirim.g_asos.Columns.Items[2].Visible:=false;
    kirim.g_asos.Columns.Items[3].Visible:=true;
    kirim_edit.haridor.Visible:=true;kirim_edit.Lharidor.Visible:=true;
    kirim_edit.diler.Visible:=false;kirim_edit.ldiler.Visible:=false;
  end;
  kirim.showmodal;
end;

procedure Tmain.Kassaamaliyoti1Click(Sender: TObject);
begin
  chiqim.showmodal;
end;

procedure Tmain.ovaraylanmasi1Click(Sender: TObject);
begin
  otch_oborot_tovar.showmodal;
end;

procedure Tmain.Sozlash1Click(Sender: TObject);
begin
  dms.s_client.Edit;
  setup.showmodal;
end;

procedure Tmain.Parolniozgartirish1Click(Sender: TObject);
begin
  parolizm.showmodal;
end;

procedure Tmain.arozi1Click(Sender: TObject);
begin
  tarozi.showmodal;
end;

procedure Tmain.Chiqish1Click(Sender: TObject);
begin
  ulanish.protinout.Enabled:=false;DMS.setup.Refresh;
  if DMS.protinout.Active then
  begin
  DMS.protinout.edit;
  DMS.protinout.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').AsVariant;
  DMS.protinout.FieldByName('flag').Value:=0;
  DMS.protinout.post;
  end;
      dms.s_user.Edit;
      DMS.s_user.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').Value;
      //DMS.s_user.FieldByName('flag').Value:=0;
      dms.s_user.post;
  ulanish.Close;
  ShowWindow(Application.Handle, SW_RESTORE);
  main.Close;
end;

procedure Tmain.Xarajatturlari1Click(Sender: TObject);
begin
  if dms.s_x_tur.Active = false then dms.s_x_tur.Open else dms.s_x_tur.Refresh;
  s_x_tur.showmodal;
end;

procedure Tmain.Banktolovnomalari1Click(Sender: TObject);
begin
  DMS.s_kurs.Open;
  pl_bank.showmodal;
end;

procedure Tmain.Dilerqarzdorligi1Click(Sender: TObject);
begin
  //if admin_type<>'2' then begin ShowMessage('Yshbu bo`limga kirishga ruhsat yo`q');exit;end;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * from s_diler WHERE del_flag=1 order by nom desc');
  dms.link.open;dms.link.First;

  qarzdorlik_diler.dan.Date:=StrToDate('01'+copy(datetostr(Date()),3,9));
  qarzdorlik_diler.danc.Date:=StrToDate('01'+copy(datetostr(Date()),3,9));

  qarzdorlik_diler.dan.Date:=StrToDate('01.01.2016');
  qarzdorlik_diler.danc.Date:=StrToDate('01.01.2016');


  qarzdorlik_diler.gacha.Date:=date();qarzdorlik.gachac.Date:=date();
  DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
  DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
  DMS.s_t_all.Open;
  qarzdorlik_diler.clientnom.Value:=dms.link.fieldbyname('id').AsInteger;
  qarzdorlik_diler.clientnomChange(Sender);
  DMS.k_slave1.Open;qarzdorlik_diler.main.Open;
  qarzdorlik_diler.showmodal;

end;

procedure Tmain.Kassapulaylanmasi1Click(Sender: TObject);
begin
  kassa_aylanma.showmodal;
end;

procedure Tmain.Bankpulaylanmasi1Click(Sender: TObject);
begin
  bank_aylanma.showmodal;
end;

procedure Tmain.Xarajatlar1Click(Sender: TObject);
begin
  otch_xarajat.showmodal;
end;

procedure Tmain.Hatoliklar1Click(Sender: TObject);
begin
end;

procedure Tmain.Dollarkursi1Click(Sender: TObject);
begin
  dms.s_kurs.Open;
  s_kurs.showmodal;
end;

procedure Tmain.Papka1Click(Sender: TObject);
begin
  s_papka.showmodal;
end;

procedure Tmain.Ozgarishlar1Click(Sender: TObject);
begin
  dms.protizm.Open;
  protizm.showmodal;
end;

procedure Tmain.Yaroqsiztovarlar1Click(Sender: TObject);
begin
  //if admin_type<>'2' then begin ShowMessage('Yshbu bo`limga kirishga ruhsat yo`q');exit;end;
  DMS.s_ombor.close;DMS.s_ombor.SQL.Clear;

  DMS.s_ombor.sql.add('SELECT t.shtrix,z.nom as znom,d.nom as dnom,t.miqdor,s.kol_ost*s.sena as q,s.kol_in_ost*s.sena_in as q_in,if(s.sena_d>0 or s.sena_d is not null,0,s.kol_ost*s.sena+if(s.sena_in = 0 or s.sena_in is null,0,s.kol_in_ost*s.sena_in)) as q_all,');
  DMS.s_ombor.sql.add('count(o.kol) as itogkol,if(o.kirim_d>0 or o.kirim_d is not null,o.kol*o.kirim_d+if(o.sena_in_d is null or s.sena_in_d = 0,0,s.kol_in_ost*s.sena_in_d),0) as q_d,s.*,t.nom as s_tovar,z.nom as s_zavod,d.nom as s_diler ');
  DMS.s_ombor.sql.add(' FROM s_tovar t,ombor,s_zavod z,s_diler d ');
  DMS.s_ombor.sql.add(' where t.miqdor>0 and d.id=a.diler_id and t.id=s.tovar_id and a.id=s.asos_id and a.id=s.asos_id and s.del_flag=1 and a.client_id = '+admin_clid+' ');
  DMS.s_ombor.sql.add(' GROUP by t.id HAVING t.miqdor>itogkol');
  DMS.s_ombor.Open;
  otch_kam.showmodal;
end;

procedure Tmain.T1Click(Sender: TObject);
begin
  s_t_otdel.ts_t_otdel.Open;
  DMS.link.close;DMS.link.SQL.Clear;
  DMS.link.sql.add('SELECT id,nom,otdel from s_tovar where del_flag=1  order by nom');
  DMS.link.Open;
  s_t_otdel.showmodal;
end;

procedure Tmain.R1Click(Sender: TObject);
begin
  otch_reklama.showmodal;
end;

procedure Tmain.C1Click(Sender: TObject);
begin
  DMS.s_kurs.Open;
  pl_click.showmodal;
end;

procedure Tmain.Kassapulaylanmasi2Click(Sender: TObject);
begin
  click_aylanma.showmodal;
end;

procedure Tmain.K1Click(Sender: TObject);
begin
  jamiaylanma.showmodal;
end;

procedure Tmain.Q1Click(Sender: TObject);
begin
  qarz.showmodal;
end;

procedure Tmain.mnazoratClick(Sender: TObject);
begin
  nazorat.showmodal;
end;

procedure Tmain.Yuklabolish1Click(Sender: TObject);
begin
  yukla.showmodal;
end;

procedure Tmain.Yuklabolish2Click(Sender: TObject);
begin
  yukla.showmodal;
end;

procedure Tmain.X1Click(Sender: TObject);
begin
  s_x_tur.showmodal;

end;

procedure Tmain.kirimtovarlarbrand1Click(Sender: TObject);
begin
  otch_brand.showmodal;
end;

procedure Tmain.SMSbotlarjonatish1Click(Sender: TObject);
begin
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select * from prot_sms order by id desc');
  DMS.main_link.Open;
  smsbot.showmodal;
end;

procedure Tmain.kabina1Click(Sender: TObject);
begin
  s_mobil.showmodal;
end;

end.
