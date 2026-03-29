unit fjamiaylanma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzPopups, RzButton, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, GridsEh, DBGridEh, StdCtrls, Mask, RzEdit,
  Grids, DBGrids;

type
  Tjamiaylanma = class(TForm)
    dan: TRzCalendar;
    RzBitBtn2: TRzBitBtn;
    gpl: TZQuery;
    gplid: TIntegerField;
    gplbank_id: TIntegerField;
    gpln_pl: TIntegerField;
    gpln_dok: TStringField;
    gpld_pl: TDateField;
    gplrssvoy: TStringField;
    gplrs: TStringField;
    gplvo: TSmallintField;
    gplnn: TSmallintField;
    gplclient_id: TIntegerField;
    gplsena_pl: TFloatField;
    gplsaldo: TFloatField;
    gplost_pl: TFloatField;
    gplvid: TSmallintField;
    gplchangedate: TDateField;
    gpldel_flag: TSmallintField;
    gpldiler_id: TIntegerField;
    gplh_id: TIntegerField;
    gpldiler: TStringField;
    gplharidor: TStringField;
    gplharajat: TStringField;
    gpltur: TStringField;
    gpls_plvid: TIntegerField;
    gplsena_d: TFloatField;
    Dpl: TDataSource;
    zapros: TRzEdit;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  jamiaylanma: Tjamiaylanma;
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
implementation

{$R *.dfm}
uses fdms, comobj,StrUtils, Math;
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
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;

procedure Tjamiaylanma.RzBitBtn2Click(Sender: TObject);
var firstRow,i:integer;ustun:string;b,e,bd,ed:Currency;s,z:string;
type MyType = record nn:Smallint;name:string[250];sotish,sotish_in:Currency;end;
begin
  ExcelCreateApplication('Jami pul aylanmasi', 1,1, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;firstRow:=6;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=40;
  Sheet.Columns[3].ColumnWidth := 20;Sheet.Columns[4].ColumnWidth :=15;
  Sheet.Cells[firstrow,1] := '№';Sheet.Cells[firstrow,2] := 'Amal nomi';
  Sheet.Cells[firstrow,3] := 'So`m';Sheet.Cells[firstrow,4] := 'Dollar';
  b:=0;e:=0;bd:=0;ed:=0;
  // diler qarzdorligi
  dms.main_link.Close;dms.main_link.SQL.Clear;
  if dms.s_clientdollar.AsInteger=2 then
    dms.main_link.SQL.Add('select sum(sum_d) as summa,0 as sum_d from asos where del_flag=1 and tur_oper in (1,5)  and sana <='+kasaya(dan.Date))
  else
    dms.main_link.SQL.Add('select sum(if(dollar=1,0,summa)) as summa,sum(sum_d) as sum_d from asos where del_flag=1 and tur_oper in (1,5) and sana <='+kasaya(dan.Date));

  dms.main_link.SQL.Add('and sana <= '+kasaya(dan.Date)+' order by id'); // and diler_id=6
  dms.main_link.open;
  e:=dms.main_link.fieldbyname('summa').AsFloat;
  ed:=dms.main_link.fieldbyname('sum_d').AsFloat;

  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT sum(if((konv is null or konv=0) and vid in (9,15),sena_pl,0)) as b_kirim,sum(if((konv is null or konv=0) and vid in (9,15),sena_d,0)) as b_kirimd,');
  dms.main_link.SQL.Add('sum(if(konv=2 and vid in (9,15),sena_pl,0)) as b_kirimks,sum(if(konv=1 and vid in (9,15),sena_d,0)) as b_kirimkd,');
  dms.main_link.SQL.Add('       sum(if((konv is null or konv=0) and vid in (3,14),sena_pl,0)) as b_chiqim,sum(if((konv is null or konv=0) and vid in (3,14),sena_d,0)) as b_chiqimd,');
  dms.main_link.SQL.Add('sum(if(konv=2 and vid in (3,14),sena_pl,0)) as b_chiqimks,sum(if(konv=1 and vid in (3,14),sena_d,0)) as b_chiqimkd');
  dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and d_pl <= '+kasaya(dan.Date)); //diler_id=6 and
  zapros.Text:=dms.main_link.SQL.Text;
  dms.main_link.open;

  i:=1;
  b:=(e+dms.main_link.FieldByName('b_kirim').AsFloat+dms.main_link.FieldByName('b_kirimks').AsFloat)-dms.main_link.FieldByName('b_chiqim').AsFloat-dms.main_link.FieldByName('b_chiqimks').AsFloat;
  bd:=(ed+dms.main_link.FieldByName('b_kirimd').AsFloat+dms.main_link.FieldByName('b_kirimkd').AsFloat)-dms.main_link.FieldByName('b_chiqimd').AsFloat-dms.main_link.FieldByName('b_chiqimkd').AsFloat;
  //if IsNan(bd) then ShowMessage('hato');
  bd:=round(bd);
  Sheet.Cells[firstrow+i,1] := '1';Sheet.Cells[firstrow+i,2] := 'Diler qarzdorligi:';
  Sheet.Cells[firstrow+i,3].NumberFormat := '0';Sheet.Cells[firstrow+i,4].NumberFormat := '0';
  Sheet.Cells[firstrow+i,3] := floattostr(-b);
  //Sheet.Cells[firstrow+i,6] := floattostr(e)+'; b_kirim = '+dms.main_link.FieldByName('b_kirim').AsString+' b_kirimks= '+dms.main_link.FieldByName('b_kirimks').AsString+' b_chiqim= '+dms.main_link.FieldByName('b_chiqim').AsString+' b_chiqimks: '+dms.main_link.FieldByName('b_chiqimks').AsString;
  //Sheet.Cells[firstrow+i,7] := floattostr(ed)+' b_kirimd = '+dms.main_link.FieldByName('b_kirimd').AsString+' b_kirimkd= '+dms.main_link.FieldByName('b_kirimkd').AsString+' b_chiqimd= '+dms.main_link.FieldByName('b_chiqimd').AsString+' b_chiqimkd= '+dms.main_link.FieldByName('b_chiqimkd').AsString;
  Sheet.Cells[firstrow+i,4] := floattostr(-bd);

  // Haridor qarzdorligi
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana <= '+kasaya(dan.Date)+',qarz_dollar,0)) as b_dollar,sum(if(sana <= '+kasaya(dan.Date)+',qarz_summa,0)) as b_summa,sum(if(sana <= '+kasaya(dan.Date)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(' from asos where h_id>0 and del_flag=1 and tur_oper=2'); //h_id = 208 and
  dms.main_link.open;
  //sqltext.Text:=dms.main_link.SQL.Text;
  b:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  bd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT sum(if((konv=1 or vid in (7,17,20)),sena_pl,0)) as b_kirim,sum(if((konv=2 or vid in (7,17,20)),sena_d,0)) as b_kirimd,sum(if((konv=1 or vid in (8,18)),sena_pl,0)) as b_chiqim,sum(if((konv=2 or vid in (8,18)),sena_d,0)) as b_chiqimd ');
  dms.main_link.SQL.Add(' from pl WHERE h_id>0 and del_flag=1 and d_pl <= '+kasaya(dan.Date)); //h_id = 208 and
  //sqltext.Text:=sqltext.Text+';'+dms.main_link.SQL.Text;
  //exit;
  dms.main_link.open;

  inc(i);
  Sheet.Cells[firstrow+i,1] := '2';Sheet.Cells[firstrow+i,2] := 'Haridor qarzdorligi:';
  Sheet.Cells[firstrow+i,3].NumberFormat := '0';Sheet.Cells[firstrow+i,4].NumberFormat := '0';
  Sheet.Cells[firstrow+i,3] := (b+dms.main_link.FieldByName('b_chiqim').AsFloat)-dms.main_link.FieldByName('b_kirim').AsFloat;
  Sheet.Cells[firstrow+i,4] := (bd+dms.main_link.FieldByName('b_chiqimd').AsFloat)-dms.main_link.FieldByName('b_kirimd').AsFloat;

  inc(i);
  Sheet.Cells[firstrow+i,1] := '3';Sheet.Cells[firstrow+i,2] := 'Ombordagi tovarlar:';

  dms.main_link.Close;dms.main_link.SQL.Clear;

  dms.main_link.sql.add('SELECT ');

  case dms.s_clientdollar.AsInteger of
  0:begin // faqat so`m
      dms.main_link.sql.add('0 as q,0 as q_in,');
      dms.main_link.SQL.Add('sum(s.kol_ost*s.sena) as qs,sum(s.kol_in_ost*s.sena_in) as qs_in');
    end;
  1:begin // faqat dollar
      dms.main_link.sql.add('sum(s.kol_ost*s.sena_d) as q,sum(s.kol_in_ost*s.sena_in_d) as q_in,');
      dms.main_link.SQL.Add('0 as qs,0 as qs_in ');
  end;
  2:begin // dollar va so`m
      dms.main_link.sql.add('sum(s.kol_ost*s.sena_d) as q,sum(s.kol_in_ost*s.sena_in_d) as q_in,');
      dms.main_link.SQL.Add('sum(if(dollar=1,0,s.kol_ost*s.sena)) as qs,sum(if(dollar=1,0,s.kol_ost*s.sena_in)) as qs_in');
    end;
  end;
  dms.main_link.sql.add(' FROM asos a,asos_slave s');
  dms.main_link.sql.add(' where (a.tur_oper=1 or a.tur_oper=4 or a.tur_oper=5) and (s.kol_ost>0 or s.kol_in_ost>0) and a.id=s.asos_id and a.id=s.asos_id and s.del_flag=1');
  dms.main_link.SQL.Add(' order by  a.client_id' );

  //zapros.Text:= dms.main_link.SQL.Text;
  dms.main_link.open;
  Sheet.Cells[firstrow+i,3] := dms.main_link.FieldByName('qs').AsFloat+dms.main_link.FieldByName('qs_in').AsFloat;
  Sheet.Cells[firstrow+i,3].NumberFormat := '0';Sheet.Cells[firstrow+i,4].NumberFormat := '0';
  Sheet.Cells[firstrow+i,4] := dms.main_link.FieldByName('q').AsFloat+dms.main_link.FieldByName('q_in').AsFloat;

  s:='sum(if(konv=2,0,sena_pl)) as summa,sum(if(konv=1,0,sena_d)) as summa_d';

  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select '+s+' from pl,s_pl where pl.bank_id=0 and pl.vid=s_pl.id and pl.del_flag=1 and s_pl.vid=1 ');
  dms.main_link.SQL.Add(' and d_pl <= '+kasaya(dan.Date)+' order by pl.id');
  dms.main_link.open;
  b:=dms.main_link.fieldbyname('summa').AsFloat;bd:=dms.main_link.fieldbyname('summa_d').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select '+s+' from pl,s_pl where pl.bank_id=0 and pl.vid=s_pl.id and  pl.del_flag=1 and s_pl.vid=2');
  dms.main_link.SQL.Add(' and d_pl <= '+kasaya(dan.Date)+' order by pl.id');
  dms.main_link.open;
  e:=dms.main_link.fieldbyname('summa').AsFloat;ed:=dms.main_link.fieldbyname('summa_d').AsFloat;
  dms.main_link.open;

  inc(i);
  Sheet.Cells[firstrow+i,1] := '4';Sheet.Cells[firstrow+i,2] := 'Kassa pul aylanmasi:';
  Sheet.Cells[firstrow+i,3].NumberFormat := '0';Sheet.Cells[firstrow+i,4].NumberFormat := '0';
  Sheet.Cells[firstrow+i,3] := b-e;Sheet.Cells[firstrow+i,4] := bd-ed;

  inc(i);
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa from pl,s_pl where pl.bank_id=1 and pl.vid=s_pl.id and pl.del_flag=1 and s_pl.vid=1 ');
  dms.main_link.SQL.Add(' and d_pl <= '+kasaya(dan.Date)+' order by pl.id');
  dms.main_link.open;
  b:=dms.main_link.fieldbyname('summa').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa from pl,s_pl where pl.bank_id=1 and pl.vid=s_pl.id and  pl.del_flag=1 and s_pl.vid=2');
  dms.main_link.SQL.Add(' and d_pl <= '+kasaya(dan.Date)+' order by pl.id');
  dms.main_link.open;
  e:=dms.main_link.fieldbyname('summa').AsFloat;

  Sheet.Cells[firstrow+i,1] := '5';Sheet.Cells[firstrow+i,2] := 'Bank pul aylanmasi:';
  Sheet.Cells[firstrow+i,3].NumberFormat := '0';Sheet.Cells[firstrow+i,4].NumberFormat := '0';
  Sheet.Cells[firstrow+i,3] := b-e;

  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa from pl,s_pl where pl.bank_id=2 and pl.vid=s_pl.id and pl.del_flag=1 and s_pl.vid=1 ');
  dms.main_link.SQL.Add(' and d_pl <= '+kasaya(dan.Date)+' order by pl.id');
  dms.main_link.open;
  b:=dms.main_link.fieldbyname('summa').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa from pl,s_pl where pl.bank_id=2 and pl.vid=s_pl.id and  pl.del_flag=1 and s_pl.vid=2');
  dms.main_link.SQL.Add(' and d_pl <= '+kasaya(dan.Date)+' order by pl.id');
  dms.main_link.open;
  e:=dms.main_link.fieldbyname('summa').AsFloat;

  inc(i);
  Sheet.Cells[firstrow+i,3].NumberFormat := '0';Sheet.Cells[firstrow+i,4].NumberFormat := '0';
  Sheet.Cells[firstrow+i,1] := '6';Sheet.Cells[firstrow+i,2] := 'Click pul aylanmasi:';
  Sheet.Cells[firstrow+i,3] := b-e;
  inc(i);
  Sheet.Cells[firstrow+i,2] := 'Jami';
  Sheet.Cells[firstrow+i,3].formula := '=SUM(R[-1]C:R[-'+IntToStr(i-1)+']C)';Sheet.Cells[firstrow+i,3].NumberFormat := '0';
  Sheet.Cells[firstrow+i,4].formula := '=SUM(R[-1]C:R[-'+IntToStr(i-1)+']C)';Sheet.Cells[firstrow+i,4].NumberFormat := '0';

 //Sheet.Cells[firstrow+i+2,2] := 'Ohirgi qoldiq:';Sheet.Cells[firstrow+i+2,4] := gachaq.Text;Sheet.Cells[firstrow+i+2,5] := gachaqd.Text;
  ustun:='D';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow) + ':'+ustun + IntToStr(firstRow)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+i)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+i) + ':'+ustun + IntToStr(FirstRow+i)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow) + ':'+ustun + IntToStr(FirstRow+i)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+i)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Jami pul aylanmasi ';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:='Sana: ' + DateToStr(dan.Date);Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
end;

procedure Tjamiaylanma.FormActivate(Sender: TObject);
begin
  dan.Date:=Date();
end;

end.
