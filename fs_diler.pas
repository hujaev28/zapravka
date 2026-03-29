unit fs_diler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, IniFiles, RzButton, GridsEh, DBGridEh, DBCtrlsEh, DBCtrls,
  RzDBCmbo, RzEdit, RzDBEdit, StdCtrls, Mask, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Ts_diler = class(TForm)
    gclient: TDBGridEh;
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    qpl: TDBGridEh;
    Gredit: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label18: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    n_pl: TDBNumberEditEh;
    d_pl: TDBDateTimeEditEh;
    sena_pl: TDBNumberEditEh;
    newpl: TRzBitBtn;
    delpl: TRzBitBtn;
    prim: TRzDBEdit;
    sena_d: TDBNumberEditEh;
    vid: TRzDBLookupComboBox;
    inv: TRzDBLookupComboBox;
    srok: TDBDateTimeEditEh;
    konv: TDBComboBoxEh;
    kurs: TDBNumberEditEh;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Label2: TLabel;
    nommarka: TEdit;
    Label1: TLabel;
    gachaq: TRzNumericEdit;
    gachaqd: TRzNumericEdit;
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
    tpls_vid: TStringField;
    tplsrok: TDateField;
    tplinv_id: TIntegerField;
    tpls_inv: TStringField;
    tplasos_id: TIntegerField;
    tplkonv: TIntegerField;
    Dpl: TDataSource;
    Ds_pl: TDataSource;
    s_pl: TZQuery;
    qarz: TZQuery;
    Dqarz: TDataSource;
    asos: TZQuery;
    Dasos: TDataSource;
    procedure xnewClick(Sender: TObject);
    procedure gclientDblClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nommarkaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure newplClick(Sender: TObject);
    procedure delplClick(Sender: TObject);
    procedure sena_plEnter(Sender: TObject);
    procedure n_plKeyPress(Sender: TObject; var Key: Char);
    procedure tplAfterScroll(DataSet: TDataSet);
    procedure tplAfterCancel(DataSet: TDataSet);
    procedure tplAfterPost(DataSet: TDataSet);
    procedure tplBeforeEdit(DataSet: TDataSet);
    procedure tplBeforeInsert(DataSet: TDataSet);
    procedure tplNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  clAverageSpeed: Double=0;
  s_diler: Ts_diler;

implementation

{$R *.dfm}
uses fdms,fulanish,fs_diler_edit,wcrypt2, fkirim_asos;
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

procedure Ts_diler.xnewClick(Sender: TObject);
begin
  dms.s_diler.Append;
  dms.s_dilerclient_id.value:=strtoint(admin_clid);
  s_diler_edit.ShowModal;
end;

procedure Ts_diler.gclientDblClick(Sender: TObject);
begin
  if h_id='-1' then begin
    kirim_asos.diler.Value:=dms.s_dilerid.asinteger;
    s_diler.Close;
  end
  else
  begin
    dms.s_diler.Edit;
    s_diler_edit.ShowModal;
  end;
end;

procedure Ts_diler.xdelClick(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id,sana from asos WHERE (del_flag=1 and diler_id = '+dms.s_dilerid.AsString+')');
  dms.link.open;
  if dms.link.RecordCount>0 then begin
     ShowMessage('Mol etkazuvchi tomonidan '+dms.link.fieldbyname('sana').AsString+' da amal bajariljan');
     exit;
  end;
  if MessageDlg('Ushnu mol etkazuvchini o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     DMS.s_diler.Edit;
     DMS.s_dilerdel_flag.Value:=0;
     DMS.s_diler.Post;
     DMS.s_diler.Refresh;
  end;

end;

procedure Ts_diler.xeditClick(Sender: TObject);
begin
  dms.s_diler.Edit;s_diler_edit.ShowModal;
end;

procedure Ts_diler.FormCreate(Sender: TObject);
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

procedure Ts_diler.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_diler.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_diler.nommarkaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (nommarka.Text>'')  then  //and (Key = #13)
 begin
  dms.s_diler.Close;dms.s_diler.sql.Clear;
  dms.s_diler.SQL.Add('select * from s_diler WHERE del_flag=1 and ((telsms1 like "%'+lat_kril(nommarka.Text)+'%") or (nom like "%'+lat_kril(nommarka.Text)+'%") or (nom like "%'+nommarka.Text+'%")) order by nom');
  dms.s_diler.open;
 end;

end;

procedure Ts_diler.FormActivate(Sender: TObject);
begin
  if s_pl.Active=false then s_pl.Open;
  if tpl.Active=false then tpl.Open;
  asos.Open;qarz.Open;
  if diler_id<>'' then
  dms.s_diler.Locate('id',StrToInt(diler_id),[loCaseInsensitive]);

end;

procedure Ts_diler.newplClick(Sender: TObject);
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
    tplAfterScroll(tpl);
  end;

end;

procedure Ts_diler.delplClick(Sender: TObject);
begin
  if tpl.State=dsBrowse then
  begin
    if MessageDlg('Qatorni o`chrasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
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

procedure Ts_diler.sena_plEnter(Sender: TObject);
begin
  if tplkonv.AsVariant=null then exit;
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value=2) and (kurs.Value>0)  then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value=1) and (kurs.Value>0) then
    sena_d.Value:=sena_pl.Value/kurs.Value;


end;

procedure Ts_diler.n_plKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_diler.tplAfterScroll(DataSet: TDataSet);
var danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;d1,d2,kr,ch,a0,a1,a2:string;
begin
    // Дастлабки санадан кичик булган харидорнинг карзи,  (tur_oper=2 - сотиш) ("summa" - накд карзи, "epos" - перечисление)
  if dms.s_diler.RecordCount=0 then exit;
  if dms.s_diler.State in [dsedit,dsinsert] then exit;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',sum_d,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',summa,0)) as b_summa');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_d,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',summa,0)) as o_summa');
  dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper in (1,3,4,5) and diler_id="'+dms.s_dilerid.AsString+'" order by id');
  dms.main_link.open;
  danq:=dms.main_link.fieldbyname('b_summa').AsFloat;
  danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat;
  chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;d1:='and d_pl < '+kasaya(now);d2:=' and d_pl between '+kasaya(now)+' and '+kasaya(now);
  dms.main_link.SQL.Add('SELECT ');kr:=' vid in (9,15) ';ch:=' vid in (3,14) ';a0:=' (konv =0 or konv is null) and ';a1:='konv=1 and ';a2:='konv=2 and  ';
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
  dms.main_link.SQL.Add('from pl WHERE del_flag=1 and diler_id="'+dms.s_dilerid.AsString+'"');
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
end;

procedure Ts_diler.tplAfterCancel(DataSet: TDataSet);
begin
  newpl.Caption:='Yangi';delpl.Caption:='o`chirish';
  gclient.Enabled:=true;

end;

procedure Ts_diler.tplAfterPost(DataSet: TDataSet);
begin
  newpl.Caption:='Yangi';delpl.Caption:='o`chirish';
  gclient.Enabled:=true;

end;

procedure Ts_diler.tplBeforeEdit(DataSet: TDataSet);
begin
  newpl.Caption:='Saqlash';delpl.Caption:='Bekor qilish';
  gclient.Enabled:=false;

end;

procedure Ts_diler.tplBeforeInsert(DataSet: TDataSet);
begin
  newpl.Caption:='Saqlash';delpl.Caption:='Bekor qilish';
  gclient.Enabled:=false;

end;

procedure Ts_diler.tplNewRecord(DataSet: TDataSet);
begin
  tpldiler_id.AsInteger:=dms.s_dilerid.AsInteger;
  tplclient_id.AsInteger:=dms.s_clientid.AsInteger;
  tpluser_id.AsInteger:=dms.s_user.fieldbyname('id').AsInteger;
  tpld_pl.AsDateTime:=date();tplvid.AsInteger:=3;

end;

end.
