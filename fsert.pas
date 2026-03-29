unit fsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MultiTWAIN, JPEG,janFX,inifiles, ShellAPI,IdFTPCommon, DB,
  Menus, SUIPopupMenu, ZAbstractRODataset, ZAbstractDataset,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP,
  DBGridEh, RzShellDialogs, ZDataset, ComCtrls, RzButton, GridsEh,
  StdCtrls, ExtCtrls;

type
  Tsertifikat = class(TForm)
    g_asos: TDBGridEh;
    Tovarlar: TDBGridEh;
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    sert: TZQuery;
    Dsert: TDataSource;
    serttovar: TZQuery;
    Dserttovar: TDataSource;
    sertid: TIntegerField;
    sertnomer: TStringField;
    sertsana: TDateField;
    sertuser_id: TIntegerField;
    sertzavod_id: TIntegerField;
    sertfilenom: TStringField;
    sertdel_flag: TSmallintField;
    sertzavod: TStringField;
    serttovarid: TIntegerField;
    serttovartovar_id: TIntegerField;
    serttovarsert_id: TIntegerField;
    serttovarseriya: TStringField;
    serttovaruser_id: TIntegerField;
    serttovarchangedate: TDateTimeField;
    serttovardel_flag: TSmallintField;
    serttovars_tovar: TStringField;
    s_tovar: TZQuery;
    Ds_tovar: TDataSource;
    DBGridEh1: TDBGridEh;
    s_tovarnom: TStringField;
    s_tovarid: TIntegerField;
    sertsrok: TDateField;
    sertyil: TSmallintField;
    sertoy: TSmallintField;
    sertchangedate: TDateTimeField;
    serttovarsrok: TDateField;
    pm1: TsuiPopupMenu;
    skaner: TMenuItem;
    fayl: TMenuItem;
    see: TMenuItem;
    ochir: TMenuItem;
    Image1: TImage;
    clftp: TIdFTP;
    aOpenDialog: TRzOpenDialog;
    clPrBar: TProgressBar;
    l_send2: TLabel;
    l_send1: TLabel;
    sertclient_id: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nom_shKeyPress(Sender: TObject; var Key: Char);
    procedure xnewClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure TovarlarDblClick(Sender: TObject);
    procedure g_asosDblClick(Sender: TObject);
    procedure skanerClick(Sender: TObject);
    procedure faylClick(Sender: TObject);
    procedure seeClick(Sender: TObject);
    procedure ochirClick(Sender: TObject);
    procedure clftpWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure clftpWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure clftpWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure sertNewRecord(DataSet: TDataSet);
    procedure serttovarNewRecord(DataSet: TDataSet);
  private
  clSTime: TDateTime; clBytesToTransfer: LongWord;w,h:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  clAverageSpeed: Double=0;clAbortTransfer: Boolean;
  sertifikat: Tsertifikat;

implementation

{$R *.dfm}
uses fs_client,fulanish, fdms, fsert_edit, fsertovar_edit;
var MyBitMap: TBitMap;
function FileSizeByName(const AFilename: string): Int64;
begin
  with TFileStream.Create(AFilename, fmOpenRead or fmShareDenyNone) do
  try
    Result := Size;
  finally Free; end;
end;

procedure Tsertifikat.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tsertifikat.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tsertifikat.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  MyBitMap:=TBitMap.Create;w:=850;h:=1170;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then
  begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;
procedure Tsertifikat.nom_shKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tsertifikat.xnewClick(Sender: TObject);
begin
  sert.Append;
  sert_edit.ShowModal;
end;

procedure Tsertifikat.xeditClick(Sender: TObject);
begin
  sert.edit;
  sert_edit.ShowModal;
end;

procedure Tsertifikat.xdelClick(Sender: TObject);
begin
  if MessageDlg('Ushnu sertifikatni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update serttovar set del_flag=0 WHERE sert_id='+sertid.AsString);
    dms.link.ExecSQL;
    sert.Edit;
    dms.setup.Refresh;
    sertuser_id.AsInteger:=StrToInt(admin_id);
    sertchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    sertdel_flag.Value:=0;
    sert.Post;
    sert.Refresh;
  end;
end;

procedure Tsertifikat.RzBitBtn2Click(Sender: TObject);
begin
  if s_tovar.RecordCount=0 then begin ShowMessage('Tovar tanlanmagan');exit;end;
  serttovar.edit;
  serttovar_edit.ShowModal;

end;

procedure Tsertifikat.RzBitBtn3Click(Sender: TObject);
begin
  if s_tovar.RecordCount=0 then begin ShowMessage('Tovar tanlanmagan');exit;end;
  if MessageDlg('Ushnu tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    serttovar.Edit;
    dms.setup.Refresh;
    serttovaruser_id.AsInteger:=StrToInt(admin_id);
    serttovarchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    serttovardel_flag.Value:=0;
    serttovar.Post;
    serttovar.Refresh;
  end;
end;

procedure Tsertifikat.DBGridEh1DblClick(Sender: TObject);
begin
  if s_tovar.RecordCount=0 then begin ShowMessage('Tovar tanlanmagan');exit;end;
  serttovar.Append;
  serttovartovar_id.AsInteger:=s_tovarid.AsInteger;
  serttovarsrok.AsDateTime:=sertsrok.AsDateTime;
  serttovar_edit.ShowModal;
end;

procedure Tsertifikat.TovarlarDblClick(Sender: TObject);
begin
  if s_tovar.RecordCount=0 then begin ShowMessage('Tovar tanlanmagan');exit;end;
  serttovar.edit;
  serttovar_edit.ShowModal;

end;

procedure Tsertifikat.g_asosDblClick(Sender: TObject);
begin
  sert.edit;
  sert_edit.ShowModal;

end;

procedure Tsertifikat.skanerClick(Sender: TObject);
var b,bw:TBitmap;dat: hBitMap;PInfo: PBitMapInfoHeader;Height,Width,n:integer;jpg:TJPEGImage;
s,ss:string;
{Функция возведения 2 в степень}
function stp2(s:byte):longint;
var m: longint;i: byte;
begin
  m:=2;for i:=2 to s do m:=m*2;stp2:=m;
end;
begin
 Image1.Width:=850;Image1.Height:=1170;
 TWAIN_SetHideUI(1);dat:=TWAIN_AcquireNative(Handle,0);
 if dat <> 0 then begin
  PInfo:=GlobalLock(dat);
  Height:=PInfo.biHeight;Width:=PInfo.biWidth;
  GlobalUnlock(dat);
  try
   MyBitMap.Palette :=TWAIN_CreateDibPalette(dat);
   MyBitMap.Width := Width;MyBitMap.Height := Height;
   TWAIN_DrawDibToDC(MyBitMap.Canvas.Handle,0,0,Width,Height,dat,0,0);
  except
   on EOutOFResources do MessageDlg('TBitMap: Нет ресурсов для загрузки изображения!',mtError,[mbOk],0);
 end;
  b:= tBitmap.Create; b.pixelformat:= pf24bit; b.width:=MyBitMap.Width; b.height:=MyBitMap.Height;
  bw:=tBitmap.Create; bw.pixelformat:=pf24bit; bw.width:=w; bw.height:=h;
  b.canvas.Draw(0,0,MyBitMap);
  Strecth(b, bw, Lanczos3Filter, 3);
  Sharpness(bw,1,150);
  canvas.Draw(w,h,bw);
  Image1.Picture.Graphic:=bw;
  TWAIN_FreeNative(dat);
  Jpg:=TJPegImage.Create;Jpg.CompressionQuality:=50;
  Jpg.Assign(Image1.Picture.Graphic);Jpg.JPEGNeeded;n:=sertid.Value;
  ss:=ExtractFilePath(Application.ExeName)+'file\file\guvohnoma\z'+IntToStr(n)+'.jpg';
  Jpg.SaveToFile(ss);
  Jpg.Free;
  end;
    try
      s:='z'+IntToStr(sertid.Value)+'.jpg';
      ss:=ExtractFilePath(Application.ExeName)+'file\file\guvohnoma\'+s;
      s:='file\guvohnoma\'+s;
      if ulanish.metod.ItemIndex>0 then begin
        clftp.Host:='195.158.27.20';clftp.Disconnect;clftp.Connect;
        clftp.TransferType:=ftBinary;clftp.Put(ss,s);
      end;
      If sert.State = dsbrowse then sert.Edit;
      s:='z'+IntToStr(sertid.Value)+'.jpg';
      sertfilenom.Value:=s;sert.post;
      RenameFile(aOpenDialog.FileName,ss);
    except
      clftp.Disconnect;
    end;


end;

procedure Tsertifikat.faylClick(Sender: TObject);
var s,ss:string;
begin
  if sertfilenom.Value<>'' then begin ShowMessage('Fayl yuklangan, qayta yuklash uchun oldin o`chiring !!!');exit;end;
  if aOpenDialog.Execute then begin
    s:=copy(ExtractFileName(aOpenDialog.FileName),length(ExtractFileName(aOpenDialog.FileName))-2,3);
    if not ( (UpperCase(s)<>'JPG') or (UpperCase(s)<>'PDF')) then begin ShowMessage('Faqat PDF va JPG ko`rinishdagi fayllarni tanlash mumkin.');exit;end;
    if FileSizeByName(ExtractFileName(aOpenDialog.FileName))>9999999 then begin ShowMessage('Fayl o`lchami katta.');exit;end;
    try
      s:='z'+IntToStr(sertid.Value)+copy(ExtractFileName(aOpenDialog.FileName),length(ExtractFileName(aOpenDialog.FileName))-3,4);
      ss:=ExtractFilePath(Application.ExeName)+'file\file\guvohnoma\'+s;
      s:='file\guvohnoma\'+s;
      if ulanish.metod.ItemIndex>0 then begin
        clftp.Host:='195.158.27.20';clftp.Disconnect;clftp.Connect;
        clftp.TransferType:=ftBinary;clftp.Put(aOpenDialog.FileName,s);
      end;
      If sert.State = dsbrowse then sert.Edit;
      s:='z'+IntToStr(sertid.Value)+copy(ExtractFileName(aOpenDialog.FileName),length(ExtractFileName(aOpenDialog.FileName))-3,4);
      sertfilenom.Value:=s;sert.post;
      RenameFile(aOpenDialog.FileName,ss);
    except
      clftp.Disconnect;
    end;
  end;
end;

procedure Tsertifikat.seeClick(Sender: TObject);
var localname,servername: string;
begin
  if sertfilenom.AsString='' then begin ShowMessage('Fayl yuklanmagan !!!');exit;end;
  localname := extractfilePath(application.ExeName)+'file\file\guvohnoma\'+extractfilename(sertfilenom.AsString);
  servername := 'file\guvohnoma\'+sertfilenom.AsString;
  if not FileExists(localname) then
  begin
    try
      if ulanish.metod.ItemIndex>0 then begin
        clftp.Host:='195.158.27.20';clftp.Disconnect;clftp.Connect;clftp.TransferType:=ftBinary;
        clBytesToTransfer:=clftp.Size(servername);clftp.Get(servername, localname, false);
      end;
    except DeleteFile(localname);clftp.Disconnect;exit;
    end;

    ShellExecute(handle,nil,pchar(localname),nil,nil,SW_RESTORE);
  end
  else ShellExecute(handle,nil,pchar(localname),nil,nil,SW_RESTORE);

end;

procedure Tsertifikat.ochirClick(Sender: TObject);
var ss:String;
begin
  if sertfilenom.Value='' then begin ShowMessage('Fayl yuklanmagan !!!');exit;end;
  if MessageDlg('Sertifikat fiylini o`chirasizmi ?',mtInformation, [mbYes, mbNo], 0) = mrYes then begin
    ss:='file\guvohnoma\'+sertfilenom.Value;
    try
      if ulanish.metod.ItemIndex>0 then begin
        clftp.Host:='195.158.27.20';clftp.Disconnect;clftp.Connect;
        clftp.TransferType:=ftBinary;clftp.Delete(ss);
      end;
      ss:='ok';
    except
      clftp.Disconnect;
    end;
    if ss<>'ok' then exit;
    ss:=ExtractFilePath(Application.ExeName)+'file\file\guvohnoma\'+sertfilenom.Value;
    if FileExists(ss) then DeleteFile(ss);
    sert.Edit;sertfilenom.AsVariant:=Null;sert.post;
 end;

end;

procedure Tsertifikat.clftpWork(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
var S: string;TotalTime: TDateTime; H, M, Sec, MS: Word; DLTime: Double;
begin
  TotalTime:=Now-clSTime;DecodeTime(TotalTime, H, M, Sec, MS);
  Sec:=Sec+M*60+H*3600;DLTime:=Sec+MS/1000;
  if DLTime>0 then clAverageSpeed:={(AverageSpeed + }(AWorkCount/1024)/DLTime{)/2};
  if clAverageSpeed>0 then
  begin
    Sec:=Trunc(((clPrBar.Max-AWorkCount)/1024/clAverageSpeed));
    S:=Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);
    l_send2.Caption:='Qolgan vaqt:'+S;
  end
  else l_send2.Caption:='';
  s:=FormatFloat('0.00 KB/s', clAverageSpeed);
  case AWorkMode of
    wmRead: l_send1.Caption:='Tezlik:'+S;
    wmWrite: l_send1.Caption:='Tezlik:'+S;
  end;
  if clAbortTransfer then clftp.Abort;
  clPrBar.Position:=AWorkCount;
  clAbortTransfer:=false;

end;

procedure Tsertifikat.clftpWorkBegin(Sender: TObject; AWorkMode: TWorkMode;const AWorkCountMax: Integer);
begin
  ulanish.protinout.Enabled:=False;
  clSTime:=Now;clAverageSpeed:=0;
  if AWorkCountMax>0 then clPrBar.Max:=AWorkCountMax else clPrBar.Max:=clBytesToTransfer;
  clAbortTransfer:=false;
  l_send1.Caption:='Jarayon boshlandi.';l_send2.Caption:='';
end;

procedure Tsertifikat.clftpWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  ulanish.protinout.Enabled:=true;clPrBar.Position:=0;
  clPrBar.Position:=0;clBytesToTransfer:=0;clAverageSpeed:=0;
  L_send1.Caption:='Jarayon yakunlandi';L_send2.Caption:='';

end;

procedure Tsertifikat.sertNewRecord(DataSet: TDataSet);
begin
  sertuser_id.AsInteger:=StrToInt(admin_id);
  sertclient_id.AsInteger:=StrToInt(admin_clid);
  sertsana.AsDateTime:=now;
end;

procedure Tsertifikat.serttovarNewRecord(DataSet: TDataSet);
begin
  sertifikat.serttovaruser_id.AsInteger:=StrToInt(admin_id);
end;

end.







