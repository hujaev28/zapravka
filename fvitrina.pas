unit fvitrina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles,db, RzRadChk, ExtCtrls, StdCtrls, Mask, DBCtrlsEh,
  RzButton, GridsEh, DBGridEh;
type
  Tvitrina = class(TForm)
    g_asos: TDBGridEh;
    Tovarlar: TDBGridEh;
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    xldan: TLabel;
    sana1: TDBDateTimeEditEh;
    xlgacha: TLabel;
    sana2: TDBDateTimeEditEh;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nom_shKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure xnewClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure sana2Change(Sender: TObject);
    procedure sana1Change(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
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
  vitrina: Tvitrina;

implementation

{$R *.dfm}
uses fs_client,fulanish, fdms, fvitrina_asos, fvetrina_edit;
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

procedure Tvitrina.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tvitrina.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tvitrina.FormCreate(Sender: TObject);
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
procedure Tvitrina.nom_shKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tvitrina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.k_asos.State<>dsBrowse then
  dms.k_asos.Cancel;
end;

procedure Tvitrina.xnewClick(Sender: TObject);
begin
  dms.k_asos.Append;
  dms.k_asossana.Value:=now;
  dms.k_asostur_oper.Value:=4;
  vitrina_asos.ShowModal;
end;

procedure Tvitrina.xeditClick(Sender: TObject);
begin
  dms.k_asos.edit;
  vitrina_asos.ShowModal;
end;

procedure Tvitrina.xdelClick(Sender: TObject);
begin
  dms.k_slave.First;
  while not dms.k_slave.Eof do begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select s.id from asos a,asos_slave s WHERE a.id=s.asos_id and s.del_flag=1 and a.tur_oper=2 and s.kol_ost='+dms.k_slaveid.AsString);
    dms.link.open;
    if dms.link.RecordCount>0 then begin
      ShowMessage('Tovar nomidan amal bajarilgan');
      exit;
    end;
    dms.k_slave.Next;
  end;
  if MessageDlg('Ushnu nakladnoyni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update asos_slave set del_flag=0 WHERE asos_id='+dms.k_asosid.AsString);
    dms.link.ExecSQL;
    DMS.k_asos.Edit;
    DMS.k_asosdel_flag.Value:=0;
    DMS.k_asos.Post;
    DMS.k_asos.Refresh;
    vitrina.tovarlar.SumList.RecalcAll;

  end;
end;

procedure Tvitrina.sana2Change(Sender: TObject);
begin
  if admin_type='' then exit;
  if (sana1.Value=null) or (sana2.Value=null) then exit;
  if (sana1.Value>sana2.Value) then sana1.Value:=sana2.Value;
  dms.setup.Refresh;
  dms.k_asos.Close;dms.k_asos.SQL.Clear;
  dms.k_asos.SQL.Add('select * from asos where del_flag=1 and tur_oper in (1,4,5) and client_id='+admin_id);
  dms.k_asos.SQL.Add(' and sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value));
  dms.k_asos.SQL.Add(' order by sana');
  //shtrix.Text:=dms.asos.SQL.Text;
  dms.k_asos.Open;
end;

procedure Tvitrina.sana1Change(Sender: TObject);
begin
  if admin_type='' then exit;
  if (sana1.Value=null) or (sana2.Value=null) then exit;
  if (sana2.Value<sana1.Value) then sana2.Value:=sana1.Value;
  dms.setup.Refresh;
  dms.k_asos.Close;dms.k_asos.SQL.Clear;
  dms.k_asos.SQL.Add('select * from asos where del_flag=1 and tur_oper in (1,4,5) and client_id='+admin_id);
  dms.k_asos.SQL.Add(' and sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value));
  dms.k_asos.SQL.Add(' order by sana');
  //shtrix.Text:=dms.asos.SQL.Text;
  dms.k_asos.Open;

end;

procedure Tvitrina.RzBitBtn1Click(Sender: TObject);
begin
  dms.k_slave.Append;
  vetrina_edit.ShowModal;

end;

procedure Tvitrina.RzBitBtn2Click(Sender: TObject);
begin
  dms.k_slave.edit;
  dms.s_t_all.Locate('id',dms.k_slavetovar_id.AsInteger,[loCaseInsensitive]);
  vetrina_edit.ShowModal;

end;

procedure Tvitrina.RzBitBtn3Click(Sender: TObject);
begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select s.id from asos a,asos_slave s WHERE a.id=s.asos_id and s.del_flag=1 and a.tur_oper=2 and s.kol_ost='+dms.k_slaveid.AsString);
    dms.link.open;
    if dms.link.RecordCount>0 then begin
      ShowMessage('Tovar nomidan amal bajarilgan');
      exit;
    end;
  if MessageDlg('Ushnu tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    DMS.k_slave.Edit;
    DMS.k_slavedel_flag.Value:=0;
    DMS.k_slave.Post;
    DMS.k_slave.Refresh;
    vitrina.tovarlar.SumList.RecalcAll;
  end;
end;

end.







