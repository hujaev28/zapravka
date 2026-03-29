unit fs_tovar_kirim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,ZDataset, IniFiles,jpeg,DBCtrls, RzTabs, Menus, RzPanel, RzRadGrp,
  ExtCtrls, RzRadChk, RzSplit,SUIPopupMenu, DBGridEh, DBCtrlsEh, Mask,
  DBLookupEh, StdCtrls, RzButton,GridsEh, frxDesgn, frxClass, frxDBSet;
const
  {символы десятичной системы}
  LetInteger: array[0..9]of Char=('0','1','2','3','4','5','6','7','8','9');
  {буквы EN раскладки}
  EngLet: string ='`qwertyuiop[]asdfghjkl;''zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>';
  {буквы RU раскладки}
  RusLet: string ='ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ';
type

  Ts_tovar_kirim = class(TForm)
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    shtrix: TEdit;
    Edit1: TEdit;
    turi: TRzRadioGroup;
    gpopup: TsuiPopupMenu;
    MenuItem9: TMenuItem;
    Menu_kirim: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    gqoldir: TDBGridEh;
    qpopup: TsuiPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    kirimcheck: TRzCheckBox;
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
    Label15: TLabel;
    n_diler: TDBLookupComboboxEh;
    Label14: TLabel;
    nomer: TDBEdit;
    Label9: TLabel;
    n_sana: TDBDateTimeEditEh;
    Image3: TImage;
    tplpopup: TsuiPopupMenu;
    newsfm: TMenuItem;
    X1: TMenuItem;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label3: TLabel;
    Copies: TDBNumberEditEh;
    Bosmalash20: TRzBitBtn;
    sotish: TDBNumberEditEh;
    pechat40: TRzBitBtn;
    kg: TDBNumberEditEh;
    pechat20: TRzBitBtn;
    Label10: TLabel;
    f: TDBComboBoxEh;
    frxs_tovar: TfrxDBDataset;
    frxsf: TfrxReport;
    frxDesigner1: TfrxDesigner;
    asos_slave: TfrxDBDataset;
    qaytahisoblash1: TMenuItem;
    p_seriya: TRzPanel;
    RzPanel5: TRzPanel;
    DBGridEh1: TDBGridEh;
    Image4: TImage;
    soni: TLabel;
    Edit2: TEdit;
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
    procedure gclientDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure varaqClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure newsfmClick(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure CopiesKeyPress(Sender: TObject; var Key: Char);
    procedure sotishEnter(Sender: TObject);
    procedure pechat40Click(Sender: TObject);
    procedure Bosmalash20Click(Sender: TObject);
    procedure pechat20Click(Sender: TObject);
    procedure fChange(Sender: TObject);
    procedure qaytahisoblash1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  clAverageSpeed: Double=0;
  s_tovar_kirim: Ts_tovar_kirim;

implementation

{$R *.dfm}
uses fdms,fs_tovar_edit,fulanish, wcrypt2, Math,ClipBrd, fkirim_edit,frxBarcode,
  comobj,fkirim, fsetup, fhato;
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

procedure Ts_tovar_kirim.xnewClick(Sender: TObject);
begin
  if dms.s_tovar.State=dsbrowse then dms.s_tovar.Append;
  s_tovar_edit.zapis.Text:='1';
  dms.s_tovarkat.Value:=0;dms.s_tovarbrend.Value:=0;
  dms.s_tovarizm_id.Value:=3;dms.s_tovarizm1.Value:=2;
  dms.s_tovaruser_id.AsInteger:=StrToInt(admin_id);
  dms.s_tovarclient_id.AsInteger:=dms.s_clientid.AsInteger;
  dms.s_tovarkol_in.value:=1;
  dms.s_tovarturi.Value:=0;dms.s_tovarresept.Value:=0;
  dms.s_tovarshtrixkod.Value:=1;dms.s_tovarqrkod.Value:=0;
  s_tovar_edit.resept.Checked:=false;
  if s_tovar_kirim.shtrix.Text<>'' then dms.s_tovarshtrix.Value:=s_tovar_kirim.shtrix.Text;
  if dms.s_tovarholat.Value=1 then s_tovar_edit.holat.Checked:=True else s_tovar_edit.holat.Checked:=False;

  s_tovar_edit.save.Enabled:=true;
  s_tovar_edit.saveadd.Visible:=true;
  s_tovar_edit.savewithout.Visible:=false;
  s_tovar_edit.oldsotish.value:=0;s_tovar_edit.oldsotish_d.value:=0;
  s_tovar_edit.ShowModal;
end;

procedure Ts_tovar_kirim.gclientDblClick(Sender: TObject);
begin
  if DMS.s_tovardel_flag.Value=0 then begin
    ShowMessage('Ushbu qator o`chirilgan. Administratorga murojat qiling. +998 93 5602290');
    exit;
  end;
  dms.s_tovar.Edit;if s_tovar_kirim.shtrix.Text<>'' then dms.s_tovarshtrix.Value:=s_tovar_kirim.shtrix.Text;
  if dms.s_tovarresept.Value=1 then s_tovar_edit.resept.Checked:=True else s_tovar_edit.resept.Checked:=False;
  s_tovar_edit.ShowModal;
end;

procedure Ts_tovar_kirim.xdelClick(Sender: TObject);
begin
 if (length(DMS.s_tovarshtrix.AsString)>0) then exit;
 //if admin_type='1' then exit;
 kirim.link.Close;kirim.link.SQL.Clear;
 kirim.link.SQL.Add('select asos_slave.id,asos.sana from asos_slave,asos WHERE asos.id=asos_slave.asos_id and (tovar_id = '+dms.s_tovarid.AsString+')');
 kirim.link.open;
 if kirim.link.RecordCount>0 then begin
   ShowMessage('tovar nomidan '+kirim.link.fieldbyname('sana').AsString+' da amal bajariljan');
   exit;
 end;
 if MessageDlg('Ushnu tovarni spravochnikdan o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     DMS.s_tovar.Edit;
     DMS.s_tovardel_flag.Value:=0;
     DMS.s_tovar.Post;
     hatolar.t_id.Text:=DMS.s_tovarid.AsString;
     hatolar.qoldiq_tekshirClick(Sender);

     DMS.s_tovar.Refresh;
   end;
  s_tovar_kirim.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
end;

procedure Ts_tovar_kirim.xeditClick(Sender: TObject);
begin
  if admin_type='1' then exit;
  if DMS.s_tovardel_flag.Value=0 then begin
    ShowMessage('Ushbu qator o`chirilgan. Administratorga murojat qiling. +998 93 5602290');
    exit;
  end;
  s_tovar_edit.oldnom.Text:=dms.s_tovarnom.AsString;
  //s_tovar_edit.oldshtrix.Text:=dms.s_tovarshtrix.AsString;
  //s_tovar_edit.oldaniq.Value:=dms.s_tovaraniq.AsVariant;
  dms.s_tovar.Edit;
  if dms.s_tovarholat.Value=1 then s_tovar_edit.holat.Checked:=True else s_tovar_edit.holat.Checked:=False;
  if dms.s_tovarresept.Value=1 then s_tovar_edit.resept.Checked:=True else s_tovar_edit.resept.Checked:=False;
  //if dms.s_tovarshtrixkod.Value=1 then s_tovar_edit.shtrixkod.Checked:=True else s_tovar_edit.shtrixkod.Checked:=False;
  s_tovar_edit.savewithout.Visible:=false;s_tovar_edit.saveadd.Visible:=false;
  s_tovar_edit.ShowModal;
end;

procedure Ts_tovar_kirim.FormCreate(Sender: TObject);
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

procedure Ts_tovar_kirim.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin

  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_tovar_kirim.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ts_tovar_kirim.gclientKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_INSERT then xnewClick(Sender);
  if key=VK_RETURN then xeditClick(Sender);

end;

procedure Ts_tovar_kirim.shtrixExit(Sender: TObject);
var s:string;
begin
  if shtrix.Text='' then exit;kirim_edit.savdo.Text:='';
  dms.link.Close;dms.link.SQL.Clear;s:=StrReplace(shtrix.Text,'http://verum.uz/qr.php?text=','');
  if pos('http://verum.uz/qr.php?text=',shtrix.Text)>0 then
  begin
    kirim_edit.savdo.Text:=s;
    dms.link.SQL.Add('select s_tovar.id,s_tovar.nom from main,s_tovar WHERE main.tovar_id=s_tovar.id and s_tovar.holat=1 and s_tovar.del_flag=1 and main.qrkod = "'+s+'"');
  end
  else
  dms.link.SQL.Add('select id,nom from s_tovar WHERE holat=1 and del_flag=1 and shtrix = "'+shtrix.Text+'"');
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
      kirim_edit.savdo.Text:=s;
      dms.s_tovar.SQL.Add('select s_tovar.* from main,s_tovar WHERE main.tovar_id=s_tovar.id and s_tovar.holat=1 and s_tovar.del_flag=1 and main.qrkod = "'+s+'"');
    end
    else
      dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and shtrix="'+shtrix.Text+'"');
    dms.s_tovar.open;
    dms.k_slave1.Open;dms.k_slave1.refresh;

    if (kirimcheck.Checked) then begin
      if admin_type<>'2' then exit;
      shtrix.Text:='';
      Menu_kirimClick(Sender);
      exit;
    end
    else
    begin
    shtrix.Text:='';
      if admin_type='1' then exit;
      xeditClick(Sender);
      exit;
    end

  end;shtrix.Text:='';
end;

procedure Ts_tovar_kirim.shtrixKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_tovar_kirim.shtrixEnter(Sender: TObject);
begin
  shtrix.Text:='';
end;

procedure Ts_tovar_kirim.turiClick(Sender: TObject);
begin
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  case turi.ItemIndex of
  0:dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 order by nom');
  1:dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and shtrix<>"" order by nom');
  2:dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and (shtrix is null or shtrix="") order by nom');
  end;
  dms.s_tovar.open;
  s_tovar_kirim.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';

end;

procedure Ts_tovar_kirim.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    if (kirimcheck.Checked) then begin
      if admin_type<>'2' then exit;
      Menu_kirimClick(Sender);
      exit;
    end
    else
    begin
      if admin_type='1' then exit;
      xeditClick(Sender);
      exit;
    end
  end;

end;

procedure Ts_tovar_kirim.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var s,s1,s2:string;y:integer;
begin
  {if length(Edit1.Text) < 2 then exit;
  dms.s_tovar.Filtered:=false;
  s:='nom Like "%'+Edit1.Text+'%"';
  dms.s_tovar.Filter:=s;
  dms.s_tovar.Filtered:=true;
  dms.s_tovar.Refresh;
  exit;}
  if (Key = VK_DOWN) and (not dms.s_tovar.Eof) then dms.s_tovar.Next
  else if (Key = VK_UP) and (not dms.s_tovar.bof) then
  begin
    dms.s_tovar.Prior;edit1.SelStart:=length(edit1.Text)+1;
  end
  else
  if length(Edit1.Text) > 2 then begin
    s:=trim(Edit1.Text);s1:=s;s2:='';
    y:=pos(' ',s);
    if y>0 then begin
      s1:=copy(s,1,y-1);
      s2:=copy(s,y+1,length(s)-y);
    end;
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and ');
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
     dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and ');
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
    s_tovar_kirim.caption:='Tovarlar bazasi = '+inttostr(dms.s_tovar.RecordCount)+' ta';
  end;

end;

procedure Ts_tovar_kirim.MenuItem9Click(Sender: TObject);
begin
  //Clipboard.AsText:=dms.s_tovarnom.AsString;
end;

procedure Ts_tovar_kirim.FormActivate(Sender: TObject);
var IniFile:TIniFile;
begin
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  //if admin_type='2' then
    dms.qoldiq.SQL.Add('SELECT * FROM asos_slave where del_flag=1 and tovar_id=:id  and tovar_nom is null  order by id desc');
  //else
  //  DMS.qoldiq.sql.add('SELECT * FROM asos_slave where del_flag=1 and tovar_id = :id and user_id = '+admin_id+'  and tovar_nom is null order by id desc');
  dms.qoldiq.open;

  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  s_tovar_kirim.f.Value:=strtoint(IniFile.ReadString('BAZA','formatshtrix','1'));IniFile.Free;

  if admin_type='1' then begin
    xnew.Visible:=false;xdel.Visible:=false;xedit.Visible:=false;
  end;
  if dms.s_clientichkitovar.AsInteger=0 then begin
    gqoldir.Columns.Items[4].Visible:=false;
    gqoldir.Columns.Items[5].Visible:=false;
    gqoldir.Columns.Items[6].Visible:=false;
    gqoldir.Columns.Items[8].Visible:=false;
  end;
  if dms.s_clientsert.AsInteger=0 then begin
     gqoldir.Columns.Items[9].Visible:=false;
  end;
  if dms.s_clientseriya.AsInteger=0 then begin
     p_seriya.Visible:=false;
  end;
  if dms.s_clientdollar.AsInteger=0 then begin
     gclient.Columns[17].Visible:=false;gclient.Columns[18].Visible:=false;
  end;
  if DMS.s_clientat91.Value=2 then begin
    varaq.Visible:=false;
    gclient.Columns[9].Visible:=false;gclient.Columns[10].Visible:=false;
    gclient.Columns[11].Visible:=false;gclient.Columns[13].Visible:=false;
  end;

end;

procedure Ts_tovar_kirim.Menu_kirimClick(Sender: TObject);
begin
  if dms.s_tovar.RecordCount=0 then begin
    ShowMessage('Tovar tanlanmagan');ActiveControl:=gclient;Exit;
  end;
  dms.s_t_all.Refresh;
  dms.s_t_all.Locate('id',dms.s_tovarid.AsInteger,[loCaseInsensitive]);
  dms.k_slave1.append;
  dms.k_slave1.FieldByName('asos_id').AsInteger:=dms.k_asosid.AsInteger;
  dms.k_slave1.FieldByName('tovar_id').AsInteger:=dms.s_tovarid.AsInteger;
  dms.k_slave1.FieldByName('user_id').AsInteger:=strtoint(admin_id);
  dms.k_slave1.FieldByName('turi').AsInteger:=dms.s_tovarturi.AsInteger;
  dms.k_slave1.FieldByName('foiz').AsInteger:=20;
  dms.k_slave1.FieldByName('qrkod').AsInteger:=0;
  if dms.s_t_allkol_in.AsInteger>0 then
  begin
    dms.k_slave1.FieldByName('foiz_in').AsInteger:=20;kirim_edit.Gichki.Visible:=true;
  end
  else
  begin
    kirim_edit.Gichki.Visible:=false;
  end;
  dms.k_slave1.FieldByName('resept').AsInteger:=dms.s_tovarresept.AsInteger;
  dms.k_slave1.FieldByName('izm_id').AsInteger:=dms.s_tovarizm_id.AsInteger;
  dms.k_slave1.FieldByName('izm1').AsInteger:=dms.s_tovarizm1.AsInteger;
  dms.k_slave1qrkod.Value:=0;
  dms.k_slave1.FieldByName('sotish').AsFloat:=0;
  kirim_edit.showmodal;
end;

procedure Ts_tovar_kirim.MenuItem1Click(Sender: TObject);
begin

  dms.s_t_all.Locate('id',dms.k_slave1tovar_id.AsInteger,[loCaseInsensitive]);
  dms.k_slave1.Edit;
  if dms.k_slave1qrkod.Value=1 then kirim_edit.qrkod.Checked:=True else kirim_edit.qrkod.Checked:=False;
  kirim_edit.showmodal;
end;

procedure Ts_tovar_kirim.MenuItem2Click(Sender: TObject);
begin
  //if admin_type<>'2' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select a.id,a.sana from asos a,asos_slave s WHERE s.del_flag=1  and a.id=s.asos_id and kol_ost = '+dms.k_slave1id.AsString);
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('tovar nomidan '+dms.link.fieldbyname('sana').AsString+' da amal bajariljan');
    exit;
  end;
  if MessageDlg('Ushnu tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     DMS.k_slave1.Edit;
     DMS.k_slave1.FieldByName('del_flag').Value:=0;
     DMS.k_slave1.Post;
     DMS.k_slave1.Refresh;
   end;
end;

procedure Ts_tovar_kirim.gclientDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;State: TGridDrawState);
var  holdColor: TColor;
begin
  if gdSelected in State then begin
    gclient.Canvas.Brush.Color := clLtGray;
    //Tovarlar.Canvas.Font.Style := [fsBold];
    //gclient.Canvas.Font.Color := clBlack;
    gclient.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  holdColor := gclient.Canvas.Font.Color;
  if Column.FieldName = 'nom' then begin
    if (dms.s_tovarturi.AsInteger =1) then begin
      gclient.Canvas.Font.Color := clRed; //Brush
      gclient.Canvas.Font.Style :=  [fsbold];
      gclient.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      gclient.Canvas.Font.Color := holdColor;
    end;
    if dms.s_tovarresept.AsInteger = 1 then
    begin
      gclient.Canvas.Font.Color := clGreen; //Brush
      gclient.Canvas.Font.Style :=  [fsbold];
      gclient.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      gclient.Canvas.Font.Color := holdColor;
    end;
    if (dms.s_tovarturi.AsInteger =1) and (dms.s_tovarresept.AsInteger = 1) then
    begin
      gclient.Canvas.Font.Color := clWhite; //Brush
      gclient.Canvas.Font.Style :=  [fsbold];
      with gclient.Canvas do begin
      Brush.Color := clBlue;
      //if (dms.s_tovarturi.AsInteger =1) then Font.Color := clRed;
      FillRect(Rect);TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text);
    end;
    end;



  end;

  end;

procedure Ts_tovar_kirim.varaqClick(Sender: TObject);
begin
  case varaq.ActivePageIndex of
  0:begin // jami
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 order by nom');
    dms.s_tovar.open;
    varaq.Pages[0].Caption:='Jami = '+inttostr(dms.s_tovar.RecordCount);
    end;
  1:begin // Reestr
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and turi=1 order by nom');
    dms.s_tovar.open;
    varaq.Pages[1].Caption:='Ishtimoiy narxdagi dorilar = '+inttostr(dms.s_tovar.RecordCount);
    end;
  2:begin // Resepli dori
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and resept=1 order by nom');
    dms.s_tovar.open;
    varaq.Pages[2].Caption:='Retsepsiz berilmaydigan dorilar = '+inttostr(dms.s_tovar.RecordCount);
    end;
  3:begin // xabar
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and nom_ru is not null order by nom');
    dms.s_tovar.open;
    varaq.Pages[3].Caption:='Admin uchun = '+inttostr(dms.s_tovar.RecordCount);
    end;
  4:begin // Bo`lishi shart
    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select * from s_tovar WHERE holat=1 and del_flag=1 and shart=1 order by nom');
    dms.s_tovar.open;
    varaq.Pages[4].Caption:='Bo`lishi shart = '+inttostr(dms.s_tovar.RecordCount);
    end;
  end;

end;

procedure Ts_tovar_kirim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  kirim.refresh;
end;

procedure Ts_tovar_kirim.Edit2Exit(Sender: TObject);
begin
  kirim.link.Refresh;
end;

procedure Ts_tovar_kirim.Edit2Enter(Sender: TObject);
begin
  edit2.Text:='';
end;

procedure Ts_tovar_kirim.Edit2KeyPress(Sender: TObject; var Key: Char);
var mainid,i:integer;
begin
  if Key = #13 then begin
    if edit2.Text='' then exit;
    if Length(edit2.Text)<>15 then begin exit;end;
    for i:=1 to 15 do begin
      if edit2.Text[i] in ['/','\'] then begin
        edit2.Text:='';
        exit;
      end;
    end;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select id,serial from main where serial="'+edit2.Text+'"');
    dms.main_link.Open;
    if dms.main_link.RecordCount=0 then begin
      dms.main_link.Append;
      dms.main_link.FieldByName('serial').AsString:=edit2.Text;
      dms.main_link.post;
    end;
    mainid:=dms.main_link.fieldbyname('id').AsInteger;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select t.nom,a.nomer,a.sana,main.serial from main,slave_main sm,asos_slave s,s_tovar t,asos a where s.del_flag=1 and sm.main_id=main.id and a.id=s.asos_id and t.id=s.tovar_id and s.id=sm.slave_id and sm.main_id="'+IntToStr(mainid)+'"');
    dms.main_link.Open;
    if dms.main_link.RecordCount>0 then begin
      ShowMessage(shtrix.Text+' kirim qilingan. tovar = '+dms.main_link.fieldbyname('nom').AsString+' nomer = '+dms.main_link.fieldbyname('nomer').AsString+' sana = '+dms.main_link.fieldbyname('sana').AsString);
      edit2.Text:='';
      exit;
    end;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('insert into slave_main (main_id,slave_id) values ('+inttostr(mainid)+','+dms.k_slave1id.AsString+')');
    dms.main_link.ExecSQL;

    kirim.link.Refresh;
    edit2.Text:='';
  end;
end;

procedure Ts_tovar_kirim.newsfmClick(Sender: TObject);
begin
  if MessageDlg(' seriyani o`chirasizmi?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('delete from slave_main where id = '+kirim.link.fieldbyname('id').AsString);
    dms.main_link.ExecSQL;
    kirim.link.Refresh;
    edit2.SetFocus;
end;

procedure Ts_tovar_kirim.X1Click(Sender: TObject);
begin
  Clipboard.AsText:=kirim.link.fieldbyname('serial').AsString;
  edit2.SetFocus;
end;

procedure Ts_tovar_kirim.CopiesKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then begin
    if dms.s_tovarshtrix_full.AsString<>'' then
      pechat20Click(Sender)
    else
      pechat40Click(Sender);
  end;
end;

procedure Ts_tovar_kirim.sotishEnter(Sender: TObject);
begin
  if DMS.qoldiq.RecordCount=0 then exit;
  DMS.s_tovar.Edit;
  DMS.s_tovarsotish.AsInteger:=DMS.qoldiqsotish.AsInteger;
  DMS.s_tovar.Post;
end;

procedure Ts_tovar_kirim.pechat40Click(Sender: TObject);
var s1,s2,sf:string;razmer:Integer;sh:TfrxBarCodeView;Top1String:TfrxMemoView;
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

procedure Ts_tovar_kirim.Bosmalash20Click(Sender: TObject);
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

procedure Ts_tovar_kirim.pechat20Click(Sender: TObject);
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

procedure Ts_tovar_kirim.fChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','formatshtrix',IntToStr(f.value));IniFile.Destroy;
end;

procedure Ts_tovar_kirim.qaytahisoblash1Click(Sender: TObject);
begin
  hatolar.t_id.Text:=dms.s_tovarid.AsString;
  hatolar.qoldiq_tekshirClick(sender);
end;

end.
