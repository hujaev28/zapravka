unit fvozvrat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Menus, SUIPopupMenu, GridsEh, DBGridEh;

type
  Tvozvrat = class(TForm)
    g_asos: TDBGridEh;
    Tovarlar: TDBGridEh;
    k_asos_holat: TsuiPopupMenu;
    MenuItem4: TMenuItem;
    Rahbartomonidantahrirlashuchunbekorqilindi1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Rahbartomonidantahrirlashuchunbekorqilindi1Click(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vozvrat: Tvozvrat;

implementation

{$R *.dfm}
uses fdms;

procedure Tvozvrat.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tvozvrat.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tvozvrat.FormCreate(Sender: TObject);
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
procedure Tvozvrat.MenuItem4Click(Sender: TObject);
begin
  dms.k_asos.Edit;dms.k_asosprint_flag.Value:=1;dms.k_asos.post;
end;

procedure Tvozvrat.Rahbartomonidantahrirlashuchunbekorqilindi1Click(Sender: TObject);
begin
  dms.k_asos.Edit;dms.k_asosprint_flag.Value:=0;dms.k_asos.post;
end;

end.







