unit fsavdo_timer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, frxClass, frxDBSet,inifiles, ExtCtrls, Grids, DBGrids, Mask,
  RzEdit, RzSpnEdt;

type
  Tsavdo_timer = class(TForm)
    lbd: TZConnection;
    tasos_slave: TZQuery;
    Dasos_slave: TDataSource;
    frxsf: TfrxReport;
    tlink: TZQuery;
    main_link: TZQuery;
    Timer1: TTimer;
    chek: TButton;
    Dasos: TDataSource;
    s_client: TZQuery;
    s_clientid: TIntegerField;
    s_clientnom: TStringField;
    s_clientuserpass: TStringField;
    s_clientkomu: TSmallintField;
    s_clientadress: TStringField;
    s_clientmanzil: TStringField;
    s_clientindeks: TStringField;
    s_clientobl: TIntegerField;
    s_clienttuman: TIntegerField;
    s_clientboss: TStringField;
    s_clienttel: TStringField;
    s_clientrs: TStringField;
    s_clientinn: TStringField;
    s_clientokonh: TStringField;
    s_clientbank: TStringField;
    s_clientkod_bank: TStringField;
    s_clientflag: TSmallintField;
    s_clientgorod: TStringField;
    s_clientactive: TSmallintField;
    s_clienttugashsana: TDateField;
    s_clientchangedate: TDateTimeField;
    s_clientuyu_type: TIntegerField;
    s_clientsana: TDateField;
    s_clientsrok: TDateField;
    s_clientprim: TStringField;
    s_clientsayt: TStringField;
    s_clientemail: TStringField;
    s_clientmasul1: TStringField;
    s_clienttelsms1: TStringField;
    s_clientmasul2: TStringField;
    s_clienttelsms2: TStringField;
    s_clientnik: TSmallintField;
    s_clientdel_flag: TSmallintField;
    s_clientiamhere: TIntegerField;
    s_clientdiamhere: TDateTimeField;
    s_clientvaqtout: TDateTimeField;
    s_clientkim: TStringField;
    s_clienttarmoq: TStringField;
    s_clientmr: TStringField;
    s_clientuser_id: TIntegerField;
    s_clientvaqt_in: TDateTimeField;
    s_clientdisp_n: TIntegerField;
    s_clientdisp_d: TDateField;
    s_clientssana: TDateField;
    s_clientsnomer: TStringField;
    s_clientgaraj: TIntegerField;
    s_clientgaraj_turi: TSmallintField;
    s_clientglav_id: TIntegerField;
    s_clientclient_tur: TIntegerField;
    s_clientiduz: TIntegerField;
    s_clientkod: TIntegerField;
    s_clientvazir: TIntegerField;
    s_clients1: TStringField;
    s_clientflag1: TStringField;
    s_clientflag2: TStringField;
    s_clientsumma: TFloatField;
    s_clientedit_it: TSmallintField;
    s_clientkolin: TSmallintField;
    s_clientprikname: TStringField;
    s_clientprikdate: TDateTimeField;
    s_clientfilenom: TStringField;
    s_clientat91: TSmallintField;
    s_clientyaxlitlash: TSmallintField;
    s_clientyaxlitlash_in: TSmallintField;
    s_clientfoiz: TFloatField;
    s_clientfoiz_in: TFloatField;
    s_clientkomputer: TSmallintField;
    s_clientchegirma: TFloatField;
    s_clientseriya: TSmallintField;
    s_clientichkitovar: TSmallintField;
    s_clientlasttz_id: TSmallintField;
    s_clientlastta_id: TSmallintField;
    s_clientlast_pl_k: TIntegerField;
    s_clientlast_pl_b: TIntegerField;
    s_clientkk: TSmallintField;
    s_clientdollar: TIntegerField;
    s_clientbux: TDateField;
    s_clientfoiz_opt2: TFloatField;
    s_clientfoiz_opt1: TFloatField;
    s_clientfoiz_schet: TFloatField;
    s_clientfoiz_ch2: TFloatField;
    Ds_client: TDataSource;
    tasos: TZQuery;
    tasosid: TIntegerField;
    tasosclient_id: TIntegerField;
    tasoskassa_id: TIntegerField;
    tasosxodim_id: TIntegerField;
    tasossana: TDateField;
    tasosdel_flag: TSmallintField;
    tasoss_kassa: TStringField;
    tasoschangedate: TDateTimeField;
    tasosuser_id: TIntegerField;
    tasossumma: TFloatField;
    tasoskol: TIntegerField;
    tasostur_oper: TSmallintField;
    tasosdiler_id: TIntegerField;
    tasosseriya: TStringField;
    tasosnomer: TStringField;
    tasossum_naqd: TFloatField;
    tasossum_plastik: TFloatField;
    tasosqabul_sana: TDateTimeField;
    tasosprint_flag: TSmallintField;
    tasosombor_id: TIntegerField;
    tasosqarz_summa: TFloatField;
    tasosqarz_kim: TStringField;
    tasosqarz_izoh: TStringField;
    tasosqarz_flag: TSmallintField;
    tasosh_id: TIntegerField;
    tasossum_epos: TFloatField;
    tasoscheg_n: TFloatField;
    tasoscheg_p: TFloatField;
    tasoscheg_e: TFloatField;
    tasossum_naqd_ch: TFloatField;
    tasossum_plast_ch: TFloatField;
    tasossum_epos_ch: TFloatField;
    tasossumma_ch: TFloatField;
    tasospl_id: TIntegerField;
    tasosharidor: TStringField;
    tasoskurs: TFloatField;
    tasosdollar: TSmallintField;
    tasossum_d: TFloatField;
    tasosplastik_id: TIntegerField;
    tasosmobil: TIntegerField;
    tasosxizmat_foiz: TSmallintField;
    tasosxizmat: TFloatField;
    Label2: TLabel;
    chekPrinters: TComboBox;
    Label10: TLabel;
    chekshablon: TComboBox;
    s_kassa: TZQuery;
    s_kassaid: TIntegerField;
    s_kassanom: TStringField;
    s_kassastatus: TSmallintField;
    s_kassauser_id: TIntegerField;
    s_kassachangedate: TDateTimeField;
    s_kassaclient_id: TIntegerField;
    s_kassadel_flag: TSmallintField;
    Ds_kassa: TDataSource;
    s_user: TZQuery;
    Ds_user: TDataSource;
    s_haridor: TZQuery;
    s_haridorid: TIntegerField;
    s_haridorclient_id: TIntegerField;
    s_haridornom: TStringField;
    s_haridorkomu: TSmallintField;
    s_haridoradress: TStringField;
    s_haridormanzil: TStringField;
    s_haridorindeks: TStringField;
    s_haridorobl: TIntegerField;
    s_haridortuman: TIntegerField;
    s_haridorboss: TStringField;
    s_haridortel: TStringField;
    s_haridorrs: TStringField;
    s_haridorinn: TStringField;
    s_haridorokonh: TStringField;
    s_haridorbank: TStringField;
    s_haridorkod_bank: TStringField;
    s_haridorgorod: TStringField;
    s_haridoractive: TSmallintField;
    s_haridortugashsana: TDateField;
    s_haridoruser_id: TIntegerField;
    s_haridorchangedate: TDateTimeField;
    s_haridoruyu_type: TIntegerField;
    s_haridorsana: TDateField;
    s_haridorsrok: TDateField;
    s_haridorprim: TStringField;
    s_haridoremail: TStringField;
    s_haridormasul1: TStringField;
    s_haridortelsms1: TStringField;
    s_haridormasul2: TStringField;
    s_haridortelsms2: TStringField;
    s_haridordel_flag: TSmallintField;
    s_haridoriamhere: TIntegerField;
    s_haridordiamhere: TDateTimeField;
    s_haridorprikname: TStringField;
    s_haridorprikdate: TDateTimeField;
    s_haridorfilenom: TStringField;
    s_haridorvaqt_in: TDateTimeField;
    s_haridorvaqtout: TDateTimeField;
    s_haridorkim: TStringField;
    s_haridortarmoq: TStringField;
    Ds_haridor: TDataSource;
    Gasos: TDBGrid;
    GAsos_slave: TDBGrid;
    asos: TfrxDBDataset;
    client: TfrxDBDataset;
    asos_slave: TfrxDBDataset;
    link: TfrxDBDataset;
    harid: TfrxDBDataset;
    zakaz: TfrxDBDataset;
    tmobil: TZQuery;
    Dtmobil: TDataSource;
    tasosfilial_id: TIntegerField;
    tasosshartnoma_id: TIntegerField;
    tasoswoywo_bill_type: TSmallintField;
    tasoss_xodim: TStringField;
    tzakaz: TZQuery;
    Dzakaz: TDataSource;
    tzakazkol: TIntegerField;
    tzakazs_tovar: TStringField;
    tzakazs_user: TStringField;
    tzakazs_izm_id: TStringField;
    tzakazstol: TStringField;
    tzakazzakaz: TDateTimeField;
    start: TButton;
    tasoss_mobil: TStringField;
    Chmijoz: TCheckBox;
    chsoni: TEdit;
    Label1: TLabel;
    tasosall: TZQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    DateField1: TDateField;
    SmallintField1: TSmallintField;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    IntegerField5: TIntegerField;
    FloatField1: TFloatField;
    IntegerField6: TIntegerField;
    SmallintField2: TSmallintField;
    IntegerField7: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    DateTimeField2: TDateTimeField;
    SmallintField3: TSmallintField;
    IntegerField8: TIntegerField;
    FloatField4: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    SmallintField4: TSmallintField;
    IntegerField9: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    IntegerField10: TIntegerField;
    StringField6: TStringField;
    FloatField13: TFloatField;
    SmallintField5: TSmallintField;
    FloatField14: TFloatField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    SmallintField6: TSmallintField;
    FloatField15: TFloatField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    SmallintField7: TSmallintField;
    StringField7: TStringField;
    StringField8: TStringField;
    Dasosall: TDataSource;
    tasos_slaveall: TZQuery;
    Dasos_slaveall: TDataSource;
    tzakazid: TIntegerField;
    Label3: TLabel;
    chekPrinters2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure chekClick(Sender: TObject);
    procedure chekPrintersChange(Sender: TObject);
    procedure chekshablonChange(Sender: TObject);
    procedure startClick(Sender: TObject);
    procedure ChmijozClick(Sender: TObject);
    procedure chsoniChange(Sender: TObject);
    procedure GasosDblClick(Sender: TObject);
    procedure chekPrinters2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  savdo_timer: Tsavdo_timer; var fayl: textfile;

implementation

{$R *.dfm}
uses Printers,Math;
procedure shalonlar;
var F: TSearchRec;mydir, Path: string; IniFile:TIniFile;
begin
  savdo_timer.chekshablon.Items.Clear;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  savdo_timer.chekshablon.Text := IniFile.ReadString('BAZA','shablonchek','chek58.fr3');
  MyDir := ExtractFilePath(Application.ExeName);
  if FindFirst(Path + '*.fr3*', faAnyFile, F) = 0 then begin
    repeat
    if (F.Attr <> faDirectory) then begin
      savdo_timer.chekshablon.items.Add(F.Name);
    end;
    until FindNext(F) <> 0;FindClose(F);
   end;
end;
function _IntToStr(i, Wide: Cardinal): string;
var
  i1: Cardinal;
begin
  Result := '';
  repeat
    i1 := i mod 10;
    i := i div 10;
    Result := char(i1 + ord('0')) + Result;
    dec(Wide);
  until (Wide < 1) and (i < 1)
end;
function RoundLess(Value, Divider: Integer): Integer;
var s:string;
begin
  s:=inttostr(value);
  s:=copy(s,1,length(s)-2)+'00';
  Result:=strtoint(s);
end;
procedure Tsavdo_timer.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  tasosall.Close;tasosall.sql.Clear;
  tasosall.sql.Add('select * from asos where mobil>0 and print_flag=2 and del_flag=1 and sana="'+FormatDateTime('yyyy-mm-dd',Now())+'" order by diler_id desc');
  tasosall.Open;
  tasos_slaveall.SQL.Clear;
  tasos_slaveall.SQL.Add('select s.*,t.nom as s_tovar,user.username as s_user,s_izm.nom as s_izm_id from asos a,user,s_tovar t, asos_slave s left JOIN s_izm on s_izm.id=s.izm_id where ');
  tasos_slaveall.SQL.Add(' a.id=s.asos_id and t.id=s.tovar_id and user.id=a.user_id and s.del_flag=1 and s.asos_id=:id order by s.id');
  tasos_slaveall.Open;
  chekPrinters.Items.Assign(Printer.Printers);
  chekPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  chekPrinters2.Items.Assign(Printer.Printers);
  chekPrinters2.Text := Printer.Printers[Printer.PrinterIndex];
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Chmijoz.Checked := IniFile.ReadBool('BAZA','ChMijoz',true);
  chsoni.Text := IniFile.ReadString('BAZA','Chsoni','1');
  chekPrinters.Text := IniFile.ReadString('BAZA','printerchek','');
  chekPrinters2.Text := IniFile.ReadString('BAZA','printerchek2','');
  chekshablon.Text := IniFile.ReadString('BAZA','shablonchek','chek58.fr3');
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
  shalonlar;
  if IniFile.SectionExists(name)=False then begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;

procedure Tsavdo_timer.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  chekClick(Sender);
  Timer1.Enabled:=True;

end;

procedure Tsavdo_timer.chekClick(Sender: TObject);
var n,f:Currency;i:integer;s:string;
begin
  if Chmijoz.Checked=false then exit;
  try
    tasos.Close;tasos.sql.Clear;
    tasos.sql.Add('select * from asos where print_flag=1 and del_flag=1 limit 1');
    tasos.Open;i:=tasosid.AsInteger;
    tasos_slave.Close;
    tasos_slave.SQL.Clear;
    tasos_slave.SQL.Add('select s.*,t.nom as s_tovar,user.username as s_user,s_izm.nom as s_izm_id from asos a,user,s_tovar t, asos_slave s left JOIN s_izm on s_izm.id=s.izm_id where ');
    tasos_slave.SQL.Add(' a.id=s.asos_id and t.id=s.tovar_id and user.id=a.user_id and s.del_flag=1 and s.asos_id=:id order by s.id');
    //memo1.Lines.add(asos_slave.sql.Text);
    tasos_slave.open;
  except
    Assignfile(fayl,ExtractFilePath(Application.ExeName)+'error.txt');
    s:=ExtractFilePath(Application.ExeName)+'error.txt';
    ReWrite(fayl);
    append(fayl);
    writeln(fayl,'Ошибка подключения (timer): '+datetostr(now()) );
    closefile(fayl);
    lbd.Disconnect;
    try
      lbd.connect;tasos.Open;tasos_slaveall.Open;tasosall.Open;gasos.Refresh;GAsos_slave.Refresh;
    except
       lbd.Disconnect;
       exit;
    end;
  end;
  if lbd.Connected=false then exit;
  if tasos.RecordCount=0 then exit;
  s_client.Open;
  tasos_slave.First;n:=0;
  while not tasos_slave.Eof do begin
    n:=n+tasos_slave.fieldbyname('summa_all').AsFloat;
    tasos_slave.Next;
  end;
  tasos.Edit;
  tasos.fieldbyname('summa').Value:=n;
  tasos.fieldbyname('sum_naqd').AsFloat:=tasos.fieldbyname('summa').AsFloat;
  tasos.fieldbyname('sum_naqd_ch').AsFloat:=RoundLess(tasos.fieldbyname('sum_naqd').AsVariant,s_client.fieldbyname('chegirma').AsInteger);
  tasos.fieldbyname('summa_ch').AsFloat:=tasos.fieldbyname('summa').AsFloat;
  tasos.fieldbyname('cheg_n').AsFloat:=RoundTo((tasos.fieldbyname('sum_naqd').AsFloat-tasos.fieldbyname('sum_naqd_ch').AsFloat),-2);
  tasos.fieldbyname('summa_ch').AsFloat:=tasos.fieldbyname('summa').AsFloat-tasos.fieldbyname('cheg_n').AsFloat;
  tasos.post;
  tasos.Edit;
  tasos.fieldbyname('cheg_n').AsFloat:=0;tasos.fieldbyname('cheg_p').AsFloat:=0;
  tasos.fieldbyname('xizmat').AsFloat:=tasos.fieldbyname('summa').AsFloat*tasos.fieldbyname('xizmat_foiz').AsInteger/100;
  tasos.fieldbyname('sum_naqd').AsFloat:=tasos.fieldbyname('summa').AsFloat+tasos.fieldbyname('xizmat').AsFloat;
  tasos.fieldbyname('sum_plastik').AsFloat:=0;tasos.fieldbyname('sum_epos').AsFloat:=0;
  tasos.fieldbyname('sum_naqd_ch').AsFloat:=RoundLess(tasos.fieldbyname('sum_naqd').AsVariant,s_client.fieldbyname('chegirma').AsInteger);
  tasos.fieldbyname('cheg_n').AsFloat:=RoundTo((tasos.fieldbyname('sum_naqd').AsFloat-tasos.fieldbyname('sum_naqd_ch').AsFloat),-2);
  tasos.fieldbyname('sum_plast_ch').AsFloat:=0;tasos.fieldbyname('sum_epos_ch').AsFloat:=0;
  tasos.fieldbyname('summa_ch').AsFloat:=tasos.fieldbyname('sum_naqd_ch').AsFloat+tasos.fieldbyname('sum_plastik').AsFloat;
  tasos.Post;
  if (tasos.fieldbyname('sum_naqd').AsFloat=0) and (tasos.fieldbyname('sum_plastik').AsFloat=0) and (tasos.fieldbyname('sum_epos').AsFloat=0) and (tasos.fieldbyname('summa').AsFloat>0) then begin
   tasos.edit;
   tasos.fieldbyname('sum_naqd').AsFloat:=tasos.fieldbyname('summa').AsFloat;  tasos.fieldbyname('sum_naqd_ch').AsFloat:=tasos.fieldbyname('summa').AsFloat; tasos.fieldbyname('summa_ch').AsFloat:=tasos.fieldbyname('summa').AsFloat;
   tasos.post;
  end;

    tasos_slave.First;f:=0;
    while not tasos_slave.Eof do begin
      f:=f+tasos_slave.fieldbyname('kol').AsInteger*tasos_slave.fieldbyname('sotish').AsFloat+tasos_slave.fieldbyname('kol_in').AsInteger*tasos_slave.fieldbyname('sotish_in').AsFloat;
      tasos_slave.Next;
    end;
    tasos.Edit;
    tasos.fieldbyname('changedate').AsDateTime:=Now();
    tasos.Post;
    //tasos.Close;tasos.sql.Clear;
    //tasos.sql.Add('select a.*,u.fio as s_xodim from asos a,user u where a.id='+inttostr(i)+' and u.id=a.user_id');
    //tasos.Open;
    //frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
    frxsf.PrintOptions.Printer := chekPrinters.Text;
    frxsf.PrintOptions.Copies := StrToInt(chsoni.Text);
    frxsf.Variables['nnn']:=''''+_IntToStr(tasosdiler_id.AsInteger,5)+'''';
    frxsf.SelectPrinter;frxsf.PrepareReport;
    frxsf.PrintOptions.ShowDialog := false;

    //frxsf.ShowReport;
    //exit;
    frxsf.Print;
    if chekPrinters2.Text<>'' then begin
      frxsf.PrintOptions.Printer := chekPrinters2.Text;
      frxsf.PrintOptions.Copies := 1;
      frxsf.SelectPrinter;frxsf.PrepareReport;
      frxsf.PrintOptions.ShowDialog := false;
      frxsf.Print;
    end;
    tasos.Edit;
    tasos.fieldbyname('print_flag').AsInteger:=2;
    tasos.Post;
    tasosall.Refresh;tasosall.First;
end;

procedure Tsavdo_timer.chekPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printerchek',chekPrinters.Text);IniFile.Destroy;

end;

procedure Tsavdo_timer.chekshablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablonchek',chekshablon.Text);IniFile.Destroy;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
end;

procedure Tsavdo_timer.startClick(Sender: TObject);
begin
  if Timer1.Enabled=true then
      begin
      start.Caption:='Start';
      Timer1.Enabled:=false;
      end
    else
      begin
        start.Caption:='Stop';
        Timer1.Enabled:=true;
      end;
end;

procedure Tsavdo_timer.ChmijozClick(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteBool('BAZA','Chmijoz',Chmijoz.Checked);IniFile.Destroy;
end;

procedure Tsavdo_timer.chsoniChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','Chsoni',Chsoni.Text);IniFile.Destroy;
end;
procedure Tsavdo_timer.GasosDblClick(Sender: TObject);
begin
  tlink.Close;tlink.sql.Clear;
  tlink.sql.Add('update asos set print_flag=1 where id='+tasosall.fieldbyname('id').AsString);
  tlink.ExecSQL;
end;

procedure Tsavdo_timer.chekPrinters2Change(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printerchek2',chekPrinters2.Text);IniFile.Destroy;

end;

end.
