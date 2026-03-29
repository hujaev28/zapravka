unit fs_haridor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles, GridsEh, DBGridEh, RzButton, StdCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RzEdit, RzDBEdit,
  DBCtrlsEh, Mask, DBCtrls, RzDBCmbo;

type
  Ts_haridor = class(TForm)
    gclient: TDBGridEh;
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    nommarka: TEdit;
    Label2: TLabel;
    tpl: TZQuery;
    tplid: TIntegerField;
    tplbank_id: TIntegerField;
    tplkod: TIntegerField;
    tpln_pl: TIntegerField;
    tpln_dok: TStringField;
    tpld_pl: TDateField;
    tplrssvoy: TStringField;
    tplrs: TStringField;
    tplvo: TSmallintField;
    tplnn: TSmallintField;
    tplclient: TIntegerField;
    tplclient_id: TIntegerField;
    tpluser_id: TIntegerField;
    tplsena_pl: TFloatField;
    tplsena_d: TFloatField;
    tplsaldo: TFloatField;
    tplsaldo_d: TFloatField;
    tplost_pl: TFloatField;
    tplost_d: TFloatField;
    tplkurs: TFloatField;
    tplvid: TSmallintField;
    tpls1: TStringField;
    tplter: TSmallintField;
    tplpot1: TSmallintField;
    tplpot2: TSmallintField;
    tplsf: TIntegerField;
    tplsf_pot: TSmallintField;
    tplusername: TStringField;
    tplchangedate: TDateField;
    tplstos: TSmallintField;
    tpldel_flag: TSmallintField;
    tplprim: TStringField;
    tplstatrashod: TIntegerField;
    tpldiler_id: TIntegerField;
    tplh_id: TIntegerField;
    Dpl: TDataSource;
    qpl: TDBGridEh;
    Gredit: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label18: TLabel;
    Label7: TLabel;
    n_pl: TDBNumberEditEh;
    d_pl: TDBDateTimeEditEh;
    sena_pl: TDBNumberEditEh;
    newpl: TRzBitBtn;
    delpl: TRzBitBtn;
    prim: TRzDBEdit;
    sena_d: TDBNumberEditEh;
    s_pl: TZQuery;
    Ds_pl: TDataSource;
    vid: TRzDBLookupComboBox;
    Label1: TLabel;
    gachaq: TRzNumericEdit;
    gachaqd: TRzNumericEdit;
    RzBitBtn1: TRzBitBtn;
    tpls_vid: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    inv: TRzDBLookupComboBox;
    tplsrok: TDateField;
    tplinv_id: TIntegerField;
    Label5: TLabel;
    srok: TDBDateTimeEditEh;
    tpls_inv: TStringField;
    Label8: TLabel;
    konv: TDBComboBoxEh;
    Label6: TLabel;
    kurs: TDBNumberEditEh;
    tplasos_id: TIntegerField;
    tplkonv: TIntegerField;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    asos: TZQuery;
    Dasos: TDataSource;
    Memosh: TMemo;
    qarz: TZQuery;
    Dqarz: TDataSource;
    tplsena_pl1: TStringField;
    tplsena_d1: TStringField;
    tpls_vid1: TStringField;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    Edit1: TEdit;
    tplvaqt: TDateTimeField;
    tplzet_id: TIntegerField;
    procedure xnewClick(Sender: TObject);
    procedure gclientDblClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure newplClick(Sender: TObject);
    procedure delplClick(Sender: TObject);
    procedure n_plKeyPress(Sender: TObject; var Key: Char);
    procedure tplNewRecord(DataSet: TDataSet);
    procedure tplAfterPost(DataSet: TDataSet);
    procedure tplBeforeEdit(DataSet: TDataSet);
    procedure tplAfterCancel(DataSet: TDataSet);
    procedure tplBeforeInsert(DataSet: TDataSet);
    procedure tplAfterScroll(DataSet: TDataSet);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure nommarkaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sena_plEnter(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure tplsena_pl1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tplsena_d1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tplBeforePost(DataSet: TDataSet);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  clAverageSpeed: Double=0;
  s_haridor: Ts_haridor;

implementation

{$R *.dfm}
uses comobj,fdms,fs_haridor_edit,wcrypt2, fqarzdorlik,fulanish_k, fkassa;

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

procedure Ts_haridor.xnewClick(Sender: TObject);
begin
  dms.s_haridor.Append;
  dms.s_haridoruser_id.value:=dms.s_user.FieldByName('id').AsInteger;
  dms.s_haridorclient_id.value:=dms.s_user.FieldByName('client_id').AsInteger;
  s_haridor_edit.ShowModal;
end;

procedure Ts_haridor.gclientDblClick(Sender: TObject);
var har_id:integer;
begin
  if forma<>'kassa' then exit;
  har_id:=dms.s_haridorid.AsInteger;
  if dms.asos.State=dsbrowse then dms.asos.Edit;
  dms.asosh_id.AsInteger:=har_id;
  dms.asos.post;
  dms.asos.Refresh;
  s_haridor.Close;
  
end;

procedure Ts_haridor.xdelClick(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id,sana from asos WHERE (del_flag=1 and h_id = '+dms.s_haridorid.AsString+')');
  dms.link.open;
  if dms.link.RecordCount>0 then begin
     ShowMessage('Diqqat, Haridor tomonidan '+dms.link.fieldbyname('sana').AsString+' da amal bajariljan');
     //exit;
  end;
  if dms.link.RecordCount>20 then begin
     ShowMessage('Diqqat, Haridor tomonidan juda ko`p amal bajariljan');
     exit;
  end;
  if MessageDlg('Ushnu mol etkazuvchini o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     DMS.s_haridor.Edit;
     DMS.s_haridordel_flag.Value:=0;
     DMS.s_haridornom.AsString:=DMS.s_haridornom.AsString+' !!!';
     DMS.s_haridor.Post;
     //DMS.s_haridor.Refresh;
  end;
end;

procedure Ts_haridor.xeditClick(Sender: TObject);
begin
  dms.s_haridor.Edit;s_haridor_edit.ShowModal;
end;

procedure Ts_haridor.FormCreate(Sender: TObject);
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

procedure Ts_haridor.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_haridor.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_haridor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.s_haridor.Close;dms.s_haridor.sql.Clear;
  dms.s_haridor.SQL.Add(' SELECT * FROM s_haridor where del_flag=1 and client_id = :id order by nom');
  dms.s_haridor.open;

end;

procedure Ts_haridor.FormActivate(Sender: TObject);
begin
  if s_pl.Active=false then s_pl.Open;
  if tpl.Active=false then tpl.Open;
  asos.Open;qarz.Open;

  if DMS.user.FieldByName('last_h').AsString<>'' then
  begin
  dms.s_haridor.Locate('id',StrToInt(DMS.user.FieldByName('last_h').AsString),[loCaseInsensitive]);
  //ShowMessage(dms.s_haridornom.AsString);
  //dms.s_haridor.Locate('id',StrToInt(haridor_id),[loCaseInsensitive]);
  end;
  newpl.SetFocus;
end;

procedure Ts_haridor.newplClick(Sender: TObject);
begin
  if tpl.State=dsBrowse then begin
    DMS.s_client.Refresh;
    tpl.Append;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
      tpln_pl.AsInteger:=1
    else
      tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
    sena_pl.SetFocus;
  end
  else
  begin
    if tpl.FieldByName('sena_pl').AsFloat+tpl.FieldByName('sena_d').AsFloat=0 then
    begin
       ShowMessage('Summani kiriting');ActiveControl:=sena_pl;Exit;
    end;

    if (tpl.State=dsInsert) and (tpln_pl.AsInteger=DMS.s_clientlast_pl_k.AsInteger) then begin
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then begin
        tpln_pl.AsInteger:=1;
        dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
        dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
    end;
    if tplkonv.AsInteger=1 then
      begin
      tplost_pl.AsFloat:=0;
      tplost_d.AsFloat:=tpl.fieldbyname('sena_d').AsFloat;
      end
    else
    if tplkonv.AsInteger=2 then
      begin
        tplost_pl.AsFloat:=tpl.fieldbyname('sena_pl').AsFloat;
        tplost_d.AsFloat:=0;
      end
    else
    if (tplkonv.AsInteger=0) or (tplkonv.AsString='') then
      begin
        tplost_pl.AsFloat:=tpl.fieldbyname('sena_pl').AsFloat;
        tplost_d.AsFloat:=tpl.fieldbyname('sena_d').AsFloat;
      end;
    tpl.Post;
    if tplh_id.AsString<>'' then begin
      dms.link.Close;dms.link.sql.Clear;
      dms.link.sql.Add('update s_haridor set qarz_flag=-1 where id='+tplh_id.AsString);
      dms.link.ExecSQL;
    end;
    qarz.Refresh;
    asos.First;
    while not asos.Eof do begin
      if asos.FieldByName('qarz_s_ost').AsFloat>0 then
      begin

      end;
      asos.next;
    end;
    qarz.Refresh;
    tplAfterScroll(tpl);
  end;

end;

procedure Ts_haridor.delplClick(Sender: TObject);
begin
  if tpl.State=dsBrowse then  begin
    if MessageDlg('Qatorni o`chrasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      if tplvid.AsInteger=1 then begin // naqd
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set pl_id=null where pl_id='+tplid.AsString);
        dms.link.ExecSQL;
      end;
      if tplvid.AsInteger=19 then begin // plastik
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set plastik_id=null where plastik_id='+tplid.AsString);
        dms.link.ExecSQL;
      end;
      tpl.Edit;
      tpl.FieldByName('del_flag').AsInteger:=0;
      tpl.Post;
      tpl.Refresh;tplAfterScroll(tpl);
    end;
  end
  else
  begin
    tpl.Cancel;
  end;

end;

procedure Ts_haridor.n_plKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_haridor.tplNewRecord(DataSet: TDataSet);
begin
  tplh_id.AsInteger:=dms.s_haridorid.AsInteger;
  tplclient_id.AsInteger:=dms.s_clientid.AsInteger;
  tpluser_id.AsInteger:=dms.s_user.fieldbyname('id').AsInteger;
  tpld_pl.AsDateTime:=date();tplvid.AsInteger:=7;
  
end;

procedure Ts_haridor.tplAfterPost(DataSet: TDataSet);
begin
  newpl.Caption:='Yangi';delpl.Caption:='o`chirish';
  gclient.Enabled:=true;
end;

procedure Ts_haridor.tplBeforeEdit(DataSet: TDataSet);
begin
  newpl.Caption:='Saqlash';delpl.Caption:='Bekor qilish';
  gclient.Enabled:=false;

end;

procedure Ts_haridor.tplAfterCancel(DataSet: TDataSet);
begin
  newpl.Caption:='Yangi';delpl.Caption:='o`chirish';
  gclient.Enabled:=true;
end;

procedure Ts_haridor.tplBeforeInsert(DataSet: TDataSet);
begin
  newpl.Caption:='Saqlash';delpl.Caption:='Bekor qilish';
  gclient.Enabled:=false;

end;

procedure Ts_haridor.tplAfterScroll(DataSet: TDataSet);
var danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;s,d1,d2,kr,ch,a0,a1,a2:string;
begin
    // Дастлабки санадан кичик булган харидорнинг карзи,  (tur_oper=2 - сотиш) ("summa" - накд карзи, "epos" - перечисление)
  if dms.s_haridor.RecordCount=0 then exit;
  if dms.s_haridor.State in [dsedit,dsinsert] then exit;
  s:=dms.main_link.SQL.Text;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
  dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString+' order by id');
  dms.main_link.open;
  danq:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
  chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;d1:='and d_pl < '+kasaya(now);d2:=' and d_pl between '+kasaya(now)+' and '+kasaya(now);
  dms.main_link.SQL.Add('SELECT ');kr:=' vid in (7,17,25,20) ';ch:=' vid in (8,18) ';a0:=' (konv =0 or konv is null) and ';a1:='konv=1 and ';a2:='konv=2 and  ';
  dms.main_link.SQL.Add('sum(if('+a0+kr+d1+',sena_pl,0)) as b_kirim  ,'); // so`m
  dms.main_link.SQL.Add('sum(if('+a0+kr+d1+',sena_d ,0)) as b_kirimd ,'); // dollar
  dms.main_link.SQL.Add('sum(if('+a2+kr+d1+',sena_pl,0)) as b_kirimk ,'); // konv1 so`m
  dms.main_link.SQL.Add('sum(if('+a1+kr+d1+',sena_d ,0)) as b_kirimkd,'); // konv1 dollar

  dms.main_link.SQL.Add('sum(if('+a0+ch+d1+',sena_pl,0)) as b_chiqim ,');
  dms.main_link.SQL.Add('sum(if('+a0+ch+d1+',sena_d ,0)) as b_chiqimd,');
  dms.main_link.SQL.Add('sum(if('+a2+ch+d1+',sena_pl,0)) as b_chiqimk ,');
  dms.main_link.SQL.Add('sum(if('+a1+ch+d1+',sena_d ,0)) as b_chiqimkd,');

  dms.main_link.SQL.Add('sum(if('+a0+kr+d2+',sena_pl,0)) as o_kirim  ,'); // so`m
  dms.main_link.SQL.Add('sum(if('+a0+kr+d2+',sena_d ,0)) as o_kirimd ,'); // dollar
  dms.main_link.SQL.Add('sum(if('+a2+kr+d2+',sena_pl,0)) as o_kirimk ,'); // konv1 so`m
  dms.main_link.SQL.Add('sum(if('+a1+kr+d2+',sena_d ,0)) as O_kirimkd,'); // konv1 dollar

  dms.main_link.SQL.Add('sum(if('+a0+ch+d2+',sena_pl,0)) as o_chiqim  ,');
  dms.main_link.SQL.Add('sum(if('+a0+ch+d2+',sena_d ,0)) as o_chiqimd, ');
  dms.main_link.SQL.Add('sum(if('+a2+ch+d2+',sena_pl,0)) as o_chiqimk ,');
  dms.main_link.SQL.Add('sum(if('+a1+ch+d2+',sena_d ,0)) as o_chiqimkd ');
  dms.main_link.SQL.Add('from pl WHERE del_flag=1 and h_id='+dms.s_haridorid.AsString);
  dms.main_link.SQL.Add(' order by id');
  dms.main_link.open;

  danq :=danq +(dms.main_link.fieldbyname('b_chiqim' ).AsFloat+dms.main_link.fieldbyname('b_chiqimk').AsFloat)-(dms.main_link.fieldbyname('b_kirim').AsFloat+dms.main_link.fieldbyname('b_kirimk').AsFloat);
  danqd:=danqd+(dms.main_link.fieldbyname('b_chiqimd').AsFloat+dms.main_link.fieldbyname('b_chiqimkd').AsFloat)-(dms.main_link.fieldbyname('b_kirimd').AsFloat+dms.main_link.fieldbyname('b_kirimkd').AsFloat);

  kirim:=dms.main_link.fieldbyname('o_kirim').AsFloat+dms.main_link.fieldbyname('o_kirimk').AsFloat;
  kirimd:=dms.main_link.fieldbyname('o_kirimd').AsFloat+dms.main_link.fieldbyname('o_kirimkd').AsFloat;
  chiqim:=chiqim+dms.main_link.fieldbyname('o_chiqim').AsFloat+dms.main_link.fieldbyname('o_chiqimk').AsFloat;
  chiqimd:=chiqimd+dms.main_link.fieldbyname('o_chiqimd').AsFloat+dms.main_link.fieldbyname('o_chiqimkd').AsFloat;

  gachaq.Value:=danq+(chiqim-kirim);
  gachaqd.Value:=danqd+(chiqimd-kirimd);
  dms.main_link.Close;
  dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add(s);
  dms.main_link.Open;

  end;

procedure Ts_haridor.RzBitBtn1Click(Sender: TObject);
begin
  haridor_id:=dms.s_haridorid.AsString;
  //dms.s_haridor.Close;dms.s_haridor.sql.Clear;
  //dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1 order by nom');
  //dms.s_haridor.open;
  //dms.s_haridor.Locate('id',StrToInt(haridor_id),[loCaseInsensitive]);
  qarzdorlik.ShowModal;
end;

procedure Ts_haridor.nommarkaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (nommarka.Text>'')  then  //and (Key = #13)
 begin
  dms.s_haridor.Close;dms.s_haridor.sql.Clear;
  dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1 and ((telsms1 like "%'+lat_kril(nommarka.Text)+'%") or (nom like "%'+lat_kril(nommarka.Text)+'%") or (nom like "%'+nommarka.Text+'%")) order by nom');
  dms.s_haridor.open;
 end;
end;

procedure Ts_haridor.sena_plEnter(Sender: TObject);
begin
  if tplkonv.AsVariant=null then exit;
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value=2) and (kurs.Value>0)  then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value=1) and (kurs.Value>0) then
    sena_d.Value:=sena_pl.Value/kurs.Value;

end;

procedure Ts_haridor.Label2Click(Sender: TObject);
begin
  dms.s_haridor.Close;dms.s_haridor.sql.Clear;
  dms.s_haridor.SQL.Add('select * from s_haridor WHERE del_flag=1 order by nom');
  dms.s_haridor.open;
end;

procedure Ts_haridor.tplsena_pl1GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if (tpls_vid1.AsInteger=1) and (tplsena_pl.AsFloat>0) then text:='- '+FloatToStr(tplsena_pl.AsFloat) else text:=FloatToStr(tplsena_pl.AsFloat);
end;

procedure Ts_haridor.tplsena_d1GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if (tpls_vid1.AsInteger=1) and (tplsena_d.AsFloat>0) then text:='- '+FloatToStr(tplsena_d.AsFloat) else text:=FloatToStr(tplsena_d.AsFloat);
end;

procedure Ts_haridor.tplBeforePost(DataSet: TDataSet);
begin
  DMS.setup.Refresh;
  tplchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  tplvaqt.AsDateTime:=dms.setupvaqt.AsDateTime;
  If tpl.State=dsInsert then begin
    DMS.protizm.Insert;
    dms.protizm.fieldbyname('nima').AsString:='pl insert';
    dms.protizm.fieldbyname('vid').AsInteger:=10;
    dms.protizm.fieldbyname('old_value').AsString:=tpln_pl.AsString;
    dms.protizm.fieldbyname('old_adminnom').AsString:=tplsena_pl.AsString;
    dms.protizm.fieldbyname('new_value').AsString:=tplsena_d.AsString;
    //dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
    dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
    dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
    DMS.protizm.Post;
    exit;
  end;
  if (tpldel_flag.AsString<>tpldel_flag.OldValue) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('nima').AsString:='pl delete';
  dms.protizm.fieldbyname('vid').AsInteger:=10;
  dms.protizm.fieldbyname('old_value').AsString:=tpldel_flag.OldValue;
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=tpluser_id.AsString;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=tplvaqt.Value;
  dms.protizm.fieldbyname('new_value').AsString:=tpldel_flag.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  exit;
  end;
  if (tpln_pl.AsString<>tpln_pl.OldValue) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('vid').AsInteger:=10;
  dms.protizm.fieldbyname('nima').AsString:='pl №';
  dms.protizm.fieldbyname('old_value').AsString:=tpln_pl.OldValue;
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=tpluser_id.AsString;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=tplvaqt.Value;
  dms.protizm.fieldbyname('new_value').AsString:=tpln_pl.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;
  if (tpld_pl.Value<>tpld_pl.OldValue) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('vid').AsInteger:=10;
  dms.protizm.fieldbyname('nima').AsString:='pl sana';
  dms.protizm.fieldbyname('old_value').AsString:=tpld_pl.OldValue;
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=tpluser_id.AsString;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=tplvaqt.Value;
  dms.protizm.fieldbyname('new_value').AsString:=tpld_pl.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;
  //if (tplsena_pl.Value>0) and (tplsena_pl.OldValue>0) and  (tplsena_pl.OldValue<>sena_pl.Value) then begin
  if (tplsena_pl.OldValue<>tplsena_pl.Value) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('vid').AsInteger:=10;
  dms.protizm.fieldbyname('nima').AsString:='pl sena som';
  if tplsena_pl.OldValue=null then
    dms.protizm.fieldbyname('old_value').AsString:='pustoy'
  else
    dms.protizm.fieldbyname('old_value').AsString:=tplsena_pl.OldValue;
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=tpluser_id.Value;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=tplvaqt.AsDateTime;
  dms.protizm.fieldbyname('new_value').AsString:=tplsena_pl.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;
  if (tplsena_d.OldValue<>sena_d.Value) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('vid').AsInteger:=10;
  dms.protizm.fieldbyname('nima').AsString:='pl sena dollar';
  if tplsena_d.OldValue=null then
    dms.protizm.fieldbyname('old_value').AsString:='pustoy'
  else
    dms.protizm.fieldbyname('old_value').AsString:=tplsena_d.OldValue;
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=tpluser_id.Value;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=tplvaqt.AsDateTime;
  dms.protizm.fieldbyname('new_value').AsString:=tplsena_d.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;
  if (tplvid.OldValue<>tplvid.Value) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('nima').AsString:='pl vid';
  if tplvid.OldValue=null then
    dms.protizm.fieldbyname('old_value').AsString:='pustoy'
  else
    dms.protizm.fieldbyname('old_value').AsString:=tplvid.OldValue;
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=tpluser_id.Value;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=tplvaqt.AsDateTime;
  dms.protizm.fieldbyname('new_value').AsString:=tplvid.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;
  if (tplsrok.OldValue<>tplsrok.AsVariant) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('vid').AsInteger:=10;
  dms.protizm.fieldbyname('nima').AsString:='pl srok';
  if tplsrok.OldValue=null then
    dms.protizm.fieldbyname('old_value').AsString:='pustoy'
  else
    dms.protizm.fieldbyname('old_value').AsString:=tplsrok.OldValue;
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=tpluser_id.Value;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=tplvaqt.AsDateTime;
  dms.protizm.fieldbyname('new_value').AsString:=tplsrok.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;
  if (tplprim.OldValue<>tplprim.AsVariant) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('vid').AsInteger:=10;
  dms.protizm.fieldbyname('nima').AsString:='pl izoh';
  if tplprim.OldValue=null then
    dms.protizm.fieldbyname('old_value').AsString:='pustoy'
  else
    dms.protizm.fieldbyname('old_value').AsString:=tplprim.OldValue;
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=tpluser_id.Value;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=tplvaqt.AsDateTime;
  dms.protizm.fieldbyname('new_value').AsString:=tplprim.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=tplid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=dms.s_user.FieldByName('username').AsString;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;

end;

procedure Ts_haridor.RzBitBtn2Click(Sender: TObject);
var firstRow,i,qator,ustun:integer;ustuns:string;
begin
  ExcelCreateApplication('Haridorlar ro`yhati', 1,2, false);
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
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := '№';
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Haridor nomi';
  inc(ustun);Sheet.Cells[firstRow-1,ustun] := 'Telefon';
  dms.s_haridor.first;qator:=0;
  for i:=0 to dms.s_haridor.RecordCount-1 do begin
    ustun:=1;Sheet.Cells[firstrow+qator,ustun]:=inttostr(qator+1);
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=dms.s_haridornom.AsString;
    inc(ustun);Sheet.Cells[firstrow+qator,ustun]:=dms.s_haridortelsms1.AsString;
    inc(qator);
    dms.s_haridor.Next;
  end;
  //inc(col);
  i:=qator;ustun:=0;
  inc(ustun);
  Sheet.Cells[firstrow+i,ustun] := 'Jami:';
  inc(ustun);
  ustuns:='d';
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

  Sheet.Cells[2,1]:='Haridorlar ro`yhati';
  Sheet.Range['A2:'+ustuns+'2'].merge;Sheet.Cells[2,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;

end;

procedure Ts_haridor.RzBitBtn3Click(Sender: TObject);
begin
  if edit1.Text<>'28012013' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id,sana from asos WHERE (del_flag=1 and h_id = '+dms.s_haridorid.AsString+')');
  dms.link.open;
  if dms.link.RecordCount>0 then begin
     ShowMessage('Diqqat, Haridor tomonidan '+dms.link.fieldbyname('sana').AsString+' da amal bajariljan');
     //exit;
  end;
  if MessageDlg('Ushnu mol etkazuvchini o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id,sana from asos WHERE (del_flag=1 and h_id = '+dms.s_haridorid.AsString+')');
  dms.link.open;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('delete from asos_slave WHERE asos_id = '+dms.link.fieldbyname('id').AsString);
  dms.main_link.ExecSQL;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('delete from pl WHERE h_id = '+dms.s_haridorid.AsString);
  dms.main_link.ExecSQL;dms.main_link.Close;


     DMS.s_haridor.Edit;
     DMS.s_haridordel_flag.Value:=0;
     DMS.s_haridornom.AsString:=DMS.s_haridornom.AsString+' !!!';
     DMS.s_haridor.Post;
     //DMS.s_haridor.Refresh;
  end;

end;

end.
