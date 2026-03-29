unit fsmsbot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, RzRadGrp, DB, dateutils,Grids, DBGrids,IniFiles, RzPrgres,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RzButton, RzEdit,
  StdCtrls, Mask, DBCtrlsEh, GridsEh, DBGridEh;

type
  Tsmsbot = class(TForm)
    taomlar: TDBGridEh;
    btn_t: TRzBitBtn;
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_tClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  smsbot: Tsmsbot;
implementation

{$R *.dfm}
uses fulanish,fdms, fmain,comobj,StrUtils;
procedure Tsmsbot.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tsmsbot.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
// 201534642   200541303
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then
  begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;

procedure Tsmsbot.btn_tClick(Sender: TObject);
begin
  DMS.main_link.Refresh;
end;

end.
