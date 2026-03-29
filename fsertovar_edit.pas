unit fsertovar_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,db, Mask, DBCtrls, RzButton, DBGridEh, DBCtrlsEh, DBLookupEh, StdCtrls;

type
  Tserttovar_edit = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gform: TGroupBox;
    Label25: TLabel;
    seriya: TDBEdit;
    zavod: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    srok: TDBDateTimeEditEh;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure seriyaKeyPress(Sender: TObject; var Key: Char);
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
  harf_kril:array [1..60] of String[2] = ('à','á','â','ã','ä','å','¸' ,'æ','ç','è','é','ê','ë','ì','í','î','ï','ð','ñ','ò','ó','ô','õ','÷' ,'ø' ,'ù' ,'è','å','þ' ,'ÿ' ,'À','Á','Â','Ã','Ä','Å','¨' ,'Æ','Ç','È','É','Ê','Ë','Ì','Í','Î','Ï','Ð','Ñ','Ò','Ó','Ô','Õ','×' ,'Ø' ,'Ù' ,'È','Å','Þ' ,'ß' );
  serttovar_edit: Tserttovar_edit;

implementation

{$R *.dfm}
uses fulanish, fdms, fsert;
procedure Tserttovar_edit.saveClick(Sender: TObject);
begin
  if sertifikat.serttovarsrok.AsVariant=null then begin
    ShowMessage('Yaroqlilik nuddatini kiriting');ActiveControl:=srok;Exit;
  end;
  if sertifikat.serttovarseriya.AsString='' then begin
    ShowMessage('Seriyani kiriting');ActiveControl:=seriya;Exit;
  end;
  dms.setup.Refresh;
  sertifikat.serttovarsert_id.AsInteger:=sertifikat.sertid.AsInteger;
  sertifikat.serttovarchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  sertifikat.serttovar.Post;
  serttovar_edit.Close;
end;

procedure Tserttovar_edit.cancelClick(Sender: TObject);
begin
  sertifikat.serttovar.Cancel;serttovar_edit.Close;
end;

procedure Tserttovar_edit.seriyaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tserttovar_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tserttovar_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tserttovar_edit.FormCreate(Sender: TObject);
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
procedure Tserttovar_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sertifikat.serttovar.Cancel;
end;

procedure Tserttovar_edit.FormActivate(Sender: TObject);
begin
  seriya.SetFocus;
end;

end.







