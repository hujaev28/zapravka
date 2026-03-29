unit fqarzdorlik_diler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,db, GridsEh, Menus, SUIPopupMenu, DBGridEh, StdCtrls,
  Mask, RzEdit, ExtCtrls, RzPanel, RzPopups, RzLabel, DBCtrlsEh, DBLookupEh,
  RzButton, ZAbstractRODataset, ZAbstractDataset, ZDataset;
type
  Tqarzdorlik_diler = class(TForm)
    g_asos: TDBGridEh;
    Tovarlar: TDBGridEh;
    k_asos_holat: TsuiPopupMenu;
    MenuItem4: TMenuItem;
    Rahbartomonidantahrirlashuchunbekorqilindi1: TMenuItem;
    GroupBox1: TGroupBox;
    danc: TRzCalendar;
    dan: TRzDateTimeEdit;
    gachac: TRzCalendar;
    gacha: TRzDateTimeEdit;
    RzLabel2: TRzLabel;
    poisk_group: TGroupBox;
    lnom: TLabel;
    nom: TEdit;
    clientnom: TDBLookupComboboxEh;
    gpl: TDBGridEh;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    danq: TRzNumericEdit;
    Label2: TLabel;
    gachaq: TRzNumericEdit;
    AKT: TRzBitBtn;
    zapros: TRzEdit;
    sqltext: TRzEdit;
    Label3: TLabel;
    chiqim: TRzNumericEdit;
    Label4: TLabel;
    kirim: TRzNumericEdit;
    Reestr: TRzBitBtn;
    tovarlar_komil: TDBGridEh;
    danqd: TRzNumericEdit;
    gachaqd: TRzNumericEdit;
    chiqimd: TRzNumericEdit;
    kirimd: TRzNumericEdit;
    aktnew: TRzBitBtn;
    sm_out: TDBGridEh;
    main: TZQuery;
    Dmain: TDataSource;
    Reestrnew: TRzBitBtn;
    gclient: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Rahbartomonidantahrirlashuchunbekorqilindi1Click(
      Sender: TObject);
    procedure dancChange(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure clientnomEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure gachacChange(Sender: TObject);
    procedure danChange(Sender: TObject);
    procedure gachaChange(Sender: TObject);
    procedure clientnomChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReestrClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GroupBox1DblClick(Sender: TObject);
    procedure aktnewClick(Sender: TObject);
    procedure AKTClick(Sender: TObject);
    procedure ReestrnewClick(Sender: TObject);
    procedure gclientCellClick(Column: TColumnEh);
    procedure gclientDblClick(Sender: TObject);
  private
     procedure interval(int1,int2:Variant;massiv:Integer;z,w,s:String);
  public
    { Public declarations }
  end;

var
  qarzdorlik_diler: Tqarzdorlik_diler;
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
  poisk: array [1..27] of String;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );


implementation

{$R *.dfm}
uses fdms, comobj,StrUtils, fsetup, fs_diler;
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

function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure Tqarzdorlik_diler.interval(int1,int2:Variant;massiv:Integer;z,w,s:String);
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
procedure Tqarzdorlik_diler.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tqarzdorlik_diler.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tqarzdorlik_diler.FormCreate(Sender: TObject);
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
procedure Tqarzdorlik_diler.MenuItem4Click(Sender: TObject);
begin
  dms.k_asos.Edit;dms.k_asosprint_flag.Value:=1;dms.k_asos.post;
end;

procedure Tqarzdorlik_diler.Rahbartomonidantahrirlashuchunbekorqilindi1Click(Sender: TObject);
begin
  dms.k_asos.Edit;dms.k_asosprint_flag.Value:=0;dms.k_asos.post;
end;

procedure Tqarzdorlik_diler.dancChange(Sender: TObject);
begin
  dan.Date:=danc.Date;
  clientnomChange(Sender);
end;

procedure Tqarzdorlik_diler.nomKeyPress(Sender: TObject; var Key: Char);
var s,ss:String;
begin
  if Key<>#13 then exit;
  if nom.Text='' then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);exit;end;
  dms.s_diler.Close;dms.s_diler.SQL.Clear;S:=nom.Text;
  if (Length(nom.Text)=9) and ((S[9] in ['0'..'9']) or (S[1] in ['0'..'9'])) then
    dms.s_diler.SQL.Add('select * from s_diler WHERE del_flag=1 and '+ss+'(inn = "'+nom.Text+'")')
  else
    dms.s_diler.SQL.Add('select * from s_diler WHERE del_flag=1 and ((nom like "%'+lat_kril(nom.Text)+'%") or (nom like "%'+nom.Text+'%")) order by nom');
  dms.s_diler.open;dms.s_diler.First;
  if dms.s_diler.RecordCount=0 then exit;
  clientnom.Value:=dms.s_diler.fieldbyname('id').Value;

end;

procedure Tqarzdorlik_diler.clientnomEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dms.s_diler.Close;dms.s_diler.SQL.Clear;
  dms.s_diler.SQL.Add('select * from s_diler WHERE del_flag=1 order by nom');
  dms.s_diler.open;
  dms.s_diler.First;
end;

procedure Tqarzdorlik_diler.gachacChange(Sender: TObject);
begin
  gacha.Date:=gachac.Date;clientnomChange(Sender);
end;

procedure Tqarzdorlik_diler.danChange(Sender: TObject);
begin
  danc.Date:=dan.Date;clientnomChange(Sender);
end;

procedure Tqarzdorlik_diler.gachaChange(Sender: TObject);
begin
  gachac.Date:=gacha.Date;clientnomChange(Sender);
end;

procedure Tqarzdorlik_diler.clientnomChange(Sender: TObject);
var b,e,bd,ed:Currency;
begin
  if dms.s_diler.Active=false then exit;
  if dan.Date=null then exit;
  if clientnom.value=null then exit;
  b:=0;e:=0;bd:=0;ed:=0;
  // dastlabki qarz     dms.main_link.SQL.Add('select sum(sum_d) as summa,0 as sum_d from asos where del_flag=1 and tur_oper in (1,5) and diler_id='+inttostr(clientnom.value)+' and sana >'+kasaya(dms.s_clientbux.AsDateTime))

  dms.main_link.Close;dms.main_link.SQL.Clear;
  if dms.s_clientdollar.AsInteger=2 then
    dms.main_link.SQL.Add('select sum(sum_d) as sum_d,0 as summa from asos where del_flag=1 and tur_oper in (1,5) and diler_id='+inttostr(clientnom.value)+' and sana >'+kasaya(dms.s_clientbux.AsDateTime))
  else
    dms.main_link.SQL.Add('select sum(if(dollar=1,0,summa)) as summa,sum(sum_d) as sum_d from asos where del_flag=1 and tur_oper in (1,5) and diler_id='+inttostr(clientnom.value)+' and sana >'+kasaya(dms.s_clientbux.AsDateTime));

  dms.main_link.SQL.Add(' and sana < '+kasaya(dan.Date)+' order by id');
  dms.main_link.open;
  e:=dms.main_link.fieldbyname('summa').AsFloat;
  ed:=dms.main_link.fieldbyname('sum_d').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  if dms.s_clientdollar.AsInteger=2 then
    dms.main_link.SQL.Add('select konv,sena_pl,sena_d,vid from pl WHERE del_flag=1 and diler_id='+inttostr(clientnom.value)+'  ') //sena_d as sena_pl,
  else
    dms.main_link.SQL.Add('select konv,sena_pl,sena_d,vid from pl WHERE del_flag=1 and diler_id='+inttostr(clientnom.value)+'  ');

  dms.main_link.SQL.Add(' and d_pl < '+kasaya(dan.Date)+' order by id');
  dms.main_link.open;b:=0;bd:=0;
  while not dms.main_link.eof do begin
    if (dms.main_link.fieldbyname('vid').AsInteger=9) or (dms.main_link.fieldbyname('vid').AsInteger=15) then
    begin
      if dms.main_link.fieldbyname('konv').AsVariant>0 then
      begin
        if dms.main_link.fieldbyname('konv').AsInteger=1 then
          ed:=ed+dms.main_link.fieldbyname('sena_d').AsFloat else e:=e+dms.main_link.fieldbyname('sena_pl').AsFloat;
      end
      else
      begin
        e:=e+dms.main_link.fieldbyname('sena_pl').AsFloat;
        //if dms.s_clientdollar.AsInteger<>2 then
        ed:=ed+dms.main_link.fieldbyname('sena_d').AsFloat;
      end;
    end;
    if (dms.main_link.fieldbyname('vid').AsInteger=3) or (dms.main_link.fieldbyname('vid').AsInteger=14) then begin
      if dms.main_link.fieldbyname('konv').AsVariant>0 then
      begin
        if dms.main_link.fieldbyname('konv').AsInteger=1 then
          bd:=bd+dms.main_link.fieldbyname('sena_d').AsFloat else b:=b+dms.main_link.fieldbyname('sena_pl').AsFloat;
      end
      else
      begin
        b:=b+dms.main_link.fieldbyname('sena_pl').AsFloat;
        //if dms.s_clientdollar.AsInteger<>2 then
          bd:=bd+dms.main_link.fieldbyname('sena_d').AsFloat;
      end;
    end;
    dms.main_link.Next;
  end;
  danq.Value:=b-e;danqd.Value:=bd-ed;

  dms.main_link.Close;dms.main_link.SQL.Clear;
  if dms.s_clientdollar.AsInteger=2 then
    dms.main_link.SQL.Add('select sum(sum_d) as sum_d, 0 as summa from asos where del_flag=1 and tur_oper in (1,5) and diler_id='+inttostr(clientnom.value)+' and sana >'+kasaya(dms.s_clientbux.AsDateTime))
  else
    dms.main_link.SQL.Add('select sum(if(dollar=1,0,summa)) as summa,sum(sum_d) as sum_d from asos where del_flag=1 and tur_oper in (1,5) and diler_id='+inttostr(clientnom.value)+' and sana >'+kasaya(dms.s_clientbux.AsDateTime));

  dms.main_link.SQL.Add(' and sana between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by id');
  dms.main_link.open;
  // zapros.Text:=dms.main_link.SQL.Text;exit;

  e:=dms.main_link.fieldbyname('summa').AsFloat;
  ed:=dms.main_link.fieldbyname('sum_d').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
    //dms.main_link.SQL.Add('select konv,sena_d as sena_pl,vid from pl WHERE del_flag=1 and diler_id='+inttostr(clientnom.value)+'  ')
  if dms.s_clientdollar.AsInteger=2 then
    dms.main_link.SQL.Add('select konv,sena_pl,sena_d,vid from pl WHERE del_flag=1 and diler_id='+inttostr(clientnom.value)+'  ')
  else
    dms.main_link.SQL.Add('select konv,sena_pl,sena_d,vid from pl WHERE del_flag=1 and diler_id='+inttostr(clientnom.value)+'  ');

  dms.main_link.SQL.Add(' and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by id');
  dms.main_link.open;b:=0;bd:=0;
  while not dms.main_link.eof do begin
    if (dms.main_link.fieldbyname('vid').AsInteger=9) or (dms.main_link.fieldbyname('vid').AsInteger=15) then
    begin
      if dms.main_link.fieldbyname('konv').AsVariant>0 then
      begin
        if dms.main_link.fieldbyname('konv').AsInteger=1 then
          ed:=ed+dms.main_link.fieldbyname('sena_d').AsFloat else e:=e+dms.main_link.fieldbyname('sena_pl').AsFloat;
      end
      else
      begin
        e:=e+dms.main_link.fieldbyname('sena_pl').AsFloat;
        //if dms.s_clientdollar.AsInteger<>2 then
        ed:=ed+dms.main_link.fieldbyname('sena_d').AsFloat;
      end;
    end;
    if (dms.main_link.fieldbyname('vid').AsInteger=3) or (dms.main_link.fieldbyname('vid').AsInteger=14) then begin
      if dms.main_link.fieldbyname('konv').AsVariant>0 then
      begin
        if dms.main_link.fieldbyname('konv').AsInteger=1 then
          bd:=bd+dms.main_link.fieldbyname('sena_d').AsFloat else b:=b+dms.main_link.fieldbyname('sena_pl').AsFloat;
      end
      else
      begin
        b:=b+dms.main_link.fieldbyname('sena_pl').AsFloat;
        //if dms.s_clientdollar.AsInteger<>2 then
          bd:=bd+dms.main_link.fieldbyname('sena_d').AsFloat;
      end;
    end;
    dms.main_link.Next;
  end;
  chiqim.Value:=e;chiqimd.Value:=ed;kirim.Value:=b;kirimd.Value:=bd;
  gachaq.Value:=danq.Value+(b-e);gachaqd.Value:=danqd.Value+(bd-ed);
  //s_diler.gachaq.Value:=gachaq.Value;s_diler.gachaqd.Value:=gachaqd.Value;
  dms.k_asos.Close;dms.k_asos.SQL.Clear;
  dms.k_asos.SQL.Add('select * from asos where del_flag=1 and tur_oper in (1,5) and diler_id='+inttostr(clientnom.value)+' and sana >'+kasaya(dms.s_clientbux.AsDateTime));
  dms.k_asos.SQL.Add(' and sana between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by id');
  dms.k_asos.open;
  DMS.k_slave1.open;
  dms.tpl.Close;dms.tpl.SQL.Clear;
  dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and diler_id='+inttostr(clientnom.value)+'  ');
  dms.tpl.SQL.Add(' and d_pl between '+kasaya(dan.Date)+' and '+kasaya(gacha.Date)+' order by id');
  dms.tpl.open;
end;

procedure Tqarzdorlik_diler.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  //dan.Date:=null;clientnom.value:=null;
end;

procedure Tqarzdorlik_diler.ReestrClick(Sender: TObject);
var firstRow,i,col:integer;s,ustun:string;
type MyType = record nn:Smallint;name:string[250];kol,kol_in:Integer;sotish,sotish_in,ch,ch_in,foyda:Currency;end;
var m: Array of MyType;
begin
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=dan;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  interval(dan.Date, gacha.Date, 1,'sana' ,'sana' ,' Sana ');
  if (poisk[1]>'') then
  sqltext.Text:=poisk[1];
  for i := 2 to 7 do begin
    if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i];
    sqltext.Text:=sqltext.Text+poisk[i];
  end;
  ExcelCreateApplication('Mol etkazuvchi qarzdorligi', 1,1, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;firstRow:=10;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=25;Sheet.Columns[3].ColumnWidth := 18;
  Sheet.Columns[4].ColumnWidth :=12;Sheet.Columns[5].ColumnWidth := 12;Sheet.Columns[6].ColumnWidth := 10;
  Sheet.Columns[7].ColumnWidth :=10;Sheet.Columns[8].ColumnWidth := 8;
  Sheet.Columns[9].ColumnWidth := 18;Sheet.Columns[10].ColumnWidth := 12;
  Sheet.Cells[firstRow-1,1] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2] := 'Diler nomi';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,3] := 'Dastlabki qoldiq';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,4] := 'Dollar';Sheet.Range['D'+IntToStr(firstrow-2)+':D'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-2,5] := 'Oraliq';Sheet.Range['E'+IntToStr(firstrow-2)+':H'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,5] := 'Kirim';Sheet.Cells[firstRow-1,6] := 'Dollar';
  Sheet.Cells[firstRow-1,7] := 'Chiqim';Sheet.Cells[firstRow-1,8] := 'Dollar';
  Sheet.Cells[firstRow-1,9] := 'Oxirgi qoldiq';Sheet.Range['I'+IntToStr(firstrow-2)+':I'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,10] := 'Oxirgi qoldiq';Sheet.Range['J'+IntToStr(firstrow-2)+':J'+IntToStr(firstrow-1)].merge;
  col:=0;dms.s_diler.first;
  for i:=0 to dms.s_diler.RecordCount-1 do begin
    clientnom.Value:=dms.s_dilerid.Value;
    clientnomChange(Sender);
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);
    Sheet.Cells[firstrow+i,2]:=dms.s_dilernom.AsString;
    Sheet.Cells[firstrow+i,3]:=FloatToStr(danq.Value);Sheet.Cells[firstrow+i,3].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,4]:=FloatToStr(danqd.Value);Sheet.Cells[firstrow+i,4].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,5]:=FloatToStr(chiqim.Value);Sheet.Cells[firstrow+i,5].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,6]:=FloatToStr(chiqimd.Value);Sheet.Cells[firstrow+i,6].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,7]:=FloatToStr(kirim.Value);Sheet.Cells[firstrow+i,7].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,8]:=FloatToStr(kirimd.Value);Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,9]:=FloatToStr(gachaq.Value);Sheet.Cells[firstrow+i,9].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,10]:=FloatToStr(gachaqd.Value);Sheet.Cells[firstrow+i,10].NumberFormat := '0,00';
    dms.s_diler.Next;
  end;
  //inc(col);
  Sheet.Cells[firstrow+i,2] := 'Jami:';
  Sheet.Cells[firstrow+i,3].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,4].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,5].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,8].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  Sheet.Cells[firstrow+i,10].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';
  ustun:='J';
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

  Sheet.Cells[2,1]:='Diler bilan hisob-kitob ';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;

end;

procedure Tqarzdorlik_diler.FormActivate(Sender: TObject);
begin
  if dms.s_clientdollar.AsInteger=1 then tovarlar_komil.Visible:=true else tovarlar_komil.Visible:=false;
  if dms.s_clientdollar.AsInteger=1 then Tovarlar.Visible:=false else tovarlar.Visible:=true;
end;

procedure Tqarzdorlik_diler.GroupBox1DblClick(Sender: TObject);
begin
  danc.Visible:=true;dan.Visible:=true;
end;

procedure Tqarzdorlik_diler.aktnewClick(Sender: TObject);
var chs,chd,qs,qd:Currency;firstRow,y,i,l,r,col,sl,qator:integer;ustun:string;bsana:TDate;
begin
  if dms.s_haridor.Active=false then exit;
  if dan.Date=null then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select sana from asos WHERE del_flag=1 and diler_id='+DMS.s_dilerid.AsString+' order by sana limit 1');
  dms.link.open;
  if dms.link.RecordCount>0 then
  begin
    bsana:=dms.link.fieldbyname('sana').AsDateTime;
  end;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select d_pl from pl WHERE del_flag=1 and diler_id='+DMS.s_dilerid.AsString+' order by d_pl limit 1');
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
  clientnomChange(dms.s_diler);
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
    chs:=chs+dms.k_asossumma.AsFloat;
    chd:=chd+dms.k_asossum_d.AsFloat;
    qs:=qs+dms.k_asossumma.AsFloat;
    qd:=qd+dms.k_asossum_d.AsFloat;
    dms.k_slave1.First;
    for sl:=0 to dms.k_slave1.RecordCount-1 do begin
      main.First;
      while not main.eof do begin
        Sheet.Columns[main.RecNo+10].ColumnWidth :=15;
        Sheet.Cells[firstrow+qator,main.RecNo+10].NumberFormat := '@';
        Sheet.Cells[firstrow+qator,main.RecNo+10]:=main.FieldByName('serial').AsString;
        main.Next;
      end;
      Sheet.Cells[firstrow+qator,1]:=qator+1;
      Sheet.Cells[firstrow+qator,2]:=dms.k_slave1s_tovar.AsString;
      Sheet.Cells[firstrow+qator,3]:=dms.k_slave1kol.AsFloat;
      if dms.k_asosdollar.AsInteger=1 then begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ##0,00';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slave1sena_d.AsFloat;
      end
      else
      begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ###0';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slave1sena.AsFloat;
      end;
      Sheet.Cells[firstrow+qator,5].formula := '=RC[-2]*RC[-1]';
      if dms.k_asosdollar.AsInteger=1 then begin
        Sheet.Cells[firstrow+qator,5].NumberFormat := '### ### ##0,00';
      end
      else
      begin
        Sheet.Cells[firstrow+qator,5]:=dms.k_slave1kol.AsFloat*dms.k_slave1sena.AsFloat;
      end;
      inc(col);inc(qator);
      dms.k_slave1.Next;
    end;
    dms.k_asos.Next;

  end;y:=0;
  dms.tpl.First;l:=col;r:=0;y:=0;
  if ((chs-qs)+(chd-qd))>0 then begin
    Sheet.Cells[firstrow+r,8]:=chs-qs;
    Sheet.Cells[firstrow+r,8].NumberFormat := '### ### ###0';
    Sheet.Cells[firstrow+r,9]:=chd-qd;
    Sheet.Cells[firstrow+r,9].NumberFormat := '### ### ##0,00';
    Sheet.Cells[firstrow+r,10] := 'Savdo '+dms.asosqarz_izoh.AsString;
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
  Sheet.Cells[1,1]:='Mol etkazuvchi: '+clientnom.Text;Sheet.Range['A1:'+ustun+'1'].merge;Sheet.Cells[1,1].HorizontalAlignment := 3;
  //Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;

  Excel.ActiveWindow.DisplayGridLines:=False;
  //if fileExists(()+'c:\Форма.xls') then DeleteFile('c:\Форма.xls');
  //ExtractFilePath(Application.ExeName);
  Excel.ActiveWorkbook.SaveAs(setup.haridor.Text+'\'+dms.s_dilernom.AsString+'.xlsx');
  Excel.visible:=true;
  Application.Restore;
    dms.k_asos.EnableControls;
  dms.k_slave.EnableControls;

  //Excel := UnAssigned;
end;

procedure Tqarzdorlik_diler.AKTClick(Sender: TObject);
var firstRow,i,col,l,r,y:integer;s,ustun:string;
type MyType = record nn:Smallint;name:string[250];kol,kol_in:Integer;sotish,sotish_in,ch,ch_in,foyda:Currency;end;
var m: Array of MyType;
begin
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=dan;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  interval(dan.Date, gacha.Date, 1,'sana' ,'sana' ,' Sana ');
  if (poisk[1]>'') then
  sqltext.Text:=poisk[1];
  for i := 2 to 7 do begin
    if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i];
    sqltext.Text:=sqltext.Text+poisk[i];
  end;
  ExcelCreateApplication('Mol etkazuvchi', 1,2, false);
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
  inc(y);Sheet.Cells[firstRow-2,y] := 'Kirim';Sheet.Range['B'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,y] := 'Nomer';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Sana';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  inc(y);Sheet.Cells[firstRow-2,y] := 'Chiqim';Sheet.Range['F'+IntToStr(firstrow-2)+':I'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,y] := 'Nomer';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Sana';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Summa';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  dms.k_asos.First;col:=0;l:=0;r:=0;y:=1;
  for i:=0 to dms.k_asos.RecordCount-1 do begin
    Sheet.Cells[firstrow+i,y]:=inttostr(i+1);inc(col);
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.k_asosnomer.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.k_asossana.AsDateTime;

    //if dms.s_clientdollar.AsInteger<>1 then
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.k_asossumma.AsFloat;Sheet.Cells[firstrow+i,y].NumberFormat := '0,00';Sheet.Cells[firstrow+i,y].HorizontalAlignment := 4;
    //else
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.k_asossum_d.AsFloat;Sheet.Cells[firstrow+i,y].NumberFormat := '0,00';Sheet.Cells[firstrow+i,y].HorizontalAlignment := 4;

    dms.k_asos.Next;y:=1;
  end;
  dms.tpl.First;l:=col;r:=0;y:=0;
  for i:=0 to dms.tpl.RecordCount-1 do begin
    if (dms.tplvid.Value=9) or (dms.tplvid.Value=15) then
    begin
      y:=0;inc(y);Sheet.Cells[firstrow+l,y]:=inttostr(l);
      inc(y);Sheet.Cells[firstrow+l,y]:=dms.tpln_pl.AsString;
      inc(y);Sheet.Cells[firstrow+l,y]:=dms.tpld_pl.AsDateTime;
      {if dms.s_clientdollar.AsInteger=1 then
        Sheet.Cells[firstrow+l,4]:=dms.tplsena_d.AsFloat
      else
        Sheet.Cells[firstrow+l,4]:=dms.tplsena_pl.AsFloat;}
      inc(y);Sheet.Cells[firstrow+l,y]:=dms.tplsena_pl.AsFloat;
      Sheet.Cells[firstrow+l,y].NumberFormat := '0,00';Sheet.Cells[firstrow+l,y].HorizontalAlignment := 4;
      inc(y);Sheet.Cells[firstrow+l,y]:=dms.tplsena_d.AsFloat;
      Sheet.Cells[firstrow+l,y].NumberFormat := '0,00';Sheet.Cells[firstrow+l,y].HorizontalAlignment := 4;
      inc(l);
      //if col<=l then inc(col);
    end
    else
    begin
      y:=6;Sheet.Cells[firstrow+r,y]:=dms.tpln_pl.AsString;
      inc(y);Sheet.Cells[firstrow+r,y]:=dms.tpld_pl.AsDateTime;
      {if dms.s_clientdollar.AsInteger=1 then
        Sheet.Cells[firstrow+r,7]:=dms.tplsena_d.AsFloat
      else
        Sheet.Cells[firstrow+r,7]:=dms.tplsena_pl.AsFloat;}
      inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_pl.AsFloat;
      Sheet.Cells[firstrow+r,y].NumberFormat := '0,00';Sheet.Cells[firstrow+r,y].HorizontalAlignment := 4;
      //if dms.s_clientdollar.AsInteger=1 then begin
        inc(y);Sheet.Cells[firstrow+r,y]:=dms.tplsena_d.AsFloat;
        Sheet.Cells[firstrow+r,y].NumberFormat := '0,00';Sheet.Cells[firstrow+r,y].HorizontalAlignment := 4;
      //end;
      inc(r);
    end;
    if l>r then col:=l else col:=r;
    dms.tpl.Next;
  end;
  Sheet.Cells[firstrow-4,2] := 'Dastlabki qoldiq:';
  Sheet.Cells[firstrow-4,4] := danq.Text;
  Sheet.Cells[firstrow-4,5] := danqd.Text;
  Sheet.Cells[firstrow-4,5].NumberFormat := '0,00';
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
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+i)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Mol etkazuvchi: '+clientnom.Text;
  Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;

end;

procedure Tqarzdorlik_diler.ReestrnewClick(Sender: TObject);
var chs,chd,qs,qd:Currency;firstRow,y,i,l,r,col,sl,qator:integer;ustun:string;bsana:TDate;colh:integer;
begin
  if dms.s_diler.Active=false then exit;
  if dan.Date=null then exit;

  dms.s_diler.First;  colh:=1;
  ExcelCreateApplication(dms.s_dilernom.AsString, dms.s_haridor.RecordCount,2, false);
  while not dms.s_diler.Eof do begin
  Sheet := Excel.WorkBooks[1].Sheets[colh];
  Sheet.Name := DMS.s_dilernom.AsString;
  clientnom.value:=DMS.s_dilerid.AsInteger;
  clientnomChange(DMS.s_diler);
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select sana from asos WHERE del_flag=1 and diler_id='+DMS.s_dilerid.AsString+' order by sana limit 1');
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    bsana:=dms.link.fieldbyname('sana').AsDateTime;
  end;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select d_pl from pl WHERE del_flag=1 and diler_id='+DMS.s_dilerid.AsString+' order by d_pl limit 1');
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
  clientnomChange(dms.s_diler);
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
    chs:=chs+dms.k_asossumma.AsFloat;
    chd:=chd+dms.k_asossum_d.AsFloat;
    qs:=qs+dms.k_asossumma.AsFloat;
    qd:=qd+dms.k_asossum_d.AsFloat;
    dms.k_slave1.First;
    for sl:=0 to dms.k_slave1.RecordCount-1 do begin
      main.First;
      while not main.eof do begin
        Sheet.Columns[main.RecNo+10].ColumnWidth :=15;
        Sheet.Cells[firstrow+qator,main.RecNo+10].NumberFormat := '@';
        Sheet.Cells[firstrow+qator,main.RecNo+10]:=main.FieldByName('serial').AsString;
        main.Next;
      end;
      Sheet.Cells[firstrow+qator,1]:=qator+1;
      Sheet.Cells[firstrow+qator,2]:=dms.k_slave1s_tovar.AsString;
      Sheet.Cells[firstrow+qator,3]:=dms.k_slave1kol.AsFloat;
      if dms.k_asosdollar.AsInteger=1 then begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ##0,00';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slave1sena_d.AsFloat;
      end
      else
      begin
        Sheet.Cells[firstrow+qator,4].NumberFormat := '### ### ###0';
        Sheet.Cells[firstrow+qator,4]:=dms.k_slave1sena.AsFloat;
      end;
      Sheet.Cells[firstrow+qator,5].formula := '=RC[-2]*RC[-1]';
      if dms.k_asosdollar.AsInteger=1 then begin
        Sheet.Cells[firstrow+qator,5].NumberFormat := '### ### ##0,00';
      end
      else
      begin
        Sheet.Cells[firstrow+qator,5]:=dms.k_slave1kol.AsFloat*dms.k_slavesena.AsFloat;
      end;
      inc(col);inc(qator);
      dms.k_slave1.Next;
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
  Sheet.Cells[1,1]:='Mol etkazuvchi: '+clientnom.Text;Sheet.Range['A1:'+ustun+'1'].merge;Sheet.Cells[1,1].HorizontalAlignment := 3;
  //Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  DMS.s_diler.Next;inc(colh);
  end;
  Excel.ActiveWindow.DisplayGridLines:=False;
  //if fileExists(()+'c:\Форма.xls') then DeleteFile('c:\Форма.xls');
  //ExtractFilePath(Application.ExeName);

  Excel.ActiveWorkbook.SaveAs(setup.haridor.Text+'\diler'+DateToStr(date())+'.xlsx');
  Excel.visible:=true;
  Application.Restore;
    dms.k_asos.EnableControls;
  dms.k_slave1.EnableControls;

  //Excel := UnAssigned;
end;

procedure Tqarzdorlik_diler.gclientCellClick(Column: TColumnEh);
begin
  clientnom.Value:=DMS.s_dilerid.AsInteger;
  clientnomChange(DMS.s_diler);
end;

procedure Tqarzdorlik_diler.gclientDblClick(Sender: TObject);
begin
  s_diler.showmodal;
end;

end.







