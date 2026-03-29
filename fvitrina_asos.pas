unit fvitrina_asos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBCtrlsEh, DBLookupEh, StdCtrls, Mask, DBCtrls,
  RzButton, Grids, DBGrids, GridsEh,IniFiles,db, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tvitrina_asos = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gform: TGroupBox;
    Label10: TLabel;
    sana: TDBDateTimeEditEh;
    Label25: TLabel;
    nomer: TDBEdit;
    Label1: TLabel;
    filial: TDBLookupComboboxEh;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomerKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  vitrina_asos: Tvitrina_asos;

implementation

{$R *.dfm}
uses fulanish, fdms, fs_diler;
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

procedure Tvitrina_asos.saveClick(Sender: TObject);
begin
  if dms.k_asossana.AsVariant=null then begin
    ShowMessage('Xujjat sanasini kiriting');ActiveControl:=sana;Exit;
  end;
  if dms.k_asosnomer.AsString='' then begin
    ShowMessage('Xujjat nomerini kiriting');ActiveControl:=nomer;Exit;
  end;
  if dms.k_asos.FieldByName('filial_id').AsInteger=0 then begin
    ShowMessage('Filialni tanlang');ActiveControl:=filial;Exit;
  end;
  dms.setup.Refresh;
  dms.k_asosclient_id.AsInteger:=StrToInt(admin_id);
  dms.k_asoschangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  dms.k_asos.Post;
  vitrina_asos.Close;
end;

procedure Tvitrina_asos.cancelClick(Sender: TObject);
begin
  dms.k_asos.Cancel;vitrina_asos.Close;
end;

procedure Tvitrina_asos.nomerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tvitrina_asos.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tvitrina_asos.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tvitrina_asos.FormCreate(Sender: TObject);
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
procedure Tvitrina_asos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.k_asos.Cancel;
end;

procedure Tvitrina_asos.FormActivate(Sender: TObject);
begin
  nomer.SetFocus;
end;

end.







