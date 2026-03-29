unit fotch_oborot_tovar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, RzRadGrp, DB, dateutils,Grids, DBGrids,IniFiles, RzPrgres,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RzButton, RzEdit,
  StdCtrls, Mask, DBCtrlsEh, DBGridEh, DBLookupEh;

type
  Totch_oborot_tovar = class(TForm)
    xtur: TRzRadioGroup;
    xGroupyil: TRzGroupBox;
    xlyil: TLabel;
    xyil: TComboBox;
    oi: TRzRadioGroup;
    xoraliq: TRzGroupBox;
    xldan: TLabel;
    xlgacha: TLabel;
    dan: TDBDateTimeEditEh;
    gacha: TDBDateTimeEditEh;
    xchorak: TRzRadioGroup;
    sqltext: TRzEdit;
    lbd_sf: TZQuery;
    Dlbd_sf: TDataSource;
    za: TRzEdit;
    itog: TZQuery;
    razrez: TZQuery;
    otch: TZQuery;
    Dotch: TDataSource;
    otchid: TIntegerField;
    otchsf: TIntegerField;
    otchs1: TStringField;
    otchs2: TStringField;
    otchs3: TStringField;
    otchf1: TFloatField;
    otchf2: TFloatField;
    otchf3: TFloatField;
    otchf4: TFloatField;
    otchf5: TFloatField;
    otchf6: TFloatField;
    otchi1: TIntegerField;
    otchi2: TIntegerField;
    otchi3: TIntegerField;
    otchkurs: TFloatField;
    otchdollar: TFloatField;
    otchposhlina: TFloatField;
    otchflag: TSmallintField;
    zapros: TRzEdit;
    otchf7: TFloatField;
    otchf8: TFloatField;
    otchf9: TFloatField;
    otchf10: TFloatField;
    progressl_lk: TRzProgressBar;
    otch_new: TRzBitBtn;
    foyda: TRzBitBtn;
    chegirma: TRzBitBtn;
    Label2: TLabel;
    user: TDBLookupComboboxEh;
    Label1: TLabel;
    haridor: TDBLookupComboboxEh;
    Label3: TLabel;
    diler: TDBLookupComboboxEh;
    procedure xturClick(Sender: TObject);
    procedure xyilChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure otch_newClick(Sender: TObject);
    procedure foydaClick(Sender: TObject);
    procedure chegirmaClick(Sender: TObject);
  private
    procedure interval(int1,int2:Variant;massiv:Integer;z,w,s:String);
  public
    { Public declarations }
  end;

var
  otch_oborot_tovar: Totch_oborot_tovar;
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
  poisk: array [1..27] of String;
  vchorak,voy,s1,s2:string;sena:Currency;
  Mes3:array[1..12] of string=('января','февраля','марта','апреля','мая','июня','июля','августа','сентября','октября','ноября','декабря');
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
implementation

{$R *.dfm}
uses fulanish,fdms, fmain,comobj,StrUtils;
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
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure Totch_oborot_tovar.interval(int1,int2:Variant;massiv:Integer;z,w,s:String);
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

procedure Totch_oborot_tovar.xturClick(Sender: TObject);
begin
  zapros.Text:='';
  case xtur.ItemIndex of
  0:begin
      xGroupyil.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;xoraliq.Enabled:=False;
      dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);
      za.Text:=''+xyil.Text+ ' yul bo`yicha';
    end;
  1:begin
      xGroupyil.Enabled:=True;xchorak.Enabled:=True;oi.Enabled:=False;xoraliq.Enabled:=False;
      case xchorak.ItemIndex of
      0: begin dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.03.'+copy(xyil.Text,3,2);vchorak:='I';end;
      1: begin dan.Text:='01.04.'+copy(xyil.Text,3,2);gacha.Text:='30.06.'+copy(xyil.Text,3,2);vchorak:='II';end;
      2: begin dan.Text:='01.07.'+copy(xyil.Text,3,2);gacha.Text:='30.09.'+copy(xyil.Text,3,2);vchorak:='III';end;
      3: begin dan.Text:='01.10.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);vchorak:='IV';end;
      end;
      //zapros.Text:=xyil.Text+' yil ' +vchorak+ ' chorak';
      za.Text:=xyil.Text+' yil '+vchorak+ ' chorak bo`yicha';
     end;
  2: begin
      xGroupyil.Enabled:=True;oi.Enabled:=True;xchorak.Enabled:=False;xoraliq.Enabled:=False;
      case oi.ItemIndex of
      0: begin s1:='01.01.';s2:='.02.';voy:='yanvar'; end;
      1: begin s1:='01.02.';s2:='.03.';voy:='fevral';end;
      2: begin s1:='01.03.';s2:='.04.';voy:='mart';  end;
      3: begin s1:='01.04.';s2:='.05.';voy:='aprel'; end;
      4: begin s1:='01.05.';s2:='.06.';voy:='may';   end;
      5: begin s1:='01.06.';s2:='.07.';voy:='iyun';   end;
      6: begin s1:='01.07.';s2:='.08.';voy:='iyul';   end;
      7: begin s1:='01.08.';s2:='.09.';voy:='avgust';end;
      8: begin s1:='01.09.';s2:='.10.';voy:='sentyabr';end;
      9: begin s1:='01.10.';s2:='.11.';voy:='oktyabr'; end;
      10: begin s1:='01.11.';s2:='.12.';voy:='noyabr'; end;
      11: begin s1:='01.12.';s2:='.01.';voy:='dekabr';end;
      end;s2:='01'+s2+copy(xyil.Text,3,2);//ord(IsLeapYear(year)
      if oi.ItemIndex=11 then s2:=DateToStr(IncYear(strTodate(s2))-1) else s2:=DateToStr(strTodate(s2)-1);
      dan.Text:=s1+copy(xyil.Text,3,2);gacha.Text:=s2;
      //zapros.Text:=xyil.Text+' yil ' +voy+ ' oyi bo`yicha';
      za.Text:=xyil.Text+' yil '+voy+ ' oyi bo`yicha ';
     end;
  3: begin
      //dan.Text:=datetostr(now);
      //if dan.Text<>gacha.Text then gacha.Text:=dan.Text;
      dan.Text:=DateToStr(now);gacha.Text:=dan.Text;
      xGroupyil.Enabled:=False;xoraliq.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;
      //zapros.Text:= ' дата с-ф = '+dan.Text;
      za.Text:=dan.Text+' sana bo`yicha';
     end;
  4: begin
      xGroupyil.Enabled:=False;xoraliq.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;
      //zapros.Text:= ' интервал с '+dan.Text+' по '+gacha.text;
      za.Text:=''+dan.Text+' dan '+gacha.text+' gacha oraliq bo`yicha ';
     end;
  end;
end;
procedure Totch_oborot_tovar.xyilChange(Sender: TObject);
begin
  //dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);xturClick(Sender);
  xturClick(sender);
  end;

procedure Totch_oborot_tovar.FormActivate(Sender: TObject);
begin
  progressl_lk.Percent:=0;
  if dms.user.Active=false then DMS.user.Open;
  shortdateformat:='dd.mm.yyyy';
  xyil.Text:= IntToStr(YearOf(now));
  dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);
  oi.ItemIndex:=MonthOf(now)-1;shortdateformat:='dd.mm.yy';
  if MonthOf(now) in [1,2,3] then xchorak.ItemIndex:=0;
  if MonthOf(now) in [4,5,6] then xchorak.ItemIndex:=1;
  if MonthOf(now) in [7,8,9] then xchorak.ItemIndex:=2;
  if MonthOf(now) in [10,11,12] then xchorak.ItemIndex:=3;
  xturClick(Sender);
end;

procedure Totch_oborot_tovar.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Totch_oborot_tovar.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Totch_oborot_tovar.FormCreate(Sender: TObject);
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

procedure Totch_oborot_tovar.otch_newClick(Sender: TObject);
var firstRow,i,col,k,tkol_in:integer;s,ustun:string;bir:Double;
type MyType = record nn:Smallint;name:string[250];i1,j1,i2,j2,i3,j3,i4,j4:Integer;f1,f2,f3,f4,f5,f6,sena,sena_in,sotish,sotish_in:Currency;end;
var m: Array of MyType;
begin
  progressl_lk.Percent:=0;
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=dan;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  //if s_ter.Value>0 then begin poisk[2]:=' sf.ter = '+IntToStr(s_ter.Value);if s_ter.Value<91 then  zapros.Text:=zapros.Text+' Hududiy bo`lim = '+s_ter.Text+'#';end;
  if user.Value>0 then begin
    poisk[3]:=' a.user_id = '+IntToStr(user.Value);
    zapros.Text:=zapros.Text+' Sotuvchi = '+user.Text+'#';
  end;
  if haridor.Value>0 then begin
    poisk[4]:=' a.h_id = '+IntToStr(haridor.Value);
    zapros.Text:=zapros.Text+' Haridor = '+haridor.Text+'#';
  end;
  if diler.Value>0 then begin
    poisk[5]:=' a.d_id = '+IntToStr(diler.Value);
    zapros.Text:=zapros.Text+' Diler = '+diler.Text+'#';
  end;

  if (dan.Text<>'  .  .  ') then interval(StrToDate('01.06.14'), gacha.Value, 1,'sana' ,'sana' ,' Sana ');
  if (poisk[1]>'') then sqltext.Text:=poisk[1];
  for i := 2 to 7 do begin if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i]; sqltext.Text:=sqltext.Text+poisk[i];end;
  with lbd_sf do begin
  Close;SQL.Clear;
    if dms.s_clientdollar.AsInteger = 2 then
      SQL.Add('SELECT t.kol_in as tkol_in,a.tur_oper,a.sana,s.summa_all,s.sena_d as sena,s.sena_in_d as sena_in,s.sotish_d as sotish,s.sotish_in_d as sotish_in,s.kol,s.kol_in,t.nom as clnom,t.id as kesim from s_tovar t,asos a,asos_slave s ')
    else
      SQL.Add('SELECT t.kol_in as tkol_in,a.tur_oper,a.sana,s.summa_all,s.sena,s.sena_in,s.sotish,s.sotish_in,s.kol,s.kol_in,t.nom as clnom,t.id as kesim from s_tovar t,asos a,asos_slave s ');
  SQL.Add('WHERE a.client_id='+admin_id+' and a.id=s.asos_id and t.id=s.tovar_id and s.del_flag=1 and '+sqltext.Text+' order by t.nom'); // sf
  //zapros.Text:=sql.Text;     //t.id=87 and
  //exit;
  Open;k:=Fieldbyname('kesim').Value;
  SetLength(m, 0);tkol_in:=lbd_sf.Fieldbyname('tkol_in').AsInteger;
  col:=0;SetLength(m, Length(m)+1);m[col].name:=Fieldbyname('clnom').Value;
  while not Eof do begin
    //if lbd_sf.Fieldbyname('clnom').Value='Kanvert 110x220mm'  then
    //zapros.Text:='';

    //if (recno>1) and (m[col].name<>Fieldbyname('clnom').Value) then begin
    if (k<>Fieldbyname('kesim').Value) then begin
    m[col].i4:=m[col].i1+m[col].i2-m[col].i3;bir:=1;
    if m[col].j1+m[col].j2+m[col].j3>0 then
      if (m[col].j1+m[col].j2<m[col].j3) or (tkol_in<=m[col].j3) then begin
        if tkol_in<=m[col].j3 then
        begin
          bir:=int(m[col].j3/tkol_in);
          m[col].j3:=m[col].j3-Trunc(bir)*tkol_in;
        end;
        m[col].i4:=m[col].i4-Trunc(bir);
        m[col].j4:=m[col].j3-(m[col].j1+m[col].j2+tkol_in);
        if m[col].j4<0 then m[col].j4:=0-m[col].j4;
      end
      else
        m[col].j4:=m[col].j1+m[col].j2-m[col].j3;
      m[col].f4:=m[col].i4*m[col].sotish+m[col].j4*m[col].sotish_in;
      inc(col);
      k:=lbd_sf.Fieldbyname('kesim').Value;tkol_in:=lbd_sf.Fieldbyname('tkol_in').AsInteger;
      SetLength(m, Length(m)+1); m[col].name:=Fieldbyname('clnom').Value;m[col].nn:=col;
    end; // locate
    if (Fieldbyname('tur_oper').AsInteger in [1,4,5]) and (Fieldbyname('sana').AsDateTime > StrToDate('01.06.14')) and (Fieldbyname('sana').AsDateTime <= dan.Value-1) then begin
      m[col].i1:=m[col].i1+Fieldbyname('kol').AsInteger;m[col].j1:=m[col].j1+Fieldbyname('kol_in').AsInteger;
      m[col].f1:=m[col].f1+Fieldbyname('kol').AsInteger*Fieldbyname('sotish').AsFloat+Fieldbyname('kol_in').AsInteger*Fieldbyname('sotish_in').AsFloat;
      m[col].sena:=Fieldbyname('sena').AsFloat;m[col].sena_in:=Fieldbyname('sena_in').AsFloat;
      m[col].sotish:=Fieldbyname('sotish').AsFloat;m[col].sotish_in:=Fieldbyname('sotish_in').AsFloat;
    end; // dastlabki kirim
    if (Fieldbyname('tur_oper').AsInteger in [2]) and (Fieldbyname('sana').AsDateTime > StrToDate('01.06.14')) and (Fieldbyname('sana').AsDateTime <= dan.Value-1) then begin
      m[col].i1:=m[col].i1-lbd_sf.Fieldbyname('kol').AsInteger;
      if m[col].j1+lbd_sf.Fieldbyname('kol_in').AsInteger>0 then
        if lbd_sf.Fieldbyname('kol_in').AsInteger<=m[col].j1 then
          m[col].j1:=m[col].j1-lbd_sf.Fieldbyname('kol_in').AsInteger
        else begin
          m[col].i1:=m[col].i1-1;
          m[col].j1:=m[col].j1+lbd_sf.Fieldbyname('tkol_in').AsInteger-lbd_sf.Fieldbyname('kol_in').AsInteger;
        end;
      m[col].f1:=m[col].f1-(Fieldbyname('kol').AsInteger*Fieldbyname('sotish').AsFloat+Fieldbyname('kol_in').AsInteger*Fieldbyname('sotish_in').AsFloat);
      m[col].sena:=Fieldbyname('sena').AsFloat;m[col].sena_in:=Fieldbyname('sena_in').AsFloat;
      m[col].sotish:=Fieldbyname('sotish').AsFloat;m[col].sotish_in:=Fieldbyname('sotish_in').AsFloat;
    end; // dastlabki chiqim
    if (Fieldbyname('tur_oper').AsInteger in [1,4,5]) and (Fieldbyname('sana').AsDateTime >= dan.Value) and (Fieldbyname('sana').AsDateTime <= gacha.Value) then begin
      m[col].i2:=m[col].i2+Fieldbyname('kol').AsInteger;m[col].j2:=m[col].j2+Fieldbyname('kol_in').AsInteger;
      //m[col].f2:=m[col].f2+Fieldbyname('summa_all').AsFloat;
      m[col].f2:=m[col].f2+Fieldbyname('kol').AsFloat*Fieldbyname('sena').AsFloat;
      m[col].sena:=Fieldbyname('sena').AsFloat;m[col].sena_in:=Fieldbyname('sena_in').AsFloat;
      m[col].sotish:=Fieldbyname('sotish').AsFloat;m[col].sotish_in:=Fieldbyname('sotish_in').AsFloat;
   end; // kirim
    if (Fieldbyname('tur_oper').AsInteger in [2]) and (Fieldbyname('sana').AsDateTime >= dan.Value) and (Fieldbyname('sana').AsDateTime <= gacha.Value) then begin
      m[col].i3:=m[col].i3+lbd_sf.Fieldbyname('kol').AsInteger;m[col].j3:=m[col].j3+lbd_sf.Fieldbyname('kol_in').AsInteger;
      m[col].f3:=m[col].f3+lbd_sf.Fieldbyname('kol').AsFloat*lbd_sf.Fieldbyname('sotish').AsFloat;
      m[col].sena:=Fieldbyname('sena').AsFloat;m[col].sena_in:=Fieldbyname('sena_in').AsFloat;
      m[col].sotish:=Fieldbyname('sotish').AsFloat;m[col].sotish_in:=Fieldbyname('sotish_in').AsFloat;
    end; // chiqim

    Next;
    progressl_lk.Percent:=Trunc((lbd_sf.RecNo)/lbd_sf.RecordCount*100);
  end; // while

    m[col].i4:=m[col].i1+m[col].i2-m[col].i3;bir:=1;
    if m[col].j1+m[col].j2+m[col].j3>0 then
      if (m[col].j1+m[col].j2<m[col].j3) or (tkol_in<=m[col].j3) then begin
        if tkol_in<=m[col].j3 then
        begin
          bir:=int(m[col].j3/tkol_in);
          m[col].j3:=m[col].j3-Trunc(bir)*tkol_in;
        end;
        m[col].i4:=m[col].i4-Trunc(bir);
        m[col].j4:=m[col].j3-(m[col].j1+m[col].j2+tkol_in);
        if m[col].j4<0 then m[col].j4:=0-m[col].j4;
      end
      else
        m[col].j4:=m[col].j1+m[col].j2-m[col].j3;
      m[col].f4:=m[col].f1+m[col].f2-m[col].f3;
    m[col].f4:=m[col].i4*m[col].sotish+m[col].j4*m[col].sotish_in;
  ExcelCreateApplication('Tovar aylanmasi', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  DisableControls;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=30;
  Sheet.Columns[3].ColumnWidth := 8;Sheet.Columns[4].ColumnWidth :=6;Sheet.Columns[5].ColumnWidth := 12;
  Sheet.Columns[6].ColumnWidth := 8;Sheet.Columns[7].ColumnWidth :=6;Sheet.Columns[8].ColumnWidth :=10;
  Sheet.Columns[9].ColumnWidth := 8;Sheet.Columns[10].ColumnWidth :=6;Sheet.Columns[11].ColumnWidth :=10;
  Sheet.Columns[12].ColumnWidth := 8;Sheet.Columns[13].ColumnWidth :=8;Sheet.Columns[14].ColumnWidth :=10;
  firstRow:=10;progressl_lk.Percent:=0;
  for i:=0 to col do begin
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);
    Sheet.Cells[firstrow+i,2]:=m[i].name;s:=inttostr(firstrow+i);
    Sheet.Cells[firstrow+i,3]:=m[i].i1;Sheet.Cells[firstrow+i,3].NumberFormat := '0';
    Sheet.Cells[firstrow+i,4]:=m[i].j1;Sheet.Cells[firstrow+i,4].NumberFormat := '0';
    Sheet.Cells[firstrow+i,5]:=m[i].f1;Sheet.Cells[firstrow+i,5].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,6]:=m[i].i2;Sheet.Cells[firstrow+i,6].NumberFormat := '0';
    Sheet.Cells[firstrow+i,7]:=m[i].j2;Sheet.Cells[firstrow+i,7].NumberFormat := '0';
    Sheet.Cells[firstrow+i,8]:=m[i].f2;Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,9]:=m[i].i3;Sheet.Cells[firstrow+i,9].NumberFormat := '0';
    Sheet.Cells[firstrow+i,10]:=m[i].j3;Sheet.Cells[firstrow+i,10].NumberFormat := '0';
    Sheet.Cells[firstrow+i,11]:=m[i].f3;Sheet.Cells[firstrow+i,11].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,12]:=m[i].i4;Sheet.Cells[firstrow+i,12].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,13]:=m[i].j4;Sheet.Cells[firstrow+i,13].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,14]:=m[i].f4;Sheet.Cells[firstrow+i,14].NumberFormat := '0,00';
    if col>0 then progressl_lk.Percent:=Trunc((i)/col*100);
  end;
  Sheet.Cells[firstRow-1,1] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2] := 'Nomi';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-2,3] := 'Boshlang`ich qoldiq';Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,3] := 'Asosiy';Sheet.Cells[firstRow-1,4] := 'Ishki';Sheet.Cells[firstRow-1,5] := 'Summasi';
  Sheet.Cells[firstRow-2,6] := 'Kirim';Sheet.Range['F'+IntToStr(firstrow-2)+':H'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,6] := 'Asosiy';Sheet.Cells[firstRow-1,7] := 'Ishki';Sheet.Cells[firstRow-1,8] := 'Summasi';
  Sheet.Cells[firstRow-2,9] := 'Chiqim';Sheet.Range['I'+IntToStr(firstrow-2)+':K'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,9] := 'Asosiy';Sheet.Cells[firstRow-1,10] := 'Ishki';Sheet.Cells[firstRow-1,11] := 'Summasi';
  Sheet.Cells[firstRow-2,12] := 'Ohirgi qoldiq';Sheet.Range['L'+IntToStr(firstrow-2)+':N'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,12] := 'Asosiy';Sheet.Cells[firstRow-1,13] := 'Ishki';Sheet.Cells[firstRow-1,14] := 'Summasi';

  inc(col);Sheet.Cells[firstrow+col,2] := 'Jami:';
  Sheet.Cells[firstrow+col,3].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,4].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,5].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,8].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,10].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,11].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,12].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,13].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,14].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  ustun:='N';
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
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Tovar aylanmasi';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end;

end;

procedure Totch_oborot_tovar.foydaClick(Sender: TObject);
var firstRow,i,ci,col,tid,tur:integer;s,ustun:string;
type MyType = record nn:Smallint;name:string[250];tur_oper,kol,kol_in,tid,dollar:Integer;sena,sena_in,sotish,sotish_in,sena_d,sena_in_d,sotish_d,sotish_in_d,ch,ch_in,foyda,foyda_d:Currency;end;
var m: Array of MyType;
begin
  progressl_lk.Percent:=0;
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=dan;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  if user.Value>0 then begin
    poisk[3]:=' a.user_id = '+IntToStr(user.Value);
    zapros.Text:=zapros.Text+' Sotuvchi = '+user.Text+'#';
  end;
  if haridor.Value>0 then begin
    poisk[4]:=' a.h_id = '+IntToStr(haridor.Value);
    zapros.Text:=zapros.Text+' Haridor = '+haridor.Text+'#';
  end;
  interval(dan.Value, gacha.Value, 1,'sana' ,'sana' ,' Sana ');
  if (poisk[1]>'') then sqltext.Text:=poisk[1];

  for i := 2 to 7 do begin
    if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i];
    sqltext.Text:=sqltext.Text+poisk[i];
  end;
  with lbd_sf do begin
  Close;SQL.Clear;
  SQL.Add('SELECT a.tur_oper,s.sena,s.sena_in,s.sena_d,s.sena_in_d,s.sotish,s.sotish_in,s.sotish_d,s.sotish_in_d,a.dollar,');
  SQL.Add('sum(if(a.dollar=1,0,');
  SQL.Add('s.kol*s.sotish+s.kol_in*if(s.sotish_in is null,0,s.sotish_in)-(s.kol*s.sena+s.kol_in*if(s.sena_in is null,0,s.sena_in)))) as foyda,');
  SQL.Add('sum(if(a.dollar <> 0,(s.kol * s.sotish_d + s.kol_in * if(s.sotish_in_d is null, 0, s.sotish_in_d)-(s.kol * s.sena_d + s.kol_in * if(s.sena_in_d is null,0,s.sena_in_d))),0)) as foyda_d,');
  SQL.Add('sum(s.kol) as kol,sum(s.kol_in) as kol_in,sum(s.kol*s.sotish) as ch,sum(s.kol_in*s.sotish_in) as ch_in,t.nom as tnom,t.id as tid from s_tovar t,asos a,asos_slave s ');
  SQL.Add('WHERE a.client_id='+admin_id+' and a.id=s.asos_id and t.id=s.tovar_id and s.del_flag=1 and a.tur_oper in (2,3) and '+sqltext.Text+' group by t.nom,a.tur_oper,a.dollar order by t.nom');
  //zapros.Text:=sql.Text;exit;
  Open;
  if lbd_sf.RecordCount=0 then begin
    ShowMessage('Ma`lumot y`oq');
    exit;
  end;
  SetLength(m, 0);col:=0;tid:=0;tur:=0;
  while not Eof do begin
    //if (col=0) then
    //SetLength(m, Length(m)+1);
    //if (col>0) and (Fieldbyname('tid').Value<>tid) then
    SetLength(m, Length(m)+1);
    tid:=Fieldbyname('tid').Value;tur:=Fieldbyname('tur_oper').Value;
    m[col].tid:=Fieldbyname('tid').Value;
    m[col].tur_oper:=Fieldbyname('tur_oper').Value;
    m[col].dollar:=Fieldbyname('dollar').Value;
    m[col].name:=Fieldbyname('tnom').Value;
    m[col].tur_oper:=Fieldbyname('tur_oper').AsInteger;
    m[col].kol:=Fieldbyname('kol').AsInteger;
    m[col].kol_in:=Fieldbyname('kol_in').AsInteger;
    if(lbd_sf.Fieldbyname('dollar').AsInteger<>0) then
    begin
      m[col].sena_d:=Fieldbyname('sena_d').AsFloat;
      m[col].sena_in_d:=Fieldbyname('sena_in_d').AsFloat;
      m[col].sotish_d:=Fieldbyname('sotish_d').AsFloat;
      m[col].sotish_in_d:=Fieldbyname('sotish_in_d').AsFloat;
      if Fieldbyname('tur_oper').AsInteger=2 then
        m[col].foyda_d:=Fieldbyname('foyda_d').AsFloat
      else
        m[col].foyda_d:=-Fieldbyname('foyda_d').AsFloat;
      m[col].nn:=col;
    end
    else
    begin
      m[col].sena:=Fieldbyname('sena').AsFloat;
      m[col].sena_in:=Fieldbyname('sena_in').AsFloat;
      m[col].sotish:=Fieldbyname('sotish').AsFloat;
      m[col].sotish_in:=Fieldbyname('sotish_in').AsFloat;
      if Fieldbyname('tur_oper').AsInteger=2 then
        m[col].foyda:=Fieldbyname('foyda').AsFloat
      else
        m[col].foyda:=-Fieldbyname('foyda').AsFloat;
      m[col].nn:=col;
    end;
    m[col].ch:=Fieldbyname('ch').AsFloat;
    m[col].ch_in:=Fieldbyname('ch_in').AsFloat;

    inc(col);
    Next;
    progressl_lk.Percent:=Trunc((lbd_sf.RecNo)/lbd_sf.RecordCount*100);
  end; // while
  ExcelCreateApplication('Foyda', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  DisableControls;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=35;Sheet.Columns[3].ColumnWidth := 8;
  Sheet.Columns[4].ColumnWidth :=10;Sheet.Columns[5].ColumnWidth := 12;Sheet.Columns[6].ColumnWidth := 12;
  Sheet.Columns[7].ColumnWidth :=10;Sheet.Columns[8].ColumnWidth :=12;Sheet.Columns[9].ColumnWidth := 12;
  Sheet.Columns[10].ColumnWidth := 12;Sheet.Columns[11].ColumnWidth := 12;
  firstRow:=10;progressl_lk.Percent:=0;ci:=0;tid:=m[0].tid;tur:=m[0].tur_oper;
  for i:=0 to col-1 do begin
    if (m[i].tur_oper=tur) and (m[i].tid=tid) and (i>0) then
    begin
      ci:=ci;m[i].kol:=m[i].kol+m[i-1].kol;
    end
    else
    begin  if i=0 then ci:=0 else ci:=ci+1;end;
    Sheet.Cells[firstrow+ci,1]:=inttostr(ci+1);
    tid:=m[i].tid;tur:=m[i].tur_oper;
    if m[i].tur_oper=3 then begin
      Sheet.Cells[firstrow+ci,1].Interior.ColorIndex := 6;Sheet.Cells[firstrow+ci,2].Interior.ColorIndex := 6;
      Sheet.Cells[firstrow+ci,3].Interior.ColorIndex := 6;Sheet.Cells[firstrow+ci,4].Interior.ColorIndex := 6;
      Sheet.Cells[firstrow+ci,5].Interior.ColorIndex := 6;Sheet.Cells[firstrow+ci,6].Interior.ColorIndex := 6;
      Sheet.Cells[firstrow+ci,7].Interior.ColorIndex := 6;Sheet.Cells[firstrow+ci,8].Interior.ColorIndex := 6;
      Sheet.Cells[firstrow+ci,9].Interior.ColorIndex := 6;Sheet.Cells[firstrow+ci,10].Interior.ColorIndex := 6;
      Sheet.Cells[firstrow+ci,11].Interior.ColorIndex := 6;
    end;
    Sheet.Cells[firstrow+ci,2]:=m[i].name;s:=inttostr(firstrow+ci);
    Sheet.Cells[firstrow+ci,3]:=m[i].sena;Sheet.Cells[firstrow+ci,3].NumberFormat := '0';
    Sheet.Cells[firstrow+ci,4]:=m[i].kol;Sheet.Cells[firstrow+ci,4].NumberFormat := '0';
    Sheet.Cells[firstrow+ci,5]:=m[i].sotish;Sheet.Cells[firstrow+ci,5].NumberFormat := '### ### ###0';
    Sheet.Cells[firstrow+ci,6]:=m[i].ch;Sheet.Cells[firstrow+ci,6].NumberFormat := '### ### ###0';
    Sheet.Cells[firstrow+ci,7]:=m[i].kol_in;Sheet.Cells[firstrow+ci,7].NumberFormat := '### ### ###0';
    Sheet.Cells[firstrow+ci,8]:=m[i].sotish_in;Sheet.Cells[firstrow+ci,8].NumberFormat := '### ### ##0,00';
    Sheet.Cells[firstrow+ci,9]:=m[i].ch_in;Sheet.Cells[firstrow+ci,9].NumberFormat := '### ### ##0,00';
    if m[i].dollar<>1 then begin
      Sheet.Cells[firstrow+ci,10]:=m[i].foyda;Sheet.Cells[firstrow+ci,10].NumberFormat := '### ### ###0';
    end
    else
    begin
      Sheet.Cells[firstrow+ci,11]:=m[i].foyda_d;Sheet.Cells[firstrow+ci,11].NumberFormat := '### ### ##0,00';
    end;
    if col>0 then progressl_lk.Percent:=Trunc((i)/col*100);
  end;
  Sheet.Cells[firstRow-1,1] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2] := 'Tovar nomi';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-2,3] := 'kirim';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-2,4] := 'Asosiy tovar';Sheet.Range['D'+IntToStr(firstrow-2)+':F'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,4] := 'Soni';Sheet.Cells[firstRow-1,5] := 'Narhi';Sheet.Cells[firstRow-1,6] := 'Summasi';
  Sheet.Cells[firstRow-2,7] := 'Ichki tovar';Sheet.Range['G'+IntToStr(firstrow-2)+':I'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,8] := 'Soni';Sheet.Cells[firstRow-1,8] := 'Narhi';Sheet.Cells[firstRow-1,9] := 'Summasi';
  Sheet.Cells[firstRow-2,10] := 'Foyda';Sheet.Range['J'+IntToStr(firstrow-2)+':J'+IntToStr(firstrow-1)].merge;//inc(col);
  Sheet.Cells[firstRow-2,11] := 'Foyda_d';Sheet.Range['K'+IntToStr(firstrow-2)+':K'+IntToStr(firstrow-1)].merge;//inc(col);
  ci:=ci+1;
  Sheet.Cells[firstrow+ci,2] := 'Jami:';
  Sheet.Cells[firstrow+ci,4].formula := '=SUM(R[-1]C:R[-'+IntToStr(ci)+']C)';
  Sheet.Cells[firstrow+ci,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(ci)+']C)';
  Sheet.Cells[firstrow+ci,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(ci)+']C)';
  Sheet.Cells[firstrow+ci,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(ci)+']C)';
  Sheet.Cells[firstrow+ci,10].formula := '=SUM(R[-1]C:R[-'+IntToStr(ci)+']C)';
  Sheet.Cells[firstrow+ci,11].formula := '=SUM(R[-1]C:R[-'+IntToStr(ci)+']C)';
  ustun:='K';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+ci)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+ci)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+ci)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+ci)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Foyda';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end;

end;

procedure Totch_oborot_tovar.chegirmaClick(Sender: TObject);
var firstRow,i,col:integer;s,ustun:string;
type MyType = record nn:Smallint;sana,diler_id,s_xodim:string[50];kol:Integer;summa,cheg_n,cheg_p,sum_naqd,sum_plastik:Currency;end;
var m: Array of MyType;
begin
  progressl_lk.Percent:=0;
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=dan;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  if user.Value>0 then begin
    poisk[3]:=' user_id = '+IntToStr(user.Value);
    zapros.Text:=zapros.Text+' Sotuvchi = '+user.Text+'#';
  end;
  interval(dan.Value, gacha.Value, 1,'sana' ,'sana' ,' Sana ');
  if (poisk[1]>'') then
  sqltext.Text:=poisk[1];
  for i := 2 to 7 do begin if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i]; sqltext.Text:=sqltext.Text+poisk[i];end;
  with dms.asos do begin
  Close;SQL.Clear;
  SQL.Add('SELECT * from asos ');
  SQL.Add('WHERE client_id='+admin_id+' and del_flag=1 and tur_oper=2 and (cheg_n>0 or cheg_p>0) and '+sqltext.Text+' order by sana');
  //zapros.Text:=sql.Text;exit;
  Open;
  SetLength(m, 0);col:=0;
  while not Eof do begin
    SetLength(m, Length(m)+1);m[col].diler_id:=Fieldbyname('diler_id').AsString;m[col].s_xodim:=Fieldbyname('s_xodim').AsString;
    m[col].kol:=Fieldbyname('kol').AsInteger;m[col].summa:=Fieldbyname('summa').AsInteger;m[col].sana:=Fieldbyname('sana').AsString;
    m[col].cheg_n:=Fieldbyname('cheg_n').AsFloat;m[col].cheg_p:=Fieldbyname('cheg_p').AsFloat;
    m[col].sum_naqd:=Fieldbyname('sum_naqd').AsFloat;m[col].sum_plastik:=Fieldbyname('sum_plastik').AsFloat;
    m[col].nn:=col;
    inc(col);
    Next;
    progressl_lk.Percent:=Trunc((RecNo)/RecordCount*100);
  end; // while
  ExcelCreateApplication('Chegirma', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  DisableControls;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=12;Sheet.Columns[3].ColumnWidth := 9;
  Sheet.Columns[4].ColumnWidth :=10;Sheet.Columns[5].ColumnWidth := 9;Sheet.Columns[6].ColumnWidth := 15;
  Sheet.Columns[7].ColumnWidth :=10;Sheet.Columns[8].ColumnWidth :=15;Sheet.Columns[9].ColumnWidth := 10;
  firstRow:=10;progressl_lk.Percent:=0;
  for i:=0 to col-1 do begin
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);
    Sheet.Cells[firstrow+i,2]:=m[i].diler_id;s:=inttostr(firstrow+i);
    Sheet.Cells[firstrow+i,3]:=m[i].sana;
    Sheet.Cells[firstrow+i,4]:=m[i].s_xodim;
    Sheet.Cells[firstrow+i,5]:=m[i].kol;Sheet.Cells[firstrow+i,5].NumberFormat := '0';
    Sheet.Cells[firstrow+i,6]:=m[i].sum_naqd;Sheet.Cells[firstrow+i,6].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,7]:=m[i].cheg_n;Sheet.Cells[firstrow+i,7].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,8]:=m[i].sum_plastik;Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,9]:=m[i].cheg_p;Sheet.Cells[firstrow+i,9].NumberFormat := '0,00';
    if col>0 then progressl_lk.Percent:=Trunc((i)/col*100);
  end;
  Sheet.Cells[firstRow-1,1] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2] := 'Chek/n';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,3] := 'sana';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,4] := 'Sotuvchi';Sheet.Range['D'+IntToStr(firstrow-2)+':D'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,5] := 'Soni';Sheet.Range['E'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-2,6] := 'Naqd';Sheet.Range['F'+IntToStr(firstrow-2)+':G'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,6] := 'Summa';Sheet.Cells[firstRow-1,7] := 'Cheg.';
  Sheet.Cells[firstRow-2,8] := 'Plastik';Sheet.Range['H'+IntToStr(firstrow-2)+':I'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,8] := 'Summa';Sheet.Cells[firstRow-1,9] := 'Cheg.';
  Sheet.Cells[firstrow+col,2] := 'Jami:';
  Sheet.Cells[firstrow+col,5].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
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
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Foyda';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end;

end;

end.
