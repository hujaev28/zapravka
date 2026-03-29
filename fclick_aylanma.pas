unit fclick_aylanma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,db, GridsEh, Menus, SUIPopupMenu, DBGridEh, StdCtrls,
  Mask, RzEdit, ExtCtrls, RzPanel, RzPopups, RzLabel, DBCtrlsEh, DBLookupEh,
  RzButton, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  Tclick_aylanma = class(TForm)
    GroupBox1: TGroupBox;
    danc: TRzCalendar;
    dan: TRzDateTimeEdit;
    gachac: TRzCalendar;
    gacha: TRzDateTimeEdit;
    RzBitBtn2: TRzBitBtn;
    zapros: TRzEdit;
    sqltext: TRzEdit;
    Dpl: TDataSource;
    grpl: TDBGridEh;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    danq: TRzNumericEdit;
    gachaq: TRzNumericEdit;
    chiqim: TRzNumericEdit;
    kirim: TRzNumericEdit;
    hisobla: TButton;
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
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    danqd: TRzNumericEdit;
    gachaqd: TRzNumericEdit;
    chiqimd: TRzNumericEdit;
    kirimd: TRzNumericEdit;
    gplsena_d: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure g_asosDblClick(Sender: TObject);
    procedure dancChange(Sender: TObject);
    procedure gachacChange(Sender: TObject);
    procedure danChange(Sender: TObject);
    procedure gachaChange(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure hisoblaClick(Sender: TObject);
  private
     procedure interval(int1,int2:Variant;massiv:Integer;z,w,s:String);
  public
    { Public declarations }
  end;

var
  click_aylanma: Tclick_aylanma;
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
  poisk: array [1..27] of String;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );


implementation

{$R *.dfm}
uses fdms, fkassa_izoh_edit,comobj,StrUtils, DateUtils;
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

procedure Tclick_aylanma.interval(int1,int2:Variant;massiv:Integer;z,w,s:String);
begin
if  int1<>Null or int2<>Null then
begin
  if (int1<>Null) and (int2<>Null) then
    if int1=int2 then
    begin
      poisk[massiv]:=' ('+z+' = '+kasaya(int1)+' or '+w+' = '+kasaya(int1)+') ';
      //zapros.Text:=zapros.Text+s+' = '+DateToStr(int1)+'#';
    end
    else
    begin
      poisk[massiv]:=' ('+z+' between '+kasaya(int1)+' and '+kasaya(int2)+' or '+w+' between '+kasaya(int1)+' and '+kasaya(int2)+')';
      //zapros.Text:=zapros.Text+s+' oralig`i '+DateToStr(int1)+' dan '+DateToStr(int2)+' gacha#';
    end;
  if (int1<>Null) and (int2=Null) then
    begin
      poisk[massiv]:=' ('+z+' >= '+kasaya(int1)+' or '+w+' >= '+kasaya(int1)+') ';
      //zapros.Text:=zapros.Text+s+' '+DateToStr(int1)+' dan keyingi #';
    end;
  if (int1=Null) and (int2<>Null) then
    begin
      poisk[massiv]:=' ('+z+' <= '+kasaya(int2)+' or '+w+' <= '+kasaya(int2)+')';
      //zapros.Text:=zapros.Text+s+' '+DateToStr(int2)+' dan oldingi #';
    end;
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
  if (asos[i] in ['a' .. 'z']) or (asos[i] in ['A' .. 'Z']) then begin lat:=true;Break;end;
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
procedure Tclick_aylanma.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tclick_aylanma.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tclick_aylanma.FormCreate(Sender: TObject);
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
procedure Tclick_aylanma.g_asosDblClick(Sender: TObject);
begin
  //if dms.k_asosqarz_flag.AsInteger>1 then begin ShowMessage('O`zgartirishga ruhsat yoq');exit;end;
  DMS.k_asos.Edit;
  kassa_izoh_edit.showmodal;
end;

procedure Tclick_aylanma.dancChange(Sender: TObject);
begin
  dan.Date:=danc.Date;
end;

procedure Tclick_aylanma.gachacChange(Sender: TObject);
begin
  gacha.Date:=gachac.Date;
end;

procedure Tclick_aylanma.danChange(Sender: TObject);
begin
  danc.Date:=dan.Date;
  hisoblaClick(sender);
end;

procedure Tclick_aylanma.gachaChange(Sender: TObject);
begin
  gachac.Date:=gacha.Date;hisoblaClick(sender);
end;

procedure Tclick_aylanma.RzBitBtn2Click(Sender: TObject);
var firstRow,i:integer;ustun:string;
type MyType = record nn:Smallint;name:string[250];kol,kol_in:Integer;sotish,sotish_in,ch,ch_in,foyda:Currency;end;
begin
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=dan;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  interval(dan.Date, gacha.Date, 1,'d_pl' ,'d_pl' ,' d_pl ');
  if (poisk[1]>'') then
  sqltext.Text:=poisk[1];
  ExcelCreateApplication('Kassa aylanmasi', 1,1, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;firstRow:=10;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=10;Sheet.Columns[3].ColumnWidth := 6;
  Sheet.Columns[4].ColumnWidth :=20;Sheet.Columns[5].ColumnWidth := 20;Sheet.Columns[6].ColumnWidth := 15;Sheet.Columns[7].ColumnWidth := 15;
  Sheet.Cells[firstRow-1,1] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2] := 'Sana';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,3] := 'Hujjat №';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,4] := 'Amal turi';Sheet.Range['D'+IntToStr(firstrow-2)+':D'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,5] := 'Amal nomi';Sheet.Range['E'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-2,6] := 'Naqd';Sheet.Range['F'+IntToStr(firstrow-2)+':G'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,6] := 'Kirim';Sheet.Cells[firstRow-1,7] := 'Chiqim';
  Sheet.Cells[firstRow-2,8] := 'Dollar';Sheet.Range['H'+IntToStr(firstrow-2)+':I'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,8] := 'Kirim';Sheet.Cells[firstRow-1,9] := 'Chiqim';
  gpl.first;
  for i:=0 to gpl.RecordCount-1 do begin
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);
    Sheet.Cells[firstrow+i,2]:=gpld_pl.AsString;
    Sheet.Cells[firstrow+i,3]:=gpln_pl.AsString;
    Sheet.Cells[firstrow+i,4]:=gpltur.AsString;
    case gplvid.AsInteger of
    2:  Sheet.Cells[firstrow+i,5]:=gplharajat.AsString;
    3,9:Sheet.Cells[firstrow+i,5]:=gpldiler.AsString;
    7,8:Sheet.Cells[firstrow+i,5]:=gplharidor.AsString;
    end;
    if gpls_plvid.AsInteger = 1 then
    begin
      Sheet.Cells[firstrow+i,6]:=gplsena_pl.AsString;Sheet.Cells[firstrow+i,6].NumberFormat := '0,00';
      Sheet.Cells[firstrow+i,8]:=gplsena_d.AsString;Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
    end
    else
    begin
      Sheet.Cells[firstrow+i,7]:=gplsena_pl.AsString;Sheet.Cells[firstrow+i,7].NumberFormat := '0,00';
      Sheet.Cells[firstrow+i,9]:=gplsena_d.AsString;Sheet.Cells[firstrow+i,9].NumberFormat := '0,00';
    end;
    gpl.Next;
  end;
  Sheet.Cells[firstrow+i,2] := 'Jami:';
  Sheet.Cells[firstrow+i,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,8].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow-4,2] := 'Dastlabki qoldiq:';Sheet.Cells[firstrow-4,4] := danq.Text;Sheet.Cells[firstrow-4,5] := danqd.Text;
  Sheet.Cells[firstrow+i+2,2] := 'Ohirgi qoldiq:';Sheet.Cells[firstrow+i+2,4] := gachaq.Text;Sheet.Cells[firstrow+i+2,5] := gachaqd.Text;
  ustun:='I';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+i)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+i) + ':'+ustun + IntToStr(FirstRow+i)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+i)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+i)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Kassa pul aylanmasi ';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;

end;

procedure Tclick_aylanma.FormActivate(Sender: TObject);
begin
  gacha.Date:=now();dan.Date:=now()-1;
  hisoblaClick(sender);
  DMS.s_pl.close;DMS.s_pl.SQL.Clear;
  DMS.s_pl.sql.add('SELECT * FROM s_pl where bank_id in (2)  and activ=1');
  DMS.s_pl.Open;
  dms.s_haridor.Close;dms.s_haridor.SQL.Clear;
  dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1 order by nom');
  dms.s_haridor.open;
  dms.s_diler.Close;dms.s_diler.SQL.Clear;
  dms.s_diler.SQL.Add('select * from s_diler WHERE del_flag=1 order by nom');
  dms.s_diler.open;
  //dan.Date:=StrToDate('01.01'+'.'+copy(gacha.Text,7,4));
end;

procedure Tclick_aylanma.hisoblaClick(Sender: TObject);
var b,e,bd,ed:Currency;
begin
  if dan.Date=0 then exit;
  if gacha.Date =0 then exit;
  //exit;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa,sum(sena_d) as summa_d from pl,s_pl where pl.bank_id=2 and pl.vid=s_pl.id and pl.del_flag=1 and s_pl.vid=1 ');
  dms.main_link.SQL.Add(' and d_pl < '+kasaya(dan.Date)+' order by pl.id');
  dms.main_link.open;
  b:=dms.main_link.fieldbyname('summa').AsFloat;
  bd:=dms.main_link.fieldbyname('summa_d').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa,sum(sena_d) as summa_d from pl,s_pl where pl.bank_id=2 and pl.vid=s_pl.id and  pl.del_flag=1 and s_pl.vid=2');
  dms.main_link.SQL.Add(' and d_pl < '+kasaya(dan.Date)+' order by pl.id');
  dms.main_link.open;
  e:=dms.main_link.fieldbyname('summa').AsFloat;ed:=dms.main_link.fieldbyname('summa_d').AsFloat;
  danq.Value:=b-e;danqd.Value:=bd-ed;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa,sum(sena_d) as summa_d from pl,s_pl where pl.bank_id=2 and pl.vid=s_pl.id and  pl.del_flag=1 and s_pl.vid=1');
  dms.main_link.SQL.Add(' and d_pl <= '+kasaya(gacha.Date)+' order by pl.id');
  dms.main_link.open;
  b:=dms.main_link.fieldbyname('summa').AsFloat;bd:=dms.main_link.fieldbyname('summa_d').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa,sum(sena_d) as summa_d from pl,s_pl where pl.bank_id=2 and pl.vid=s_pl.id and  pl.del_flag=1 and s_pl.vid=2');
  dms.main_link.SQL.Add(' and d_pl <= '+kasaya(gacha.Date)+' order by pl.id');
  dms.main_link.open;
  e:=dms.main_link.fieldbyname('summa').AsFloat;ed:=dms.main_link.fieldbyname('summa_d').AsFloat;
  gachaq.Value:=b-e;gachaqd.Value:=bd-ed;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa,sum(sena_d) as summa_d from pl,s_pl where pl.bank_id=2 and pl.vid=s_pl.id and pl.del_flag=1 and s_pl.vid=1');
  dms.main_link.SQL.Add(' and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by pl.id');
  dms.main_link.open;
  kirim.Value:=dms.main_link.fieldbyname('summa').AsFloat;
  kirimd.Value:=dms.main_link.fieldbyname('summa_d').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(sena_pl) as summa,sum(sena_d) as summa_d from pl,s_pl where pl.bank_id=2 and pl.vid=s_pl.id and  pl.del_flag=1 and s_pl.vid=2');
  dms.main_link.SQL.Add(' and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by pl.id');
  dms.main_link.open;
  chiqim.Value:=dms.main_link.fieldbyname('summa').AsFloat;
  chiqimd.Value:=dms.main_link.fieldbyname('summa_d').AsFloat;
  gpl.Close;gpl.SQL.Clear;

  gpl.SQL.Add('SELECT * FROM pl WHERE del_flag=1 and bank_id=2 and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by d_pl');
  gpl.open;
end;

end.







