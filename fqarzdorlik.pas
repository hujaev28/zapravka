unit fqarzdorlik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,db, GridsEh, Menus, SUIPopupMenu, DBGridEh, StdCtrls,
  Mask, RzEdit, ExtCtrls, RzPanel, RzPopups, RzLabel, DBCtrlsEh, DBLookupEh,
  RzButton, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  Tqarzdorlik = class(TForm)
    k_asos_holat: TsuiPopupMenu;
    MenuItem4: TMenuItem;
    Rahbartomonidantahrirlashuchunbekorqilindi1: TMenuItem;
    main: TZQuery;
    Dmain: TDataSource;
    sqltext: TEdit;
    Splitter1: TSplitter;
    GroupBox7: TGroupBox;
    GroupBox4: TGroupBox;
    Tovarlar: TDBGridEh;
    sm_out: TDBGridEh;
    GroupBox5: TGroupBox;
    gpl: TDBGridEh;
    g_asos: TDBGridEh;
    GroupBox1: TGroupBox;
    zapros: TRzEdit;
    Gesana: TGroupBox;
    gachac: TRzCalendar;
    gacha: TRzDateTimeEdit;
    Gbsana: TGroupBox;
    danc: TRzCalendar;
    dan: TRzDateTimeEdit;
    Panel1: TPanel;
    poisk_group: TGroupBox;
    lnom: TLabel;
    nom: TEdit;
    clientnom: TDBLookupComboboxEh;
    Grinv: TGroupBox;
    l_inv: TDBLookupComboboxEh;
    RzBitBtn1: TRzBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    danq: TRzNumericEdit;
    gachaq: TRzNumericEdit;
    chiqim: TRzNumericEdit;
    kirim: TRzNumericEdit;
    danqd: TRzNumericEdit;
    chiqimd: TRzNumericEdit;
    gachaqd: TRzNumericEdit;
    kirimd: TRzNumericEdit;
    Dalolatnoma: TRzBitBtn;
    akt: TRzBitBtn;
    jami: TRzBitBtn;
    qarzdorlik: TRzBitBtn;
    ppl: TsuiPopupMenu;
    Y1: TMenuItem;
    Memohq: TMemo;
    akt3: TRzBitBtn;
    Bonus: TRzBitBtn;
    g_asos1: TDBGridEh;
    pbonus: TsuiPopupMenu;
    Jadva1: TMenuItem;
    Hammagabonushisoblash1: TMenuItem;
    foizbonus: TLabel;
    Exelgachiqarish1: TMenuItem;
    Hammagabonusberish1: TMenuItem;
    Joriyharidorgabonushisoblash1: TMenuItem;
    Joriyharidorgabonusberish1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Qator1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dancChange(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure clientnomEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure gachacChange(Sender: TObject);
    procedure danChange(Sender: TObject);
    procedure gachaChange(Sender: TObject);
    procedure clientnomChange(Sender: TObject);
    procedure qarzdorlikClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Rahbartomonidantahrirlashuchunbekorqilindi1Click(
      Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure l_invEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure lnomClick(Sender: TObject);
    procedure GroupBox1DblClick(Sender: TObject);
    procedure aktClick(Sender: TObject);
    procedure gclientCellClick(Column: TColumnEh);
    procedure jamiClick(Sender: TObject);
    procedure DalolatnomaClick(Sender: TObject);
    procedure gplDblClick(Sender: TObject);
    procedure Y1Click(Sender: TObject);
    procedure gclientDblClick(Sender: TObject);
    procedure akt3Click(Sender: TObject);
    procedure Hammagabonushisoblash1Click(Sender: TObject);
    procedure Jadva1Click(Sender: TObject);
    procedure Exelgachiqarish1Click(Sender: TObject);
    procedure Hammagabonusberish1Click(Sender: TObject);
    procedure Joriyharidorgabonusberish1Click(Sender: TObject);
    procedure Joriyharidorgabonushisoblash1Click(Sender: TObject);
    procedure Qator1Click(Sender: TObject);
  private
     procedure interval(int1,int2:Variant;massiv:Integer;z,w,s:String);
  public
    { Public declarations }
  end;

var
  qarzdorlik: Tqarzdorlik;
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
  poisk: array [1..27] of String;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );


implementation

{$R *.dfm}
uses fdms, comobj,StrUtils, fulanish, fsetup, fpl, ClipBrd, fs_haridor;
function Round_zzz(Value:integer): integer;
var s:string;
begin
  s:=inttostr(value);
  s:=copy(s,1,length(s)-3)+'000';
  Result:=strtoint(s);
end;

function SumNumToFull(Number:real;s1,s2:string):string;
var PartNum, TruncNum, NumTMP, D: integer;NumStr : string;i, R : byte; Flag11 : boolean;
begin
  D:=1000000;R:=4;//выделяем рубли
  TruncNum:=Trunc(Number);
  if TruncNum<>0 then
    repeat
      PartNum:=TruncNum div D;Dec(R);D:=D div 1000;
    until PartNum<>0
  else R:=0;// перевод рублей
  for i:=R downto 1 do
  begin
    Flag11:=False;
    // выделение цифры сотен
    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'сто ';
      2: NumStr:=NumStr+'двести ';
      3: NumStr:=NumStr+'триста ';
      4: NumStr:=NumStr+'четыреста ';
      5: NumStr:=NumStr+'пятьсот ';
      6: NumStr:=NumStr+'шестьсот ';
      7: NumStr:=NumStr+'семьсот ';
      8: NumStr:=NumStr+'восемьсот ';
      9: NumStr:=NumStr+'девятьсот ';
    end;
    // выделение цифры десятков
    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'десять ';
          11: NumStr:=NumStr+'одиннадцать ';
          12: NumStr:=NumStr+'двенадцать ';
          13: NumStr:=NumStr+'тринадцать ';
          14: NumStr:=NumStr+'четырнадцать ';
          15: NumStr:=NumStr+'пятнадцать ';
          16: NumStr:=NumStr+'шестнадцать ';
          17: NumStr:=NumStr+'семнадцать ';
          18: NumStr:=NumStr+'восемнадцать ';
          19: NumStr:=NumStr+'девятнадцать ';
        end;
        case i of
          3: NumStr:=NumStr+'миллионов ';
          2: NumStr:=NumStr+'тысяч ';
          1: NumStr:=NumStr+' ';
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'двадцать ';
      3: NumStr:=NumStr+'тридцать ';
      4: NumStr:=NumStr+'сорок ';
      5: NumStr:=NumStr+'пятьдесят ';
      6: NumStr:=NumStr+'шестьдесят ';
      7: NumStr:=NumStr+'семьдесят ';
      8: NumStr:=NumStr+'восемьдесят ';
      9: NumStr:=NumStr+'девяносто ';
    end;
    // выделение цифры единиц
    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:if i=2 then NumStr:=NumStr+'одна ' else NumStr:=NumStr+'один ';
        2:if i=2 then NumStr:=NumStr+'две '  else NumStr:=NumStr+'два ';
        3: NumStr:=NumStr+'три ';
        4: NumStr:=NumStr+'четыре ';
        5: NumStr:=NumStr+'пять ';
        6: NumStr:=NumStr+'шесть ';
        7: NumStr:=NumStr+'семь ';
        8: NumStr:=NumStr+'восемь ';
        9: NumStr:=NumStr+'девять ';
      end;
      case i of
        3:case NumTMP of
            1: NumStr:=NumStr+'миллион ';
            2,3,4: NumStr:=NumStr+'миллиона ';
            else NumStr:=NumStr+'миллионов ';
          end;
        2:case NumTMP of
            1 : NumStr:=NumStr+'тысяча ';
            2,3,4: NumStr:=NumStr+'тысячи ';
            else
              if PartNum<>0 then NumStr:=NumStr+'тысяч ';
          end;
        1:case NumTMP of
            1 : NumStr:=NumStr;// +s1+' '
            2,3,4: NumStr:=NumStr;// +s1+' '
            else NumStr:=NumStr;// +s1+' '
          end;
      end;
    end;
    if i>1 then begin
      PartNum:=(TruncNum mod (D*1000)) div D;D:=D div 1000;
    end;
  end;
  NumStr:=TrimRight(NumStr)+' '+s1+' ';
  //перевод копеек
  PartNum:=Round(Frac(Number)*100);
  if PartNum=0 then
  begin
    SumNumToFull:=NumStr+'00 '+s2;Exit;
  end;// выделение цифры десятков
  NumTMP:=PartNum div 10;
  if NumTMP=0 then NumStr:=NumStr+'0'+IntToStr(PartNum)+' '
  else NumStr:=NumStr+IntToStr(PartNum)+' ';
  // выделение цифры единиц
  NumTMP:=PartNum mod 10;
  case NumTMP of
    1:if PartNum<>11 then  NumStr:=NumStr+s2
      else NumStr:=NumStr+s2;
    2,3,4:
      if (PartNum<5) or (PartNum>14) then NumStr:=NumStr+s2
      else NumStr:=NumStr+s2;
    else NumStr:=NumStr+s2;
  end;
  NumStr:=AnsiUpperCase(copy(NumStr,1,1))+copy(NumStr,2,length(NumStr)-1);
  SumNumToFull:=NumStr;
end;

function _IntToStr(i, Wide: Cardinal): string;
var
  i1: Cardinal;
begin
  Result := '';
  repeat
    i1 := i mod 10;
    i := i div 10;
    Result := char(i1 + ord('0')) + Result;
    dec(Wide);
  until (Wide < 1) and (i < 1)
end;
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;

procedure hisob();
var b,e,bd,ed:Currency;
begin
  if dms.s_haridor.Active=false then exit;
  if qarzdorlik.dan.Date=null then exit;
  if qarzdorlik.clientnom.value=null then exit;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(qarz_summa) as summa,sum(qarz_dollar) as dollar from asos where del_flag=1 and tur_oper=2 and h_id='+inttostr(qarzdorlik.clientnom.value)+'');
  dms.main_link.SQL.Add(' and sana < '+kasaya(qarzdorlik.dan.Date)+' order by id');
  dms.main_link.open;b:=dms.main_link.fieldbyname('summa').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sena_pl,sena_d,vid  from pl WHERE del_flag=1 and h_id='+inttostr(qarzdorlik.clientnom.value)+'  ');
  dms.main_link.SQL.Add(' and d_pl < '+kasaya(qarzdorlik.dan.Date)+' order by id');
  dms.main_link.open;e:=0;
  while not dms.main_link.eof do begin
    if dms.main_link.fieldbyname('vid').AsInteger=7 then
    begin
      e:=e+dms.main_link.fieldbyname('sena_pl').AsFloat;
      ed:=ed+dms.main_link.fieldbyname('sena_d').AsFloat;
    end;
    if dms.main_link.fieldbyname('vid').AsInteger=8 then
    begin
      b:=b+dms.main_link.fieldbyname('sena_pl').AsFloat;
      bd:=bd+dms.main_link.fieldbyname('sena_d').AsFloat;
    end;
    dms.main_link.Next;
  end;
  qarzdorlik.danq.Value:=b-e;qarzdorlik.danqd.Value:=bd-ed;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(qarz_summa) as summa,sum(qarz_dollar) as dollar from asos where del_flag=1 and tur_oper=2 and h_id='+inttostr(qarzdorlik.clientnom.value)+'');
  dms.main_link.SQL.Add(' and sana between '+kasaya(qarzdorlik.dan.Date)+' and '+kasaya(qarzdorlik.gacha.Date)+' order by id');
  dms.main_link.open;b:=dms.main_link.fieldbyname('summa').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sena_pl,sena_d,vid from pl WHERE del_flag=1 and h_id='+inttostr(qarzdorlik.clientnom.value)+'  ');
  dms.main_link.SQL.Add(' and d_pl between '+kasaya(qarzdorlik.dan.Date)+' and '+kasaya(qarzdorlik.gacha.Date)+' order by id');
  dms.main_link.open;e:=0;
  while not dms.main_link.eof do begin
    if dms.main_link.fieldbyname('vid').AsInteger=7 then
      begin
        e:=e+dms.main_link.fieldbyname('sena_pl').AsFloat;
        ed:=ed+dms.main_link.fieldbyname('sena_d').AsFloat;
      end;
    if dms.main_link.fieldbyname('vid').AsInteger=8 then
      begin
        b:=b+dms.main_link.fieldbyname('sena_pl').AsFloat;
        bd:=b+dms.main_link.fieldbyname('sena_d').AsFloat;
      end;
    dms.main_link.Next;
  end;
  qarzdorlik.gachaq.Value:=qarzdorlik.danq.Value+(b-e);
  qarzdorlik.gachaqd.Value:=qarzdorlik.danqd.Value+(bd-ed);

  dms.k_asos.Close;dms.k_asos.SQL.Clear;
  dms.k_asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and h_id='+inttostr(qarzdorlik.clientnom.value)+'');
  dms.k_asos.SQL.Add(' and sana between '+kasaya(qarzdorlik.dan.Date)+' and '+kasaya(qarzdorlik.gacha.Date)+' order by id');
  dms.k_asos.open;

  DMS.k_slave.open;
  dms.tpl.Close;dms.tpl.SQL.Clear;
  dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and h_id='+inttostr(qarzdorlik.clientnom.value)+'  ');
  dms.tpl.SQL.Add(' and d_pl between '+kasaya(qarzdorlik.dan.Date)+' and '+kasaya(qarzdorlik.gacha.Date)+' order by id');
  dms.tpl.open;
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
    Excel.Application.EnableEvents := False;
    Excel.SheetsInNewWorkbook := SheetCount;
    Excel.Visible := ExcelVisible;
    Excel.WorkBooks.Add;Sheet := Excel.WorkBooks[1].Sheets[1];Sheet.Name := FirstSheetName;
    Excel.Application.ErrorCheckingOptions.EvaluateToError := False;Excel.Application.ErrorCheckingOptions.EvaluateToError := False;
    Excel.Application.ErrorCheckingOptions.TextDate := False;Excel.Application.ErrorCheckingOptions.NumberAsText := False;
    sheet.pagesetup.orientation:=orient;sheet.pagesetup.leftmargin:=30;sheet.pagesetup.rightmargin:=0;sheet.pagesetup.topmargin:=20;sheet.pagesetup.bottommargin:=20;
    sheet.pagesetup.headermargin:=2;sheet.pagesetup.footermargin:=2;  excel.Application.StandardFontSize := 11;
  except Exception.Create('Ошибка.  Excel не установлено !!! ');Excel := UnAssigned;
  end;
end;

procedure Tqarzdorlik.interval(int1,int2:Variant;massiv:Integer;z,w,s:String);
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
procedure Tqarzdorlik.Hammagabonusberish1Click(Sender: TObject);
var b:Currency;chiq:integer;
begin
  if Gbsana.Visible=false then begin
    ShowMessage('"Ko`rsatgichlar" yozuvini ikki marta bosing');exit;
  end;
  if MessageDlg('Hammaga bonus berasizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  DMS.s_haridor.First; foizbonus.Visible:=True;foizbonus.Caption:='Boshlandi';chiq:=0;
  while not DMS.s_haridor.Eof do begin
    DMS.k_asos.First;b:=0;
    while not DMS.k_asos.Eof do begin
      b := b + DMS.k_asosbonus.AsFloat;
      DMS.k_asos.Next;
    end;
    if b>0 then begin
      DMS.tpl.Append;DMS.tplh_id.AsInteger:=dms.s_haridorid.AsInteger;DMS.tplkonv.AsInteger:=0;
      DMS.tplvid.AsInteger:=25;DMS.tpld_pl.AsDateTime:=date();DMS.tpln_pl.AsString:='-1';
      DMS.s_client.Refresh;
      if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
        DMS.tpln_pl.AsInteger:=1
      else
        DMS.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
      DMS.tplsena_pl.AsFloat:=b;
      DMS.tpluser_id.AsInteger:=strtoint(admin_id);DMS.tplclient_id.AsInteger:=strtoint(admin_clid);
      DMS.tpl.Post;
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then begin
        dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
    end; // b>0
    if chiq=1 then exit;
    DMS.s_haridor.Next;
    if DMS.s_haridor.RecordCount=DMS.s_haridor.RecNo then
    begin
      //ShowMessage('Tamom');
      chiq:=1;
    end;
    clientnom.Value:=DMS.s_haridorid.Value;
    clientnomChange(Sender);
    foizbonus.Caption:=inttostr(DMS.s_haridor.RecNo)+' / '+inttostr(DMS.s_haridor.RecordCount);

    Application.ProcessMessages;
  end;
end;

procedure Tqarzdorlik.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tqarzdorlik.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tqarzdorlik.FormCreate(Sender: TObject);
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
procedure Tqarzdorlik.dancChange(Sender: TObject);
begin
  dan.Date:=danc.Date;
  clientnomChange(Sender);
end;

procedure Tqarzdorlik.nomKeyPress(Sender: TObject; var Key: Char);
var s,ss:String;
begin
  if Key<>#13 then exit;
  if nom.Text='' then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);exit;end;
  dms.s_haridor.Close;dms.s_haridor.SQL.Clear;S:=nom.Text;
  if (Length(nom.Text)=9) and ((S[9] in ['0'..'9']) or (S[1] in ['0'..'9'])) then
    dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1 and '+ss+'(inn = "'+nom.Text+'")')
  else
    dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1 and ((nom like "%'+lat_kril(nom.Text)+'%") or (nom like "%'+nom.Text+'%")) order by nom');
  dms.s_haridor.open;dms.s_haridor.First;
  if dms.s_haridor.RecordCount=0 then exit;
  clientnom.Value:=dms.s_haridor.fieldbyname('id').Value;

end;

procedure Tqarzdorlik.clientnomEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dms.s_haridor.Close;dms.s_haridor.SQL.Clear;
  dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1 order by nom');
  dms.s_haridor.open;dms.s_haridor.First;
end;

procedure Tqarzdorlik.gachacChange(Sender: TObject);
begin
  gacha.Date:=gachac.Date;clientnomChange(Sender);
end;

procedure Tqarzdorlik.danChange(Sender: TObject);
begin
  {try
    StrToDate(dan.Text);
  except

    ShowMessage('Sana hato');
    exit;
  end;
  ShowMessage(dan.Text);}
  danc.Date:=dan.Date;
  clientnomChange(Sender);
end;

procedure Tqarzdorlik.gachaChange(Sender: TObject);
begin
  gachac.Date:=gacha.Date;clientnomChange(Sender);
end;

procedure Tqarzdorlik.clientnomChange(Sender: TObject);
var b,e,bd,ed:Currency;
begin
  if dms.s_haridor.Active=false then exit;
  if dan.Date=null then exit;
  if (clientnom.value=null) or (clientnom.value=0) then exit;
  // Дастлабки санадан кичик булган харидорнинг карзи,  (tur_oper=2 - сотиш) ("summa" - накд карзи, "epos" - перечисление)
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(dan.Date)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(dan.Date)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(dan.Date)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sum_epos_ch,0)) as o_epos');
  dms.main_link.SQL.Add(' from asos where del_flag=1 and tur_oper=2 and h_id='+inttostr(clientnom.value));

  if l_inv.Value>0 then
  dms.main_link.SQL.Add(' and inv_id='+inttostr(l_inv.value));
  dms.main_link.SQL.Add(' order by id');
  Memohq.Lines.Clear;
  Memohq.Lines.Add(dms.main_link.SQL.Text);

  dms.main_link.open;
  danq.Value:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  danqd.Value:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim.Value:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
  chiqimd.Value:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT');
  dms.main_link.SQL.Add(' sum(if((konv=1 or vid in (7,17,25,20)) and d_pl < '+kasaya(dan.Date)+'                                 ,sena_pl,0)) as b_kirim,sum(if((konv=2 or vid in (7,17,25,20)) and d_pl < '+kasaya(dan.Date)                                 +',sena_d,0)) as b_kirimd,sum(if((konv=1 or vid in (8,18)) and d_pl < '+kasaya(dan.Date)                                 +',sena_pl,0)) as b_chiqim,sum(if((konv=2 or vid in (8,18)) and d_pl < '+kasaya(dan.Date)                                 +',sena_d,0)) as b_chiqimd ');
  dms.main_link.SQL.Add(',sum(if((konv=1 or vid in (7,17,25,20)) and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sena_pl,0)) as o_kirim,sum(if((konv=2 or vid in (7,17,25,20)) and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sena_d,0)) as o_kirimd,sum(if((konv=1 or vid in (8,18)) and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sena_pl,0)) as o_chiqim,sum(if((konv=2 or vid in (8,18)) and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sena_d,0)) as o_chiqimd ');
  //dms.main_link.SQL.Add(',sum(if((konv=1 or vid in (7,17,25,20)) and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sena_pl,0)) as o_kirim,sum(if((konv=2 or vid in (7,17,25,20)) and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sena_d,0)) as o_kirimd,sum(if((konv=1 or vid in (8,18)) and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sena_pl,0)) as o_chiqim,sum(if((konv=2 or vid in (8,18)) and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+inttostr(clientnom.value));
  if l_inv.Value>0 then
  dms.main_link.SQL.Add(' and inv_id='+inttostr(l_inv.value));
  dms.main_link.SQL.Add(' order by id');
  dms.main_link.open;
  danq.Value:=danq.Value+dms.main_link.fieldbyname('b_chiqim').AsFloat-dms.main_link.fieldbyname('b_kirim').AsFloat;
  danqd.Value:=danqd.Value+dms.main_link.fieldbyname('b_chiqimd').AsFloat-dms.main_link.fieldbyname('b_kirimd').AsFloat;
  kirim.Value:=dms.main_link.fieldbyname('o_kirim').AsFloat;
  kirimd.Value:=dms.main_link.fieldbyname('o_kirimd').AsFloat;
  chiqim.Value:=chiqim.Value+dms.main_link.fieldbyname('o_chiqim').AsFloat;
  chiqimd.Value:=chiqimd.Value+dms.main_link.fieldbyname('o_chiqimd').AsFloat;

  gachaq.Value:=danq.Value+(chiqim.Value-kirim.Value);
  gachaqd.Value:=danqd.Value+(chiqimd.Value-kirimd.Value); // охирги сана колдик, яъни. харидорнинг товар олган карзидан тулаган ёки олган пулларининг айирмаси

  // оралик санадаги харидорнинг савдо операциялари
  dms.k_asos.Close;dms.k_asos.SQL.Clear;
  dms.k_asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and h_id='+inttostr(clientnom.value)+' and changedate is not null');
  if l_inv.Value>0 then
  dms.k_asos.SQL.Add(' and inv_id='+inttostr(l_inv.value));

  dms.k_asos.SQL.Add(' and sana between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by id');
  dms.k_asos.open;
  // оралик санадаги харидорнинг  пул туловлари
  DMS.k_slave.open;
  dms.tpl.Close;dms.tpl.SQL.Clear;
  dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and h_id='+inttostr(clientnom.value)+'  ');
  if l_inv.Value>0 then
  dms.tpl.SQL.Add(' and inv_id='+inttostr(l_inv.value));
  dms.tpl.SQL.Add(' and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by id');
  dms.tpl.open;
end;



procedure Tqarzdorlik.qarzdorlikClick(Sender: TObject);
var firstRow,i,qator,ustun:integer;ustuns:string;
begin
  if dms.s_haridor.Active=false then exit;
  if dan.Date=null then exit;
  if (clientnom.value=null) or (clientnom.value=0) then exit;
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=dan;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  interval(dan.Date, gacha.Date, 1,'sana' ,'sana' ,' Sana ');
  if (poisk[1]>'') then
  sqltext.Text:=poisk[1];
  for i := 2 to 7 do begin
    if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i];
    sqltext.Text:=sqltext.Text+poisk[i];
  end;
  ExcelCreateApplication('Haridorlar qarzdorligi', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;firstRow:=10;
  ustun:=1;
  Sheet.Columns[ustun].ColumnWidth :=5;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth :=25;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth :=15;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth := 18;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth :=12;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth := 12;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth := 10;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth :=10;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth := 8;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth := 18;
  inc(ustun);Sheet.Columns[ustun].ColumnWidth := 12;
  ustun:=0;
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Haridor nomi';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Telefon';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Dastlabki qoldiq';Sheet.Range['D'+IntToStr(firstrow-2)+':D'+IntToStr(firstrow-1)].merge;
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Dollar';Sheet.Range['E'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-1)].merge;
  inc(ustun);Sheet.Cells[firstRow-2,ustun] := 'Oraliq';Sheet.Range['F'+IntToStr(firstrow-2)+':I'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,ustun] := 'Chiqim';inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Dollar';
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Kirim';inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Dollar';
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Oxirgi qoldiq';Sheet.Range['J'+IntToStr(firstrow-2)+':J'+IntToStr(firstrow-1)].merge;
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Oxirgi qoldiq';Sheet.Range['K'+IntToStr(firstrow-2)+':K'+IntToStr(firstrow-1)].merge;
  dms.s_haridor.first;qator:=0;
  for i:=0 to dms.s_haridor.RecordCount-1 do begin
    clientnom.Value:=dms.s_haridorid.Value;
    clientnomChange(Sender);

    if gachaq.Value+gachaqd.Value<>0 then begin
    ustun:=1;Sheet.Cells[firstrow+qator,ustun]:=inttostr(qator+1);
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=dms.s_haridornom.AsString;
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=dms.s_haridortelsms1.AsString;
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=danq.Value;Sheet.Cells[firstrow+qator,ustun].NumberFormat := '0,00';
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=danqd.Value;Sheet.Cells[firstrow+qator,ustun].NumberFormat := '0,00';
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=chiqim.Value;Sheet.Cells[firstrow+qator,ustun].NumberFormat := '0,00';
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=chiqimd.Value;Sheet.Cells[firstrow+qator,ustun].NumberFormat := '0,00';
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=kirim.Value;Sheet.Cells[firstrow+qator,ustun].NumberFormat := '0,00';
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=kirimd.Value;Sheet.Cells[firstrow+qator,ustun].NumberFormat := '0,00';
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=gachaq.Value;Sheet.Cells[firstrow+qator,ustun].NumberFormat := '0,00';
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=gachaqd.Value;Sheet.Cells[firstrow+qator,ustun].NumberFormat := '0,00';
    inc(qator);
    end;
    dms.s_haridor.Next;
  end;
  //inc(col);
  i:=qator;ustun:=1;
  inc(ustun);Sheet.Cells[firstrow+i,ustun] := 'Jami:';inc(ustun);
  inc(ustun);Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  inc(ustun);Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  //Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  inc(ustun);Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  inc(ustun);Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  //Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  inc(ustun);Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  inc(ustun);Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  //Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  inc(ustun);Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  inc(ustun);Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  //Sheet.Cells[firstrow+i,ustun].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  ustuns:='K';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustuns + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustuns + IntToStr(firstRow+i)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+i) + ':'+ustuns + IntToStr(FirstRow+i)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustuns + IntToStr(FirstRow+i)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustuns + IntToStr(FirstRow+i)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Haridorlar bilan hisob-kitob ';Sheet.Range['A2:'+ustuns+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustuns+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;

end;

procedure Tqarzdorlik.MenuItem4Click(Sender: TObject);
var danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;
begin
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;dms.asos_slave.open;dms.s_tovar.open;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
  dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString+' order by id');
  dms.main_link.open;
  danq:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
  chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_kirim,sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_d,0)) as b_kirimd,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_chiqim,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_d,0)) as b_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+dms.s_haridorid.AsString);
  dms.main_link.SQL.Add(' order by id');
  dms.main_link.open;
  danq:=danq+dms.main_link.fieldbyname('b_chiqim').AsFloat-dms.main_link.fieldbyname('b_kirim').AsFloat;
  danqd:=danqd+dms.main_link.fieldbyname('b_chiqimd').AsFloat-dms.main_link.fieldbyname('b_kirimd').AsFloat;

  kirim:=dms.main_link.fieldbyname('o_kirim').AsFloat;
  kirimd:=dms.main_link.fieldbyname('o_kirimd').AsFloat;
  chiqim:=chiqim+dms.main_link.fieldbyname('o_chiqim').AsFloat;
  chiqimd:=chiqimd+dms.main_link.fieldbyname('o_chiqimd').AsFloat;

  ulanish.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+setup.chekshablon.Text);
  ulanish.frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  ulanish.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'сум','тийин')+'''';
  ulanish.frxsf.Variables['summa_all']:=''''+dms.asossumma_ch.AsString+'''';
  ulanish.frxsf.Variables['dollar']:=''''+SumNumToFull(dms.asossum_d_ch.AsFloat,'$','sent')+'''';
  ulanish.frxsf.Variables['qarz']:=''''+FloatToStr(danq+(chiqim-kirim))+'''';
  ulanish.frxsf.Variables['qarzd']:=''''+FloatToStr(danqd+(chiqimd-kirimd))+'''';

  ulanish.frxsf.PrintOptions.Printer := setup.chekPrinters.Text;
  ulanish.frxsf.SelectPrinter;ulanish.frxsf.PrepareReport;
  ulanish.frxsf.PrintOptions.ShowDialog := false;
  ulanish.frxsf.ShowReport;
end;

procedure Tqarzdorlik.Rahbartomonidantahrirlashuchunbekorqilindi1Click(
  Sender: TObject);
var danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;
begin
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;dms.asos_slave.open;dms.s_tovar.open;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
  dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString+' order by id');
  dms.main_link.open;
  danq:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
  chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_kirim,sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_d,0)) as b_kirimd,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_chiqim,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_d,0)) as b_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+dms.s_haridorid.AsString);
  dms.main_link.SQL.Add(' order by id');
  dms.main_link.open;
  danq:=danq+dms.main_link.fieldbyname('b_chiqim').AsFloat-dms.main_link.fieldbyname('b_kirim').AsFloat;
  danqd:=danqd+dms.main_link.fieldbyname('b_chiqimd').AsFloat-dms.main_link.fieldbyname('b_kirimd').AsFloat;

  kirim:=dms.main_link.fieldbyname('o_kirim').AsFloat;
  kirimd:=dms.main_link.fieldbyname('o_kirimd').AsFloat;
  chiqim:=chiqim+dms.main_link.fieldbyname('o_chiqim').AsFloat;
  chiqimd:=chiqimd+dms.main_link.fieldbyname('o_chiqimd').AsFloat;
  ulanish.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+setup.chekshablon.Text);
  ulanish.frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  ulanish.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'сум','тийин')+'''';
  ulanish.frxsf.Variables['summa_all']:=''''+dms.asossumma_ch.AsString+'''';
  ulanish.frxsf.Variables['dollar']:=''''+SumNumToFull(dms.asossum_d_ch.AsFloat,'$','sent')+'''';
  ulanish.frxsf.Variables['qarz']:=''''+FloatToStr(danq+(chiqim-kirim))+'''';
  ulanish.frxsf.Variables['qarzd']:=''''+FloatToStr(danqd+(chiqimd-kirimd))+'''';

  ulanish.frxsf.PrintOptions.Printer := setup.chekPrinters.Text;
  ulanish.frxsf.SelectPrinter;ulanish.frxsf.PrepareReport;
  ulanish.frxsf.PrintOptions.ShowDialog := false;
  ulanish.frxsf.Print;
end;

procedure Tqarzdorlik.FormActivate(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1');
  dms.s_tovar.open;
  DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
  DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
  DMS.s_t_all.Open;
  main.Open;
  //dan.Date:=StrToDate('01'+copy(datetostr(Date()),3,9));
  dan.Date:=StrToDate('01.01.2010');
  //danc.Date:=StrToDate('01'+copy(datetostr(Date()),3,9));
  danc.Date:=StrToDate('01.01.2010');
  gacha.Date:=date();gachac.Date:=date();
  if dms.s_clientsert.AsInteger=0 then
  begin
   Tovarlar.Columns.Items[2].Visible:=false;
   Tovarlar.Columns.Items[3].Visible:=false;
  end;
  if dms.s_clientichkitovar.AsInteger=0 then
  begin
   Tovarlar.Columns.Items[9].Visible:=false;
   Tovarlar.Columns.Items[10].Visible:=false;
   Tovarlar.Columns.Items[11].Visible:=false;
   Tovarlar.Columns.Items[12].Visible:=false;
   Tovarlar.Columns.Items[13].Visible:=false;
   Tovarlar.Columns.Items[14].Visible:=false;
   Tovarlar.Columns.Items[15].Visible:=false;
   Tovarlar.Columns.Items[16].Visible:=false;
  end;
  if dms.s_clientseriya.AsInteger=0 then
  begin
   sm_out.Visible:=false;
  end;
  if dms.s_clientkridit.AsInteger=0 then
  begin
   Grinv.Visible:=false;
   clientnom.Width:=500;poisk_group.Width:=700;
   g_asos.Columns.Items[9].Visible:=false;
   gpl.Columns.Items[7].Visible:=false;
  end;
  if (haridor_id<>'') then begin
    clientnom.Value:=StrToInt(haridor_id);
    clientnomChange(Sender);
  end;
end;

procedure Tqarzdorlik.l_invEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  l_inv.Value:=NULL;
end;

procedure Tqarzdorlik.lnomClick(Sender: TObject);
begin
  dms.s_haridor.Close;dms.s_haridor.SQL.Clear;
  dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1');
  dms.s_haridor.open;dms.s_haridor.First;
end;

procedure Tqarzdorlik.GroupBox1DblClick(Sender: TObject);
begin
  Gbsana.Visible:=true;
  dan.Date:=date();

end;

procedure Tqarzdorlik.aktClick(Sender: TObject);
var chs,chd,qs,qd:Currency;firstRow,y,i,l,r,col,sl,qator:integer;hnom,ustun:string;bsana:TDate;IniFile:TIniFile;
begin
  if dms.s_haridor.Active=false then exit;
  if dan.Date=null then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select changedate from asos WHERE del_flag=1 and h_id='+DMS.s_haridorid.AsString+' and changedate is not null order by changedate limit 1');
  dms.link.open;
  if dms.link.RecordCount>0 then
  begin
    bsana:=dms.link.fieldbyname('changedate').AsDateTime;
  end;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select d_pl from pl WHERE del_flag=1 and h_id='+DMS.s_haridorid.AsString+' order by d_pl limit 1');
  dms.main_link.open;

  if dms.main_link.RecordCount>0 then
    if dms.link.RecordCount>0 then begin
      if bsana>dms.main_link.fieldbyname('d_pl').AsDateTime then begin
        bsana:=dms.main_link.fieldbyname('d_pl').AsDateTime;
      end;
    end
    else
       bsana:=dms.main_link.fieldbyname('d_pl').AsDateTime;
  if (bsana = null) or (bsana = 0) then exit;
  dan.Date:=bsana;gacha.Date:=bsana;
  //exit;
  //dms.k_asos.DisableControls;dms.k_slave.DisableControls;

  if (clientnom.value=null) or (clientnom.value=0) then exit;
  ExcelCreateApplication('Dalolatnoma', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;
  y:=1;  Sheet.Columns[y].ColumnWidth :=5;
  inc(y);Sheet.Columns[y].ColumnWidth :=40;
  inc(y);Sheet.Columns[y].ColumnWidth := 6;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth := 15;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  firstRow:=5;
  while bsana<date()+1 do begin
  dan.Date:=bsana;gacha.Date:=bsana;
  clientnomChange(dms.s_haridor);
  if (DMS.k_asos.RecordCount+DMS.tpl.RecordCount)>0 then begin
  chs:=0;chd:=0;qs:=0;qd:=0;y:=1;
  if dms.k_asossana.AsString<>'' then
    Sheet.Cells[firstRow-2,5] := dms.k_asossana.AsString
  else
    Sheet.Cells[firstRow-2,5] := dms.tpld_pl.AsString;

  Sheet.Cells[firstRow-1,y] := '№';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Tovar nomi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'soni';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Narhi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Tovar qarz';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Naqd summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Izoh';
  dms.k_asos.First;col:=0;l:=0;r:=0;y:=1;qator:=0;
  for i:=0 to dms.k_asos.RecordCount-1 do begin
    chs:=chs+dms.k_asossumma_ch.AsFloat;chd:=chd+dms.k_asossum_d_ch.AsFloat;
    qs:=qs+dms.k_asosqarz_summa.AsFloat+dms.k_asossum_epos_ch.AsFloat;
    qd:=qd+dms.k_asosqarz_dollar.AsFloat;
    dms.k_slave.First;
    for sl:=0 to dms.k_slave.RecordCount-1 do begin
      main.First;
      while not main.eof do begin
        Sheet.Columns[main.RecNo+10].ColumnWidth :=15;
        Sheet.Cells[firstrow+qator,main.RecNo+10].NumberFormat := '@';
        Sheet.Cells[firstrow+qator,main.RecNo+10]:=main.FieldByName('serial').AsString;
        main.Next;
      end;
      Sheet.Cells[firstrow+qator,1]:=qator+1;
      Sheet.Cells[firstrow+qator,2]:=dms.k_slavetovar_nom.AsString;
      Sheet.Cells[firstrow+qator,3]:=dms.k_slavekol.AsFloat;
      if (dms.k_asosdollar.AsInteger=2) or (dms.k_asosdollar.AsInteger=1) then begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ##0,00';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slavesotish_d.AsFloat;
      end
      else
      begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ###0';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slavesotish.AsFloat;
      end;
      Sheet.Cells[firstrow+qator,5].formula := '=RC[-2]*RC[-1]';
      if (dms.k_asosdollar.AsInteger=2) or (dms.k_asosdollar.AsInteger=1) then begin
        Sheet.Cells[firstrow+qator,5].NumberFormat := '### ### ##0,00';
      end
      else
      begin
        Sheet.Cells[firstrow+qator,5]:=dms.k_slavekol.AsFloat*dms.k_slavesotish.AsFloat;
      end;
      inc(col);inc(qator);
      dms.k_slave.Next;
    end;
    dms.k_asos.Next;

  end;y:=0;
  dms.tpl.First;l:=col;r:=0;y:=0;
  if ((chs-qs)+(chd-qd))>0 then begin
    if (chs>0) then
    Sheet.Cells[firstrow+r,8]:=chs-qs
    else
    Sheet.Cells[firstrow+r,8]:=chs;
    Sheet.Cells[firstrow+r,8].NumberFormat := '### ### ###0';
    if (chd>0) then
      Sheet.Cells[firstrow+r,9]:=chd-qd
    else
      Sheet.Cells[firstrow+r,9]:=chd;
    Sheet.Cells[firstrow+r,9].NumberFormat := '### ### ##0,00';
    Sheet.Cells[firstrow+r,10] := 'Savdo '+dms.asosqarz_izoh.AsString;
    inc(r);
  end;
  for i:=0 to dms.tpl.RecordCount-1 do begin
    if (dms.tplvid.Value=8) OR (dms.tplvid.Value=18) then
    begin
      y:=7;Sheet.Cells[firstrow+l,y]:=inttostr(l);
      case dms.tplkonv.AsInteger of
      1:begin
          inc(y);inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_d.AsFloat;
          Sheet.Cells[firstrow+r,y].Font.Bold := true;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        end;
      2:begin
          inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].Font.Bold := true;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
        end;
      else
        begin
          inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
          inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_d.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        end;
      end;
      inc(y);Sheet.Cells[firstrow+r,y]:='Chiqim '+dms.tplprim.AsString;
      inc(r);
    end
    else
    begin
      y:=7;
      case dms.tplkonv.AsInteger of
      1:begin
        inc(y);inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        Sheet.Cells[firstrow+r,y].Font.Bold := true;
        end;
      2:begin
        inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
        Sheet.Cells[firstrow+r,y].Font.Bold := true;
        end;
      else
        begin
          inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
          inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        end;
      end;
      inc(y);Sheet.Cells[firstrow+r,y]:='Kirim '+dms.tplprim.AsString;
      inc(r);

    end;
    if l>r then col:=l else col:=r;
    dms.tpl.Next;
  end;
  Sheet.Cells[firstrow-2,6] := 'Dastlabki qarz:';
  Sheet.Cells[firstrow-2,8].NumberFormat := '### ### ###0';
  Sheet.Cells[firstrow-2,8] := danq.Text;
  Sheet.Cells[firstrow,6].NumberFormat := '### ### ###0';
  Sheet.Cells[firstrow,6] := qs;
  Sheet.Cells[firstrow,7].NumberFormat := '### ### ##0,00';
  Sheet.Cells[firstrow,7] := qd;
  Sheet.Cells[firstrow-2,8].Interior.Color:= clYellow;
  Sheet.Cells[firstrow-2,9].NumberFormat := '### ### ##0,00';
  Sheet.Cells[firstrow-2,9] := danqd.Text;
  Sheet.Cells[firstrow-2,9].Interior.Color:= clYellow;
  Sheet.Cells[firstrow+col+1,6] := 'Oxirgi qarz:';
  Sheet.Cells[firstrow+col+1,8] := gachaq.Text;
  Sheet.Cells[firstrow+col+1,8].Interior.Color:= clYellow;
  Sheet.Cells[firstrow+col+1,8].NumberFormat := '### ### ###0';
  Sheet.Cells[firstrow+col+1,9].NumberFormat := '### ### ##0,00';
  Sheet.Cells[firstrow+col+1,9].Interior.Color:= clYellow;
  Sheet.Cells[firstrow+col+1,9] := gachaqd.Text;
  Sheet.Cells[firstrow+col,2] := 'Jami:';
  Sheet.Cells[firstrow+col,3].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,5].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,8].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  ustun:='J';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExceltFormatRange(Range_telo, 'Times New Roman', 11, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  firstrow:=firstrow+col+5;
   end; // >0
  bsana:=bsana+1;
  end; // bsana
  dan.Date:=StrToDate('01.01.2010');danc.Date:=StrToDate('01.01.2010');
  Sheet.Cells[1,1]:='Haridor: '+clientnom.Text;Sheet.Range['A1:'+ustun+'1'].merge;Sheet.Cells[1,1].HorizontalAlignment := 3;
  //Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;

  Excel.ActiveWindow.DisplayGridLines:=False;
  //if fileExists(()+'c:\Форма.xls') then DeleteFile('c:\Форма.xls');
  //ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  hnom:=StrReplace(DMS.s_haridornom.AsString,'(','_');
  hnom:=StrReplace(hnom,')','_');
  Excel.ActiveWorkbook.SaveAs(IniFile.ReadString('BAZA','haridor','d:\arxiv')+'\'+hnom+'.xlsx');
  IniFile.Free;
  Excel.visible:=true;
  Application.Restore;
    dms.k_asos.EnableControls;
  dms.k_slave.EnableControls;

  //Excel := UnAssigned;

end;

procedure Tqarzdorlik.gclientCellClick(Column: TColumnEh);
begin
  clientnom.Value:=DMS.s_haridorid.AsInteger;
  clientnomChange(DMS.s_haridor);
end;

procedure Tqarzdorlik.jamiClick(Sender: TObject);
var chs,chd,qs,qd:Currency;firstRow,y,i,l,r,col,sl,qator:integer;hnom,ustun:string;bsana:TDate;colh:integer;
begin
  if dms.s_haridor.Active=false then exit;
  if dan.Date=null then exit;


  dms.s_haridor.First;  colh:=1;
  //ExcelCreateApplication('Haridorlar qarzdorligi 2', dms.s_haridor.RecordCount,2, false);
  ExcelCreateApplication('Haridorlar qarzdorligi 2', 50,2, false);
  while not dms.s_haridor.Eof do begin
  Sheet := Excel.WorkBooks[1].Sheets[colh];
  hnom:=StrReplace(DMS.s_haridornom.AsString,'(','_');
  hnom:=StrReplace(hnom,')','_');
  hnom:=StrReplace(hnom,'/','_');hnom:=StrReplace(hnom,'\','_');
  hnom:=StrReplace(hnom,'*','_');hnom:=StrReplace(hnom,'?','_');
  if Length(hnom)>30 then hnom:=copy(hnom,1,30);

  Sheet.Name := hnom;

  clientnom.value:=DMS.s_haridorid.AsInteger;
  clientnomChange(DMS.s_haridor);
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select changedate from asos WHERE del_flag=1 and h_id='+DMS.s_haridorid.AsString+' and changedate is not null order by changedate limit 1');
  dms.link.open;
  if dms.link.RecordCount>0 then
  begin
    bsana:=dms.link.fieldbyname('changedate').AsDateTime;
  end;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select d_pl from pl WHERE del_flag=1 and h_id='+DMS.s_haridorid.AsString+' order by d_pl limit 1');
  dms.main_link.open;

  if dms.main_link.RecordCount>0 then
    if dms.link.RecordCount>0 then begin
      if bsana>dms.main_link.fieldbyname('d_pl').AsDateTime then begin
        bsana:=dms.main_link.fieldbyname('d_pl').AsDateTime;
      end;
    end
    else
       bsana:=dms.main_link.fieldbyname('d_pl').AsDateTime;

  if (bsana = null) or (bsana = 0) then exit;
  dan.Date:=bsana;gacha.Date:=bsana;
  //exit;
  //dms.k_asos.DisableControls;dms.k_slave.DisableControls;

  if (clientnom.value=null) or (clientnom.value=0) then exit;
  dms.main_link.DisableControls;
  y:=1;  Sheet.Columns[y].ColumnWidth :=5;
  inc(y);Sheet.Columns[y].ColumnWidth :=40;
  inc(y);Sheet.Columns[y].ColumnWidth := 6;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth := 15;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;

  firstRow:=5;
  while bsana<date()+1 do begin
  dan.Date:=bsana;gacha.Date:=bsana;
  clientnomChange(dms.s_haridor);
  if (DMS.k_asos.RecordCount+DMS.tpl.RecordCount)>0 then begin

  chs:=0;chd:=0;qs:=0;qd:=0;y:=1;
  if dms.k_asossana.AsString<>'' then
    Sheet.Cells[firstRow-2,5] := dms.k_asossana.AsString
  else
    Sheet.Cells[firstRow-2,5] := dms.tpld_pl.AsString;

  Sheet.Cells[firstRow-1,y] := '№';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Tovar nomi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'soni';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Narhi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Tovar qarz';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Naqd summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Izoh';
  dms.k_asos.First;col:=0;l:=0;r:=0;y:=1;qator:=0;
  for i:=0 to dms.k_asos.RecordCount-1 do begin
    chs:=chs+dms.k_asossumma_ch.AsFloat;chd:=chd+dms.k_asossum_d_ch.AsFloat;
    qs:=qs+dms.k_asosqarz_summa.AsFloat+dms.k_asossum_epos_ch.AsFloat;
    qd:=qd+dms.k_asosqarz_dollar.AsFloat;
    dms.k_slave.First;
    for sl:=0 to dms.k_slave.RecordCount-1 do begin
      main.First;
      while not main.eof do begin
        Sheet.Columns[main.RecNo+10].ColumnWidth :=15;
        Sheet.Cells[firstrow+qator,main.RecNo+10].NumberFormat := '@';
        Sheet.Cells[firstrow+qator,main.RecNo+10]:=main.FieldByName('serial').AsString;
        main.Next;
      end;
      Sheet.Cells[firstrow+qator,1]:=qator+1;
      Sheet.Cells[firstrow+qator,2]:=dms.k_slavetovar_nom.AsString;
      Sheet.Cells[firstrow+qator,3]:=dms.k_slavekol.AsFloat;
      if (dms.k_asosdollar.AsInteger=2) or (dms.k_asosdollar.AsInteger=1) then begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ##0,00';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slavesotish_d.AsFloat;
      end
      else
      begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ###0';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slavesotish.AsFloat;
      end;
      Sheet.Cells[firstrow+qator,5].formula := '=RC[-2]*RC[-1]';
      if (dms.k_asosdollar.AsInteger=2) or (dms.k_asosdollar.AsInteger=1) then begin
        Sheet.Cells[firstrow+qator,5].NumberFormat := '### ### ##0,00';
      end
      else
      begin
        Sheet.Cells[firstrow+qator,5]:=dms.k_slavekol.AsFloat*dms.k_slavesotish.AsFloat;
      end;
      inc(col);inc(qator);
      dms.k_slave.Next;
    end;
    dms.k_asos.Next;

  end;y:=0;
  dms.tpl.First;l:=col;r:=0;y:=0;
  if ((chs-qs)+(chd-qd))>0 then begin
    Sheet.Cells[firstrow+r,8]:=chs;
    Sheet.Cells[firstrow+r,8].NumberFormat := '### ### ###0';
    Sheet.Cells[firstrow+r,9]:=chd;
    Sheet.Cells[firstrow+r,9].NumberFormat := '### ### ##0,00';
    inc(r);
  end;
  for i:=0 to dms.tpl.RecordCount-1 do begin
    if (dms.tplvid.Value=8) OR (dms.tplvid.Value=18) then
    begin
      y:=7;;Sheet.Cells[firstrow+l,y]:=inttostr(l);
      case dms.tplkonv.AsInteger of
      1:begin
          inc(y);inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_d.AsFloat;
          Sheet.Cells[firstrow+r,y].Font.Bold := true;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        end;
      2:begin
          inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].Font.Bold := true;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
        end;
      else
        begin
          inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';

          if dms.s_clientdollar.AsInteger=1 then begin
            inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_d.AsFloat;
            Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
          end;
        end;
      end;
      inc(r);
    end
    else
    begin
      y:=7;
      case dms.tplkonv.AsInteger of
      1:begin
        inc(y);inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        Sheet.Cells[firstrow+r,y].Font.Bold := true;
        end;
      2:begin
        inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
        Sheet.Cells[firstrow+r,y].Font.Bold := true;
        end;
      else
        begin
          inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
          if dms.s_clientdollar.AsInteger=1 then begin
            inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
            Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
          end;
        end;
      end;
      inc(r);

    end;
    if l>r then col:=l else col:=r;
    dms.tpl.Next;
  end;
  Sheet.Cells[firstrow-2,6] := 'Dastlabki qarz:';
  Sheet.Cells[firstrow-2,8].NumberFormat := '### ### ###0';
  Sheet.Cells[firstrow-2,8] := danq.Text;
  Sheet.Cells[firstrow,6].NumberFormat := '### ### ###0';
  Sheet.Cells[firstrow,6] := qs;
  Sheet.Cells[firstrow,7].NumberFormat := '### ### ##0,00';
  Sheet.Cells[firstrow,7] := qd;
  Sheet.Cells[firstrow-2,8].Interior.Color:= clYellow;
  Sheet.Cells[firstrow-2,9].NumberFormat := '### ### ##0,00';
  Sheet.Cells[firstrow-2,9] := danqd.Text;
  Sheet.Cells[firstrow-2,9].Interior.Color:= clYellow;
  Sheet.Cells[firstrow+col+1,6] := 'Oxirgi qarz:';
  Sheet.Cells[firstrow+col+1,8] := gachaq.Text;
  Sheet.Cells[firstrow+col+1,8].Interior.Color:= clYellow;
  Sheet.Cells[firstrow+col+1,8].NumberFormat := '### ### ###0';
  Sheet.Cells[firstrow+col+1,9].NumberFormat := '### ### ##0,00';
  Sheet.Cells[firstrow+col+1,9].Interior.Color:= clYellow;
  Sheet.Cells[firstrow+col+1,9] := gachaqd.Text;
  Sheet.Cells[firstrow+col,2] := 'Jami:';
  Sheet.Cells[firstrow+col,3].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,5].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,8].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  ustun:='I';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExceltFormatRange(Range_telo, 'Times New Roman', 11, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  firstrow:=firstrow+col+5;
   end; // >0
  bsana:=bsana+1;
  end; // bsana
  dan.Date:=StrToDate('01.01.2010');danc.Date:=StrToDate('01.01.2010');
  Sheet.Cells[1,1]:='Haridor: '+clientnom.Text;Sheet.Range['A1:'+ustun+'1'].merge;Sheet.Cells[1,1].HorizontalAlignment := 3;
  //Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  DMS.s_haridor.Next;inc(colh);
  end;
  Excel.ActiveWindow.DisplayGridLines:=False;
  //if fileExists(()+'c:\Форма.xls') then DeleteFile('c:\Форма.xls');
  //ExtractFilePath(Application.ExeName);

  Excel.ActiveWorkbook.SaveAs(setup.haridor.Text+'\haridor'+DateToStr(date())+'.xlsx');
  Excel.visible:=true;
  Application.Restore;
  dms.k_asos.EnableControls;
  dms.k_slave.EnableControls;

  //Excel := UnAssigned;
end;

procedure Tqarzdorlik.DalolatnomaClick(Sender: TObject);
var firstRow,y,i,l,r,col:integer;hnom,ustun:string;
begin
  if dms.s_haridor.Active=false then exit;
  if dan.Date=null then exit;
  if (clientnom.value=null) or (clientnom.value=0) then exit;
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=dan;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  interval(dan.Date, gacha.Date, 1,'sana' ,'sana' ,' Sana ');
  if (poisk[1]>'') then
  sqltext.Text:=poisk[1];
  for i := 2 to 7 do begin
    if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i];
    sqltext.Text:=sqltext.Text+poisk[i];
  end;
  ExcelCreateApplication('Dalolatnoma', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;
  y:=1;  Sheet.Columns[y].ColumnWidth :=5;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth := 10;
  inc(y);Sheet.Columns[y].ColumnWidth :=20;
  inc(y);Sheet.Columns[y].ColumnWidth := 10;
  inc(y);Sheet.Columns[y].ColumnWidth := 10;
  inc(y);Sheet.Columns[y].ColumnWidth :=20;firstRow:=10;
  y:=0;inc(y);
  Sheet.Cells[firstRow-1,y] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  inc(y);Sheet.Cells[firstRow-2,y] := 'Chiqim';Sheet.Range['B'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,y] := 'Nomer';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Sana';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  inc(y);Sheet.Cells[firstRow-2,y] := 'Kirim';Sheet.Range['F'+IntToStr(firstrow-2)+':I'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,y] := 'Nomer';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Sana';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  dms.k_asos.First;col:=0;l:=0;r:=0;y:=1;
  for i:=0 to dms.k_asos.RecordCount-1 do begin
    Sheet.Cells[firstrow+i,y]:=inttostr(i+1);inc(col);
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.k_asosdiler_id.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.k_asossana.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=FloatToStr(dms.k_asosqarz_summa.AsFloat+dms.k_asossum_epos_ch.AsFloat);
    Sheet.Cells[firstrow+i,y].NumberFormat := '0,00';
    inc(y);Sheet.Cells[firstrow+i,y]:=FloatToStr(dms.k_asosqarz_dollar.AsFloat);
    Sheet.Cells[firstrow+i,y].NumberFormat := '0,00';
    dms.k_asos.Next;y:=1;
  end;
  dms.tpl.First;l:=col;r:=0;y:=0;
  for i:=0 to dms.tpl.RecordCount-1 do begin
    if (dms.tplvid.Value=8) OR (dms.tplvid.Value=18) then
    begin
      y:=0;inc(y);Sheet.Cells[firstrow+l,y]:=inttostr(l);
      inc(Y);Sheet.Cells[firstrow+l,y]:=dms.tpln_pl.AsString;
      inc(y);Sheet.Cells[firstrow+l,y]:=dms.tpld_pl.AsString;

      case dms.tplkonv.AsInteger of
      1:begin
          inc(y);inc(y);Sheet.Cells[firstrow+l,y]:=dms.tplsena_d.AsFloat;
          Sheet.Cells[firstrow+l,y].Font.Bold := true;
          Sheet.Cells[firstrow+l,y].NumberFormat := '0,00';
        end;
      2:begin
          inc(y);Sheet.Cells[firstrow+l,y]:=dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+l,y].Font.Bold := true;
          Sheet.Cells[firstrow+l,y].NumberFormat := '0,00';
        end;
      else
        begin
          inc(y);Sheet.Cells[firstrow+l,y]:=dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+l,y].NumberFormat := '0,00';

          if dms.s_clientdollar.AsInteger=1 then begin
            inc(y);Sheet.Cells[firstrow+l,y]:=dms.tplsena_d.AsFloat;
            Sheet.Cells[firstrow+l,y].NumberFormat := '0,00';
          end;
        end;
      end;
      inc(l);
    end
    else
    begin

      y:=6;Sheet.Cells[firstrow+r,y]:=dms.tpln_pl.AsString;
      inc(y);Sheet.Cells[firstrow+r,y]:=dms.tpld_pl.AsString;
      case dms.tplkonv.AsInteger of
      1:begin
        inc(y);inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '0,00';
        Sheet.Cells[firstrow+r,y].Font.Bold := true;
        end;
      2:begin
        inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '0,00';
        Sheet.Cells[firstrow+r,y].Font.Bold := true;
        end;
      else
        begin
          inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '0,00';
          if dms.s_clientdollar.AsInteger=1 then begin
            inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
            Sheet.Cells[firstrow+r,y].NumberFormat := '0,00';
          end;
        end;
      end;
      inc(r);

    end;
    if l>r then col:=l else col:=r;
    dms.tpl.Next;
  end;
  Sheet.Cells[firstrow-4,2] := 'Dastlabki qoldiq:';
  Sheet.Cells[firstrow-4,4] := danq.Text;
  Sheet.Cells[firstrow-4,5].NumberFormat := '0,00';
  Sheet.Cells[firstrow-4,5] := danqd.Text;
  Sheet.Cells[firstrow+col+2,2] := 'Ohirgi qoldiq:';
  Sheet.Cells[firstrow+col+2,4] := gachaq.Text;
  Sheet.Cells[firstrow+col+2,5].NumberFormat := '0,00';
  Sheet.Cells[firstrow+col+2,5] := gachaqd.Text;
  Sheet.Cells[firstrow+col,2] := 'Jami:';
  Sheet.Cells[firstrow+col,4].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,5].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,8].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  ustun:='I';
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

  Sheet.Cells[2,1]:='Haridor: '+clientnom.Text;Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
end;

procedure Tqarzdorlik.gplDblClick(Sender: TObject);
begin
  change:='edit';tolov_id:=DMS.tplid.AsString;forma:='qarzdorlik';
  if dms.tpl.RecordCount=0 then
  begin
    haridor_id:=dms.s_haridorid.AsString;change:='new';tolov_id:='';
  end;
  pl.showmodal;
end;

procedure Tqarzdorlik.Y1Click(Sender: TObject);
begin
  haridor_id:=dms.s_haridorid.AsString;change:='new';tolov_id:='';
  pl.showmodal;
end;

procedure Tqarzdorlik.gclientDblClick(Sender: TObject);
begin
  s_haridor.showmodal;
end;

procedure Tqarzdorlik.akt3Click(Sender: TObject);
var chs,chd,qs,qd:Currency;firstRow,y,i,l,r,col,sl,qator:integer;hnom,ustun:string;bsana:TDate;IniFile:TIniFile;
begin
  if dms.s_haridor.Active=false then exit;
  if dan.Date=null then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select changedate from asos WHERE del_flag=1 and h_id='+DMS.s_haridorid.AsString+' and changedate is not null order by changedate limit 1');
  dms.link.open;
  if dms.link.RecordCount>0 then
  begin
    bsana:=dms.link.fieldbyname('changedate').AsDateTime;
  end;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select d_pl from pl WHERE del_flag=1 and h_id='+DMS.s_haridorid.AsString+' order by d_pl limit 1');
  dms.main_link.open;

  if dms.main_link.RecordCount>0 then
    if dms.link.RecordCount>0 then begin
      if bsana>dms.main_link.fieldbyname('d_pl').AsDateTime then begin
        bsana:=dms.main_link.fieldbyname('d_pl').AsDateTime;
      end;
    end
    else
       bsana:=dms.main_link.fieldbyname('d_pl').AsDateTime;
  if (bsana = null) or (bsana = 0) then exit;
  dan.Date:=bsana;gacha.Date:=bsana;
  //exit;
  //dms.k_asos.DisableControls;dms.k_slave.DisableControls;

  if (clientnom.value=null) or (clientnom.value=0) then exit;
  ExcelCreateApplication('Dalolatnoma', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;
  y:=1;  Sheet.Columns[y].ColumnWidth :=5;
  inc(y);Sheet.Columns[y].ColumnWidth :=40;
  inc(y);Sheet.Columns[y].ColumnWidth := 6;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth := 15;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  firstRow:=5;
  while bsana<date()+1 do begin
  dan.Date:=bsana;gacha.Date:=bsana;
  clientnomChange(dms.s_haridor);
  if (DMS.k_asos.RecordCount+DMS.tpl.RecordCount)>0 then begin
  chs:=0;chd:=0;qs:=0;qd:=0;y:=1;
  Sheet.Cells[firstRow-1,y] := '№';
  inc(y);Sheet.Cells[firstRow-1,y] := dan.Text+'     Tovar nomi';
  Sheet.Cells[firstRow-1,y].Characters(1, 12).Font.Size := 14;
  Sheet.Cells[firstRow-1,y].Characters(1, 12).Font.Color := -16776961;

  inc(y);Sheet.Cells[firstRow-1,y] := 'soni';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Narhi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'To`landi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Oldingi qarzi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Oxirgi Qarzi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Izoh';
  dms.k_asos.First;col:=0;l:=0;r:=0;y:=1;qator:=0;
  for i:=0 to dms.k_asos.RecordCount-1 do begin
  if DMS.k_asosid.AsInteger=724 then
    qarzdorlik.Caption:=qarzdorlik.Caption;
    chs:=chs+dms.k_asossumma_ch.AsFloat;chd:=chd+dms.k_asossum_d_ch.AsFloat;
    qs:=qs+dms.k_asosqarz_summa.AsFloat+dms.k_asossum_epos_ch.AsFloat;
    qd:=qd+dms.k_asosqarz_dollar.AsFloat;
    dms.k_slave.First;
    for sl:=0 to dms.k_slave.RecordCount-1 do begin
      main.First;
      while not main.eof do begin
        Sheet.Columns[main.RecNo+10].ColumnWidth :=15;
        Sheet.Cells[firstrow+qator,main.RecNo+10].NumberFormat := '@';
        Sheet.Cells[firstrow+qator,main.RecNo+10]:=main.FieldByName('serial').AsString;
        main.Next;
      end;
      Sheet.Cells[firstrow+qator,1]:=qator+1;
      Sheet.Cells[firstrow+qator,2]:=dms.k_slavetovar_nom.AsString;
      Sheet.Cells[firstrow+qator,3]:=dms.k_slavekol.AsFloat;
      if (dms.k_asosdollar.AsInteger=2) or (dms.k_asosdollar.AsInteger=1) then begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ##0,00';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slavesotish_d.AsFloat;
      end
      else
      begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ###0';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slavesotish.AsFloat;
      end;
      Sheet.Cells[firstrow+qator,5].formula := '=RC[-2]*RC[-1]';
      {if (dms.k_asosdollar.AsInteger=2) or (dms.k_asosdollar.AsInteger=1) then begin
        Sheet.Cells[firstrow+qator,5].NumberFormat := '### ### ##0,00';
      end
      else
      begin
        Sheet.Cells[firstrow+qator,5]:=dms.k_slavekol.AsFloat*dms.k_slavesotish.AsFloat;
      end;}
      inc(col);inc(qator);
      dms.k_slave.Next;
    end;
    dms.k_asos.Next;

  end;y:=0;
  dms.tpl.First;l:=col;r:=0;y:=0;
  if ((chs-qs)+(chd-qd))>0 then begin
    if (chs>0) then
    Sheet.Cells[firstrow+r,8]:=chs-qs
    else
    Sheet.Cells[firstrow+r,8]:=chs;
    Sheet.Cells[firstrow+r,8].NumberFormat := '### ### ###0';
    if (chd>0) then
      Sheet.Cells[firstrow+r,6]:=chd-qd
    else
      Sheet.Cells[firstrow+r,6]:=chd;
    Sheet.Cells[firstrow+r,6].NumberFormat := '### ### ##0,00';
    //Sheet.Cells[firstrow+r,10] := 'Savdo '+dms.asosqarz_izoh.AsString;
    inc(r);
  end;
  for i:=0 to dms.tpl.RecordCount-1 do begin
    if (dms.tplvid.Value=8) OR (dms.tplvid.Value=18) then
    begin
      y:=7;Sheet.Cells[firstrow+l,y]:=inttostr(l);
      case dms.tplkonv.AsInteger of
      1:begin
          inc(y);inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_d.AsFloat;
          Sheet.Cells[firstrow+r,y].Font.Bold := true;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        end;
      2:begin
          inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].Font.Bold := true;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
        end;
      else
        begin
          inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_pl.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
          inc(y);Sheet.Cells[firstrow+r,y]:=-dms.tplsena_d.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        end;
      end;
      inc(y);//Sheet.Cells[firstrow+r,y]:='Chiqim '+dms.tplprim.AsString;
      inc(r);
    end
    else
    begin
      y:=7-3;
      case dms.tplkonv.AsInteger of
      1:begin
        inc(y);inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        Sheet.Cells[firstrow+r,y].Font.Bold := true;
        end;
      2:begin
        inc(y);inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';
        Sheet.Cells[firstrow+r,y].Font.Bold := true;
        end;
      else
        begin
          inc(y);inc(y);

          //Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
          //Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ###0';

          inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
          Sheet.Cells[firstrow+r,y].NumberFormat := '### ### ##0,00';
        end;
      end;
      inc(y);inc(y);
      Sheet.Cells[firstrow+r,y]:='Kirim '+dms.tplprim.AsString;
      inc(r);

    end;
    if l>r then col:=l else col:=r;
    dms.tpl.Next;
  end;
  Sheet.Cells[firstrow+col,7].NumberFormat := '### ### ###0';
  Sheet.Cells[firstrow+col,7] := danq.Text;
  Sheet.Cells[firstrow+col,8].NumberFormat := '### ### ##0,00';
  Sheet.Cells[firstrow+col,8] := gachaqd.Text;
  Sheet.Cells[firstrow+col,8].Interior.Color:= clYellow;
  Sheet.Cells[firstrow+col,8].NumberFormat := '### ### ###0';
  Sheet.Cells[firstrow+col,2] := 'Jami:';
  Sheet.Cells[firstrow+col,5].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  ustun:='I';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExceltFormatRange(Range_telo, 'Times New Roman', 11, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  firstrow:=firstrow+col+5;
   end; // >0
  bsana:=bsana+1;
  end; // bsana
  dan.Date:=StrToDate('01.01.2010');danc.Date:=StrToDate('01.01.2010');
  Sheet.Cells[1,1]:='Haridor: '+clientnom.Text;Sheet.Range['A1:'+ustun+'1'].merge;Sheet.Cells[1,1].HorizontalAlignment := 3;
  //Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;

  Excel.ActiveWindow.DisplayGridLines:=False;
  //if fileExists(()+'c:\Форма.xls') then DeleteFile('c:\Форма.xls');
  //ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  hnom:=StrReplace(DMS.s_haridornom.AsString,'(','_');
  hnom:=StrReplace(hnom,')','_');
  Excel.ActiveWorkbook.SaveAs(IniFile.ReadString('BAZA','haridor','d:\arxiv')+'\'+hnom+'.xlsx');
  IniFile.Free;
  Excel.visible:=true;
  Application.Restore;
    dms.k_asos.EnableControls;
  dms.k_slave.EnableControls;

  //Excel := UnAssigned;
end;

procedure Tqarzdorlik.Hammagabonushisoblash1Click(Sender: TObject);
var chiq:integer;
begin
  if Gbsana.Visible=false then begin
    ShowMessage('"Ko`rsatgichlar" yozuvini ikki marta bosing');exit;
  end;
  if MessageDlg('Hammaga bonus hisoblaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  DMS.s_haridor.First;foizbonus.Visible:=True;foizbonus.Caption:='Boshlandi';chiq:=0;
  while not DMS.s_haridor.Eof do begin
    DMS.k_asos.First;
    while not DMS.k_asos.Eof do begin
      if (gachaq.Value=0) and (DMS.k_asossum_plastik.AsFloat=0) then begin

        dms.main_link.Close;dms.main_link.SQL.Clear;
        dms.main_link.SQL.Add('select sum(summa_all) as jami from asos_slave s, s_tovar t  WHERE t.bonus<>"Y" and t.id=s.tovar_id and s.del_flag=1 and s.asos_id='+DMS.k_asosid.AsString+'  ');
        dms.main_link.open;

        DMS.k_asos.edit;
        if (DMS.k_asossum_click_ch.AsFloat)>0 then
          begin
            DMS.k_asosbonus.AsFloat:=Round_zzz(Trunc((DMS.k_asossumma_ch.AsFloat-dms.main_link.fieldbyname('jami').AsFloat)*3/100));
            DMS.k_asosbonusno.AsFloat:=Round_zzz(Trunc((dms.main_link.fieldbyname('jami').AsFloat)*3/100));
          end
        else
          begin
            DMS.k_asosbonus.AsFloat:=Round_zzz(Trunc((DMS.k_asossumma_ch.AsFloat-dms.main_link.fieldbyname('jami').AsFloat)*3/100));
            DMS.k_asosbonusno.AsFloat:=Round_zzz(Trunc((dms.main_link.fieldbyname('jami').AsFloat)*3/100));
          end;
        DMS.k_asos.post;
      end
      else
      begin
        DMS.k_asos.edit;
        DMS.k_asosbonus.AsFloat:=0;
        DMS.k_asos.post;
      end;

      DMS.k_asos.Next;
    end;
    if chiq=1 then exit;
    DMS.s_haridor.Next;
    if DMS.s_haridor.RecordCount=DMS.s_haridor.RecNo then
    begin
      chiq:=1;
    end;
    clientnom.Value:=DMS.s_haridorid.Value;
    clientnomChange(Sender);
    foizbonus.Caption:=inttostr(DMS.s_haridor.RecNo)+' / '+inttostr(DMS.s_haridor.RecordCount);
    Application.ProcessMessages;

  end;
end;

procedure Tqarzdorlik.Jadva1Click(Sender: TObject);
begin
  if Gbsana.Visible=false then begin
    ShowMessage('"Ko`rsatgichlar" yozuvini ikki marta bosing');exit;
  end;
  if g_asos1.Visible=true then g_asos1.Visible:=false else g_asos1.Visible:=true;
end;

procedure Tqarzdorlik.Exelgachiqarish1Click(Sender: TObject);
var bs:Currency;firstRow,y,i,l,r,col,sl,qator:integer;hnom,ustun:string;
begin
  if Gbsana.Visible=false then begin
    ShowMessage('"Ko`rsatgichlar" yozuvini ikki marta bosing');exit;
  end;
  if dms.s_haridor.Active=false then exit;
  if dan.Date=null then exit;
  dms.s_haridor.First;  firstRow:=10;y:=1;qator:=0;
  ExcelCreateApplication('Bonus', 1,2, false);
  Sheet.Cells[firstRow-1,y] := '№';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Haridor nome';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Summa';
  y:=1;  Sheet.Columns[1].ColumnWidth :=5;
  inc(y);Sheet.Columns[2].ColumnWidth :=40;
  inc(y);Sheet.Columns[3].ColumnWidth := 15;
  inc(y);Sheet.Columns[4].ColumnWidth :=10;
  while not dms.s_haridor.Eof do begin
    clientnom.value:=DMS.s_haridorid.AsInteger;
    clientnomChange(DMS.s_haridor);
    dms.tpl.First;bs:=0;
    while not dms.tpl.Eof do begin
      if dms.tplvid.AsInteger=25 then bs:=bs+DMS.tplsena_pl.AsFloat;
      dms.tpl.next;
    end;
    if bs>0 then begin
      y:=1;inc(qator);
      Sheet.Cells[firstRow-1+qator,y] := IntToStr(qator);
      inc(y);Sheet.Cells[firstRow-1+qator,y] := dms.s_haridornom.AsString;
      inc(y);Sheet.Cells[firstRow-1+qator,y] := dms.s_haridortelsms1.AsString;
      inc(y);Sheet.Cells[firstRow-1+qator,y] := FloatToStr(bs);
    end;
    dms.s_haridor.next;
  end;
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+'d' + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +'d'+ IntToStr(firstRow+qator)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+qator) + ':'+'d' + IntToStr(FirstRow+qator)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+'d' + IntToStr(FirstRow+qator)];
  Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+'d' + IntToStr(FirstRow+qator)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExceltFormatRange(Range_telo, 'Times New Roman', 11, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Excel.ActiveWindow.DisplayGridLines:=False;
  Excel.ActiveWorkbook.SaveAs(setup.haridor.Text+'\bonus'+DateToStr(date())+'.xlsx');
  Excel.visible:=true;
  //dms.k_asos.EnableControls;
  //dms.k_slave.EnableControls;

  //Excel := UnAssigned;

end;

procedure Tqarzdorlik.Joriyharidorgabonusberish1Click(Sender: TObject);
var b:Currency;
begin
  if Gbsana.Visible=false then begin
    ShowMessage('"Ko`rsatgichlar" yozuvini ikki marta bosing');exit;
  end;
  if MessageDlg('Joriy haridorga bonus berasizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    DMS.k_asos.First;b:=0;
    while not DMS.k_asos.Eof do begin
      b := b + DMS.k_asosbonus.AsFloat;
      DMS.k_asos.Next;
    end;
    if b>0 then begin
      DMS.tpl.Append;DMS.tplh_id.AsInteger:=dms.s_haridorid.AsInteger;DMS.tplkonv.AsInteger:=0;
      DMS.tplvid.AsInteger:=25;DMS.tpld_pl.AsDateTime:=date();DMS.tpln_pl.AsString:='-1';
      DMS.s_client.Refresh;
      if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
        DMS.tpln_pl.AsInteger:=1
      else
        DMS.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
      DMS.tplsena_pl.AsFloat:=b;
      DMS.tpluser_id.AsInteger:=strtoint(admin_id);DMS.tplclient_id.AsInteger:=strtoint(admin_clid);
      DMS.tpl.Post;
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then begin
        dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
    end; // b>0
end;

procedure Tqarzdorlik.Joriyharidorgabonushisoblash1Click(Sender: TObject);
var b:Currency;
begin
  if Gbsana.Visible=false then begin
    ShowMessage('"Ko`rsatgichlar" yozuvini ikki marta bosing');exit;
  end;
  if MessageDlg('Joriy xaridorga bonus hisoblaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  DMS.k_asos.First;
  b:=0;
  while not DMS.k_asos.Eof do begin
      if (gachaq.Value=0) and (DMS.k_asossum_plastik.AsFloat=0) then begin
        dms.main_link.Close;dms.main_link.SQL.Clear;
        dms.main_link.SQL.Add('select sum(summa_all) as jami from asos_slave s, s_tovar t  WHERE t.bonus<>"Y" and t.id=s.tovar_id and s.del_flag=1 and s.asos_id='+DMS.k_asosid.AsString+'  ');
        dms.main_link.open;

        DMS.k_asos.edit;
        if (DMS.k_asossum_click_ch.AsFloat)>0 then
          begin
            DMS.k_asosbonus.AsFloat:=Round_zzz(Trunc((DMS.k_asossumma_ch.AsFloat-dms.main_link.fieldbyname('jami').AsFloat)*3/100));
            DMS.k_asosbonusno.AsFloat:=Round_zzz(Trunc((dms.main_link.fieldbyname('jami').AsFloat)*3/100));
          end
        else
          begin
            DMS.k_asosbonus.AsFloat:=Round_zzz(Trunc((DMS.k_asossumma_ch.AsFloat-dms.main_link.fieldbyname('jami').AsFloat)*3/100));
            DMS.k_asosbonusno.AsFloat:=Round_zzz(Trunc((dms.main_link.fieldbyname('jami').AsFloat)*3/100));
          end;
        DMS.k_asos.post;
      end
      else
      begin
        DMS.k_asos.edit;
        DMS.k_asosbonus.AsFloat:=0;
        DMS.k_asos.post;
      end;

    DMS.k_asos.Next;
  end;
  if b=0 then exit;
  DMS.tpl.Append;
  DMS.tplh_id.AsInteger:=dms.s_haridorid.AsInteger;
  DMS.tplvid.AsInteger:=25;
  DMS.tpld_pl.AsDateTime:=date();
  DMS.tpln_pl.AsString:='-1';
  DMS.tplkonv.AsInteger:=0;
  DMS.s_client.Refresh;
  if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
    DMS.tpln_pl.AsInteger:=1
  else
    DMS.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
  DMS.tplsena_pl.AsFloat:=b;
  DMS.tpluser_id.AsInteger:=strtoint(admin_id);
  DMS.tplclient_id.AsInteger:=strtoint(admin_clid);
  DMS.tpl.Post;

    dms.link.Close;dms.link.sql.Clear;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then begin
      dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString)
    end
    else begin
      dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;

end;

procedure Tqarzdorlik.Qator1Click(Sender: TObject);
begin
  Clipboard.AsText:=DMS.k_asosid.AsString;
end;

end.







