unit fkirim_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  StdCtrls, ComCtrls, RzCmboBx, DBLookupEh, DBCtrlsEh, RzDBCmbo, Mask,
  DBCtrls, RzRadChk, RzButton,inifiles,ShellAPI,IdFTPCommon, RzEdit,
  RzDBEdit, ExtCtrls, GridsEh, Grids, DBGrids;

type
  Tkirim_edit = class(TForm)
    qrkod: TRzCheckBox;
    Gichki: TGroupBox;
    Label5: TLabel;
    Lsena_in_d: TLabel;
    Label20: TLabel;
    kol_in: TDBNumberEditEh;
    sena_in: TDBNumberEditEh;
    sotish_in: TDBNumberEditEh;
    Gkirim: TGroupBox;
    Label9: TLabel;
    Label14: TLabel;
    Ldiler: TLabel;
    n_sana: TDBDateTimeEditEh;
    nomer: TDBEdit;
    diler: TDBLookupComboboxEh;
    serttovar: TZQuery;
    Dserttovar: TDataSource;
    clftp: TIdFTP;
    savdo: TEdit;
    Gseriya: TGroupBox;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    lsert: TLabel;
    l_send2: TLabel;
    Label7: TLabel;
    seriya: TDBEdit;
    yil: TRzComboBox;
    oy: TRzComboBox;
    sert: TDBLookupComboboxEh;
    clPrBar: TProgressBar;
    RzBitBtn2: TRzBitBtn;
    polka: TDBEdit;
    srok: TDBDateTimeEditEh;
    Lsotish_in_d: TLabel;
    sotish_in_d: TDBNumberEditEh;
    sena_in_d: TDBNumberEditEh;
    Label29: TLabel;
    Label19: TLabel;
    Grsotish: TGroupBox;
    Label18: TLabel;
    Lopt2: TLabel;
    Lschet: TLabel;
    opt1: TDBNumberEditEh;
    opt2: TDBNumberEditEh;
    schet: TDBNumberEditEh;
    kol_old: TEdit;
    kol_in_old: TEdit;
    Qoldiq: TButton;
    qoldi: TZQuery;
    Dqoldi: TDataSource;
    Lharidor: TLabel;
    haridor: TDBLookupComboboxEh;
    RzBitBtn1: TRzBitBtn;
    GroupBox3: TGroupBox;
    Label25: TLabel;
    nom: TDBEdit;
    Grkirim: TGroupBox;
    Label13: TLabel;
    kol: TDBNumberEditEh;
    Lsena_d: TLabel;
    sena_d: TDBNumberEditEh;
    Label12: TLabel;
    sena: TDBNumberEditEh;
    GrAmal: TGroupBox;
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    saveandreplace: TRzBitBtn;
    Lsotish_d: TLabel;
    sotish_d: TDBNumberEditEh;
    Lsotish: TLabel;
    sotish: TDBNumberEditEh;
    Lfoiz: TLabel;
    foiz: TRzDBComboBox;
    Lfoizf: TLabel;
    Memo1: TMemo;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure qrkodMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure qrkodKeyPress(Sender: TObject; var Key: Char);
    procedure oyChange(Sender: TObject);
    procedure sotish1Exit(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure sena_inExit(Sender: TObject);
    procedure senaExit(Sender: TObject);
    procedure kolExit(Sender: TObject);
    procedure QoldiqClick(Sender: TObject);
    procedure usotish_dExit(Sender: TObject);
    procedure foizChange(Sender: TObject);
    procedure LsotishClick(Sender: TObject);
    procedure Lsotish_dClick(Sender: TObject);
  private
  clBytesToTransfer: LongWord;
     { Private declarations }
  public
    { Public declarations }
  end;

var
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  kirim_edit: Tkirim_edit;rec:integer;

implementation

{$R *.dfm}
uses fulanish, fdms, Math, fkirim, fsetup, fhato;

procedure tovarbaza_kirim();
begin

    DMS.k_slave1sena.AsFloat:=dms.s_t_allsena.AsFloat;
    DMS.k_slave1sotish.AsFloat:=dms.s_t_allsotish.AsFloat;
    if DMS.k_slave1sena.AsFloat>0 then 
    DMS.k_slave1foiz.AsFloat := RoundTo((DMS.k_slave1sotish.AsFloat/DMS.k_slave1sena.AsFloat*100-100),-2);;

    DMS.k_slave1foiz_in.Value := dms.s_clientfoiz_in.Value;

    DMS.k_slave1foiz_schet.Value := dms.s_clientfoiz_schet.Value;
    DMS.k_slave1foiz_opt1.Value := dms.s_clientfoiz_opt1.Value;
    DMS.k_slave1foiz_opt2.Value := dms.s_clientfoiz_opt2.Value;

    if DMS.k_asosdollar.AsFloat>0 then begin
      DMS.k_slave1sena_d.AsFloat:=dms.s_t_allsena_d.AsFloat;
      DMS.k_slave1sotish_d.AsFloat:=dms.s_t_allsotish_d.AsFloat;
    end;
    DMS.k_slave1opt1.AsFloat:=dms.s_t_allulg1.AsFloat;
    DMS.k_slave1opt1_pl.AsFloat:=dms.s_t_allulg1_pl.AsFloat;
    DMS.k_slave1opt2.AsFloat:=dms.s_t_allulg2.AsFloat;
    DMS.k_slave1opt2_pl.AsFloat:=dms.s_t_allulg2_pl.AsFloat;
    DMS.k_slave1schet.AsFloat:=dms.s_t_allbank.AsFloat;
    DMS.k_slave1kol_all.AsInteger:=DMS.k_slave1kol.AsInteger*dms.s_t_allkol_in.AsInteger+DMS.k_slave1kol_in.AsInteger;
    if (dms.s_t_allkol_in.AsInteger>1) then begin
      if kirim_edit.sena.Value>0 then kirim_edit.sena_in.Value:=RoundTo(kirim_edit.sena.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if kirim_edit.sena_d.Value>0 then kirim_edit.sena_in_d.Value:=kirim_edit.sena_d.Value/dms.s_t_allkol_in.AsInteger;
      if kirim_edit.sotish.Value>0 then kirim_edit.sotish_in.Value:=RoundTo(kirim_edit.sotish.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      //if kirim_edit.sotish_d.Value>0 then kirim_edit.sotish_in_d.Value:=RoundTo(kirim_edit.sotish_d.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if kirim_edit.sotish_d.Value>0 then kirim_edit.sotish_in_d.Value:=kirim_edit.sotish_d.Value/dms.s_t_allkol_in.AsInteger;
      if kirim_edit.schet.Value>0 then DMS.k_slave1schet_in.Value:=RoundTo(kirim_edit.schet.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if kirim_edit.opt1.Value>0 then DMS.k_slave1opt1_in.Value:=RoundTo(kirim_edit.opt1.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      //if kirim_edit.opt1_pl.Value>0 then DMS.k_slave1opt1_pl_in.Value:=RoundTo(kirim_edit.opt1_pl.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if kirim_edit.opt2.Value>0 then DMS.k_slave1opt2_in.Value:=RoundTo(kirim_edit.opt2.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      //if kirim_edit.opt2_pl.Value>0 then DMS.k_slave1opt2_pl_in.Value:=RoundTo(kirim_edit.opt2_pl.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    end;

end;

function RoundLess(Value, Divider: Integer): Integer;
var s:string;
begin
  s:=inttostr(value);
  s:=copy(s,1,length(s)-2)+'00';
  Result:=strtoint(s);
end;
procedure ComboBox_AutoWidth(const theComboBox: TCombobox);
const
  HORIZONTAL_PADDING = 4;
var
  itemsFullWidth: integer;
  idx: integer;
  itemWidth: integer;
begin
  itemsFullWidth := 0;

  // ???????? ?????? ??????? ? ???????? ?????????
  for idx := 0 to -1 + theComboBox.Items.Count do
  begin
    itemWidth := theComboBox.Canvas.TextWidth(
		theComboBox.Items[idx]);
    Inc(itemWidth, 2 * HORIZONTAL_PADDING);
    if (itemWidth > itemsFullWidth) then 
		itemsFullWidth := itemWidth;
  end;

  // ?????????? ??????, ???? ??????????
  if (itemsFullWidth > theComboBox.Width) then
  begin
    // ????????? ??????, ???? ???? ?????? ?????????
    if theComboBox.DropDownCount < theComboBox.Items.Count then
      itemsFullWidth := itemsFullWidth + GetSystemMetrics(SM_CXVSCROLL);

    SendMessage(theComboBox.Handle, 
		CB_SETDROPPEDWIDTH, itemsFullWidth, 0);
  end;
end;
function StrReplace(const Str, Str1, Str2: string): string;
var P, L: Integer;
begin
  Result := str; L := Length(Str1);
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
 nom_lat:=asos;nom_kril:=asos; lat:=False;
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

procedure Tkirim_edit.saveClick(Sender: TObject);
var yangi:integer;kurs_:Currency;
begin
  if (dms.k_slave1kol.AsInteger=0) and (dms.k_slave1kol_in.AsInteger=0) then begin
    ShowMessage('Asosiy yoki ichki tovar sonini kiriting');ActiveControl:=kol;Exit;
  end;
  if (dms.s_t_allaniq.AsFloat<sotish.Value) and (dms.k_slave1turi.AsInteger=1) then begin
    ShowMessage('Sotish narxi baland');ActiveControl:=sotish;Exit;
  end;
  if (dms.s_t_allaniq.AsFloat<dms.s_t_allkol_in.AsInteger*sotish_in.Value) and (dms.k_slave1turi.AsInteger=1) then begin
    ShowMessage('Ichki sotish narxi baland');ActiveControl:=sotish_in;Exit;
  end;
  if (kol_in.Value>dms.s_t_allkol_in.AsInteger) and (dms.k_slave1turi.AsInteger=1) then begin
    ShowMessage('Ichki sotish sprovachnikdan balabd');ActiveControl:=kol_in;Exit;
  end;
  if DMS.s_clientdollar.AsInteger=2 then begin
    if (sotish_d.Value=sena_d.Value) then begin
      if MessageDlg('Sotish narhi kirim narhi bilan teng , to`grimi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    end;
    if (sotish_d.Value<sena_d.Value) then begin
      if MessageDlg('Sotish narhi kirim narhidan kichik, to`grimi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    end;
  end
  else
  begin
    if (sotish.Value=sena.Value) then begin
      if MessageDlg('Sotish narhi kirim narhi bilan teng , to`grimi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    end;
    if (sotish.Value<sena.Value) then begin
      if MessageDlg('Sotish narhi kirim narhidan kichik, to`grimi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    end;
  end;
  if (dms.s_clientdollar.AsFloat=1) then begin
  DMS.s_kurs.Last;dms.s_kurs.First;kurs_:=0;
  while not dms.s_kurs.Eof do begin
    if (date()>= dms.s_kurs.Fieldbyname('data1').AsDateTime) and (date() <= dms.s_kurs.FieldByName('data2').AsDateTime) then
      kurs_:=dms.s_kurs.Fieldbyname('dollar').AsVariant;
    dms.s_kurs.Next;
  end; // while
  if (kurs_=0) and (dms.s_clientdollar.AsInteger=1) then begin
   ShowMessage('Diqqat !!! Bugungi kurs kiritilmagan'); exit;
  end;
  end;
  if dms.k_slave1.State=dsInsert then yangi:=1 else yangi:=0;
  if dms.asos_qoldiq.State in [dsedit,dsinsert] then
  begin
    dms.setup.Refresh;
    dms.asos_qoldiquser_id.AsInteger:=StrToInt(admin_id);
    dms.asos_qoldiqchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    dms.asos_qoldiq.post;
  end;
  dms.setup.Refresh;

  dms.k_slave1user_id.AsInteger:=StrToInt(admin_id);
  dms.k_slave1changedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  if kirimgl='kirim3' then
    dms.k_slave1tovar_nom.AsString:=dms.s_t_allnom.AsString;

  dms.k_slave1summa.AsFloat:=dms.k_slave1kol.AsInteger*dms.k_slave1sena.AsFloat;
  dms.k_slave1summa_in.AsFloat:=dms.k_slave1kol_in.AsInteger*dms.k_slave1sena_in.AsFloat;
  dms.k_slave1summa_all.AsFloat:=dms.k_slave1summa.AsFloat+dms.k_slave1summa_in.AsFloat;
  DMS.k_slave1kol_all.AsInteger:=DMS.k_slave1kol.AsInteger*dms.s_t_allkol_in.AsInteger+DMS.k_slave1kol_in.AsInteger;

  if savdo.Text<>'' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select id from main where qrkod="'+savdo.Text+'"');
    dms.link.Open;
    savdo.Text:='';
    dms.k_slave1qrkod.AsInteger:=dms.link.fieldbyname('id').AsInteger;
  end;
  dms.s_t_all.Edit;
  if DMS.k_slave1sena.AsFloat>0 then dms.s_t_allsena.AsFloat:=DMS.k_slave1sena.AsFloat;
  if DMS.k_slave1sena_d.AsFloat>0 then dms.s_t_allsena_d.AsFloat:=DMS.k_slave1sena_d.AsFloat;
  dms.s_t_all.Post;
  if DMS.s_clientdollar.AsFloat>0 then begin
    if dms.k_slave1sena_d.AsFloat=0 then dms.k_slave1sena_d.AsFloat:=dms.k_slave1sena.AsFloat/kurs_;
    if (dms.k_slave1sena_in_d.AsFloat=0) and (dms.s_t_allkol_in.AsInteger>1) then begin
      dms.k_slave1sena_in_d.AsFloat:=dms.k_slave1sena.AsFloat/kurs_;
    end;
    if dms.k_slave1sotish_d.AsFloat=0 then dms.k_slave1sotish_d.AsFloat:=dms.k_slave1sotish.AsFloat/kurs_;
    if (dms.k_slave1sotish_in_d.AsFloat=0) and (dms.s_t_allkol_in.AsInteger>1) then begin
      dms.k_slave1sotish_in_d.AsFloat:=dms.k_slave1sotish_in.AsFloat/kurs_;
    end;
  end;

  dms.k_slave1.Post;
  rec:=DMS.k_slave1id.Value;
  dms.k_slave1.Refresh;
  dms.k_asos.Edit;dms.k_asossumma.AsFloat:=0;dms.k_asoskol.AsInteger:=0;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(kol*sena_d) as summa_d,sum(kol_in*sena_in_d) as summa_in_d,sum(summa_all) as summa_all,sum(kol+kol_in) as kol from asos_slave where del_flag=1 and asos_id='+dms.k_asosid.AsString+' group by asos_id');
  dms.main_link.Open;
  dms.k_asossumma.AsFloat:=dms.main_link.fieldbyname('summa_all').AsFloat;
  dms.k_asossumma_ch.AsFloat:=dms.main_link.fieldbyname('summa_all').AsFloat;
  dms.k_asossum_naqd.AsFloat:=dms.main_link.fieldbyname('summa_all').AsFloat;
  dms.k_asossum_naqd_ch.AsFloat:=dms.main_link.fieldbyname('summa_all').AsFloat;
  dms.k_asoskol.AsInteger:=dms.main_link.fieldbyname('kol').AsInteger;
  if dms.s_clientdollar.AsInteger=2 then
    dms.k_asossumma.AsFloat:=0
  else
    dms.k_asossumma.AsFloat:=dms.main_link.fieldbyname('summa_all').AsFloat;
  dms.k_asoskol.AsInteger:=dms.main_link.fieldbyname('kol').AsInteger;
  if dms.k_asosdollar.AsInteger=1 then
    dms.k_asossum_d.AsFloat:=dms.main_link.fieldbyname('summa_d').AsFloat+dms.main_link.fieldbyname('summa_in_d').AsFloat
  else
    dms.k_asossum_d.AsFloat:=0;
  dms.k_asos.Post;
  kirim.tovarlar.SumList.RecalcAll;
  if rec>0 then DMS.k_slave1.Locate('id',rec,[loCaseInsensitive]);
  dms.s_t_all.Refresh;dms.s_tovar.Refresh;
  DMS.link.close;DMS.link.SQL.Clear;
  DMS.link.sql.add('SELECT s.id,main.serial FROM slave_main s,main where main.id=s.main_id and s.slave_id=:id order by id');
  DMS.link.Open;
  hatolar.t_id.Text:=DMS.s_t_allid.AsString;
  hatolar.qoldiq_tekshirClick(Sender);
  kirim_edit.Close;
end;

procedure Tkirim_edit.cancelClick(Sender: TObject);
begin
  dms.k_slave1.Cancel; kirim_edit.Close;
end;

procedure Tkirim_edit.nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tkirim_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);
  IniFile.Free;
end;

procedure Tkirim_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  IniFile.Free;
end;

procedure Tkirim_edit.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;
procedure Tkirim_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //dms.k_slave1.Cancel;
end;

procedure Tkirim_edit.FormActivate(Sender: TObject);
begin
  if dms.s_clientulg.asinteger=0 then begin
    Grsotish.Visible:=false;
  end;

  if dms.s_clientfoizli.asinteger=0 then begin
    Lfoiz.Visible:=false;Lfoizf.Visible:=false;foiz.Visible:=false;
  end;
  if dms.s_t_allkol_in.AsInteger > 1 then Gichki.Visible:=True else Gichki.Visible:=false;
  if dms.s_clientsert.AsInteger > 0 then Gseriya.Visible:=True else Gseriya.Visible:=false;
  if qoldi.Active=false then qoldi.Open;
  kol_old.Text:='';kol_in_old.Text:='';
  if DMS.k_slave1.State=dsedit then begin
    kol_old.Text:=DMS.k_slave1kol.AsString;kol_in_old.Text:=DMS.k_slave1kol_in.AsString;
  end;

  //if dms.s_clientseriya.Value=0 then Gseriya.Visible:=false else Gseriya.Visible:=true;
  if savdo.Text='' then begin
    kol.Enabled:=true;kol.SetFocus;
  end
  else begin
    kol.Value:=1;kol.Enabled:=false;
  end;
  if serttovar.Active=false then serttovar.Open;
  if (seriya.Text='') and (serttovar.RecordCount>0) then begin
    seriya.Text:=serttovar.fieldbyname('seriya').AsString;
    //srok.Value:=serttovar.fieldbyname('srok').AsDateTime;
    sert.Value:=seriya.Text;
  end;
  if dms.k_asosdollar.AsInteger=1 then begin
    Lsena_d.Visible:=true;sena_d.Visible:=true;sena.TabStop:=false;
    Lsotish_d.Visible:=true;sotish_d.Visible:=true;
    Lsena_in_d.Visible:=true;sena_in_d.Visible:=true;
    Lsotish_in_d.Visible:=true;sotish_in_d.Visible:=true;
  end
  else
  begin
    Lsena_d.Visible:=false;sena_d.Visible:=false;sena.TabStop:=true;
    Lsotish_d.Visible:=false;sotish_d.Visible:=false;
    Lsena_in_d.Visible:=false;sena_in_d.Visible:=false;
    Lsotish_in_d.Visible:=false;sotish_in_d.Visible:=false;
  end;
  //if dms.s_clientsert.AsInteger=0 then begin
  //  Gseriya.Visible:=false;
  //end;
  if dms.s_clientdollar.AsInteger=2 then begin
    Label12.Visible:=false;sena.Visible:=false;
    Lsotish.Visible:=false;sotish.Visible:=false;
    Label29.Visible:=false;sena_in.Visible:=false;
    Label20.Visible:=false;sotish_in.Visible:=false;
  end;
  qoldi.Close;qoldi.SQL.Clear;
  qoldi.SQL.Add('SELECT * FROM asos_slave where tovar_nom is null and del_flag=1 and tovar_id=:id and (kol_ost+kol_in_ost>0) order by id desc');
  qoldi.open;
end;

procedure Tkirim_edit.qrkodMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if qrkod.Checked=false then dms.k_slave1qrkod.value:=1 else dms.k_slave1qrkod.value:=0;
end;

procedure Tkirim_edit.qrkodKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #32 then if qrkod.Checked=false then dms.k_slave1qrkod.value:=1 else dms.k_slave1qrkod.value:=0;
 if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tkirim_edit.oyChange(Sender: TObject);
var s:string;
begin
  if (yil.ItemIndex=-1) or (oy.ItemIndex=-1) then exit;
  if oy.ItemIndex=11 then
    s:='01.01.'+inttostr(2022+yil.ItemIndex)
  else
    s:='01.'+inttostr(2+oy.ItemIndex)+'.'+inttostr(2021+yil.ItemIndex);
  srok.Value:=s;srok.Value:=srok.Value-1;
end;

procedure Tkirim_edit.sotish1Exit(Sender: TObject);
begin
  if (sotish.Value>0) and (sotish_d.Value=0) then begin
    sotish_d.Value:=sotish.Value/DMS.k_asoskurs.AsFloat;
    DMS.k_slave1foiz.AsFloat:=(sena.Value/sotish.Value);
    exit;
  end;
  if dms.s_clientsotishtokirim.AsInteger=1 then begin
    if (sena.Value=0) or (sena.Value=null) then begin
      sena.Value:=0;senaExit(Sender);exit;
    end;

  end;
  if DMS.s_clientfoizli.asinteger=0 then begin
    foiz.Value:='';exit;
  end;
  if (sena.Value>0) and (sotish.Value>0) and (sotish.Value<>sena.Value) then //(foiz.Value='0') and
  begin
    dms.k_slave1foiz.AsFloat:=RoundTo((sotish.Value/sena.Value*100-100),-2);
    if dms.s_t_allkol_in.AsInteger>1 then sena_inExit(Sender);
  end
  else
    begin
      if dms.s_t_allkol_in.AsInteger>1 then sena_inExit(Sender);
    end;
end;

procedure Tkirim_edit.RzBitBtn1Click(Sender: TObject);
begin
  sena.Value:=0;foiz.Value:='';sotish.Value:=0;
  sena_in.Value:=0;sotish_in.Value:=0;
end;

procedure Tkirim_edit.RzBitBtn2Click(Sender: TObject);
var localname,servername: string;
begin
  if serttovar.FieldByName('filenom').AsString='' then begin ShowMessage('Fayl yuklanmagan !!!');exit;end;
  localname := extractfilePath(application.ExeName)+'file\file\guvohnoma\'+extractfilename(serttovar.FieldByName('filenom').AsString);
  servername := 'file\guvohnoma\'+serttovar.FieldByName('filenom').AsString;
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

procedure Tkirim_edit.sena_inExit(Sender: TObject);
begin
  if dms.s_clientfoizli.AsInteger=0 then begin exit;end;
  if sena_d.Value>0 then begin
    sena_in_d.Value:=sena_d.Value/dms.s_t_allkol_in.AsInteger;
    sena_in.Value:=RoundTo(sena.Value/dms.s_t_allkol_in.AsInteger,-3)
  end;
  if (dms.s_t_allkol_in.AsInteger>0) then begin
    //if sotish_d.Value>0 then sotish_in_d.Value:=RoundTo(sotish_d.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    if sotish_d.Value>0 then sotish_in_d.Value:=sotish_d.Value/dms.s_t_allkol_in.AsInteger;
    if sena.Value>0 then sena_in.Value:=RoundTo(sena.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    if sotish.Value>0 then sotish_in.Value:=RoundTo(sotish.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    if opt1.Value>0 then DMS.k_slave1opt1_in.Value:=RoundTo(opt1.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    if opt2.Value>0 then DMS.k_slave1opt2_in.Value:=RoundTo(opt2.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    if schet.Value>0 then DMS.k_slave1schet_in.Value:=RoundTo(schet.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
  end;
end;

procedure Tkirim_edit.senaExit(Sender: TObject);
var d:Currency;
begin
  if (dms.k_asosdollar.Value=1) and (sena_d.Value=null) then begin
    ShowMessage('Agar faktura dollarda bo`lsa, Dollar kiritilishi shart');exit;
  end;
  if (dms.k_asosdollar.Value=1) and (sena_d.Value<>null) then begin
    //sena.Value:=RoundTo(sena_d.Value*DMS.k_asoskurs.AsFloat,dms.s_clientyaxlitlash.AsInteger);sotish_d.Value:=null;sotish_in_d.Value:=null;
    sena.Value:=sena_d.Value*DMS.k_asoskurs.AsFloat;
    sotish_d.Value:=null;sotish_in_d.Value:=null;
    exit;
  end;
  if (dms.s_t_allsotish.AsInteger+dms.s_t_allsotish_d.AsInteger+dms.s_t_allulg1.AsInteger>0) and (DMS.k_slave1sena_d.AsVariant=null or DMS.k_slave1sena.AsVariant=null) and (DMS.k_slave1.State=dsInsert) then
  //if (DMS.k_slave1.State=dsInsert) then
  begin
    tovarbaza_kirim();
    save.SetFocus;
    exit;
  end;

  if DMS.s_clientfoizli.AsInteger=0 then begin exit;end;
  if (foiz.Value='') or (foiz.Value='-') then exit;
  if dms.k_asosdollar.Value=1 then begin
    if dms.s_clientdollar.AsInteger<>2 then
      sena.Value:=sena_d.Value*dms.k_asoskurs.AsFloat
    else
    if ((sena_d.Value=0) or (sena_d.Value=null)) and (sotish_d.value>0) then begin
      sena_d.Value:=RoundTo(sotish_d.Value/(StrToFloat(foiz.Value)/100+1),-3);
    end
    else
    begin
      sotish_d.Value:=RoundTo(sena_d.Value+foiz.Value*sena_d.Value/100,-2);
      if dms.s_clientdollar.AsInteger<>2 then
        sotish.Value:=RoundTo(sotish_d.Value*dms.k_asoskurs.AsFloat,2);
      if (schet.Value=0) or (schet.Value=null) then
        schet.Value:=RoundTo((sena_d.Value+sena_d.Value*DMS.s_clientfoiz_schet.AsInteger/100)*dms.k_asoskurs.AsFloat,dms.s_clientyaxlitlash.Value);

      if (opt1.Value=0) or (opt1.Value=null) then
      opt1.Value:=RoundTo((sena_d.Value+sena_d.Value*dms.s_clientfoiz_opt1.AsInteger/100)*dms.k_asoskurs.AsFloat,dms.s_clientyaxlitlash.Value);

      if (opt2.Value=0) or (opt2.Value=null) then
        opt2.Value:=RoundTo((sena_d.Value+sena_d.Value*dms.s_clientfoiz_opt2.AsInteger)*dms.k_asoskurs.AsFloat/100,dms.s_clientyaxlitlash.Value);
    end;
  end
  else
  begin
    if (sena.Value=0) or (sena.Value=null) then begin
      if (sotish.value>0) then
      sena.Value:=RoundTo(sotish.Value/(StrToFloat(foiz.Value)/100+1),DMS.s_clientyaxlitlash.Value);
    end
    else
    begin
      if (sotish.value=null) or (sotish.value=0) then begin
      sotish.Value:=RoundTo(sena.Value+foiz.Value*sena.Value/100,DMS.s_clientyaxlitlash.Value);
      if (schet.Value=0) or (schet.Value=null) then
        schet.Value:=RoundTo(sena.Value+sena.Value*DMS.s_clientfoiz_schet.AsInteger/100,dms.s_clientyaxlitlash.Value);

      if (opt1.Value=0) or (opt1.Value=null) then
        opt1.Value:=RoundTo(sena.Value+sena.Value*dms.s_clientfoiz_opt1.AsInteger/100,dms.s_clientyaxlitlash.Value);

      if (opt2.Value=0) or (opt2.Value=null) then
        opt2.Value:=RoundTo(sena.Value+sena.Value*dms.s_clientfoiz_opt2.AsInteger/100,dms.s_clientyaxlitlash.Value);

      if (dms.k_slave1turi.Value=1) and (dms.s_t_allaniq.AsFloat<sotish.Value) and (dms.s_t_allaniq.AsFloat>0) then begin
        sotish.Value:=dms.s_t_allaniq.AsFloat;
        d:=dms.s_t_allaniq.AsFloat/sena.Value*100;d:=d-100;
        dms.k_slave1foiz.AsFloat:=RoundTo(d,-2);
      end;
      end;
    end;
  end;
  if dms.k_slave1sotish.AsVariant=null then sotish.Value:=0;
  if dms.s_t_allkol_in.AsInteger>1 then sena_inExit(Sender);
end;

procedure Tkirim_edit.kolExit(Sender: TObject);
begin
  if ((DMS.k_slave1sena_d.AsVariant=null) or (DMS.k_slave1sena.AsVariant=null)) and (DMS.k_slave1.State=dsInsert) then
  begin
     tovarbaza_kirim();
  end;
end;

procedure Tkirim_edit.QoldiqClick(Sender: TObject);
var kol,kol_in,kol_jami,ost_jami,itog:integer;ss,sd:string;
begin
  qoldi.First;
  while not qoldi.Eof do begin
    ss:='';sd:='';
    if sotish.Value>0 then
    begin
      ss:='sotish='+FloatToStr(sotish.Value);
      if dms.s_t_allkol_in.AsInteger>1 then
        ss:=ss+' ; sotish_in='+FloatToStr(RoundTo(sotish.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value));
    end;
    if sotish_d.Value>0 then
    begin
      if ss='' then
        sd:='sotish_d='+FloatToStr(sotish_d.Value)
      else
        sd:=ss+';sotish_d='+FloatToStr(sotish_d.Value);
    end
    else
        sd:=ss;
    if ss+sd<>'' then begin
    sd:=StrReplace(sd,',','.');    sd:=StrReplace(sd,';',',');

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update asos_slave set '+sd+' where id='+qoldi.fieldbyname('id').AsString);
    dms.link.ExecSQL;
    end;
    qoldi.Next;
  end;
  qoldi.Refresh;
  saveClick(sender);

end;

procedure Tkirim_edit.usotish_dExit(Sender: TObject);
begin
  if dms.s_clientsotishtokirim.AsInteger=1 then begin
    if (sena_d.Value=0) or (sena_d.Value=null) then begin
      sena_d.Value:=0;senaExit(Sender);exit;
    end;
  end;
  if dms.k_asosdollar.Value=1 then
    sotish.Value:=roundto(sotish_d.Value*dms.k_asoskurs.AsFloat,DMS.s_clientyaxlitlash.Value);
  if DMS.s_clientfoizli.AsInteger=0 then begin
    foiz.Value:='';exit;
  end;

  if (sena_d.Value>0) and (sotish_d.Value>0) and (foiz.Value='0') and (sotish_d.Value<>sena_d.Value) then
  begin
    dms.k_slave1foiz.AsFloat:=RoundTo((sotish_d.Value/sena_d.Value*100-100),-2);
    if dms.s_t_allkol_in.AsInteger>1 then sena_inExit(Sender);

  end
  else
    begin
      if dms.s_t_allkol_in.AsInteger>1 then sena_inExit(Sender);
    end;

end;

procedure Tkirim_edit.foizChange(Sender: TObject);
var sotf:Currency;
begin
  if foiz.Value<>'' then
  begin
    if sena.Value >0 then begin
      sotf:=sena.Value+foiz.Value*sena.Value/100;
      sotf:=RoundTo(sotf,-2);
      sotish.Value:=sotf;
    end;
    if sena_d.Value > 0 then begin
      sotf:=sena_d.Value+foiz.Value*sena_d.Value/100;
      //sotf:=RoundTo(sotf,-2);
      sotish_d.Value:=sotf;
    end;
  end
  else
    sotish.Value:=dms.s_t_allsotish.AsFloat;
end;

procedure Tkirim_edit.LsotishClick(Sender: TObject);
begin
  if sotish.Enabled=false then sotish.Enabled:=true else sotish.Enabled:=true;
end;

procedure Tkirim_edit.Lsotish_dClick(Sender: TObject);
begin
  if sotish_d.Enabled=false then sotish_d.Enabled:=true else sotish_d.Enabled:=true;

end;

end.


