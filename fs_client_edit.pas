unit fs_client_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,StdCtrls, Mask, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection,IdTCPClient, IdHTTP,
  RzRadChk, DBGridEh, DBCtrlsEh, RzButton, GridsEh, DBLookupEh, Grids,
  DBGrids;

type
  Ts_client_edit = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gbank: TGroupBox;
    gadress: TGroupBox;
    obl: TDBLookupComboboxEh;
    tuman: TDBLookupComboboxEh;
    gprochie: TGroupBox;
    gclient: TGroupBox;
    uyu_type: TDBLookupComboboxEh;
    DBGridEh22: TDBGridEh;
    Gkontakt: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    nom: TDBEdit;
    inn: TDBEdit;
    boss: TDBEdit;
    adress: TDBEdit;
    indeks: TDBEdit;
    tel: TDBEdit;
    telsms1: TDBEdit;
    bank: TDBEdit;
    rs: TDBEdit;
    gorod: TDBEdit;
    kod_bank: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    okonh: TDBEdit;
    Label29: TLabel;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    mr: TDBEdit;
    IdHTTP1: TIdHTTP;
    garaj: TDBNumberEditEh;
    Label19: TLabel;
    Filial: TRzCheckBox;
    DBNumberEditEh1: TDBNumberEditEh;
    Label27: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    Label28: TLabel;
    DBEdit3: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    bux: TDBDateTimeEditEh;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    chat_id: TDBEdit;
    Label11: TLabel;
    shtrix: TDBEdit;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure kod_bankExit(Sender: TObject);
    procedure innExit(Sender: TObject);
    procedure rsExit(Sender: TObject);
    procedure mrExit(Sender: TObject);
    procedure innKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FilialMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  s_client_edit: Ts_client_edit;

implementation

{$R *.dfm}
uses fs_client,fulanish, fdms, DB;
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

procedure Ts_client_edit.saveClick(Sender: TObject);
var s:string;
begin
  if dms.client_edit.FieldByName('nom').AsString='' then
  begin
   ShowMessage('Korxona nomini kiriting');ActiveControl:=nom;Exit;
  end;
  if dms.client_editinn.AsString='' then
  begin
   ShowMessage('STIR ni kiriting');ActiveControl:=inn;Exit;
  end;
  if dms.client_editadress.AsString='' then begin
   ShowMessage('Manzilni kiriting');ActiveControl:=adress;Exit;
  end;
  if dms.client_editobl.AsInteger=0 then begin
   ShowMessage('Viloyatni tanlang');ActiveControl:=obl;Exit;
  end;
  if dms.client_edittuman.AsInteger=0 then begin
   ShowMessage('Tumanni tanlang');ActiveControl:=tuman;Exit;
  end;
  if dms.client_edittelsms1.AsString=null then begin
   ShowMessage('SMS uchun tel raqam kiritibg');ActiveControl:=telsms1;Exit;
  end;
  if length(dms.client_edittelsms1.AsString)<>9 then begin
   ShowMessage('telefon raqami 9 xonali bo`lishi kerek');ActiveControl:=telsms1;Exit;
  end;
 if MessageDlg('Korxona ma`lumotlarini saqlaymi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    if (admin_type='3') and (ulanish.metod.ItemIndex>0) then begin
    if dms.client_edit.State=dsInsert then begin
      s:='http://94.158.53.140/savdoclient.php?text=Hurmarli '+dms.client_editmasul1.asstring+', '+dms.client_editnom.AsString+' korxonasi INFO SAVDO tizimiga qo^shildi. tel: '+DMS.s_user.fieldbyname('tel1').AsString+' '+DMS.s_user.fieldbyname('tel2').AsString+'&ver=13&msisdn=998'+dms.client_edittelsms1.AsString;
      s:=StrReplace(s,' ','%20');s:=StrReplace(s,'`','^');
      if length(DMS.client_edittelsms1.AsString)=9 then IdHttp1.Get(UTF8Encode(s));
      s:='http://94.158.53.140/savdoclient.php?text=Hurmarli '+dms.client_editmasul2.asstring+', '+dms.client_editnom.AsString+' korxonasi INFO SAVDO tizimiga qo^shildi. tel: '+DMS.s_user.fieldbyname('tel1').AsString+' '+DMS.s_user.fieldbyname('tel2').AsString+'&ver=13&msisdn=998'+dms.client_edittelsms2.AsString;
      s:=StrReplace(s,' ','%20');s:=StrReplace(s,'`','^');
      if length(DMS.client_edittelsms2.AsString)=9 then IdHttp1.Get(UTF8Encode(s));
    end;
    if dms.client_edit.State=dsedit then begin
      s:='http://94.158.53.140/savdoclient.php?text=Hurmarli '+dms.client_editmasul1.asstring+', '+dms.client_editnom.AsString+' korxonasi ma^lumotlari o`zgartirildi. tel: '+DMS.s_user.fieldbyname('tel1').AsString+' '+DMS.s_user.fieldbyname('tel2').AsString+'&ver=13&msisdn=998'+dms.client_edittelsms1.AsString;
      s:=StrReplace(s,' ','%20');s:=StrReplace(s,'`','^');
      if length(DMS.client_edittelsms1.AsString)=9 then IdHttp1.Get(UTF8Encode(s));
      s:='http://94.158.53.140/savdoclient.php?text=Hurmarli '+dms.client_editmasul2.asstring+', '+dms.client_editnom.AsString+' korxonasi ma^lumotlari o`zgartirildi. tel: '+DMS.s_user.fieldbyname('tel1').AsString+' '+DMS.s_user.fieldbyname('tel2').AsString+'&ver=13&msisdn=998'+dms.client_edittelsms2.AsString;
      s:=StrReplace(s,' ','%20');s:=StrReplace(s,'`','^');
      if length(DMS.client_edittelsms2.AsString)=9 then IdHttp1.Get(UTF8Encode(s));
    end;
    end;
    //dms.s_clientuser_id.Value:=StrToInt(admin_id);
    //dms.s_clientchangedate.Value:=dms.setupvaqt.AsDateTime;
    if Filial.Checked  then
    dms.client_edit.FieldByName('garaj_turi').Value:=1 else dms.client_edit.FieldByName('garaj_turi').Value:=0;
    dms.client_edit.Post;
    s_client_edit.Close;
  end;
end;

procedure Ts_client_edit.cancelClick(Sender: TObject);
begin
  dms.client_edit.Cancel; s_client_edit.Close;
end;

procedure Ts_client_edit.nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_client_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_client_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_client_edit.FormCreate(Sender: TObject);
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

procedure Ts_client_edit.kod_bankExit(Sender: TObject);
begin
if (dms.client_editkod_bank.AsString<>'') then
 if (length(dms.client_editkod_bank.AsString)<>5) then
  begin
   ShowMessage('Ushbu katakcha uzunligi 5 xonadan iborat bo`lishi kerak.');ActiveControl:=kod_bank;Exit;
  end ;
end;

procedure Ts_client_edit.innExit(Sender: TObject);
begin
if inn.Text='' then exit;
if (dms.client_editinn.AsString<>'') then
 if (length(dms.client_editinn.AsString)<>9) then
  begin
   ShowMessage('Ushbu katakcha uzunligi 9 xonadan iborat bo`lishi kerak.');ActiveControl:=inn;Exit;
  end;
  if dms.client_edit.State = dsinsert then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select id,inn from s_client WHERE del_flag=1 and inn="'+inn.Text+'"');
    dms.link.open;
  end
  else begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select id,inn from s_client WHERE del_flag=1 and inn="'+inn.Text+'" and id<>'+dms.client_editid.AsString);
    dms.link.open;
  end;
  if (dms.link.FieldByName('inn').AsString=inn.Text) and (Filial.Checked=false) then  begin
    ShowMessage('Ushbu STIR ma`lumotlar bazasida mavjud.');
  end;

end;

procedure Ts_client_edit.rsExit(Sender: TObject);
begin
if (dms.client_editrs.AsString<>'') then
 if (length(dms.client_editrs.AsString)<>20) then
  begin
   ShowMessage('Ushbu katakcha uzunligi 20 xonadan iborat bo`lishi kerak.');ActiveControl:=rs;Exit;
  end;

end;

procedure Ts_client_edit.mrExit(Sender: TObject);
begin
if (dms.client_editmr.AsString<>'') then
 if (length(dms.client_editmr.AsString)<>20) then
  begin
   ShowMessage('Ushbu katakcha uzunligi 20 xonadan iborat bo`lishi kerak.');ActiveControl:=mr;Exit;
  end;

end;

procedure Ts_client_edit.innKeyPress(Sender: TObject; var Key: Char);
begin
  case key  of
    '0'..'9',#8,',':;
  else
    key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;

end;

procedure Ts_client_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.client_edit.Cancel;
end;

procedure Ts_client_edit.FilialMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Filial.Checked=false then
    dms.client_edit.FieldByName('garaj_turi').value:=1
  else
    dms.client_edit.FieldByName('garaj_turi').value:=0;
end;

procedure Ts_client_edit.FormActivate(Sender: TObject);
begin
  if admin_type='3' then inn.ReadOnly:=false else inn.ReadOnly:=true;
end;

end.
