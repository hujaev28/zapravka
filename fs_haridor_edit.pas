unit fs_haridor_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DBCtrlsEh, DBLookupEh, StdCtrls, Mask,
  DBCtrls, RzButton,inifiles,db, ExtCtrls, RzPanel, RzRadGrp;

type
  Ts_haridor_edit = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gbank: TGroupBox;
    gadress: TGroupBox;
    gclient: TGroupBox;
    DBGridEh22: TDBGridEh;
    Gkontakt: TGroupBox;
    Label5: TLabel;
    Label9: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    nom: TDBEdit;
    adress: TDBEdit;
    telsms1: TDBEdit;
    bank: TDBEdit;
    rs: TDBEdit;
    gorod: TDBEdit;
    kod_bank: TDBEdit;
    Label25: TLabel;
    Label6: TLabel;
    telsms2: TDBEdit;
    Label7: TLabel;
    tel: TDBEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    inn: TDBEdit;
    Label2: TLabel;
    boss: TDBEdit;
    Label4: TLabel;
    uyu_type: TDBLookupComboboxEh;
    Label8: TLabel;
    summa_ch: TDBNumberEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    Label10: TLabel;
    Label11: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    valyuta: TRzRadioGroup;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBNumberEditEh3: TDBNumberEditEh;
    DBNumberEditEh4: TDBNumberEditEh;
    DBNumberEditEh5: TDBNumberEditEh;
    RzRadioGroup1: TRzRadioGroup;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure innKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  s_haridor_edit: Ts_haridor_edit;

implementation

{$R *.dfm}
uses fdms, fkassa;
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

procedure Ts_haridor_edit.saveClick(Sender: TObject);
var s:string;har_id:integer;
begin
  if dms.s_haridor.FieldByName('nom').AsString='' then begin
    ShowMessage('Korxona nomini kiriting');ActiveControl:=nom;Exit;
  end;
  if dms.s_haridor.FieldByName('telsms1').AsString='' then begin
    ShowMessage('Telefon ni kiriting');ActiveControl:=telsms1;Exit;
  end;
  if dms.s_haridor.State=dsEdit then s:='id<>'+dms.s_haridorid.AsString+' and ';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id from s_haridor where '+s+' nom="'+DMS.s_haridornom.AsString+'"');
  dms.link.Open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('Haridor nomi mavjud !!!');ActiveControl:=nom;Exit;
  end;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id from s_haridor where '+s+' telsms1="'+DMS.s_haridortelsms1.AsString+'"');
  dms.link.Open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('Haridor telefon raqami mavjud !!!');ActiveControl:=DBEdit1;Exit;
  end;
  if dms.s_haridor.State <> dsInsert then begin
  if MessageDlg('Haridor ma`lumotlarini saqlaymi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.setup.Refresh;
    dms.s_haridoruser_id.AsInteger:=StrToInt(dms.s_user.FieldByName('id').AsString);
    dms.s_haridorchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    dms.s_haridor.Post;
    s_haridor_edit.Close;
  end;
  end
  else
  begin
    dms.setup.Refresh;
    dms.s_haridoruser_id.AsInteger:=StrToInt(dms.s_user.FieldByName('id').AsString);dms.s_haridorchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    dms.s_haridor.Post;
    if forma='plus' then begin
      har_id:=dms.s_haridorid.AsInteger;
      dms.asos.Edit;
      dms.asosh_id.AsInteger:=har_id;
      dms.asos.post;
      dms.asos.Refresh;
    end;
    s_haridor_edit.Close;
  end;
end;

procedure Ts_haridor_edit.cancelClick(Sender: TObject);
begin
  dms.s_haridor.Cancel; s_haridor_edit.Close;
end;

procedure Ts_haridor_edit.nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_haridor_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_haridor_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_haridor_edit.FormCreate(Sender: TObject);
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

procedure Ts_haridor_edit.innKeyPress(Sender: TObject; var Key: Char);
begin
  case key  of
    '0'..'9',#8,',':;
  else
    key:=#0;
  end;
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_haridor_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if dms.s_haridor.State in [dsinsert,dsedit] then begin
    ShowMessage('Ma`lumotlar saqlanmadi. Iltimos saqlash yoki bekor qilish tugmachasini bosing');
    abort;
  end;
end;

procedure Ts_haridor_edit.FormActivate(Sender: TObject);
begin
  nom.SetFocus;
end;

end.
