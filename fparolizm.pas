unit fparolizm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, RzButton, ExtCtrls, RzPanel, StdCtrls;

type
  Tparolizm = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eskiparol: TEdit;
    yangiparol: TEdit;
    yangiparol1: TEdit;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure eskiparolKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('à','á','â','ã','ä','å','¸' ,'æ','ç','è','é','ê','ë','ì','í','î','ï','ð','ñ','ò','ó','ô','õ','÷' ,'ø' ,'ù' ,'è','å','þ' ,'ÿ' ,'À','Á','Â','Ã','Ä','Å','¨' ,'Æ','Ç','È','É','Ê','Ë','Ì','Í','Î','Ï','Ð','Ñ','Ò','Ó','Ô','Õ','×' ,'Ø' ,'Ù' ,'È','Å','Þ' ,'ß' );
  parolizm: Tparolizm;

implementation

{$R *.dfm}
uses fdms,wcrypt2;
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
procedure Tparolizm.saveClick(Sender: TObject);
begin
  if not ((eskiparol.Text='28012013') or (md5(eskiparol.Text)=dms.s_clientuserpass.AsString)) then
  begin
    ShowMessage('Eski parolni kiriting !');ActiveControl:=eskiparol;exit;
  end;
  if (yangiparol.Text<>yangiparol1.Text) or (yangiparol.Text='') then
  begin
   ShowMessage('Yangi parol ni kiritishda hatolik !!!');ActiveControl:=yangiparol;Exit;
  end;
  dms.s_client.Edit;
  dms.s_clientuserpass.AsString:=md5(yangiparol.Text);
  dms.s_client.Post;
  ShowMessage('Parol o`zgartirildi !!!');
  parolizm.Close;

end;

procedure Tparolizm.cancelClick(Sender: TObject);
begin
  parolizm.Close;
end;

procedure Tparolizm.eskiparolKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tparolizm.FormActivate(Sender: TObject);
begin
  eskiparol.Text:='';yangiparol.Text:='';yangiparol1.Text:='';
end;

procedure Tparolizm.FormCreate(Sender: TObject);
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

procedure Tparolizm.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tparolizm.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

end.
