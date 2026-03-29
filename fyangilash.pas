unit fyangilash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB,
  
  ImgList, DBCtrlsEh, Mask, DBCtrls, ExtCtrls, RzPanel, RzSplit, RzButton,
  RzPrgres, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection,
  StdCtrls, RzEdit, RzDBEdit;

type
  Tyangilash = class(TForm)
    stop: TRzBitBtn;
    kachaynewver: TRzBitBtn;
    Imagekachay: TImageList;
    lbdserver: TZConnection;
    s_tovar: TZQuery;
    Ds_tovar: TDataSource;
    PrBar: TRzProgressBar;
    RzSizePanel1: TRzSizePanel;
    Label25: TLabel;
    nom: TDBEdit;
    locals_tovar: TZQuery;
    Dlocals_tovar: TDataSource;
    RzSizePanel2: TRzSizePanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    RzBitBtn1: TRzBitBtn;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    RzBitBtn2: TRzBitBtn;
    q_sum: TRzDBNumericEdit;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    aniq: TRzDBNumericEdit;
    procedure kachaynewverClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure stopClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
  boshlash:integer;
    { Public declarations }
  end;

var
  yangilash: Tyangilash;STime: TDateTime;AverageSpeed:Double=0;AWorkCountMax: Integer;

implementation

{$R *.dfm}
uses fdms;
procedure Tyangilash.kachaynewverClick(Sender: TObject);
var chiqish:Boolean;
begin
  kachaynewver.Visible:=False;stop.Visible:=true;chiqish:=False;
  boshlash:=1;
  try
    while not s_tovar.Eof do begin
      s_tovar.Next;Application.ProcessMessages;
      Application.ProcessMessages;
      PrBar.Percent:=Trunc((s_tovar.RecNo)/s_tovar.RecordCount*100);Sleep(2);
      if s_tovar.FieldByName('changedate').AsDateTime<>locals_tovar.FieldByName('changedate').AsDateTime then
      begin
        kachaynewver.Visible:=True;stop.Visible:=false;
        exit;
      end;
      if boshlash=0 then exit;
      if s_tovar.RecNo=s_tovar.RecordCount then
      begin
       kachaynewver.Visible:=True;stop.Visible:=false;
      end;
    end;

  except
    
    ShowMessage('Yangilashda xatolik yuz berdi. Keyinroq urinib ko`ring!!!');chiqish:=true;
  end;
  if chiqish then begin
    kachaynewver.Visible:=False;stop.Visible:=False;
    exit;
  end;

end;

procedure Tyangilash.FormActivate(Sender: TObject);
begin
  STime:=Now;PrBar.Percent:=0;
end;

procedure Tyangilash.stopClick(Sender: TObject);
begin
kachaynewver.Visible:=True;stop.Visible:=false;
boshlash:=0;
end;

procedure Tyangilash.RzBitBtn1Click(Sender: TObject);
begin
  if locals_tovar.RecordCount=0 then
  locals_tovar.append else
  locals_tovar.Edit;
  locals_tovar.FieldByName('id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
  locals_tovar.FieldByName('nom').AsString:=s_tovar.FieldByName('nom').AsString;
  locals_tovar.FieldByName('kol_in').AsInteger:=s_tovar.FieldByName('kol_in').AsInteger;
  locals_tovar.FieldByName('changedate').AsDateTime:=s_tovar.FieldByName('changedate').AsDateTime;
  locals_tovar.post;
  kachaynewverClick(Sender);
end;

procedure Tyangilash.RzBitBtn2Click(Sender: TObject);
begin
  s_tovar.Next;
  kachaynewverClick(Sender);

end;

end.
