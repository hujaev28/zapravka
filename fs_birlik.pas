unit fs_birlik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, RzButton, DBGridEh, GridsEh, StdCtrls;
  const
  {символы десятичной системы}
  LetInteger: array[0..9]of Char=('0','1','2','3','4','5','6','7','8','9');
  {буквы EN раскладки}
  EngLet: string ='`qwertyuiop[]asdfghjkl;''zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>';
  {буквы RU раскладки}
  RusLet: string ='ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ';

type
  Ts_birlik = class(TForm)
    gclient: TDBGridEh;
    xnew: TRzBitBtn;
    xdel: TRzBitBtn;
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    procedure xnewClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure gclientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var s_birlik: Ts_birlik;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );


implementation

uses fdms, DB;

{$R *.dfm}
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

procedure Ts_birlik.xnewClick(Sender: TObject);
begin
  if dms.s_zavod.State<>dsBrowse then exit;
  dms.s_zavod.Append;gclient.SetFocus;
end;

procedure Ts_birlik.xdelClick(Sender: TObject);
begin
  if dms.s_zavod.State<>dsBrowse then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * from s_tovar WHERE del_flag=1 and zavod_id = '+dms.s_zavod.fieldbyname('id').AsString);
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('Uchbu qator '+dms.link.fieldbyname('nom').AsString+','+dms.link.fieldbyname('id').AsString+' ga bo`glangan.');
    exit;
  end;
  if MessageDlg('Siz ushbu ma`lumotni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMS.s_zavod.Delete;
  end;
end;

procedure Ts_birlik.gclientKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key=VK_INSERT then xnewClick(Sender);
end;

procedure Ts_birlik.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_zavod.State<>dsBrowse then
  begin
    if dms.s_zavod.FieldByName('nom').AsString='' then dms.s_zavod.cancel else dms.s_zavod.Post;
  end;
end;

procedure Ts_birlik.RzBitBtn2Click(Sender: TObject);
begin
  if dms.s_zavod.State<>dsBrowse then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * from s_tovar WHERE del_flag=1 and zavod_id = '+dms.s_zavod.fieldbyname('id').AsString);
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('Uchbu qator '+dms.link.fieldbyname('nom').AsString+','+dms.link.fieldbyname('id').AsString+' ga bo`glangan.');
    exit;
  end;
  if MessageDlg('Siz ushbu ma`lumotni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMS.s_zavod.Delete;
  end;

end;

end.
