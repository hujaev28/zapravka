unit fsetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles,db, RzCmboBx, RzDBCmbo,
  DBGridEh, Mask, DBCtrlsEh, GridsEh, RzButton, frxClass, StdCtrls,
  ExtCtrls, RzPanel, RzSplit, RzRadChk, Grids, DBGrids, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RzPrgres;

type
  Tsetup = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gprochie: TGroupBox;
    DBGridEh22: TDBGridEh;
    Label19: TLabel;
    Label1: TLabel;
    garaj_turi: TRzDBComboBox;
    Label4: TLabel;
    yaxlitlash: TDBNumberEditEh;
    Label5: TLabel;
    yaxlitlash_in: TDBNumberEditEh;
    Label6: TLabel;
    foiz: TDBNumberEditEh;
    Label7: TLabel;
    foiz_in: TDBNumberEditEh;
    RzSizePanel4: TRzSizePanel;
    Label3: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Shtri: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    cbPrinters: TComboBox;
    yorliqPrinters: TComboBox;
    chekPrinters: TComboBox;
    tanlash: TComboBox;
    chekshablon: TComboBox;
    yorliqshablon: TComboBox;
    Label9: TLabel;
    Memosoz: TMemo;
    f5shablon: TComboBox;
    Label12: TLabel;
    f5Printers: TComboBox;
    Label13: TLabel;
    Label14: TLabel;
    chegirma: TDBNumberEditEh;
    sert: TRzCheckBox;
    Ichkitovar: TRzCheckBox;
    Label16: TLabel;
    lasttz_id: TDBNumberEditEh;
    Label17: TLabel;
    arxiv: TEdit;
    Label18: TLabel;
    serverpapka: TEdit;
    Label20: TLabel;
    lastta_id: TDBNumberEditEh;
    Label21: TLabel;
    last_pl_k: TDBNumberEditEh;
    garaj: TDBNumberEditEh;
    timer: TEdit;
    Label22: TLabel;
    a4Printers: TComboBox;
    Label23: TLabel;
    a4shablon: TComboBox;
    RzBitBtn5: TRzBitBtn;
    seriya: TRzCheckBox;
    dl: TDBNumberEditEh;
    Label24: TLabel;
    Label25: TLabel;
    haridor: TEdit;
    server: TRzBitBtn;
    Label2: TLabel;
    komputer: TRzDBComboBox;
    Label26: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    Label27: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    chekdel: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    qoldiq: TZQuery;
    qoldiqid: TIntegerField;
    qoldiqtovar_id: TIntegerField;
    qoldiqombor_id: TIntegerField;
    qoldiqombor: TStringField;
    qoldiqtovar: TStringField;
    qoldiqizm_id: TSmallintField;
    qoldiqizm1: TSmallintField;
    qoldiqseriya: TStringField;
    qoldiqpolka: TStringField;
    qoldiqsrok: TDateField;
    qoldiqturi: TSmallintField;
    qoldiqresept: TSmallintField;
    qoldiqkol: TIntegerField;
    qoldiqkol_in: TIntegerField;
    qoldiqsena: TFloatField;
    qoldiqsena_in: TFloatField;
    qoldiqsumma: TFloatField;
    qoldiqsumma_in: TFloatField;
    qoldiqsumma_all: TFloatField;
    qoldiqsotish: TFloatField;
    qoldiqsotish_in: TFloatField;
    qoldiqfoiz: TFloatField;
    qoldiqfoiz_in: TFloatField;
    qoldiqsubkod: TSmallintField;
    qoldiqasos_id: TIntegerField;
    qoldiqdel_flag: TSmallintField;
    qoldiqsena_d: TFloatField;
    qoldiqsena_in_d: TFloatField;
    qoldiqsotish_d: TFloatField;
    qoldiqsotish_in_d: TFloatField;
    qoldiqopt1: TFloatField;
    qoldiqopt1_in: TFloatField;
    qoldiqopt2: TFloatField;
    qoldiqopt2_in: TFloatField;
    qoldiqschet: TFloatField;
    qoldiqschet_in: TFloatField;
    qoldiqch2: TFloatField;
    qoldiqch2_in: TFloatField;
    qoldiqzakaz: TDateTimeField;
    qoldiqzakaz_ok: TDateTimeField;
    qoldiqzakaz_end: TDateTimeField;
    qoldiqzakaz_see: TFloatField;
    qoldiqzakaz_print: TSmallintField;
    qoldiqzakaz_gapir: TIntegerField;
    qoldiqfoiz_ch2: TFloatField;
    qoldiqfoiz_schet: TFloatField;
    qoldiqfoiz_opt1: TFloatField;
    qoldiqfoiz_opt2: TFloatField;
    qoldiqopt1_pl: TFloatField;
    qoldiqopt1_pl_in: TFloatField;
    qoldiqopt2_pl: TFloatField;
    qoldiqopt2_pl_in: TFloatField;
    Label28: TLabel;
    tarozi: TDBNumberEditEh;
    Label29: TLabel;
    zavod: TDBNumberEditEh;
    ulg: TDBNumberEditEh;
    Label30: TLabel;
    Label31: TLabel;
    mxik: TDBNumberEditEh;
    s_t_all: TZQuery;
    s_t_allid: TIntegerField;
    s_t_allnom: TStringField;
    s_t_allnom_ru: TStringField;
    s_t_allnom_sh: TStringField;
    s_t_allshtrix: TStringField;
    s_t_allqr: TStringField;
    s_t_allshtrixkod: TSmallintField;
    s_t_allqrkod: TSmallintField;
    s_t_allizm_id: TSmallintField;
    s_t_allizm1: TSmallintField;
    s_t_allturi: TSmallintField;
    s_t_allresept: TSmallintField;
    s_t_allaniq: TFloatField;
    s_t_allminimal: TFloatField;
    s_t_allmaksimal: TFloatField;
    s_t_allsotish: TFloatField;
    s_t_allzavod_id: TIntegerField;
    s_t_alldel_flag: TSmallintField;
    s_t_allupakavka: TIntegerField;
    s_t_alluser_id: TSmallintField;
    s_t_allclient_id: TIntegerField;
    s_t_allchangedate: TDateTimeField;
    s_t_allzavod: TStringField;
    s_t_allshtrix_in: TStringField;
    s_t_alltz_id: TSmallintField;
    s_t_allkg: TSmallintField;
    s_t_allshtrix_full: TStringField;
    s_t_allshtrix1: TStringField;
    s_t_allshtrix2: TStringField;
    s_t_allkat: TSmallintField;
    s_t_allbrend: TSmallintField;
    s_t_allpapka: TIntegerField;
    s_t_allshakl: TStringField;
    s_t_allinternom: TStringField;
    s_t_allmajbur_dori_id: TIntegerField;
    s_t_allmiqdor: TSmallintField;
    s_t_allshart: TSmallintField;
    s_t_allustama: TFloatField;
    s_t_allulg1: TFloatField;
    s_t_allulg1_pl: TFloatField;
    s_t_allulg2: TFloatField;
    s_t_allulg2_pl: TFloatField;
    s_t_allbank: TFloatField;
    s_t_allsena: TFloatField;
    s_t_allsena_d: TFloatField;
    s_t_allsena_in_d: TFloatField;
    s_t_allsotish_d: TFloatField;
    s_t_allkol_in: TSmallintField;
    s_t_allqoldiq: TStringField;
    s_t_allholat: TIntegerField;
    link: TZQuery;
    asos_slave: TZQuery;
    Dasos_slave: TDataSource;
    DBGrid1: TDBGrid;
    sh1: TZQuery;
    RzBitBtn2: TRzBitBtn;
    Label32: TLabel;
    foizli: TDBNumberEditEh;
    Label33: TLabel;
    sotishtokirim: TDBNumberEditEh;
    kod: TEdit;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure garajKeyPress(Sender: TObject; var Key: Char);
    procedure chekPrintersChange(Sender: TObject);
    procedure yorliqPrintersChange(Sender: TObject);
    procedure cbPrintersChange(Sender: TObject);
    procedure tanlashChange(Sender: TObject);
    procedure chekshablonChange(Sender: TObject);
    procedure yorliqshablonChange(Sender: TObject);
    procedure timerExit(Sender: TObject);
    procedure f5shablonChange(Sender: TObject);
    procedure f5PrintersChange(Sender: TObject);
    procedure IchkitovarKeyPress(Sender: TObject; var Key: Char);
    procedure IchkitovarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sertMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sertKeyPress(Sender: TObject; var Key: Char);
    procedure arxivExit(Sender: TObject);
    procedure serverpapkaExit(Sender: TObject);
    procedure timer1Exit(Sender: TObject);
    procedure timerKeyPress(Sender: TObject; var Key: Char);
    procedure a4PrintersChange(Sender: TObject);
    procedure a4shablonChange(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure seriyaKeyPress(Sender: TObject; var Key: Char);
    procedure seriyaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure haridorExit(Sender: TObject);
    procedure serverClick(Sender: TObject);
    procedure chekdelClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  setup: Tsetup;
  kirim_s,kirim_d,sotish,sotish_d,sotish_in,sotish_in_d,ulg1,ulg1_pl,ulg2,ulg2_pl,schet:currency;
implementation

{$R *.dfm}
uses fs_client,fulanish, Registry,Printers, fdms,Math;
procedure add_ombor;
var k,k_in:integer;
begin
  DMS.tombor.Append;
  DMS.tombor.FieldByName('id').AsInteger:=dms.link.fieldbyname('id').AsInteger;
  DMS.tombor.FieldByName('tovar_id').AsInteger:=dms.link.fieldbyname('tovar_id').AsInteger;
  DMS.tombor.FieldByName('t_in').AsInteger:=dms.link.fieldbyname('t_in').AsInteger;
  if dms.link.fieldbyname('t_in').AsInteger<1 then DMS.tombor.FieldByName('t_in').AsInteger:=1;
  //DMS.tombor.FieldByName('zavod_nom').AsString:='';
  DMS.tombor.FieldByName('nom').AsString:=dms.link.fieldbyname('nom').AsString;
  DMS.tombor.FieldByName('nom_sh').AsString:=dms.link.fieldbyname('nom_sh').AsString;
  DMS.tombor.FieldByName('kat').AsString:=dms.link.fieldbyname('knom').AsString;
  DMS.tombor.FieldByName('kirim').AsFloat:=kirim_s;
  DMS.tombor.FieldByName('kirim_d').AsFloat:=kirim_d;
  DMS.tombor.FieldByName('dollar').AsInteger:=dms.link.fieldbyname('kesak').AsInteger;
  DMS.tombor.FieldByName('kurs').AsFloat:=dms.link.fieldbyname('kesakd').AsFloat;
  if dms.link.fieldbyname('sana').AsVariant=null then
    DMS.tombor.FieldByName('sana').AsVariant:=null
  else
    DMS.tombor.FieldByName('sana').AsDateTime:=dms.link.fieldbyname('sana').AsDateTime;
  DMS.tombor.FieldByName('kir_all').AsInteger:=dms.link.fieldbyname('kol_in').AsInteger+dms.link.fieldbyname('kol').AsInteger*dms.link.fieldbyname('t_in').AsInteger;;
  if (dms.s_clientqoldiq.AsInteger=1) and (setup.s_t_all.fieldbyname('qoldiq').AsString='Y') then begin
    k:=Trunc(DMS.tombor.FieldByName('kir_all').AsInteger / setup.s_t_allkol_in.AsInteger); // 20
    k_in:=DMS.tombor.FieldByName('kir_all').AsInteger - k*setup.s_t_allkol_in.AsInteger;  // 0
    DMS.tombor.FieldByName('kol').AsInteger:=k;
    DMS.tombor.FieldByName('kol_in').AsInteger:=k_in;
    DMS.tombor.FieldByName('kol_all').AsInteger:=k*setup.s_t_allkol_in.AsInteger+k_in;
    DMS.tombor.FieldByName('qoldiq').AsVariant:=1
  end
  else
  begin
    DMS.tombor.FieldByName('kol').AsInteger:=0;
    DMS.tombor.FieldByName('kol_in').AsInteger:=0;
    DMS.tombor.FieldByName('kol_all').AsInteger:=0;
    DMS.tombor.FieldByName('qoldiq').AsVariant:=2;
  end;
  DMS.tombor.FieldByName('polka').AsString:=dms.link.fieldbyname('polka').AsString;
  DMS.tombor.FieldByName('seriya').AsString:=dms.link.fieldbyname('seriya').AsString;
  if dms.link.fieldbyname('srok').AsVariant=null then
    DMS.tombor.FieldByName('srok').AsVariant:=null
  else
    DMS.tombor.FieldByName('srok').AsDateTime:=dms.link.fieldbyname('srok').AsDateTime;

  DMS.tombor.FieldByName('sotish').AsFloat:=sotish;
  DMS.tombor.FieldByName('sotish_d').AsFloat:=sotish_d;
  DMS.tombor.FieldByName('sotish_in').AsFloat:=sotish_in;
  DMS.tombor.FieldByName('sotish_in_d').AsFloat:=sotish_in_d;
  DMS.tombor.FieldByName('ulg1').AsFloat:=ulg1;
  DMS.tombor.FieldByName('ulg1_pl').AsFloat:=ulg1_pl;
  DMS.tombor.FieldByName('ulg2').AsFloat:=ulg2;
  DMS.tombor.FieldByName('ulg2_pl').AsFloat:=ulg2_pl;
  DMS.tombor.FieldByName('schet').AsFloat:=schet;
  DMS.tombor.post;
end;
function RoundLess(Value, Divider: Integer): Integer;
var s:string;
begin
  s:=inttostr(value);
  s:=copy(s,1,length(s)-2)+'00';
  Result:=strtoint(s);
end;
procedure shablonlar;
var F: TSearchRec;mydir, Path: string; IniFile:TIniFile;
begin
  setup.chekshablon.Items.Clear;setup.yorliqshablon.Items.Clear;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  setup.chekshablon.Text := IniFile.ReadString('BAZA','shablonchek','chek58.fr3');
  setup.a4shablon.Text := IniFile.ReadString('BAZA','shablona4','chekla4.fr3');
  setup.yorliqshablon.Text := IniFile.ReadString('BAZA','shablonyorliq','');
  setup.f5shablon.Text := IniFile.ReadString('BAZA','f5shablon','');IniFile.Free;
  MyDir := ExtractFilePath(Application.ExeName);
  if FindFirst(Path + '*.fr3*', faAnyFile, F) = 0 then begin
    repeat
    if (F.Attr <> faDirectory) then begin
      setup.chekshablon.items.Add(F.Name);setup.a4shablon.items.Add(F.Name);
      setup.yorliqshablon.items.Add(F.Name);;setup.f5shablon.items.Add(F.Name);
    end;
    until FindNext(F) <> 0;FindClose(F);
   end;
end;
function StrReplace(const Str, Str1, Str2: string): string;
var P, L: Integer;
begin
  Result := str;L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then begin
      Delete(Result, P, L); // удаляем ее
      Insert(Str2, Result, P); // вставляем новую
    end;
  until P = 0;
end;

function lat_kril(asos:String):String;
var i:Integer;nom_lat,nom_kril,s:String;lat:boolean;
begin
 nom_lat:=asos;nom_kril:=asos;
  lat:=False;
  for i:=1 to Length(asos) do
  if (asos[i] in ['a' .. 'z']) or (asos[i] in ['A' .. 'Z']) then
    begin
      lat:=true;
      Break;
    end;
  if lat=True then
    begin
      for i:=1 to 60 do nom_kril:=StrReplace(nom_kril,harf_lat[i],harf_kril[i]);
      s:=nom_kril;
    end
  else
    begin
      for i:=1 to 60 do nom_lat:=StrReplace(nom_lat,harf_kril[i],harf_lat[i]);
      s:=nom_lat;
    end;
  Result:=s;
end;

procedure Tsetup.saveClick(Sender: TObject);
begin
  if dms.s_client.State=dsedit then
  dms.s_client.Post;
  setup.Close;
end;

procedure Tsetup.cancelClick(Sender: TObject);
begin
  if dms.s_client.State=dsedit then dms.s_client.Cancel;
  setup.Close;
end;

procedure Tsetup.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);
  IniFile.Free;
end;

procedure Tsetup.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  IniFile.free;
end;

procedure Tsetup.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  Setup.timer.Text:=FloatToStr(ulanish.protinout.Interval/1000);
  cbPrinters.Items.Assign(Printer.Printers);
  cbPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  chekPrinters.Items.Assign(Printer.Printers);
  chekPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  yorliqPrinters.Items.Assign(Printer.Printers);
  yorliqPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  f5Printers.Items.Assign(Printer.Printers);
  f5Printers.Text := Printer.Printers[Printer.PrinterIndex];
  a4Printers.Items.Assign(Printer.Printers);
  a4Printers.Text := Printer.Printers[Printer.PrinterIndex];
  // Update the label to reflect the default printer
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  chekPrinters.Text := IniFile.ReadString('BAZA','printerchek','');
  yorliqPrinters.Text := IniFile.ReadString('BAZA','printeryorliq','');
  f5Printers.Text := IniFile.ReadString('BAZA','printerf5','');
  a4Printers.Text := IniFile.ReadString('BAZA','printera4','');
  chekshablon.Text := IniFile.ReadString('BAZA','chekshablon','chek58.fr3');
  a4shablon.Text := IniFile.ReadString('BAZA','a4shablon','chekla4.fr3');
  arxiv.Text := IniFile.ReadString('BAZA','arxiv','d:\arxiv');
  haridor.Text := IniFile.ReadString('BAZA','haridor','d:\arxiv');
  serverpapka.Text := IniFile.ReadString('BAZA','serverpapka','c:\webserver');
  yorliqshablon.Text := IniFile.ReadString('BAZA','yorliqshablon','');
  f5shablon.Text := IniFile.ReadString('BAZA','f5shablon','');IniFile.Free;
  shablonlar;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then
  begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;

procedure Tsetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_client.State=dsedit then dms.s_client.Cancel;
end;

procedure Tsetup.garajKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tsetup.chekPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printerchek',chekPrinters.Text);IniFile.Destroy;
end;

procedure Tsetup.yorliqPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printeryorliq',yorliqPrinters.Text);IniFile.Destroy;
end;

procedure Tsetup.cbPrintersChange(Sender: TObject);
var IniFile: TIniFile; TempStr1, TempStr2: string; S: array[0..64] of char;
begin
  with Printer do begin
    // Set the new printer based on the ComboBox's selected printer
    PrinterIndex := cbPrinters.ItemIndex;
    // Store the printer name into a temporary string
    TempStr1 := Printers[PrinterIndex];
    // Delete the unnecessary portion of the printer name
    System.Delete(TempStr1, Pos(' on ', TempStr1), Length(TempStr1));
    // Create a TIniFile class
    IniFile := TIniFile.Create('WIN.INI');
    try
      // Retrieve the device name of the selected printer
      TempStr2 := IniFile.ReadString('Devices', TempStr1, '');
      // Change the default printer to that chosen by the user
      IniFile.WriteString('windows', 'device', TempStr1 + ',' + TempStr2);
      // Tell all windows that the default printer changed.
      StrCopy(S, 'windows');
      SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, LongInt(@S));
    finally
      IniFile.Free;
    end;
  end;
  // Update the label to reflect the new printer selection
  //lblPrinter.Caption := Printer.Printers[Printer.PrinterIndex];

end;


procedure Tsetup.tanlashChange(Sender: TObject);
var IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','strixqidir',inttostr(tanlash.ItemIndex));IniFile.Destroy;
end;

procedure Tsetup.chekshablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablonchek',chekshablon.Text);IniFile.Destroy;
  {n:=file_chek.ItemIndex;lblchek.Caption:=file_chek.Items[n];
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','chek',lblchek.Caption);IniFile.Destroy;}

end;

procedure Tsetup.yorliqshablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablonyorliq',yorliqshablon.Text);IniFile.Destroy;
end;

procedure Tsetup.timerExit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','timer',timer.Text);IniFile.Destroy;
  ulanish.protinout.Interval:=1000*StrToInt(timer.text);
end;

procedure Tsetup.f5shablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','f5shablon',f5shablon.Text);IniFile.Destroy;
end;

procedure Tsetup.f5PrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printerf5',f5Printers.Text);IniFile.Destroy;
end;

procedure Tsetup.IchkitovarKeyPress(Sender: TObject; var Key: Char);
begin
  if Ichkitovar.Checked=false then dms.s_clientichkitovar.value:=1 else dms.s_clientichkitovar.value:=0;
end;

procedure Tsetup.IchkitovarMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
begin
  if Ichkitovar.Checked=false then dms.s_clientichkitovar.value:=1 else dms.s_clientichkitovar.value:=0;
end;

procedure Tsetup.sertMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if sert.Checked=false then dms.s_clientsert.value:=1 else dms.s_clientsert.value:=0;
end;

procedure Tsetup.sertKeyPress(Sender: TObject; var Key: Char);
begin
  if sert.Checked=false then dms.s_clientsert.value:=1 else dms.s_clientsert.value:=0;
end;

procedure Tsetup.arxivExit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','arxiv',arxiv.Text);IniFile.Destroy;
end;

procedure Tsetup.serverpapkaExit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','serverpapka',serverpapka.Text);IniFile.Destroy;
end;

procedure Tsetup.timer1Exit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','timer',timer.Text);IniFile.Destroy;
  ulanish.protinout.Interval:=1000*StrToInt(timer.Text);
end;

procedure Tsetup.timerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tsetup.a4PrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printera4',a4Printers.Text);IniFile.Destroy;
end;

procedure Tsetup.a4shablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablona4',a4shablon.Text);IniFile.Destroy;
end;

procedure Tsetup.RzBitBtn5Click(Sender: TObject);
begin
dms.link.Close;dms.link.SQL.Clear;
dms.link.SQL.Add('select * from slave_main sm,asos_slave s,asos a  where main_id=207 and a.id=s.asos_id and sm.slave_id=s.id and a.tur_oper in (1,3,5) order by sm.id limit 1');
dms.link.Open;
while not dms.link.Eof do begin
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select s.id,a.tur_oper,sm.kirim_id from slave_main sm,asos_slave s,asos a where and a.tur_oper in (2) and a.id=s.asos_id and sm.slave_id=s.id and s.kol_sot=209'+dms.link.fieldbyname('slave_id').AsString);
  dms.main_link.Open;
   dms.link.Next;
end;
dms.link.Open;
end;

procedure Tsetup.FormActivate(Sender: TObject);
begin
  if dms.s_clientichkitovar.Value=1 then Ichkitovar.Checked:=True else Ichkitovar.Checked:=False;
  if dms.s_clientsert.Value=1 then sert.Checked:=True else sert.Checked:=False;
  if dms.s_clientseriya.Value=1 then seriya.Checked:=True else seriya.Checked:=False;

end;

procedure Tsetup.seriyaKeyPress(Sender: TObject; var Key: Char);
begin
  if seriya.Checked=false then dms.s_clientseriya.value:=1 else dms.s_clientseriya.value:=0;

end;

procedure Tsetup.seriyaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if seriya.Checked=false then dms.s_clientseriya.value:=1 else dms.s_clientseriya.value:=0;

end;

procedure Tsetup.haridorExit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','haridor',haridor.Text);IniFile.Destroy;
end;

procedure Tsetup.serverClick(Sender: TObject);
begin
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('UPDATE asos SET sana=changedate,seriya="9999" where tur_oper=2 and changedate is not null');
  dms.main_link.ExecSQL;


  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('UPDATE s_tovar SET user_id=43,nom_sh=null WHERE nom_sh = "1"');
  dms.main_link.ExecSQL;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('UPDATE `s_tovar` SET user_id=44,nom_sh=null WHERE nom_sh = "2"');
  dms.main_link.ExecSQL;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('UPDATE `s_tovar` SET user_id=101,nom_sh=null WHERE nom_sh = "3"');
  dms.main_link.ExecSQL;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('UPDATE `s_tovar` SET nom_sh=nom WHERE nom_sh is null or nom_sh = ""');
  dms.main_link.ExecSQL;

  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('UPDATE s_tovar SET shtrix_in = null,shtrix_full = null where shtrix_full="" or shtrix_full="null" or shtrix_full="0"');
  dms.main_link.ExecSQL;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('UPDATE s_tovar SET shtrix = null where shtrix="" or shtrix="null" or shtrix="0"');
  dms.main_link.ExecSQL;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('UPDATE s_tovar SET zavod_id = 2,izm_id = 3, izm1 = 2 where zavod_id="" or zavod_id is null ');
  dms.main_link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_kat set client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_x_tur set client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_brend set client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_t_otdel set client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_otdel set client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_pl set client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_kurs set user_id = '+admin_id+', client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_inv set user_id = '+admin_id+', client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE pl set user_id = '+admin_id+', client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_diler set user_id = '+admin_id+', client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE s_haridor set user_id = '+admin_id+', client_id = '+admin_clid+'  where client_id is null or client_id = 0');
  dms.link.ExecSQL;
  ShowMessage('Raxmat');

end;

procedure Tsetup.chekdelClick(Sender: TObject);
var i,j:integer;
begin
if kod.Text<>'2290' then exit;
if (MessageDlg('Diqqat, cheklarni o`chirasizmi, qayta tiklanmaydi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then exit;

dms.link.Close;dms.link.SQL.Clear;
dms.link.SQL.Add('select * from asos where sana<"2024-12-01" and tur_oper in (2) and h_id is null');
//dms.link.SQL.Add('select * from asos where tur_oper in (2) ');
dms.link.Open;
i:=0;j:=0;
while not dms.link.Eof do begin
  inc(i);inc(j);
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('delete from asos_slave where asos_id='+dms.link.fieldbyname('id').AsString);
  dms.main_link.ExecSQL;
  dms.link.Next;
  if i=100 then begin
    kod.Text:=IntToStr(j);
    i:=0;
  end;
end;
dms.link.Close;dms.link.SQL.Clear;
dms.link.SQL.Add('delete from asos where sana<"2024-12-01" and tur_oper in (2)');
dms.link.ExecSQL;

end;

procedure Tsetup.RzBitBtn1Click(Sender: TObject);
var ss,sd:string;sotish,sotish_d:Currency;
begin
  Memosoz.Visible:=true;Memosoz.Lines.Clear;Memosoz.Lines.Add('Tovarlarning sotish naxlari jarayoni boshlandi');
  Memosoz.Lines.Add('Iltimos kutib turing !!!');
  s_t_all.Close;s_t_all.SQL.Clear;
  s_t_all.SQL.Add('select * from s_tovar WHERE del_flag=1 order by id'); //and id=1737
  s_t_all.open;
  while not s_t_all.Eof do begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('SELECT s.id,s.sotish,s.sotish_d FROM asos_slave s, asos a where s.del_flag=1 and a.id=s.asos_id and s.tovar_id='+s_t_allid.AsString+' and a.tur_oper in (1,4,5) and (s.kol_ost > 0 or s.kol_in_ost>0) order by s.id desc');
    dms.link.open;
    sotish:=dms.link.fieldbyname('sotish').AsFloat;sotish_d:=dms.link.fieldbyname('sotish_d').AsFloat;
    ss:='';sd:='';
    if sotish>0 then
      ss:='sotish='+FloatToStr(sotish);
    if sotish_d>0 then
    begin
      if ss='' then  sd:='sotish_d='+FloatToStr(sotish_d);
    end
    else
        sd:=ss;
    if ss+sd<>'' then begin
      dms.link.Next;
      while not dms.link.eof do begin
        if sotish<>dms.link.fieldbyname('sotish').AsFloat then begin
          dms.main_link.Close;dms.main_link.SQL.Clear;
          dms.main_link.SQL.Add('update asos_slave set '+sd+' where id='+dms.link.fieldbyname('id').AsString);
          dms.main_link.ExecSQL;
          Memosoz.Lines.Add(' joriy/jami '+inttostr(s_t_all.RecNo)+''+inttostr(s_t_all.RecordCount)+' tovar '+s_t_allid.AsString+' nom '+s_t_allnom.AsString);
        end;
        dms.link.Next;
      end;
    end;
  s_t_all.Next;
  end; //s_t_all

  Memosoz.Lines.Add('Jarayon tugadi');

end;

procedure Tsetup.RzBitBtn2Click(Sender: TObject);
var kam,sot,limit:integer;s_t_id:string;
begin
  Memosoz.Visible:=true;Memosoz.Lines.Clear;Memosoz.Refresh;
  Memosoz.Lines.Add('Tovarlarning qoldiqlarini qayta hisoblash jarayoni boshlandi');
  Memosoz.Lines.Add('Iltimos kutib turing !!!');
  sh1.Open;
  Memosoz.Visible:=true;
  dms.shtrix.open;
  while not sh1.Eof do begin
    if not dms.shtrix.Locate('nom',sh1.fieldbyname('nom').AsString,[loCaseInsensitive]) then begin
      dms.shtrix.Append;dms.shtrix.FieldByName('nom').AsString:=sh1.fieldbyname('nom').AsString;
      dms.shtrix.FieldByName('turi').AsInteger:=sh1.fieldbyname('turi').AsInteger;
      dms.shtrix.FieldByName('tovar_id').AsInteger:=sh1.fieldbyname('tovar_id').AsInteger;dms.shtrix.post;
      Memosoz.Lines.add('+ ' + sh1.fieldbyname('nom').AsString);
    end;
    sh1.Next;
  end;
  Memosoz.Lines.Add('Jarayon tugadi, sabr uchun rahmat  !!!');

end;

end.
