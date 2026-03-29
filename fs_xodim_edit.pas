unit fs_xodim_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzRadChk, RzButton, StdCtrls, Mask, RzDBEdit, RzLabel,
  DBGridEh, DBCtrlsEh, DBLookupEh;

type
  Ts_xodim_edit = class(TForm)
    Label1: TLabel;
    fio: TRzDBEdit;
    RzLabel1: TRzLabel;
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    activ: TRzCheckBox;
    Label2: TLabel;
    login: TRzDBEdit;
    Label3: TLabel;
    kod: TRzDBEdit;
    Label4: TLabel;
    prl: TRzEdit;
    Label7: TLabel;
    client: TDBLookupComboboxEh;
    status: TRzDBEdit;
    RzLabel2: TRzLabel;
    id: TRzDBEdit;
    RzLabel3: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzLabel4: TRzLabel;
    ustama: TRzDBEdit;
    Label5: TLabel;
    phone_number: TRzDBEdit;
    RzLabel5: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    inv: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure activMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fioKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_xodim_edit: Ts_xodim_edit;

implementation

uses fdms, fulanish,wcrypt2;

{$R *.dfm}
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
procedure Ts_xodim_edit.saveClick(Sender: TObject);
begin
  if dms.s_xodimusername.AsString='' then begin
    ShowMessage('Xodim loginini kiriting');ActiveControl:=login;Exit;
  end;
  if dms.s_xodimfio.AsString='' then begin
    ShowMessage('Xodim nomini kiriting');ActiveControl:=fio;Exit;
  end;
  if prl.Text<>'' then dms.s_xodimuserpass.AsString:=md5(prl.Text);
  if dms.s_xodimstatus.Value<>10 then begin
    dms.s_xodimauth_key.AsString:='';dms.s_xodimpassword_hash.AsString:='';dms.s_xodimpassword_reset_token.AsString:='';
    dms.s_xodimemail.AsString:='';
    dms.s_xodimcreated_at.AsInteger:=0;dms.s_xodimupdated_at.AsInteger:=0;
  end;
  dms.s_xodimdel_flag.AsInteger:=1;
  if dms.s_xodimauth_key.AsString='' then
  begin
    dms.s_xodimauth_key.AsString:='1fQmtmXXee2bNL3MSYr_i0iNplzboMd1';
    dms.s_xodimpassword_hash.AsString:='$2y$13$PDuP4e9cSmNLQjQSozuuZO6ygjWFGSvluXWn53a2.D4.aOnuM6ovu';
  end;
  dms.s_xodimemail.AsString:='test'+dms.s_xodimid.AsString+'@gmail.com';
  dms.s_xodim.post;
  s_xodim_edit.Close;
end;

procedure Ts_xodim_edit.cancelClick(Sender: TObject);
begin
  dms.s_xodim.Cancel;
  s_xodim_edit.Close;
end;

procedure Ts_xodim_edit.activMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if activ.Checked=false then
    dms.s_xodimactive.value:=1
  else
    dms.s_xodimactive.value:=0;
end;

procedure Ts_xodim_edit.fioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_xodim_edit.FormActivate(Sender: TObject);
begin
  s_xodim_edit.prl.Text:='';
  s_xodim_edit.login.SetFocus;

end;

procedure Ts_xodim_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dms.s_xodim.Cancel;
end;

end.
