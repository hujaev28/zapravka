unit fshartnoma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,db, DBGridEh, DBCtrlsEh, DBLookupEh, DBCtrls, StdCtrls,
  Mask, GridsEh, RzButton;

type
  Tshartnomalar = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gqoldir: TDBGridEh;
    gform: TGroupBox;
    Label10: TLabel;
    sana: TDBDateTimeEditEh;
    Label25: TLabel;
    nomer: TDBEdit;
    Label7: TLabel;
    diler: TDBLookupComboboxEh;
    Label1: TLabel;
    summa: TDBNumberEditEh;
    Label2: TLabel;
    srok: TDBDateTimeEditEh;
    new: TRzBitBtn;
    del: TRzBitBtn;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomerKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure dilerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure newClick(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure gqoldirDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  shartnomalar: Tshartnomalar;

implementation

{$R *.dfm}
uses fulanish, fdms, fs_diler, fkirim_asos;
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

procedure Tshartnomalar.saveClick(Sender: TObject);
begin
  //if DMS.asos_qoldiq.State=dsBrowse then DMS.asos_qoldiq.Edit;
  if dms.shartnomanomer.AsVariant=null then begin
    ShowMessage('Shartnoma nomerini kiriting');ActiveControl:=nomer;Exit;
  end;
  if dms.shartnomasana.AsVariant=null then begin
    ShowMessage('Shartnoma sanasini kiriting');ActiveControl:=sana;Exit;
  end;
  if dms.shartnomadiler_id.AsInteger=0 then begin
    ShowMessage('Mol etkazuvchini tanlang');ActiveControl:=diler;Exit;
  end;
  //DMS.shartnoma.Value:=StrToInt(admin_id);
  DMS.shartnomachangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
  dms.shartnoma.Post;
  //dms.asos_qoldiq.Refresh;
end;

procedure Tshartnomalar.cancelClick(Sender: TObject);
begin
  dms.shartnoma.Cancel;
end;

procedure Tshartnomalar.nomerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tshartnomalar.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tshartnomalar.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tshartnomalar.FormCreate(Sender: TObject);
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
procedure Tshartnomalar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.shartnoma.State<>dsBrowse then dms.shartnoma.Cancel;
end;

procedure Tshartnomalar.FormActivate(Sender: TObject);
begin
  nomer.SetFocus;
end;

procedure Tshartnomalar.dilerEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  s_diler.showmodal;
  dms.s_diler.Refresh;
  diler.Refresh;
  if dms.shartnoma.State= dsbrowse then dms.shartnoma.Edit;
  dms.shartnomadiler_id.Value:=dms.s_dilerid.Value;

end;

procedure Tshartnomalar.newClick(Sender: TObject);
begin
  dms.shartnoma.Append;
  nomer.SetFocus;
end;

procedure Tshartnomalar.delClick(Sender: TObject);
begin
  if dms.shartnoma.RecordCount=0 then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * from asos WHERE del_flag=1 and shartnoma_id = '+dms.shartnomaid.AsString);
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('Uchbu shartnoma '+dms.link.fieldbyname('nomer').AsString+','+dms.link.fieldbyname('sana').AsString+','+dms.link.fieldbyname('id').AsString+' da amal bajargan. Oldin amalni o`chiring.');
    exit;
  end;
 if MessageDlg('Siz ushbu shartnomani o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
 begin
   DMS.shartnoma.Edit;DMS.shartnomadel_flag.Value:=0;DMS.shartnoma.Post;DMS.shartnoma.Refresh;
 end;

end;

procedure Tshartnomalar.gqoldirDblClick(Sender: TObject);
begin
  if h_id<>'-1' then exit;
  kirim_asos.shartnoma.Value:=dms.shartnomaid.asinteger;
  shartnomalar.Close;
end;

end.







