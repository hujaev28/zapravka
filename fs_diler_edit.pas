unit fs_diler_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, IniFiles,db, DBCtrls, DBGridEh, GridsEh, DBLookupEh,
  DBCtrlsEh, StdCtrls, Mask;
type
  Ts_diler_edit = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gbank: TGroupBox;
    gadress: TGroupBox;
    gprochie: TGroupBox;
    gclient: TGroupBox;
    komu: TDBLookupComboboxEh;
    uyu_type: TDBLookupComboboxEh;
    DBGridEh22: TDBGridEh;
    Gkontakt: TGroupBox;
    ssana: TDBDateTimeEditEh;
    tugashsana: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    nom: TDBEdit;
    inn: TDBEdit;
    boss: TDBEdit;
    adress: TDBEdit;
    indeks: TDBEdit;
    telsms1: TDBEdit;
    masul1: TDBEdit;
    email: TDBEdit;
    sayt: TDBEdit;
    snomer: TDBEdit;
    bank: TDBEdit;
    rs: TDBEdit;
    gorod: TDBEdit;
    kod_bank: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    okonh: TDBEdit;
    Label16: TLabel;
    mr: TDBEdit;
    Label13: TLabel;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure innKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  s_diler_edit: Ts_diler_edit;

implementation

{$R *.dfm}
uses fs_diler,fulanish, fdms;
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

procedure Ts_diler_edit.saveClick(Sender: TObject);
begin
  if dms.s_diler.FieldByName('nom').AsString='' then begin
   ShowMessage('Korxona nomini kiriting');ActiveControl:=nom;Exit;
  end;
  {if dms.s_diler.State = dsinsert then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select id,inn from s_diler WHERE del_flag=1 and inn="'+inn.Text+'"');
    dms.link.open;
    if dms.link.FieldByName('inn').AsString=inn.Text then
    begin
      ShowMessage('Ushbu Mol etkazuvchi ma`lumotlar bazasida mavjud.');ActiveControl:=nom;Exit;
    end;
  end
  else
  begin
    dms.link.Close;DMS.link.SQL.Clear;
    DMS.link.SQL.Add('select id,inn from s_diler WHERE del_flag=1 and inn="'+inn.Text+'" and id<>'+dms.s_dilerid.AsString);
    dms.link.open;
    if dms.link.FieldByName('inn').AsString=inn.Text then begin
      ShowMessage('Ushbu korxona ma`lumotlar bazasida mavjud.');ActiveControl:=nom;Exit;
    end;
  end;}
 if MessageDlg('Mol etkazuvchi ma`lumotlarini saqlaymi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.setup.Refresh;
    dms.s_dileruser_id.AsInteger:=StrToInt(admin_id);dms.s_dilerchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    dms.s_diler.Post;
    s_diler_edit.Close;
 end;

end;

procedure Ts_diler_edit.cancelClick(Sender: TObject);
begin
  dms.s_diler.Cancel; s_diler_edit.Close;
end;

procedure Ts_diler_edit.nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_diler_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_diler_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_diler_edit.FormCreate(Sender: TObject);
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

procedure Ts_diler_edit.innKeyPress(Sender: TObject; var Key: Char);
begin
  case key  of
    '0'..'9',#8,',':;
  else
    key:=#0;
  end;
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_diler_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if dms.s_diler.State in [dsinsert,dsedit] then begin
    ShowMessage('Ma`lumotlar saqlanmadi. Iltimos saqlash yoki bekor qilish tugmachasini bosing');
    abort;
  end;
end;

end.
