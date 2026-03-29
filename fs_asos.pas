unit fs_asos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,db, DBCtrls, Mask, RzButton, GridsEh, DBGridEh,
  DBCtrlsEh, DBLookupEh, StdCtrls;

type
  Ts_asos = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gqoldir: TDBGridEh;
    gform: TGroupBox;
    Label10: TLabel;
    srok: TDBDateTimeEditEh;
    Label25: TLabel;
    nom: TDBEdit;
    Label7: TLabel;
    diler: TDBLookupComboboxEh;
    Label1: TLabel;
    seriya: TDBEdit;
    Label2: TLabel;
    shartnoma: TDBLookupComboboxEh;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure dilerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  s_asos: Ts_asos;

implementation

{$R *.dfm}
uses fulanish, fdms, fs_diler, fkirim;
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

procedure Ts_asos.saveClick(Sender: TObject);
begin
  if DMS.asos_qoldiq.State=dsBrowse then DMS.asos_qoldiq.Edit;
  if dms.asos_qoldiq.FieldByName('sana').AsVariant=null then begin
    ShowMessage('Xujjat sanasini kiriting');ActiveControl:=srok;Exit;
  end;
  if dms.asos_qoldiq.FieldByName('diler_id').AsInteger=0 then begin
    ShowMessage('Mol etkazuvchini tanlang');ActiveControl:=diler;Exit;
  end;

  DMS.asos_qoldiqclient_id.Value:=StrToInt(admin_id);
  DMS.asos_qoldiqchangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
  dms.asos_qoldiq.Post;
  dms.asos_qoldiq.Refresh;
  kirim.tovarlar.SumList.RecalcAll;
  s_asos.Close;
end;

procedure Ts_asos.cancelClick(Sender: TObject);
begin
  dms.asos_qoldiq.Cancel; s_asos.Close;
end;

procedure Ts_asos.nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_asos.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_asos.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_asos.FormCreate(Sender: TObject);
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
procedure Ts_asos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.asos_qoldiq.Cancel;
end;

procedure Ts_asos.FormActivate(Sender: TObject);
begin
  nom.SetFocus;
  if dms.asos_qoldiq.Active = false then dms.asos_qoldiq.Open;
end;

procedure Ts_asos.dilerEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  s_diler.showmodal;
  dms.s_diler.Refresh;
  diler.Refresh;
  dms.asos_qoldiqdiler_id.Value:=dms.s_dilerid.Value;
end;

end.







