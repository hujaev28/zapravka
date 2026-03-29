unit fchiqim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBCtrlsEh, DBLookupEh, StdCtrls, Mask, DBCtrls,
  RzButton, Grids, DBGrids, GridsEh,IniFiles,db, Menus, SUIPopupMenu,
  RzEdit, ExtCtrls, RzPanel, RzRadChk, RzDBCmbo, ZAbstractRODataset,
  ZAbstractDataset, ZDataset,Clipbrd;

type
  Tchiqim = class(TForm)
    Image2: TImage;
    shtrix: TEdit;
    Image1: TImage;
    Edit1: TEdit;
    Tovarlar: TDBGridEh;
    g_asos: TDBGridEh;
    chek_del: TsuiPopupMenu;
    MenuItem3: TMenuItem;
    qpopup: TsuiPopupMenu;
    MenuItem2: TMenuItem;
    xoraliq: TRzGroupBox;
    xldan: TLabel;
    xlgacha: TLabel;
    sana1: TDBDateTimeEditEh;
    sana2: TDBDateTimeEditEh;
    tovar: TRzBitBtn;
    zapros: TRzEdit;
    sqltext: TRzEdit;
    za: TRzEdit;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    xodim: TDBLookupComboboxEh;
    Splitter1: TSplitter;
    tekshir: TRzBitBtn;
    Label2: TLabel;
    user: TRzDBLookupComboBox;
    Yangilash: TRzBitBtn;
    main: TZQuery;
    Dmain: TDataSource;
    sm_out1: TDBGridEh;
    popser: TsuiPopupMenu;
    S1: TMenuItem;
    s4: TMenuItem;
    onasi: TZQuery;
    Donasi: TDataSource;
    sm_out: TDBGridEh;
    tovar1: TRzBitBtn;
    haridor: TZQuery;
    DataSource1: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    bajar: TRzDBLookupComboBox;
    Label5: TLabel;
    client: TDBLookupComboboxEh;
    tozala: TRzBitBtn;
    Edit2: TRzEdit;
    sena_in: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nom_shKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gqoldirDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TovarlarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure sana1Change(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure shtrixKeyPress(Sender: TObject; var Key: Char);
    procedure tovarClick(Sender: TObject);
    procedure tekshirClick(Sender: TObject);
    procedure sana1KeyPress(Sender: TObject; var Key: Char);
    procedure sana2KeyPress(Sender: TObject; var Key: Char);
    procedure xodimKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure YangilashClick(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure s4Click(Sender: TObject);
    procedure xoraliqDblClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure tovar1Click(Sender: TObject);
    procedure YangilashKeyPress(Sender: TObject; var Key: Char);
    procedure tozalaClick(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure sena_inClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  chiqim: Tchiqim;
  poisk: array [1..27] of String;

implementation

{$R *.dfm}
uses fs_client,fulanish, fdms, fs_asos, fs_diler, fs_ombor_edit,comobj;
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
      chiqim.za.Text:=chiqim.za.Text+'Sana = '+DateToStr(int1)+'#';
    end
    else
    begin
      poisk[massiv]:=s+' between '+kasaya(int1)+' and '+kasaya(int2);
      chiqim.za.Text:=chiqim.za.Text+'Sana oralig`i '+DateToStr(int1)+' dan '+DateToStr(int2)+' gacha#';
    end;
  if (int1<>Null) and (int2=Null) then
    begin
      poisk[massiv]:=s+' >= '+kasaya(int1);
      chiqim.za.Text:=chiqim.za.Text+'Sana '+DateToStr(int1)+' dan keyingi #';
    end;
  if (int1=Null) and (int2<>Null) then
    begin
      poisk[massiv]:=s+' <= '+kasaya(int2);
      chiqim.za.Text:=chiqim.za.Text+'Sana '+DateToStr(int2)+' dan oldingi #';
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


procedure plus(k,k_in:integer);
var s,sql:string;
begin
  s:='';
  dms.asos_slave.Edit;
  dms.link.Close;dms.link.sql.Clear;sql:='';
  sql:='update asos_slave set ';
  if k>0 then begin
    s:=',';sql:=sql+' kol_ost= kol_ost - '+IntToStr(k);
    dms.asos_slavekol.AsInteger:=k;dms.asos_slavesumma.AsFloat:=k*dms.asos_slavesotish.AsFloat;
  end;
  if k_in>0 then begin
    sql:=sql+s+' kol_in_ost = kol_in_ost - '+StrReplace(IntToStr(k_in),',','.');
    s:=',';sql:=sql+', summa_in_ost = summa_in_ost - '+StrReplace(FloatToStr(k_in*dms.qoldiqsena_in.AsFloat),',','.');
    dms.asos_slavekol_in.AsInteger:=k_in;dms.asos_slavesumma_in.AsFloat:=k_in*dms.asos_slavesotish_in.AsFloat;
  end;
  dms.asos_slavesumma_all.AsFloat:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;
  sql:=sql+', summa_all_ost= summa_all_ost - '+StrReplace(FloatToStr(k*dms.qoldiqsena.Asfloat+k_in*dms.qoldiqsena.AsFloat),',','.');
  sql:=sql+' where id='+dms.asos_slavekol_ost.AsString;
  dms.link.SQL.Add(sql);dms.link.ExecSQL;
  dms.asos_slave.Post;
  dms.asos.Edit;
  dms.asoskol.AsInteger:=DMS.asos_slavekol.AsInteger+k;
  dms.asossumma.AsFloat:=dms.asossumma.AsFloat+k*DMS.qoldiqsotish.AsFloat+k_in*DMS.qoldiqsotish_in.AsFloat;
  dms.asossum_plastik.AsFloat:=dms.asossumma.AsFloat;
  dms.asossum_naqd.AsFloat:=0;
  dms.asos.Post;
  dms.qoldiq.open;dms.qoldiq.Refresh;
end;
procedure minus(k,k_in:integer);
var s:string;
begin
  s:='';
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.asos_slavekol_ost.AsString);
  dms.qoldiq.open;

  dms.asos.Edit;
  dms.asoskol.AsInteger:=dms.asoskol.AsInteger-(k+k_in);
  dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
  dms.asossumma.AsFloat:=dms.asossumma.AsFloat-(k*DMS.asos_slavesotish.AsFloat+k_in*DMS.asos_slavesotish_in.AsFloat);
  dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat;
  dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;      dms.asossum_plastik.AsFloat:=0;
  dms.asossum_naqd_ch.AsFloat:=dms.asossum_naqd.AsFloat;dms.asossum_plast_ch.AsFloat:=0;
  dms.asos.Post;
  dms.asos_slave.Edit;
  dms.link.Close;dms.link.sql.Clear;
  dms.link.sql.Add('update asos_slave set ');
  if k>0 then begin
    s:=',';dms.link.sql.Add(' kol_ost= kol_ost + '+inttostr(k));
    dms.asos_slavekol.AsInteger:=0;dms.asos_slavesumma.AsFloat:=0;
end;
  if k_in>0 then begin
    dms.link.sql.Add(s+' kol_in_ost = kol_in_ost + '+IntToStr(k_in));
    dms.asos_slavekol_in.AsInteger:=0;dms.asos_slavesumma_in.AsFloat:=0;
  end;
  dms.link.sql.Add(' where id='+dms.asos_slavekol_ost.AsString);
  dms.link.ExecSQL;
  dms.asos_slavesumma_all.AsFloat:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;
  dms.asos_slave.post;
  dms.qoldiq.open;dms.qoldiq.Refresh;
end;
procedure Tchiqim.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tchiqim.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tchiqim.FormCreate(Sender: TObject);
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
procedure Tchiqim.nom_shKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tchiqim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.qoldiq.Cancel;
end;

procedure Tchiqim.gqoldirDblClick(Sender: TObject);
begin
  dms.s_ombor.edit;
  s_ombor_edit.showmodal;
end;

procedure Tchiqim.FormActivate(Sender: TObject);
begin
  if dms.s_clientsert.AsInteger=0 then
  begin
   Tovarlar.Columns.Items[2].Visible:=false;
   Tovarlar.Columns.Items[3].Visible:=false;
  end;
  if dms.s_clientichkitovar.AsInteger=0 then
  begin
   Tovarlar.Columns.Items[8].Visible:=false;
   Tovarlar.Columns.Items[9].Visible:=false;
   Tovarlar.Columns.Items[10].Visible:=false;
   Tovarlar.Columns.Items[11].Visible:=false;
   Tovarlar.Columns.Items[12].Visible:=false;
  end;
  if dms.s_clientseriya.AsInteger=0 then
  begin
   sm_out.Visible:=false;
  end;

  sana1.Value:=Now();sana2.Value:=Now();dms.asos_slave.open;

  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1');
  dms.s_tovar.Open;
  dms.setup.Refresh;
  main.Open;onasi.Open;
  sana1Change(Sender);
  {
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and client_id='+admin_id+' order by sana');
  dms.asos.open;dms.asos_slave.open;
  if dms.asos.RecordCount=0 then sana1.Value:=Now() else
  sana1.Value:=dms.asossana.Value;
  dms.asos.Last;
  if dms.asos.RecordCount=0 then sana2.Value:=Now() else
  sana2.Value:=dms.asossana.Value;}
end;

procedure Tchiqim.TovarlarDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var  n:integer;//holdColor: TColor;
begin
  {if gdSelected in State then begin
    tovarlar.Canvas.Brush.Color := clLtGray;
    tovarlar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  holdColor := tovarlar.Canvas.Font.Color;
  if (dms.asos_slavedel_flag.AsInteger =0) then begin
    tovarlar.Canvas.Font.Color := clRed; //Brush
    tovarlar.Canvas.Font.Style :=  [fsStrikeOut];
    tovarlar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    tovarlar.Canvas.Font.Color := holdColor;
  end;}
  if Column.FieldName = 'srok' then begin
    if dms.asos_slave.fieldbyname('srok').AsVariant=null then exit;
    n:=(dms.asos_slave.fieldbyname('srok').AsVariant-dms.setupvaqt.AsVariant);
    if (n<30) then begin
      Tovarlar.Canvas.Brush.Color := clRed;
      Tovarlar.Canvas.Font.Color := clWhite;
      //Tovarlar.Canvas.Font.Style :=  [fsbold];
      Tovarlar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
     // Tovarlar.Canvas.Brush.Color := holdColor;
    end;
    if (n>31) and (n<90) then begin
      Tovarlar.Canvas.Brush.Color := clYellow;
      Tovarlar.Canvas.Font.Color := clBlue;
      //Tovarlar.Canvas.Font.Style :=  [fsbold];
      Tovarlar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      //Tovarlar.Canvas.Brush.Color := holdColor;
    end;
  end;

end;

procedure Tchiqim.MenuItem3Click(Sender: TObject);
var k,k_in:integer;
begin
  if dms.asos.RecordCount=0 then exit;
  k:=0;k_in:=0;
  if MessageDlg(dms.asosdiler_id.AsString+' -  sonli chekni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('update s_tovar set upakavka = null where id='+dms.s_tovarid.AsString);
      dms.link.ExecSQL;
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('update slave_main set del_flag=0 where id='+dms.asos_slaveid.AsString);
      dms.link.ExecSQL;

      if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
      if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
      minus(k,k_in);
      dms.asos_slave.edit;
      dms.asos_slavedel_flag.AsInteger:=0;
      dms.asos_slave.post;
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
        dms.qoldiq.post;
      end;
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger*2) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+2;
        dms.qoldiq.post;
      end;
      dms.asos_slave.Next;
    end;
    dms.asos.edit;
    dms.asosdel_flag.AsInteger:=0;
    dms.asos.post;
    dms.asos.Refresh;

    dms.asos_slave.refresh;
    if DMS.qoldiq.Active then DMS.qoldiq.Refresh;
  end;

end;

procedure Tchiqim.MenuItem2Click(Sender: TObject);
var k,k_in:integer;
begin
  if dms.asos_slave.RecordCount=0 then exit;
  k:=0;k_in:=0;
  if MessageDlg(dms.asos_slaves_tovar.AsString+' -  tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update s_tovar set upakavka = null where id='+dms.asos_slavetovar_id.AsString);
    dms.link.ExecSQL;
    if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
    if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
    if (k+k_in)>0 then
    minus(k,k_in);

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update slave_main set del_flag=0 where id='+dms.asos_slaveid.AsString);
    dms.link.ExecSQL;
    dms.asos_slave.edit;
    dms.asos_slavedel_flag.AsInteger:=0;
    dms.asos_slave.post;
    dms.asos_slave.refresh;
    if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
      dms.qoldiq.Edit;
      dms.qoldiqkol_in_ost.AsInteger:=0;
      dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
      dms.qoldiq.post;
    end;
    if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger*2) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
      dms.qoldiq.Edit;
      dms.qoldiqkol_in_ost.AsInteger:=0;
      dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+2;
      dms.qoldiq.post;
    end;
    if DMS.qoldiq.Active then DMS.qoldiq.Refresh;
  end;
end;

procedure Tchiqim.sana1Change(Sender: TObject);
var s,s1,s2,sql_text:string;y:integer;
begin
  if admin_type='' then exit;s:='';
  if Edit1.Text>'' then begin
    s:=trim(Edit1.Text);s1:=s;s2:='';y:=pos(' ',s);
    if y>0 then begin s1:=copy(s,1,y-1);s2:=copy(s,y+1,length(s)-y);end;
    if s2<>'' then
      sql_text:='((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%")) and ((t.nom like "%'+lat_kril(s2)+'%") or (t.nom like "%'+s2+'%")))'
    else
      sql_text:='((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))';
  end;
  if ((sana1.Value=null) or (sana2.Value=null)) and (s='') then exit;
  if (sana2.Value<sana1.Value) then if (sana2.Value=null) then else sana2.Value:=sana1.Value;
  dms.setup.Refresh;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select DISTINCT asos.* from s_tovar t,asos_slave a,asos WHERE a.del_flag=1 and asos.tur_oper=2 and a.asos_id=asos.id and a.tovar_id=t.id and asos.client_id = '+admin_clid+' ');
  if ((sana1.Value=null) or (sana2.Value=null)) then  else
    dms.asos.SQL.Add(' and sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value));
  if s<>'' then dms.asos.SQL.Add(' and '+sql_text);
  if xodim.Value>0 then DMS.asos.sql.add(' and xodim_id = '+IntToStr(xodim.Value));
  if user.KeyValue>0 then DMS.asos.sql.add(' and asos.user_id = '+IntToStr(user.KeyValue));
  dms.asos.SQL.Add('  order by asos.diler_id');
  dms.asos.Open;Tovarlar.SumList.RecalcAll;g_asos.SumList.RecalcAll;
end;

procedure Tchiqim.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var s,s1,s2,sql_text:string;y:integer;
begin

   if admin_type='' then exit;s:='';
  if Edit1.Text>'' then begin
    s:=trim(Edit1.Text);s1:=s;s2:='';y:=pos(' ',s);
    if y>0 then begin s1:=copy(s,1,y-1);s2:=copy(s,y+1,length(s)-y);end;
    if s2<>'' then
      sql_text:='((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%")) and ((t.nom like "%'+lat_kril(s2)+'%") or (t.nom like "%'+s2+'%"))'
    else
      sql_text:='((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))';
  end;
  if ((sana1.Value=null) or (sana2.Value=null)) and (s='') then exit;
  if (sana2.Value<sana1.Value) then sana2.Value:=sana1.Value;
  dms.setup.Refresh;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select DISTINCT  asos.* from s_tovar t,asos_slave a,asos WHERE a.del_flag=1 and asos.tur_oper=2 and a.asos_id=asos.id and a.tovar_id=t.id and asos.client_id = '+admin_id+' ');
  if ((sana1.Value=null) or (sana2.Value=null)) then  else
    dms.asos.SQL.Add(' and sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value));
  if s<>'' then dms.asos.SQL.Add(' and '+sql_text);
  if xodim.Value>0 then DMS.asos.sql.add(' and xodim_id = '+IntToStr(xodim.Value));
  dms.asos.SQL.Add('  order by asos.diler_id');
  dms.asos.Open;
  if s<>'' then begin
    dms.asos_slave.Close;dms.asos_slave.SQL.Clear;
    dms.asos_slave.SQL.Add('select s.* from asos_slave s,s_tovar t WHERE s.del_flag=1 and s.asos_id=:id and s.tovar_id=t.id ');
    dms.asos_slave.open;
  end
  else
  begin
    dms.asos_slave.Close;dms.asos_slave.SQL.Clear;
    dms.asos_slave.SQL.Add('select s.* from asos_slave s WHERE s.del_flag=1 and s.asos_id=:id ');
    dms.asos_slave.open;
  end;
  Tovarlar.SumList.RecalcAll;g_asos.SumList.RecalcAll;
end;

procedure Tchiqim.shtrixKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then exit;
  if shtrix.Text='' then exit;
  if not  ((Length(shtrix.Text)=13) or (Length(shtrix.Text)=15)) then begin
    shtrix.Text:='';
    exit;
  end;
  dms.asos.Close;dms.asos.SQL.Clear;
  if Length(shtrix.Text)=15 then
    dms.asos.SQL.Add('select asos.* from s_tovar t,asos_slave a,asos,slave_main sm,main m WHERE m.id=sm.main_id and a.id=sm.slave_id and a.del_flag=1 and asos.tur_oper=2 and a.asos_id=asos.id and a.tovar_id=t.id and asos.client_id = '+admin_id+' and ')
  else
    dms.asos.SQL.Add('select asos.* from s_tovar t,asos_slave a,asos WHERE a.del_flag=1 and asos.tur_oper=2 and a.asos_id=asos.id and a.tovar_id=t.id and asos.client_id = '+admin_id+' and ');
  if Length(shtrix.Text)=15 then
    dms.asos.SQL.Add('  m.serial = "'+shtrix.Text+'"')
  else
    dms.asos.SQL.Add(' (t.shtrix_in = "'+shtrix.Text+'" or t.shtrix ="'+shtrix.Text+'" or t.shtrix1 ="'+shtrix.Text+'" or t.shtrix2 ="'+shtrix.Text+'")');
  dms.asos.SQL.Add(' order by t.nom,a.srok');
  shtrix.Text:='';
  dms.asos.Open;Tovarlar.SumList.RecalcAll;g_asos.SumList.RecalcAll;
end;

procedure Tchiqim.tovarClick(Sender: TObject);
var firstRow,i,j:integer;last_col:String;
begin
  if StrToDate(sana1.Text)>StrToDate(sana2.Text) then begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=sana1;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  if xodim.Value>0 then begin poisk[2]:=' a.xodim_id = '+IntToStr(xodim.Value);
  zapros.Text:=zapros.Text+' Kassir = '+xodim.Text+'#';end;
  if user.KeyValue>0 then begin poisk[3]:=' a.user_id = '+IntToStr(user.KeyValue);
  zapros.Text:=zapros.Text+' Sotuvchi = '+user.Text+'#';end;
  interval(sana1.Value, sana2.Value, 1,' a.sana ');
  if (poisk[1]>'') then sqltext.Text:=poisk[1];
  for i := 2 to 7 do begin if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i]; sqltext.Text:=sqltext.Text+poisk[i];end;
  dms.link.Close;dms.link.SQL.Clear;
  DMS.link.sql.add('select DISTINCT t.nom as tnom,s.seriya,s.srok,s.kol,s.sotish,s.summa as ks,s.kol_in,s.sotish_in');
  DMS.link.sql.add(',s.summa_in as kins,s.summa_all as jami ');
  //DMS.link.sql.add(',s.kol_in*if(s.sotish_in is null,0,s.sotish_in) as kins,s.kol*s.sotish+s.kol_in*if(s.sotish_in is null,0,s.sotish_in) as jami ');
  DMS.link.sql.add('from s_tovar t,asos_slave s,asos a WHERE s.del_flag=1 and a.tur_oper=2 and s.asos_id=a.id and s.tovar_id=t.id and a.client_id = '+admin_id+' and '+sqltext.Text );
  //zapros.Visible:=true;zapros.Text:=dms.link.SQL.Text;exit;
  dms.link.open;
  if dms.link.RecordCount=0 then begin ShowMessage('Ma`lumot yo`q');Exit;end;

  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';i:=1;
  ExcelCreateApplication('Kassa savdosi', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  j:=1;
  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;
  if dms.s_clientichkitovar.AsInteger=1 then begin
    inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=10;
  end
  else
  begin
    inc(j);Sheet.Columns[j].ColumnWidth := 0;inc(j);Sheet.Columns[j].ColumnWidth :=0;
  end;
  inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 10;
  if dms.s_clientichkitovar.AsInteger=1 then begin
    inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 10;
    inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 10;
  end
  else
  begin
    inc(j);Sheet.Columns[j].ColumnWidth :=0;inc(j);Sheet.Columns[j].ColumnWidth := 0;
    inc(j);Sheet.Columns[j].ColumnWidth :=0;inc(j);Sheet.Columns[j].ColumnWidth := 0;
  end;
  firstRow:=10;j:=0;
  inc(j);Sheet.Cells[firstRow-2,j] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Tovar nomi';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Seriya';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Muddati';Sheet.Range['D'+IntToStr(firstrow-2)+':D'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Soni';Sheet.Cells[firstRow-2,j] := 'Asosiy tovar';
  Sheet.Range['E'+IntToStr(firstrow-2)+':G'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Narxi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Summasi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Soni';Sheet.Cells[firstRow-2,j] := 'Ichki tovar';
  Sheet.Range['H'+IntToStr(firstrow-2)+':J'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Narxi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Summasi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Jami';Sheet.Range['K'+IntToStr(firstrow-2)+':K'+IntToStr(firstrow-1)].merge;
  with dms.link do begin j:=0;i:=1;
  while not dms.link.Eof do  begin
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=i;
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('tnom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('seriya').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('srok').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ###0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sotish').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('ks').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol_in').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ###0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sotish_in').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kins').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('jami').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    dms.link.Next;inc(i);j:=0;
  end; // while
  end; // with
  last_col:='K';j:=1;
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j] := 'Jami:';inc(j);inc(j);
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ###0';
  inc(j);//Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+last_col + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':'+last_col + IntToStr(firstRow+dms.link.RecordCount)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+dms.link.RecordCount) + ':'+last_col + IntToStr(FirstRow+dms.link.RecordCount)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-2)+':'+last_col+IntToStr(FirstRow+dms.link.RecordCount)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+last_col + IntToStr(FirstRow+dms.link.RecordCount)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 10, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 8, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 8, True, True,true);


  Sheet.Cells[2,1]:='Kassa savdosi';Sheet.Range['A2:H2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:H3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text;Sheet.Range['A5:H5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;

end;

procedure Tchiqim.tekshirClick(Sender: TObject);
var f,n,f3:Currency;
begin
  {if copy(dms.asos.SQL.Text,1,80)<>'select * from asos where del_flag=1 and tur_oper=2 and client_id=2 order by sana' then
  begin
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and client_id='+admin_id+' order by sana');
  dms.asos.open;dms.asos_slave.open;
  end;}
   exit;
  while not dms.asos.Eof do begin
    f:=0;dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      if dms.asos_slavesena.AsFloat<>onasi.fieldbyname('sena').AsFloat then begin
        dms.asos_slave.Edit;
        dms.asos_slavesena.AsFloat:=onasi.fieldbyname('sena').AsFloat;
        dms.asos_slavesena_in.AsFloat:=onasi.fieldbyname('sena_in').AsFloat;
        dms.asos_slave.post;
      end;

      if dms.asos_slavekol.AsInteger*dms.asos_slavesotish.AsFloat<>dms.asos_slavesumma.AsFloat then begin
        Tovarlar.SumList.RecalcAll;exit;
      end;
      n:=dms.asos_slavekol_in.AsFloat*dms.asos_slavesotish_in.AsFloat;
      if FloatToStr(n)<>dms.asos_slavesumma_in.AsString then begin
        Tovarlar.SumList.RecalcAll;exit;
      end;f3:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;
      if FloatToStr(f3)<>dms.asos_slavesumma_all.AsString then begin
        Tovarlar.SumList.RecalcAll;exit;
      end;
      f:=f+dms.asos_slavesumma_all.AsFloat;
      dms.asos_slave.Next;
    end;
    if dms.asossumma.AsString<>floattostr(f) then begin
      Tovarlar.SumList.RecalcAll;exit;
    end;
    if (dms.asossumma.AsString)<>floattostr(dms.asossum_naqd.AsFloat+dms.asossum_plastik.AsFloat) then begin
      Tovarlar.SumList.RecalcAll;exit;
    end;
    {dms.k_asos.Edit;
    dms.k_asossumma.AsFloat:=f;dms.k_asos.Post;}
    dms.asos.Next;
  end;
  Tovarlar.SumList.RecalcAll;
end;

procedure Tchiqim.sana1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then g_asos.setfocus;
end;

procedure Tchiqim.sana2KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then g_asos.setfocus;
end;

procedure Tchiqim.xodimKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then g_asos.setfocus;
end;

procedure Tchiqim.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then g_asos.setfocus;
end;

procedure Tchiqim.YangilashClick(Sender: TObject);
var s,s1,s2,sql_text:string;y:integer;
begin

  if admin_type='' then exit;s:='';
  Yangilash.Visible:=false;
  if Edit1.Text>'' then begin
    s:=trim(Edit1.Text);s1:=s;s2:='';y:=pos(' ',s);
    if y>0 then begin s1:=copy(s,1,y-1);s2:=copy(s,y+1,length(s)-y);end;
    if s2<>'' then
      sql_text:='((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%")) and ((t.nom like "%'+lat_kril(s2)+'%") or (t.nom like "%'+s2+'%"))'
    else
      sql_text:='((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))';
  end;
  if ((sana1.Value=null) or (sana2.Value=null)) and (s='') then exit;
  if (sana2.Value<sana1.Value) then if (sana2.Value=null) then else sana2.Value:=sana1.Value;
  dms.setup.Refresh;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select DISTINCT asos.* from s_tovar t,asos_slave a,asos WHERE a.del_flag=1 and asos.tur_oper=2 and a.asos_id=asos.id and a.tovar_id=t.id and asos.client_id = '+admin_clid+' ');
  if ((sana1.Value=null) or (sana2.Value=null)) then  else
    dms.asos.SQL.Add(' and sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value));
  if s<>'' then dms.asos.SQL.Add(' and '+sql_text);
  if client.Value>0 then DMS.asos.sql.add(' and asos.h_id = '+IntToStr(client.Value));
  if xodim.Value>0 then DMS.asos.sql.add(' and asos.xodim_id = '+IntToStr(xodim.Value));
  if user.KeyValue>0 then DMS.asos.sql.add(' and asos.user_id = '+IntToStr(user.KeyValue));
  if bajar.KeyValue>0 then DMS.asos.sql.add(' and asos.bajar = '+IntToStr(bajar.KeyValue));
  dms.asos.SQL.Add('  order by asos.diler_id');
  dms.asos.Open;Tovarlar.SumList.RecalcAll;g_asos.Refresh;g_asos.SumList.RecalcAll;
  Yangilash.Visible:=true;
end;

procedure Tchiqim.S1Click(Sender: TObject);
begin
  if MessageDlg(' seriyani o`chirasizmi?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update slave_main set kirim_id = null where id='+main.fieldbyname('kirim_id').AsString);
    dms.link.ExecSQL;

    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('update slave_main set del_flag=0 where id='+main.fieldbyname('id').AsString);
    dms.main_link.ExecSQL;
    main.Refresh;
end;

procedure Tchiqim.s4Click(Sender: TObject);
begin
  Clipboard.AsText:=main.fieldbyname('serial').AsString;

end;

procedure Tchiqim.xoraliqDblClick(Sender: TObject);
begin
  tekshir.Visible:=true;
end;

procedure Tchiqim.Image1DblClick(Sender: TObject);
begin
  tekshirClick(Sender);
end;

procedure Tchiqim.tovar1Click(Sender: TObject);
var firstRow,i,j:integer;last_col:String;
begin
  if StrToDate(sana1.Text)>StrToDate(sana2.Text) then
  begin ShowMessage('Oraliq noto`g`ri');ActiveControl:=sana1;Exit;end;
  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';
  if xodim.Value>0 then begin poisk[2]:=' a.xodim_id = '+IntToStr(xodim.Value);
  zapros.Text:=zapros.Text+' Kassir = '+xodim.Text+'#';end;
  if user.KeyValue>0 then begin poisk[3]:=' a.user_id = '+IntToStr(user.KeyValue);
  zapros.Text:=zapros.Text+' Sotuvchi = '+user.Text+'#';end;
  interval(sana1.Value, sana2.Value, 1,' a.sana ');
  if (poisk[1]>'') then sqltext.Text:=poisk[1];
  for i := 2 to 7 do begin if (sqltext.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i]; sqltext.Text:=sqltext.Text+poisk[i];end;
  haridor.Close;haridor.SQL.Clear;
  //haridor.sql.add('SELECT distinct h.id,h.nom FROM s_haridor h , asos a, asos_slave s,s_tovar t where t.id=s.tovar_id and s.asos_id=a.id and h.id=a.h_id  and a.sana="2021-08-31";
  //haridor.open;

  dms.link.Close;dms.link.SQL.Clear;
  DMS.link.sql.add('select DISTINCT t.nom as tnom,s.seriya,s.srok,s.kol,s.sotish,s.summa as ks,s.kol_in,s.sotish_in');
  DMS.link.sql.add(',s.summa_in as kins,s.summa_all as jami ');
  DMS.link.sql.add('from s_tovar t,asos_slave s,asos a WHERE s.del_flag=1 and a.tur_oper=2 and s.asos_id=a.id and s.tovar_id=t.id and a.client_id = '+admin_id+' and '+sqltext.Text );
  DMS.link.sql.add(' and a.client_id = '+admin_id+' and '+sqltext.Text );

  //zapros.Visible:=true;zapros.Text:=dms.link.SQL.Text;exit;
  dms.link.open;
  if dms.link.RecordCount=0 then begin ShowMessage('Ma`lumot yo`q');Exit;end;

  zapros.Text:='';for i := 1 to 27 do poisk[i]:='';sqltext.Text:='';i:=1;
  ExcelCreateApplication('Kassa savdosi', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  j:=1;
  Sheet.Columns[j].ColumnWidth :=5;inc(j);Sheet.Columns[j].ColumnWidth :=25;
  if dms.s_clientichkitovar.AsInteger=1 then begin
    inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=10;
  end
  else
  begin
    inc(j);Sheet.Columns[j].ColumnWidth := 0;inc(j);Sheet.Columns[j].ColumnWidth :=0;
  end;
  inc(j);Sheet.Columns[j].ColumnWidth := 10;inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 10;
  if dms.s_clientichkitovar.AsInteger=1 then begin
    inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 10;
    inc(j);Sheet.Columns[j].ColumnWidth :=10;inc(j);Sheet.Columns[j].ColumnWidth := 10;
  end
  else
  begin
    inc(j);Sheet.Columns[j].ColumnWidth :=0;inc(j);Sheet.Columns[j].ColumnWidth := 0;
    inc(j);Sheet.Columns[j].ColumnWidth :=0;inc(j);Sheet.Columns[j].ColumnWidth := 0;
  end;
  firstRow:=10;j:=0;
  inc(j);Sheet.Cells[firstRow-2,j] := '№';Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Tovar nomi';Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Seriya';Sheet.Range['C'+IntToStr(firstrow-2)+':C'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-2,j] := 'Muddati';Sheet.Range['D'+IntToStr(firstrow-2)+':D'+IntToStr(firstrow-1)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Soni';Sheet.Cells[firstRow-2,j] := 'Asosiy tovar';
  Sheet.Range['E'+IntToStr(firstrow-2)+':G'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Narxi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Summasi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Soni';Sheet.Cells[firstRow-2,j] := 'Ichki tovar';
  Sheet.Range['H'+IntToStr(firstrow-2)+':J'+IntToStr(firstrow-2)].merge;
  inc(j);Sheet.Cells[firstRow-1,j] := 'Narxi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Summasi';
  inc(j);Sheet.Cells[firstRow-1,j] := 'Jami';Sheet.Range['K'+IntToStr(firstrow-2)+':K'+IntToStr(firstrow-1)].merge;
  with dms.link do begin j:=0;i:=1;
  while not dms.link.Eof do  begin
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=i;
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('tnom').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('seriya').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('srok').AsString;//s:=inttostr(firstrow+i);
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ###0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sotish').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('ks').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kol_in').AsInteger;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ###0';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('sotish_in').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('kins').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    inc(j);Sheet.Cells[firstrow+RecNo-1,j]:=fieldbyname('jami').AsFloat;Sheet.Cells[firstrow+i,2].NumberFormat := '### ### ##0,00';
    dms.link.Next;inc(i);j:=0;
  end; // while
  end; // with
  last_col:='K';j:=1;
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j] := 'Jami:';inc(j);inc(j);
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ###0';
  inc(j);//Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  inc(j);Sheet.Cells[firstrow+dms.link.RecordCount,j].formula := '=SUM(R[-1]C:R[-'+IntToStr(dms.link.RecordCount)+']C)';
  Sheet.Cells[firstrow+dms.link.RecordCount,j].NumberFormat := '### ### ##0,00';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+last_col + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':'+last_col + IntToStr(firstRow+dms.link.RecordCount)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+dms.link.RecordCount) + ':'+last_col + IntToStr(FirstRow+dms.link.RecordCount)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-2)+':'+last_col+IntToStr(FirstRow+dms.link.RecordCount)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+last_col + IntToStr(FirstRow+dms.link.RecordCount)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 10, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 8, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 8, True, True,true);


  Sheet.Cells[2,1]:='Kassa savdosi';Sheet.Range['A2:H2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=admin_fio;Sheet.Range['A3:H3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=za.Text;Sheet.Range['A5:H5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
end;

procedure Tchiqim.YangilashKeyPress(Sender: TObject; var Key: Char);
begin
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select id from asos WHERE tur_oper=2 and (h_id =0 or h_id is null) and asos.client_id = '+admin_clid+' ');
  dms.asos.Open;
  while not dms.asos.Eof do begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('delete from asos_slave WHERE asos_id = '+admin_clid+' ');
    dms.link.ExecSQL;
    dms.asos.Next;
  end;
end;

procedure Tchiqim.tozalaClick(Sender: TObject);
begin
  exit;
  if Edit2.Text<>'28012013' then exit;
  while not dms.asos.Eof do begin
    if (dms.asos.FieldByName('h_id').AsInteger>0) or (dms.asos.FieldByName('h_id').AsVariant = null) then
      dms.asos.next
    else
    begin
      while not dms.asos_slave.Eof do begin
       dms.asos_slave.Delete;
      end;
      dms.asos.Delete;
    end;
  end; // while
  ShowMessage('Jarayon tugadi');
end;

procedure Tchiqim.Image2DblClick(Sender: TObject);
begin
  tozala.Visible:=true;Edit2.Visible:=true;
end;

procedure Tchiqim.sena_inClick(Sender: TObject);
begin
  if Edit2.Text<>'1976' then exit;
  while not dms.asos.Eof do begin
      while not dms.asos_slave.Eof do begin
        DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
        if (dms.s_tovarkol_in.AsInteger>1) and (dms.asos_slavesena_in.AsFloat=0) then
        begin
          dms.asos_slave.Edit;
          dms.asos_slavesena_in.AsFloat:=dms.asos_slavesena.AsFloat/dms.s_tovarkol_in.AsInteger;
          dms.asos_slavesena_in_d.AsFloat:=dms.asos_slavesena_d.AsFloat/dms.s_tovarkol_in.AsInteger;
          dms.asos_slave.post;
        end;
        dms.asos_slave.Next;
      end;
      dms.asos.Next;
  end; // while
  ShowMessage('Jarayon tugadi');
end;

end.








