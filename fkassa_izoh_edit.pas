unit fkassa_izoh_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,RzButton, IniFiles, StdCtrls, RzCmboBx, RzDBCmbo, DBCtrlsEh,
  Mask, DBCtrls;
type
  Tkassa_izoh_edit = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gform: TGroupBox;
    Label10: TLabel;
    Label25: TLabel;
    qarz_kim: TDBEdit;
    Label1: TLabel;
    Label12: TLabel;
    qarz_summa: TDBNumberEditEh;
    qarz_izoh: TDBEdit;
    qarz_flag: TRzDBComboBox;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qarz_summaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kassa_izoh_edit: Tkassa_izoh_edit;

implementation

{$R *.dfm}
uses fulanish, fdms, fkassa;
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

procedure Tkassa_izoh_edit.saveClick(Sender: TObject);
begin
  if dms.k_asosqarz_flag.AsVariant=null then dms.k_asosqarz_flag.AsVariant:=1;
  if dms.k_asosqarz_flag.AsInteger=4 then
  if MessageDlg(' Ushbu qarzdorlikni tozalaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.k_asosqarz_flag.AsVariant:=null;
    dms.k_asosqarz_izoh.AsVariant:=null;
    dms.k_asosqarz_kim.AsVariant:=null;
    dms.k_asosqarz_izoh.AsVariant:=null;
  end;
  dms.k_asos.Post;
  kassa_izoh_edit.Close;
end;

procedure Tkassa_izoh_edit.cancelClick(Sender: TObject);
begin
  dms.k_asos.Cancel;kassa_izoh_edit.Close;
end;

procedure Tkassa_izoh_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tkassa_izoh_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tkassa_izoh_edit.FormCreate(Sender: TObject);
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
procedure Tkassa_izoh_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.k_asos.Cancel;
end;

procedure Tkassa_izoh_edit.qarz_summaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

end.







