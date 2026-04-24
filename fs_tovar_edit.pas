unit fs_tovar_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles,db, RzLabel,Mask, DBCtrlsEh, GridsEh, RzButton, IdBaseComponent,
  IdComponent,IdTCPConnection, IdTCPClient, IdHTTP, DBGridEh, RzRadChk, StdCtrls,
  DBCtrls, DBLookupEh, RzEdit, RzDBEdit, ExtCtrls, Menus, SUIPopupMenu,
  RzCmboBx, RzDBCmbo, ComCtrls, RzStatus, RzDBStat;

type
  Ts_tovar_edit = class(TForm)
    gnarh: TGroupBox;
    gclient: TGroupBox;
    Label8: TLabel;
    Galohida: TGroupBox;
    IdHTTP1: TIdHTTP;
    kat: TDBLookupComboboxEh;
    brend: TDBLookupComboboxEh;
    Label1: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    papka: TDBLookupComboboxEh;
    miqdor: TRzDBNumericEdit;
    Lsena: TLabel;
    Lsotish: TLabel;
    ustama: TRzDBNumericEdit;
    oldaniq: TRzDBNumericEdit;
    Gr_ulg: TGroupBox;
    Label18: TLabel;
    Lulg1_pl: TLabel;
    Lulg2: TLabel;
    Lulg2_pl: TLabel;
    Lbank: TLabel;
    ulg1: TRzDBNumericEdit;
    ulg1_pl: TRzDBNumericEdit;
    ulg2: TRzDBNumericEdit;
    ulg2_pl: TRzDBNumericEdit;
    bank: TRzDBNumericEdit;
    Label11: TLabel;
    asosiy: TRzDBNumericEdit;
    Label22: TLabel;
    ichki: TRzDBNumericEdit;
    Lsena_d: TLabel;
    Lsotish_d: TLabel;
    Label28: TLabel;
    t_otdel: TDBLookupComboboxEh;
    oldsotish: TRzNumericEdit;
    oldsotish_d: TRzNumericEdit;
    RzBitBtn1: TRzBitBtn;
    Edit2: TEdit;
    katadd: TRzBitBtn;
    Pnom: TPanel;
    Label25: TLabel;
    nom: TDBEdit;
    Label16: TLabel;
    nom_sh: TDBEdit;
    Pzavod: TPanel;
    Label6: TLabel;
    add: TRzBitBtn;
    Pbirlik: TPanel;
    Label7: TLabel;
    Lkol_in: TLabel;
    Label19: TLabel;
    tarozi: TRzDBNumericEdit;
    kol_in: TRzDBNumericEdit;
    izm: TDBLookupComboboxEh;
    Edit1: TEdit;
    zavod: TDBLookupComboboxEh;
    Lnds: TLabel;
    nds: TRzDBNumericEdit;
    GroupBox1: TGroupBox;
    DBGridEh2: TDBGridEh;
    holat: TRzCheckBox;
    resept: TRzCheckBox;
    shart: TRzCheckBox;
    Lizmnom: TLabel;
    izmnom: TDBEdit;
    GroupBox2: TGroupBox;
    save: TRzBitBtn;
    saveadd: TRzBitBtn;
    savewithout: TRzBitBtn;
    cancel: TRzBitBtn;
    oldnom: TEdit;
    oldshtrix: TEdit;
    zapis: TEdit;
    sikl: TsuiPopupMenu;
    Oxirgisotishnarxiasosiypriys1: TMenuItem;
    Copy1: TMenuItem;
    RzDBNumericEdit1: TRzDBNumericEdit;
    sena_d: TDBNumberEditEh;
    sotish_d: TDBNumberEditEh;
    Grsh: TGroupBox;
    Edit3: TEdit;
    add_shtrix: TRzBitBtn;
    add_ichki: TRzBitBtn;
    add_mxik: TRzBitBtn;
    DBGridEh1: TDBGridEh;
    Lfoiz: TLabel;
    foiz: TRzDBComboBox;
    sena: TDBNumberEditEh;
    sotish: TDBNumberEditEh;
    RzDBStatusPane1: TRzDBStatusPane;
    RzDBStateStatus1: TRzDBStateStatus;
    RzDBRichEdit1: TRzDBRichEdit;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure nomExit(Sender: TObject);
    procedure reseptMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reseptKeyPress(Sender: TObject; var Key: Char);
    procedure nomKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure shtrixkodKeyPress(Sender: TObject; var Key: Char);
    procedure shtrixkodMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure saveaddClick(Sender: TObject);
    procedure zavodKeyPress(Sender: TObject; var Key: Char);
    procedure zavodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure savewithoutClick(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure shartMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure shartKeyPress(Sender: TObject; var Key: Char);
    procedure zavodEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure nomEnter(Sender: TObject);
    procedure aniqExit(Sender: TObject);
    procedure miqdorExit(Sender: TObject);
    procedure ulg1Exit(Sender: TObject);
    procedure papkaEnter(Sender: TObject);
    procedure sotishEnter(Sender: TObject);
    procedure senaExit(Sender: TObject);
    procedure sena_dExit(Sender: TObject);
    procedure sotish_dEnter(Sender: TObject);
    procedure holatKeyPress(Sender: TObject; var Key: Char);
    procedure holatMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label11Click(Sender: TObject);
    procedure taroziEnter(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure kataddClick(Sender: TObject);
    procedure izmChange(Sender: TObject);
    procedure add_mxikClick(Sender: TObject);
    procedure add_ichkiClick(Sender: TObject);
    procedure add_shtrixClick(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Oxirgisotishnarxiasosiypriys1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure sotishExit(Sender: TObject);
    procedure foizChange(Sender: TObject);
    procedure DBNumberEditEh1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  s_tovar_edit: Ts_tovar_edit;
  kurs_:Currency;

implementation

{$R *.dfm}
uses fs_client,fulanish, fdms, Math,fs_tovar, fs_ostatka, fs_tovar_kirim, frxBarcode,fs_t_otdel,
  fzavod, fsetup,ClipBrd;
function _IntToStr(i, Wide: Cardinal): string;
var i1: Cardinal;
begin
  Result := '';
  repeat
    i1 := i mod 10;i := i div 10;
    Result := char(i1 + ord('0')) + Result;
    dec(Wide);
  until (Wide < 1) and (i < 1)
end;
function StrReplace(const Str, Str1, Str2: string): string;
var
  P, L: Integer;
begin
  Result := str;
  L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then
    begin
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

procedure Ts_tovar_edit.saveClick(Sender: TObject);
function between(text,s1,s2:string): boolean;begin if ((text >= s1) and (text <= s2)) then result := True else result := False;end;
var i,yangi:integer;
begin
  if dms.s_tovarnom.AsString='' then begin
    ShowMessage('Tovar nomini kiriting');ActiveControl:=nom;Exit;
  end;
  if (dms.s_tovarshart.AsInteger=1) and (dms.s_tovarmiqdor.AsInteger=0) then begin
    ShowMessage('Bo`lishi shart dorining miqdorini kiriting');ActiveControl:=miqdor;Exit;
  end;
  if (dms.s_tovarizm_id.AsInteger=0) then begin
    ShowMessage('O`lchov birligini tanlang');ActiveControl:=izm;Exit;
  end;
  if (dms.s_tovarkol_in.AsInteger=0) then begin
    ShowMessage('Tovarning ichki sonini kiriting');ActiveControl:=kol_in;Exit;
  end;
  if (dms.s_tovarshtrix_in.AsString='0') or (dms.s_tovarshtrix_in.AsString='') then
  begin
    dms.s_tovarshtrix_in.AsVariant:=null;dms.s_tovarshtrix_full.AsVariant:=null;
  end;
  if (dms.s_clientlastta_id.AsInteger>0)  and (between(copy(nom.Text,1,1),'0','9')) and (between(copy(nom.Text,2,1),'0','9')) and (between(copy(nom.Text,3,1),'0','9')) then
  if strtoint(copy(nom.Text,1,4))>dms.s_clientlastta_id.AsInteger then begin
    dms.s_client.Edit;dms.s_clientlastta_id.AsInteger:=strtoint(copy(nom.Text,1,4));dms.s_client.post;
  end;

  if kat.Value=null then dms.s_tovarkat.Value:=0;
  if brend.Value=null then dms.s_tovarbrend.Value:=0;
  if nom_sh.Text='' then dms.s_tovarnom_sh.AsString:=dms.s_tovarnom.AsString;
  if (DMS.s_tovarshtrix.AsString='') and dms.tshtrix.Locate('turi',1,[loCaseInsensitive]) then
    DMS.s_tovarshtrix.AsString:=dms.tshtrix.fieldbyname('nom').AsString;
  if (DMS.s_tovarshtrix_full.AsString='') and dms.tshtrix.Locate('turi',2,[loCaseInsensitive]) then
  begin
    DMS.s_tovarshtrix_in.AsString:=copy(dms.tshtrix.fieldbyname('nom').AsString,3,5);
    DMS.s_tovarshtrix_full.AsString:=dms.tshtrix.fieldbyname('nom').AsString;
  end;
  if dms.s_tovar.State<>dsbrowse then 
  dms.s_tovar.Post;
  while not dms.tshtrix.Eof do begin
    if DMS.tshtrix.fieldbyname('tovar_id').AsInteger=0 then begin
      DMS.tshtrix.Edit;
      DMS.tshtrix.fieldbyname('tovar_id').AsInteger:=DMS.s_tovarid.AsInteger;
      DMS.tshtrix.post;
    end;
    DMS.tshtrix.Next;
  end;
  
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  if dms.qoldiq.Active=true then

  if dms.qoldiq.RecordCount>0 then begin
    dms.qoldiq.First;
    while not dms.qoldiq.Eof do begin
      dms.qoldiq.Edit;
      if dms.s_tovarsotish.AsFloat>0 then
        dms.qoldiqsotish.AsFloat:=dms.s_tovarsotish.AsFloat;
      if dms.s_tovarsotish_d.AsFloat>0 then
        dms.qoldiqsotish_d.AsFloat:=dms.s_tovarsotish_d.AsFloat;
      if (dms.s_tovarsena.AsFloat>0) and (dms.qoldiqsena.AsFloat=0) then begin
        dms.qoldiqsena.AsFloat:=dms.s_tovarsena.AsFloat;
        dms.qoldiqsumma.AsFloat:=dms.qoldiqkol.AsInteger*dms.qoldiqsena.AsFloat;
        if dms.s_tovarkol_in.AsInteger>1 then
          dms.qoldiqsena.AsFloat:=roundto(dms.qoldiqsena.AsFloat/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value)
        else
          dms.qoldiqsumma_in.AsFloat:=0;
      end;
      dms.qoldiqsumma_in.AsFloat:=dms.qoldiqkol_in.AsInteger*dms.qoldiqsena.AsFloat;
      dms.qoldiqsumma_all.AsFloat:=dms.qoldiqsumma.AsFloat+dms.qoldiqsumma_in.AsFloat;
      if dms.s_tovarulg1.AsFloat>0 then begin
        dms.qoldiqopt1.AsFloat:=dms.s_tovarulg1.AsFloat;
        dms.qoldiqopt1_pl.AsFloat:=dms.s_tovarulg1_pl.AsFloat;
        dms.qoldiqopt2.AsFloat:=dms.s_tovarulg2.AsFloat;
        dms.qoldiqopt2_pl.AsFloat:=dms.s_tovarulg2_pl.AsFloat;
        dms.qoldiqschet.AsFloat:=dms.s_tovarbank.AsFloat;
      end;
      if dms.s_tovarkol_in.AsInteger>1 then begin
        if dms.s_tovarsotish.AsFloat>0 then
          dms.qoldiqsotish_in.AsFloat:=RoundTo(dms.s_tovarsotish.AsFloat/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
        if dms.s_tovarulg1.AsFloat>0 then begin
          dms.qoldiqopt1_in.AsFloat:=RoundTo(dms.s_tovarulg1.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
          dms.qoldiqopt1_pl_in.AsFloat:=RoundTo(dms.s_tovarulg1_pl.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
          dms.qoldiqopt2_in.AsFloat:=RoundTo(dms.s_tovarulg2.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
          dms.qoldiqopt2_pl_in.AsFloat:=RoundTo(dms.s_tovarulg2_pl.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
          dms.qoldiqschet_in.AsFloat:=RoundTo(dms.s_tovarbank.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
        end;
      end;
      dms.qoldiq.Post;
      dms.qoldiq.Next;
    end;
    dms.qoldiq.Refresh;
  end;
  
  dms.link.close;dms.link.SQL.Clear;
  dms.link.sql.add('SELECT s.id,main.serial FROM slave_main s,main where main.id=s.main_id and s.slave_id=:id order by id');
  dms.link.Open;
  s_tovar_edit.Close;
  //if yangi=0 then
  //  s_tovar.gclient.Setfocus
  //else
  //  s_tovar.xnew.Setfocus;
end;

procedure Ts_tovar_edit.cancelClick(Sender: TObject);
begin
  dms.s_tovar.Cancel;
  {if zapis.Text='1' then begin
    dms.s_tovar.Edit;
    dms.s_tovardel_flag.AsInteger:=0;
    dms.s_tovarnom_sh.AsString:='0';
    dms.s_tovar.post;
    ShowMessage(dms.s_tovarnom.AsString+' uchirildi');
    dms.s_tovar.Refresh;
  end;}
  s_tovar_edit.Close;
end;

procedure Ts_tovar_edit.nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_tovar_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_tovar_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_tovar_edit.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin

  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then
  begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;
procedure Ts_tovar_edit.addClick(Sender: TObject);
begin
  if dms.s_zavod.Locate('nom',Edit1.Text,[loCaseInsensitive]) then begin
    ShowMessage(Edit1.Text+' Bazada mavjud !!!');
    exit;
  end;
  if MessageDlg(Trim(Edit1.Text)+' - Ishlab chiqaruvchini bazaga qo`shashizmi ?',mtInformation,[mbYes, mbNo], 0) = mrYes then
  begin
    dms.s_zavod.Append;
    dms.s_zavod.FieldByName('nom').Value:=edit1.Text;
    dms.s_zavod.post;
    zavod.Refresh;
    zavod.Value:=dms.s_zavod.FieldByName('id').Value;
  end;
end;

procedure Ts_tovar_edit.FormActivate(Sender: TObject);
begin
  if dms.s_clientdollar.AsFloat=1 then begin
  DMS.s_kurs.Open;DMS.s_kurs.Last;dms.s_kurs.First;kurs_:=0;
  while not dms.s_kurs.Eof do begin
    if (date()>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (date() <= dms.s_kurs.FieldByName('data2').AsDateTime) then
      kurs_:=dms.s_kurs.Fieldbyname('dollar').AsVariant;
    dms.s_kurs.Next;
  end; // while
  if kurs_=0 then begin
   ShowMessage('Diqqat !!! Bugungi kurs kiritilmagan'); exit;
  end;
  end;
  

   if dms.s_clientmxik.AsInteger=0 then begin
    add_mxik.Visible:=false;Lnds.Visible:=false;nds.Visible:=false;Lizmnom.Visible:=false;izmnom.Visible:=false;
  end;

  if dms.s_clientshtrix.AsInteger =0 then Grsh.Visible:=False;
  if dms.s_izm.FieldByName('turi').AsInteger < 0 then begin
    Lkol_in.Visible:=true;kol_in.Visible:=true;
  end
  else begin
    Lkol_in.Visible:=false;kol_in.Visible:=false;
  end;
  if (dms.s_clientdollar.AsInteger = 1) or (dms.s_clientdollar.AsInteger = 2) then begin
    Lsena_d.Visible:=true;sena_d.Visible:=true;
    Lsotish_d.Visible:=true;sotish_d.Visible:=true;
    if dms.s_clientdollar.AsInteger = 2 then begin
      Lsena.Visible:=false;sena.Visible:=false;
      Lsotish.Visible:=false;sotish.Visible:=false;
    end;
  end
  else
  begin
    Lsena_d.Visible:=false;sena_d.Visible:=false;
    Lsotish_d.Visible:=false;sotish_d.Visible:=false;
  end;

  if (dms.s_tovar.State=dsinsert) and (dms.s_zavod.RecordCount=1) then begin
    zavod.Value:=dms.s_zavod.fieldbyname('id').AsInteger;zavod.TabStop:=false;

  end;
  if  (dms.s_tovar.State=dsEdit)   then   // and (admin_type='2')
  begin
    save.Visible:=false;saveadd.Visible:=false;
    savewithout.Visible:=true;DBGridEh1.Visible:=false;
    //l1.Visible:=true;l2.Visible:=true;t1.Visible:=true;b1.Visible:=true;
  end
  else
  begin
    save.Visible:=true;saveadd.Visible:=true;
    savewithout.Visible:=true;
    DBGridEh1.Visible:=true;
    //l1.Visible:=false;l2.Visible:=false;t1.Visible:=false;b1.Visible:=false;
  end;
  //if (admin_type='3') or (admin_type='10') then begin
    save.Visible:=True;saveadd.Visible:=false;
    savewithout.Visible:=false;DBGridEh1.Visible:=true;
    //l1.Visible:=false;l2.Visible:=false;t1.Visible:=false;b1.Visible:=false;
  //end;
  //if (admin_type='2') and (ulanish.metod.ItemIndex=0) then
  //begin
    save.Visible:=true;saveadd.Visible:=true;
    savewithout.Visible:=true;DBGridEh1.Visible:=true;
    //l1.Visible:=false;l2.Visible:=false;t1.Visible:=false;b1.Visible:=false;
  //end;
  {if dms.s_tovarnom_ru.AsVariant=null then begin
    lnom_ru.Visible:=False;nom_ru.Visible:=False;
  end
  else
  begin
    lnom_ru.Visible:=true;nom_ru.Visible:=true;
  end;}
  if DMS.s_clientat91.Value=2 then begin
    shart.Visible:=false;
  end;
  if DMS.s_clientulg.Value=0 then begin
    Gr_ulg.Visible:=false;
  end;
  if DMS.s_clientulg.Value=2 then begin
    Lulg1_pl.Visible:=false;
    ulg1_pl.Visible:=false;
    Lulg2.Visible:=false;
    ulg2.Visible:=false;
    Lulg2_pl.Visible:=false;
    ulg2_pl.Visible:=false;
    Lbank.Visible:=false;
    bank.Visible:=false;
  end;
  if DMS.s_clientfoizli.Value<0 then begin
    Lfoiz.Visible:=false;foiz.Visible:=false;
  end;
  s_tovar_edit.nom.SetFocus;
end;

procedure Ts_tovar_edit.nomExit(Sender: TObject);
var s:string;i,x:integer;
begin
  if nom.Text='' then exit;
  if nom_sh.Text='' then dms.s_tovarnom_sh.AsString:=nom.Text;
  s:=nom.Text;
  x:=0;
  for i:=1 to 8 do begin
    if (S[i] in ['0'..'9']) or (S[i] in [',','.',' ','/','\']) then
      x:=x+1
    else
      break;
  end;
  if x=0 then exit;
  s:=copy(s,x+1,length(s)-x);
  dms.s_tovarnom_ru.AsString:=s;
end;

procedure Ts_tovar_edit.reseptMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if resept.Checked=false then dms.s_tovarresept.value:=1 else dms.s_tovarresept.value:=0;
end;

procedure Ts_tovar_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_tovar.State<>dsBrowse then
  dms.s_tovar.Cancel; 
end;

procedure Ts_tovar_edit.reseptKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #32 then if resept.Checked=false then dms.s_tovarresept.value:=1 else dms.s_tovarresept.value:=0;
 if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_tovar_edit.nomKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var s,s1,s2:string;y:integer;
begin
  if length(nom.Text) > 2 then begin
    s:=trim(nom.Text);s1:=s;s2:='';
    y:=pos(' ',s);
    if y>0 then begin
      s1:=copy(s,1,y-1);
      s2:=copy(s,y+1,length(s)-y);
    end;
    dms.s_tovar_link.Close;dms.s_tovar_link.SQL.Clear;
    dms.s_tovar_link.SQL.Add('select * from s_tovar WHERE del_flag=1 and ');
    if s2<>'' then begin
      dms.s_tovar_link.SQL.Add('(((nom like "%'+lat_kril(s1)+'%") or (nom like "%'+s1+'%"))');
      dms.s_tovar_link.SQL.Add(' and ((nom like "%'+lat_kril(s2)+'%") or (nom like "%'+s2+'%"))) order by nom');
    end
    else
    begin
      dms.s_tovar_link.SQL.Add('(((nom like "%'+lat_kril(s1)+'%") or (nom like "%'+s1+'%"))');
      dms.s_tovar_link.SQL.Add(') order by nom');
    end;
    dms.s_tovar_link.open;
  end;
end;

procedure Ts_tovar_edit.shtrixkodKeyPress(Sender: TObject; var Key: Char);
begin
 //if Key = #32 then if shtrixkod.Checked=false then dms.s_tovarshtrixkod.value:=1 else dms.s_tovarshtrixkod.value:=0;
 if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_tovar_edit.shtrixkodMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //if shtrixkod.Checked=false then dms.s_tovarshtrixkod.value:=1 else dms.s_tovarshtrixkod.value:=0;

end;

procedure Ts_tovar_edit.DBGridEh1DblClick(Sender: TObject);
var s:string;
begin
  {if MessageDlg('Ushnu shtrix-kod tanlangan tovarga tegishlimi?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     s:=shtrix.Text;
     DMS.s_tovar.Cancel;
     dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
     dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and id='+dms.s_tovar_link.fieldbyname('id').AsString);
     dms.s_tovar.open;
     DMS.s_tovar.Edit;
     DMS.s_tovarshtrix.Value:=s;
   end;}
end;

procedure Ts_tovar_edit.saveaddClick(Sender: TObject);
function between(text,s1,s2:string): boolean;begin if ((text >= s1) and (text <= s2)) then result := True else result := False;end;
var i:integer;
begin
  if (dms.s_tovarkol_in.AsInteger=0) then begin
    ShowMessage('Tovarning ichki sonini kiriting');ActiveControl:=kol_in;Exit;
  end;
  if dms.s_tovarnom.AsString='' then begin
    ShowMessage('Tovar nomini kiriting');ActiveControl:=nom;Exit;
  end;
  {if (dms.s_tovarturi.AsInteger=1) and (dms.s_tovaraniq.AsFloat=0) then begin
    ShowMessage('Ushbu tovar reestrrga kiritilgan. Qati`y belgilangan narxini kiriting');ActiveControl:=aniq;Exit;
  end;}
  if (dms.s_tovarshart.AsInteger=1) and (dms.s_tovarmiqdor.AsInteger=0) then begin
    ShowMessage('Bo`lishi shart dorining miqdorini kiriting');ActiveControl:=miqdor;Exit;
  end;
  if (dms.s_tovarizm_id.AsInteger=0) then begin
    ShowMessage('O`lchov birligini tanlang');ActiveControl:=izm;Exit;
  end;
  if (dms.s_clientlastta_id.AsInteger>0)  and (between(copy(nom.Text,1,1),'0','9')) and (between(copy(nom.Text,2,1),'0','9')) and (between(copy(nom.Text,3,1),'0','9')) then
  if strtoint(copy(nom.Text,1,4))>dms.s_clientlastta_id.AsInteger then begin
    dms.s_client.Edit;dms.s_clientlastta_id.AsInteger:=strtoint(copy(nom.Text,1,4));dms.s_client.post;
  end;
  if kat.Value=null then dms.s_tovarkat.Value:=0;
  if brend.Value=null then dms.s_tovarbrend.Value:=0;
  if (DMS.s_tovarshtrix.AsString='') and dms.tshtrix.Locate('turi',1,[loCaseInsensitive]) then
    DMS.s_tovarshtrix.AsString:=dms.tshtrix.fieldbyname('nom').AsString;
  if (DMS.s_tovarshtrix_full.AsString='') and dms.tshtrix.Locate('turi',2,[loCaseInsensitive]) then
  begin
    DMS.s_tovarshtrix_in.AsString:=copy(dms.tshtrix.fieldbyname('nom').AsString,3,5);
    DMS.s_tovarshtrix_full.AsString:=dms.tshtrix.fieldbyname('nom').AsString;
  end;
  dms.s_tovar.Post;
  while not dms.tshtrix.Eof do begin
    if DMS.tshtrix.fieldbyname('tovar_id').AsInteger=0 then begin
      DMS.tshtrix.Edit;
      DMS.tshtrix.fieldbyname('tovar_id').AsInteger:=DMS.s_tovarid.AsInteger;
      //DMS.tshtrix.fieldbyname('turi').AsInteger:=2;
      DMS.tshtrix.post;
    end;
    DMS.tshtrix.Next;
  end;

  if dms.qoldiq.RecordCount>0 then begin
    dms.qoldiq.First;
    while not dms.qoldiq.Eof do begin
      dms.qoldiq.Edit;
      if dms.s_tovarsotish.AsFloat>0 then
        dms.qoldiqsotish.AsFloat:=dms.s_tovarsotish.AsFloat;
      if dms.s_tovarulg1.AsFloat>0 then begin
        dms.qoldiqopt1.AsFloat:=dms.s_tovarulg1.AsFloat;
        dms.qoldiqopt1_pl.AsFloat:=dms.s_tovarulg1_pl.AsFloat;
        dms.qoldiqopt2.AsFloat:=dms.s_tovarulg2.AsFloat;
        dms.qoldiqopt2_pl.AsFloat:=dms.s_tovarulg2_pl.AsFloat;
        dms.qoldiqschet.AsFloat:=dms.s_tovarbank.AsFloat;
      end;
      if dms.s_tovarkol_in.AsInteger>0 then begin
        if dms.s_tovarsotish.AsFloat>0 then
          dms.qoldiqsotish_in.AsFloat:=RoundTo(dms.s_tovarsotish.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
        if dms.s_tovarulg1.AsFloat>0 then begin
          dms.qoldiqopt1_in.AsFloat:=RoundTo(dms.s_tovarulg1.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
          dms.qoldiqopt1_pl_in.AsFloat:=RoundTo(dms.s_tovarulg1_pl.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
          dms.qoldiqopt2_in.AsFloat:=RoundTo(dms.s_tovarulg2.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
          dms.qoldiqopt2_pl_in.AsFloat:=RoundTo(dms.s_tovarulg2_pl.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
          dms.qoldiqschet_in.AsFloat:=RoundTo(dms.s_tovarbank.AsFloat/dms.s_tovarkol_in.AsInteger,-3);
        end;
      end;
      dms.qoldiq.Post;
      dms.qoldiq.Next;
    end;
    dms.qoldiq.Refresh;
  end;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  s_tovar_edit.Close;
  if dms.qoldiq.Active=false then dms.qoldiq.Open;
  dms.qoldiq.append;
  dms.qoldiq.FieldByName('asos_id').AsInteger:=0;
  dms.qoldiq.FieldByName('tovar_id').AsInteger:=dms.s_tovarid.AsInteger;
  dms.qoldiq.FieldByName('user_id').AsInteger:=strtoint(admin_id);
  dms.qoldiq.FieldByName('turi').AsInteger:=dms.s_tovarturi.AsInteger;
  dms.qoldiq.FieldByName('foiz').AsInteger:=20;
  if dms.s_tovar.FieldByName('kol_in').AsInteger>0 then
  begin
    dms.qoldiq.FieldByName('foiz_in').AsInteger:=20;s_ostatka.Gichki.Visible:=true;
  end
  else
  begin
    s_ostatka.Gichki.Visible:=false;
  end;
  dms.qoldiq.FieldByName('resept').AsInteger:=dms.s_tovarresept.AsInteger;
  dms.qoldiq.FieldByName('izm_id').AsInteger:=dms.s_tovarizm_id.AsInteger;
  dms.qoldiq.FieldByName('izm1').AsInteger:=dms.s_tovarizm1.AsInteger;
  dms.qoldiqqrkod.Value:=0;
    dms.qoldiq.FieldByName('sotish').AsFloat:=0;
  s_tovar_edit.Close;
  s_ostatka.showmodal;
end;

procedure Ts_tovar_edit.zavodKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_tovar_edit.zavodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_BACK then dms.s_tovarzavod_id.AsVariant:=null;
end;

procedure Ts_tovar_edit.savewithoutClick(Sender: TObject);
begin
  if (dms.s_tovarkol_in.AsInteger=0) then begin
    ShowMessage('Tovarning ichki sonini kiriting');ActiveControl:=kol_in;Exit;
  end;
  dms.s_tovar.Cancel;s_tovar_edit.Close;
  if dms.qoldiq.Active=false then dms.qoldiq.Open;
  dms.qoldiq.append;
  dms.qoldiq.FieldByName('asos_id').AsInteger:=0;
  dms.qoldiq.FieldByName('tovar_id').AsInteger:=dms.s_tovarid.AsInteger;
  dms.qoldiq.FieldByName('user_id').AsInteger:=strtoint(admin_id);
  dms.qoldiq.FieldByName('turi').AsInteger:=dms.s_tovarturi.AsInteger;
  dms.qoldiq.FieldByName('foiz').AsInteger:=20;
  if dms.s_tovar.FieldByName('kol_in').AsInteger>0 then
  begin
    dms.qoldiq.FieldByName('foiz_in').AsInteger:=20;s_ostatka.Gichki.Visible:=true;
  end
  else
  begin
    s_ostatka.Gichki.Visible:=false;
  end;
  dms.qoldiq.FieldByName('resept').AsInteger:=dms.s_tovarresept.AsInteger;
  dms.qoldiq.FieldByName('izm_id').AsInteger:=dms.s_tovarizm_id.AsInteger;
  dms.qoldiq.FieldByName('izm1').AsInteger:=dms.s_tovarizm1.AsInteger;
  dms.qoldiqqrkod.Value:=0;
  {if dms.s_tovarturi.AsInteger=1 then
  begin
    dms.qoldiq.FieldByName('sotish').AsFloat:=dms.s_tovaraniq.AsFloat;
    dms.qoldiq.FieldByName('sotish').AsFloat:=dms.s_tovaraniq.AsFloat;
  end
  else}
  dms.qoldiq.FieldByName('sotish').AsFloat:=0;
  s_tovar_edit.Close;
  s_ostatka.showmodal;
end;

procedure Ts_tovar_edit.b1Click(Sender: TObject);
begin
  {if t1.Text='' then begin
    ShowMessage('Xabar katakchasi b`osh');t1.SetFocus;exit;
  end;
  if MessageDlg('Uchbu xabarni administrtorga jo`natasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.comments.open;dms.comments.Append;
    dms.comments.FieldByName('name').AsString:='tovar_baza';
    dms.comments.FieldByName('file_path').AsString:='';
    dms.comments.FieldByName('text').AsString:=t1.Text;
    dms.comments.FieldByName('tovar_id').AsInteger:=DMS.s_tovarid.AsInteger;
    dms.comments.FieldByName('status').AsInteger:=1;
    dms.comments.FieldByName('client_id').AsInteger:=StrToInt(admin_id);
    dms.comments.FieldByName('date').AsDateTime:=DMS.setupvaqt.AsDateTime;
    dms.comments.Post;
    IdHttp1.Get(UTF8Encode('http://94.158.53.140/savdoclient.php?text=tovar_baza&ver=13&msisdn=998935602290'));
    ShowMessage('Administratorga xabar jo`natildi. Javobni SMS tarzda olasiz');
    dms.s_tovar.Cancel;dms.s_tovar.Edit;
    dms.s_tovarnom_ru.AsString:=t1.Text;dms.s_tovar.Post;
    s_tovar_edit.Close;
  end;}

end;

procedure Ts_tovar_edit.shartMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if shart.Checked=false then dms.s_tovarshart.value:=1 else dms.s_tovarshart.value:=0;

end;

procedure Ts_tovar_edit.shartKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #32 then if shart.Checked=false then dms.s_tovarshart.value:=1 else dms.s_tovarshart.value:=0;
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_tovar_edit.zavodEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id from s_tovar WHERE del_flag=1 and zavod_id = '+dms.s_zavod.fieldbyname('id').AsString);
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage(dms.s_zavod.fieldbyname('nom').AsString+dms.s_zavod.fieldbyname('id').AsString+' zavod nomidan '+inttostr(dms.link.RecordCount)+' ta amal bajariljan');
    exit;
  end;
  if MessageDlg('Ushnu zavodni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dms.s_zavod.Delete;
    dms.s_tovarzavod_id.AsVariant:=null;
  end;
end;

procedure Ts_tovar_edit.nomEnter(Sender: TObject);
begin
  if nom.Text<>'' then exit;
  dms.s_client.Refresh;
  if dms.s_clientlastta_id.AsInteger=0 then exit;
  nom.Text:=_IntToStr(dms.s_clientlastta_id.AsInteger+1,4)+'. ';
  nom.SelStart:=Length(nom.Text);
end;

procedure Ts_tovar_edit.aniqExit(Sender: TObject);
begin
  {if aniq.Value>0 then begin
    //maksimal.Value:=aniq.Value;
    //sotish.Value:=aniq.Value;
    dms.s_tovarturi.value:=1;
    turi.Checked:=true;
  end
  else
    dms.s_tovarturi.value:=0;
    turi.Checked:=false;
  //if (maksimal.Value>0) and (sotish.Value=0) then begin
  //  sotish.Value:=aniq.Value;
  //end; }
end;

procedure Ts_tovar_edit.miqdorExit(Sender: TObject);
begin
  if miqdor.Value>0 then begin
    //maksimal.Value:=aniq.Value;
    //sotish.Value:=aniq.Value;
    dms.s_tovarshart.value:=1;
    shart.Checked:=true;
  end
  else
    dms.s_tovarshart.value:=0;
    shart.Checked:=false;
end;

procedure Ts_tovar_edit.ulg1Exit(Sender: TObject);
begin
  if dms.s_tovarulg1.AsFloat=0 then exit;
  //dms.s_tovarsotish.Value:=RoundTo(dms.s_tovarulg1.AsFloat+dms.s_tovarulg1.AsFloat*30/100,DMS.s_clientyaxlitlash.Value);
  dms.s_tovarulg1_pl.Value:=RoundTo(dms.s_tovarulg1.AsFloat+dms.s_tovarulg1.AsFloat*5/100,DMS.s_clientyaxlitlash.Value);
  dms.s_tovarulg2.Value:=RoundTo(dms.s_tovarulg1.AsFloat+dms.s_tovarulg1.AsFloat*10/100,DMS.s_clientyaxlitlash.Value);
  dms.s_tovarulg2_pl.Value:=RoundTo(dms.s_tovarulg2.AsFloat+dms.s_tovarulg2.AsFloat*5/100,DMS.s_clientyaxlitlash.Value);
  dms.s_tovarbank.Value:=RoundTo(dms.s_tovarulg1.AsFloat+dms.s_tovarulg1.AsFloat*20/100,DMS.s_clientyaxlitlash.Value);
end;

procedure Ts_tovar_edit.papkaEnter(Sender: TObject);
begin
  If papka.Value=null then papka.Value:=99;
end;

procedure Ts_tovar_edit.sotishEnter(Sender: TObject);
begin
  if dms.s_clientfoizli.AsInteger<0 then exit;
  if (sena.Value>0) and ((sotish.Value=0) or (sotish.Value=null)) then begin
    sotish.Value:=sena.Value;
  end;
end;

procedure Ts_tovar_edit.senaExit(Sender: TObject);
begin
  if (sena.Value=0) or (sena.Value=null) then exit;
  if DMS.s_clientdollar.AsInteger>0 then begin
    if (sena_d.Value=0) or (sena_d.Value=null) then sena_d.Value:=sena.value/kurs_;
  end;
  if foiz.Value='' then exit;

  if (dms.s_clientfoizli.AsInteger=0) and ((sena.Value>0) or (sotish.Value>0)) then begin
    if (sena.Value=0) or (sena.Value=null) or (dms.s_tovarsotish.AsFloat>0) then
      sena.Value:=sotish.Value
    else
      sotish.Value:=sena.Value;
    exit;
  end;
  if dms.s_clientfoizli.AsInteger<0  then exit;
  if (sena.Value=0) or (sena.Value=null) or (dms.s_tovarsotish.AsFloat>0) then exit;
  dms.s_tovarsotish.AsFloat:=RoundTo(sena.value+sena.value*DMS.s_clientfoiz.Value/100,DMS.s_clientyaxlitlash.Value);
end;

procedure Ts_tovar_edit.sena_dExit(Sender: TObject);
begin
  if (sena_d.Value=0) or (sena_d.Value=null) then exit;
  if (sena.Value=0) or (sena.Value=null) then sena.Value:=sena_d.value*kurs_;
  if dms.s_clientfoizli.AsInteger=0  then exit;
  if (sotish_d.Value=0) or (sotish_d.Value=null) then
    dms.s_tovarsotish_d.AsFloat:=RoundTo(sena_d.value+sena_d.value*DMS.s_clientfoiz.Value/100,DMS.s_clientyaxlitlash.Value);
  if (sotish.Value=0) or (sotish.Value=null) then
    dms.s_tovarsotish.AsFloat:=RoundTo(sotish_d.value*12500,DMS.s_clientyaxlitlash.Value);
end;

procedure Ts_tovar_edit.sotish_dEnter(Sender: TObject);
begin
  if ((sotish.Value=0) or (sotish.Value=null)) and (sotish_d.Value>0) then begin
    dms.s_tovarsotish.AsFloat:=RoundTo(sotish_d.value*kurs_,DMS.s_clientyaxlitlash.Value);
  end;
  if dms.s_clientfoizli.AsInteger=0  then exit;
  if (sena_d.Value=0) and (sotish_d.Value>0) then begin
    dms.s_tovarsena_d.AsFloat:=RoundTo(sotish_d.value-sotish_d.value*DMS.s_clientfoiz.Value/100,DMS.s_clientyaxlitlash.Value);
  end;
end;

procedure Ts_tovar_edit.holatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #32 then if holat.Checked=false then dms.s_tovarholat.value:=1 else dms.s_tovarholat.value:=0;
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_tovar_edit.holatMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if holat.Checked=false then dms.s_tovarholat.value:=1 else dms.s_tovarholat.value:=0;
end;

procedure Ts_tovar_edit.Label11Click(Sender: TObject);
begin
  if asosiy.TabStop=true then begin
    asosiy.TabStop:=false; ichki.TabStop:=false;
  end
  else
  begin
    asosiy.TabStop:=true; ichki.TabStop:=true;
  end;
end;

procedure Ts_tovar_edit.taroziEnter(Sender: TObject);
begin
  if DMS.s_tovartarozi.AsInteger>0 then exit;
  DMS.s_tovartarozi.AsInteger:=dms.s_clienttarozi.AsInteger+1;
end;

procedure Ts_tovar_edit.RzBitBtn1Click(Sender: TObject);
begin
  DMS.s_tovarsena.AsFloat:=0;DMS.s_tovarsena_d.AsFloat:=0;DMS.s_tovarsotish.AsFloat:=0;DMS.s_tovarsotish_d.AsFloat:=0;
end;

procedure Ts_tovar_edit.Label3Click(Sender: TObject);
begin
  if izm.TabStop = true then begin
    izm.TabStop:=false;kol_in.TabStop:=false;
  end
  else
  begin
    izm.TabStop:=true;kol_in.TabStop:=true;
  end;
end;

procedure Ts_tovar_edit.Label1Click(Sender: TObject);
begin
  if brend.TabStop = true then begin
    brend.TabStop:=false;papka.TabStop:=false;t_otdel.TabStop:=false;
  end
  else
  begin
    brend.TabStop:=true;papka.TabStop:=true;t_otdel.TabStop:=true;
  end;

end;

procedure Ts_tovar_edit.Label7Click(Sender: TObject);
begin
  if zavod.TabStop = true then begin
    zavod.TabStop:=false;
  end
  else
  begin
    zavod.TabStop:=true;
  end;

end;

procedure Ts_tovar_edit.kataddClick(Sender: TObject);
begin
  if Edit2.Text='' then begin
    ShowMessage(' Tovar turini kiriting !!!');
    exit;
  end;
  if dms.s_kat.Locate('nom',Edit2.Text,[loCaseInsensitive]) then begin
    ShowMessage(Edit2.Text+' Bazada mavjud !!!');
    exit;
  end;
  if MessageDlg(Trim(Edit2.Text)+' - bazaga qo`shashizmi ?',mtInformation,[mbYes, mbNo], 0) = mrYes then
  begin
    dms.s_kat.Append;
    dms.s_kat.FieldByName('nom').Value:=edit2.Text;
    dms.s_kat.post;
    kat.Refresh;
    kat.Value:=dms.s_kat.FieldByName('id').Value;
    Edit2.Text:='';
    sena.SetFocus;
  end;

end;

procedure Ts_tovar_edit.izmChange(Sender: TObject);
begin
  if (dms.s_tovar.state=dsbrowse) or (dms.s_tovar.state=dsInactive) then exit;
  lkol_in.Visible:=true;kol_in.Visible:=true;
  //shtrix_full1.Visible:=false;shtrix_full.Visible:=false;
  if dms.s_izm.FieldByName('turi').AsInteger < 0 then begin
    Lkol_in.Visible:=true;kol_in.Visible:=true;kol_in.SetFocus;
    if dms.s_izm.FieldByName('turi').AsInteger = -9 then begin
      lkol_in.Visible:=false;kol_in.Visible:=false;
      //shtrix_full1.Visible:=true;shtrix_full.Visible:=true;
    end
    else
    begin
      lkol_in.Visible:=true;kol_in.Visible:=true;
      //shtrix_full1.Visible:=false;shtrix_full.Visible:=false;
    end;
  end
  else begin
    DMS.s_tovarkol_in.AsInteger:=dms.s_izm.FieldByName('turi').AsInteger;
    Lkol_in.Visible:=false;kol_in.Visible:=false;
  end;
  if dms.s_izm.FieldByName('id').AsInteger=11 then begin
    //DMS.s_tovarkol_in.AsInteger:=dms.s_izm.FieldByName('turi').AsInteger;
    dms.s_tovarizm1.AsInteger:=7;
  end;
  if dms.s_izm.FieldByName('id').AsInteger=12 then dms.s_tovarizm1.AsInteger:=8;
  if dms.s_izm.FieldByName('id').AsInteger=13 then dms.s_tovarizm1.AsInteger:=9;
  if dms.s_izm.FieldByName('id').AsInteger=3 then dms.s_tovarizm1.AsInteger:=2;
  if dms.s_izm.FieldByName('id').AsInteger=3 then dms.s_tovarizm1.AsInteger:=2;
  if dms.s_izm.FieldByName('id').AsInteger=5 then dms.s_tovarizm1.AsInteger:=2;
  if dms.s_izm.FieldByName('id').AsInteger=6 then dms.s_tovarizm1.AsInteger:=2;

end;

procedure Ts_tovar_edit.add_mxikClick(Sender: TObject);
begin
  DMS.tshtrix.First;
  while DMS.tshtrix.eof do begin
    if edit3.text=DMS.link.fieldbyname('nom').AsString then begin
      ShowMessage('Bazada mavjud !!!');edit3.text:='';exit;
    end;
  end;
  DMS.tshtrix.Append;
  DMS.tshtrix.fieldbyname('nom').AsString:=edit3.text;
  DMS.tshtrix.fieldbyname('tovar_id').AsInteger:=DMS.link.fieldbyname('id').AsInteger;
  DMS.tshtrix.fieldbyname('turi').AsInteger:=3;
  DMS.tshtrix.post;
  DMS.tshtrix.Refresh;
  edit3.text:='';
end;

procedure Ts_tovar_edit.add_ichkiClick(Sender: TObject);
var full:string;i:integer;
begin
  if (not ((Length(Edit3.Text)=13) and ((copy(Edit3.Text,1,2)='20') or (copy(Edit3.Text,1,2)='21')))) then  begin
    if Edit3.Text<>'' then exit;
  end;
  DMS.tshtrix.First;
  {while not DMS.tshtrix.eof do begin
    if edit3.text=DMS.link.fieldbyname('nom').AsString then begin
      ShowMessage('Bazada mavjud !!!');edit3.text:='';exit;
    end;
    DMS.tshtrix.next;
  end;}
  if Edit3.Text='' then begin
    if dms.s_tovarkg.AsInteger>0 then
      full:='20'+_IntToStr(dms.s_clientlasttz_id.AsInteger+1,5)+_IntToStr(dms.s_tovarkg.AsInteger,5)
    else
      full:='20'+_IntToStr(dms.s_clientlasttz_id.AsInteger+1,5)+'00000';
    i:= StrToInt(copy(full,2,1))+StrToInt(copy(full,4,1))+StrToInt(copy(full,6,1))+StrToInt(copy(full,8,1))+StrToInt(copy(full,10,1))+StrToInt(copy(full,12,1));
    i:=i*3;
    i:=i+StrToInt(copy(full,1,1))+StrToInt(copy(full,3,1))+StrToInt(copy(full,5,1))+StrToInt(copy(full,7,1))+StrToInt(copy(full,9,1))+StrToInt(copy(full,11,1));
    i:=strtoint(copy(inttostr(i), length(IntToStr(i)) ,1)   );
    if i=0 then i:=0 else i:=10-i;
    full:=full+IntToStr(i);
    dms.s_tovarshtrix_in.AsString:=_IntToStr(dms.s_clientlasttz_id.AsInteger+1,5);
    if dms.s_tovarshtrix_in.AsInteger>dms.s_clientlasttz_id.AsInteger then begin
      dms.s_client.Edit;
      dms.s_clientlasttz_id.AsInteger:=dms.s_clientlasttz_id.AsInteger+1;
      dms.s_client.post;
    end;
  end
  else
  begin
  
    dms.s_tovarshtrix_in.AsString:=Copy(Edit3.Text,3,5);
    full:=Edit3.Text;
  end;
  if zapis.Text='1' then begin
    DMS.s_tovar.post;DMS.s_tovar.edit;
  end;
  DMS.tshtrix.Append;
  DMS.tshtrix.fieldbyname('nom').AsString:=full;
  DMS.tshtrix.fieldbyname('tovar_id').AsInteger:=DMS.s_tovarid.AsInteger;
  DMS.tshtrix.fieldbyname('turi').AsInteger:=2;
  DMS.tshtrix.post;
  //DMS.tshtrix.Refresh;
  dms.s_tovarshtrix_full.AsString:=edit3.text;
  edit3.text:='';
  saveadd.SetFocus;
end;

procedure Ts_tovar_edit.add_shtrixClick(Sender: TObject);
begin
  if (Edit3.Text='') or (length(Edit3.Text)<6) then exit;
  dms.link.Close;dms.link.SQL.Clear;
  if zapis.Text='1' then
    dms.link.SQL.Add('select sh.nom,sh.nom as shnom,t.nom as tnom from s_tovar t,shtrix sh WHERE t.id=sh.tovar_id and t.del_flag=1 and sh.nom="'+edit3.Text+'"')
  else
    dms.link.SQL.Add('select sh.nom,sh.nom as shnom,t.nom as tnom from s_tovar t,shtrix sh WHERE t.id=sh.tovar_id and t.del_flag=1 and sh.nom="'+edit3.Text+'" and t.id<>'+dms.s_tovarid.AsString);
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('Ushbu shtrix-kod ma`lumotlar bazasida mavjud. '+dms.link.fieldbyname('tnom').AsString);
    //Edit3.Text:='';ActiveControl:=Edit3;Exit;
  end;
  if zapis.Text='1' then begin
    dms.s_tovar.post;
    dms.s_tovar.Edit;
  end;
  //ShowMessage(DMS.tshtrix.SQL.Text);
  DMS.tshtrix.First;
  while not DMS.tshtrix.eof do begin
    if edit3.text=DMS.tshtrix.fieldbyname('nom').AsString then begin
      ShowMessage('Takroriy !!!');edit3.text:='';exit;
    end;
    DMS.tshtrix.Next;
  end;
  DMS.tshtrix.Append;
  DMS.tshtrix.fieldbyname('nom').AsString:= edit3.text;
  DMS.tshtrix.fieldbyname('tovar_id').AsInteger:=DMS.s_tovarid.AsInteger;
  DMS.tshtrix.fieldbyname('turi').AsInteger:=1;
  DMS.tshtrix.post;
  //DMS.tshtrix.Refresh;
  if dms.s_tovarshtrix.AsString='' then
  dms.s_tovarshtrix.AsString:=edit3.text;
  edit3.text:='';
  saveadd.SetFocus;
end;

procedure Ts_tovar_edit.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then exit;
  if ((Length(Edit3.Text)=13) and ((copy(Edit3.Text,1,2)='20') or (copy(Edit3.Text,1,2)='21'))) then
    add_ichkiClick(sender)
  else
  begin
    if Length(Edit3.Text)=17 then
      add_mxikClick(sender)
    else
      add_shtrixClick(sender);
  end;
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;  
end;

procedure Ts_tovar_edit.Oxirgisotishnarxiasosiypriys1Click(Sender: TObject);
begin
  if (dms.s_tovarshtrix.AsString=DMS.tshtrix.FieldByName('nom').AsString) and (DMS.tshtrix.FieldByName('turi').AsInteger=1) then
    dms.s_tovarshtrix.AsString:='';
  if (dms.s_tovarshtrix_full.AsString=DMS.tshtrix.FieldByName('nom').AsString) and (DMS.tshtrix.FieldByName('turi').AsInteger=2) then
    begin
      dms.s_tovarshtrix_full.AsString:='';
      dms.s_tovarshtrix_in.AsString:='';
    end;
  DMS.tshtrix.Delete;DMS.tshtrix.refresh;

end;

procedure Ts_tovar_edit.Copy1Click(Sender: TObject);
begin
  Clipboard.AsText:=dms.tshtrix.fieldbyname('nom').AsString;
end;

procedure Ts_tovar_edit.sotishExit(Sender: TObject);
begin
  if (sotish.Value=0) or (sotish.Value=null) then exit;
  if DMS.s_clientdollar.AsInteger>0 then begin
    if (sotish_d.Value=0) or (sotish_d.Value=null) then sotish_d.Value:=sotish.value/12500;
  end;
  if foiz.Value='' then exit;
  if (foiz.value='0') and (sotish.Value>0) then begin
    sena.Value:=sotish.Value;
    exit;
  end;

  if dms.s_clientfoizli.AsInteger<0 then exit;
  if (sotish.Value>0) and (sena.Value>0) then begin
    foiz.Value:=sotish.Value/sena.Value;
  end;
  if (sotish.Value>0) then begin
    sena.Value:=sotish.Value-(sotish.Value*foiz.value)/100;
  end;
end;

procedure Ts_tovar_edit.foizChange(Sender: TObject);
var sotf:Currency;
begin
  if foiz.Value='' then exit;
    if sena.Value+sotish.Value=0 then exit;

  if foiz.Value<>'' then
  begin
    if sena.Value >0 then begin
      sotf:=sena.Value+(foiz.Value*sena.Value)/100;
      sotf:=RoundTo(sotf,DMS.s_clientyaxlitlash.Value);
      sotish.Value:=sotf;
    end;
    if sena_d.Value > 0 then begin
      sotf:=sena_d.Value+(foiz.Value*sena_d.Value)/100;
      //sotf:=RoundTo(sotf,-2);
      sotish_d.Value:=sotf;
    end;
  end
  else
    sotish.Value:=dms.s_t_allsotish.AsFloat;

end;

procedure Ts_tovar_edit.DBNumberEditEh1Exit(Sender: TObject);
begin
  if (sena.Value=0) or (sena.Value=null) then exit;
  if DMS.s_clientdollar.AsInteger>0 then begin
    if (sena_d.Value=0) or (sena_d.Value=null) then sena_d.Value:=sena.value/kurs_;
  end;
  if dms.s_clientfoizli.AsInteger=0  then exit;
  if (sena.Value=0) or (sena.Value=null) or (dms.s_tovarsotish.AsFloat>0) then exit;
  dms.s_tovarsotish.AsFloat:=RoundTo(sena.value+sena.value*DMS.s_clientfoiz.Value/100,DMS.s_clientyaxlitlash.Value);

end;

end.







