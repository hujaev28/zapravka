unit fkirimh;

interface

uses
  DelphiZXingQRCode,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBCtrlsEh, DBLookupEh, StdCtrls, Mask, DBCtrls,ShellAPI,
  inifiles,db, RzButton, GridsEh, RzEdit, RzDBEdit, MemTableDataEh,
  MemTableEh, ExtCtrls, Menus, SUIPopupMenu, frxDesgn, frxClass,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RzPanel, RzDBCmbo,
  ComCtrls, WordXP, OleServer;

type
  Tkirimh = class(TForm)
    tplpopup: TsuiPopupMenu;
    newsfm: TMenuItem;
    asos: TZQuery;
    Dasos: TDataSource;
    X1: TMenuItem;
    link: TZQuery;
    Dlink: TDataSource;
    p_seriya: TRzPanel;
    main: TDBGridEh;
    RzPanel1: TRzPanel;
    g_asos: TDBGridEh;
    Gs_kurs: TDBGridEh;
    RzPanel3: TRzPanel;
    anew: TRzBitBtn;
    aedit: TRzBitBtn;
    adel: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    Label1: TLabel;
    qidir: TEdit;
    xldan: TLabel;
    sana1: TDBDateTimeEditEh;
    xlgacha: TLabel;
    sana2: TDBDateTimeEditEh;
    RzBitBtn1: TRzBitBtn;
    RzPanel4: TRzPanel;
    tovarlar_komil: TDBGridEh;
    Tovarlar: TDBGridEh;
    RzPanel2: TRzPanel;
    Edit1: TEdit;
    tozala: TRzBitBtn;
    snew: TRzBitBtn;
    sedit: TRzBitBtn;
    sdel: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    l_asos: TDBLookupComboboxEh;
    RzPanel5: TRzPanel;
    Image2: TImage;
    shtrix: TEdit;
    soni: TLabel;
    diler: TDBLookupComboboxEh;
    Label2: TLabel;
    genqr: TRzBitBtn;
    pnlDetails: TPanel;
    lblEncoding: TLabel;
    lblQuietZone: TLabel;
    lblErrorCorrectionLevel: TLabel;
    lblCorner: TLabel;
    lblDrawingMode: TLabel;
    Label3: TLabel;
    edtQuietZone: TEdit;
    edtCornerThickness: TEdit;
    udCornerThickness: TUpDown;
    udQuietZone: TUpDown;
    grpSaveToFile: TGroupBox;
    lblScaleToSave: TLabel;
    edtFileName: TEdit;
    btnSaveToFile: TButton;
    edtScaleToSave: TEdit;
    udScaleToSave: TUpDown;
    btnCopy: TButton;
    Button1: TButton;
    pgcQRDetails: TPageControl;
    tsPreview: TTabSheet;
    pbPreview: TPaintBox;
    lblQRMetrics: TLabel;
    pnlColors: TPanel;
    bvlColors: TBevel;
    lblBackground: TLabel;
    lblForeground: TLabel;
    clrbxBackground: TColorBox;
    clrbxForeground: TColorBox;
    tsEncodedData: TTabSheet;
    mmoEncodedData: TMemo;
    variant2: TButton;
    saqla: TButton;
    edtparent: TEdit;
    udparent: TUpDown;
    MSWord1: TWordApplication;
    WordDocument1: TWordDocument;
    dlgSaveToFile: TSaveDialog;
    q1: TMenuItem;
    docqr: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    test: TRzBitBtn;
    Memo1: TMemo;
    RzBitBtn6: TRzBitBtn;
    main_link: TZQuery;
    Dmain_link: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nom_shKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure anewClick(Sender: TObject);
    procedure aeditClick(Sender: TObject);
    procedure adelClick(Sender: TObject);
    procedure snewClick(Sender: TObject);
    procedure seditClick(Sender: TObject);
    procedure sdelClick(Sender: TObject);
    procedure TovarlarDblClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure g_asosCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure Gs_kursExit(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure tozalaClick(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure shtrixEnter(Sender: TObject);
    procedure shtrixKeyPress(Sender: TObject; var Key: Char);
    procedure newsfmClick(Sender: TObject);
    procedure tovarlar_komilKeyPress(Sender: TObject; var Key: Char);
    procedure TovarlarKeyPress(Sender: TObject; var Key: Char);
    procedure tovarlar_komilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TovarlarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _asosck(Sender: TObject;
      var Handled: Boolean);
    procedure qidirKeyPress(Sender: TObject; var Key: Char);
    procedure tovarlar_komilDblClick(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure linkAfterScroll(DataSet: TDataSet);
    procedure linkAfterRefresh(DataSet: TDataSet);
    procedure linkAfterPost(DataSet: TDataSet);
    procedure linkAfterOpen(DataSet: TDataSet);
    procedure qidirEnter(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure dilerChange(Sender: TObject);
    procedure dilerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure genqrClick(Sender: TObject);
    procedure q1Click(Sender: TObject);
    procedure docqrClick(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure testClick(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
  private
    FQRCode: TDelphiZXingQRCode;
    // to fix well-known Delphi 7 error with visually vanishing components
    // under Windows Vista, 7, and later
    FAltFixed: Boolean;
    procedure RemakeQR(s:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  kirimh: Tkirimh; Forward,qidr,almash,Wrap,Replace:olevariant;

implementation

{$R *.dfm}
uses fs_client,fulanish, fdms, fs_diler, fs_ombor_edit, fkirim_asos,Math,clipbrd,
  fs_tovar_kirim, fkirim_edit,fsetup,QRGraphics, QR_Win1251, QR_URL, jpeg,
  fkirim;
procedure Tkirimh.RemakeQR(s:string);
// QR-code generation
begin
  with FQRCode do
  try
    BeginUpdate;
    Data := s;
    //Encoding := cmbEncoding.ItemIndex;
    //ErrorCorrectionOrdinal := TErrorCorrectionOrdinal
    //  (cbbErrorCorrectionLevel.ItemIndex);
    QuietZone := StrToIntDef(edtQuietZone.Text, 4);
    EndUpdate(True);
    lblQRMetrics.Caption := IntToStr(Columns) + 'x' + IntToStr(Rows) + ' (' +
      IntToStr(Columns - QuietZone * 2) + 'x' + IntToStr(Rows - QuietZone * 2) +
      ')';
  finally
    pbPreview.Repaint;
  end;
end;
function _IntToStr(i, Wide: Cardinal): string;
var i1: Cardinal;
begin
  Result := '';
  repeat
    i1 := i mod 10;
    i := i div 10;
    Result := char(i1 + ord('0')) + Result;
    dec(Wide);
  until (Wide < 1) and (i < 1)
end;
procedure zamena(sqidir,salmash:string;hammasi,turi:integer);
begin
  case turi of
  0: if salmash='' then almash:='' else almash:=salmash;
  1: if salmash=Null then almash:='' else almash:=salmash;
  2: if salmash=null then almash:='' else almash:=salmash;
  end;
  qidr:=sqidir;Forward := true;Wrap:=wdFindContinue;
  if hammasi=1 then Replace:=wdReplaceAll else Replace:=EmptyParam;
  kirim.MSWord1.Selection.Find.Execute(qidr,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,Forward,Wrap,EmptyParam,almash,Replace,EmptyParam,EmptyParam,EmptyParam,EmptyParam);
  end;
function RandString(Len:word; LCase, UpCase, Digit, SpecSymb:boolean):string;
  const symLCase='abc1de2fg3hi4jk5lmn6opq7rs8tuv9wxyz';symUCase='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  symNum ='0123456789';symSpecSymb = '[]{},.";:-+#';
var name,symb:string;i:word;
begin
 if LCase then symb:=symb+symLCase; if UpCase then symb:=symb+symUCase;
 if Digit then symb:=symb+symNum; if SpecSymb then symb:=symb+symSpecSymb;
 if symb='' then symb:=symLCase;name:='';Randomize;
 for i := 1 to Len do name:=name+symb[random(length(symb))+1];
 Result:=Name;
end;

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
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
function StrReplace(const Str, Str1, Str2: string): string;
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

procedure Tkirimh.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tkirimh.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tkirimh.FormCreate(Sender: TObject);
var IniFile:TIniFile;H: Integer;
begin
  FQRCode := nil;
  // number edit
  SetWindowLong(edtQuietZone.Handle, GWL_STYLE,GetWindowLong(edtQuietZone.Handle, GWL_STYLE) or ES_NUMBER);
  //edtQuietZone.Text:='2';
  SetWindowLong(edtCornerThickness.Handle, GWL_STYLE,GetWindowLong(edtCornerThickness.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(edtScaleToSave.Handle, GWL_STYLE,GetWindowLong(edtScaleToSave.Handle, GWL_STYLE) or ES_NUMBER);

  {with cmbEncoding do begin
    H := ItemHeight; Style := csOwnerDrawVariable;
    ItemHeight := H; OnChange := nil; ItemIndex := 0;
  end;
  with cbbErrorCorrectionLevel do begin
    OnChange := nil; ItemIndex := 0;
  end;
  with cbbDrawingMode do begin
    OnChange := nil;ItemIndex := 0;OnChange := cbbDrawingModeChange
  end; }
  // create and prepare QRCode component
  FQRCode := TDelphiZXingQRCode.Create;
  FQRCode.RegisterEncoder(ENCODING_WIN1251, TWin1251Encoder);
  FQRCode.RegisterEncoder(ENCODING_URL, TURLEncoder);
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then
  begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;
procedure Tkirimh.nom_shKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tkirimh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.k_asos.State<>dsBrowse then
  dms.k_asos.Cancel;
  tozalaClick(Sender);
end;

procedure Tkirimh.anewClick(Sender: TObject);
begin
  tozalaClick(Sender);
  dms.k_asos.Append;
  dms.k_asossana.Value:=now;dms.k_asosdollar.Value:=0;
  if dms.s_clientdollar.AsInteger=2 then
     dms.k_asosdollar.Value:=1;
  if dms.s_clientclient_tur.AsInteger=1 then begin
    dms.k_asostur_oper.Value:=1;
    //kirim_asos.lombor.visible:=false;kirim_asos.ombor.visible:=false;
  end;
  //if dms.s_clientclient_tur.AsInteger=2 then begin
  //  dms.k_asostur_oper.Value:=3;

    //kirim_asos.lombor.visible:=true;kirim_asos.ombor.visible:=true;
  //end;
  dms.k_asosombor_id.Value:=dms.s_clientid.AsInteger;
  kirim_asos.ShowModal;
end;

procedure Tkirimh.aeditClick(Sender: TObject);
begin
  tozalaClick(Sender);
  dms.k_asos.edit;
  
  kirim_asos.ShowModal;
end;

procedure Tkirimh.adelClick(Sender: TObject);
begin
  tozalaClick(Sender);
  dms.k_slave1.First;
  while not dms.k_slave1.Eof do begin
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select s.id from asos a,asos_slave s WHERE a.id=s.asos_id and s.del_flag=1 and a.tur_oper=2 and s.kol_ost='+dms.k_slave1id.AsString);
    dms.main_link.open;
    if dms.main_link.RecordCount>0 then begin
      ShowMessage('Tovar nomidan amal bajarilgan');
      exit;
    end;
    dms.k_slave1.Next;
  end;
  if MessageDlg('Ushnu nakladnoyni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.k_slave1.First;
    while not dms.k_slave1.Eof do begin
      if not DMS.s_tovar.Locate('id',dms.k_slave1tovar_id.AsInteger,[loCaseInsensitive]) then begin
        ShowMessage(dms.k_slave1tovar_nom.AsString+' topilmadi');exit; end;
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('update slave_main set del_flag=0 where slave_id='+DMS.k_slave1id.AsString);
      dms.link.ExecSQL;
      dms.k_slave1.Next;
    end;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('update asos_slave set del_flag=0 WHERE asos_id='+dms.k_asosid.AsString);
    dms.main_link.ExecSQL;
    tozalaClick(Sender);
    DMS.k_asos.Edit;
    DMS.k_asosdel_flag.Value:=0;
    DMS.k_asos.Post;
    DMS.k_asos.Refresh;
    kirim.tovarlar.SumList.RecalcAll;

  end;
end;

procedure Tkirimh.snewClick(Sender: TObject);
begin
  //dms.k_asos.Append;
  tozalaClick(Sender);
  s_tovar_kirim.ShowModal;
end;

procedure Tkirimh.seditClick(Sender: TObject);
begin
  rec:=dms.k_slave1id.AsInteger;
  tozalaClick(Sender);
  DMS.k_slave1.Locate('id',rec,[loCaseInsensitive]);
  dms.k_slave1.edit;
  dms.s_t_all.Locate('id',dms.k_slave1tovar_id.AsInteger,[loCaseInsensitive]);
  if dms.s_t_allkol_in.AsInteger>0 then begin
    dms.k_slave1foiz_in.AsInteger:=20;kirim_edit.Gichki.Visible:=true;
  end
  else
  begin
    kirim_edit.Gichki.Visible:=false;
  end;
  kirim_edit.ShowModal;
end;

procedure Tkirimh.sdelClick(Sender: TObject);
begin
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select s.id,a.sana from asos a,asos_slave s WHERE a.id=s.asos_id and s.del_flag=1 and a.tur_oper=2 and s.kol_ost='+dms.k_slave1id.AsString);
  dms.main_link.open;
  if dms.main_link.RecordCount>0 then begin
    ShowMessage('Tovar nomidan amal bajarilgan ' + dms.main_link.fieldbyname('sana').AsString);
    exit;
  end;
  if MessageDlg('Ushbu tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

    if not DMS.s_tovar.Locate('id',dms.k_slave1tovar_id.AsInteger,[loCaseInsensitive]) then begin
    ShowMessage(dms.k_slave1tovar_nom.AsString+' topilmadi '+dms.k_slave1tovar_id.AsString);exit; end;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update slave_main set del_flag=0 where slave_id='+DMS.k_slave1id.AsString);
    dms.link.ExecSQL;

    rec:=dms.k_slave1id.AsInteger;
    tozalaClick(Sender);
    DMS.k_slave1.Locate('id',rec,[loCaseInsensitive]);
    DMS.k_slave1.Edit;
    DMS.k_slave1del_flag.Value:=0;
    DMS.k_slave1.Post;
    DMS.k_slave1.Refresh;
        kirim_asos.main_link.Close;kirim_asos.main_link.SQL.Clear;
    kirim_asos.main_link.SQL.Add('select sum(kol*sena_d) as summa_d,sum(kol_in*sena_in_d) as summa_in_d,sum(summa_all) as summa_all,sum(kol+kol_in) as kol from asos_slave where del_flag=1 and asos_id='+dms.k_asosid.AsString+' group by asos_id');
    kirim_asos.main_link.Open;
    dms.k_asos.Edit;
    if dms.s_clientdollar.AsInteger=2 then
      dms.k_asossumma.AsFloat:=0
    else
      dms.k_asossumma.AsFloat:=kirim_asos.main_link.fieldbyname('summa_all').AsFloat;
    dms.k_asoskol.AsInteger:=kirim_asos.main_link.fieldbyname('kol').AsInteger;
    if dms.k_asosdollar.AsInteger=1 then
      dms.k_asossum_d.AsFloat:= kirim_asos.main_link.fieldbyname('summa_d').AsFloat+kirim_asos.main_link.fieldbyname('summa_in_d').AsFloat
    else
      dms.k_asossum_d.AsFloat:=0;
    dms.k_asos.Post;


    DMS.k_asos.Refresh;
    kirim.g_asos.SumList.RecalcAll;

  end;
end;

procedure Tkirimh.TovarlarDblClick(Sender: TObject);
begin
  if l_asos.Value>0 then
  begin
    if MessageDlg(asos.fieldbyname('nomer').AsString+' -xujjat raqamini o`zgartirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      dms.k_slave1.Edit;
      dms.k_slave1asos_id.Value:=l_asos.Value;
      dms.k_slave1.Post;
      dms.k_slave1.Next;
      rec:=dms.k_slave1id.AsInteger;
      dms.k_slave1.Refresh;
      dms.k_slave1.Locate('id',rec,[loCaseInsensitive]) ;
    end;
    exit;
  end;
  seditClick(Sender);
end;

procedure Tkirimh.RzBitBtn1Click(Sender: TObject);
var f:Currency;
begin
  tozalaClick(Sender);
  dms.k_asos.First;dms.k_asos.First;
  while not dms.k_asos.Eof do begin
    f:=0;dms.k_slave1.First;
    while not dms.k_slave1.Eof do begin
      if dms.k_slave1kol.AsInteger*dms.k_slave1sena.AsFloat<>dms.k_slave1summa.AsFloat then begin
        ShowMessage('Soni no`to`gri');
        exit;
      end;
      if dms.k_slave1kol_in.AsInteger*dms.k_slave1sena_in.AsFloat<>dms.k_slave1summa_in.AsFloat then begin
        ShowMessage('Ichki soni no`to`gri');
        exit;
      end;
      if dms.k_slave1summa.AsInteger+dms.k_slave1summa_in.AsFloat<>dms.k_slave1summa_all.AsFloat then begin
        ShowMessage('summa no`to`gri');
        exit;
      end;
      f:=f+dms.k_slave1summa_all.AsFloat;
      dms.k_slave1.Next;
    end;
    dms.k_asos.Edit;
    dms.k_asossumma.AsFloat:=f;dms.k_asossum_d.AsFloat:=f/dms.k_asoskurs.AsFloat;dms.k_asos.Post;
    dms.k_asos.Next;
  end;
end;

procedure Tkirimh.g_asosCellMouseClick(Grid: TCustomGridEh;
  Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  kirim.tovarlar.SumList.RecalcAll;
end;

procedure Tkirimh.RzBitBtn2Click(Sender: TObject);
begin
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asos.fieldbyname('id').AsString);
  dms.asos.open;dms.asos_slave.open;

  if dms.asosdollar.AsInteger=1 then
  begin
    if dms.s_clientdollar.AsInteger=1 then
      ulanish.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_kirim_k.fr3')
    else
      ulanish.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_kirim_d.fr3');
  end
  else
    ulanish.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_kirim.fr3');

  //frxsf.Variables['nnn']:=''''+s+'''';
  ulanish.frxsf.PrintOptions.Printer := setup.cbPrinters.Text;
  ulanish.frxsf.SelectPrinter;
  ulanish.frxsf.PrepareReport;
  ulanish.frxsf.PrintOptions.ShowDialog := false;
  ulanish.frxsf.Print;
end;

procedure Tkirimh.RzBitBtn3Click(Sender: TObject);
begin
  dms.s_tovar.Refresh;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asos.fieldbyname('id').AsString);
  dms.asos.open; dms.asos_slave.open;


  if dms.asosdollar.AsInteger=1 then
  begin
    if dms.s_clientdollar.AsInteger=1 then
      ulanish.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_kirim_k.fr3')
    else
      ulanish.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_kirim_d.fr3');
  end
  else
    ulanish.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_kirim.fr3');
  ulanish.frxsf.PrintOptions.Printer := setup.cbPrinters.Text;
  ulanish.frxsf.SelectPrinter;
  ulanish.frxsf.PrepareReport;
  ulanish.frxsf.PrintOptions.ShowDialog := false;
  ulanish.frxsf.ShowReport;
end;

procedure Tkirimh.Gs_kursExit(Sender: TObject);
begin
  if dms.s_kurs.State in [dsbrowse] then exit;
    if (dms.s_kurs.fieldbyname('data1').AsVariant=null) or (dms.s_kurs.fieldbyname('dollar').AsVariant=null) or (dms.s_kurs.fieldbyname('dollar').AsInteger=0) then
    begin
      dms.s_kurs.Cancel;exit;
    end;
    if dms.s_kurs.fieldbyname('data2').AsVariant=null then dms.s_kurs.fieldbyname('data2').Value:=dms.s_kurs.fieldbyname('data1').Value;
    dms.s_kurs.Post;
end;

procedure Tkirimh.RzBitBtn4Click(Sender: TObject);
var kurs_:Currency;
begin
  tozalaClick(Sender);
  DMS.s_kurs.Last;dms.s_kurs.First;kurs_:=0;
  while not dms.s_kurs.Eof do begin
    if (date()>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (date() <= dms.s_kurs.FieldByName('data2').AsDateTime) then
    begin
      kurs_:=dms.s_kurs.Fieldbyname('dollar').AsVariant;
    end;
    dms.s_kurs.Next;
  end; // while
  if kurs_=0 then begin
   ShowMessage('Diqqat !!! Bugungi kurs kiritilmagan'); exit;
  end;
  if MessageDlg(FloatToStr(kurs_)+' boy`icha qayta baholah qilasizmi?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  dms.k_asos.First;dms.k_asos.DisableControls;dms.k_slave1.DisableControls;
  while (not dms.k_asos.Eof) do begin //  and (dms.k_asosid.AsInteger>43705)
      //if (dms.k_asosdollar.AsInteger in (0,1)) then begin
      kirim.Caption:=inttostr(dms.k_asos.RecNo)+'/'+inttostr(dms.k_asos.RecordCount);
      dms.k_slave1.First;
      while not dms.k_slave1.Eof do begin
        dms.s_t_all.Locate('id',dms.k_slave1tovar_id.AsInteger,[loCaseInsensitive]);
        dms.k_slave1.Edit;
        if (dms.k_asosdollar.AsFloat>0) and ((dms.k_slave1kol_ost.AsInteger>0) or (dms.k_slave1kol_in_ost.AsFloat>0))  then begin
          dms.k_slave1sotish.AsFloat:=RoundTo(dms.k_slave1sotish_d.AsFloat*kurs_,dms.s_clientyaxlitlash.Value);
          if dms.k_slave1sena.AsFloat=0 then dms.k_slave1sena.AsFloat:=dms.k_slave1sena_d.AsFloat*kurs_;
        end
        else begin
          dms.k_slave1sotish_d.AsFloat:=dms.k_slave1sotish.AsFloat/kurs_;
          if dms.k_slave1sena_d.AsFloat=0 then
          dms.k_slave1sena_d.AsFloat:=dms.k_slave1sena.AsFloat/kurs_;
        end;
        dms.k_slave1.Post;
        if (dms.k_asosdollar.AsFloat>0) and ((dms.k_slave1kol_ost.AsInteger>0) or (dms.k_slave1kol_in_ost.AsFloat>0)) then begin
          dms.k_slave1.Edit;
          if dms.s_t_allkol_in.AsInteger>1 then begin
            if dms.k_slave1sena_in.AsFloat=0 then dms.k_slave1sena_in.AsFloat:=dms.k_slave1sena.AsFloat/dms.s_t_allkol_in.AsInteger;
            dms.k_slave1sotish_in.AsFloat:=RoundTo(dms.k_slave1sotish.AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            dms.k_slave1opt1_in.AsFloat:=RoundTo(dms.k_slave1opt1.AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            dms.k_slave1opt1_pl_in.AsFloat:=RoundTo(dms.k_slave1opt1_pl.AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            dms.k_slave1opt2_in.AsFloat:=RoundTo(dms.k_slave1opt2.AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            dms.k_slave1opt2_pl_in.AsFloat:=RoundTo(dms.k_slave1opt2_pl.AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            dms.k_slave1schet_in.AsFloat:=RoundTo(dms.k_slave1schet.AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
          end
          else
          begin
            dms.k_slave1sotish_in.AsFloat:=0;dms.k_slave1sotish_in_d.AsFloat:=0;dms.k_slave1sena_in.AsFloat := 0;dms.k_slave1sena_in_d.AsFloat := 0;
            dms.k_slave1opt1_in.AsFloat:=0;dms.k_slave1opt1_pl_in.AsFloat:=0;dms.k_slave1opt2_in.AsFloat:=0;dms.k_slave1opt2_pl_in.AsFloat:=0;dms.k_slave1schet_in.AsFloat:=0;
          end;
          dms.k_slave1.Post;
        end;
        dms.k_slave1.Next;
      end; // while k_slave
    //exit;
  dms.k_asos.EnableControls;dms.k_slave1.EnableControls;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(kol*sena_d) as summa_d,sum(kol_in*sena_in_d) as summa_in_d,sum(summa_all) as summa_all,sum(kol+kol_in) as kol from asos_slave where del_flag=1 and asos_id='+dms.k_asosid.AsString+' group by asos_id');
  //memo1.Lines.add(dms.main_link.SQL.Text);
  dms.main_link.Open;
  dms.k_asos.Edit;
  dms.k_asossumma.AsFloat:=dms.main_link.fieldbyname('summa_all').AsFloat;
  dms.k_asoskol.AsInteger:=dms.main_link.fieldbyname('kol').AsInteger;
  if dms.k_asosdollar.AsInteger=1 then
    dms.k_asossum_d.AsFloat:=dms.main_link.fieldbyname('summa_d').AsFloat+dms.main_link.fieldbyname('summa_in_d').AsFloat
  else
    dms.k_asossum_d.AsFloat:=0;
  dms.k_asos.Post;


    dms.k_asos.Next;
  end; // k_asos
end;

procedure Tkirimh.tozalaClick(Sender: TObject);
begin
  dms.k_slave1.Close;dms.k_slave1.SQL.Clear;
  dms.k_slave1.SQL.Add('SELECT * FROM asos_slave where del_flag=1 and asos_id=:id');
  dms.k_slave1.Open;
  Edit1.Text:='';
end;

procedure Tkirimh.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var s,s1,s2:string;y:integer;
begin
  if (Key = VK_DOWN) and (not dms.k_slave1.Eof) then dms.k_slave1.Next
  else if (Key = VK_UP) and (not dms.k_slave1.bof) then
  begin
    dms.k_slave1.Prior;edit1.SelStart:=length(edit1.Text)+1;
  end
  else
  begin
  if length(Edit1.Text) = 0 then tozalaClick(Sender);

  if length(Edit1.Text) > 1 then begin
    s:=trim(Edit1.Text);s1:=s;s2:='';
    y:=pos(' ',s);
    if y>0 then begin
      s1:=copy(s,1,y-1);
      s2:=copy(s,y+1,length(s)-y);
    end;
    dms.k_slave1.Close;dms.k_slave1.SQL.Clear;
    dms.k_slave1.SQL.Add('SELECT * FROM asos_slave s,s_tovar t where s.del_flag=1 and s.asos_id=:id and t.id=s.tovar_id and  ');
    if s2<>'' then begin
      dms.k_slave1.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
      dms.k_slave1.SQL.Add(' and ((t.nom like "%'+lat_kril(s2)+'%") or (t.nom like "%'+s2+'%"))) order by t.nom');
    end
    else
    begin
      dms.k_slave1.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
      dms.k_slave1.SQL.Add(') order by t.nom');
    end;
    dms.k_slave1.open;

    if dms.k_slave1.RecordCount=0 then begin
      if GetKeyboardLayout(GetWindowThreadProcessId(GetForegroundWindow,nil))=67699721 then begin
        s1:=EngToRus(s1);if s2<>'' then EngToRus(s2);
      end
      else begin
        s1:=RusToEng(s1);if s2<>'' then RusToEng(s2);
      end;

      dms.k_slave1.Close;dms.k_slave1.SQL.Clear;
     dms.k_slave1.SQL.Add('SELECT * FROM asos_slave s,s_tovar t where s.del_flag=1 and s.asos_id=:id and t.id=s.tovar_id and  ');
     if s2<>'' then begin
        dms.k_slave1.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
        dms.k_slave1.SQL.Add(' and ((t.nom like "%'+lat_kril(s2)+'%") or (t.nom like "%'+s2+'%"))) order by t.nom');
      end
      else
      begin
      dms.k_slave1.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
      dms.k_slave1.SQL.Add(') order by t.nom');
      end;
      dms.k_slave1.open;
    end;
  end;
  end;

end;

procedure Tkirimh.FormActivate(Sender: TObject);
begin
  if asos.Active=false then asos.Open;
  if dms.s_clientsert.AsInteger=0 then
  begin
   Tovarlar.Columns.Items[2].Visible:=false;
   Tovarlar.Columns.Items[4].Visible:=false;
  end;
  if dms.s_clientseriya.AsInteger=0 then
  begin
   p_seriya.Visible:=false;
  end;
  if dms.s_clientichkitovar.AsInteger=0 then
  begin
   Tovarlar.Columns.Items[10].Visible:=false;
   Tovarlar.Columns.Items[11].Visible:=false;
   Tovarlar.Columns.Items[12].Visible:=false;
   Tovarlar.Columns.Items[13].Visible:=false;
   Tovarlar.Columns.Items[14].Visible:=false;
   Tovarlar.Columns.Items[15].Visible:=false;

  end;
  if dms.s_clientdollar.AsInteger=2 then
  begin
    //tovarlar_komil.Visible:=true;Tovarlar.Visible:=false;
    Gs_kurs.Visible:=false;
    g_asos.Columns.Items[4].Visible:=false;
    g_asos.Columns.Items[5].Visible:=false;
  end
  else
  begin
    //tovarlar_komil.Visible:=false;Tovarlar.Visible:=true;
    Gs_kurs.Visible:=true;
  end;
  if dms.s_clientdollar.AsInteger=0 then begin
    Gs_kurs.Visible:=false;
    g_asos.Columns.Items[4].Visible:=true;
    g_asos.Columns.Items[5].Visible:=false;
    g_asos.Columns.Items[6].Visible:=false;
  end;
  tozalaClick(Sender);
end;

procedure Tkirimh.shtrixEnter(Sender: TObject);
begin
  shtrix.Text:='';
end;

procedure Tkirimh.shtrixKeyPress(Sender: TObject; var Key: Char);
var mainid,i:integer;
begin
  if Key = #13 then begin
    if shtrix.Text='' then exit;
    if Length(shtrix.Text)<>15 then
    begin
      exit;
    end;
    for i:=1 to 15 do begin
      if shtrix.Text[i] in ['/','\'] then begin
        shtrix.Text:='';
        exit;
      end;
    end;

    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select id,serial from main where serial="'+shtrix.Text+'"');
    dms.main_link.Open;
    if dms.main_link.RecordCount=0 then begin
      dms.main_link.Append;
      dms.main_link.FieldByName('serial').AsString:=shtrix.Text;
      dms.main_link.post;
    end;
    mainid:=dms.main_link.fieldbyname('id').AsInteger;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select t.nom,a.nomer,a.sana,main.serial from main,slave_main sm,asos_slave s,s_tovar t,asos a where s.del_flag=1 and sm.main_id=main.id and a.id=s.asos_id and t.id=s.tovar_id and s.id=sm.slave_id and sm.main_id="'+IntToStr(mainid)+'"');
    dms.main_link.Open;
    if dms.main_link.RecordCount>0 then begin
      ShowMessage(shtrix.Text+' kirim qilingan. tovar = '+dms.main_link.fieldbyname('nom').AsString+' nomer = '+dms.main_link.fieldbyname('nomer').AsString+' sana = '+dms.main_link.fieldbyname('sana').AsString);
      shtrix.Text:='';
      exit;
    end;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('insert into slave_main (main_id,slave_id) values ('+inttostr(mainid)+','+dms.k_slave1id.AsString+')');
    //memo1.Lines.add(dms.main_link.SQL.Text);
    dms.main_link.ExecSQL;

    link.Refresh;
    link.last;
    shtrix.Text:='';
  end;

end;

procedure Tkirimh.newsfmClick(Sender: TObject);
begin
  if MessageDlg(' seriyani o`chirasizmi?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('delete from main where id = '+link.fieldbyname('main_id').AsString);
    dms.main_link.ExecSQL;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('delete from slave_main where id = '+link.fieldbyname('id').AsString);
    dms.main_link.ExecSQL;
    link.Refresh;
    shtrix.SetFocus;

end;

procedure Tkirimh.tovarlar_komilKeyPress(Sender: TObject; var Key: Char);
begin
  if Key<>#13 then exit;
  seditClick(Sender);

end;

procedure Tkirimh.TovarlarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key<>#13 then exit;
  seditClick(Sender);
end;

procedure Tkirimh.tovarlar_komilKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (upcase(Char(key)) = 'C') then
    Clipboard.AsText:= DMS.k_slave1s_tovar.AsString;
end;

procedure Tkirimh.TovarlarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (upcase(Char(key)) = 'C') then
    ClipBoard.AsText:= DMS.k_slave1s_tovar.AsString;
end;

procedure Tkirimh._asosck(Sender: TObject;
  var Handled: Boolean);
begin
  l_asos.Text:=''; 
end;

procedure Tkirimh.qidirKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    if qidir.Text='' then exit;
    if Length(qidir.Text)=15 then begin
      dms.main_link.Close;dms.main_link.SQL.Clear;
      dms.main_link.SQL.Add('select s.id sid,a.id,m.serial from main m,slave_main sm,asos_slave s,asos a where sm.del_flag=1 and a.tur_oper in (1,5) and serial="'+qidir.Text+'" and a.id=s.asos_id and s.id=sm.slave_id and m.id=sm.main_id');
      //memo1.Lines.add(dms.main_link.SQL.Text);
      dms.main_link.Open;
      if dms.main_link.RecordCount>0 then begin
        dms.k_asos.Close;dms.k_asos.SQL.Clear;
        dms.k_asos.SQL.Add('select * from asos where id='+dms.main_link.fieldbyname('id').AsString);
        dms.k_asos.Open;
        DMS.k_slave1.Locate('id',dms.main_link.fieldbyname('sid').AsString,[loCaseInsensitive]);
      end;
    end;
    if Length(qidir.Text)=13 then begin
      dms.main_link.Close;dms.main_link.SQL.Clear;
      dms.main_link.SQL.Add('select s.id sid,a.id from asos_slave s,asos a,s_tovar t where a.id=s.asos_id and t.id=s.tovar_id and s.del_flag=1 and a.tur_oper in (1,5) and ');
      dms.main_link.SQL.Add(' (t.shtrix_in = "'+qidir.Text+'" or t.shtrix = "'+qidir.Text+'" or t.shtrix1 ="'+qidir.Text+'" or t.shtrix2 ="'+qidir.Text+'") order by t.nom,a.srok');
      dms.main_link.Open;
      if dms.main_link.RecordCount>0 then begin
        dms.k_asos.Close;dms.k_asos.SQL.Clear;
        dms.k_asos.SQL.Add('select * from asos where id='+dms.main_link.fieldbyname('id').AsString);
        dms.k_asos.Open;
        Label1.Color:=clRed;
        DMS.k_slave1.Locate('id',dms.main_link.fieldbyname('sid').AsInteger,[loCaseInsensitive]);
      end;
    end;
    qidir.Text:='';
  end;
end;

procedure Tkirimh.tovarlar_komilDblClick(Sender: TObject);
begin
  if l_asos.Value>0 then
  begin
    if MessageDlg(asos.fieldbyname('nomer').AsString+' -xujjat raqamini o`zgartirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      dms.k_slave1.Edit;
      dms.k_slave1asos_id.Value:=l_asos.Value;
      dms.k_slave1.Post;
      dms.k_slave1.Next;
      rec:=dms.k_slave1id.AsInteger;
      dms.k_slave1.Refresh;
      dms.k_slave1.Locate('id',rec,[loCaseInsensitive]) ;
    end;
    exit;
  end;

seditClick(Sender);
end;

procedure Tkirimh.X1Click(Sender: TObject);
begin
  Clipboard.AsText:=link.fieldbyname('serial').AsString;
end;

procedure Tkirimh.linkAfterScroll(DataSet: TDataSet);
begin
  kirim.soni.Caption:=inttostr(kirim.link.RecordCount);
  s_tovar_kirim.soni.Caption:=inttostr(kirim.link.RecordCount);
end;

procedure Tkirimh.linkAfterRefresh(DataSet: TDataSet);
begin
  kirim.soni.Caption:=inttostr(kirim.link.RecordCount);
  s_tovar_kirim.soni.Caption:=inttostr(kirim.link.RecordCount);
end;

procedure Tkirimh.linkAfterPost(DataSet: TDataSet);
begin
  kirim.soni.Caption:=inttostr(kirim.link.RecordCount);
  s_tovar_kirim.soni.Caption:=inttostr(kirim.link.RecordCount);
end;

procedure Tkirimh.linkAfterOpen(DataSet: TDataSet);
begin
  kirim.soni.Caption:=inttostr(kirim.link.RecordCount);
  s_tovar_kirim.soni.Caption:=inttostr(kirim.link.RecordCount);
end;

procedure Tkirimh.qidirEnter(Sender: TObject);
begin
  qidir.Text:='';

end;

procedure Tkirimh.Label1Click(Sender: TObject);
begin
  if admin_type='' then exit;
  //if ='' then exit;
  if (sana1.Value=null) or (sana2.Value=null) then exit;
  if (sana2.Value<sana1.Value) then sana2.Value:=sana1.Value;
  dms.setup.Refresh;
  dms.k_asos.Close;dms.k_asos.SQL.Clear;
  dms.k_asos.SQL.Add('select * from asos where del_flag=1 and tur_oper in (1,3,4,5) and client_id='+admin_id);
  dms.k_asos.SQL.Add(' and sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value));
  dms.k_asos.SQL.Add(' order by sana desc');
  dms.k_asos.Open;
  tozalaClick(Sender);
  Label1.Color:=$00B4E6F0;
end;

procedure Tkirimh.dilerChange(Sender: TObject);
begin
  if diler.Value = null then begin
    Label1Click(Sender);exit;
  end;
  dms.k_asos.Close;dms.k_asos.SQL.Clear;
  dms.k_asos.SQL.Add('select * from asos where del_flag=1 and tur_oper in (1,4,5) and client_id='+admin_id);
  dms.k_asos.SQL.Add(' and diler_id = '+inttostr(diler.Value));
  dms.k_asos.SQL.Add(' order by sana desc');
  dms.k_asos.Open;tozalaClick(Sender);

end;

procedure Tkirimh.dilerEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  diler.Value := null;
  Label1Click(Sender);
end;

procedure Tkirimh.genqrClick(Sender: TObject);
var c:char;qr:string;nn,i:integer;Bmp: TBitmap;Jpg: TJPEGImage;nomi,nomi_s,Shape,vstart, vend:OleVariant;
S, T : TFileStream;
begin
  if DMS.k_slave1.fieldbyname('kol').AsInteger=link.RecordCount then exit;
  for i:=1 to DMS.k_slave1.fieldbyname('kol').AsInteger-link.RecordCount do begin
    nn:=dms.s_clientlastqr.AsInteger+1;
    dms.s_client.Edit;
    dms.s_clientlastqr.AsInteger:=dms.s_clientlastqr.AsInteger+1;
    dms.s_client.post;
    qr:='AAAAA'+RandString(6,false,true,true,false)+_IntToStr(nn,4);
    dms.s_client.Edit;
    dms.s_clientlastqr.AsInteger:=dms.s_clientlastqr.AsInteger;
    dms.s_client.post;
    shtrix.Text:=qr;
    c:=#13;
    shtrixKeyPress(Sender,c);
  end; // if

end;

procedure Tkirimh.q1Click(Sender: TObject);
var nomi_s:string;nomi:OleVariant;
begin
  nomi:=trim(link.fieldbyname('id').AsString)+'.doc';
  nomi:=ExtractFilePath(Application.ExeName)+'file\'+nomi;nomi_s:=nomi;
  ShellExecute(handle,nil,pchar(nomi_s),nil,nil,SW_RESTORE);
end;

procedure Tkirimh.docqrClick(Sender: TObject);
var c:char;qr:string;nn,i:integer;Bmp: TBitmap;Jpg: TJPEGImage;nomi,nomi_s,Shape,vstart, vend:OleVariant;
S, T : TFileStream;
begin
  if link.RecordCount=0 then exit;
  link.first;
  while not link.eof do begin
    RemakeQR(link.fieldbyname('serial').AsString);
    Bmp := nil;
    try
      Bmp := TBitmap.Create;
      MakeBmp(Bmp, udScaleToSave.Position, FQRCode, clrbxBackground.Selected,
        clrbxForeground.Selected, udCornerThickness.Position);
    except
      Bmp.Free;
      raise;
    end;Clipboard.Assign(Bmp);

  nomi:=copy(link.fieldbyname('serial').AsString,12,4)+trim(link.fieldbyname('id').AsString)+'.doc';
  nomi:=ExtractFilePath(Application.ExeName)+'file\'+nomi;nomi_s:=nomi;
  //S := TFileStream.Create(ExtractFilePath(Application.ExeName)+'shablon\kart4_3.sab', fmOpenRead);
  S := TFileStream.Create(ExtractFilePath(Application.ExeName)+'shablon\kart6_4.sab', fmOpenRead);
  try T := TFileStream.Create(nomi, fmOpenWrite or fmCreate);
  try T.CopyFrom(S, S.Size );FileSetDate(T.Handle,FileGetDate(S.Handle));finally T.Free;end;finally S.Free;end;
  MSWord1.ScreenRefresh;
  MSWord1.Documents.Open2000(nomi,EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,  EmptyParam, EmptyParam, EmptyParam,  EmptyParam, EmptyParam);
  WordDocument1.ConnectTo(MSWord1.ActiveDocument);
  MSWord1.Options.CheckSpellingAsYouType:=False;
  MSWord1.Options.CheckGrammarAsYouType:=False;

    qidr:='[qr]';
    almash:='';
    MSWord1.Selection.Find.Execute(qidr,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,Wrap,EmptyParam,almash,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam);
    MSWord1.Selection.Paste;

  //zamena('[tashkilot]',trim(ts_mijoz.fieldbyname('tashkilot').AsString),0,0);
  //zamena('[fio]',trim(ts_mijoz.fieldbyname('fio').AsString),0,0);
  WordDocument1.SaveAs;
  //MSWord1.ActivePrinter:=dms.ts_userprinter_name.AsWideString;
  WordDocument1.PrintOut;
  WordDocument1.Disconnect;
  MSWord1.Quit;
  MSWord1.Disconnect;
  //ShellExecute(handle,nil,pchar(nomi_s),nil,nil,SW_RESTORE);  }
  link.Next;
  end;

end;

procedure Tkirimh.Image2DblClick(Sender: TObject);
begin
  if pnlDetails.Visible then
    pnlDetails.Visible:=false
  else
    pnlDetails.Visible:=true;
end;

procedure Tkirimh.RzBitBtn5Click(Sender: TObject);
begin
  if l_asos.Value=0 then
  begin
    ShowMessage('facturani tanlang');
    exit;
  end;
  if MessageDlg(asos.fieldbyname('nomer').AsString+' -xujjat raqamini o`zgartirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  dms.k_slave1.first;
  while not dms.k_slave1.eof do begin
    dms.k_slave1.Edit;
    dms.k_slave1asos_id.Value:=l_asos.Value;
    dms.k_slave1.Post;
    dms.k_slave1.Next;
  end;
  dms.k_slave1.Refresh;
end;



procedure Tkirimh.testClick(Sender: TObject);
var kurs_,d:Currency;
begin
  tozalaClick(Sender);
  dms.k_asos.First;
  while (not dms.k_asos.Eof) do begin //  and (dms.k_asosid.AsInteger>43705)
    if dms.k_asosdollar.AsFloat=1 then begin
      dms.k_slave1.First;
      while not dms.k_slave1.Eof do begin
        if (dms.k_slave1sena_d.AsFloat>=dms.k_slave1sotish_d.AsFloat) then begin
          dms.k_slave1.Edit;
          dms.k_slave1sotish_d.AsFloat:=RoundTo(dms.k_slave1sena_d.AsFloat+dms.k_slave1sena_d.AsFloat*dms.k_slave1foiz.AsFloat/100,-2);
          dms.k_slave1sotish.AsFloat:=RoundTo(dms.k_slave1sena.AsFloat+dms.k_slave1sena.AsFloat*dms.k_slave1foiz.AsFloat/100,2);
          dms.s_t_all.Locate('id',dms.k_slave1tovar_id.AsInteger,[loCaseInsensitive]);
          if dms.s_t_all.FieldByName('kol_in').AsInteger>1 then begin
            dms.k_slave1sotish_in_d.AsFloat:=RoundTo(dms.k_slave1sotish_d.AsFloat/dms.s_t_all.FieldByName('kol_in').AsInteger,-3);
            dms.k_slave1sotish_in.AsFloat:=RoundTo(dms.k_slave1sotish.AsFloat/dms.s_t_all.FieldByName('kol_in').AsInteger,0);
          end;
          dms.k_slave1.post;

          //Memo1.Visible:=true;Memo1.Lines.Add(dms.asosnomer.AsString+'  '+dms.k_slave1id.AsString+'  '+dms.k_slave1s_tovar.AsString+'  '+dms.k_slave1sena_d.AsString+'  '+dms.k_slave1sotish_d.AsString);
          //exit;
        end;
        dms.k_slave1.Next;
      end;
    end;  
    dms.k_asos.Next;
  end;
end;

procedure Tkirimh.RzBitBtn6Click(Sender: TObject);
var kurs_:Currency;
begin
  tozalaClick(Sender);
  DMS.s_kurs.Last;dms.s_kurs.First;kurs_:=0;
  while not dms.s_kurs.Eof do begin
    if (date()>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (date() <= dms.s_kurs.FieldByName('data2').AsDateTime) then
    begin
      kurs_:=dms.s_kurs.Fieldbyname('dollar').AsVariant;
    end;
    dms.s_kurs.Next;
  end; // while
  if kurs_=0 then begin
   ShowMessage('Diqqat !!! Bugungi kurs kiritilmagan'); exit;
  end;
  if MessageDlg(FloatToStr(kurs_)+' boy`icha qayta baholah qilasizmi?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  //Edit1.Text:=dms.k_slave1.SQL.Text;exit;
  dms.k_asos.First;
  main_link.Close;main_link.SQL.Clear;
  main_link.SQL.Add(dms.k_asos.SQL.Text);
  main_link.Open;
  link.Close;link.SQL.Clear;
  link.SQL.Add('SELECT * FROM asos_slave where del_flag=1 and asos_id=:id order by id');
  link.Open;
  //Edit1.Text:=link.SQL.Text;exit;
  while (not main_link.Eof) do begin //  and (dms.k_asosid.AsInteger>43705)
      //if (dms.k_asosdollar.AsInteger in (0,1)) then begin
      kirim.Caption:=inttostr(main_link.RecNo)+'/'+inttostr(main_link.RecordCount);
      link.First;

      while not link.Eof do begin
        dms.s_t_all.Locate('id',link.fieldbyname('tovar_id').AsInteger,[loCaseInsensitive]);
        link.Edit;
        if (main_link.fieldbyname('dollar').AsFloat>0) and ((link.fieldbyname('kol_ost').AsInteger>0) or (link.fieldbyname('kol_in_ost').AsFloat>0))  then begin
          link.fieldbyname('sotish').AsFloat:=RoundTo(link.fieldbyname('sotish_d').AsFloat*kurs_,dms.s_clientyaxlitlash.Value);
          if link.fieldbyname('sena').AsFloat=0 then link.fieldbyname('sena').AsFloat:=link.fieldbyname('sena_d').AsFloat*kurs_;
        end
        else begin
          link.fieldbyname('sotish_d').AsFloat:=link.fieldbyname('sotish').AsFloat/kurs_;
          if dms.k_slave1sena_d.AsFloat=0 then
          link.fieldbyname('sena_d').AsFloat:=link.fieldbyname('sena').AsFloat/kurs_;
        end;
        link.Post;
        if (main_link.fieldbyname('dollar').AsFloat>0) and ((link.fieldbyname('kol_ost').AsInteger>0) or (link.fieldbyname('kol_in_ost').AsFloat>0)) then begin
          link.Edit;
          if dms.s_t_allkol_in.AsInteger>1 then begin
            if link.fieldbyname('sena_in').AsFloat=0 then link.fieldbyname('sena_in').AsFloat:=link.fieldbyname('sena').AsFloat/dms.s_t_allkol_in.AsInteger;
            link.fieldbyname('sotish_in').AsFloat:=RoundTo(link.fieldbyname('sotish').AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            link.fieldbyname('opt1_in').AsFloat:=RoundTo(link.fieldbyname('opt1').AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            link.fieldbyname('opt1_pl_in').AsFloat:=RoundTo(link.fieldbyname('opt1_pl').AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            link.fieldbyname('opt2_in').AsFloat:=RoundTo(link.fieldbyname('opt2').AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            link.fieldbyname('opt2_pl_in').AsFloat:=RoundTo(link.fieldbyname('opt2_pl').AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
            link.fieldbyname('schet_in').AsFloat:=RoundTo(link.fieldbyname('schet').AsFloat/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
          end
          else
          begin
            link.fieldbyname('sotish_in').AsFloat:=0;link.fieldbyname('sotish_in_d').AsFloat:=0;
            link.fieldbyname('sena_in').AsFloat := 0;link.fieldbyname('sena_in_d').AsFloat := 0;
            link.fieldbyname('opt1_in').AsFloat:=0;link.fieldbyname('opt1_pl_in').AsFloat:=0;
            link.fieldbyname('opt2_in').AsFloat:=0;link.fieldbyname('opt2_pl_in').AsFloat:=0;
            link.fieldbyname('schet_in').AsFloat:=0;
          end;
          link.Post;
        end;
        link.Next;
      end; // while k_slave
    //exit;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(kol*sena_d) as summa_d,sum(kol_in*sena_in_d) as summa_in_d,sum(summa_all) as summa_all,sum(kol+kol_in) as kol from asos_slave where del_flag=1 and asos_id='+main_link.fieldbyname('id').AsString+' group by asos_id');
  //memo1.Lines.add(dms.main_link.SQL.Text);
  dms.main_link.Open;
  main_link.Edit;
  main_link.fieldbyname('summa').AsFloat:=dms.main_link.fieldbyname('summa_all').AsFloat;
  main_link.fieldbyname('kol').AsInteger:=dms.main_link.fieldbyname('kol').AsInteger;
  if main_link.fieldbyname('dollar').AsInteger=1 then
    main_link.fieldbyname('sum_d').AsFloat:=dms.main_link.fieldbyname('summa_d').AsFloat+dms.main_link.fieldbyname('summa_in_d').AsFloat
  else
    main_link.fieldbyname('sum_d').AsFloat:=0;
  main_link.Post;
    main_link.Next;
  end; // k_asos
end;

end.







