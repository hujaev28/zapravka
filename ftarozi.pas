unit ftarozi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids,
  DB, ADODB, StdCtrls, Mask, DBCtrlsEh;

type
  Ttarozi = class(TForm)
    ZConnection1: TADOConnection;
    tplu: TADOQuery;
    Dplu: TDataSource;
    DBGrid1: TDBGrid;
    ts_tovar: TZQuery;
    Ds_tovar: TDataSource;
    DBGrid2: TDBGrid;
    Bittalab: TButton;
    jami: TButton;
    Pechat: TButton;
    z_zapros: TZQuery;
    ado_zapros: TADOQuery;
    Label1: TLabel;
    Label2: TLabel;
    ado_kol: TDBNumberEditEh;
    z_kol: TDBNumberEditEh;
    qoldiq: TZQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Yangilash: TButton;
    plu: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BittalabClick(Sender: TObject);
    procedure jamiClick(Sender: TObject);
    procedure PechatClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure YangilashClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure pluClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );

  tarozi: Ttarozi;

implementation

{$R *.dfm}
uses fdms,comobj;
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

procedure Ttarozi.FormActivate(Sender: TObject);
begin
  ts_tovar.Open;qoldiq.Open;
  z_kol.Value:=ts_tovar.RecordCount;
  //if tplu.Active then exit;
  tplu.Open;
  ado_kol.Value:=tplu.RecordCount;

end;

procedure Ttarozi.BittalabClick(Sender: TObject);
var lastid:integer;
begin
  if ts_tovar.FieldByName('shtrix_in').AsString='' then begin
    ShowMessage('Shtrix kod kiritilmagan');
    exit;
  end;
  //if ts_tovar.FieldByName('sotish').AsFloat<1 then begin
  //  ShowMessage('Sotish narxi kiritilmagan');
  //  exit;
  //end;

  tplu.Refresh;tplu.last;lastid:=tplu.FieldByName('pluno').AsInteger;
  if tplu.Locate('pluno',ts_tovar.FieldByName('tz_id').AsInteger,[loCaseInsensitive]) then
  tplu.Edit
  else
  begin
    tplu.Append;
    tplu.FieldByName('pluno').AsInteger:=lastid+1;
    ts_tovar.Edit;ts_tovar.FieldByName('tz_id').AsInteger:=lastid+1;ts_tovar.Post;
  end;
  tplu.FieldByName('pluname').AsString:=copy(ts_tovar.FieldByName('nom').AsString,7,length(ts_tovar.FieldByName('nom').AsString)-6);
  tplu.FieldByName('plucode').AsString:=ts_tovar.FieldByName('shtrix_in').AsString;
  {if (qoldiq.FieldByName('sotish').AsFloat>0) and (qoldiq.FieldByName('sotish').AsFloat<>ts_tovar.FieldByName('sotish').AsFloat) then
  begin
    ts_tovar.Edit;ts_tovar.FieldByName('sotish').AsFloat:=qoldiq.FieldByName('sotish').AsFloat;ts_tovar.Post;
  end;
  }
  tplu.FieldByName('unitprice').AsFloat:=ts_tovar.FieldByName('sotish').AsFloat;

  tplu.FieldByName('transferable').AsBoolean:=True;tplu.FieldByName('datetype').AsInteger:=0;
  tplu.FieldByName('barcodetype').AsInteger:=2;tplu.FieldByName('labelformat').AsInteger:=1;
  tplu.post;
  ado_kol.Value:=tplu.RecordCount;z_kol.Value:=ts_tovar.RecordCount;
end;

procedure Ttarozi.jamiClick(Sender: TObject);
begin
  ts_tovar.First;
  while not ts_tovar.Eof do begin
    BittalabClick(Sender);
    if (ts_tovar.FieldByName('shtrix_in').AsString='') or (ts_tovar.FieldByName('sotish').AsFloat<1) then exit;
    ts_tovar.Next;
    Application.ProcessMessages;
  end;
end;

procedure Ttarozi.PechatClick(Sender: TObject);
var firstRow,i,j:integer;last_col:String;
begin
  //if MessageDlg('Tarozi tovar bazasini yangilaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  ExcelCreateApplication('Kassa savdosi', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  j:=1;
  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;
  inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 10;
  firstRow:=0;j:=0;
  inc(j);Sheet.Cells[firstRow+1,j] := 'shtrix';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Tovar nomi';
  //inc(j);Sheet.Cells[firstRow+1,j] := 'shtrix';
  //inc(j);Sheet.Cells[firstRow+1,j] := 'shtrix kod';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Narhi';
  with tplu do begin j:=0;i:=1;firstrow:=firstrow+1;
  while not Eof do  begin
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('PluNo').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('PluName').AsString;
    //inc(j);Sheet.Cells[firstrow+RecNo,j].NumberFormat := '@';
    //    Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('shtrix_in').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('UnitPrice').AsFloat;
            Sheet.Cells[firstrow+RecNo,j].NumberFormat := '### ### ##0,00';
    Next;inc(i);j:=0;
  end; // while
  end; // with
  Excel.Visible := true;Excel := UnAssigned;

end;

procedure Ttarozi.Button2Click(Sender: TObject);
var s:string;F:TextFile;i:Integer;
begin
  qoldiq.Close;qoldiq.SQL.Clear;
  qoldiq.SQL.add('select id,nom,sotish,shtrix_in,shtrix from s_tovar where del_flag=1 and kol_in=1000 order by id');
  qoldiq.open;i:=0;
    Assignfile(f,ExtractFilePath(Application.ExeName)+'tarozi.txt');Rewrite(f);
    while not qoldiq.Eof do begin
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.add('select id,sotish from asos_slave where tovar_nom is null and del_flag=1 and tovar_id = '+qoldiq.FieldByName('id').AsString+' order by id desc ');
      dms.link.open;
      if dms.link.RecordCount>0 then begin
        if(qoldiq.Fieldbyname('shtrix_in').AsString='') then
          ShowMessage(qoldiq.Fieldbyname('nom').AsString +' ga ichki shtrix kerak')
        else
        begin
          inc(i);
          s:=inttostr(i)+';'+qoldiq.Fieldbyname('nom').AsString+';;'+dms.link.Fieldbyname('sotish').AsString+';0;0;0;'+inttostr(strtoint(qoldiq.Fieldbyname('shtrix_in').AsString))+';0;0;;15.02.21;0;0;0;0;01.01.01';
          writeln(f,s);
        end;
      end;
      qoldiq.Next;
    end;
    CloseFile(f);
end;

procedure Ttarozi.Button3Click(Sender: TObject);
begin
  tplu.first;
  while not tplu.Eof do begin
    tplu.Delete;
  end;
end;

procedure Ttarozi.YangilashClick(Sender: TObject);
begin
  ts_tovar.Open;qoldiq.Open;
  z_kol.Value:=ts_tovar.RecordCount;
  //if tplu.Active then exit;
  tplu.Open;
  ado_kol.Value:=tplu.RecordCount;
end;

procedure Ttarozi.Button4Click(Sender: TObject);
var firstRow,i,j:integer;last_col:String;
begin
  //if MessageDlg('Tarozi tovar bazasini yangilaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  ExcelCreateApplication('Kassa savdosi', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  j:=1;
  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;
  firstRow:=0;j:=0;
  inc(j);Sheet.Cells[firstRow+1,j] := '№';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Tovar nomi';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Summa';
  with tplu do begin j:=0;i:=1;firstrow:=firstrow+1;
  while not Eof do  begin
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('PluNo').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('PluName').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('UnitPrice').AsFloat;
           Sheet.Cells[firstrow+RecNo,j].NumberFormat := '### ### ##0,00';

    Next;inc(i);j:=0;
  end; // while
  end; // with
  Excel.Visible := true;Excel := UnAssigned;
end;

procedure Ttarozi.pluClick(Sender: TObject);
var s:string;F:TextFile;i:Integer;
begin
  tplu.First;i:=0;
  Assignfile(f,ExtractFilePath(Application.ExeName)+'tarozi.txt');Rewrite(f);
  while not tplu.Eof do begin
    inc(i);
    s:=inttostr(i)+';'+tplu.Fieldbyname('PluName').AsString+';;'+tplu.Fieldbyname('unitprice').AsString+';0;0;0;'+inttostr(strtoint(tplu.Fieldbyname('PluCode').AsString))+';0;0;;15.02.21;0;0;0;0;01.01.01';
    writeln(f,s);
    tplu.Next;
  end;
  CloseFile(f);
end;

procedure Ttarozi.Button5Click(Sender: TObject);
var firstRow,i,j:integer;last_col:String;
begin
  //if MessageDlg('Tarozi tovar bazasini yangilaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  ExcelCreateApplication('Yangi kassa', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  j:=1;
  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;
  inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 10;
  firstRow:=0;j:=0;
  inc(j);Sheet.Cells[firstRow+1,j] := 'Горячая клавиша';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Название';
  inc(j);Sheet.Cells[firstRow+1,j] := 'LF код';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Код';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Тип штрихкода';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Цена единицы';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Вес единицы';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Количество единиц';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Отдел';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Вес PT';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Срок годности';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Тип упаковки';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Тара';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Ошибка(%)';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Сообщение 1';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Сообщение 2';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Этикетка';
  inc(j);Sheet.Cells[firstRow+1,j] := 'Таблица скидок';
  with tplu do begin j:=0;i:=1;firstrow:=firstrow+1;
  while not Eof do  begin
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('PluNo').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('PluName').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('PluNo').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j].NumberFormat := '@';
      Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('PluCode').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='27';
    //inc(j);Sheet.Cells[firstrow+RecNo,j].NumberFormat := '@';
    //    Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('shtrix_in').AsString;
    inc(j);Sheet.Cells[firstrow+RecNo,j]:=fieldbyname('UnitPrice').AsFloat;
            Sheet.Cells[firstrow+RecNo,j].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='4';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='5';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    inc(j);Sheet.Cells[firstrow+RecNo,j]:='0';
    Next;inc(i);j:=0;
  end; // while
  end; // with
  Excel.Visible := true;Excel := UnAssigned;
end;

end.
