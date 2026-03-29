unit fs_client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh,IniFiles, IdTCPConnection, IdTCPClient, IdHTTP,
  ExtCtrls, StdCtrls, RzButton, IdBaseComponent, IdComponent;
type
  Ts_client = class(TForm)
    gclient: TDBGridEh;
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    Label1: TLabel;
    parol: TEdit;
    RzBitBtn1: TRzBitBtn;
    IdHTTP1: TIdHTTP;
    Panel1: TPanel;
    smstext: TEdit;
    Label2: TLabel;
    smssend: TRzBitBtn;
    procedure xnewClick(Sender: TObject);
    procedure gclientDblClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure smssendClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  clAverageSpeed: Double=0;
  s_client: Ts_client;

implementation

{$R *.dfm}
uses fdms,fs_client_edit,fulanish, wcrypt2;
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

procedure Ts_client.xnewClick(Sender: TObject);
begin
  dms.client_edit.Append;dms.client_editobl.value:=22;dms.client_editkomu.value:=2;
  dms.client_edituyu_type.value:=1;
  dms.client_editgaraj_turi.value:=0;
  s_client_edit.ShowModal;
end;

procedure Ts_client.gclientDblClick(Sender: TObject);
begin
  dms.client_edit.Edit;
  s_client_edit.ShowModal;
end;

procedure Ts_client.xdelClick(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * from asos WHERE del_flag=1 and (client_id = '+dms.client_editid.AsString+')');
  dms.link.open;
  if dms.link.RecordCount>0 then begin
     ShowMessage('korxona tomnidan '+dms.link.fieldbyname('sana').AsString+','+dms.link.fieldbyname('tur_oper').AsString+','+dms.link.fieldbyname('id').AsString+' amal bajariljan');
     exit;
  end;
  if MessageDlg('Ushnu korxonani o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     DMS.client_edit.Edit;
     DMS.client_editdel_flag.Value:=0;
     DMS.client_edit.Post;
     DMS.client_edit.Refresh;
  end;

end;

procedure Ts_client.xeditClick(Sender: TObject);
begin
  if dms.s_clientgaraj_turi.Value=1 then s_client_edit.Filial.Checked:=True else s_client_edit.Filial.Checked:=False;
  dms.client_edit.Edit;s_client_edit.ShowModal;
end;

procedure Ts_client.FormCreate(Sender: TObject);
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

procedure Ts_client.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_client.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_client.RzBitBtn1Click(Sender: TObject);
var s:string;
begin
  if parol.Text='' then begin
    ShowMessage('Parol katakchasi b`osh');parol.SetFocus;exit;
  end;
  if MessageDlg('Korxona rahbari parolini o`zgartirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.client_edit.Edit;dms.client_edit.fieldbyname('userpass').Value:=md5(parol.Text);dms.client_edit.Post;
    if (admin_type='3') and (ulanish.metod.ItemIndex>0) then begin
    s:='http://94.158.53.140/savdoclient.php?text=Hurmarli '+dms.client_editmasul1.asstring+', '+dms.client_editnom.AsString+' korxonasi paroli ozgartirildi. ('+parol.Text+') tel: '+DMS.s_user.fieldbyname('tel1').AsString+' '+DMS.s_user.fieldbyname('tel2').AsString+'&ver=13&msisdn=998'+dms.client_edittelsms1.AsString;
    s:=StrReplace(s,' ','%20');s:=StrReplace(s,'`','^');
    if length(DMS.client_edittelsms1.AsString)=9 then IdHttp1.Get(UTF8Encode(s));
    s:='http://94.158.53.140/savdoclient.php?text=Hurmarli '+dms.client_editmasul2.asstring+', '+dms.client_editnom.AsString+' korxonasi paroli ozgartirildi. ('+parol.Text+') tel:  '+DMS.s_user.fieldbyname('tel1').AsString+' '+DMS.s_user.fieldbyname('tel2').AsString+'&ver=13&msisdn=998'+dms.client_edittelsms2.AsString;
    s:=StrReplace(s,' ','%20');s:=StrReplace(s,'`','^');
    if length(DMS.client_edittelsms2.AsString)=9 then IdHttp1.Get(UTF8Encode(s));
    ShowMessage('Parol saqlandi va korxona rahbariga sms yuborildi. ');
    end;
  end;
end;

procedure Ts_client.smssendClick(Sender: TObject);
var s:string;
begin
  if ulanish.metod.ItemIndex=0 then exit;
  if smstext.Text='' then begin
    ShowMessage('SMS matni b`osh');smstext.SetFocus;exit;
  end;
  if MessageDlg('Barcha korxona raxbarlariga ushbu xabarni jo`natasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    //dms.client_edit.First;
    //dms.client_edit.Locate('inn','205985751',[loCaseInsensitive]);
    while not dms.client_edit.Eof do begin
      s:='http://94.158.53.140/savdoclient.php?text='+smstext.Text+'&ver=25&msisdn=998'+dms.client_edittelsms1.AsString;
      s:=StrReplace(s,' ','%20');s:=StrReplace(s,'`','^');
      //ShowMessage(s);
      IdHttp1.Get(UTF8Encode(s));
      dms.client_edit.Next;
    end;
    ShowMessage('Barcha korxona rahbarlariga sms yuborildi. ');
  end;

end;

procedure Ts_client.FormActivate(Sender: TObject);
begin
  s_client.Caption:='Korxonalar soni = '+inttostr(dms.client_edit.RecordCount);
end;

end.
