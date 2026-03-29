unit fyukla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RzPrgres, Grids, DBGrids, Mask, DBCtrlsEh, RzEdit, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdCoder, IdCoder3to4,
  IdCoderMIME;

type
  TYukla = class(TForm)
    Button4: TButton;
    progress: TRzProgressBar;
    Memoykla: TMemo;
    hisobla: TCheckBox;
    DBGrid4: TDBGrid;
    Button1: TButton;
    s_tovar: TZQuery;
    Ds_tovar: TDataSource;
    Button2: TButton;
    termez: TButton;
    asos_slave: TZQuery;
    Dasos_slave: TDataSource;
    yodgor: TButton;
    Edit_asos_id: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit_kol: TEdit;
    Button3: TButton;
    xldan: TLabel;
    sana1: TDBDateTimeEditEh;
    xlgacha: TLabel;
    sana2: TDBDateTimeEditEh;
    zapros: TRzEdit;
    za: TRzEdit;
    Button5: TButton;
    IdHTTP1: TIdHTTP;
    IdDecoderMIME1: TIdDecoderMIME;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    tasnif: TButton;
    ttasnif: TZQuery;
    Dtasnif: TDataSource;
    k_guruh: TZQuery;
    Dk_guruh: TDataSource;
    k_sinf: TZQuery;
    Dk_sinf: TDataSource;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    kod: TEdit;
    Label3: TLabel;
    Button12: TButton;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    termez_10: TButton;
    Button13: TButton;
    nakl: TButton;
    kat: TButton;
    Button14: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure termezClick(Sender: TObject);
    procedure yodgorClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure tasnifClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure termez_10Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure naklClick(Sender: TObject);
    procedure katClick(Sender: TObject);
    procedure Button14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Yukla: TYukla;
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );


implementation
uses fulanish,fdms, Math,ComObj,IdMultipartFormData;

{$R *.dfm}
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure ExcelRangeBorders(RangeBorders: Variant; BOutSideSize: Byte; BInsideSize: Byte; BOutSideVerticalLeft: Boolean; BOutSideVerticalRight: Boolean; BInSideVertical: Boolean; BOutSideHorizUp: Boolean; BOutSideHorizDown: Boolean; BInSideHoriz: Boolean);
begin
  if BOutSideVerticalLeft then begin RangeBorders.Borders[7].LineStyle := 1;RangeBorders.Borders[7].Weight := BOutSideSize;RangeBorders.Borders[7].ColorIndex := -4105;end;
  if BOutSideHorizUp then begin RangeBorders.Borders[8].LineStyle := 1;RangeBorders.Borders[8].Weight := BOutSideSize;RangeBorders.Borders[8].ColorIndex := -4105;end;
  if BOutSideHorizDown then begin RangeBorders.Borders[9].LineStyle := 1;RangeBorders.Borders[9].Weight := BOutSideSize;RangeBorders.Borders[9].ColorIndex := -4105;end;
  if BOutSideVerticalRight then begin RangeBorders.Borders[10].LineStyle := 1;RangeBorders.Borders[10].Weight := BOutSideSize;RangeBorders.Borders[10].ColorIndex := -4105; end;
  if BInSideVertical then begin RangeBorders.Borders[11].LineStyle := 1;
  RangeBorders.Borders[11].Weight := BInSideSize;RangeBorders.Borders[11].ColorIndex := -4105;end;
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
procedure ExcelFormatRange(RangeFormat: Variant;Font: string;Size: Byte;AutoFit,jir,perenos: Boolean);
begin
  RangeFormat.Font.Name := Font;RangeFormat.Font.Size := Size;
  RangeFormat.Font.Bold := jir;RangeFormat.WrapText := perenos;
  //if fdm.s_otchet.FieldByName('pokaz_info').AsBoolean then RangeFormat.Columns.AutoFit;
end;

function StrReplace(Str, Str1:WideString; Str2: string): WideString;
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

procedure TYukla.Button4Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   ExcelApp, ExcelSheet: OLEVariant;
   MyMass: Variant;
   x, y: Integer;
begin
  if kod.Text<>'2013' then exit;
     // создание OLE-объекта Excel
   ExcelApp := CreateOleObject('Excel.Application');

   // открытие книги Excel
   ExcelApp.Workbooks.Open('d:\rasta\mih.xls');

   // открытие листа книги
   ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];

   // выделение последней задействованной ячейки на листе
   ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;

   // получение значений размера выбранного диапазона
   x := ExcelApp.ActiveCell.Row;
   y := ExcelApp.ActiveCell.Column;

   // присвоение массиву диапазона ячеек на листе
   s_tovar.Open;
   MyMass := ExcelApp.Range['A1', 'C1346'].Value;
   for x := 1 to 1346 do begin
    s_tovar.Append;
    s_tovar.FieldByName('nom').AsString := Trim(MyMass[x, 1]);
    s_tovar.FieldByName('nom_sh').AsString := Trim(MyMass[x, 2]);
    //if MyMass[x, 3]<>'' then
    s_tovar.FieldByName('sotish').AsFloat := StrToFloat(MyMass[x, 3]);
    //else
    //s_tovar.FieldByName('sotish').AsFloat := 0;

    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    s_tovar.FieldByName('otdel').Value:=1;s_tovar.FieldByName('shtrixkod').Value:=1;
    s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('kat').Value:=0;
    s_tovar.FieldByName('brend').Value:=0;s_tovar.FieldByName('izm_id').Value:=3;
    s_tovar.FieldByName('izm1').Value:=2;s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;
   end;


   // закрытие книги и очистка переменных
   ExcelApp.Quit;
   ExcelApp := Unassigned;
   ExcelSheet := Unassigned;
end;

procedure TYukla.Button2Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant; MyMass: Variant;x, y: Integer;
begin
  if kod.Text<>'2013' then exit;
     // создание OLE-объекта Excel
   ExcelApp := CreateOleObject('Excel.Application');

   // открытие книги Excel
   ExcelApp.Workbooks.Open('f:\rasta\tovarbaza.xlsx');

   // открытие листа книги
   ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];

   // выделение последней задействованной ячейки на листе
   ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;

   // получение значений размера выбранного диапазона
   x := ExcelApp.ActiveCell.Row;
   y := ExcelApp.ActiveCell.Column;

   // присвоение массиву диапазона ячеек на листе
   s_tovar.Open;
   MyMass := ExcelApp.Range['A1', 'C1123'].Value;
   for x := 1 to 1123 do begin
    s_tovar.Append;
    s_tovar.FieldByName('nom').AsString := Trim(MyMass[x, 1]);
    s_tovar.FieldByName('nom_sh').AsString := Trim(MyMass[x, 1]);
    s_tovar.FieldByName('nom_ru').AsString := Trim(MyMass[x, 1]);
    //if MyMass[x, 3]<>'' then
    //s_tovar.FieldByName('sotish').AsFloat := StrToFloat(MyMass[x, 3]);
    //else
    //s_tovar.FieldByName('sotish').AsFloat := 0;

    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    s_tovar.FieldByName('otdel').Value:=1;s_tovar.FieldByName('shtrixkod').Value:=1;
    s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('kat').Value:=0;
    s_tovar.FieldByName('kol_in').Value:=StrToInt(Trim(MyMass[x, 3]));
    s_tovar.FieldByName('brend').Value:=0;s_tovar.FieldByName('izm_id').Value:=3;
    s_tovar.FieldByName('izm1').Value:=2;s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;
   end;


   // закрытие книги и очистка переменных
   ExcelApp.Quit;
   ExcelApp := Unassigned;
   ExcelSheet := Unassigned;
end;

procedure TYukla.termezClick(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
    ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open('c:\tovarbaza.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  s_tovar.Open; asos_slave.Open;
  MyMass := ExcelApp.Range['A1', 'm2551'].Value;
  nom := MyMass[2, 2];
  for x := 2 to 2551 do begin
    if (nom<>MyMass[x, 2]) or (x=2) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 2],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    s_tovar.FieldByName('shtrix').AsString := Trim(MyMass[x, 4]);
    if (MyMass[x, 7]<>'USD') then begin
      s_tovar.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 5],'.',',')),' ',''));
      s_tovar.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 6],'.',',')),' ',''));
    end
    else
    begin
      s_tovar.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 5],'.',',')),' ',''));
      s_tovar.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 6],'.',',')),' ',''));
    end;
    s_tovar.FieldByName('kol_in').AsInteger := 1;
    IF MyMass[x, 11] = 'dona' then s_tovar.FieldByName('izm_id').AsInteger := 3;
    IF MyMass[x, 11] = 'm' then begin
      s_tovar.FieldByName('izm_id').AsInteger := 13;s_tovar.FieldByName('kol_in').AsInteger := 100;
    end;
    IF MyMass[x, 11] = 'kg' then begin
      s_tovar.FieldByName('izm_id').AsInteger := 11;s_tovar.FieldByName('kol_in').AsInteger := 1000;
    end;
    s_tovar.FieldByName('otdel').AsInteger := StrToInt(Trim(MyMass[x, 12]));
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    //s_tovar.FieldByName('otdel').Value:=1;
    s_tovar.FieldByName('shtrixkod').Value:=1;
    s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('kat').Value:=0;
    //s_tovar.FieldByName('kol_in').Value:=1;
    s_tovar.FieldByName('brend').Value:=0;//s_tovar.FieldByName('izm_id').Value:=3;
    s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 10],'.00','')),' ',''))>0 then begin
    asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
    if (MyMass[x, 7]<>'USD') then begin
      asos_slave.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 5],'.',',')),' ',''));
      asos_slave.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 6],'.',',')),' ',''));
      asos_slave.FieldByName('asos_id').AsInteger := 1;
    end
    else
    begin
      asos_slave.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 5],'.',',')),' ',''));
      asos_slave.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 6],'.',',')),' ',''));
      asos_slave.FieldByName('asos_id').AsInteger := 2;
    end;

    asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
    asos_slave.FieldByName('summa').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 10],'.',',')),' ',''))*dms.k_slave1sena.AsFloat;
    asos_slave.FieldByName('summa_in').AsFloat := 0;
    asos_slave.FieldByName('summa_all').AsFloat:= asos_slave.FieldByName('summa').AsFloat;

    asos_slave.FieldByName('kol_ost').AsInteger:=asos_slave.FieldByName('kol_ost').AsInteger+StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 10],'.00','')),' ',''));
    asos_slave.FieldByName('kol').AsInteger:=asos_slave.FieldByName('kol').AsInteger+StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 10],'.00','')),' ',''));
    asos_slave.FieldByName('kol_in').AsInteger:=0;asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
    asos_slave.Post;
    end;
    nom := MyMass[x, 2];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
end;

procedure TYukla.yodgorClick(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
    ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open('c:\yodgor.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  s_tovar.Open; asos_slave.Open;
  MyMass := ExcelApp.Range['A1', 'm770'].Value;
  nom := MyMass[2, 2];
  for x := 2 to StrToInt(Edit_kol.Text) do begin
    if (nom<>MyMass[x, 2]) or (x=2) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 2],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    s_tovar.FieldByName('kol_in').Value:=MyMass[x, 3];
    s_tovar.FieldByName('kat').AsString:=MyMass[x, 4];
    s_tovar.FieldByName('brend').AsString:=MyMass[x, 5];
    s_tovar.FieldByName('shtrix').AsString := Trim(MyMass[x, 6]);
    s_tovar.FieldByName('shtrix_full').AsString := Trim(MyMass[x, 7]);
    s_tovar.FieldByName('shtrix_in').AsString := copy(Trim(MyMass[x, 7]),3,5);
    s_tovar.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 8],'.',',')),' ',''));
    s_tovar.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 9],'.',',')),' ',''));
    s_tovar.FieldByName('izm_id').AsInteger := 3;
    s_tovar.FieldByName('otdel').AsInteger := 0; //StrToInt(Trim(MyMass[x, 12]));
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    //s_tovar.FieldByName('otdel').Value:=1;
    s_tovar.FieldByName('shtrixkod').Value:=1;s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 10],'.00','')),' ',''))>0 then begin
    asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
    asos_slave.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 8],'.',',')),' ',''));
    asos_slave.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 9],'.',',')),' ',''));
    asos_slave.FieldByName('asos_id').AsString := Edit_asos_id.Text;

    asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
    asos_slave.FieldByName('summa').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 10],'.',',')),' ',''))*dms.k_slave1sena_d.AsFloat;
    asos_slave.FieldByName('summa_in').AsFloat := 0;
    asos_slave.FieldByName('summa_all').AsFloat:= asos_slave.FieldByName('summa').AsFloat;

    asos_slave.FieldByName('kol_ost').AsInteger:=asos_slave.FieldByName('kol_ost').AsInteger+StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 10],'.00','')),' ',''));
    asos_slave.FieldByName('kol').AsInteger:=asos_slave.FieldByName('kol').AsInteger+StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 10],'.00','')),' ',''));
    asos_slave.FieldByName('kol_in').AsInteger:=0;asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
    asos_slave.Post;
    end;
    nom := MyMass[x, 2];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');
end;

procedure TYukla.Button3Click(Sender: TObject);
var firstRow,i,j,qator:integer;last_col:String;
//LFormData: TMultipartFormData; LResponse: TStringStream;
 data: TIdMultiPartFormDataStream;
//LHTTP: TNetHTTPClient; Params: TStringList;
begin
  if StrToDate(sana1.Text)>StrToDate(sana2.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=sana1;Exit;end;
  zapros.Text:='';
  s_tovar.Close;s_tovar.SQL.Clear;
  s_tovar.sql.add('select a.*,d.nom as dnom,d.tel as dtel');
  s_tovar.sql.add(' from asos a,s_diler d WHERE a.del_flag=1 and a.tur_oper in (1,3,5) and a.diler_id=d.id and a.client_id = '+admin_id+' and a.sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value));
  s_tovar.Open;
  asos_slave.Close;asos_slave.SQL.Clear;
  asos_slave.sql.add('select t.nom as tnom,s.*');
  asos_slave.sql.add('from s_tovar t,asos_slave s WHERE s.del_flag=1 and s.asos_id=:id and s.tovar_id=t.id');

  //zapros.Visible:=true;zapros.Text:=dms.link.SQL.Text;exit;
  asos_slave.open;
  //if s_tovar.RecordCount=0 then begin ShowMessage('Ma`lumot yo`q');Exit;end;

  ExcelCreateApplication('Kirim', 2,2, false);
  //try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  j:=1;
  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;inc(j);Sheet.Columns[j].ColumnWidth := 10;
  inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);inc(j);inc(j);
  if dms.s_clientichkitovar.AsInteger=1 then begin
    inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth :=10;
  end
  else
  begin
    inc(j);Sheet.Columns[j].ColumnWidth := 0;inc(j);Sheet.Columns[j].ColumnWidth :=0;inc(j);Sheet.Columns[j].ColumnWidth :=0;
  end;
  inc(j);Sheet.Columns[j].ColumnWidth := 10;
  firstRow:=10;qator:=firstRow;
  while not s_tovar.Eof do begin
  j:=0;
  Sheet.Cells[qator-3,2] := '№ = '+s_tovar.FieldByName('nomer').AsString+' Sana = '+s_tovar.FieldByName('sana').AsString+'  Diler = '+s_tovar.FieldByName('dnom').AsString;
  inc(j);Sheet.Cells[qator-2,j] := '№';Sheet.Range['A'+IntToStr(qator-2)+':A'+IntToStr(qator-1)].merge;
  inc(j);Sheet.Cells[qator-2,j] := 'Tovar nomi';Sheet.Range['B'+IntToStr(qator-2)+':B'+IntToStr(qator-1)].merge;
  inc(j);Sheet.Cells[qator-2,j] := 'Seriya';Sheet.Range['C'+IntToStr(qator-2)+':C'+IntToStr(qator-1)].merge;
  inc(j);Sheet.Cells[qator-2,j] := 'Muddati';Sheet.Range['D'+IntToStr(qator-2)+':D'+IntToStr(qator-1)].merge;
  inc(j);Sheet.Cells[qator-1,j] := 'Soni';Sheet.Cells[qator-2,j] := 'Asosiy tovar';
  Sheet.Range['E'+IntToStr(qator-2)+':G'+IntToStr(qator-2)].merge;
  inc(j);Sheet.Cells[qator-1,j] := 'Narxi';
  inc(j);Sheet.Cells[qator-1,j] := 'Summasi';
  inc(j);Sheet.Cells[qator-1,j] := 'Soni';Sheet.Cells[qator-2,j] := 'Ichki tovar';
  Sheet.Range['H'+IntToStr(qator-2)+':J'+IntToStr(qator-2)].merge;
  inc(j);Sheet.Cells[qator-1,j] := 'Narxi';
  inc(j);Sheet.Cells[qator-1,j] := 'Summasi';
  inc(j);Sheet.Cells[qator-1,j] := 'Jami';Sheet.Range['K'+IntToStr(qator-2)+':K'+IntToStr(qator-1)].merge;
  with asos_slave do begin j:=0;i:=1;
  while not Eof do  begin
    inc(j);Sheet.Cells[qator,j]:=i;
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('tnom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('seriya').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('srok').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol').AsInteger;Sheet.Cells[qator,2].NumberFormat := '### ### ###0';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('sotish').AsFloat;Sheet.Cells[qator,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol').AsFloat*fieldbyname('sotish').AsFloat;Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol_in').AsInteger;Sheet.Cells[qator,2].NumberFormat := '### ### ###0';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('sotish_in').AsFloat;Sheet.Cells[qator,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol_in').AsFloat*fieldbyname('sotish_in').AsFloat;Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol').AsFloat*fieldbyname('sotish').AsFloat+fieldbyname('kol_in').AsFloat*fieldbyname('sotish_in').AsFloat;Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
    Next;inc(i);j:=0;inc(qator);
  end; // while
  last_col:='K';j:=1;
  inc(j);Sheet.Cells[qator,j] := 'Jami:';inc(j);inc(j);
  inc(j);Sheet.Cells[qator,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Sheet.Cells[qator,j].NumberFormat := '### ### ###0';
  inc(j);//Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  inc(j);Sheet.Cells[qator,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[qator,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Sheet.Cells[qator,j].NumberFormat := '### ### ##0';
  inc(j);inc(j);inc(j);Sheet.Cells[qator,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
  Range_shapka := Sheet.Range['A' + IntToStr(qator-RecordCount-1) + ':'+last_col + IntToStr(qator-RecordCount-2)];
  Range_telo   := Sheet.Range['A' + IntToStr(qator-RecordCount) + ':'+last_col + IntToStr(qator)];
  Range_itog   := Sheet.Range['A' + IntToStr(qator) + ':'+last_col + IntToStr(qator)];
  Range_all    := Sheet.Range['A' + IntToStr(qator-RecordCount-2)+':'+last_col+IntToStr(qator)];
  Sheet.Range['A' + IntToStr(qator-RecordCount-2) + ':'+last_col + IntToStr(qator)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 10, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 8, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 8, True, True,true);
  end; // with
  s_tovar.Next;i:=i+10;
  inc(qator); inc(qator);inc(qator);inc(qator);inc(qator);
  end;
  Sheet.Cells[2,1]:='Kirim hujjatlari';Sheet.Range['A2:H2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:H3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text;Sheet.Range['A5:H5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;

  //Chiqin

  zapros.Text:='';

  s_tovar.Close;s_tovar.SQL.Clear;
  s_tovar.sql.add('select a.*,h.nom as hnom,h.tel as htel');
  s_tovar.sql.add(' from asos a left join s_haridor h on a.h_id=h.id WHERE a.del_flag=1 and a.tur_oper in (2) and a.client_id = '+admin_id+' and a.sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value));
  s_tovar.Open;
  asos_slave.Close;
  asos_slave.SQL.Clear;
  asos_slave.sql.add('select t.nom as tnom,s.*');
  asos_slave.sql.add('from s_tovar t,asos_slave s WHERE s.del_flag=1 and s.asos_id=:id and s.tovar_id=t.id');

  //zapros.Visible:=true;zapros.Text:=dms.link.SQL.Text;exit;
  asos_slave.open;
  //if s_tovar.RecordCount=0 then begin ShowMessage('Ma`lumot yo`q');Exit;end;

  //ExcelCreateApplication('Chiqim', 2,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[2];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  j:=1;
  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;inc(j);Sheet.Columns[j].ColumnWidth := 10;
  inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);inc(j);inc(j);
  if dms.s_clientichkitovar.AsInteger=1 then begin
    inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth :=10;
  end
  else
  begin
    inc(j);Sheet.Columns[j].ColumnWidth := 0;inc(j);Sheet.Columns[j].ColumnWidth :=0;inc(j);Sheet.Columns[j].ColumnWidth :=0;
  end;
  inc(j);Sheet.Columns[j].ColumnWidth := 10;
  firstRow:=10;qator:=firstRow;
  while not s_tovar.Eof do begin
  j:=0;
  Sheet.Cells[qator-3,2] := '№ = '+s_tovar.FieldByName('diler_id').AsString+' Sana = '+s_tovar.FieldByName('sana').AsString+'  Haridor = '+s_tovar.FieldByName('hnom').AsString;
  inc(j);Sheet.Cells[qator-2,j] := '№';Sheet.Range['A'+IntToStr(qator-2)+':A'+IntToStr(qator-1)].merge;
  inc(j);Sheet.Cells[qator-2,j] := 'Tovar nomi';Sheet.Range['B'+IntToStr(qator-2)+':B'+IntToStr(qator-1)].merge;
  inc(j);Sheet.Cells[qator-2,j] := 'Seriya';Sheet.Range['C'+IntToStr(qator-2)+':C'+IntToStr(qator-1)].merge;
  inc(j);Sheet.Cells[qator-2,j] := 'Muddati';Sheet.Range['D'+IntToStr(qator-2)+':D'+IntToStr(qator-1)].merge;
  inc(j);Sheet.Cells[qator-1,j] := 'Soni';Sheet.Cells[qator-2,j] := 'Asosiy tovar';
  Sheet.Range['E'+IntToStr(qator-2)+':G'+IntToStr(qator-2)].merge;
  inc(j);Sheet.Cells[qator-1,j] := 'Narxi';
  inc(j);Sheet.Cells[qator-1,j] := 'Summasi';
  inc(j);Sheet.Cells[qator-1,j] := 'Soni';Sheet.Cells[qator-2,j] := 'Ichki tovar';
  Sheet.Range['H'+IntToStr(qator-2)+':J'+IntToStr(qator-2)].merge;
  inc(j);Sheet.Cells[qator-1,j] := 'Narxi';
  inc(j);Sheet.Cells[qator-1,j] := 'Summasi';
  inc(j);Sheet.Cells[qator-1,j] := 'Jami';Sheet.Range['K'+IntToStr(qator-2)+':K'+IntToStr(qator-1)].merge;
  with asos_slave do begin j:=0;i:=1;
  while not Eof do  begin
    inc(j);Sheet.Cells[qator,j]:=i;
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('tnom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('seriya').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('srok').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol').AsInteger;Sheet.Cells[qator,2].NumberFormat := '### ### ###0';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('sotish').AsFloat;Sheet.Cells[qator,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol').AsFloat*fieldbyname('sotish').AsFloat;Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol_in').AsInteger;Sheet.Cells[qator,2].NumberFormat := '### ### ###0';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('sotish_in').AsFloat;Sheet.Cells[qator,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol_in').AsFloat*fieldbyname('sotish_in').AsFloat;Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[qator,j]:=fieldbyname('kol').AsFloat*fieldbyname('sotish').AsFloat+fieldbyname('kol_in').AsFloat*fieldbyname('sotish_in').AsFloat;Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
    Next;inc(i);j:=0;inc(qator);
  end; // while
  last_col:='K';j:=1;
  inc(j);Sheet.Cells[qator,j] := 'Jami:';inc(j);inc(j);
  inc(j);Sheet.Cells[qator,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Sheet.Cells[qator,j].NumberFormat := '### ### ###0';
  inc(j);//Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  inc(j);Sheet.Cells[qator,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[qator,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Sheet.Cells[qator,j].NumberFormat := '### ### ##0';
  inc(j);inc(j);inc(j);Sheet.Cells[qator,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(RecordCount)+']C)';
  Sheet.Cells[qator,j].NumberFormat := '### ### ##0,00';
  Range_shapka := Sheet.Range['A' + IntToStr(qator-RecordCount-1) + ':'+last_col + IntToStr(qator-RecordCount-2)];
  Range_telo   := Sheet.Range['A' + IntToStr(qator-RecordCount) + ':'+last_col + IntToStr(qator)];
  Range_itog   := Sheet.Range['A' + IntToStr(qator) + ':'+last_col + IntToStr(qator)];
  Range_all    := Sheet.Range['A' + IntToStr(qator-RecordCount-2)+':'+last_col+IntToStr(qator)];
  Sheet.Range['A' + IntToStr(qator-RecordCount-2) + ':'+last_col + IntToStr(qator)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 10, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 8, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 8, True, True,true);
  end; // with
  s_tovar.Next;i:=i+10;
  inc(qator); inc(qator);inc(qator);inc(qator);inc(qator);
  end;
  Sheet.Name := 'Chiqim';
  Sheet.Cells[2,1]:='Chiqim hujjatlari';Sheet.Range['A2:H2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:H3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text;Sheet.Range['A5:H5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;

  Excel.ActiveWindow.DisplayGridLines:=False;
  //if fileExists(()+'c:\Форма.xls') then DeleteFile('c:\Форма.xls');
  //ExtractFilePath(Application.ExeName);
  last_col:=DateTimeToStr(now());
  if length(DateTimeToStr(now()))=19 then
  last_col:=copy(last_col,1,2)+'_'+copy(last_col,4,2)+'_'+copy(last_col,7,4)+'_'+copy(last_col,12,2)+'_'+copy(last_col,15,2)+'_'+copy(last_col,18,2)
  else
  last_col:=copy(last_col,1,2)+'_'+copy(last_col,4,2)+'_'+copy(last_col,7,4)+'_'+copy(last_col,12,1)+'_'+copy(last_col,14,2)+'_'+copy(last_col,17,2);
  Excel.ActiveWorkbook.SaveAs(ExtractFilePath(Application.ExeName)+'file/bot'+last_col+'.xlsx');
  Excel.ActiveWorkBook.Close(SaveChanges := false);
  //Excel.ActiveWorkBook.quit;
  //Excel.visible:=false;
  Excel := UnAssigned;
  Application.Restore;
  if dms.s_clientmasul2.AsString='' then exit;
  data := TIdMultiPartFormDataStream.Create;
  data.AddFormField('text', 'tovar aylanmasi');
  data.AddFile('file', ExtractFilePath(Application.ExeName)+'file/bot'+last_col+'.xlsx','xlsx');
  IdHTTP1.Post('http://185.185.80.245:71/api/report?chatId='+dms.s_clientmasul2.AsString, data);
  {LFormData := TMultipartFormData.Create();
  LResponse := TStringStream.Create;
  try
    LFormData.AddField('text', ' Aylanma');
    LFormData.AddFile('file', ExtractFilePath(Application.ExeName)+'file/'+trequestid.AsString+'.pdf');
    http.Post('http://185.185.80.245:71/api/report?chatId=171779415', LFormData, LResponse);
    //http.Post('http://185.185.80.245:73/api/report?chatId='+trequestchat.AsString, LFormData, LResponse);
    //Result := LResponse.DataString;
  finally
    LFormData.Free;
    LResponse.Free;
  end;}

end;

procedure TYukla.Button5Click(Sender: TObject);
begin
  if kod.Text<>'2013' then exit;
    showmessage(DateTimeToStr(now()));
end;

procedure TYukla.FormCreate(Sender: TObject);
begin
  sana1.Value:=Date();sana2.Value:=Date();
end;

procedure TYukla.Button6Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
    ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open('e:\yodgor1.xls');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  s_tovar.Open; asos_slave.Open;
  MyMass := ExcelApp.Range['A1', 'B'+Edit_kol.Text].Value;
  nom := MyMass[1, 2];
  for x := 1 to StrToInt(Edit_kol.Text) do begin
    if (nom<>MyMass[x, 1]) or (x=2) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 1],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    s_tovar.FieldByName('kol_in').Value:=0;
    s_tovar.FieldByName('kat').AsInteger:=1;
    s_tovar.FieldByName('brend').AsInteger:=0;
    s_tovar.FieldByName('shtrix').AsString := '';
    s_tovar.FieldByName('shtrix_full').AsString := '';
    s_tovar.FieldByName('shtrix_in').AsString := '';
    s_tovar.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    s_tovar.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    s_tovar.FieldByName('izm_id').AsInteger := 3;
    s_tovar.FieldByName('otdel').AsInteger := 0; //StrToInt(Trim(MyMass[x, 12]));
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    //s_tovar.FieldByName('otdel').Value:=1;
    s_tovar.FieldByName('shtrixkod').Value:=1;s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''))>0 then begin
    asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
    asos_slave.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('asos_id').AsString := Edit_asos_id.Text;

    asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
    asos_slave.FieldByName('summa').AsFloat := 0;
    asos_slave.FieldByName('summa_in').AsFloat := 0;
    asos_slave.FieldByName('summa_all').AsFloat:= 0;

    asos_slave.FieldByName('kol_ost').AsInteger:=10000;
    asos_slave.FieldByName('kol').AsInteger:=10000;
    asos_slave.FieldByName('kol_in').AsInteger:=0;asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
    asos_slave.Post;
    end;
    nom := MyMass[x, 1];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');

end;

procedure TYukla.Button7Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
    ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open('c:\tovarbaza.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  s_tovar.Open; asos_slave.Open;
  MyMass := ExcelApp.Range['A2', 'm2835'].Value;
  nom := MyMass[2, 1];
  for x := 2 to 2835 do begin
    if (nom<>MyMass[x, 1]) or (x=2) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 1],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    //s_tovar.FieldByName('shtrix').AsString := Trim(MyMass[x, 4]);
    if (MyMass[x, 5]<>'USD') then begin
      nom:=StrReplace(Trim(StrReplace(MyMass[x, 3],'.',',')),' ','');
      s_tovar.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 3],'.',',')),' ',''));
      s_tovar.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 3],'.',',')),' ',''));
      s_tovar.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 4],'.',',')),' ',''));
    end
    else
    begin
      s_tovar.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 3],'.',',')),' ',''));
      s_tovar.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 4],'.',',')),' ',''));
    end;
    s_tovar.FieldByName('kol_in').AsInteger := 1;
    IF MyMass[x, 6] = 'шт' then s_tovar.FieldByName('izm_id').AsInteger := 3;
    IF MyMass[x, 6] = 'м' then begin
      s_tovar.FieldByName('izm_id').AsInteger := 13;s_tovar.FieldByName('kol_in').AsInteger := 100;
    end;
    IF MyMass[x, 6] = 'кг' then begin
      s_tovar.FieldByName('izm_id').AsInteger := 11;s_tovar.FieldByName('kol_in').AsInteger := 1000;
    end;
    //s_tovar.FieldByName('otdel').AsInteger := StrToInt(Trim(MyMass[x, 7])); //
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    s_tovar.FieldByName('otdel').Value:=0;
    s_tovar.FieldByName('shtrixkod').Value:=1;
    s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('kat').Value:=0;
    //s_tovar.FieldByName('kol_in').Value:=1;
    s_tovar.FieldByName('brend').Value:=0;//s_tovar.FieldByName('izm_id').Value:=3;
    s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''))>0 then begin
      asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
      if (MyMass[x, 5]<>'USD') then begin
        asos_slave.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 3],'.',',')),' ',''));
        asos_slave.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 4],'.',',')),' ',''));
        asos_slave.FieldByName('asos_id').AsInteger := 1;
      end
      else
      begin
        asos_slave.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 3],'.',',')),' ',''));
        asos_slave.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 4],'.',',')),' ',''));
        asos_slave.FieldByName('asos_id').AsInteger := 2;
      end;
      asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
      asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
      asos_slave.FieldByName('summa').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''))*dms.k_slave1sena.AsFloat;
      asos_slave.FieldByName('summa_in').AsFloat := 0;
      asos_slave.FieldByName('summa_all').AsFloat:= asos_slave.FieldByName('summa').AsFloat;

      asos_slave.FieldByName('kol_ost').AsInteger:=asos_slave.FieldByName('kol_ost').AsInteger+StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
      asos_slave.FieldByName('kol').AsInteger:=asos_slave.FieldByName('kol').AsInteger+StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
      asos_slave.FieldByName('kol_in').AsInteger:=0;asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
      asos_slave.Post;
    end;
    nom := MyMass[x, 1];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
end;

procedure TYukla.Button8Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
    ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open('c:\class.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  s_tovar.Open; asos_slave.Open;
  MyMass := ExcelApp.Range['A2', 'm7201'].Value;
  nom := MyMass[2, 1];
  for x := 2 to 7201 do begin
    if (nom<>MyMass[x, 1]) or (x=2) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 1],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('shtrix').AsString := MyMass[x, 2];
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    //s_tovar.FieldByName('shtrix').AsString := Trim(MyMass[x, 4]);
    s_tovar.FieldByName('kol_in').AsInteger := 1;
    s_tovar.FieldByName('izm_id').AsInteger := 3;
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    s_tovar.FieldByName('otdel').Value:=0;
    s_tovar.FieldByName('shtrixkod').Value:=1;
    s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('kat').Value:=0;
    //s_tovar.FieldByName('kol_in').Value:=1;
    s_tovar.FieldByName('brend').Value:=0;//s_tovar.FieldByName('izm_id').Value:=3;
    s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;
    nom := MyMass[x, 1];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
end;

procedure TYukla.tasnifClick(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
    ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName)+'tasnif.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  s_tovar.Open; asos_slave.Open;
  ttasnif.Open; k_guruh.Open;
  MyMass := ExcelApp.Range['G1', 'G'+inttostr(x)].Value;
  for x := 3 to ExcelApp.ActiveCell.Row do begin
    if not ttasnif.Locate('mxik',MyMass[x, 1],[loCaseInsensitive]) then begin
    ttasnif.Append;
    nom:=StrReplace(Trim(StrReplace(ExcelSheet.Cells[x, 8],'\\','.')),'\','.');
    ttasnif.FieldByName('nom').AsString := nom;
    ttasnif.FieldByName('mxik').AsString := ExcelSheet.Cells[x, 7];
    ttasnif.FieldByName('shtrix').AsString := ExcelSheet.Cells[x, 9];
    ttasnif.FieldByName('brend').AsString := ExcelSheet.Cells[x, 5];
    ttasnif.FieldByName('atribut').AsString := ExcelSheet.Cells[x, 6];
    ttasnif.FieldByName('qadoq').AsString := ExcelSheet.Cells[x, 12];
    ttasnif.FieldByName('izm_group').AsString := ExcelSheet.Cells[x, 10];
    ttasnif.FieldByName('izm').AsString := ExcelSheet.Cells[x, 11];
    ttasnif.FieldByName('izm_group1').AsString := ExcelSheet.Cells[x, 13];
    ttasnif.FieldByName('izm1').AsString := ExcelSheet.Cells[x, 14];
    ttasnif.FieldByName('imtiyoz').AsString := ExcelSheet.Cells[x, 15];
    ttasnif.FieldByName('active').AsInteger:=1;
    ttasnif.post;
    if not k_guruh.Locate('kod',copy(ExcelSheet.Cells[x, 1],1,3),[loCaseInsensitive]) then
    begin
      k_guruh.Append;
      k_guruh.FieldByName('kod').AsString:=copy(ExcelSheet.Cells[x, 1],1,3);
      k_guruh.FieldByName('nom').AsString:=copy(ExcelSheet.Cells[x, 1],5,length(ExcelSheet.Cells[x, 1])-5);
      k_guruh.FieldByName('nom_ru').AsString:=copy(ExcelSheet.Cells[x, 1],5,length(ExcelSheet.Cells[x, 1])-5);
    end
    else
    begin
      k_guruh.edit;
    end;
    k_guruh.post;
    end;
  end; // for
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');

end;

procedure TYukla.Button9Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom,nom_new:string;
begin
  if kod.Text<>'2013' then exit;
    ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName)+'tasnif.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;

  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  ttasnif.Open; k_guruh.Open;
  //MyMass := ExcelApp.Range['A1', 'O'+inttostr(x)].Value;
  nom:=StrReplace(Trim(StrReplace(ExcelSheet.Cells[3,8],'\\','.')),'\','.');
  for x := 3 to ExcelApp.ActiveCell.Row do begin
    nom_new:=ExcelSheet.Cells[x,8];
    if (nom<>nom_new) or (x=3) then begin
      n:=1;ttasnif.Append;
    end
    else
    begin
      n:=2;ttasnif.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(ExcelSheet.Cells[x, 8],'\\','.')),'\','.');
    ttasnif.FieldByName('nom').AsString := nom;
    ttasnif.FieldByName('mxik').AsString := ExcelSheet.Cells[x, 7];
    ttasnif.FieldByName('shtrix').AsString := ExcelSheet.Cells[x, 9];
    ttasnif.FieldByName('brend').AsString := ExcelSheet.Cells[x, 5];
    ttasnif.FieldByName('atribut').AsString := ExcelSheet.Cells[x, 6];
    ttasnif.FieldByName('qadoq').AsString := ExcelSheet.Cells[x, 12];
    ttasnif.FieldByName('izm_group').AsString := ExcelSheet.Cells[x, 10];
    ttasnif.FieldByName('izm').AsString := ExcelSheet.Cells[x, 11];
    ttasnif.FieldByName('izm_group1').AsString := ExcelSheet.Cells[x, 13];
    ttasnif.FieldByName('izm1').AsString := ExcelSheet.Cells[x, 14];
    ttasnif.FieldByName('imtiyoz').AsString := ExcelSheet.Cells[x, 15];
    ttasnif.FieldByName('active').AsInteger:=1;
    ttasnif.post;

    if not k_guruh.Locate('kod',copy(ExcelSheet.Cells[x, 1],1,3),[loCaseInsensitive]) then
    begin
      k_guruh.Append;
      k_guruh.FieldByName('kod').AsString:=copy(ExcelSheet.Cells[x, 1],1,3);
      k_guruh.FieldByName('nom').AsString:=copy(ExcelSheet.Cells[x, 1],5,length(ExcelSheet.Cells[x, 1])-5);
      k_guruh.FieldByName('nom_ru').AsString:=copy(ExcelSheet.Cells[x, 1],5,length(ExcelSheet.Cells[x, 1])-5);
    end
    else
    begin
      k_guruh.edit;
    end;
    k_guruh.post;
    nom := ExcelSheet.Cells[x, 8];
  end; // for
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');

end;

procedure TYukla.Button10Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName)+'sentr.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  Edit_kol.Text:=IntToStr(x);
  s_tovar.Open;asos_slave.Open;
  MyMass := ExcelApp.Range['A2', 'F'+Edit_kol.Text].Value;
  nom := MyMass[1, 1];
  for x := 1 to StrToInt(Edit_kol.Text) do begin
    if (nom<>MyMass[x, 1]) or (x=1) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 1],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    s_tovar.FieldByName('kol_in').Value:=0;
    s_tovar.FieldByName('kat').AsInteger:=MyMass[x, 5];
    if not dms.s_kat.Locate('nom',MyMass[x, 4],[loCaseInsensitive]) then
    begin
      DMS.s_kat.Append;
      DMS.s_katnom.AsString:=MyMass[x, 4];
      DMS.s_katclient_id.AsInteger:=4;
      DMS.s_kat.post;
    end;
    s_tovar.FieldByName('brend').AsInteger:=0;
    s_tovar.FieldByName('shtrix').AsString := '';
    s_tovar.FieldByName('shtrix_full').AsString := '';
    s_tovar.FieldByName('shtrix_in').AsString := '';
    s_tovar.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    s_tovar.FieldByName('sotish_d').AsFloat := RoundTo(s_tovar.FieldByName('sena_d').AsFloat+s_tovar.FieldByName('sena_d').AsFloat*5/100,0);
    s_tovar.FieldByName('izm_id').AsInteger := 3;
    s_tovar.FieldByName('otdel').AsInteger := 0; //StrToInt(Trim(MyMass[x, 12]));
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    //s_tovar.FieldByName('otdel').Value:=1;
    s_tovar.FieldByName('shtrixkod').Value:=1;s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    {if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''))>0 then begin
    asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
    asos_slave.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('asos_id').AsString := Edit_asos_id.Text;

    asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
    asos_slave.FieldByName('summa').AsFloat := 0;
    asos_slave.FieldByName('summa_in').AsFloat := 0;
    asos_slave.FieldByName('summa_all').AsFloat:= 0;

    asos_slave.FieldByName('kol_ost').AsInteger:=StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
    asos_slave.FieldByName('kol').AsInteger:=StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
    asos_slave.FieldByName('kol_in').AsInteger:=0;
    asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
    asos_slave.Post;
    end;}
    nom := MyMass[x, 1];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');

end;

procedure TYukla.Button11Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName)+'haridor.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  Edit_kol.Text:=IntToStr(x);
  dms.s_haridor.Open;
  if dms.s_haridor.RecordCount>0 then begin

  end;

  MyMass := ExcelApp.Range['A2', 'b'+Edit_kol.Text].Value;
  nom := MyMass[2, 1];
  for x := 1 to StrToInt(Edit_kol.Text) do begin
    if (nom<>MyMass[x, 1]) or (x=1) then begin
      n:=1;dms.s_haridor.Append;
      dms.s_haridoruser_id.value:=dms.s_user.FieldByName('id').AsInteger;
      dms.s_haridorclient_id.value:=dms.s_user.FieldByName('client_id').AsInteger;
    end
    else
    begin
      n:=2;dms.s_haridor.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 1],'\\','.')),'\','.');
    dms.s_haridor.FieldByName('nom').AsString := nom;
    dms.s_haridor.FieldByName('telsms1').AsString := copy(MyMass[x, 2],5,9);
    dms.s_haridor.post;
    nom := MyMass[x, 1];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');
end;

procedure TYukla.Button12Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
    ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open('f:\rasta\nadmes.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  s_tovar.Open; asos_slave.Open;
  MyMass := ExcelApp.Range['A2', 'm4821'].Value;
  nom := MyMass[2, 1];
  for x := 2 to 4821 do begin
    if (nom<>MyMass[x, 1]) or (x=2) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 1],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    //s_tovar.FieldByName('shtrix').AsString := Trim(MyMass[x, 4]);
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 3],'.',',')),' ','');
    s_tovar.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 5],'.',',')),' ',''));
    s_tovar.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 6],'.',',')),' ',''));
    s_tovar.FieldByName('kol_in').AsInteger := 1;
    IF MyMass[x, 2] = '1' then s_tovar.FieldByName('izm_id').AsInteger := 3;
    IF MyMass[x, 2] = '1000' then begin
      s_tovar.FieldByName('kol_in').AsInteger := 1000;
      s_tovar.FieldByName('izm_id').AsInteger := 11;
    end;
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    s_tovar.FieldByName('otdel').Value:=0;s_tovar.FieldByName('shtrixkod').Value:=1;
    s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('kat').Value:=0;
    s_tovar.FieldByName('brend').Value:=0;s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;
    if length(s_tovar.FieldByName('shtrix').Asstring)=13 then begin
      dms.tshtrix.append;
      //dms.tshtrix.fieldbyname('nom').asst;
      dms.tshtrix.post;
    end;
    if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 5],'.00','')),' ',''))>0 then begin
      asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
      asos_slave.FieldByName('sena').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 5],'.',',')),' ',''));
      asos_slave.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 6],'.',',')),' ',''));
      asos_slave.FieldByName('asos_id').AsInteger := 1;
      asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
      asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
      asos_slave.FieldByName('summa').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 6],'.',',')),' ',''))*dms.k_slave1sena.AsFloat;
      asos_slave.FieldByName('summa_in').AsFloat := 0;
      asos_slave.FieldByName('summa_all').AsFloat:= asos_slave.FieldByName('summa').AsFloat;

      asos_slave.FieldByName('kol').AsInteger:=300;asos_slave.FieldByName('kol_in').AsInteger:=0;
      asos_slave.Post;
    end;
    nom := MyMass[x, 1];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
end;

procedure TYukla.termez_10Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom,s,s_in,sht:string;kol_,kol_in_:Currency;
begin
  if kod.Text<>'2013' then exit;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open('f:\rasta\tovar_sum.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  s_tovar.Open; asos_slave.Open;
  MyMass := ExcelApp.Range['A1', 'm100'].Value;
  nom:=StrReplace(Trim(StrReplace(MyMass[2, 2],'\\','.')),'\','.');
  for x := 2 to 99 do begin
    if (nom<>MyMass[x, 2]) or (x=2) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 2],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    //s_tovar.FieldByName('shtrix').AsString := Trim(MyMass[x, 4]);
    s_tovar.FieldByName('sotish').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 4],'.',',')),' ',''));
    s_tovar.FieldByName('sena').AsFloat := s_tovar.FieldByName('sotish').AsFloat-s_tovar.FieldByName('sotish').AsFloat*5/100;
    s_tovar.FieldByName('sena_d').AsFloat := s_tovar.FieldByName('sena').AsFloat/12750;
    s_tovar.FieldByName('sotish_d').AsFloat := s_tovar.FieldByName('sotish').AsFloat/12750;

    s_tovar.FieldByName('kol_in').AsInteger := 1;
    IF MyMass[x, 3] = 'dona' then s_tovar.FieldByName('izm_id').AsInteger := 3;
    IF MyMass[x, 3] = 'm' then begin
      s_tovar.FieldByName('izm_id').AsInteger := 13;s_tovar.FieldByName('kol_in').AsInteger := 100;
    end;
    IF MyMass[x, 3] = 'kg' then begin
      s_tovar.FieldByName('izm_id').AsInteger := 11;s_tovar.FieldByName('kol_in').AsInteger := 1000;
    end;
    //s_tovar.FieldByName('otdel').AsInteger := StrToInt(Trim(MyMass[x, 12]));
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    //s_tovar.FieldByName('otdel').Value:=1;
    s_tovar.FieldByName('shtrixkod').Value:=1;
    s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('kat').Value:=0;
    //s_tovar.FieldByName('kol_in').Value:=1;
    s_tovar.FieldByName('brend').Value:=0;//s_tovar.FieldByName('izm_id').Value:=3;
    s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    if n=1 then asos_slave.Append else asos_slave.Edit;
    asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
      asos_slave.FieldByName('sena').AsFloat := s_tovar.FieldByName('sena').AsFloat;
      asos_slave.FieldByName('sotish').AsFloat := s_tovar.FieldByName('sotish').AsFloat;
      asos_slave.FieldByName('asos_id').AsInteger := MyMass[x, 6];
      asos_slave.FieldByName('sena_d').AsFloat := s_tovar.FieldByName('sena_d').AsFloat;
      asos_slave.FieldByName('sotish_d').AsFloat := s_tovar.FieldByName('sotish_d').AsFloat;
    if s_tovar.FieldByName('kol_in').AsInteger>1 then
    begin
      asos_slave.FieldByName('sena_in').AsFloat := s_tovar.FieldByName('sena').AsFloat/s_tovar.FieldByName('kol_in').AsInteger;
      asos_slave.FieldByName('sotish_in').AsFloat := s_tovar.FieldByName('sotish').AsFloat/s_tovar.FieldByName('kol_in').AsInteger;
      asos_slave.FieldByName('sena_in_d').AsFloat := s_tovar.FieldByName('sena_d').AsFloat/s_tovar.FieldByName('kol_in').AsInteger;
      asos_slave.FieldByName('sotish_in_d').AsFloat := s_tovar.FieldByName('sotish_d').AsFloat/s_tovar.FieldByName('kol_in').AsInteger;

    end;
    //ShowMessage();
    kol_:=StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 5],'.00','')),' ',''));
    sht:=StrReplace(Trim(StrReplace(MyMass[x, 5],'.00','')),' ','');
    s:=sht;s_in:='0';
    if (pos(',',sht)>0) then
    begin
      s:=copy(sht,1,pos(',',sht)-1);
      s_in:=copy(sht,pos(',',sht)+1,length(sht)-pos(',',sht));
    end;

    asos_slave.FieldByName('kol').AsInteger:=StrToInt(s);
    asos_slave.FieldByName('kol_in').AsInteger:=StrToInt(s_in);
    asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
    asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
    asos_slave.FieldByName('summa').AsFloat:=asos_slave.FieldByName('kol').AsInteger*asos_slave.FieldByName('sena').AsFloat;
    asos_slave.FieldByName('summa_in').AsFloat:=asos_slave.FieldByName('kol_in').AsInteger*asos_slave.FieldByName('sena_in').AsFloat;
    asos_slave.FieldByName('summa_all').AsFloat:=asos_slave.FieldByName('summa').AsFloat+asos_slave.FieldByName('summa_in').AsFloat;
    //asos_slave.FieldByName('kol_ost').AsInteger:=asos_slave.FieldByName('kol_ost').AsInteger+StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 10],'.00','')),' ',''));
    asos_slave.Post;
    nom := MyMass[x, 2];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
end;

procedure TYukla.Button13Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  if kod.Text<>'2013' then exit;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName)+'sentr.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  Edit_kol.Text:=IntToStr(x);
  s_tovar.Open;asos_slave.Open;
  MyMass := ExcelApp.Range['A2', 'F'+Edit_kol.Text].Value;
  nom := MyMass[1, 1];
  for x := 1 to StrToInt(Edit_kol.Text) do begin
    if (nom<>MyMass[x, 1]) or (x=1) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 1],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    s_tovar.FieldByName('kol_in').Value:=0;
    s_tovar.FieldByName('kat').AsInteger:=MyMass[x, 5];
    if not dms.s_kat.Locate('nom',MyMass[x, 4],[loCaseInsensitive]) then
    begin
      DMS.s_kat.Append;
      DMS.s_katnom.AsString:=MyMass[x, 4];
      DMS.s_katclient_id.AsInteger:=4;
      DMS.s_kat.post;
    end;
    s_tovar.FieldByName('brend').AsInteger:=0;
    s_tovar.FieldByName('shtrix').AsString := '';
    s_tovar.FieldByName('shtrix_full').AsString := '';
    s_tovar.FieldByName('shtrix_in').AsString := '';
    s_tovar.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    s_tovar.FieldByName('sotish_d').AsFloat := RoundTo(s_tovar.FieldByName('sena_d').AsFloat+s_tovar.FieldByName('sena_d').AsFloat*5/100,0);
    s_tovar.FieldByName('izm_id').AsInteger := 3;
    s_tovar.FieldByName('otdel').AsInteger := 0; //StrToInt(Trim(MyMass[x, 12]));
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    //s_tovar.FieldByName('otdel').Value:=1;
    s_tovar.FieldByName('shtrixkod').Value:=1;s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    {if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''))>0 then begin
    asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
    asos_slave.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('asos_id').AsString := Edit_asos_id.Text;

    asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
    asos_slave.FieldByName('summa').AsFloat := 0;
    asos_slave.FieldByName('summa_in').AsFloat := 0;
    asos_slave.FieldByName('summa_all').AsFloat:= 0;

    asos_slave.FieldByName('kol_ost').AsInteger:=StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
    asos_slave.FieldByName('kol').AsInteger:=StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
    asos_slave.FieldByName('kol_in').AsInteger:=0;
    asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
    asos_slave.Post;
    end;}
    nom := MyMass[x, 1];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');
end;

procedure TYukla.naklClick(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n, i: Integer;nom:string;
begin
  //if kod.Text<>'2013' then exit;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName)+'90ombor.xlsx');

  {for i := 1 to ExcelApp.ActiveWorkbook.WorkSheets.Count do
    if ExcelApp.ActiveWorkbook.WorkSheets[i].Name = 'Хоразм' then
    begin
      ShowMessage('Хоразм листининг тартиб ра?ами: ' + IntToStr(i));
      Break;
    end;}
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;

  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  Edit_kol.Text:=IntToStr(x);
  s_tovar.Open;asos_slave.Open;
  MyMass := ExcelApp.Range['A8', 'K508'].Value;
  nom := MyMass[8, 8];
  for x := 1 to 508 do begin
    if (nom<>MyMass[x, 8]) or (x=1) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 8],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    s_tovar.FieldByName('kol_in').Value:=0;
    s_tovar.FieldByName('kat').AsInteger:=MyMass[x, 7];
    if not dms.s_kat.Locate('id',MyMass[x, 7],[loCaseInsensitive]) then
    begin
      DMS.s_kat.Append;
      //DMS.s_katnom.Asinteger:=MyMass[x, 7];
      DMS.s_katnom.AsString:=MyMass[x, 7];
      DMS.s_katclient_id.AsInteger:=4;
      DMS.s_kat.post;
    end;
    s_tovar.FieldByName('brend').AsInteger:=0;
    s_tovar.FieldByName('shtrix').AsString := '';
    s_tovar.FieldByName('shtrix_full').AsString := '';
    s_tovar.FieldByName('shtrix_in').AsString := '';
    s_tovar.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 10],'.',',')),' ',''));
    s_tovar.FieldByName('sotish_d').AsFloat := 0;
    s_tovar.FieldByName('izm_id').AsInteger := 3;
    s_tovar.FieldByName('otdel').AsInteger := 0; //StrToInt(Trim(MyMass[x, 12]));
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    //s_tovar.FieldByName('otdel').Value:=1;
    s_tovar.FieldByName('shtrixkod').Value:=1;s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    {if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''))>0 then begin
    asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
    asos_slave.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('asos_id').AsString := Edit_asos_id.Text;

    asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
    asos_slave.FieldByName('summa').AsFloat := 0;
    asos_slave.FieldByName('summa_in').AsFloat := 0;
    asos_slave.FieldByName('summa_all').AsFloat:= 0;

    asos_slave.FieldByName('kol_ost').AsInteger:=StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
    asos_slave.FieldByName('kol').AsInteger:=StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
    asos_slave.FieldByName('kol_in').AsInteger:=0;
    asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
    asos_slave.Post;
    end;}
    nom := MyMass[x, 1];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');
end;

procedure TYukla.katClick(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin

  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName)+'90ombor.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[2];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;//ShowMessage((inttostr(y)));
  Edit_kol.Text:=IntToStr(x);
  DMS.s_kat.Open;
  MyMass := ExcelApp.Range['A4', 'b'+inttostr(x)].Value;
  for x := 4 to StrToInt(Edit_kol.Text) do begin
    DMS.s_kat.Append;
    DMS.s_katid.Asinteger:=MyMass[x-3, 1];
    DMS.s_katnom.AsString:=MyMass[x-3, 2];
    DMS.s_katclient_id.AsInteger:=4;
    DMS.s_kat.post;
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');

end;

procedure TYukla.Button14Click(Sender: TObject);
const xlCellTypeLastCell = $0000000B;
var ExcelApp, ExcelSheet: OLEVariant;MyMass: Variant;x, y ,n: Integer;nom:string;
begin
  //if kod.Text<>'2013' then exit;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(ExtractFilePath(Application.ExeName)+'price.xlsx');
  ExcelSheet := ExcelApp.Workbooks[1].WorkSheets[1];
  ExcelSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;
  x := ExcelApp.ActiveCell.Row;
  y := ExcelApp.ActiveCell.Column;
  Edit_kol.Text:=IntToStr(x);
  s_tovar.Open;asos_slave.Open;
  MyMass := ExcelApp.Range['A2', 'F'+Edit_kol.Text].Value;
  nom := MyMass[1, 2];
  for x := 1 to StrToInt(Edit_kol.Text) do begin
    if (nom<>MyMass[x, 1]) or (x=1) then begin
      n:=1;s_tovar.Append;
    end
    else
    begin
      n:=2;s_tovar.edit;
    end;
    nom:=StrReplace(Trim(StrReplace(MyMass[x, 2],'\\','.')),'\','.');
    s_tovar.FieldByName('nom').AsString := nom;
    s_tovar.FieldByName('nom_sh').AsString := nom;
    s_tovar.FieldByName('nom_ru').AsString := nom;
    s_tovar.FieldByName('kol_in').Value:=0;
    if not dms.s_kat.Locate('nom',MyMass[x, 1],[loCaseInsensitive]) then
    begin
      DMS.s_kat.Append;
      DMS.s_katnom.AsString:=MyMass[x, 1];
      DMS.s_katclient_id.AsInteger:=4;
      DMS.s_kat.post;
    end;
    s_tovar.FieldByName('kat').AsInteger:=DMS.s_katid.AsInteger;
    s_tovar.FieldByName('brend').AsInteger:=0;
    s_tovar.FieldByName('shtrix').AsString := '';
    s_tovar.FieldByName('shtrix_full').AsString := '';
    s_tovar.FieldByName('shtrix_in').AsString := '';
    //if MyMass[x, 3] <> '' then
    s_tovar.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 3],'.',',')),' ',''));
    s_tovar.FieldByName('sotish_d').AsFloat := RoundTo(s_tovar.FieldByName('sena_d').AsFloat+s_tovar.FieldByName('sena_d').AsFloat*20/100,0);
    s_tovar.FieldByName('sena').AsFloat := s_tovar.FieldByName('sena_d').AsFloat*12200;
    s_tovar.FieldByName('sotish').AsFloat := s_tovar.FieldByName('sotish_d').AsFloat*12200;
    s_tovar.FieldByName('izm_id').AsInteger := 3;
    s_tovar.FieldByName('otdel').AsInteger := 0; //StrToInt(Trim(MyMass[x, 12]));
    s_tovar.FieldByName('turi').Value:=0;s_tovar.FieldByName('resept').Value:=0;
    //s_tovar.FieldByName('otdel').Value:=1;
    s_tovar.FieldByName('shtrixkod').Value:=1;s_tovar.FieldByName('qrkod').Value:=0;s_tovar.FieldByName('izm1').Value:=0;
    s_tovar.FieldByName('user_id').AsInteger:=StrToInt(admin_id);s_tovar.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
    s_tovar.FieldByName('zavod_id').AsInteger:=1;
    s_tovar.post;

    {if n=1 then asos_slave.Append else asos_slave.Edit;
    if StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''))>0 then begin
    asos_slave.FieldByName('tovar_id').AsInteger:=s_tovar.FieldByName('id').AsInteger;
    asos_slave.FieldByName('sena_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('sotish_d').AsFloat := StrToFloat(StrReplace(Trim(StrReplace(MyMass[x, 2],'.',',')),' ',''));
    asos_slave.FieldByName('asos_id').AsString := Edit_asos_id.Text;

    asos_slave.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
    asos_slave.FieldByName('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
    asos_slave.FieldByName('summa').AsFloat := 0;
    asos_slave.FieldByName('summa_in').AsFloat := 0;
    asos_slave.FieldByName('summa_all').AsFloat:= 0;

    asos_slave.FieldByName('kol_ost').AsInteger:=StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
    asos_slave.FieldByName('kol').AsInteger:=StrToInt(StrReplace(Trim(StrReplace(MyMass[x, 2],'.00','')),' ',''));
    asos_slave.FieldByName('kol_in').AsInteger:=0;
    asos_slave.FieldByName('kol_in_ost').AsInteger:=0;
    asos_slave.Post;
    end;}
    nom := MyMass[x, 2];
  end;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  ExcelSheet := Unassigned;
  ShowMessage('tamom');

end;

end.
