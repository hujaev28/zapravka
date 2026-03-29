unit fpl_bank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, GridsEh, ExtCtrls, RzPanel, DBCtrlsEh, DBCtrls,db,
  RzDBCmbo, StdCtrls, RzButton, Mask, DBLookupEh, Grids,
  DBGrids, ImgList, RzBHints, RzTabs, Menus,
  SUIPopupMenu, RzEdit, RzDBEdit, RzRadGrp, RzLstBox, RzChkLst, WordXP,
  OleServer,ShellAPI, DBSumLst, frxDesgn, frxClass, RzStatus, RzDBStat,
  RzDBBnEd, Buttons, RzSpnEdt, RzCmboBx, frxPreview, RzRadChk, RzDBChk,
  RzShellDialogs, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdFTP,IdGlobal,IdFTPCommon,
  ComCtrls,ToolWin,IniFiles, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  frxDBSet;

type
  Tpl_bank = class(TForm)
    sqltext: TEdit;
    ImageList1: TImageList;
    Balloon: TRzBalloonHints;
    sfPage: TRzPageControl;
    Tab0: TRzTabSheet;
    newpl: TRzBitBtn;
    delpl: TRzBitBtn;
    Tab1: TRzTabSheet;
    ishi: TRzBitBtn;
    zapros: TRzEdit;
    xtur: TRzRadioGroup;
    xGroupyil: TRzGroupBox;
    xlyil: TLabel;
    xyil: TComboBox;
    xchorak: TRzRadioGroup;
    oi: TRzRadioGroup;
    xoraliq: TRzGroupBox;
    xldan: TLabel;
    xlgacha: TLabel;
    dan: TDBDateTimeEditEh;
    gacha: TDBDateTimeEditEh;
    sql: TRzEdit;
    TabSheet1: TRzTabSheet;
    RzRapidFireButton1: TRzRapidFireButton;
    Label12: TLabel;
    Label13: TLabel;
    Gridfile: TDBGridEh;
    see: TfrxPreview;
    c: TDBDateTimeEditEh;
    po: TDBDateTimeEditEh;
    yesfile: TRzBitBtn;
    nofile: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    nomfile: TEdit;
    Dpl: TDataSource;
    gpl: TZQuery;
    grpl: TDBGridEh;
    Gredit: TGroupBox;
    Label30: TLabel;
    n_pl: TDBNumberEditEh;
    Label31: TLabel;
    d_pl: TDBDateTimeEditEh;
    Label32: TLabel;
    sena_pl: TDBNumberEditEh;
    Label33: TLabel;
    diler: TDBLookupComboboxEh;
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
    ZQuery1: TZQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    DateField1: TDateField;
    StringField2: TStringField;
    StringField3: TStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    SmallintField3: TSmallintField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    DateField2: TDateField;
    SmallintField4: TSmallintField;
    StringField4: TStringField;
    DataSource1: TDataSource;
    gpldiler_id: TIntegerField;
    gplh_id: TIntegerField;
    gpldiler: TStringField;
    gplharidor: TStringField;
    gplharajat: TStringField;
    haridor: TDBLookupComboboxEh;
    vo: TDBLookupComboboxEh;
    Label21: TLabel;
    filtr_haridor: TDBLookupComboboxEh;
    filtr_diler: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    filtr_vid: TDBLookupComboboxEh;
    Label3: TLabel;
    filtr_x_tur: TDBLookupComboboxEh;
    s_vid: TDBLookupComboboxEh;
    RzBitBtn1: TRzBitBtn;
    gpltur: TStringField;
    gpls_plvid: TIntegerField;
    gpluser_id: TIntegerField;
    Label6: TLabel;
    inv: TRzDBLookupComboBox;
    gplinv_id: TIntegerField;
    lnom: TLabel;
    nom: TEdit;
    Label8: TLabel;
    konv: TDBComboBoxEh;
    Label5: TLabel;
    kurs: TDBNumberEditEh;
    Label4: TLabel;
    sena_d: TDBNumberEditEh;
    Label7: TLabel;
    Muddat: TDBDateTimeEditEh;
    gplsena_d: TFloatField;
    gplkonv: TIntegerField;
    gplkurs: TFloatField;
    gplsrok: TDateField;
    gplost_d: TFloatField;
    procedure ishiClick(Sender: TObject);
    procedure nosfClick(Sender: TObject);
    procedure yessfClick(Sender: TObject);
    procedure xturClick(Sender: TObject);
    procedure oiClick(Sender: TObject);
    procedure xyilChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure n_regKeyPress(Sender: TObject; var Key: Char);
    procedure newplClick(Sender: TObject);
    procedure delplClick(Sender: TObject);
    procedure grplDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gplAfterScroll(DataSet: TDataSet);
    procedure filtr_haridorEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure filtr_dilerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure filtr_x_turEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure filtr_vidEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure filtr_x_turEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure filtr_haridorEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure filtr_dilerEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure filtr_vidEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure s_vidChange(Sender: TObject);
    procedure gplAfterCancel(DataSet: TDataSet);
    procedure gplsena_plGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure lnomClick(Sender: TObject);
    procedure sena_plEnter(Sender: TObject);
    procedure sena_plExit(Sender: TObject);
    procedure sena_dExit(Sender: TObject);
    procedure sena_dEnter(Sender: TObject);
    procedure MuddatExit(Sender: TObject);
    procedure gplNewRecord(DataSet: TDataSet);
    procedure gplAfterEdit(DataSet: TDataSet);
    procedure gplAfterOpen(DataSet: TDataSet);
    procedure gplAfterPost(DataSet: TDataSet);
  private
    procedure interval(int1,int2:Variant;massiv:Integer;z:String);

  public
  end;

var
  pl_bank: Tpl_bank; YYYY, MM, DD: Word;
  poisk: array [1..27] of String;
  vchorak,voy,s1,s2:string;sena:Currency;
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
implementation

{$R *.dfm}

uses fdms,fulanish, DateUtils, Math,ZConnection, ComObj, ActiveX,fmain;   // ZDataset,
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
  except Exception.Create('ќшибка.  Excel не установлено !!! ');Excel := UnAssigned;
  end;
end;
function StrReplace(const Str, Str1, Str2: string): string;
// str - исходна€ строка
// str1 - подстрока, подлежаща€ замене
// str2 - замен€юща€ строка
var
  P, L: Integer;
begin
  Result := str;
  L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then
    begin
      Delete(Result, P, L); // удал€ем ее
      Insert(Str2, Result, P); // вставл€ем новую
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
procedure tpl_bank.interval(int1,int2:Variant;massiv:Integer;z:String);
begin
if int1<>Null or int2<>Null then
begin
  if (int1<>Null) and (int2<>Null) then
    if int1=int2 then
    begin
      poisk[massiv]:=' '+z+' = '+kasaya(int1);
      zapros.Text:=zapros.Text+z+' = '+DateToStr(int1)+'#';
    end
    else
    begin
      poisk[massiv]:=' '+z+' between '+kasaya(int1)+' and '+kasaya(int2);
      zapros.Text:=zapros.Text+z+' между '+DateToStr(int1)+' и '+DateToStr(int2)+'#';
    end;
  if (int1<>Null) and (int2=Null) then
    begin
      poisk[massiv]:=' '+z+' >= '+kasaya(int1);
      zapros.Text:=zapros.Text+z+' c '+DateToStr(int1)+' и позже #';
    end;
  if (int1=Null) and (int2<>Null) then
    begin
      poisk[massiv]:=' '+z+' <= '+kasaya(int2);
      zapros.Text:=zapros.Text+z+' c '+DateToStr(int2)+' и ранее #';
    end;
end;
end;
procedure Tpl_bank.oiClick(Sender: TObject);
begin
  xturClick(Sender);
end;

procedure Tpl_bank.xyilChange(Sender: TObject);
begin
  dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);xturClick(Sender);
end;
procedure Tpl_bank.ishiClick(Sender: TObject);
var i:integer;plus1,plus2:string;
begin
  zapros.Text:='';
  for i := 1 to 27 do poisk[i]:='';
  if filtr_haridor.Value>0 then
  begin
    poisk[1]:=' pl.h_id='+IntToStr(filtr_haridor.Value);
    zapros.Text:='Haridor = '+filtr_haridor.Text+'#';
  end;
  if filtr_diler.Value>0 then
  begin
    poisk[2]:=' pl.diler_id='+IntToStr(filtr_diler.Value);
    zapros.Text:='Diler = '+filtr_diler.Text+'#';
  end;
  if filtr_vid.Value>0 then
  begin
    poisk[3]:=' pl.vid='+IntToStr(filtr_vid.Value);
    zapros.Text:='to`lov turi = '+filtr_vid.Text+'#';
  end;
  if filtr_x_tur.Value>0 then
  begin
    poisk[4]:=' pl.vo='+IntToStr(filtr_x_tur.Value);
    zapros.Text:='Xarajat turi = '+filtr_x_tur.Text+'#';
  end;
  if StrToDate(dan.Text)>StrToDate(gacha.Text) then
  begin ShowMessage('Oraliq hato');ActiveControl:=dan;Exit;end;
  if (dan.Text<>'  .  .  ') then interval(dan.Value, gacha.Value, 5,'pl.d_pl' );

  sql.Text:='';
  if (poisk[1]>'') then sql.Text:=poisk[1];
  for i := 1 to 5 do
  begin
    if (sql.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i];
    sql.Text:=sql.Text+poisk[i];
  end;
  //if (sql.Text='') then exit;
  gpl.Close;gpl.SQL.Clear;
  gpl.SQL.Add('SELECT * FROM pl WHERE del_flag=1 and bank_id =1 and '+sql.Text+' order by d_pl');
  sql.Text:=gpl.SQL.Text;
  gpl.open;//gpl.Last;
  sfPage.TabIndex:=0;ActiveControl:=grpl;
end;

procedure Tpl_bank.nosfClick(Sender: TObject);
begin
  gpl.Cancel;
  sfPage.Pages[0].TabEnabled:=true;sfPage.Pages[1].TabEnabled:=true;sfPage.TabIndex:=0;
end;
procedure Tpl_bank.yessfClick(Sender: TObject);
begin
  //if pul.FieldByName('n_sf').AsString='' then begin ShowMessage('¬ведите є с-ф');ActiveControl:=n_sf;Exit; end;
  //if pul.FieldByName('d_sf').AsString='' then begin ShowMessage('¬ведите дату с-ф');ActiveControl:=d_sf;Exit; end;
  gpl.post;
end;

procedure Tpl_bank.xturClick(Sender: TObject);
begin
  zapros.Text:='';
  case xtur.ItemIndex of
  0: begin
      xGroupyil.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;xoraliq.Enabled:=False;
      dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);
      //if (clientnom.Value>0) then zapros.Text:=dms.s_client.fieldbyname('nom').AsString;
      zapros.Text:=zapros.Text+';'+xyil.Text+ ' год';
     end;
  1: begin
      xGroupyil.Enabled:=True;xchorak.Enabled:=True;oi.Enabled:=False;xoraliq.Enabled:=False;
      case xchorak.ItemIndex of
      0: begin dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.03.'+copy(xyil.Text,3,2);vchorak:='I';end;
      1: begin dan.Text:='01.04.'+copy(xyil.Text,3,2);gacha.Text:='30.06.'+copy(xyil.Text,3,2);vchorak:='II';end;
      2: begin dan.Text:='01.07.'+copy(xyil.Text,3,2);gacha.Text:='30.09.'+copy(xyil.Text,3,2);vchorak:='III';end;
      3: begin dan.Text:='01.10.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);vchorak:='IV';end;
      end;
      zapros.Text:=xyil.Text+' год ' +vchorak+ ' квартал';
     end;
  2: begin
      xGroupyil.Enabled:=True;oi.Enabled:=True;xchorak.Enabled:=False;xoraliq.Enabled:=False;
      case oi.ItemIndex of
      0: begin s1:='01.01.';s2:='.02.';voy:='€нвар'; end;
      1: begin s1:='01.02.';s2:='.03.';voy:='феврал';end;
      2: begin s1:='01.03.';s2:='.04.';voy:='март';  end;
      3: begin s1:='01.04.';s2:='.05.';voy:='апрел'; end;
      4: begin s1:='01.05.';s2:='.06.';voy:='май';   end;
      5: begin s1:='01.06.';s2:='.07.';voy:='июн';   end;
      6: begin s1:='01.07.';s2:='.08.';voy:='июл';   end;
      7: begin s1:='01.08.';s2:='.09.';voy:='август';end;
      8: begin s1:='01.09.';s2:='.10.';voy:='сент€бр';end;
      9: begin s1:='01.10.';s2:='.11.';voy:='окт€бр'; end;
      10: begin s1:='01.11.';s2:='.12.';voy:='но€бр'; end;
      11: begin s1:='01.12.';s2:='.01.';voy:='декабр';end;
      end;s2:='01'+s2+copy(xyil.Text,3,2);//ord(IsLeapYear(year)
      if oi.ItemIndex=11 then s2:=DateToStr(IncYear(strTodate(s2))-1) else s2:=DateToStr(strTodate(s2)-1);;
      dan.Text:=s1+copy(xyil.Text,3,2);gacha.Text:=s2;
      zapros.Text:=xyil.Text+' год ' +voy+ ' мес€ц';
     end;
  3: begin
      if dan.Text<>gacha.Text then dan.Text:=gacha.Text;
      xGroupyil.Enabled:=False;xoraliq.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;
      zapros.Text:= ' дата с-ф = '+dan.Text;
     end;
  4: begin
      xGroupyil.Enabled:=False;xoraliq.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;
      zapros.Text:= ' интервал с '+dan.Text+' по '+gacha.text;
     end;
  end;
end;

procedure Tpl_bank.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  sfPage.ActivePageIndex:=0;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then
  begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;

procedure Tpl_bank.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tpl_bank.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tpl_bank.n_regKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tpl_bank.newplClick(Sender: TObject);
begin
  if gpl.State=dsbrowse then
  begin
    gpl.Append;
    gplkonv.AsInteger:=0;
    gplvid.AsInteger:=11;gplbank_id.AsInteger:=1;

    s_vid.SetFocus;
  end
  else
  begin
    if (diler.Visible=true) and (diler.Value=null) then begin ShowMessage('Dilerni tanlang');ActiveControl:=diler;Exit;end;
    if (vo.Visible=true) and (vo.Value=null) then begin ShowMessage('Xarajat turini tanlang');ActiveControl:=vo;Exit;end;
    if (haridor.Visible=true) and (haridor.Value=null) then begin ShowMessage('haridorni tanlang');ActiveControl:=haridor;Exit;end;
    if n_pl.Value=null then begin ShowMessage('To`lov nomerini kiriting');ActiveControl:=n_pl;Exit;end;
    if gpl.FieldByName('d_pl').AsVariant=null then begin ShowMessage('To`lov sanasini kiriting');ActiveControl:=d_pl;Exit;end;
    if gpl.fieldbyname('sena_pl').AsFloat=0 then begin ShowMessage('Summani kiriting');ActiveControl:=sena_pl;Exit;end;

    gplost_pl.AsFloat:=gpl.fieldbyname('sena_pl').AsFloat;
    gplost_d.AsFloat:=gpl.fieldbyname('sena_d').AsFloat;
    gpl.Post;
    dms.link.Close;dms.link.sql.Clear;
    dms.link.sql.Add('update s_haridor set qarz_flag=-1 where id='+gplh_id.AsString);
    dms.link.ExecSQL;

  end;
end;

procedure Tpl_bank.delplClick(Sender: TObject);
begin
  if gpl.State=dsbrowse then
  begin
    if gpl.RecordCount=0 then exit;
    if MessageDlg(gpln_pl.AsString+'-sonli to`lovnomani o`chirasizmi ?',mtInformation,[mbYes, mbNo], 0) = mrYes then
    begin
      if gpl.fieldbyname('vid').AsInteger=1 then begin // naqd
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set pl_id=null where pl_id='+gplid.AsString);
        dms.link.ExecSQL;
      end;
      if gpl.fieldbyname('vid').AsInteger=19 then begin // plastik
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set plastik_id=null where plastik_id='+gplid.AsString);
        dms.link.ExecSQL;
      end;
      if gpl.fieldbyname('vid').AsInteger=21 then begin // dollar
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set d_id=null where d_id='+gplid.AsString);
        dms.link.ExecSQL;
      end;
      if gpl.fieldbyname('vid').AsInteger=22 then begin // click
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set c_id=null where c_id='+gplid.AsString);
        dms.link.ExecSQL;
      end;
      gpl.edit;gpl.FieldByName('del_flag').Value:=0;gpl.post;
      gpl.Refresh;
      gplAfterOpen(gpl);
   end;
  end
  else
  begin
    gpl.Cancel;
  end;
end;

procedure Tpl_bank.grplDblClick(Sender: TObject);
begin
  gpl.Edit;
end;

procedure Tpl_bank.FormActivate(Sender: TObject);
function _IntToStr(i, Wide: Cardinal): string;
var
  i1:Cardinal;
begin
  Result := '';
  repeat
    i1 := i mod 10;
    i := i div 10;
    Result := char(i1 + ord('0')) + Result;
    dec(Wide);
  until (Wide < 1) and (i < 1)
end;
begin
  if (admin_id='') then exit;
  shortdateformat:='dd.mm.yy'; xyil.Text:= IntToStr(YearOf(now));
  xtur.ItemIndex:=4;gacha.Text:=DateToStr(now);
  if DayOf(Now) > 10 then
    dan.Text:='01.'+_IntToStr(MonthOf(now),2)+'.'+copy(xyil.Text,3,2)
  else
   dan.Text:='01.'+_IntToStr(MonthOf(now)-iif(MonthOf(now)=1,0,1),2)+'.'+copy(xyil.Text,3,2);

  interval(dan.Value, gacha.Value, 1,'pl.d_pl');
  gpl.Close;gpl.SQL.Clear;
  gpl.SQL.Add('SELECT * FROM pl WHERE del_flag=1 and bank_id=1 and '+poisk[1]+' order by d_pl');
  gpl.open;
  DMS.s_pl.close;DMS.s_pl.SQL.Clear;
  DMS.s_pl.sql.add('SELECT * FROM s_pl where id>1 and bank_id in (1,2) and activ=1');
  DMS.s_pl.Open;
  dms.s_haridor.Close;dms.s_haridor.SQL.Clear;
  dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1 order by nom');
  dms.s_haridor.open;dms.s_haridor.First;
  oi.ItemIndex:=MonthOf(now)-1;
  if MonthOf(now) in [1,2,3] then xchorak.ItemIndex:=0;
  if MonthOf(now) in [4,5,6] then xchorak.ItemIndex:=1;
  if MonthOf(now) in [7,8,9] then xchorak.ItemIndex:=2;
  if MonthOf(now) in [10,11,12] then xchorak.ItemIndex:=3;

end;

procedure Tpl_bank.gplAfterScroll(DataSet: TDataSet);
begin

  case gplvid.Value of
  2:begin // kassa xarajat
    vo.Visible:=true;lnom.Visible:=false;nom.Visible:=false;
    diler.Visible:=false;haridor.Visible:=false;
    end;
  13:begin  // bank xarajat
    vo.Visible:=true;lnom.Visible:=false;nom.Visible:=false;
    diler.Visible:=false;haridor.Visible:=false;
    end;
  3:begin // kassa dilerga chiqim
    vo.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
    diler.Visible:=true;haridor.Visible:=false;
    end;
  14:begin   // bank diler chiqim
    vo.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
    diler.Visible:=true;haridor.Visible:=false;
    end;
  4:begin
      vo.Visible:=false;diler.Visible:=false;haridor.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
    end;
  5:begin
      vo.Visible:=false;diler.Visible:=false;haridor.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
    end;
  6,16,19:begin //
      diler.Visible:=false;vo.Visible:=false;haridor.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
    end;
  7:begin // haridor kirim
      vo.Visible:=false;lnom.Visible:=true;nom.Visible:=true;
      diler.Visible:=false;haridor.Visible:=true;
    end;
  8:begin  // haridor chiqim
      vo.Visible:=false;lnom.Visible:=true;nom.Visible:=true;
      diler.Visible:=false;haridor.Visible:=true;
    end;
  17,20:begin  // haridor kirim
      vo.Visible:=false;lnom.Visible:=true;nom.Visible:=true;
      diler.Visible:=false;haridor.Visible:=true;
    end;
  18:begin  // h chiqim
      vo.Visible:=false;lnom.Visible:=true;nom.Visible:=true;
      diler.Visible:=false;haridor.Visible:=true;
    end;
  9:begin // dilerdan kirim
      vo.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
      diler.Visible:=true;haridor.Visible:=false;
    end;
  15:begin // bank diler kirim
      vo.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
      diler.Visible:=true;haridor.Visible:=false;
    end;
  11:begin
      vo.Visible:=false;diler.Visible:=false;haridor.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
    end;
  12:begin
      vo.Visible:=false;diler.Visible:=false;haridor.Visible:=false;lnom.Visible:=false;nom.Visible:=false;
    end;
  end;

end;

procedure Tpl_bank.filtr_haridorEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if filtr_haridor.value=null then exit;
  gpl.Close;gpl.SQL.Clear;
  gpl.SQL.Add('select * from pl where del_flag=1 and bank_id=1 and h_id='+inttostr(filtr_haridor.value)+' order by id desc');
  gpl.open;sfPage.TabIndex:=0;ActiveControl:=grpl;
end;

procedure Tpl_bank.filtr_dilerEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if filtr_diler.value=null then exit;
  gpl.Close;gpl.SQL.Clear;
  gpl.SQL.Add('select * from pl where del_flag=1 and bank_id=1 and diler_id='+inttostr(filtr_diler.value)+' order by id desc');
  gpl.open;sfPage.TabIndex:=0;ActiveControl:=grpl;
end;

procedure Tpl_bank.filtr_x_turEditButtons0Click(Sender: TObject;var Handled: Boolean);
begin
  if filtr_x_tur.value=null then exit;
  gpl.Close;gpl.SQL.Clear;
  gpl.SQL.Add('select * from pl where del_flag=1 and bank_id=1 and vo='+inttostr(filtr_x_tur.value)+' order by id desc');
  gpl.open;sfPage.TabIndex:=0;ActiveControl:=grpl;
end;

procedure Tpl_bank.filtr_vidEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  filtr_vid.value:=null;ishiClick(sender);
end;

procedure Tpl_bank.filtr_x_turEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  filtr_x_tur.Value:=null;ishiClick(sender);
end;

procedure Tpl_bank.filtr_haridorEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  filtr_haridor.Value:=null;ishiClick(sender);
end;

procedure Tpl_bank.filtr_dilerEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  filtr_diler.Value:=null;ishiClick(sender);
end;

procedure Tpl_bank.filtr_vidEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if filtr_vid.value=null then exit;
  gpl.Close;gpl.SQL.Clear;
  gpl.SQL.Add('select * from pl where del_flag=1 and bank_id=1 and vid='+inttostr(filtr_vid.value)+' order by id desc');
  gpl.open;
  sfPage.TabIndex:=0;ActiveControl:=grpl;
end;

procedure Tpl_bank.s_vidChange(Sender: TObject);
begin
  if gpl.Active=false then exit;
  if gpl.State=dsBrowse then exit;
  gplvid.Value:=dms.s_pl.fieldbyname('id').AsInteger;
  gplAfterScroll(gpl);
end;

procedure Tpl_bank.gplAfterCancel(DataSet: TDataSet);
begin
  newpl.Caption:='Yangi';delpl.Caption:='O`chirish';
  newpl.Font.Color:=clBlue;delpl.Font.Color:=clBlue;
  n_pl.Font.Color:=clBlack;d_pl.Font.Color:=clBlack;
  sena_pl.Font.Color:=clBlack;s_vid.Font.Color:=clBlack;
  sfPage.Pages[1].TabEnabled:=true;
  grpl.Enabled:=true;Gredit.enabled:=false;

end;

procedure Tpl_bank.gplsena_plGetText(Sender: TField; var Text: String;DisplayText: Boolean);
begin
  if gplvid.Value in [2,3,5,6,8,11,13,14,18] then
  text:='-'+gplsena_pl.AsString else text:=gplsena_pl.AsString;
end;

procedure Tpl_bank.RzBitBtn1Click(Sender: TObject);
var firstRow,i:integer;ustun:string;
begin
  ExcelCreateApplication('Bank to`lovlari', 1,1, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('’ато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;firstRow:=10;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=10;Sheet.Columns[3].ColumnWidth := 6;
  Sheet.Columns[4].ColumnWidth :=20;Sheet.Columns[5].ColumnWidth := 20;Sheet.Columns[6].ColumnWidth := 15;Sheet.Columns[7].ColumnWidth := 15;
  Sheet.Cells[firstRow-1,1] := 'є';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2] := 'Sana';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,3] := 'Hujjat є';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,4] := 'Amal turi';Sheet.Range['D'+IntToStr(firstrow-2)+':D'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,5] := 'Amal nomi';Sheet.Range['E'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-2,6] := 'Pul oqimi';Sheet.Range['F'+IntToStr(firstrow-2)+':G'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,6] := 'Kirim';Sheet.Cells[firstRow-1,7] := 'Chiqim';
  gpl.first;
  for i:=0 to gpl.RecordCount-1 do begin
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);
    Sheet.Cells[firstrow+i,2]:=gpld_pl.AsString;
    Sheet.Cells[firstrow+i,3]:=gpln_pl.AsString;
    Sheet.Cells[firstrow+i,4]:=gpltur.AsString;
    case gplvid.AsInteger of
    13:  Sheet.Cells[firstrow+i,5]:=gplharajat.AsString;
    14,15:Sheet.Cells[firstrow+i,5]:=gpldiler.AsString;
    17,18:Sheet.Cells[firstrow+i,5]:=gplharidor.AsString;
    end;
    if gpls_plvid.AsInteger = 1 then
    begin
      Sheet.Cells[firstrow+i,6]:=gplsena_pl.AsString;Sheet.Cells[firstrow+i,6].NumberFormat := '0,00';
    end
    else
    begin
      Sheet.Cells[firstrow+i,7]:=gplsena_pl.AsString;Sheet.Cells[firstrow+i,7].NumberFormat := '0,00';
    end;
    gpl.Next;
  end;
  Sheet.Cells[firstrow+i,2] := 'Jami:';
  Sheet.Cells[firstrow+i,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';Sheet.Cells[firstrow+i,6].NumberFormat := '00,00';
  Sheet.Cells[firstrow+i,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';Sheet.Cells[firstrow+i,7].NumberFormat := '00,00';
  //Sheet.Cells[firstrow-4,2] := 'Dastlabki qoldiq:';Sheet.Cells[firstrow-4,4] := danq.Text;
  //Sheet.Cells[firstrow+i+2,2] := 'Ohirgi qoldiq:';Sheet.Cells[firstrow+i+2,4] := gachaq.Text;
  ustun:='G';
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

  Sheet.Cells[2,1]:='Bank pul aylanmasi ';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:='Oraliq sana :' + dan.Text+ ' dan '+gacha.Text+' gacha';Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
end;

procedure Tpl_bank.nomKeyPress(Sender: TObject; var Key: Char);
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
  haridor.Value:=dms.s_haridor.fieldbyname('id').Value;
end;

procedure Tpl_bank.lnomClick(Sender: TObject);
begin
  dms.s_haridor.Close;dms.s_haridor.SQL.Clear;
  dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1');
  dms.s_haridor.open;dms.s_haridor.First;
end;

procedure Tpl_bank.sena_plEnter(Sender: TObject);
begin
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value=2) then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value=1) then
    sena_d.Value:=sena_pl.Value/kurs.Value;

end;

procedure Tpl_bank.sena_plExit(Sender: TObject);
begin
  if konv.Value='' then exit;
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value=2) then
    sena_pl.Value:=sena_d.Value*kurs.Value;

  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value=1) then
    sena_d.Value:=sena_pl.Value/kurs.Value;
end;

procedure Tpl_bank.sena_dExit(Sender: TObject);
begin
  if konv.Value='' then exit;
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value=2) then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value=1) then
    sena_d.Value:=sena_pl.Value/kurs.Value;
end;

procedure Tpl_bank.sena_dEnter(Sender: TObject);
begin
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value=2) then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value=1) then
    sena_d.Value:=sena_pl.Value/kurs.Value;
end;

procedure Tpl_bank.MuddatExit(Sender: TObject);
begin
  if Muddat.Value<date() then Muddat.Value:=null;
end;

procedure Tpl_bank.gplNewRecord(DataSet: TDataSet);
begin
  gpl.FieldByName('vid').AsInteger:=1;
  gpl.FieldByName('d_pl').AsDateTime:=date();
  gpl.FieldByName('n_pl').AsString:='-1';
  gpluser_id.AsInteger:=strtoint(admin_id);
  gplclient_id.AsInteger:=strtoint(admin_clid);

  grpl.enabled:=false;Gredit.enabled:=true;
  sfPage.Pages[1].TabEnabled:=false;
  newpl.Enabled:=true;delpl.Enabled:=true;
  newpl.Caption:='Saqlash';delpl.Caption:='Bekor qilish';
  newpl.Font.Color:=clred;delpl.Font.Color:=clred;
  if dms.s_clientdollar.Value=1 then begin
    DMS.s_kurs.Last;dms.s_kurs.First;
    while not dms.s_kurs.Eof do begin
      if (pl_bank.gpld_pl.AsDateTime>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (pl_bank.gpld_pl.AsDateTime <= dms.s_kurs.FieldByName('data2').AsDateTime) then
      begin
        pl_bank.gplkurs.value:=dms.s_kurs.Fieldbyname('dollar').AsVariant;exit;
      end;
      dms.s_kurs.Next;
    end; // while
  end;
end;

procedure Tpl_bank.gplAfterEdit(DataSet: TDataSet);
begin
  newpl.Caption:='Saqlash';delpl.Caption:='Bekor qilish';
  newpl.Font.Color:=clred;delpl.Font.Color:=clred;
  sfPage.Pages[1].TabEnabled:=false;
  grpl.Enabled:=false;Gredit.enabled:=true;
end;

procedure Tpl_bank.gplAfterOpen(DataSet: TDataSet);
begin
 if gpl.RecordCount=0 then
 begin
  delpl.Enabled:=false;
 end
 else
 begin
  delpl.Enabled:=true;
 end;
end;

procedure Tpl_bank.gplAfterPost(DataSet: TDataSet);
begin
 grpl.Enabled:=true;Gredit.enabled:=false;sfPage.Pages[1].TabEnabled:=true;
 newpl.Caption:='Yangi';delpl.Caption:='O`chirish';
 newpl.Font.Color:=clBlue;delpl.Font.Color:=clBlue;
 n_pl.Font.Color:=clBlack;d_pl.Font.Color:=clBlack;
 sena_pl.Font.Color:=clBlack;s_vid.Font.Color:=clBlack;
end;

end.

