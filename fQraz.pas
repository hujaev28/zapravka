unit fQraz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, RzPanel, RzRadGrp, RzButton,
  StdCtrls, Mask, RzEdit, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Grids, DBGrids;

type
  TQarz = class(TForm)
    gclient: TDBGridEh;
    s_haridor: TZQuery;
    Ds_haridor: TDataSource;
    s_haridorhnom: TStringField;
    s_haridorqarz_summa: TFloatField;
    s_haridorqarz_epos: TFloatField;
    s_haridorqarz_dollar: TFloatField;
    s_haridorkirim: TFloatField;
    s_haridorkirimd: TFloatField;
    s_haridorchiqim: TFloatField;
    s_haridorchiqimd: TFloatField;
    s_haridorJami_summa: TFloatField;
    s_haridorJami_dollar: TFloatField;
    sf: TZQuery;
    Dsf: TDataSource;
    s_haridorid: TIntegerField;
    jamla: TZQuery;
    Djamla: TDataSource;
    DBGridEh1: TDBGridEh;
    RzPanel1: TRzPanel;
    hisobla: TRzBitBtn;
    otchet: TRzBitBtn;
    vid: TRzRadioGroup;
    Dalolatnoma: TRzBitBtn;
    jamlaid: TIntegerField;
    jamlasplid: TIntegerField;
    jamlaxnom: TStringField;
    jamlainom: TStringField;
    jamlatel: TStringField;
    jamlaqarz_s: TFloatField;
    jamlaqarz_d: TFloatField;
    jamlaqarz_b: TFloatField;
    jamlah_id: TIntegerField;
    jamlainv_id: TIntegerField;
    jamlaasos_id: TIntegerField;
    jamlatelegram: TStringField;
    jamlaemail: TStringField;
    jamlatur: TIntegerField;
    jamlasrok: TDateField;
    jamlasana: TDateField;
    jamlasend: TDateField;
    jamlabegin: TDateField;
    jamlaend: TDateField;
    jamlayaqin: TIntegerField;
    jamlagaldi: TIntegerField;
    jamlauxladi: TIntegerField;
    jamlakun_sana: TIntegerField;
    jamlakun_muddat: TIntegerField;
    Memo1: TMemo;
    jamlasfkun: TLargeintField;
    jamlasrokkun: TLargeintField;
    procedure DalolatnomaClick(Sender: TObject);
    procedure s_haridorJami_summaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_haridorJami_dollarGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure hisoblaClick(Sender: TObject);
    procedure jamlakun_muddatGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure vidClick(Sender: TObject);
    procedure otchetClick(Sender: TObject);
    procedure jamlaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qarz: TQarz;
    Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;


implementation

{$R *.dfm}
uses fdms, DateUtils,comobj,StrUtils;
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure ExcelFormatRange(RangeFormat: Variant;Font: string;Size: Byte;AutoFit,jir,perenos: Boolean);
begin
  RangeFormat.Font.Name := Font;RangeFormat.Font.Size := Size;
  RangeFormat.Font.Bold := jir;RangeFormat.WrapText := perenos;
  //if fdm.s_otchet.FieldByName('pokaz_info').AsBoolean then RangeFormat.Columns.AutoFit;
end;
procedure ExceltFormatRange(RangeFormat: Variant;Font: string;Size: Byte;AutoFit,perenos: Boolean);
begin
  RangeFormat.Font.Name := Font;RangeFormat.Font.Size := Size;
  RangeFormat.WrapText := perenos;
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
procedure TQarz.DalolatnomaClick(Sender: TObject);
begin
  dms.s_haridor.First;
  while not dms.s_haridor.eof do begin

  s_haridor.Close;s_haridor.SQL.Clear;
  s_haridor.SQL.Add('SELECT h.id as id,h.nom as hnom,sum(qarz_summa) as qarz_summa,sum(sum_epos_ch) as qarz_epos,sum(sum_d) as qarz_dollar,');
  //s_haridor.SQL.Add('(SELECT sum(sena_pl) from pl where pl.del_flag=1 and pl.h_id=h.id) as pls,(SELECT sum(sena_d) from pl where pl.del_flag=1 and pl.h_id=h.id) as pld');
  s_haridor.SQL.Add('(SELECT sum(if((pl.konv <> 1 and pl.vid in (7,17,25,20)),pl.sena_pl,0)) from pl where pl.del_flag = 1 and pl.h_id = h.id) as kirim,');
  s_haridor.SQL.Add('(SELECT sum(if((pl.konv <> 2 and pl.vid in (7,17,25,20)),pl.sena_d ,0)) from pl where pl.del_flag = 1 and pl.h_id = h.id) as kirimd,');
  s_haridor.SQL.Add('(SELECT sum(if((pl.konv <> 1 and pl.vid in (8,18))   ,pl.sena_pl,0)) from pl where pl.del_flag = 1 and pl.h_id = h.id) as chiqim,');
  s_haridor.SQL.Add('(SELECT sum(if((pl.konv <> 2 and pl.vid in (8,18))   ,pl.sena_d ,0)) from pl where pl.del_flag = 1 and pl.h_id = h.id) as chiqimd ');
  s_haridor.SQL.Add(' from asos,s_haridor h WHERE h.id=asos.h_id and asos.del_flag=1 and (qarz_summa>0 or qarz_dollar>0 or sum_epos_ch>0) and tur_oper=2 and h.id=351');
  //s_haridor.SQL.Add(' and asos.srok is not null ');
  s_haridor.SQL.Add(' group by h.id order by h.nom');

  s_haridor.Open;
  sf.close;sf.SQL.Clear;
  sf.SQL.Add('select id,nomer,sana,qarz_summa,qarz_dollar,qarz_s_ost,qarz_d_ost from asos WHERE del_flag=1 and h_id =:id and tur_oper in (2) order by sana');
  sf.open;
  exit;
  dms.s_haridor.Edit;
  dms.s_haridorqarz_sum.AsFloat:=0;dms.s_haridorqarz_d.AsFloat:=0;
  dms.s_haridor.post;
  while not dms.k_asos.eof do begin
    dms.s_haridor.Edit;
    dms.s_haridorqarz_sum.AsFloat:=dms.s_haridorqarz_sum.AsFloat+dms.k_asosqarz_summa.AsFloat;
    dms.s_haridorqarz_d.AsFloat:=dms.s_haridorqarz_d.AsFloat+dms.k_asosqarz_dollar.AsFloat;
    dms.s_haridor.post;
    dms.k_asos.Next;
    if dms.s_haridorid.AsInteger=452 then exit;
  end;
  dms.s_haridor.Next;
  end;
end;

procedure TQarz.s_haridorJami_summaGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=FloatToStr(s_haridorqarz_summa.AsFloat+s_haridorqarz_epos.AsFloat-s_haridorkirim.AsFloat+-s_haridorchiqim.AsFloat);
end;

procedure TQarz.s_haridorJami_dollarGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:=FloatToStr(s_haridorqarz_dollar.AsFloat-s_haridorkirimd.AsFloat+-s_haridorchiqimd.AsFloat);
end;

procedure TQarz.FormActivate(Sender: TObject);
begin
  jamla.Close;jamla.SQL.Clear;
  jamla.SQL.Add('SELECT DATEDIFF(now(),sana) as sfkun,DATEDIFF(now(),srok) as srokkun,qarz.* from qarz where (qarz_s+qarz_d+qarz_b) > 0');
  jamla.SQL.Add(' order by xnom');
  jamla.Open;
end;

procedure TQarz.hisoblaClick(Sender: TObject);
var d:TDate;s:string;
begin
  jamla.Close;jamla.SQL.Clear;
  jamla.SQL.Add('SELECT DATEDIFF(now(),sana) as sfkun,DATEDIFF(now(),srok) as srokkun,qarz.* from qarz');
  s:=' where (qarz_s > 0 or qarz_d > 0) and  ';
  case vid.ItemIndex of
  0:jamla.SQL.Add(s+'id>0');
  1:jamla.SQL.Add(s+'srok between '+kasaya(date()-3)+' and '+kasaya(date()-1));
  2:jamla.SQL.Add(s+'srok = '+kasaya(date()));
  3:jamla.SQL.Add(s+'srok between '+kasaya(date()+1)+' and '+kasaya(date()+3));
  4:jamla.SQL.Add(s+'srok > '+kasaya(date()+3));
  end;
  jamla.SQL.Add(' order by xnom');
  Memo1.Lines.Add(jamla.SQL.Text);
  jamla.Open;

end;

procedure TQarz.jamlakun_muddatGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
    if jamla.fieldbyname('srok').AsString='' then
      text:='-'
    else
      text:=jamla.fieldbyname('kun_muddat').AsString;
end;

procedure TQarz.vidClick(Sender: TObject);
begin
hisoblaClick(sender);
end;

procedure TQarz.otchetClick(Sender: TObject);
var firstRow,y,i,l,r,col:integer;ustun:string;
begin
  ExcelCreateApplication('Qarzdorlik', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  y:=1;  Sheet.Columns[y].ColumnWidth :=3;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth := 5;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth := 7;
  inc(y);Sheet.Columns[y].ColumnWidth := 20;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=14;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;

  firstRow:=10;
  y:=0;inc(y);
  Sheet.Cells[firstRow-1,y] := '№';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Sana';
  inc(y);Sheet.Cells[firstRow-1,y] := 'kun';
  inc(y);Sheet.Cells[firstRow-1,y] := 'muddat';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Kun';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Mijoz nomi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Telefon';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Invester nomi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'So`m';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  jamla.First;col:=0;l:=0;r:=0;y:=1;
  for i:=0 to jamla.RecordCount-1 do begin
    Sheet.Cells[firstrow+i,y]:=inttostr(i+1);
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlasana.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlasfkun.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlasrok.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlasrokkun.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlaxnom.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlatel.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlainom.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlaqarz_s.AsFloat;
    Sheet.Cells[firstrow+i,y].NumberFormat := '### ### ###0';
    inc(y);Sheet.Cells[firstrow+i,y]:=jamlaqarz_d.AsFloat;
    Sheet.Cells[firstrow+i,y].NumberFormat := '### ### ##0,00';
    jamla.Next;y:=1;
  end;
  col:=i;
  Sheet.Cells[firstrow+col,2] := 'Jami:';
  Sheet.Cells[firstrow+col,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,10].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  ustun:='J';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExceltFormatRange(Range_telo, 'Times New Roman', 11, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;

end;

procedure TQarz.jamlaCalcFields(DataSet: TDataSet);
begin
  jamlakun_sana.AsInteger:=DaysBetween(jamla.fieldbyname('sana').AsDateTime,date());

  if jamla.fieldbyname('srok').AsString='' then exit;
  jamlakun_muddat.AsInteger:=DaysBetween(jamla.fieldbyname('srok').AsDateTime,date());
  if jamla.fieldbyname('srok').AsDateTime>date() then
    jamlakun_muddat.AsInteger:=-jamlakun_muddat.AsInteger;
end;

end.
