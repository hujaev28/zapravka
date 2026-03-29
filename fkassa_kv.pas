unit fkassa_kv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles,DBGridEh, DBCtrlsEh, RzCmboBx, RzDBCmbo, DBLookupEh, StdCtrls, DBCtrls,
  Mask, Dialogs, RzButton, RzEdit, RzDBEdit, GridsEh, DB, 
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RzTabs;

type
  Tkassa_kv = class(TForm)
    Page: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Label17: TLabel;
    Label21: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eni: TDBNumberEditEh;
    buyi: TDBNumberEditEh;
    yuza: TDBNumberEditEh;
    kvsoni: TDBNumberEditEh;
    kvjami: TDBNumberEditEh;
    Label4: TLabel;
    konv: TDBNumberEditEh;
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eniKeyPress(Sender: TObject; var Key: Char);
    procedure buyiKeyPress(Sender: TObject; var Key: Char);
    procedure buyiChange(Sender: TObject);
    procedure eniChange(Sender: TObject);
    procedure kvsoniChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kassa_kv: Tkassa_kv;

implementation

{$R *.dfm}
uses fulanish_k, fdms, fkassa, fsetup,Math;

procedure Tkassa_kv.saveClick(Sender: TObject);
var c: char;
begin
  //c:=#13;
  //if (dms.asos_slavekvadrat.AsFloat>0) then
  //kassa.shtrix.OnKeyPress(kassa.shtrix,c);
end;

procedure Tkassa_kv.cancelClick(Sender: TObject);
begin
  dms.asos_slave.Cancel;kassa_kv.Close;
end;

procedure Tkassa_kv.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tkassa_kv.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tkassa_kv.FormCreate(Sender: TObject);
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
procedure Tkassa_kv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.asos_slave.Cancel;
end;

procedure Tkassa_kv.eniKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tkassa_kv.buyiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tkassa_kv.buyiChange(Sender: TObject);
begin
  if dms.asos_slave.State <> dsedit then exit;
  if (eni.Value=null) or (buyi.Value=null) then exit;
  dms.asos_slavekvadrat.AsFloat:=StrToFloat(floattostr(eni.Value*buyi.Value));
  if kvsoni.Value>0 then
  dms.asos_slavekvjami.AsFloat:=StrToFloat(floattostr(kvsoni.Value*dms.asos_slavekvadrat.AsFloat));
end;

procedure Tkassa_kv.eniChange(Sender: TObject);
begin
  if dms.asos_slave.State <> dsedit then exit;
  if (eni.Value=null) or (buyi.Value=null) then exit;
  dms.asos_slavekvadrat.AsFloat:=StrToFloat(floattostr(eni.Value*buyi.Value));
  if kvsoni.Value>0 then
  dms.asos_slavekvjami.AsFloat:=StrToFloat(floattostr(kvsoni.Value*dms.asos_slavekvadrat.AsFloat));

end;

procedure Tkassa_kv.kvsoniChange(Sender: TObject);
begin
  if dms.asos_slave.State <> dsedit then exit;
  if (eni.Value=null) or (buyi.Value=null) then exit;
  dms.asos_slavekvadrat.AsFloat:=StrToFloat(floattostr(eni.Value*buyi.Value));
  if kvsoni.Value>0 then
  dms.asos_slavekvjami.AsFloat:=StrToFloat(floattostr(kvsoni.Value*dms.asos_slavekvadrat.AsFloat));
end;

procedure Tkassa_kv.FormActivate(Sender: TObject);
begin
  if page.ActivePageIndex=0 then
  kassa_kv.konv.SetFocus;
  if page.ActivePageIndex=1 then
  kassa_kv.eni.SetFocus;
end;

end.







