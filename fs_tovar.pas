unit fs_tovar;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,IniFiles, ComCtrls, ShellApi, jpeg, Mask, DBCtrlsEh, StdCtrls,
  Menus, RzPanel, RzRadGrp, ExtCtrls, SUIPopupMenu, RzRadChk, RzSplit,
  frxDesgn, frxClass, frxDBSet, DBGridEh, DBLookupEh, GridsEh, RzButton, RzTabs,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids;
const
  {символы десятичной системы}
  LetInteger: array[0..9]of Char=('0','1','2','3','4','5','6','7','8','9');
  {буквы EN раскладки}
  EngLet: string ='`qwertyuiop[]asdfghjkl;''zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>';
  {буквы RU раскладки}
  RusLet: string ='ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ';
type

  Ts_tovar = class(TForm)
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    shtrix: TEdit;
    Edit1: TEdit;
    turi: TRzRadioGroup;
    gpopup: TsuiPopupMenu;
    MenuItem9: TMenuItem;
    Menu_kirim: TMenuItem;
    Image2: TImage;
    gqoldir: TDBGridEh;
    qpopup: TsuiPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    kirim: TRzCheckBox;
    varaq: TRzPageControl;
    Tab0: TRzTabSheet;
    Tab2: TRzTabSheet;
    yessf: TRzBitBtn;
    nosf: TRzBitBtn;
    TabSheet2: TRzTabSheet;
    RzSizePanel1: TRzSizePanel;
    RzSizePanel2: TRzSizePanel;
    gclient: TDBGridEh;
    TabSheet3: TRzTabSheet;
    TabSheet1: TRzTabSheet;
    Image3: TImage;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Copies: TDBNumberEditEh;
    Bosmalash20: TRzBitBtn;
    sotish: TDBNumberEditEh;
    frxs_tovar: TfrxDBDataset;
    frxsf: TfrxReport;
    pechat40: TRzBitBtn;
    frxDesigner1: TfrxDesigner;
    kat: TDBLookupComboboxEh;
    brend: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    kg: TDBNumberEditEh;
    Bajarilganamallar1: TMenuItem;
    proba: TZQuery;
    Dproba: TDataSource;
    sikl: TsuiPopupMenu;
    Q1: TMenuItem;
    N31: TMenuItem;
    g2: TMenuItem;
    DBGridEh1: TDBGridEh;
    s1: TMenuItem;
    n1: TMenuItem;
    q2: TMenuItem;
    TabSheet4: TRzTabSheet;
    E1: TMenuItem;
    asos_slave: TfrxDBDataset;
    Label4: TLabel;
    holat: TDBComboBoxEh;
    H1: TMenuItem;
    Oxirgisenavasotishnitovarbazagayozzero1: TMenuItem;
    Shtrixnixotiragasaqlash1: TMenuItem;
    Ichkishtrixnixotiragasaqlash1: TMenuItem;
    sarala: TDBComboBoxEh;
    Label5: TLabel;
    pechat20: TRzBitBtn;
    Ichkishtrixnixotiragasaqlash2: TMenuItem;
    ishkikirimnarh1: TMenuItem;
    GroupBox2: TGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    DBGrid1: TDBGrid;
    Timer1: TTimer;
    RzBitBtn5: TRzBitBtn;
    Label6: TLabel;
    inventar: TDBNumberEditEh;
    inv: TRzRadioGroup;
    N10somgachayaxlitlash1: TMenuItem;
    Memotb: TMemo;
    zapros: TRzBitBtn;
    start: TRzBitBtn;
    N2: TMenuItem;
    Label10: TLabel;
    f: TDBComboBoxEh;
    Pricev21: TMenuItem;
    N3: TMenuItem;
    N22: TMenuItem;
    Edit2: TEdit;
    Gtasnif: TDBGridEh;
    Qoldiqiyoqtovarlarniochirish1: TMenuItem;
    popshtrix: TsuiPopupMenu;
    N6kodlar1: TMenuItem;
    Label7: TLabel;
    tqoldiq: TZQuery;
    Dqoldiq: TDataSource;
    gombor: TDBGridEh;
    Shtrixniochirish1: TMenuItem;
    qaytahisoblash1: TMenuItem;
    Omborxonagakirimqilish1: TMenuItem;
    pricesenasena1: TMenuItem;
    yangiyil1: TMenuItem;
    Price31: TMenuItem;
    boshtovarlashniochirish1: TMenuItem;
    procedure xnewClick(Sender: TObject);
    procedure gclientDblClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gclientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure shtrixExit(Sender: TObject);
    procedure shtrixKeyPress(Sender: TObject; var Key: Char);
    procedure shtrixEnter(Sender: TObject);
    procedure turiClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuItem9Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Menu_kirimClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure varaqClick(Sender: TObject);
    procedure Bosmalash20Click(Sender: TObject);
    procedure pechat40Click(Sender: TObject);
    procedure katChange(Sender: TObject);
    procedure katEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure brendEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure brendChange(Sender: TObject);
    procedure sotishEnter(Sender: TObject);
    procedure Bajarilganamallar1Click(Sender: TObject);
    procedure gqoldirDblClick(Sender: TObject);
    procedure Q1Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure g2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure s1Click(Sender: TObject);
    procedure q2Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure holatChange(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure Oxirgisenavasotishnitovarbazagayozzero1Click(
      Sender: TObject);
    procedure Shtrixnixotiragasaqlash1Click(Sender: TObject);
    procedure Ichkishtrixnixotiragasaqlash1Click(Sender: TObject);
    procedure CopiesKeyPress(Sender: TObject; var Key: Char);
    procedure saralaChange(Sender: TObject);
    procedure pechat20Click(Sender: TObject);
    procedure Ichkishtrixnixotiragasaqlash2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure Label12DblClick(Sender: TObject);
    procedure startClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure zaprosClick(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure inventarExit(Sender: TObject);
    procedure inventarKeyPress(Sender: TObject; var Key: Char);
    procedure invClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N10somgachayaxlitlash1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure fChange(Sender: TObject);
    procedure Pricev21Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure shtrixDblClick(Sender: TObject);
    procedure Qoldiqiyoqtovarlarniochirish1Click(Sender: TObject);
    procedure N6kodlar1Click(Sender: TObject);
    procedure gqoldirCellClick(Column: TColumnEh);
    procedure Shtrixniochirish1Click(Sender: TObject);
    procedure gomborCellClick(Column: TColumnEh);
    procedure qaytahisoblash1Click(Sender: TObject);
    procedure Omborxonagakirimqilish1Click(Sender: TObject);
    procedure pricesenasena1Click(Sender: TObject);
    procedure yangiyil1Click(Sender: TObject);
    procedure Price31Click(Sender: TObject);
    procedure boshtovarlashniochirish1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  clAverageSpeed: Double=0;
  s_tovar: Ts_tovar;

implementation

{$R *.dfm}
uses fdms,fs_tovar_edit,fulanish, wcrypt2, Math,ClipBrd, fs_ostatka,fs_ombor,fsetup,frxBarcode,
  comobj, DateUtils, ftarozi, fhato;
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
procedure tovar_amal(tovar_id:integer);
var firstRow,i,u:integer;ustun:string;
begin
  dms.link.Close;dms.link.sql.Clear;
  dms.link.sql.Add('select asos_id,s.id as s_id,s.kol_ost as s_kol_ost,t.nom,sana,s.kol,s.kol_in,s.sena,s.sena_in,s.sotish,s.sotish_in,a.tur_oper,a.nomer,a.diler_id from s_tovar t,asos_slave s,asos a ');
  dms.link.sql.Add(' WHERE s.del_flag=1 and s.asos_id=a.id and s.tovar_id=t.id and a.client_id = '+DMS.s_clientid.AsString+' and t.id='+inttostr(tovar_id)+' order by s.id');
  dms.link.open;
  ExcelCreateApplication('Bajarilgan amallar', 1,1, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  dms.main_link.DisableControls;firstRow:=10;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=10;Sheet.Columns[3].ColumnWidth := 15;
  Sheet.Columns[4].ColumnWidth :=20;Sheet.Columns[5].ColumnWidth := 20;Sheet.Columns[6].ColumnWidth := 15;
  u:=0;
  inc(u);Sheet.Cells[firstRow-1,u] := '№';
  inc(u);Sheet.Cells[firstRow-1,u] := 'Hujjat №';
  inc(u);Sheet.Cells[firstRow-1,u] := 'Sana';
  inc(u);Sheet.Cells[firstRow-1,u] := 'Soni';
  inc(u);Sheet.Cells[firstRow-1,u] := 'Ichki soni';
  inc(u);Sheet.Cells[firstRow-1,u] := 'Soni';
  inc(u);Sheet.Cells[firstRow-1,u] := 'Ichki soni';
  dms.link.first;u:=0;
  for i:=0 to dms.link.RecordCount-1 do begin
    inc(u);Sheet.Cells[firstrow+i,u]:=inttostr(i+1);
    inc(u);
    if dms.link.FieldByName('tur_oper').AsInteger=2 then
      Sheet.Cells[firstrow+i,u]:=dms.link.FieldByName('diler_id').AsString
    else
      Sheet.Cells[firstrow+i,u]:=dms.link.FieldByName('diler_id').AsString;

    inc(u);Sheet.Cells[firstrow+i,u]:=dms.link.FieldByName('sana').AsString;
    case dms.link.FieldByName('tur_oper').AsInteger of
    2:  begin
          inc(u);Sheet.Cells[firstrow+i,u+2]:=dms.link.FieldByName('kol').AsString;
          inc(u);Sheet.Cells[firstrow+i,u+2]:=dms.link.FieldByName('kol_in').AsString;
          inc(u);Sheet.Cells[firstrow+i,u+2]:=dms.link.FieldByName('s_kol_ost').AsString;
        end;
    1,3,5:begin
            inc(u);Sheet.Cells[firstrow+i,u]:=dms.link.FieldByName('kol').AsString;
            inc(u);Sheet.Cells[firstrow+i,u]:=dms.link.FieldByName('kol_in').AsString;
            inc(u);Sheet.Cells[firstrow+i,u+2]:=dms.link.FieldByName('s_id').AsString;
          end;
    end;
    inc(u);Sheet.Cells[firstrow+i,u+3]:=dms.link.FieldByName('asos_id').AsString;
    inc(u);Sheet.Cells[firstrow+i,u+4]:=dms.link.FieldByName('s_id').AsString;
    dms.link.Next;u:=0;
  end;
  Sheet.Cells[firstrow+i,2] := 'Jami:';
  Sheet.Cells[firstrow+i,4].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';Sheet.Cells[firstrow+i,4].NumberFormat := '00,00';
  Sheet.Cells[firstrow+i,5].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';Sheet.Cells[firstrow+i,5].NumberFormat := '00,00';
  Sheet.Cells[firstrow+i,6].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';Sheet.Cells[firstrow+i,6].NumberFormat := '00,00';
  Sheet.Cells[firstrow+i,7].formula := '=SUM(R[-1]C:R[-'+IntToStr(i)+']C)';Sheet.Cells[firstrow+i,7].NumberFormat := '00,00';
  //Sheet.Cells[firstrow-4,2] := 'Dastlabki qoldiq:';Sheet.Cells[firstrow-4,4] := danq.Text;
  //Sheet.Cells[firstrow+i+2,2] := 'Ohirgi qoldiq:';Sheet.Cells[firstrow+i+2,4] := gachaq.Text;
  ustun:='H';
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

  Sheet.Cells[2,1]:='Tovar ustida bajarilgar amallar ';
  Sheet.Cells[3,1]:=DMS.s_tovarid.AsString;Sheet.Cells[3,2]:=DMS.s_tovarnom.AsString;Sheet.Cells[3,3]:=DMS.s_tovarkol_in.AsInteger;
  Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
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
//возвращает с английской раскладки русскую
function EngToRus(const s: string): string;
var reS: string;
i,e: integer;
begin
if s = '' then Exit;
reS:=s;
for i:=1 to Length(Res) do
for e:=1 to Length(EngLet) do
if reS[i]=EngLet[e] then
reS[i]:=RusLet[e];
result:=reS;
end;

//возвращает с русской раскладки английскую
function RusToEng(const s: string): string;
var reS: string;
i,e: integer;
begin
if s = '' then Exit;
reS:=s;
for i:=1 to Length(Res) do
for e:=1 to Length(RusLet) do
if reS[i]=RusLet[e] then
reS[i]:=EngLet[e];
result:=reS;
end;
function StrReplace(const Str, Str1, Str2: string): string;
var P, L: Integer;
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

function FileSizeByName(const AFilename: string): Int64;
begin
  with TFileStream.Create(AFilename, fmOpenRead or fmShareDenyNone) do
  try
    Result := Size;
  finally Free; end;
end;

function md5(const Input: String): String;
var
  hCryptProvider: HCRYPTPROV;hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;dwHashBytes: Cardinal;
  pbContent: PByte;i: Integer;
begin
  dwHashBytes := 16;pbContent := Pointer(PChar(Input));Result := '';
  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input) * sizeof(Char), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashBytes, 0) then
        begin
          for i := 0 to dwHashBytes - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;
    CryptReleaseContext(hCryptProvider, 0);
  end;
  Result := AnsiLowerCase(Result);
end;


function lat_kril(asos:String):String;
var i:Integer;nom_lat,nom_kril,s:String;lat:boolean;
begin
 nom_lat:=asos;nom_kril:=asos;
  lat:=False;
  for i:=1 to Length(asos) do
  if (asos[i] in ['a' .. 'z']) or (asos[i] in ['A' .. 'Z']) then
    begin
      lat:=true;
      Break;
    end;
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

procedure Ts_tovar.xnewClick(Sender: TObject);
begin
  if admin_type='1' then exit;
  dms.s_tovar.Append;s_tovar_edit.zapis.Text:='1';
  //howMessage(dms.s_tovarid.AsString);
  dms.s_tovarturi.Value:=0;dms.s_tovarresept.Value:=0; dms.s_tovarotdel.Value:=1;
  dms.s_tovarshtrixkod.Value:=1;dms.s_tovarqrkod.Value:=0;
  dms.s_kat.First;
  if dms.s_katid.AsInteger>0 then
  dms.s_tovarkat.Value:=dms.s_katid.AsInteger
  else
  dms.s_tovarkat.Value:=0;dms.s_tovarbrend.Value:=0;
  dms.s_tovarizm_id.Value:=3;dms.s_tovarizm1.Value:=2;
  dms.s_tovaruser_id.AsInteger:=StrToInt(admin_id);
  dms.s_tovarclient_id.AsInteger:=dms.s_clientid.AsInteger;
  s_tovar_edit.resept.Checked:=false;s_tovar_edit.holat.Checked:=true;
  if s_tovar.shtrix.Text<>'' then dms.s_tovarshtrix.Value:=s_tovar.shtrix.Text;
  s_tovar_edit.save.Enabled:=true;s_tovar_edit.saveadd.Visible:=true;
  s_tovar_edit.savewithout.Visible:=false;
  dms.s_tovarkol_in.value:=1;
  s_tovar_edit.oldsotish.value:=0;s_tovar_edit.oldsotish_d.value:=0;
  s_tovar_edit.foiz.value:=FloatToStr(DMS.s_clientfoiz.Value);
  s_tovar_edit.ShowModal;
end;

procedure Ts_tovar.gclientDblClick(Sender: TObject);
begin
  if DMS.s_tovardel_flag.Value=0 then begin
    ShowMessage('Ushbu qator o`chirilgan. Administratorga murojat qiling. +998 93 5602290');
    exit;
  end;
  dms.s_tovar.Edit;if s_tovar.shtrix.Text<>'' then dms.s_tovarshtrix.Value:=s_tovar.shtrix.Text;
  if dms.s_tovarresept.Value=1 then s_tovar_edit.resept.Checked:=True else s_tovar_edit.resept.Checked:=False;
  s_tovar_edit.ShowModal;
end;

procedure Ts_tovar.xdelClick(Sender: TObject);
var rec:Integer;
begin
if (ulanish.metod.ItemIndex=2) and (admin_type='2') and(length(DMS.s_tovarshtrix.AsString)>0) then exit;
 //if admin_type='1' then exit;
 dms.link.Close;dms.link.SQL.Clear;
 dms.link.SQL.Add('select asos_slave.id,asos.sana from asos_slave,asos WHERE asos_slave.del_flag=1 and asos.del_flag=1 and asos.id=asos_slave.asos_id and (tovar_id = '+dms.s_tovarid.AsString+')');
 dms.link.open;
 if (dms.link.RecordCount>0) and (edit1.text<>'-') then begin
   ShowMessage('tovar nomidan '+dms.link.fieldbyname('sana').AsString+' da amal bajariljan');
   exit;
 end;
 if MessageDlg('Ushnu tovarni spravochnikdan o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     dms.link.Close;dms.link.SQL.Clear;
     dms.link.SQL.Add('delete from shtrix where tovar_id = '+dms.s_tovarid.AsString);
     dms.link.ExecSQL;
     DMS.s_tovar.Edit;
     DMS.s_tovardel_flag.Value:=0;
     DMS.s_tovar.Post;
     hatolar.t_id.Text:=DMS.s_tovarid.AsString;
     hatolar.qoldiq_tekshirClick(Sender);
     if DMS.s_tovar.RecordCount<>DMS.s_tovar.RecNo then DMS.s_tovar.next else dms.s_tovar.Prior;
     rec:=DMS.s_tovarid.AsInteger;
     DMS.s_tovar.Refresh;
    DMS.s_tovar.Locate('id',rec,[loCaseInsensitive]);

   end;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
end;

procedure Ts_tovar.xeditClick(Sender: TObject);
begin

  if admin_type='1' then exit;

  if DMS.s_tovardel_flag.Value=0 then begin
    ShowMessage('Ushbu qator o`chirilgan. Administratorga murojat qiling. +998 93 5602290');
    exit;
  end;
  if dms.s_tovarfoiz.AsVariant=null then
    s_tovar_edit.foiz.Text:='foizsiz';
  s_tovar_edit.oldnom.Text:=dms.s_tovarnom.AsString;
  s_tovar_edit.oldshtrix.Text:=dms.s_tovarshtrix.AsString;
  s_tovar_edit.oldaniq.Value:=dms.s_tovaraniq.AsFloat;
  s_tovar_edit.oldsotish.value:=dms.s_tovarsotish.AsFloat;
  s_tovar_edit.oldsotish_d.value:=dms.s_tovarsotish_d.AsFloat;
  s_tovar_edit.save.Enabled:=true;s_tovar_edit.saveadd.Visible:=true;
  dms.s_tovar.Edit;s_tovar_edit.zapis.Text:='2';
  if dms.s_tovarresept.Value=1 then s_tovar_edit.resept.Checked:=True else s_tovar_edit.resept.Checked:=False;
  if dms.s_tovarholat.Value=1 then s_tovar_edit.holat.Checked:=True else s_tovar_edit.holat.Checked:=False;
  //if dms.s_tovarshtrixkod.Value=1 then s_tovar_edit.shtrixkod.Checked:=True else s_tovar_edit.shtrixkod.Checked:=False;
  s_tovar_edit.save.Enabled:=true;s_tovar_edit.saveadd.Visible:=true;
  {if (dms.qoldiq.RecordCount>0) and (dms.s_tovarulg1.Value=0) then begin
    dms.s_tovarsena.Value:=dms.qoldiqsena.AsFloat;
    dms.s_tovarulg1.Value:=dms.qoldiqsotish.AsFloat;
    dms.s_tovarulg1_pl.Value:=RoundTo(dms.qoldiqsotish.AsFloat+dms.qoldiqsotish.AsFloat*5/100,DMS.s_clientyaxlitlash.Value);
    dms.s_tovarsotish.Value:=dms.qoldiqsotish.AsFloat;
  end;}
  s_tovar_edit.ShowModal;
end;

procedure Ts_tovar.FormCreate(Sender: TObject);
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

procedure Ts_tovar.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_tovar.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_tovar.gclientKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_INSERT then xnewClick(Sender);
  if key=VK_RETURN then xeditClick(Sender);
  if key=66 then begin // b bonus
    DMS.s_tovar.Edit;
    if DMS.s_tovarbonus.AsString='Y' then DMS.s_tovarbonus.AsString:='-'
    else  DMS.s_tovarbonus.AsString:='Y';
    DMS.s_tovar.Post;
  end;
  if key=81 then begin // q qoldiq
    DMS.s_tovar.Edit;
    if DMS.s_tovarqoldiq.AsString='Y' then DMS.s_tovarqoldiq.AsString:='-'
    else  DMS.s_tovarqoldiq.AsString:='Y';
    DMS.s_tovar.Post;
    hatolar.t_id.Text:=DMS.s_tovarid.AsString;hatolar.qoldiq_tekshirClick(Sender);
  end;
end;

procedure Ts_tovar.shtrixExit(Sender: TObject);
var s:string;
begin
  if shtrix.Text='' then exit;
  //if pos('000000',shtrix.Text)='' then shtrix.Text;
  s_ostatka.savdo.Text:='';
  if (length(shtrix.Text)=13) or (length(shtrix.Text)=8) then begin
    if (not dms.shtrix.Locate('nom',shtrix.Text,[loCaseInsensitive])) then begin
      dms.s_tovar.Append;
      dms.s_tovarizm_id.AsInteger:=3;
      dms.s_tovarnom.AsString:=dms.ttasnifnom.AsString;
      dms.s_tovarnom_sh.AsString:=dms.ttasnifnom.AsString;
      dms.s_tovarnom_ru.AsString:=dms.ttasnifnom.AsString;
      dms.s_tovarshtrix.AsString:=dms.ttasnifshtrix.AsString;
      dms.s_tovarotdel.AsInteger := 0;dms.s_tovarkat.AsInteger := 0;
      dms.s_tovarbrend.AsInteger := 0;
      dms.s_tovarturi.AsInteger:=0;dms.s_tovarresept.AsInteger:=0;
      dms.s_tovarshtrixkod.AsInteger:=1;
      dms.s_tovarqrkod.AsInteger:=0;dms.s_tovarizm1.AsInteger:=0;
      dms.s_tovaruser_id.AsInteger:=StrToInt(admin_id);
      dms.s_tovarclient_id.AsInteger:=dms.s_clientid.AsInteger;

      dms.s_tovarzavod_id.AsInteger:=1;
      dms.s_tovar.Post;
      DMS.tshtrix.Append;
      DMS.tshtrix.fieldbyname('nom').AsString:= shtrix.Text;
      DMS.tshtrix.fieldbyname('tovar_id').AsInteger:=DMS.s_tovarid.AsInteger;
      DMS.tshtrix.fieldbyname('turi').AsInteger:=1;
      DMS.tshtrix.post;
      DMS.tshtrix.Refresh;
      dms.s_tovar.Edit;
      s_tovar_edit.ShowModal;
      exit;
    end;
  end;

  dms.link.Close;dms.link.SQL.Clear;s:=StrReplace(shtrix.Text,'http://verum.uz/qr.php?text=','');
  if pos('http://verum.uz/qr.php?text=',shtrix.Text)>0 then
  begin
    s_ostatka.savdo.Text:=s;
    dms.link.SQL.Add('select s_tovar.id,s_tovar.nom from main,s_tovar WHERE main.tovar_id=s_tovar.id and s_tovar.del_flag=1 and main.qrkod = "'+s+'"');
  end
  else
  begin
    dms.link.SQL.Add(' select t.id from s_tovar t, shtrix sh WHERE t.del_flag=1 and t.id=sh.tovar_id and sh.nom = "'+shtrix.Text+'"');
  end;
  dms.link.open;s:='';
  while not dms.link.Eof do begin
    if s='' then
      s:=dms.link.fieldbyname('id').AsString
    else
      s:=s+','+dms.link.fieldbyname('id').AsString;
    dms.link.Next;  
  end;
  s:=' id in ('+s+')';
  if dms.link.fieldbyname('id').AsString<>'' then begin
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE '+s);
    dms.s_tovar.open;
    dms.qoldiq.Open;dms.qoldiq.refresh;
  end;
  if dms.link.RecordCount=0 then
  begin
    if admin_type='1' then exit;
    shtrix.Text:='';
    xnewClick(Sender);
  end;
  dms.qoldiq.Open;dms.qoldiq.refresh;
  if (kirim.Checked) then begin
    if admin_type<>'2' then exit;
    shtrix.Text:='';Menu_kirimClick(Sender);exit;
  end
  else
  begin
    shtrix.Text:='';
    if admin_type='1' then exit;
    xeditClick(Sender);exit;
  end;
  shtrix.Text:='';
end;

procedure Ts_tovar.shtrixKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_tovar.shtrixEnter(Sender: TObject);
begin
  shtrix.Text:='';
end;

procedure Ts_tovar.turiClick(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  case turi.ItemIndex of
  0:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 ');
  1:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and shtrix_full<>"" ');
  2:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and (shtrix_full is null or shtrix_full="") ');
  end;
  dms.s_tovar.SQL.Add(' order by '+sarala.Value);
  dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
end;

procedure Ts_tovar.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    if (kirim.Checked) then begin // and (dms.qoldiq.RecordCount=0)
      //if admin_type<>'2' then exit;
      Menu_kirimClick(Sender);
      exit;
    end
    else
    begin
      if admin_type='1' then exit;
      xeditClick(Sender);
      //inventar.SetFocus;
      exit;
    end
  end;

end;

procedure Ts_tovar.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var s,s1,s2:string;y:integer;
begin
  if (Key = VK_DOWN) and (not dms.s_tovar.Eof) then dms.s_tovar.Next
  else if (Key = VK_UP) and (not dms.s_tovar.bof) then
  begin
    dms.s_tovar.Prior;edit1.SelStart:=length(edit1.Text)+1;
  end
  else
  if (length(Edit1.Text) > 1) then begin
    s:=trim(Edit1.Text);s1:=s;s2:='';
    y:=pos(' ',s);
    if y>0 then begin
      s1:=copy(s,1,y-1);
      s2:=copy(s,y+1,length(s)-y);
    end;
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    case inv.ItemIndex of
    0:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 ');
    1:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and invkol>0 ');
    2:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and (invkol=0 or invkol is null) ');
    end;
    //
    //dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and ');
    dms.s_tovar.SQL.Add(' and ');
    if s2<>'' then begin
      dms.s_tovar.SQL.Add('(((nom like "%'+lat_kril(s1)+'%") or (nom like "%'+s1+'%"))');
      dms.s_tovar.SQL.Add(' and ((nom like "%'+lat_kril(s2)+'%") or (nom like "%'+s2+'%"))) order by nom');
    end
    else
    begin
      dms.s_tovar.SQL.Add('(((nom like "%'+lat_kril(s1)+'%") or (nom like "%'+s1+'%"))');
      dms.s_tovar.SQL.Add(') order by nom');
    end;
    dms.s_tovar.open;

    if dms.s_tovar.RecordCount=0 then begin
      if GetKeyboardLayout(GetWindowThreadProcessId(GetForegroundWindow,nil))=67699721 then begin
        s1:=EngToRus(s1);if s2<>'' then EngToRus(s2);
      end
      else begin
        s1:=RusToEng(s1);if s2<>'' then RusToEng(s2);
      end;

      dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
     dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and ');
     if s2<>'' then begin
        dms.s_tovar.SQL.Add('(((nom like "%'+lat_kril(s1)+'%") or (nom like "%'+s1+'%"))');
        dms.s_tovar.SQL.Add(' and ((nom like "%'+lat_kril(s2)+'%") or (nom like "%'+s2+'%"))) order by nom');
      end
      else
      begin
      dms.s_tovar.SQL.Add('(((nom like "%'+lat_kril(s1)+'%") or (nom like "%'+s1+'%"))');
      dms.s_tovar.SQL.Add(') order by nom');
      end;
      dms.s_tovar.open;
    end;
    s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  end;

end;

procedure Ts_tovar.MenuItem9Click(Sender: TObject);
begin
  Clipboard.AsText:=dms.s_tovarnom.AsString;
end;

procedure Ts_tovar.FormActivate(Sender: TObject);
var IniFile:TIniFile;
begin
    IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
    s_tovar.f.Value:=strtoint(IniFile.ReadString('BAZA','formatshtrix','1'));IniFile.Free;

    s_tovar.varaq.ActivePageIndex:=3;
    s_tovar.varaqClick(sender);
    s_tovar.varaq.ActivePageIndex:=2;
    s_tovar.varaqClick(sender);
    s_tovar.varaq.ActivePageIndex:=1;
    s_tovar.varaqClick(sender);
    s_tovar.varaq.ActivePageIndex:=0;
    s_tovar.varaqClick(sender);

  if dms.ttasnif.RecordCount=0 then Gtasnif.Visible:=false;
  if admin_type='1' then begin
    xnew.Visible:=false;xdel.Visible:=false;xedit.Visible:=false;
  end;
  if DMS.s_clientichkitovar.Value=0 then begin
    gclient.Columns[4].Visible:=false;gclient.Columns[5].Visible:=false;gclient.Columns[6].Visible:=false;
    gqoldir.Columns[9].Visible:=false;gqoldir.Columns[10].Visible:=false;gqoldir.Columns[11].Visible:=false;
  end;
  if DMS.s_clientdollar.Value=0 then begin
    gclient.Columns[21].Visible:=false;gclient.Columns[22].Visible:=false;
  end;
  if DMS.s_clientshtrix.Value=0 then begin
    gclient.Columns[23].Visible:=false;gclient.Columns[24].Visible:=false;
  end;
  if DMS.s_clientzavod.Value=0 then begin
    gclient.Columns[26].Visible:=false;
  end;
  if DMS.s_clientqoldiq.Value=0 then begin
    gclient.Columns[16].Visible:=false;gombor.Visible:=false;
  end;

  if DMS.s_clientat91.Value=2 then begin
  varaq.Visible:=false;
  //gclient.Columns[12].Visible:=false;gclient.Columns[13].Visible:=false;
  //gclient.Columns[14].Visible:=false;gclient.Columns[16].Visible:=false;
  //gqoldir.Columns[1].Visible:=false;gqoldir.Columns[2].Visible:=false;
  //gqoldir.Columns[14].Visible:=false;
  end;
  tqoldiq.Open;
end;

procedure Ts_tovar.Menu_kirimClick(Sender: TObject);
begin
  if dms.s_tovar.RecordCount=0 then begin
    ShowMessage('Tovar tanlanmagan');ActiveControl:=gclient;Exit;
  end;
  DMS.asos_qoldiq.Refresh;
  //ShowMessage(dms.qoldiq.SQL.Text);
  dms.qoldiq.append;
  if DMS.asos_qoldiq.RecordCount=1 then
  begin
    dms.qoldiq.FieldByName('asos_id').AsInteger:=DMS.asos_qoldiqid.AsInteger;
    s_ostatka.diler.Enabled:=false;
  end
  else
  dms.qoldiq.FieldByName('asos_id').AsInteger:=0;

  dms.qoldiq.FieldByName('tovar_id').AsInteger:=dms.s_tovarid.AsInteger;
  dms.qoldiq.FieldByName('user_id').AsInteger:=strtoint(admin_id);
  dms.qoldiq.FieldByName('turi').AsInteger:=dms.s_tovarturi.AsInteger;
  dms.qoldiq.FieldByName('foiz').AsInteger:=0;
  dms.qoldiq.FieldByName('qrkod').AsInteger:=0;
  if dms.s_tovar.FieldByName('kol_in').AsInteger>0 then
  begin
    s_ostatka.Gichki.Visible:=true;
  end
  else
  begin
    s_ostatka.Gichki.Visible:=false;
  end;

  dms.qoldiq.FieldByName('resept').AsInteger:=dms.s_tovarresept.AsInteger;
  dms.qoldiq.FieldByName('izm_id').AsInteger:=dms.s_tovarizm_id.AsInteger;
  dms.qoldiq.FieldByName('izm1').AsInteger:=dms.s_tovarizm1.AsInteger;
  dms.qoldiqqrkod.Value:=0;
  {if dms.s_tovarturi.AsInteger=1 then
  begin
    dms.qoldiq.FieldByName('sotish').AsFloat:=dms.s_tovaraniq.AsFloat;
    dms.qoldiq.FieldByName('sena').AsFloat:=dms.s_tovaraniq.AsFloat/(20/100+1);
  end
  else}
    dms.qoldiq.FieldByName('sotish').AsFloat:=0;
    s_ostatka.showmodal;
end;

procedure Ts_tovar.MenuItem1Click(Sender: TObject);
begin
  if admin_type<>'2' then exit;
  dms.qoldiq.Edit;
  s_ostatka.showmodal;
end;

procedure Ts_tovar.MenuItem2Click(Sender: TObject);
begin
  //if admin_type<>'2' then exit;
  //dms.link.Close;dms.link.SQL.Clear;
  //dms.link.SQL.Add('select a.sana from asos a,asos_slave s WHERE s.del_flag=1 and tur_oper=2 and a.id=s.asos_id and kol_ost = '+dms.qoldiqid.AsString);
  //dms.link.open;
  //if dms.link.RecordCount>0 then begin
  //  ShowMessage('tovar nomidan '+dms.link.fieldbyname('sana').AsString+' da amal bajariljan, tovar soni '+IntToStr(dms.link.RecordCount));
  //  exit;
  //end;
  if MessageDlg('Ushnu tovarni omborxona qoldiqidan  o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     DMS.qoldiq.Edit;
     DMS.qoldiq.FieldByName('del_flag').Value:=0;
     DMS.qoldiq.Post;
     hatolar.t_id.Text:=dms.qoldiqtovar_id.AsString;
     hatolar.qoldiq_tekshirClick(Sender);

     DMS.qoldiq.Refresh;tqoldiq.Refresh;
  end;
end;

procedure Ts_tovar.varaqClick(Sender: TObject);
begin
  case varaq.ActivePageIndex of
  0:begin // jami
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 order by nom');
    dms.s_tovar.open;
    varaq.Pages[0].Caption:='Jami = '+inttostr(dms.s_tovar.RecordCount);
    end;
  1:begin // Reestr
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and turi=1 order by nom');
    dms.s_tovar.open;
    varaq.Pages[1].Caption:='Ishtimoiy narxdagi dorilar = '+inttostr(dms.s_tovar.RecordCount);
    end;
  2:begin // Resepli dori
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and resept=1 order by nom');
    dms.s_tovar.open;
    varaq.Pages[2].Caption:='Retsepsiz berilmaydigan dorilar = '+inttostr(dms.s_tovar.RecordCount);
    end;
  3:begin // xabar
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and nom_ru is not null order by nom');
    dms.s_tovar.open;
    varaq.Pages[3].Caption:='Admin uchun = '+inttostr(dms.s_tovar.RecordCount);
    end;
  4:begin // Bo`lishi shart
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and shart=1 order by nom');
    dms.s_tovar.open;
    varaq.Pages[4].Caption:='Bo`lishi shart = '+inttostr(dms.s_tovar.RecordCount);
    end;
  end;

end;

procedure Ts_tovar.Bosmalash20Click(Sender: TObject);
var s1,s2,sf:string;Top1String:TfrxMemoView;sh:TfrxBarCodeView;razmer,i:Integer;
begin
  if dms.s_tovarshtrix_in.AsString='' then begin
    ShowMessage('Ichki shtrix kodni kiriting');exit;
  end;
    s1:='';s2:='';
    if copy(dms.s_tovarnom.AsString,5,1)='.' then begin
      s1:='kod: '+copy(dms.s_tovarnom.AsString,1,4);
      s2:=copy(dms.s_tovarnom.AsString,7,length(dms.s_tovarnom.AsString)-6);
   end
   else
   begin
      s1:='';s2:=dms.s_tovarnom.AsString;
   end;

  razmer:=14;
  rec_asos_t:=dms.s_tovarid.AsInteger;
  dms.s_tovar.Edit;
  if dms.s_tovarkg.AsInteger>0 then
    dms.s_tovarshtrix_full.AsString:='20'+dms.s_tovarshtrix_in.AsString+_IntToStr(dms.s_tovarkg.AsInteger,5)
  else
    dms.s_tovarshtrix_full.AsString:='20'+dms.s_tovarshtrix_in.AsString+'00000';
  dms.s_tovar.post;
  dms.s_tovar.Edit;
  i:= StrToInt(copy(dms.s_tovarshtrix_full.AsString,2,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,4,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,6,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,8,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,10,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,12,1));
  i:=i*3;
  i:=i+StrToInt(copy(dms.s_tovarshtrix_full.AsString,1,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,3,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,5,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,7,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,9,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,11,1));
  i:=strtoint(copy(inttostr(i), length(IntToStr(i)) ,1)   );
  if i=0 then i:=0 else i:=10-i;
  dms.s_tovarshtrix_full.AsString:=dms.s_tovarshtrix_full.AsString+IntToStr(i);
  dms.s_tovar.post;
  case f.value of
  1:sf:='30_20';
  2:sf:='30_30';
  3:sf:='30_40';
  4:sf:='40_20';
  5:sf:='40_30';
  6:sf:='60_30';
  7:sf:='60_40';
  8:sf:='30_20D';
  9:sf:='30_30D';
  10:sf:='40_20D';
  11:sf:='40_30D';
  12:sf:='60_30D';
  13:sf:='60_40D';
  14:sf:='60_30G';
  end;
  sf:=sf+'/';

  if sotish.Value>0 then begin
    frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+sf+'shtrix58_3.fr3');
    if Length(DMS.s_tovarnom.AsString)>27 then razmer:=12;
    if Length(DMS.s_tovarnom.AsString)>31 then razmer:=10;
  end
  else
  begin
    frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+sf+'shtrix58_1.fr3');
    //if Length(DMS.s_tovarnom.AsString)>27 then razmer:=12;
    //if Length(DMS.s_tovarnom.AsString)>31 then razmer:=10;
  end;
  frxsf.Variables['tovarkod']:=''''+s1+'''';
  frxsf.Variables['tovarnom']:=''''+s2+'''';
  sh:= frxsf.FindObject('shtrix') as TfrxBarCodeView;
  sh.Expression:=dms.s_tovarshtrix_full.AsString;
  frxsf.PrintOptions.Printer := setup.yorliqPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.Copies := Copies.Value;
  frxsf.PrintOptions.ShowDialog := false;
  frxsf.ShowReport;
  //frxsf.Print;
  dms.s_tovar.Locate('id',rec_asos_t,[loCaseInsensitive]);
  Edit1.SetFocus;
end;

procedure Ts_tovar.pechat40Click(Sender: TObject);
var s1,s2,sf:string;Top1String:TfrxMemoView;razmer:Integer;sh:TfrxBarCodeView;
begin
  if (DMS.s_tovarshtrix.AsString='') and dms.tshtrix.Locate('turi',1,[loCaseInsensitive]) then begin
    if DMS.s_tovar.State=dsbrowse then DMS.s_tovar.Edit;
      DMS.s_tovarshtrix.AsString:=dms.tshtrix.fieldbyname('nom').AsString;
      DMS.s_tovar.post;
    end;
  if (DMS.s_tovarshtrix_full.AsString='') and dms.tshtrix.Locate('turi',2,[loCaseInsensitive]) then begin
    if DMS.s_tovar.State=dsbrowse then DMS.s_tovar.Edit;
      DMS.s_tovarshtrix_in.AsString:=copy(dms.tshtrix.fieldbyname('nom').AsString,3,5);
      DMS.s_tovarshtrix_full.AsString:=dms.tshtrix.fieldbyname('nom').AsString;
      DMS.s_tovar.post;
  end;
  if dms.s_tovarshtrix.AsString='' then begin
    ShowMessage('shtrix kodni kiriting');exit;
  end;
  case f.value of
  1:sf:='30_20';
  2:sf:='30_30';
  3:sf:='30_40';
  4:sf:='40_20';
  5:sf:='40_30';
  6:sf:='60_30';
  7:sf:='60_40';
  8:sf:='30_20D';
  9:sf:='30_30D';
  10:sf:='40_20D';
  11:sf:='40_30D';
  12:sf:='60_30D';
  13:sf:='60_40D';
  14:sf:='60_30G';
  end;
  sf:=sf+'/';
  s1:='';s2:='';
    if copy(dms.s_tovarnom.AsString,5,1)='.' then begin
      s1:='kod: '+copy(dms.s_tovarnom.AsString,1,4);
      s2:=copy(dms.s_tovarnom.AsString,7,length(dms.s_tovarnom.AsString)-6);
   end
   else
   begin
      s1:='';s2:=dms.s_tovarnom.AsString;
   end;
  razmer:=14;
  if sotish.Value>0 then begin
    frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+sf+'shtrix58_2.fr3');
    //if Length(DMS.s_tovarnom.AsString)>27 then razmer:=12;
    //if Length(DMS.s_tovarnom.AsString)>31 then razmer:=10;
  end
  else
  begin
    frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+sf+'shtrix58_1.fr3');

    razmer:=16;
    //if Length(DMS.s_tovarnom.AsString)>27 then razmer:=12;
    //if Length(DMS.s_tovarnom.AsString)>31 then razmer:=10;
  end;
  frxsf.Variables['tovarkod']:=''''+s1+'''';
  frxsf.Variables['tovarnom']:=''''+s2+'''';
  sh:= frxsf.FindObject('shtrix') as TfrxBarCodeView;
  sh.Expression:=dms.s_tovarshtrix.AsString;
  frxsf.PrintOptions.Printer := setup.yorliqPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.Copies := Copies.Value;
  frxsf.PrintOptions.ShowDialog := false;
  frxsf.Print;
end;

procedure Ts_tovar.katChange(Sender: TObject);
begin
  if kat.Value = null then begin turiClick(Sender); exit;end;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and kat = '+IntToStr(kat.value));
  dms.s_tovar.SQL.Add(' order by '+sarala.Value);

  dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
end;

procedure Ts_tovar.katEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  kat.Value := null;  turiClick(Sender);
end;

procedure Ts_tovar.brendEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  brend.Value := null;  turiClick(Sender);

end;

procedure Ts_tovar.brendChange(Sender: TObject);
begin
  if brend.Value = null then begin turiClick(Sender); exit;end;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and brend = '+IntToStr(brend.value)+' ');
  dms.s_tovar.SQL.Add(' order by '+sarala.Value);
 dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';

end;

procedure Ts_tovar.sotishEnter(Sender: TObject);
begin
  if DMS.qoldiq.RecordCount=0 then exit;
  DMS.s_tovar.Edit;
  DMS.s_tovarsotish.AsInteger:=DMS.qoldiqsotish.AsInteger;
  DMS.s_tovar.Post;
end;

procedure Ts_tovar.Bajarilganamallar1Click(Sender: TObject);
begin
  tovar_amal(DMS.s_tovarid.AsInteger);
end;

procedure Ts_tovar.gqoldirDblClick(Sender: TObject);
begin
  if admin_type<>'2' then exit;
  if dms.qoldiq.RecordCount=0 then begin
    if dms.s_tovar.RecordCount=0 then begin
    ShowMessage('Tovar tanlanmagan');ActiveControl:=gclient;Exit;
  end;
  dms.qoldiq.append;
  dms.qoldiq.FieldByName('asos_id').AsInteger:=0;
  dms.qoldiq.FieldByName('tovar_id').AsInteger:=dms.s_tovarid.AsInteger;
  dms.qoldiq.FieldByName('user_id').AsInteger:=strtoint(admin_id);
  dms.qoldiq.FieldByName('turi').AsInteger:=dms.s_tovarturi.AsInteger;
  dms.qoldiq.FieldByName('foiz').AsInteger:=20;
  dms.qoldiq.FieldByName('qrkod').AsInteger:=0;
  if dms.s_tovar.FieldByName('kol_in').AsInteger>0 then
  begin
    s_ostatka.Gichki.Visible:=true;
  end
  else
  begin
    s_ostatka.Gichki.Visible:=false;
  end;
  
  dms.qoldiq.FieldByName('resept').AsInteger:=dms.s_tovarresept.AsInteger;
  dms.qoldiq.FieldByName('izm_id').AsInteger:=dms.s_tovarizm_id.AsInteger;
  dms.qoldiq.FieldByName('izm1').AsInteger:=dms.s_tovarizm1.AsInteger;
  dms.qoldiqqrkod.Value:=0;
  {if dms.s_tovarturi.AsInteger=1 then
  begin
    dms.qoldiq.FieldByName('sotish').AsFloat:=dms.s_tovaraniq.AsFloat;
    dms.qoldiq.FieldByName('sena').AsFloat:=dms.s_tovaraniq.AsFloat/(20/100+1);
  end
  else}
    dms.qoldiq.FieldByName('sotish').AsFloat:=0;
    s_ostatka.showmodal;

  end
  else
  begin
    dms.qoldiq.Edit;
    s_ostatka.showmodal;
  end;
end;

procedure Ts_tovar.Q1Click(Sender: TObject);
var s:string;
begin
  if setup.kod.Text<>'2290' then exit;
  Memotb.Visible:=True;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  dms.s_tovar.First;
  while not dms.s_tovar.Eof do begin
    dms.qoldiq.First;
    if dms.qoldiq.RecordCount>0 then
    begin
      Memotb.Lines.add(dms.s_tovarsena.AsString+'<> ombor='+dms.qoldiqsena.AsString);
      dms.s_tovar.Edit;dms.s_tovarsena.AsFloat:=dms.qoldiqsena.AsFloat;dms.s_tovar.post;
    end;
    dms.s_tovar.Next;
  end;
  ShowMessage('Sabr uchun raxmat !!!');
end;

procedure Ts_tovar.N31Click(Sender: TObject);
begin
  //dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  //dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1');
  //dms.s_tovar.open;
  //if shtrix.Text<>'28012013' then exit;
  if MessageDlg('Qayta hisoblamoqchimisiz ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  dms.s_tovar.First;
  Memotb.Visible:=True;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  while not dms.s_tovar.Eof do begin
    dms.qoldiq.First;
    while not dms.qoldiq.Eof do begin
      dms.qoldiq.edit;
      if (dms.qoldiqsotish_d.AsFloat=0) then
        dms.qoldiqsotish_d.AsFloat:=dms.s_tovarsotish_d.AsFloat;
      if (dms.qoldiqsena_d.AsFloat=0) then
        dms.qoldiqsena_d.AsFloat:=dms.s_tovarsena_d.AsFloat;
      dms.qoldiq.Post;
      dms.qoldiq.Next;
    end;
    dms.s_tovar.Next;
  end;
  ShowMessage('Sabr uchun raxmat !!!');
end;

procedure Ts_tovar.g2Click(Sender: TObject);
begin
  if setup.kod.Text<>'2290' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * from asos WHERE tur_oper=5 and client_id='+dms.s_clientid.AsString);
  dms.link.open;

  Memotb.Visible:=True;dms.s_tovar.First;
  while not dms.s_tovar.Eof do begin
    if dms.qoldiq.RecordCount=0 then begin
    dms.qoldiq.Append;
    dms.qoldiqsena_d.AsFloat:=dms.s_tovarsena_d.AsFloat;
    dms.qoldiqsena.AsFloat:=dms.s_tovarsena.AsFloat;

    dms.qoldiqopt1.AsInteger:=dms.s_tovarulg1.AsInteger;
    dms.qoldiqopt1_pl.AsInteger:=dms.s_tovarulg1_pl.AsInteger;
    dms.qoldiqopt2.AsInteger:=dms.s_tovarulg2.AsInteger;
    dms.qoldiqopt2_pl.AsInteger:=dms.s_tovarulg2_pl.AsInteger;
    dms.qoldiqschet.AsInteger:=dms.s_tovarbank.AsInteger;
    dms.qoldiqsotish_d.AsFloat:=dms.s_tovarsotish_d.AsFloat;
    dms.qoldiqsotish.AsFloat:=dms.s_tovarsotish.AsFloat;
    dms.qoldiqtovar_id.AsInteger:=dms.s_tovarid.AsInteger;
    dms.qoldiqkol.AsInteger:=100000;dms.qoldiqkol_ost.AsInteger:=100000;
    dms.qoldiq.FieldByName('asos_id').AsInteger:=dms.link.fieldbyname('id').AsInteger;

    if dms.s_tovarkol_in.AsInteger>1 then begin
      if dms.qoldiqsotish.AsInteger>0 then DMS.qoldiqsotish_in.Value:=RoundTo(DMS.qoldiqsotish.AsInteger/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if dms.qoldiqschet.AsInteger>0 then DMS.qoldiqschet_in.Value:=RoundTo(dms.qoldiqschet.AsInteger/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if dms.qoldiqopt1.AsInteger>0 then DMS.qoldiqopt1_in.Value:=RoundTo(dms.qoldiqopt1.AsInteger/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if dms.qoldiqopt1_pl.AsInteger>0 then DMS.qoldiqopt1_pl_in.Value:=RoundTo(dms.qoldiqopt1_pl.AsInteger/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if dms.qoldiqopt2.AsInteger>0 then DMS.qoldiqopt2_in.Value:=RoundTo(dms.qoldiqopt2.AsInteger/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if dms.qoldiqopt2_pl.AsInteger>0 then DMS.qoldiqopt2_pl_in.Value:=RoundTo(dms.qoldiqopt2_pl.AsInteger/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    end;
    dms.qoldiq.Post;
    end;
    dms.s_tovar.Next;
  end;
end;

procedure Ts_tovar.Image3Click(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 ');
  dms.s_tovar.SQL.Add(' order by '+sarala.Value);
  dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';

end;

procedure Ts_tovar.s1Click(Sender: TObject);
begin
  if setup.kod.Text<>'2290' then exit;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('SELECT * FROM asos_slave where del_flag=1 and tovar_id=:id  order by id desc');
  dms.qoldiq.open;dms.s_tovar.Open;dms.s_tovar.First;
  Memotb.Visible:=True;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  while not dms.s_tovar.Eof do begin
    dms.qoldiq.First;
    while not dms.qoldiq.Eof do begin
      if ((dms.qoldiqsena.AsString='') or (dms.qoldiqsena.AsInteger=0)) and (dms.s_tovarsena.AsInteger>0) then begin
        Memotb.Lines.add(dms.s_tovarnom.AsString+dms.qoldiqsena.AsString+'<> baza='+dms.s_tovarsena.AsString);
        dms.qoldiq.edit;
        dms.qoldiqsena.AsFloat:=dms.s_tovarsena.AsFloat;
        if dms.s_tovarkol_in.AsInteger>1 then
          DMS.qoldiqsena_in.AsFloat:=RoundTo(DMS.qoldiqsena.AsInteger/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value)
        else
          DMS.qoldiqsena_in.AsFloat:=0;
        dms.qoldiq.Post;
      end;
      dms.qoldiq.Next;
    end;
    dms.s_tovar.Next;
  end;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('SELECT * FROM asos_slave where del_flag=1 and tovar_id=:id  and tovar_nom is null  order by id desc');
  dms.qoldiq.open;

end;

procedure Ts_tovar.q2Click(Sender: TObject);
var s,q:string;i,x:integer;
begin
  if setup.kod.Text<>'2290' then exit;
  if MessageDlg('Qayta hisoblamoqchimisiz ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  dms.s_tovar.Close;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 order by id');
  //dms.s_tovar.SQL.Add('select * from s_tovar WHERE id=89');
  dms.s_tovar.open;
  Memotb.Visible:=True;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  dms.s_tovar.First;
  while not dms.s_tovar.Eof do begin
    s:=dms.s_tovarnom.AsString;
    if s='' then s:='tovar';
    x:=0;
    for i:=1 to 10 do begin
      q:=S[i];
      if (S[i] in ['0'..'9']) or (S[i] in [',','.',' ','/','\']) then
        x:=x+1
      else
       break;
    end;
    if x>0 then
    s:=copy(s,x+1,length(s)-x);
    dms.s_tovar.Edit;
    dms.s_tovarnom_ru.AsString:=s;
    dms.s_tovarnom_sh.AsString:=s;
    dms.s_tovar.Post;
    dms.s_tovar.Next;
  end;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 order by id');
  //dms.s_tovar.SQL.Add('select * from s_tovar WHERE id=89');
  dms.s_tovar.open;
  dms.s_client.Edit;
  dms.s_clientlastta_id.AsInteger:=0;
  dms.s_client.Post;x:=0;
  while not dms.s_tovar.Eof do begin
    dms.s_tovar.Edit;
    x:=x+1;
    dms.s_tovarnom.AsString:=_IntToStr(x,4)+'. '+dms.s_tovarnom_ru.AsString;
    dms.s_tovarnom_sh.AsString:=_IntToStr(x,4)+'. '+dms.s_tovarnom_ru.AsString;
    dms.s_tovar.Post;
    dms.s_tovar.Next;
  end;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 order by nom');
  dms.s_tovar.open;
  showmessage('Jarayon yaqunlandi !!!');
end;

procedure Ts_tovar.E1Click(Sender: TObject);
var firstRow,i,col,tkol_in,tsoni:integer;s,ustun:string;bir:Double;
begin
  with dms.s_tovar do begin
  first;
  ExcelCreateApplication('Tovar baza', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=30;Sheet.Columns[3].ColumnWidth :=20;
  Sheet.Columns[4].ColumnWidth := 8;Sheet.Columns[5].ColumnWidth :=12;Sheet.Columns[6].ColumnWidth := 12;
  Sheet.Columns[7].ColumnWidth := 12;Sheet.Columns[8].ColumnWidth :=12;Sheet.Columns[9].ColumnWidth :=12;
  firstRow:=10;//progressl_lk.Percent:=0;
  col:=0;
  for i:=0 to RecordCount-1 do begin
  //for i:=0 to 5 do begin
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);inc(col);
    Sheet.Cells[firstrow+i,2]:=fieldbyname('nom').AsString;Sheet.Cells[firstrow+i,3]:=fieldbyname('s_kat').AsString;
    Sheet.Cells[firstrow+i,4]:=fieldbyname('kol_in').AsString;Sheet.Cells[firstrow+i,4].NumberFormat := '0';
    Sheet.Cells[firstrow+i,5]:=fieldbyname('sotish').AsString;Sheet.Cells[firstrow+i,5].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,6]:=fieldbyname('ulg1').AsString;Sheet.Cells[firstrow+i,6].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,7]:=fieldbyname('ulg1_pl').AsString;Sheet.Cells[firstrow+i,7].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,8]:=fieldbyname('ulg2').AsString;Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,9]:=fieldbyname('ulg2_pl').AsString;Sheet.Cells[firstrow+i,9].NumberFormat := '0,00';
    DMS.qoldiq.First;tsoni:=0;
    while not DMS.qoldiq.eof do begin
      tsoni:=tsoni+DMS.qoldiqkol_ost.AsInteger;
      DMS.qoldiq.Next;
    end;
    //progressl_lk.Percent:=Trunc((i)/(RecordCount-1)*100);
    Sheet.Cells[firstrow+i,10]:=IntToStr(tsoni);Sheet.Cells[firstrow+i,10].NumberFormat := '0';

    next;
  end;
  //progressl_lk.Percent:=100;
  Sheet.Cells[firstRow-1,1] := '№';//Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2] := 'tovar nomi';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,3] := 'Kategoriya';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,4] := 'ichki soni';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,5] := 'chakana';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,6] := 'ulgurgi_1';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,7] := 'ulgurgi_1 pl';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,8] := 'ulgurgi_2';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,9] := 'ulgurgi_2 pl';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,10] := 'qoldiq soni';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  //inc(col);//Sheet.Cells[firstrow+col,2] := 'Jami:';
  //Sheet.Cells[firstrow+col,3].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  ustun:='J';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Tovarlar r`oyhati';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=dms.s_clientnom.AsString;Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=Today;Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end;

end;

procedure Ts_tovar.holatChange(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  case holat.Value of
    1:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and holat = 1 ');
    2:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and holat = 0 ');
  else
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 ');
  end;
  dms.s_tovar.SQL.Add(' order by '+sarala.Value);
  dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
end;

procedure Ts_tovar.H1Click(Sender: TObject);
begin
  DMS.s_tovar.Edit;
  if DMS.s_tovarholat.AsInteger=1 then
    DMS.s_tovarholat.Value:=0
  else
    DMS.s_tovarholat.Value:=1;
  DMS.s_tovar.Post;
end;

procedure Ts_tovar.Oxirgisenavasotishnitovarbazagayozzero1Click(
  Sender: TObject);
begin
  if setup.kod.Text<>'2290' then exit;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('SELECT * FROM asos_slave where del_flag=1 and tovar_id=:id  order by id desc');
  dms.qoldiq.open;dms.s_tovar.Open;dms.s_tovar.First;
  Memotb.Visible:=True;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  while not dms.s_tovar.Eof do begin
    dms.qoldiq.First;
      dms.s_tovar.edit;
      dms.s_tovarsena.AsFloat:=dms.qoldiqsena.AsFloat;
      dms.s_tovarsotish.AsFloat:=dms.qoldiqsotish.AsFloat;
      dms.s_tovarsena_d.AsFloat:=dms.qoldiqsena_d.AsFloat;
      dms.s_tovarsotish_d.AsFloat:=dms.qoldiqsotish_d.AsFloat;
      dms.s_tovar.Post;
    dms.s_tovar.Next;
  end;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('SELECT * FROM asos_slave where del_flag=1 and tovar_id=:id  and tovar_nom is null  order by id desc');
  dms.qoldiq.open;
end;

procedure Ts_tovar.Shtrixnixotiragasaqlash1Click(Sender: TObject);
begin
  Clipboard.AsText:=dms.s_tovarshtrix.AsString;
end;

procedure Ts_tovar.Ichkishtrixnixotiragasaqlash1Click(Sender: TObject);
begin
  Clipboard.AsText:=dms.s_tovarshtrix_full.AsString;

end;

procedure Ts_tovar.CopiesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    if dms.s_tovarshtrix_full.AsString<>'' then
      pechat20Click(Sender)
    else
      pechat40Click(Sender);
  end;
end;

procedure Ts_tovar.saralaChange(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 ');
  dms.s_tovar.SQL.Add(' order by '+sarala.Value);
  dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';

end;

procedure Ts_tovar.pechat20Click(Sender: TObject);
var s1,s2,sf:string;Top1String:TfrxMemoView;sh:TfrxBarCodeView;razmer,i:Integer;
begin
  {if dms.s_tovarshtrix_in.AsString='' then begin
    ShowMessage('Ichki shtrix kodni kiriting');exit;
  end;}
  if (dms.s_tovarsennik.AsInteger>0) then begin
    Copies.Value:=dms.s_tovarsennik.AsInteger;
  end;

  if (dms.s_tovarshtrix_in.AsString='0') or (dms.s_tovarshtrix_in.AsString='') then begin
    dms.s_client.Refresh;
    s1:=_IntToStr(dms.s_clientlasttz_id.AsInteger+1,5);
    dms.s_client.Edit;dms.s_clientlasttz_id.AsInteger:=strtoint(s1);dms.s_client.post;
    dms.s_tovar.Edit;
    dms.s_tovarshtrix_in.AsString:=s1;
    dms.s_tovarshtrix_full.AsString:='20'+dms.s_tovarshtrix_in.AsString+'00000';
    i:= StrToInt(copy(dms.s_tovarshtrix_full.AsString,2,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,4,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,6,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,8,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,10,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,12,1));
    i:=i*3;
    i:=i+StrToInt(copy(dms.s_tovarshtrix_full.AsString,1,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,3,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,5,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,7,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,9,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,11,1));
    i:=strtoint(copy(inttostr(i), length(IntToStr(i)) ,1)   );
    if i=0 then i:=0 else i:=10-i;
    dms.s_tovarshtrix_full.AsString:=dms.s_tovarshtrix_full.AsString+IntToStr(i);
    dms.s_tovar.Post;
    DMS.tshtrix.Append;
    DMS.tshtrix.fieldbyname('nom').AsString:=dms.s_tovarshtrix_full.AsString;
    DMS.tshtrix.fieldbyname('tovar_id').AsInteger:=DMS.s_tovarid.AsInteger;
    DMS.tshtrix.fieldbyname('turi').AsInteger:=2;
    DMS.tshtrix.post;
  end;
  case f.value of
  1:sf:='30_20';
  2:sf:='30_30';
  3:sf:='30_40';
  4:sf:='40_20';
  5:sf:='40_30';
  6:sf:='60_30';
  7:sf:='60_40';
  8:sf:='30_20D';
  9:sf:='30_30D';
  10:sf:='40_20D';
  11:sf:='40_30D';
  12:sf:='60_30D';
  13:sf:='60_40D';
  14:sf:='60_30G';
  end;
  sf:=sf+'/';

  s1:='';s2:='';
  if copy(dms.s_tovarnom.AsString,5,1)='.' then begin
      s1:='kod: '+copy(dms.s_tovarnom.AsString,1,4);
      s2:=copy(dms.s_tovarnom.AsString,7,length(dms.s_tovarnom.AsString)-6);
   end
   else
   begin
      s1:='';s2:=dms.s_tovarnom.AsString;
   end;

  razmer:=14;
  rec_asos_t:=dms.s_tovarid.AsInteger;
  dms.s_tovar.Edit;
  if dms.s_tovarkg.AsInteger>0 then
    dms.s_tovarshtrix_full.AsString:='20'+dms.s_tovarshtrix_in.AsString+_IntToStr(dms.s_tovarkg.AsInteger,5)
  else
    dms.s_tovarshtrix_full.AsString:='20'+dms.s_tovarshtrix_in.AsString+'00000';
  dms.s_tovar.post;
  dms.s_tovar.Edit;
  i:= StrToInt(copy(dms.s_tovarshtrix_full.AsString,2,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,4,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,6,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,8,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,10,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,12,1));
  i:=i*3;
  i:=i+StrToInt(copy(dms.s_tovarshtrix_full.AsString,1,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,3,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,5,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,7,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,9,1))+StrToInt(copy(dms.s_tovarshtrix_full.AsString,11,1));
  i:=strtoint(copy(inttostr(i), length(IntToStr(i)) ,1)   );
  if i=0 then i:=0 else i:=10-i;
  dms.s_tovarshtrix_full.AsString:=dms.s_tovarshtrix_full.AsString+IntToStr(i);
  if dms.s_tovarsennik.AsInteger>0 then dms.s_tovarsennik.AsInteger:=0-dms.s_tovarsennik.AsInteger;
  dms.s_tovar.post;
  if sotish.Value>0 then begin
    frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+sf+'shtrix58_3.fr3');
    if Length(DMS.s_tovarnom.AsString)>27 then razmer:=12;
    if Length(DMS.s_tovarnom.AsString)>31 then razmer:=10;
  end
  else
  begin
    frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+sf+'shtrix58_1.fr3');
    //if Length(DMS.s_tovarnom.AsString)>27 then razmer:=12;
    //if Length(DMS.s_tovarnom.AsString)>31 then razmer:=10;
  end;
  frxsf.Variables['tovarkod']:=''''+s1+'''';
  frxsf.Variables['tovarnom']:=''''+s2+'''';
  frxsf.PrintOptions.Printer := setup.yorliqPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.Copies := Copies.Value;
  frxsf.PrintOptions.ShowDialog := false;
  sh:= frxsf.FindObject('shtrix') as TfrxBarCodeView;
  sh.Expression:=dms.s_tovarshtrix_full.AsString;
  //frxsf.ShowReport;
  frxsf.Print;
  dms.s_tovar.Locate('id',rec_asos_t,[loCaseInsensitive]);
  Edit1.SetFocus;
end;

procedure Ts_tovar.Ichkishtrixnixotiragasaqlash2Click(Sender: TObject);
begin
 if MessageDlg('Ushnu tovar ishki shtrixini o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  DMS.s_tovar.Edit;
  DMS.s_tovarshtrix_full.AsVariant:=null;
  DMS.s_tovarshtrix_in.AsVariant:=null;
  DMS.s_tovar.Post;

end;

procedure Ts_tovar.RzBitBtn1Click(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select shtrix, COUNT(shtrix) AS count from s_tovar where del_flag=1  GROUP BY shtrix HAVING count > 1');
  dms.link.open;
end;

procedure Ts_tovar.RzBitBtn2Click(Sender: TObject);
begin

  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar where del_flag=1 and shtrix = "'+dms.link.fieldbyname('shtrix').AsString+'"');
  dms.s_tovar.open;dms.link.Next;
end;

procedure Ts_tovar.RzBitBtn3Click(Sender: TObject);
var shid:String;
begin
  if dms.s_tovar.RecordCount>7 then exit;
  dms.s_tovar.First;shid:=dms.s_tovar.fieldbyname('id').AsString;
  while not dms.s_tovar.eof do begin
    dms.s_tovar.next;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('update asos_slave set polka="'+shid+'",tovar_id='+shid+' where tovar_id='+dms.s_tovar.fieldbyname('id').AsString);
    dms.main_link.ExecSQL;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('update s_tovar set del_flag=0,zavod_id='+shid+' where id='+dms.s_tovar.fieldbyname('id').AsString);
    dms.main_link.ExecSQL;
  end;
  dms.s_tovar.refresh;
end;

procedure Ts_tovar.RzBitBtn4Click(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('SELECT LEFT(nom, 5) as snom,nom, COUNT(LEFT(nom, 5)) AS count from s_tovar where del_flag=1 GROUP BY snom HAVING count > 1');
  dms.link.open;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar where del_flag=1 and nom like "%'+dms.link.fieldbyname('snom').AsString+'%"');
  dms.s_tovar.open;
end;

procedure Ts_tovar.Label12DblClick(Sender: TObject);
begin
  if GroupBox2.Visible=true then GroupBox2.Visible:=false else GroupBox2.Visible:=True;
end;

procedure Ts_tovar.startClick(Sender: TObject);
begin
  if Timer1.Enabled=true then begin
    Timer1.Enabled:=false;
    start.Caption:='Start';
  end
  else
  begin
    start.Caption:='Stop';
    Timer1.Enabled:=true;
  end;
end;

procedure Ts_tovar.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.sql.add('SELECT * FROM s_tovar where  del_flag=1 and client_id = '+admin_clid+' and sennik > 0 order by id');
  dms.s_tovar.Open;
  if dms.s_tovar.RecordCount=0 then begin Timer1.Enabled:=true;exit;  end;
  pechat20Click(Sender);
  dms.s_tovar.Refresh;
  Timer1.Enabled:=True;
end;

procedure Ts_tovar.zaprosClick(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.sql.add('SELECT * FROM s_tovar where  del_flag=1 and client_id = '+admin_clid+' and sennik > 0 order by id');
  dms.s_tovar.Open;
  dms.s_tovar.Refresh;

end;

procedure Ts_tovar.RzBitBtn5Click(Sender: TObject);
begin
  dms.s_tovar.First;
  while not dms.s_tovar.Eof do begin
    {if dms.qoldiq.RecordCount=0 then
    begin
      dms.s_tovar.Edit;
      dms.s_tovardel_flag.AsFloat:=0;
      dms.s_tovarnom.AsString:=dms.s_tovarnom.AsString+' !';
      dms.s_tovar.post;
    end;}
    dms.qoldiq.First;
    if (dms.qoldiq.RecordCount=2)  then
    begin
      dms.qoldiq.Edit;
      dms.qoldiq.FieldByName('del_flag').AsFloat:=0;
      dms.qoldiq.post;
    end;
    dms.s_tovar.Next;
  end;
end;

procedure Ts_tovar.inventarExit(Sender: TObject);
var oldinvkol:integer;
begin
  // kol_in ???
  if DMS.s_tovar.RecordCount=0 then exit;
  if DMS.qoldiq.RecordCount<>1 then exit;
  
  if dms.s_tovarinvkol.AsInteger>0 then begin
     if MessageDlg('Ushnu tovar inventar bo`lgan, tahrirlaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNO then
     begin
        dms.s_tovar.Cancel;
        exit;
     end;
  end;
  if DMS.s_tovar.State <> dsBrowse then
  begin
    DMS.s_tovarinvsana.AsDateTime:=dms.setupvaqt.AsDateTime;
    DMS.s_tovarupakavka.AsVariant:=null;
    DMS.s_tovar.Post;
  end;
  if DMS.s_tovarinvkol.AsInteger=0 then exit;
  DMS.qoldiq.Last;
  DMS.qoldiq.Edit;
  DMS.qoldiqkol.AsInteger:=DMS.s_tovarinvkol.AsInteger;
  DMS.qoldiqkol_ost.AsInteger:=DMS.s_tovarinvkol.AsInteger;
  DMS.qoldiq.Post;

end;

procedure Ts_tovar.inventarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    inventarExit(Sender);
    Edit1.SetFocus;
  end;
end;

procedure Ts_tovar.invClick(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  case inv.ItemIndex of
  0:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 ');
  1:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and invkol>0 ');
  2:dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and (invkol=0 or invkol is null) ');
  end;
  dms.s_tovar.SQL.Add(' order by '+sarala.Value);
  dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
end;

procedure Ts_tovar.FormClose(Sender: TObject; var Action: TCloseAction);
var s:string;F:TextFile;i:Integer;
begin
  tarozi.qoldiq.Close;tarozi.qoldiq.SQL.Clear;
  tarozi.qoldiq.SQL.add('select id,nom,sotish,shtrix_in,shtrix from s_tovar where del_flag=1 and sotish>1000 and kol_in=1000 order by kat');
  tarozi.qoldiq.open;i:=0;
    Assignfile(f,ExtractFilePath(Application.ExeName)+'tarozi.txt');Rewrite(f);
    while not tarozi.qoldiq.Eof do begin
      inc(i);
      if(tarozi.qoldiq.Fieldbyname('shtrix_in').AsString='') then
      //ShowMessage(tarozi.qoldiq.Fieldbyname('nom').AsString +' ga ichki shtrix kerak')
      else
      s:=inttostr(i)+';'+tarozi.qoldiq.Fieldbyname('nom').AsString+';;'+tarozi.qoldiq.Fieldbyname('sotish').AsString+';0;0;0;'+inttostr(strtoint(tarozi.qoldiq.Fieldbyname('shtrix_in').AsString))+';0;0;;15.02.21;0;0;0;0;01.01.01';
      writeln(f,s);
      tarozi.qoldiq.Next;
    end;
    CloseFile(f);

end;

procedure Ts_tovar.N10somgachayaxlitlash1Click(Sender: TObject);
var s:string;i:integer;
begin
  if setup.kod.Text<>'2290' then exit;
  Memotb.Visible:=True;
  //s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  //dms.s_tovar.First;
  i:=0;
  while not dms.s_tovar.Eof do begin
    dms.qoldiq.First;
    while not dms.qoldiq.Eof do begin
      if dms.qoldiqsotish.AsFloat<>SimpleRoundTo(dms.qoldiqsotish.AsFloat,1) then begin
        inc(i);
        //ShowMessage(FloatToStr(SimpleRoundTo(dms.qoldiqsotish.AsFloat,1)));
        Memotb.Lines.add(IntToStr(i)+'. '+dms.qoldiqsotish.AsString+' 10 s`om '+FloatToStr(SimpleRoundTo(dms.qoldiqsotish.AsFloat,1)));
        dms.qoldiq.Edit;
        dms.qoldiqsotish.AsFloat:=SimpleRoundTo(dms.qoldiqsotish.AsFloat,1);
        dms.qoldiq.post;
      end;
      dms.qoldiq.Next;
    end;
    dms.s_tovar.Next;
  end;

end;

procedure Ts_tovar.N2Click(Sender: TObject);
var firstRow,i,col,tkol_in,tsoni:integer;s,ustun:string;bir:Double;
begin
  with dms.s_tovar do begin
  first;
  ExcelCreateApplication('Tovar baza', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=50;Sheet.Columns[3].ColumnWidth :=20;
  Sheet.Columns[4].ColumnWidth := 8;Sheet.Columns[5].ColumnWidth :=12;Sheet.Columns[6].ColumnWidth :=12;Sheet.Columns[7].ColumnWidth := 12;

  firstRow:=10;//progressl_lk.Percent:=0;
  col:=0;
  for i:=0 to RecordCount-1 do begin
    DMS.qoldiq.First;
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);inc(col);
    Sheet.Cells[firstrow+i,2]:=fieldbyname('nom').AsString;
    Sheet.Cells[firstrow+i,3]:=DMS.qoldiqsotish.AsString;Sheet.Cells[firstrow+i,3].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,4]:=DMS.qoldiqopt1.AsString;Sheet.Cells[firstrow+i,4].NumberFormat := '0,00';
    Sheet.Cells[firstrow+i,5]:=DMS.qoldiqkol.AsString;Sheet.Cells[firstrow+i,4].NumberFormat := '0';
    next;
  end;
  Sheet.Cells[firstRow-1,1] := '№';//Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2] := 'tovar nomi';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,3] := 'Narxi';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,4] := 'ottom';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,5] := 'Qoldiq';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  ustun:='E';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Price ';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=dms.s_clientnom.AsString;Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=Today;Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end;

end;

procedure Ts_tovar.fChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','formatshtrix',IntToStr(f.value));IniFile.Destroy;
end;

procedure Ts_tovar.Pricev21Click(Sender: TObject);
var firstRow,i,kol_sum,col,tkol_in,tsoni:integer;s,ustun:string;bir:Double;
begin
  with dms.s_tovar do begin
  first;
  ExcelCreateApplication('Tovar baza', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=50;Sheet.Columns[3].ColumnWidth :=10;
  Sheet.Columns[4].ColumnWidth := 5;Sheet.Columns[5].ColumnWidth := 5;Sheet.Columns[6].ColumnWidth := 20;
  Sheet.Columns[7].ColumnWidth :=20;Sheet.Columns[8].ColumnWidth := 12;Sheet.Columns[9].ColumnWidth := 12;
  firstRow:=10;col:=0;
  for i:=0 to RecordCount-1 do begin
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);inc(col);
    Sheet.Cells[firstrow+i,2].NumberFormat := '@';Sheet.Cells[firstrow+i,2]:=fieldbyname('nom').AsString;
    Sheet.Cells[firstrow+i,3]:=fieldbyname('kol_in').AsString;
    Sheet.Cells[firstrow+i,4]:=fieldbyname('kat').AsString;
    Sheet.Cells[firstrow+i,5]:=fieldbyname('brend').AsString;
    Sheet.Cells[firstrow+i,6].NumberFormat := '@';Sheet.Cells[firstrow+i,6]:=fieldbyname('shtrix').AsString;
    Sheet.Cells[firstrow+i,7].NumberFormat := '@';Sheet.Cells[firstrow+i,7]:=fieldbyname('shtrix_full').AsString;
    DMS.qoldiq.First;
    if dms.s_clientdollar.AsInteger=2 then begin
      if DMS.qoldiqsena_d.AsFloat =0 then Sheet.Cells[firstrow+i,8]:='0' else Sheet.Cells[firstrow+i,8]:=DMS.qoldiqsena_d.AsString;
      Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
      if DMS.qoldiqsotish_d.AsFloat =0 then Sheet.Cells[firstrow+i,9]:='0' else Sheet.Cells[firstrow+i,9]:=DMS.qoldiqsotish_d.AsString;
      Sheet.Cells[firstrow+i,9].NumberFormat := '0,00';
    end
    else
    begin
      Sheet.Cells[firstrow+i,8]:=DMS.qoldiqsena.AsString;Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
      Sheet.Cells[firstrow+i,9]:=DMS.qoldiqsotish.AsString;Sheet.Cells[firstrow+i,9].NumberFormat := '0,00';
    end;
    kol_sum:=0;
    while not DMS.qoldiq.Eof do begin
      kol_sum:=kol_sum+DMS.qoldiqkol_ost.AsInteger;
      DMS.qoldiq.next;
    end;
    Sheet.Cells[firstrow+i,10]:=inttostr(kol_sum);Sheet.Cells[firstrow+i,10].NumberFormat := '0';
    next;
  end;
  Sheet.Cells[firstRow-1,1]  := '№';//Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2]  := 'tovar nomi';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,3]  := 'Ichki soni';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,4]  := 'Kat';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,5]  := 'Brand';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,6]  := 'Shtrix';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,7]  := 'Ichki shtrix';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,8]  := 'Kirim';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,9]  := 'Sotish';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,10] := 'Qoldiq';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  ustun:='J';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Price 2';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=dms.s_clientnom.AsString;Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=Today;Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end;

end;

procedure Ts_tovar.N3Click(Sender: TObject);
var sshtrin_in:string; i,row:integer;
begin
  dms.link.Close;dms.link.sql.Clear;
  dms.link.sql.Add('select id,shtrix_in,shtrix_full from s_tovar where shtrix_in <>"" order by shtrix_in');
  dms.link.open;
  sshtrin_in:=dms.link.fieldbyname('shtrix_in').AsString;
  dms.link.next;row:=0;
  //exit;
  while not dms.link.eof do begin
    if sshtrin_in = dms.link.fieldbyname('shtrix_in').AsString then begin
      dms.link.Edit;
      dms.link.fieldbyname('shtrix_in').AsVariant := null;
      dms.link.fieldbyname('shtrix_full').AsVariant := null;
      dms.link.post;
      inc(row);
    end;
    sshtrin_in:=dms.link.fieldbyname('shtrix_in').AsString;
    dms.link.next;
  end;
  ShowMessage('xatolik = '+IntToStr(row));
end;

procedure Ts_tovar.N22Click(Sender: TObject);
begin
  if setup.kod.Text<>'2290' then exit;  Memotb.Visible:=True;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  dms.s_tovar.First;
  dms.qoldiq.DisableControls;
  while not dms.s_tovar.Eof do begin
      dms.qoldiq.First;dms.qoldiq.Next;
      while not dms.qoldiq.eof do
      if dms.qoldiq.RecordCount>1 then
        dms.qoldiq.delete
      else
        dms.qoldiq.next;
    dms.s_tovar.Next;
  end;
  dms.qoldiq.EnableControls;

end;

procedure Ts_tovar.shtrixDblClick(Sender: TObject);
var s:string;
begin
  if shtrix.Text='' then exit;
  //if pos('000000',shtrix.Text)='' then shtrix.Text;
  s_ostatka.savdo.Text:='';
  if length(shtrix.Text)=13  then begin
    if (dms.ttasnif.Locate('shtrix',shtrix.Text,[loCaseInsensitive])) and (not dms.s_tovar.Locate('shtrix',shtrix.Text,[loCaseInsensitive])) then begin
      dms.s_tovar.Append;
      dms.s_tovarizm_id.AsInteger:=3;
      dms.s_tovarnom.AsString:=dms.ttasnifnom.AsString;
      dms.s_tovarnom_sh.AsString:=dms.ttasnifnom.AsString;
      dms.s_tovarnom_ru.AsString:=dms.ttasnifnom.AsString;
      dms.s_tovarshtrix.AsString:=dms.ttasnifshtrix.AsString;
      dms.s_tovarotdel.AsInteger := 0;
      dms.s_tovarturi.AsInteger:=0;dms.s_tovarresept.AsInteger:=0;
      dms.s_tovarshtrixkod.AsInteger:=1;
      dms.s_tovarqrkod.AsInteger:=0;dms.s_tovarizm1.AsInteger:=0;
      dms.s_tovaruser_id.AsInteger:=StrToInt(admin_id);
      dms.s_tovarclient_id.AsInteger:=dms.s_clientid.AsInteger;
      dms.s_tovarzavod_id.AsInteger:=1;
      s_tovar_edit.ShowModal;
    end;
  end;

  dms.link.Close;dms.link.SQL.Clear;s:=StrReplace(shtrix.Text,'http://verum.uz/qr.php?text=','');
  if pos('http://verum.uz/qr.php?text=',shtrix.Text)>0 then
  begin
    s_ostatka.savdo.Text:=s;
    dms.link.SQL.Add('select s_tovar.id,s_tovar.nom from main,s_tovar WHERE main.tovar_id=s_tovar.id and s_tovar.del_flag=1 and main.qrkod = "'+s+'"');
  end
  else
  begin
    if (copy(shtrix.Text,1,2)='20') or (copy(shtrix.Text,1,2)='21')  then
    begin
      dms.link.SQL.Add(' select * from s_tovar WHERE del_flag=1 and shtrix_in ="'+copy(shtrix.Text,3,5)+'"');
    end
    else
      dms.link.SQL.Add('select * from s_tovar WHERE del_flag=1 and (shtrix LIKE "%'+shtrix.Text+'%")');
  end;
  dms.link.open;
  if dms.link.RecordCount=0 then
  begin
    if admin_type='1' then exit;
    shtrix.Text:='';
    xnewClick(Sender);
  end
  else
  begin
    s:=StrReplace(shtrix.Text,'http://verum.uz/qr.php?text=','');
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    if pos('http://verum.uz/qr.php?text=',shtrix.Text)>0 then
    begin
      s_ostatka.savdo.Text:=s;
      dms.s_tovar.SQL.Add('select s_tovar.* from main,s_tovar WHERE main.tovar_id=s_tovar.id and s_tovar.del_flag=1 and main.qrkod = "'+s+'"');
    end
    else
    begin
      if copy(shtrix.Text,1,2)='20' then
        dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and shtrix_in ="'+copy(shtrix.Text,3,5)+'"')
      else
        dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and (shtrix LIKE "%'+shtrix.Text+'%")');
    end;
    dms.s_tovar.open;
    dms.qoldiq.Open;dms.qoldiq.refresh;

    if (kirim.Checked) then begin
      if admin_type<>'2' then exit;
      shtrix.Text:='';Menu_kirimClick(Sender);exit;
    end
    else
    begin
    shtrix.Text:='';
      if admin_type='1' then exit;
      xeditClick(Sender);exit;
    end;

  end;
  shtrix.Text:='';

end;

procedure Ts_tovar.Qoldiqiyoqtovarlarniochirish1Click(Sender: TObject);
var i:integer;
begin
  exit;
  Memotb.Visible:=True;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  dms.s_tovar.First;i:=0;
  while not dms.s_tovar.Eof do begin
    if dms.qoldiq.RecordCount=0 then
    begin
      Inc(i);
      dms.s_tovar.Delete;
      Memotb.Lines.Add(inttostr(i)+'. '+DMS.s_tovarnom.AsString);
    end
    else
    dms.s_tovar.Next;
  end;
  Memotb.Lines.Add('Jami '+inttostr(i));

end;

procedure Ts_tovar.N6kodlar1Click(Sender: TObject);
var s:string;
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id from shtrix where LENGTH(nom)<8');
  dms.link.open;
  s:='';
  while not dms.link.Eof do begin
    if s='' then
      s:=dms.link.fieldbyname('id').AsString
    else
      s:=s+','+dms.link.fieldbyname('id').AsString;
    dms.link.Next;  
  end;
  s:=' id in ('+s+')';
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE  del_flag=1 and '+s);
  dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';

end;

procedure Ts_tovar.gqoldirCellClick(Column: TColumnEh);
begin
  tqoldiq.Locate('id',DMS.qoldiqid.AsInteger,[loCaseInsensitive]);
end;

procedure Ts_tovar.Shtrixniochirish1Click(Sender: TObject);
begin
 if MessageDlg('Ushnu tovar shtrixini o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
 DMS.s_tovar.Edit;
 DMS.s_tovarshtrix.AsVariant:=null;
 DMS.s_tovar.Post;
end;

procedure Ts_tovar.gomborCellClick(Column: TColumnEh);
begin
  DMS.qoldiq.Locate('id',tqoldiq.FieldByName('id').AsInteger,[loCaseInsensitive]);
end;

procedure Ts_tovar.qaytahisoblash1Click(Sender: TObject);
begin
  hatolar.t_id.Text:=dms.s_tovarid.AsString;
  hatolar.qoldiq_tekshirClick(sender);
  tqoldiq.Refresh;
end;

procedure Ts_tovar.Omborxonagakirimqilish1Click(Sender: TObject);
begin
  if dms.s_tovar.RecordCount=0 then begin
    ShowMessage('Tovar tanlanmagan');ActiveControl:=gclient;Exit;
  end;
  DMS.asos_qoldiq.Refresh;
  //ShowMessage(dms.qoldiq.SQL.Text);
  dms.qoldiq.append;
  dms.qoldiq.FieldByName('asos_id').AsInteger:=0;
  dms.qoldiq.FieldByName('tovar_id').AsInteger:=dms.s_tovarid.AsInteger;
  dms.qoldiq.FieldByName('user_id').AsInteger:=strtoint(admin_id);
  dms.qoldiq.FieldByName('turi').AsInteger:=dms.s_tovarturi.AsInteger;
  dms.qoldiq.FieldByName('foiz').AsInteger:=20;
  dms.qoldiq.FieldByName('qrkod').AsInteger:=0;
  if dms.s_tovar.FieldByName('kol_in').AsInteger>0 then
  begin
    s_ostatka.Gichki.Visible:=true;
  end
  else
  begin
    s_ostatka.Gichki.Visible:=false;
  end;

  dms.qoldiq.FieldByName('resept').AsInteger:=dms.s_tovarresept.AsInteger;
  dms.qoldiq.FieldByName('izm_id').AsInteger:=dms.s_tovarizm_id.AsInteger;
  dms.qoldiq.FieldByName('izm1').AsInteger:=dms.s_tovarizm1.AsInteger;
  dms.qoldiqqrkod.Value:=0;
  {if dms.s_tovarturi.AsInteger=1 then
  begin
    dms.qoldiq.FieldByName('sotish').AsFloat:=dms.s_tovaraniq.AsFloat;
    dms.qoldiq.FieldByName('sena').AsFloat:=dms.s_tovaraniq.AsFloat/(20/100+1);
  end
  else}
    dms.qoldiq.FieldByName('sotish').AsFloat:=0;
    s_ostatka.showmodal;
end;

procedure Ts_tovar.pricesenasena1Click(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and (sena>=sotish or sena_d>=sotish_d) ');
  dms.s_tovar.open;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
end;

procedure Ts_tovar.yangiyil1Click(Sender: TObject);
var i,j,tsoni:integer;
begin
  if setup.kod.Text<>'2290' then exit;
  with dms.s_tovar do begin
  first;
  for i:=0 to RecordCount-1 do begin
    DMS.qoldiq.First;
    if DMS.qoldiq.RecordCount>0 then begin
      Edit;
      fieldbyname('sena').AsFloat:=DMS.qoldiqsena.AsFloat;
      fieldbyname('sotish').AsFloat:=DMS.qoldiqsotish.AsFloat;
        if DMS.qoldiqs_dollar.AsInteger=1 then begin
          fieldbyname('sena_d').AsVariant:=DMS.qoldiqsena_d.AsFloat;
          fieldbyname('sotish_d').AsVariant:=DMS.qoldiqsotish_d.AsFloat;
        end
        else begin
          fieldbyname('sena_d').AsVariant:=null;
          fieldbyname('sotish_d').AsVariant:=null;
        end;
      post;
    end;
    tsoni:=0;
    while not DMS.qoldiq.eof do begin
      DMS.qoldiq.Edit;
      DMS.qoldiqkol.AsInteger:=DMS.qoldiqkol_ost.AsInteger;
      DMS.qoldiqkol_in.AsInteger:=DMS.qoldiqkol_in_ost.AsInteger;
      DMS.qoldiq.post;
      tsoni:=tsoni+DMS.qoldiqkol.AsInteger;
      if (DMS.qoldiqkol_ost.AsInteger+DMS.qoldiqkol_ost.AsInteger)=0 then
        DMS.qoldiq.delete
      else
        DMS.qoldiq.Next;
    end;
    if tsoni>0 then begin
      DMS.qoldiq.First;
      DMS.qoldiq.Edit;
      DMS.qoldiqkol.AsInteger:=tsoni;
      DMS.qoldiq.post;
      DMS.qoldiq.Next;
      for j:=2 to DMS.qoldiq.RecordCount do begin
        DMS.qoldiq.Delete;
        DMS.qoldiq.Next;
      end;
    end;
    next;
  end;

  end;
end;

procedure Ts_tovar.Price31Click(Sender: TObject);
var firstRow,i,kol_sum,col,tkol_in,tsoni:integer;s,ustun:string;bir:Double;
begin
  with dms.s_tovar do begin
  first;
  ExcelCreateApplication('Tovar baza', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('Хато !!! Excel урнатилмаган !!!'); Exit;end;
  Sheet.Columns[1].ColumnWidth :=5;Sheet.Columns[2].ColumnWidth :=50;Sheet.Columns[3].ColumnWidth :=10;
  Sheet.Columns[4].ColumnWidth := 5;Sheet.Columns[5].ColumnWidth := 5;Sheet.Columns[6].ColumnWidth := 20;
  Sheet.Columns[7].ColumnWidth :=20;Sheet.Columns[8].ColumnWidth := 12;Sheet.Columns[9].ColumnWidth := 12;
  firstRow:=10;col:=0;
  for i:=0 to RecordCount-1 do begin
    Sheet.Cells[firstrow+i,1]:=inttostr(i+1);inc(col);
    Sheet.Cells[firstrow+i,2].NumberFormat := '@';Sheet.Cells[firstrow+i,2]:=fieldbyname('nom').AsString;
    Sheet.Cells[firstrow+i,3]:=fieldbyname('kol_in').AsString;
    Sheet.Cells[firstrow+i,4]:=fieldbyname('kat').AsString;
    Sheet.Cells[firstrow+i,5]:=fieldbyname('brend').AsString;
    Sheet.Cells[firstrow+i,6].NumberFormat := '@';Sheet.Cells[firstrow+i,6]:=fieldbyname('shtrix').AsString;
    Sheet.Cells[firstrow+i,7].NumberFormat := '@';Sheet.Cells[firstrow+i,7]:=fieldbyname('shtrix_full').AsString;
    DMS.qoldiq.First;
    if dms.s_clientdollar.AsInteger=2 then begin
      if DMS.qoldiqsena_d.AsFloat =0 then Sheet.Cells[firstrow+i,8]:='0' else Sheet.Cells[firstrow+i,8]:=DMS.qoldiqsena_d.AsString;
      Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
      if DMS.qoldiqsotish_d.AsFloat =0 then Sheet.Cells[firstrow+i,9]:='0' else Sheet.Cells[firstrow+i,9]:=DMS.qoldiqsotish_d.AsString;
      Sheet.Cells[firstrow+i,9].NumberFormat := '0,00';
    end
    else
    begin
      Sheet.Cells[firstrow+i,8]:=DMS.qoldiqsena.AsString;Sheet.Cells[firstrow+i,8].NumberFormat := '0,00';
      Sheet.Cells[firstrow+i,9]:=DMS.qoldiqsotish.AsString;Sheet.Cells[firstrow+i,9].NumberFormat := '0,00';
    end;
    kol_sum:=0;
    while not DMS.qoldiq.Eof do begin
      kol_sum:=kol_sum+DMS.qoldiqkol_ost.AsInteger;
      DMS.qoldiq.next;
    end;
    Sheet.Cells[firstrow+i,10]:=inttostr(kol_sum);Sheet.Cells[firstrow+i,10].NumberFormat := '0';
    next;
  end;
  Sheet.Cells[firstRow-1,1]  := '№';//Sheet.Range['A'+IntToStr(firstrow-2)+':A'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,2]  := 'tovar nomi';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,3]  := 'Ichki soni';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,4]  := 'Kat';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,5]  := 'Brand';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,6]  := 'Shtrix';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,7]  := 'Ichki shtrix';//Sheet.Range['B'+IntToStr(firstrow-2)+':B'+IntToStr(firstrow-1)].merge;
  Sheet.Cells[firstRow-1,8]  := 'Kirim';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,9]  := 'Sotish';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  Sheet.Cells[firstRow-1,10] := 'Qoldiq';//Sheet.Range['C'+IntToStr(firstrow-2)+':E'+IntToStr(firstrow-2)].merge;
  ustun:='J';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-1) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_telo, 'Times New Roman', 11, True, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  Sheet.Cells[2,1]:='Price 2';Sheet.Range['A2:'+ustun+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Sheet.Cells[3,1]:=dms.s_clientnom.AsString;Sheet.Range['A3:'+ustun+'3'].merge;Sheet.Cells[3,1].HorizontalAlignment := 3;
  Sheet.Cells[5,1]:=Today;Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
  end;
end;

procedure Ts_tovar.boshtovarlashniochirish1Click(Sender: TObject);
begin
  if setup.kod.Text='' then
  begin
    ShowMessage('kod ni kiriting');
    exit;
  end;
  if dms.s_tovar.RecordCount>20 then
  begin
    ShowMessage('Tovar soni 20 dan katta');
    exit;
  end;
  while not dms.s_tovar.Eof do begin
    if dms.qoldiq.RecordCount=0 then
      dms.s_tovar.Delete
    else
      dms.s_tovar.Next;
  s_tovar.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  end;
end;

end.
