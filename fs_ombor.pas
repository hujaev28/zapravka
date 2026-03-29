unit fs_ombor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles,db,DBLookupEh, RzButton, GridsEh, jpeg, ExtCtrls, DBGridEh,
  frxClass, frxDBSet, frxDesgn, DBCtrlsEh, RzPanel, StdCtrls, Mask;
type
  Ts_ombor = class(TForm)
    gqoldir: TDBGridEh;
    Edit1: TEdit;
    shtrix: TEdit;
    Image2: TImage;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    Seriya: TEdit;
    Label3: TLabel;
    Hisobot: TRzBitBtn;
    Image1: TImage;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    Label2: TLabel;
    diler: TDBLookupComboboxEh;
    muddat: TComboBox;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Copies: TDBNumberEditEh;
    Bosmalash: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    frxsf: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxs_tovar: TfrxDBDataset;
    za: TEdit;
    zapros: TEdit;
    sqltext: TEdit;
    Hisobotd: TRzBitBtn;
    kat: TDBLookupComboboxEh;
    brend: TDBLookupComboboxEh;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nom_shKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gqoldirDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure shtrixExit(Sender: TObject);
    procedure shtrixKeyPress(Sender: TObject; var Key: Char);
    procedure dilerChange(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure SeriyaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dilerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure muddatChange(Sender: TObject);
    procedure HisobotClick(Sender: TObject);
    procedure BosmalashClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure HisobotdClick(Sender: TObject);
    procedure katChange(Sender: TObject);
    procedure brendChange(Sender: TObject);
    procedure katEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure brendEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
  s_ombor: Ts_ombor;
  poisk: array [1..27] of String;

implementation

{$R *.dfm}
uses fs_client,fulanish, fdms, fs_asos, fs_diler, fs_ombor_edit,comobj,fs_ostatka, fsetup;
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure interval(int1,int2:Variant;massiv:Integer;s:String);
begin
if  int1<>Null or int2<>Null then
begin
  if (int1<>Null) and (int2<>Null) then
    if int1=int2 then
    begin
      poisk[massiv]:=s+' = '+kasaya(int1)+' ';
      s_ombor.za.Text:=s_ombor.za.Text+'Sana = '+DateToStr(int1)+'#';
    end
    else
    begin
      poisk[massiv]:=s+' between '+kasaya(int1)+' and '+kasaya(int2);
      s_ombor.za.Text:=s_ombor.za.Text+'Sana oralig`i '+DateToStr(int1)+' dan '+DateToStr(int2)+' gacha#';
    end;
  if (int1<>Null) and (int2=Null) then
    begin
      poisk[massiv]:=s+' >= '+kasaya(int1);
      s_ombor.za.Text:=s_ombor.za.Text+'Sana '+DateToStr(int1)+' dan keyingi #';
    end;
  if (int1=Null) and (int2<>Null) then
    begin
      poisk[massiv]:=s+' <= '+kasaya(int2);
      s_ombor.za.Text:=s_ombor.za.Text+'Sana '+DateToStr(int2)+' dan oldingi #';
    end;
end;
end;

procedure ExcelFormatRange(RangeFormat: Variant;Font: string;Size: Byte;AutoFit,jir,perenos: Boolean);
begin
  RangeFormat.Font.Name := Font;RangeFormat.Font.Size := Size;
  RangeFormat.Font.Bold := jir;RangeFormat.WrapText := perenos;
  //if fdm.s_otchet.FieldByName('pokaz_info').AsBoolean then RangeFormat.Columns.AutoFit;
end;
procedure ExcelRangeBorders(RangeBorders: Variant; BOutSideSize: Byte; BInsideSize: Byte; BOutSideVerticalLeft: Boolean; BOutSideVerticalRight: Boolean; BInSideVertical: Boolean; BOutSideHorizUp: Boolean; BOutSideHorizDown: Boolean; BInSideHoriz: Boolean);
begin
  if BOutSideVerticalLeft then begin RangeBorders.Borders[7].LineStyle := 1;RangeBorders.Borders[7].Weight := BOutSideSize;RangeBorders.Borders[7].ColorIndex := -4105;end;
  if BOutSideHorizUp then begin RangeBorders.Borders[8].LineStyle := 1;RangeBorders.Borders[8].Weight := BOutSideSize;RangeBorders.Borders[8].ColorIndex := -4105;end;
  if BOutSideHorizDown then begin RangeBorders.Borders[9].LineStyle := 1;RangeBorders.Borders[9].Weight := BOutSideSize;RangeBorders.Borders[9].ColorIndex := -4105;end;
  if BOutSideVerticalRight then begin RangeBorders.Borders[10].LineStyle := 1;RangeBorders.Borders[10].Weight := BOutSideSize;RangeBorders.Borders[10].ColorIndex := -4105; end;
  if BInSideVertical then begin RangeBorders.Borders[11].LineStyle := 1;RangeBorders.Borders[11].Weight := BInSideSize;RangeBorders.Borders[11].ColorIndex := -4105;end;
  if BInsideHoriz then begin RangeBorders.Borders[12].LineStyle := 1;RangeBorders.Borders[12].Weight := BInSideSize;RangeBorders.Borders[12].ColorIndex := -4105;end;
end;
procedure ExcelCreateApplication(FirstSheetName: string; SheetCount,orient: Integer;ExcelVisible: Boolean);
begin
  try Excel := CreateOleObject('Excel.Application');
    Excel.Application.EnableEvents := False;Excel.SheetsInNewWorkbook := SheetCount;Excel.Visible := ExcelVisible;
    Excel.WorkBooks.Add;Sheet := Excel.WorkBooks[1].Sheets[1];Sheet.Name := FirstSheetName;
    Excel.Application.ErrorCheckingOptions.EvaluateToError := False;Excel.Application.ErrorCheckingOptions.EvaluateToError := False;
    Excel.Application.ErrorCheckingOptions.TextDate := False;Excel.Application.ErrorCheckingOptions.NumberAsText := False;
    sheet.pagesetup.orientation:=orient;sheet.pagesetup.leftmargin:=30;sheet.pagesetup.rightmargin:=0;sheet.pagesetup.topmargin:=20;sheet.pagesetup.bottommargin:=20;
    sheet.pagesetup.headermargin:=2;sheet.pagesetup.footermargin:=2;  excel.Application.StandardFontSize := 11;
  except Exception.Create('Ошибка.  Excel не установлено !!! ');Excel := UnAssigned;
  end;
end;

function StrReplace(const Str, Str1, Str2: string): string;
// str - исходная строка
// str1 - подстрока, подлежащая замене
// str2 - заменяющая строка
var
  P, L: Integer;
begin
  Result := str;
  L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then
    begin
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

procedure Ts_ombor.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_ombor.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_ombor.FormCreate(Sender: TObject);
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
procedure Ts_ombor.nom_shKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_ombor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.qoldiq.Cancel;
end;

procedure Ts_ombor.gqoldirDblClick(Sender: TObject);
begin
  xeditClick(Sender);
end;

procedure Ts_ombor.FormActivate(Sender: TObject);
begin
  if ulanish.parol.Text='28012013' then
  begin
    Edit2.Visible:=true;
  end;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1');
  dms.s_tovar.open;
  if dms.s_clientdollar.AsInteger=0 then
  begin
     gqoldir.Columns.Items[17].Visible:=false;
     gqoldir.Columns.Items[23].Visible:=false;
     gqoldir.Columns.Items[25].Visible:=false;
  end;
  
end;

procedure Ts_ombor.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var s,s1,s2:string;y:integer;
begin
  if (Key = VK_RETURN) then
  else
  if (Key = VK_DOWN) and (not dms.s_ombor.Eof) then dms.s_ombor.Next
  else if (Key = VK_UP) and (not dms.s_ombor.bof) then dms.s_ombor.Prior
  else
 if length(Edit1.Text) > 1 then begin
    s:=trim(Edit1.Text);s1:=s;s2:='';
    y:=pos(' ',s);
    if y>0 then begin
      s1:=copy(s,1,y-1);
      s2:=copy(s,y+1,length(s)-y);
    end;
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;

    DMS.s_ombor.sql.add('SELECT q.id as id,t.nom as s_tovar,t.id as tovar_id,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    dms.s_ombor.SQL.Add(' and ' );
    if s2<>'' then begin
      dms.s_ombor.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
      dms.s_ombor.SQL.Add(' and ((t.nom like "%'+lat_kril(s2)+'%") or (t.nom like "%'+s2+'%")))');
    end
    else
    begin
      dms.s_ombor.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%")))');
    end;
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    s_ombor.Edit2.Text:=DMS.s_ombor.sql.Text;
    dms.s_ombor.open;
  end
  else begin
    if length(Edit1.Text) = 0 then exit;
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');

    dms.s_ombor.open;
  end;
s_ombor.Caption:='Omborxona, '+inttostr(dms.s_ombor.RecordCount)+' ta tovar mavjud';
end;

procedure Ts_ombor.shtrixExit(Sender: TObject);
begin
  if shtrix.Text='' then begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    dms.s_ombor.open;
    exit;
  end;
  dms.s_ombor.Close;dms.s_ombor.SQL.Clear;



    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    dms.s_ombor.SQL.Add(' and t.shtrix like "%'+shtrix.Text+'%" ' );
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    dms.s_ombor.open;
  if dms.s_ombor.RecordCount=0 then begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');

    dms.s_ombor.open;
  end;
  s_ombor.Caption:='Omborxona, '+inttostr(dms.s_ombor.RecordCount)+' ta tovar mavjud';
  shtrix.Text:='';
end;

procedure Ts_ombor.shtrixKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_ombor.dilerChange(Sender: TObject);
begin
  if diler.Value=null then begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    dms.s_ombor.open;
  end
  else begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    dms.s_ombor.SQL.Add(' and q.dnom="'+dms.s_dilernom.AsString+'"');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    //edit2.Text:=dms.qoldiq.SQL.Text;//exit;
    dms.s_ombor.open;
  end;
  s_ombor.Caption:='Omborxona, '+inttostr(dms.s_ombor.RecordCount)+' ta tovar mavjud';
end;

procedure Ts_ombor.xdelClick(Sender: TObject);
begin
  if admin_type<>'2' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select a.id,a.sana from asos a,asos_slave s WHERE s.del_flag=1  and a.id=s.asos_id and tur_oper =2 and s.kol_ost = '+dms.s_ombor.fieldbyname('id').AsString);
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('tovar nomidan '+dms.link.fieldbyname('sana').AsString+';'+dms.link.fieldbyname('id').AsString+' da amal bajariljan');
    exit;
  end;
  if MessageDlg('Ushnu tovarni omborxona qoldiqidan  o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
    dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.s_ombor.fieldbyname('id').AsString);
    dms.qoldiq.open;
     DMS.qoldiq.Edit;
     DMS.qoldiq.FieldByName('del_flag').Value:=0;
     DMS.qoldiq.Post;
     DMS.s_ombor.Refresh;
   end;

end;

procedure Ts_ombor.xeditClick(Sender: TObject);
var rec:Integer;
begin
  if admin_type<>'2' then exit;
  dms.s_tovar.Locate('id',dms.s_ombor.fieldbyname('tovar_id').AsInteger,[loCaseInsensitive]);
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.s_ombor.fieldbyname('id').AsString);
  dms.qoldiq.open;
  dms.qoldiq.Edit;
  s_ostatka.showmodal;
  rec:=DMS.s_ombor.fieldbyname('id').AsInteger;
  DMS.s_ombor.Refresh;
  DMS.s_ombor.Locate('id',rec,[loCaseInsensitive]);
end;

procedure Ts_ombor.SeriyaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var s,s1,s2:string;y:integer;
begin
  if (Key = VK_RETURN) then
  else
  if (Key = VK_DOWN) and (not dms.s_ombor.Eof) then dms.s_ombor.Next
  else if (Key = VK_UP) and (not dms.s_ombor.bof) then dms.s_ombor.Prior
  else
 if length(seriya.Text) > 0 then begin
    s:=trim(seriya.Text);s1:=s;s2:='';
    y:=pos(' ',s);
    if y>0 then begin
      s1:=copy(s,1,y-1);
      s2:=copy(s,y+1,length(s)-y);
    end;
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    dms.s_ombor.SQL.Add(edit2.Text);
    dms.s_ombor.SQL.Add(' and ' );
    if s2<>'' then begin
      dms.s_ombor.SQL.Add('(((s.seriya like "%'+lat_kril(s1)+'%") or (s.seriya like "%'+s1+'%"))');
      dms.s_ombor.SQL.Add(' and ((s.seriya like "%'+lat_kril(s2)+'%") or (s.seriya like "%'+s2+'%"))) order by t.kat,t.nom');
    end
    else
    begin
      dms.s_ombor.SQL.Add('(((s.seriya like "%'+lat_kril(s1)+'%") or (s.seriya like "%'+s1+'%"))');
      dms.s_ombor.SQL.Add(') order by t.kat,t.nom');
    end;
    //edit2.Text:=dms.qoldiq.SQL.Text;//exit;
    dms.s_ombor.open;
  end
  else
  begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    dms.s_ombor.SQL.Add(edit2.Text);
    dms.s_ombor.SQL.Add(' order by t.kat,t.nom' );
    dms.s_ombor.open;
  end;
  s_ombor.Caption:='Omborxona, '+inttostr(dms.s_ombor.RecordCount)+' ta tovar mavjud';
end;

procedure Ts_ombor.dilerEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  diler.Value:=null;
  //dilerChange(Sender);
end;

procedure Ts_ombor.muddatChange(Sender: TObject);
begin
  dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
  dms.s_ombor.SQL.Add(edit2.Text);
  dms.s_ombor.SQL.Add(' and t.shtrix like "%'+shtrix.Text+'%" ' );
  case muddat.ItemIndex of
  1:dms.s_ombor.SQL.Add(' and s.srok between '+kasaya(Now())+' and '+kasaya(now()+30));
  2:dms.s_ombor.SQL.Add(' and s.srok between '+kasaya(Now()+31)+' and '+kasaya(now()+90));
  3:dms.s_ombor.SQL.Add(' and s.srok between '+kasaya(Now()+91)+' and '+kasaya(now()+180));
  4:dms.s_ombor.SQL.Add(' and s.srok < '+kasaya(Now()));
  end;
  dms.s_ombor.SQL.Add(' order by t.kat,t.nom' );
  //edit2.Text:=dms.s_ombor.SQL.Text;
  dms.s_ombor.open;
  s_ombor.Caption:='Omborxona, '+inttostr(dms.s_ombor.RecordCount)+' ta tovar mavjud';
end;

procedure Ts_ombor.HisobotClick(Sender: TObject);
var firstRow,i,j:integer;last_col:String;
begin
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';i:=1;
  ExcelCreateApplication('Ombordagi tovarlar', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel ўрнатилмаган !!!'); Exit;end;
  j:=1;  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;
  inc(j);Sheet.Columns[j].ColumnWidth := 0;inc(j);Sheet.Columns[j].ColumnWidth :=0;
  inc(j);Sheet.Columns[j].ColumnWidth := 0;inc(j);Sheet.Columns[j].ColumnWidth :=0;
  inc(j);Sheet.Columns[j].ColumnWidth := 6;
  inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 6;
  inc(j);Sheet.Columns[j].ColumnWidth :=8;inc(j);Sheet.Columns[j].ColumnWidth :=10;
  inc(j);Sheet.Columns[j].ColumnWidth := 6;
  inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 6;
  inc(j);Sheet.Columns[j].ColumnWidth :=8;inc(j);Sheet.Columns[j].ColumnWidth :=10;
  inc(j);Sheet.Columns[j].ColumnWidth := 6;
  inc(j);Sheet.Columns[j].ColumnWidth :=6;inc(j);Sheet.Columns[j].ColumnWidth := 6;
  firstRow:=10;j:=0;
  inc(j);Sheet.Cells[firstRow-3,j] := '№';Sheet.Range['A'+IntToStr(firstrow-3)+':A'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-3,j] := 'Tovar nomi';Sheet.Range['B'+IntToStr(firstrow-3)+':B'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-3,j] := 'Seriya';Sheet.Range['C'+IntToStr(firstrow-3)+':C'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-3,j] := 'Muddati';Sheet.Range['D'+IntToStr(firstrow-3)+':D'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-3,j] := 'Zavod';Sheet.Range['E'+IntToStr(firstrow-3)+':E'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-3,j] := 'Diler';Sheet.Range['F'+IntToStr(firstrow-3)+':F'+IntToStr(firstrow-1)].merge;
  Sheet.Range['G'+IntToStr(firstrow-3)+':J'+IntToStr(firstrow-3)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Soni';Sheet.Cells[firstRow-2,j] := 'Asosiy tovar';Sheet.Cells[firstRow-3,j] := 'Kirim';
  Sheet.Range['G'+IntToStr(firstrow-2)+':H'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Narxi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Soni';Sheet.Cells[firstRow-2,j] := 'Ichki tovar';
  Sheet.Range['I'+IntToStr(firstrow-2)+':J'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Narxi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Jami';Sheet.Range['K'+IntToStr(firstrow-2)+':K'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Soni';Sheet.Cells[firstRow-2,j] := 'Asosiy tovar';Sheet.Cells[firstRow-3,j] := 'Qoldiq';
  Sheet.Range['L'+IntToStr(firstrow-3)+':P'+IntToStr(firstrow-3)].merge;
  Sheet.Range['L'+IntToStr(firstrow-2)+':M'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Narxi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Soni';Sheet.Cells[firstRow-2,j] := 'Ichki tovar';
  Sheet.Range['N'+IntToStr(firstrow-2)+':O'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Narxi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Jami';Sheet.Range['P'+IntToStr(firstrow-2)+':P'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Asosiy';Sheet.Cells[firstRow-3,j] := 'Sotish';
  Sheet.Range['Q'+IntToStr(firstrow-3)+':S'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Ichki';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Foiz';
  with dms.s_ombor do begin j:=0;i:=1;first;
  while not Eof do begin
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=i;
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('s_tovar').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('seriya').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('srok').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('znom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('dnom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sena').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol_in').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sena_in').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('summa_all').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol_ost').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('q').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol_in_ost').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('q_in').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('q_all').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sotish').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sotish_in').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('foiz').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    next;inc(i);j:=0;
  end; // while
  last_col:='S';j:=1;
  inc(j);Sheet.Cells[firstrow+RecordCount,j] := 'Jami:';inc(j);inc(j);inc(j);inc(j);
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-3) + ':'+last_col + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':'+last_col + IntToStr(firstRow+RecordCount)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+RecordCount) + ':'+last_col + IntToStr(FirstRow+RecordCount)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-3)+':'+last_col+IntToStr(FirstRow+RecordCount)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+last_col + IntToStr(FirstRow+RecordCount)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 10, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 8, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 8, True, True,true);


  Sheet.Cells[2,1]:='Ombordagi tovarlar';Sheet.Range['A2:'+last_col+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:'+last_col+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text;Sheet.Range['A5:'+last_col+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end; // with
end;

procedure Ts_ombor.BosmalashClick(Sender: TObject);
var Top1String:TfrxMemoView;razmer:Integer;
begin
  razmer:=14;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'shtrix58_2.fr3');
  if Length(DMS.s_ombor.fieldbyname('s_tovar').AsString)>27 then razmer:=12;
  if Length(DMS.s_ombor.fieldbyname('s_tovar').AsString)>31 then razmer:=10;
  frxsf.PrintOptions.Printer := setup.yorliqPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.Copies := Copies.Value;
  frxsf.PrintOptions.ShowDialog := false;
  Top1String:= frxsf.FindObject('memo2') as TfrxMemoView;
  Top1String.Font.Size:=razmer;
  frxsf.Print;

end;

procedure Ts_ombor.RzBitBtn1Click(Sender: TObject);
var Top1String:TfrxMemoView;razmer:Integer;
begin
  razmer:=14;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'shtrix58_2.fr3');
  if Length(DMS.s_ombor.fieldbyname('s_tovar').AsString)>50 then razmer:=12;
  if Length(DMS.s_ombor.fieldbyname('s_tovar').AsString)>70 then razmer:=8;
  frxsf.PrintOptions.Printer := setup.yorliqPrinters.Text;
  Top1String:= frxsf.FindObject('memo2') as TfrxMemoView;
  Top1String.Font.Size:=razmer;
  frxsf.ShowReport;
end;

procedure Ts_ombor.HisobotdClick(Sender: TObject);
var firstRow,i,j:integer;last_col:String;
begin
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';i:=1;
  ExcelCreateApplication('Ombordagi tovarlar', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel ўрнатилмаган !!!'); Exit;end;
  j:=1;  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;
  inc(j);Sheet.Columns[j].ColumnWidth :=15;inc(j);Sheet.Columns[j].ColumnWidth :=15;
  inc(j);Sheet.Columns[j].ColumnWidth := 0;inc(j);Sheet.Columns[j].ColumnWidth :=0;
  inc(j);Sheet.Columns[j].ColumnWidth := 0;inc(j);Sheet.Columns[j].ColumnWidth :=0;
  inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=6;

  inc(j);Sheet.Columns[j].ColumnWidth := 12;
  inc(j);if dms.s_clientdollar.AsInteger=0 then Sheet.Columns[j].ColumnWidth := 0 else Sheet.Columns[j].ColumnWidth :=8;
  inc(j);Sheet.Columns[j].ColumnWidth :=10;
  inc(j);if dms.s_clientdollar.AsInteger=0 then Sheet.Columns[j].ColumnWidth := 0 else Sheet.Columns[j].ColumnWidth := 6;
  inc(j);Sheet.Columns[j].ColumnWidth :=10;
  inc(j);if dms.s_clientdollar.AsInteger=0 then Sheet.Columns[j].ColumnWidth := 0 else Sheet.Columns[j].ColumnWidth := 6;
  firstRow:=10;j:=0;
  inc(j);Sheet.Cells[firstRow-2,j] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Tovar nomi';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Kategoriya';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Brend';Sheet.Range['D'+IntToStr(firstrow-2)+':D'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Seriya';Sheet.Range['E'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Muddati';Sheet.Range['F'+IntToStr(firstrow-2)+':F'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Zavod';Sheet.Range['G'+IntToStr(firstrow-2)+':G'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Diler';Sheet.Range['H'+IntToStr(firstrow-2)+':H'+IntToStr(firstrow-1)].merge;
  Sheet.Range['I'+IntToStr(firstrow-2)+':J'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Asosiy';
  Sheet.Cells[firstRow-2,j] := 'Qoldiq';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Ichki';
  inc(j);Sheet.Cells[firstRow-2,j] := 'Jami';
  Sheet.Cells[firstRow-1,j] := 'So`m';inc(j);Sheet.Cells[firstRow-1,j] := 'Dollar';
  Sheet.Range['K'+IntToStr(firstrow-2)+':L'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Kirim';
  Sheet.Cells[firstRow-1,j] := 'So`m';inc(j);Sheet.Cells[firstRow-1,j] := 'Dollar';
  Sheet.Range['M'+IntToStr(firstrow-2)+':N'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Sotish';
  Sheet.Cells[firstRow-1,j] := 'So`m';inc(j);Sheet.Cells[firstRow-1,j] := 'Dollar';
  Sheet.Range['O'+IntToStr(firstrow-2)+':P'+IntToStr(firstrow-2)].merge;
  with dms.s_ombor do begin j:=0;i:=1;first;
  while not Eof do begin
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=i;
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('s_tovar').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('knom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('bnom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('seriya').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('srok').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('znom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('dnom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol_ost').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol_in_ost').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('q_all').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('q').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sena').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sena_d').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sotish').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sotish_d').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '0,00';
    next;inc(i);j:=0;
  end; // while
  last_col:='P';j:=1;
  inc(j);Sheet.Cells[firstrow+RecordCount,j] := 'Jami:';inc(j);inc(j);inc(j);inc(j); inc(j);inc(j);
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+last_col + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':'+last_col + IntToStr(firstRow+RecordCount)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+RecordCount) + ':'+last_col + IntToStr(FirstRow+RecordCount)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-2)+':'+last_col+IntToStr(FirstRow+RecordCount)];
  Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+last_col + IntToStr(FirstRow+RecordCount)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 10, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 8, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 8, True, True,true);


  Sheet.Cells[2,1]:='Ombordagi tovarlar';Sheet.Range['A2:'+last_col+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:'+last_col+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text;Sheet.Range['A5:'+last_col+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end; // with
end;

procedure Ts_ombor.katChange(Sender: TObject);
begin
  if kat.Value=null then begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    dms.s_ombor.open;
  end
  else begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    DMS.s_ombor.sql.add('SELECT q.id as id,t.id as tovar_id,t.nom as s_tovar,t.shtrix,k.nom as knom,b.nom as bnom,z.nom as znom,');
    DMS.s_ombor.sql.add('q.srok,q.seriya,q.dnom,q.kol,q.kol_in,q.kol_in as summa_all,q.kirim as sena,q.kirim_d as sena_d,q.sotish as sotish,q.sotish_d as sotish_d,k.nom as knom,b.nom as bnom,z.nom as znom,');

    DMS.s_ombor.sql.add('sum(q.kol) as kol_ost,sum(q.kol_in) as kol_in_ost,');
    DMS.s_ombor.sql.add('sum(q.kol*q.kirim) as q,');
    DMS.s_ombor.sql.add('sum(q.kol_in*q.kirim_d/q.t_in) as q_in,');
    DMS.s_ombor.sql.add('if(q.dollar=0,sum(q.kol*q.kirim)+if(q.dollar=1,0,sum(q.kol_in*q.kirim/t_in)),0) as q_all,');
    DMS.s_ombor.sql.add('if(q.dollar=1,sum(q.kol*q.kirim_d)+if(q.dollar=0,0,sum(q.kol_in*q.kirim_d/t_in)),0) as q_d');
    DMS.s_ombor.sql.add(' FROM ombor q,s_tovar t left JOIN s_zavod z ON z.id=t.zavod_id left JOIN s_kat k ON k.id=t.kat left JOIN s_brend b ON b.id=t.brend ');
    DMS.s_ombor.sql.add(' where q.tovar_id=t.id and (q.kol>0 or q.kol_in>0) ');
    dms.s_ombor.SQL.Add(' and t.kat='+dms.s_kat.fieldbyname('id').AsString);
    DMS.s_ombor.sql.add(' group by q.nom order by q.nom');
    dms.s_ombor.open;
  end;
  s_ombor.Caption:='Omborxona, '+inttostr(dms.s_ombor.RecordCount)+' ta tovar mavjud';

end;

procedure Ts_ombor.brendChange(Sender: TObject);
begin
  if brend.Value=null then begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    dms.s_ombor.SQL.Add(edit2.Text);
    dms.s_ombor.SQL.Add(' order by t.kat,t.nom' );
    dms.s_ombor.open;
  end
  else begin
    dms.s_ombor.Close;dms.s_ombor.SQL.Clear;
    dms.s_ombor.SQL.Add(edit2.Text);
    dms.s_ombor.SQL.Add(' and t.brend='+dms.s_brend.fieldbyname('id').AsString+' order by t.kat,t.nom' );
    dms.s_ombor.open;
  end;
  s_ombor.Caption:='Omborxona, '+inttostr(dms.s_ombor.RecordCount)+' ta tovar mavjud';

end;

procedure Ts_ombor.katEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  kat.Value:=null;
  katChange(Sender);
end;

procedure Ts_ombor.brendEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  brend.Value:=null;
  brendChange(Sender);

end;

end.







