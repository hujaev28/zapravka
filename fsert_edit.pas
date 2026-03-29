unit fsert_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles,db,ZDataset,
  RzButton, DBLookupEh, DBCtrls, StdCtrls, Mask, DBGridEh, DBCtrlsEh;

type
  Tsert_edit = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gform: TGroupBox;
    Label10: TLabel;
    sana: TDBDateTimeEditEh;
    Label25: TLabel;
    nomer: TDBEdit;
    zavod: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    srok: TDBDateTimeEditEh;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomerKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure zavodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  sert_edit: Tsert_edit;

implementation

{$R *.dfm}
uses fulanish, fdms, fs_diler, fsert;
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

procedure Tsert_edit.saveClick(Sender: TObject);
begin
  if sertifikat.sertsana.AsVariant=null then begin
    ShowMessage('Xujjat sanasini kiriting');ActiveControl:=sana;Exit;
  end;
  if sertifikat.sertnomer.AsString='' then begin
    ShowMessage('Xujjat nomerini kiriting');ActiveControl:=nomer;Exit;
  end;
  if sertifikat.sertzavod_id.AsInteger=0 then begin
    ShowMessage('Ishlab chiqaruvchini tanlang');ActiveControl:=zavod;Exit;
  end;
  dms.setup.Refresh;
  sertifikat.sertchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  sertifikat.sert.Post;
  sert_edit.Close;
end;

procedure Tsert_edit.cancelClick(Sender: TObject);
begin
  sertifikat.sert.Cancel;sert_edit.Close;
end;

procedure Tsert_edit.nomerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tsert_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tsert_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tsert_edit.FormCreate(Sender: TObject);
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
procedure Tsert_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sertifikat.sert.Cancel;
end;

procedure Tsert_edit.FormActivate(Sender: TObject);
begin
  nomer.SetFocus;
end;

procedure Tsert_edit.zavodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key=VK_BACK then dms.s_tovarzavod_id.AsVariant:=null;
end;

end.







