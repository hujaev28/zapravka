unit fkirim_asos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,IdGlobal,
  IniFiles,db, ZAbstractDataset, ZDataset, DBGridEh, DBLookupEh, DBCtrlsEh, RzButton,
  GridsEh, RzRadChk, Grids, DBGrids, ZAbstractRODataset;

type
  Tkirim_asos = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gform: TGroupBox;
    Label10: TLabel;
    sana: TDBDateTimeEditEh;
    Label25: TLabel;
    nomer: TDBEdit;
    Ldiler: TLabel;
    diler: TDBLookupComboboxEh;
    Label2: TLabel;
    shartnoma: TDBLookupComboboxEh;
    Lombor: TLabel;
    ombor: TDBLookupComboboxEh;
    toza: TRzBitBtn;
    hisobla: TRzBitBtn;
    DBGridEh1: TDBGridEh;
    Label19: TLabel;
    tulov: TDBNumberEditEh;
    Label20: TLabel;
    saldo: TDBNumberEditEh;
    Label1: TLabel;
    summa: TDBNumberEditEh;
    tulandi: TDBNumberEditEh;
    Memoka: TMemo;
    dollar: TRzCheckBox;
    kurs: TDBNumberEditEh;
    Button1: TButton;
    Bdiler: TButton;
    main_link: TZQuery;
    Lharidor: TLabel;
    haridor: TDBLookupComboboxEh;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomerKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure hisoblaClick(Sender: TObject);
    procedure tozaClick(Sender: TObject);
    procedure dilerEnter(Sender: TObject);
    procedure tulandiEnter(Sender: TObject);
    procedure dollarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dollarKeyPress(Sender: TObject; var Key: Char);
    procedure sanaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BdilerClick(Sender: TObject);
    procedure nomerEnter(Sender: TObject);
    procedure haridorEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  kirim_asos: Tkirim_asos;

implementation

{$R *.dfm}
uses fulanish, fdms, fs_diler, fkirim, fshartnoma;
function StrReplace(const Str, Str1, Str2: string): string;
var P, L: Integer;
begin
  Result := str;L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then begin
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

procedure Tkirim_asos.saveClick(Sender: TObject);
var rec:integer;
begin
  if dms.k_asossana.AsVariant=null then begin
    ShowMessage('Xujjat sanasini kiriting');ActiveControl:=sana;Exit;
  end;
  if dms.k_asosnomer.AsString='' then begin
    ShowMessage('Xujjat nomerini kiriting');ActiveControl:=nomer;Exit;
  end;
  if (dms.k_asos.FieldByName('diler_id').AsInteger=0) and (kirimgl='kirim') then begin
    ShowMessage('Mol etkazuvchini tanlang');ActiveControl:=diler;Exit;
  end;

  dms.k_asosuser_id.AsInteger:=StrToInt(admin_id);
  dms.k_asosclient_id.AsInteger:=StrToInt(admin_clid);
  if dms.k_asostur_oper.Value=3 then dms.k_asostur_oper.Value:=1;
  dms.setup.Refresh;
  dms.k_asoschangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  dms.k_asos.Post;

  kirim_asos.main_link.Close;kirim_asos.main_link.SQL.Clear;
  //main_link.SQL.Add('select * from asos_slave where del_flag=1 and asos_id='+dms.k_asosid.AsString+' group by asos_id');
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

  DMS.s_kurs.Last;dms.s_kurs.First;
  while not dms.s_kurs.Eof do begin
    if (dms.k_asossana.AsDateTime>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (dms.k_asossana.AsDateTime <= dms.s_kurs.FieldByName('data2').AsDateTime) then
    begin
      if dms.s_clientdollar.AsInteger>0 then begin
        dms.k_asos.Edit;
        dms.k_asoskurs.value:=dms.s_kurs.Fieldbyname('dollar').AsVariant;
        dms.k_asos.post;
      end;
    end;
    dms.s_kurs.Next;
  end; // while
  if (dms.s_clientdollar.AsInteger=1) and (dms.k_asoskurs.AsInteger=0) then begin
    ShowMessage('Kurs kiritilmagan');
  end;
  dms.k_asos.Refresh;
  rec:=dms.k_asosid.AsInteger;
  DMS.k_asos.Refresh;KIRIM.asos.Refresh;
  kirim.g_asos.Refresh;
  DMS.k_asos.Locate('id',rec,[loCaseInsensitive]);
  kirim.tovarlar.SumList.RecalcAll;
  hisoblaClick(Sender);

  dms.k_slave1.First;
  while not dms.k_slave1.Eof do begin
    dms.k_slave1.Next;
  end;



  kirim_asos.Close;
end;

procedure Tkirim_asos.cancelClick(Sender: TObject);
begin
  dms.k_asos.Cancel;kirim_asos.Close;
end;

procedure Tkirim_asos.nomerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tkirim_asos.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tkirim_asos.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tkirim_asos.FormCreate(Sender: TObject);
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
procedure Tkirim_asos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.k_asos.Cancel;
end;

procedure Tkirim_asos.FormActivate(Sender: TObject);
begin
  if dms.s_clientdollar.AsInteger<>1 then
  begin
    dollar.Visible:=false;
    kurs.Visible:=false;
  end;
  DMS.s_diler.Refresh;
  if dms.k_asosdollar.value=1 then dollar.Checked:=true else dollar.Checked:=False;
  nomer.SetFocus;
  if dms.s_client.FieldByName('client_tur').AsInteger=2 then
  begin
     lombor.Visible:=true;
  end;
end;

procedure Tkirim_asos.hisoblaClick(Sender: TObject);
begin
  //sena_sfEnter(Sender);
end;

procedure Tkirim_asos.tozaClick(Sender: TObject);
var qoldiq,qpl,echish:Currency;
begin
  //if saldo.Value<0 then begin ShowMessage('Pul yetmayapdi');exit;end;
  dms.oraliq.First;
  while not dms.oraliq.Eof do begin
    if dms.lbd_pl.Locate('id',dms.oraliq.fieldbyname('pl_id').Value,[loPartialKey]) then begin
	    dms.lbd_pl.Edit;
      dms.lbd_pl.fieldbyname('ost_pl').AsFloat:=dms.lbd_pl.fieldbyname('ost_pl').AsFloat+dms.oraliq.fieldbyname('ost').AsFloat;
      dms.lbd_pl.fieldbyname('pot1').AsInteger:=0;
      dms.lbd_pl.Post;
    end;
    dms.oraliq.delete;
  end;
  echish:=0;
  dms.lbd_pl.First;
  while (not dms.lbd_pl.Eof) and (dms.k_asossumma.AsFloat>echish) do begin
    if dms.lbd_pl.FieldByName('ost_pl').Value>0 then begin
      if dms.asos.FieldByName('summa').AsFloat-echish>=dms.lbd_pl.FieldByName('ost_pl').AsFloat then
        begin
          qoldiq:=dms.lbd_pl.FieldByName('ost_pl').AsFloat;
          qpl:=0;
        end
      else begin
        qoldiq:=dms.asos.FieldByName('summa').AsFloat-echish;
        qpl:=dms.lbd_pl.FieldByName('ost_pl').AsFloat-qoldiq;
      end;
      dms.oraliq.Insert;dms.oraliq.FieldByName('asos_id').AsInteger:=dms.asosid.AsInteger;
      dms.oraliq.FieldByName('pl_id').AsInteger:=dms.lbd_pl.FieldByName('id').AsInteger;
      dms.oraliq.FieldByName('ost').AsFloat:=qoldiq;dms.oraliq.Post;
      echish:=echish+qoldiq;
      dms.lbd_pl.Edit;dms.lbd_pl.FieldByName('ost_pl').AsFloat:=qpl;
      dms.lbd_pl.FieldByName('pot1').AsInteger:=1;dms.lbd_pl.Post;
     end; // ost_l>0
    dms.lbd_pl.Next;
  end;
  //sena_sfEnter(Sender);

end;

procedure Tkirim_asos.dilerEnter(Sender: TObject);
var s:string;
begin
  if (diler.Value=0) or (diler.Value=null) then exit;
  dms.lbd_pl.Close;
  dms.lbd_pl.Close;dms.lbd_pl.SQL.Clear;
  s:='';dms.oraliq.First;
  while not dms.oraliq.Eof do begin
    s:=s+iif(s='','',',')+dms.oraliq.fieldbyname('pl_id').AsString;
    dms.oraliq.next;
  end;
  if s<>'' then s:='(ost_pl<>0 or id in ('+s+')) and ' else s:='ost_pl<>0 and ';
  //dms.lbd_pl.SQL.Add('select * from pl WHERE '+s+' del_flag=1 and client_id='+dms.s_diler.fieldbyname('id').AsString+' order by d_pl');
  dms.lbd_pl.SQL.Add('select * from pl WHERE '+s+' del_flag=1 order by d_pl');
  dms.lbd_pl.open;
  dms.lbd_pl.First;
  while not dms.lbd_pl.Eof do begin
   if dms.oraliq.Locate('pl_id',dms.lbd_pl.fieldbyname('id').Value,[loPartialKey]) then
     begin dms.lbd_pl.Edit;dms.lbd_pl.fieldbyname('id').AsFloat:=1;dms.lbd_pl.Post;end
   else
    begin dms.lbd_pl.Edit;dms.lbd_pl.fieldbyname('pot1').AsFloat:=0;dms.lbd_pl.Post;end;
    dms.lbd_pl.next;
  end;
  tulandiEnter(sender);

end;

procedure Tkirim_asos.tulandiEnter(Sender: TObject);
var echish:Currency;
begin
  if dms.asos.Active=false then exit;
  if dms.lbd_pl.Active=false then exit;
  dms.lbd_pl.First;echish:=0;
  while not dms.lbd_pl.Eof do begin
    echish:=echish+dms.lbd_pl.fieldbyname('ost_pl').AsFloat;
    dms.lbd_pl.Next;
  end;
  dms.oraliq.First;while not dms.oraliq.Eof do begin
    echish:=echish+dms.oraliq.fieldbyname('ost').AsFloat;
    dms.oraliq.Next;
  end;
  tulov.Value:=echish;
  saldo.Value:=tulov.value-tulandi.Value;

end;

procedure Tkirim_asos.dollarMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if dollar.Checked=false then dms.k_asosdollar.value:=1 else dms.k_asosdollar.value:=0;
    DMS.s_kurs.Last;dms.s_kurs.First;
    while not dms.s_kurs.Eof do begin
      if (dms.k_asossana.AsDateTime>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (dms.k_asossana.AsDateTime <= dms.s_kurs.FieldByName('data2').AsDateTime) then
      begin
        dms.k_asoskurs.value:=dms.s_kurs.Fieldbyname('dollar').AsVariant;exit;
      end;
      dms.s_kurs.Next;
    end; // while
end;

procedure Tkirim_asos.dollarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #32 then if dollar.Checked=false then dms.k_asosdollar.value:=1 else dms.k_asosdollar.value:=0;
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tkirim_asos.sanaChange(Sender: TObject);
begin
  if dms.k_asossana.AsVariant=null then exit;
  if dms.k_asos.State=dsbrowse then exit;
  if dollar.Checked then begin
    dms.k_asosdollar.value:=1;DMS.s_kurs.Last;dms.s_kurs.First;
    while not dms.s_kurs.Eof do begin
      if (sana.Value>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (sana.Value <= dms.s_kurs.FieldByName('data2').AsDateTime) then
      begin
        dms.k_asoskurs.value:=dms.s_kurs.Fieldbyname('dollar').AsVariant;exit;
      end;
      dms.s_kurs.Next;
    end; // while
  end
  else
  begin
    dms.k_asosdollar.value:=0;dms.k_asoskurs.value:=0;
  end;

end;

procedure Tkirim_asos.Button1Click(Sender: TObject);
begin
  h_id := '-1';
  shartnomalar.showmodal;
end;

procedure Tkirim_asos.BdilerClick(Sender: TObject);
begin
  h_id := '-1';
  s_diler.showmodal;

end;

procedure Tkirim_asos.nomerEnter(Sender: TObject);
begin
  DMS.s_kurs.Last;dms.s_kurs.First;
    while not dms.s_kurs.Eof do begin
      if (dms.k_asossana.AsDateTime>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (dms.k_asossana.AsDateTime <= dms.s_kurs.FieldByName('data2').AsDateTime) then
        dms.k_asoskurs.value:=dms.s_kurs.Fieldbyname('dollar').AsVariant;exit;
      dms.s_kurs.Next;
    end; // while
end;

procedure Tkirim_asos.haridorEnter(Sender: TObject);
var s:string;
begin
  if (haridor.Value=0) or (haridor.Value=null) then exit;
  dms.lbd_pl.Close;
  dms.lbd_pl.Close;dms.lbd_pl.SQL.Clear;
  s:='';dms.oraliq.First;
  while not dms.oraliq.Eof do begin
    s:=s+iif(s='','',',')+dms.oraliq.fieldbyname('pl_id').AsString;
    dms.oraliq.next;
  end;
  if s<>'' then s:='(ost_pl<>0 or id in ('+s+')) and ' else s:='ost_pl<>0 and ';
  //dms.lbd_pl.SQL.Add('select * from pl WHERE '+s+' del_flag=1 and client_id='+dms.s_diler.fieldbyname('id').AsString+' order by d_pl');
  dms.lbd_pl.SQL.Add('select * from pl WHERE '+s+' del_flag=1 order by d_pl');
  dms.lbd_pl.open;
  dms.lbd_pl.First;
  while not dms.lbd_pl.Eof do begin
   if dms.oraliq.Locate('pl_id',dms.lbd_pl.fieldbyname('id').Value,[loPartialKey]) then
     begin dms.lbd_pl.Edit;dms.lbd_pl.fieldbyname('id').AsFloat:=1;dms.lbd_pl.Post;end
   else
    begin dms.lbd_pl.Edit;dms.lbd_pl.fieldbyname('pot1').AsFloat:=0;dms.lbd_pl.Post;end;
    dms.lbd_pl.next;
  end;
  tulandiEnter(sender);
end;

end.







