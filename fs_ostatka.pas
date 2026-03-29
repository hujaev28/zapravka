unit fs_ostatka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,db,RzRadChk, DBGridEh, StdCtrls, DBLookupEh, DBCtrlsEh,
  DBCtrls, Mask, RzCmboBx, RzDBCmbo, GridsEh, RzButton, RzEdit, RzDBEdit,
  ExtCtrls;

type
  Ts_ostatka = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gqoldir: TDBGridEh;
    Gichki: TGroupBox;
    Label5: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    kol_in: TDBNumberEditEh;
    sena_in: TDBNumberEditEh;
    sotish_in: TDBNumberEditEh;
    Label13: TLabel;
    kol: TDBNumberEditEh;
    Label12: TLabel;
    sena: TDBNumberEditEh;
    Label11: TLabel;
    sotish: TDBNumberEditEh;
    Label7: TLabel;
    diler: TDBLookupComboboxEh;
    Gkirim: TGroupBox;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    n_sana: TDBDateTimeEditEh;
    nomer: TDBEdit;
    n_diler: TDBLookupComboboxEh;
    yes: TRzBitBtn;
    no: TRzBitBtn;
    Label25: TLabel;
    nom: TDBEdit;
    foiz: TRzDBComboBox;
    savdo: TEdit;
    RzBitBtn1: TRzBitBtn;
    Gseriya: TGroupBox;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    srok: TDBDateTimeEditEh;
    seriya: TDBEdit;
    yil: TRzComboBox;
    oy: TRzComboBox;
    s: TDBLookupComboboxEh;
    polka: TDBEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label28: TLabel;
    Lopt2: TLabel;
    Lopt1_pl: TLabel;
    Lopt2_pl: TLabel;
    opt1: TRzDBNumericEdit;
    opt1_pl: TRzDBNumericEdit;
    opt2: TRzDBNumericEdit;
    opt2_pl: TRzDBNumericEdit;
    schet: TRzDBNumericEdit;
    Lsena_d: TLabel;
    sena_d: TDBNumberEditEh;
    Lsotish_d: TLabel;
    sotish_d: TDBNumberEditEh;
    Label1: TLabel;
    sena_in_d: TDBNumberEditEh;
    Lsena_in_d: TLabel;
    Lsotish_in_d: TLabel;
    sotish_in_d: TDBNumberEditEh;
    Ldollar: TLabel;
    dollar: TDBEdit;
    Label3: TLabel;
    skol_in: TDBEdit;
    kol_old: TEdit;
    kol_in_old: TEdit;
    Lschet: TLabel;
    Panel1: TPanel;
    Lschet_in: TLabel;
    Label44: TLabel;
    Lopt1_pl_in: TLabel;
    Lopt2_in: TLabel;
    Lopt2_pl_in: TLabel;
    schet_in: TRzDBNumericEdit;
    opt1_in: TRzDBNumericEdit;
    opt1_pl_in: TRzDBNumericEdit;
    opt2_in: TRzDBNumericEdit;
    opt2_pl_in: TRzDBNumericEdit;
    sotish_old: TDBNumberEditEh;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure senaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gqoldirDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure yesClick(Sender: TObject);
    procedure dilerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure noClick(Sender: TObject);
    procedure sena_inExit(Sender: TObject);
    procedure n_dilerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure oyChange(Sender: TObject);
    procedure sotishExit(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure kolExit(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private

     { Private declarations }
  public
    { Public declarations }
  end;

var
  hisob:Integer;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );
  s_ostatka: Ts_ostatka;

implementation

{$R *.dfm}
uses fs_client,fulanish, fdms, fs_asos, fs_diler, Math, fsetup, fhato;
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

procedure Ts_ostatka.saveClick(Sender: TObject);
var kol_jami,kol_in_jami,kol_,kol_in_,yangi:integer;qid,ss,sd:string;qsotish,qsotish_d:Currency;
begin
  if (dms.qoldiq.FieldByName('kol').AsInteger=0) and (dms.qoldiq.FieldByName('kol_in').AsInteger=0) then begin
    ShowMessage('Asosiy yoki ichki tovar sonini kiriting');ActiveControl:=kol;Exit;
  end;
  if dms.qoldiq.FieldByName('asos_id').AsInteger=0 then begin
    ShowMessage('Kirim xujjatini tanlang');ActiveControl:=diler;Exit;
  end;
  if (dms.s_tovaraniq.AsFloat<sotish.Value) and (dms.qoldiqturi.AsInteger=1) then begin
    ShowMessage('Sotish narxi baland');ActiveControl:=sotish;Exit;
  end;
  if (dms.s_tovaraniq.AsFloat<dms.s_tovarkol_in.AsInteger*sotish_in.Value) and (dms.qoldiqturi.AsInteger=1) then begin
    ShowMessage('Ichki sotish narxi baland');ActiveControl:=sotish_in;Exit;
  end;
  if (kol_in.Value>dms.s_tovarkol_in.AsInteger) and (dms.qoldiqturi.AsInteger=1) then begin
    ShowMessage('Ichki sotish sprovachnikdan balabd');ActiveControl:=kol_in;Exit;
  end;
  if dms.qoldiq.State=dsInsert then yangi:=1 else yangi:=0;
  if dms.asos_qoldiq.State in [dsedit,dsinsert] then
  begin
    dms.setup.Refresh;
    dms.asos_qoldiquser_id.AsInteger:=StrToInt(admin_id);
    dms.asos_qoldiqchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    dms.asos_qoldiq.post;
  end;
  dms.setup.Refresh;
  dms.qoldiquser_id.AsInteger:=StrToInt(admin_id);
  dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol.AsInteger;
  dms.qoldiqchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  if savdo.Text<>'' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select id from main where qrkod="'+savdo.Text+'"');
    dms.link.Open;
    savdo.Text:='';
    dms.qoldiqqrkod.AsInteger:=dms.link.fieldbyname('id').AsInteger;
  end;
  dms.qoldiqsumma.AsFloat:=dms.qoldiqkol.AsInteger*dms.qoldiqsena.AsFloat;
  dms.qoldiqsumma_in.AsFloat:=dms.qoldiqkol_in.AsInteger*dms.qoldiqsena_in.AsFloat;
  dms.qoldiqsumma_all.AsFloat:=dms.qoldiqsumma.AsFloat+dms.qoldiqsumma_in.AsFloat;
  if dms.qoldiq.FieldByName('tovar_id').AsInteger=0 then
    dms.qoldiq.FieldByName('tovar_id').AsInteger:=dms.s_tovarid.AsInteger;
  dms.qoldiq.Post;
  hatolar.t_id.Text:=DMS.s_tovarid.AsString;
  hatolar.qoldiq_tekshirClick(Sender);
  dms.s_tovar.Edit;
  if DMS.qoldiqsena.AsFloat>0 then dms.s_tovarsena.AsFloat:=DMS.qoldiqsena.AsFloat;
  if DMS.qoldiqsena_d.AsFloat>0 then dms.s_tovarsena_d.AsFloat:=DMS.qoldiqsena_d.AsFloat;
  dms.s_tovar.Post;
  qid:=dms.qoldiqid.AsString;qsotish:=dms.qoldiqsotish.AsFloat;
  qsotish_d:=dms.qoldiqsotish_d.AsFloat;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select sum(kol+kol_in) as soni,sum(summa_all) as summasi from asos_slave WHERE del_flag=1 and asos_id='+dms.asos_qoldiqid.AsString);
  dms.link.open;
  hisob:=1;
  dms.asos_qoldiq.Edit;dms.asos_qoldiqsumma.AsFloat:=dms.link.fieldbyname('summasi').AsFloat;
  dms.asos_qoldiqkol.AsFloat:=dms.link.fieldbyname('soni').AsFloat;dms.asos_qoldiq.Post;


    ss:='';sd:='';
    if sotish.Value>0 then
      ss:='sotish='+FloatToStr(sotish.Value);
    if sotish_d.Value>0 then
    begin
      if ss='' then
        sd:='sotish_d='+FloatToStr(sotish_d.Value)
      else
        sd:=ss+'; sotish_d='+FloatToStr(sotish_d.Value);
    end
    else
        sd:=ss;
    sd:=StrReplace(sd,',','.'); sd:=StrReplace(sd,';',',');

    if ss+sd<>'' then begin
      dms.qoldiq.first;
      while not dms.qoldiq.eof do begin

        if (dms.qoldiqkol_ost.AsInteger+dms.qoldiqkol_in_ost.AsInteger>0) and  (sid<>dms.qoldiq.fieldbyname('sotish').AsString) and (qsotish<>dms.qoldiq.fieldbyname('sotish').AsFloat) then begin
          dms.main_link.Close;dms.main_link.SQL.Clear;
          dms.main_link.SQL.Add('update asos_slave set '+sd+' where id='+dms.qoldiqid.AsString);
          dms.main_link.ExecSQL;
        end;
        dms.qoldiq.Next;
      end;
    end;
  dms.qoldiq.Refresh;

  hisob:=0;
  s_ostatka.Close;
end;

procedure Ts_ostatka.cancelClick(Sender: TObject);
begin
  dms.qoldiq.Cancel; s_ostatka.Close;
end;

procedure Ts_ostatka.nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ts_ostatka.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;

end;

procedure Ts_ostatka.FormHide(Sender: TObject); 
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ts_ostatka.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;
procedure Ts_ostatka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.qoldiq.Cancel;
end;

procedure Ts_ostatka.senaExit(Sender: TObject);
var n:integer;d:Currency;
begin
  if (dms.asos_qoldiqdollar.Value=1) and ((sena_d.Value=0) or (sena_d.Value=null)) then begin
    if sena.Value>0 then
      DMS.qoldiqsena_d.AsFloat:=sena.Value/DMS.asos_qoldiqkurs.AsInteger
    else
      ShowMessage('Agar faktura dollarda bo`lsa, Dollar kiritilishi shart');
    exit;
  end;
  if (dms.asos_qoldiqdollar.Value<>1) and (sena_d.Value<>null) then begin
    sena_d.Value:=null;sotish_d.Value:=null;sotish_in_d.Value:=null;
  end;
if (sena_d.value>0) and ((sena.Value=0) or (sena.Value=null)) then
      sena.Value:=RoundTo(sena_d.Value*DMS.asos_qoldiqkurs.AsInteger,DMS.s_clientyaxlitlash.Value);
  //if setup.foizsiz.Checked=true then begin foiz_in.Value:='';exit;end;



  if dms.asos_qoldiqdollar.Value=1 then begin
     if (sena_d.Value=0) or (sena_d.Value=null) then begin
      if (sotish_d.value>0) then
      sena_d.Value:=RoundTo(sotish_d.Value/(StrToFloat(foiz.Value)/100+1),-4);
      //sena_d.Value:=RoundTo(sotish_d.Value/(StrToFloat(foiz.Value)/100+1),DMS.s_clientyaxlitlash.Value);
    end
    else
    begin
      if dms.s_clientfoizli.AsInteger=1 then begin
        sotish_d.Value:=RoundTo(sena_d.Value+foiz.Value*sena_d.Value/100,-4); //RoundLess(sena.Value+f*sena.Value/100,2)
      end;
      if (sotish.Value>0) and ((sotish_d.Value=0) or (sotish_d.Value=null)) then
        sotish_d.Value:=sotish.Value/dms.asos_qoldiqkurs.AsFloat;
      if (sotish_d.Value>0) and ((sotish.Value=0) or (sotish.Value=null)) then
        sotish.Value:=RoundTo(sotish_d.Value*dms.asos_qoldiqkurs.AsFloat,dms.s_clientyaxlitlash.Value);

      if (schet.Value=0) or (schet.Value=null) then
        schet.Value:=RoundTo((sena_d.Value+sena_d.Value*DMS.s_clientfoiz_schet.AsInteger*dms.asos_qoldiqkurs.AsFloat)/100,dms.s_clientyaxlitlash.Value);

      if (opt1.Value=0) or (opt1.Value=null) then
      opt1.Value:=RoundTo((sena_d.Value+sena_d.Value*dms.s_clientfoiz_opt1.AsInteger*dms.asos_qoldiqkurs.AsFloat)/100,dms.s_clientyaxlitlash.Value);

      if (opt1_pl.Value=0) or (opt1_pl.Value=null) and (opt1.Value>0) then
        opt1_pl.Value:=RoundTo(opt1.Value+opt1.Value*5/100,dms.s_clientyaxlitlash.Value);

      if (opt2.Value=0) or (opt2.Value=null) then
        opt2.Value:=RoundTo((sena_d.Value+sena_d.Value*dms.s_clientfoiz_opt2.AsInteger*dms.asos_qoldiqkurs.AsFloat)/100,dms.s_clientyaxlitlash.Value);

      if (opt2_pl.Value=0) or (opt2_pl.Value=null) and (opt2.Value>0) then
        opt2_pl.Value:=RoundTo(opt2.Value+opt2.Value*5/100,dms.s_clientyaxlitlash.Value);

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
      if dms.s_clientfoizli.AsInteger=1 then begin
        sotish.Value:=RoundTo(sena.Value+foiz.Value*sena.Value/100,DMS.s_clientyaxlitlash.Value); //RoundLess(sena.Value+f*sena.Value/100,2)
      end;
      if (schet.Value=0) or (schet.Value=null) then
        schet.Value:=RoundTo(sena.Value+sena.Value*DMS.s_clientfoiz_schet.AsInteger/100,dms.s_clientyaxlitlash.Value);

      if (opt1.Value=0) or (opt1.Value=null) then
      opt1.Value:=RoundTo(sena.Value+sena.Value*dms.s_clientfoiz_opt1.AsInteger/100,dms.s_clientyaxlitlash.Value);

      if (opt1_pl.Value=0) or (opt1_pl.Value=null) and (opt1.Value>0) then
        opt1_pl.Value:=RoundTo(opt1.Value+opt1.Value*5/100,dms.s_clientyaxlitlash.Value);

      if (opt2.Value=0) or (opt2.Value=null) then
        opt2.Value:=RoundTo(sena.Value+sena.Value*dms.s_clientfoiz_opt2.AsInteger/100,dms.s_clientyaxlitlash.Value);

      if (opt2_pl.Value=0) or (opt2_pl.Value=null) and (opt2.Value>0) then
        opt2_pl.Value:=RoundTo(opt2.Value+opt2.Value*5/100,dms.s_clientyaxlitlash.Value);

      if (dms.qoldiqturi.Value=1) and (dms.s_tovaraniq.AsFloat<sotish.Value) and (dms.s_tovaraniq.AsFloat>0) then begin
        sotish.Value:=dms.s_tovaraniq.AsFloat;
        d:=dms.s_tovaraniq.AsFloat/sena.Value*100;d:=d-100;
        dms.qoldiqfoiz.AsFloat:=RoundTo(d,-2);
      end;
    end;
  end;
  if dms.s_tovarkol_in.AsInteger>1 then sena_inExit(Sender);
  dms.qoldiqsumma.AsFloat:=n*dms.qoldiqsena.AsFloat;
end;

procedure Ts_ostatka.FormActivate(Sender: TObject);
begin
  if dms.s_clientfoizli.AsInteger=0 then begin
    Label2.Visible:=false;Label11.Visible:=false;foiz.Visible:=false;
  end;

  hisob:=0;
  if dms.s_tovarkol_in.AsInteger > 1 then
    Gichki.Visible:=True
  else
    Gichki.Visible:=false;
  if dms.s_clientsert.AsInteger > 0 then
  Gseriya.Visible:=True else
  Gseriya.Visible:=false;
  if (dms.qoldiqkol.AsInteger=0) and (dms.qoldiq.State=dsinsert) then kol.Value:=1;
  if savdo.Text='' then kol.Enabled:=true else kol.Enabled:=false;
  kol_old.Text:='';kol_in_old.Text:='';
  if DMS.qoldiq.State=dsInsert then begin
    DMS.qoldiqfoiz.Value := dms.s_clientfoiz.Value;
    DMS.qoldiqfoiz_in.Value := dms.s_clientfoiz_in.Value;
    DMS.qoldiqfoiz_ch2.Value := dms.s_clientfoiz_ch2.Value;
    DMS.qoldiqfoiz_schet.Value := dms.s_clientfoiz_schet.Value;
    DMS.qoldiqfoiz_opt1.Value := dms.s_clientfoiz_opt1.Value;
    DMS.qoldiqfoiz_opt2.Value := dms.s_clientfoiz_opt2.Value;
  end
  else
    if diler.Enabled=true then diler.SetFocus;
    if DMS.qoldiq.State=dsedit then begin
      kol_old.Text:=DMS.qoldiqkol.AsString;kol_in_old.Text:=DMS.qoldiqkol_in.AsString;
      if DMS.qoldiqfoiz_ch2.Value=0 then
      DMS.qoldiqfoiz_ch2.Value := dms.s_clientfoiz_ch2.Value;
      if DMS.qoldiqfoiz_schet.Value=0 then
      DMS.qoldiqfoiz_schet.Value := dms.s_clientfoiz_schet.Value;
      if DMS.qoldiqfoiz_opt1.Value=0 then
      DMS.qoldiqfoiz_opt1.Value := dms.s_clientfoiz_opt1.Value;
      if DMS.qoldiqfoiz_opt2.Value=0 then
      DMS.qoldiqfoiz_opt2.Value := dms.s_clientfoiz_opt2.Value;
  end;
  if dms.asos_qoldiqdollar.AsInteger=1 then begin
    Lsena_d.Visible:=true;sena_d.Visible:=true;
    Lsotish_d.Visible:=true;sotish_d.Visible:=true;
    Lsena_in_d.Visible:=true;sena_in_d.Visible:=true;
    Lsotish_in_d.Visible:=true;sotish_in_d.Visible:=true;
    Ldollar.Visible:=true;dollar.Visible:=true;
  end
  else
  begin
    Lsena_d.Visible:=false;sena_d.Visible:=false;
    Lsotish_d.Visible:=false;sotish_d.Visible:=false;
    Lsena_in_d.Visible:=false;sena_in_d.Visible:=false;
    Lsotish_in_d.Visible:=false;sotish_in_d.Visible:=false;
    Ldollar.Visible:=false;dollar.Visible:=false;
  end;
  if dms.s_clientichkitovar.AsInteger=0 then
  begin
   gqoldir.Columns.Items[11].Visible:=false;
   gqoldir.Columns.Items[12].Visible:=false;
   gqoldir.Columns.Items[13].Visible:=false;
   gqoldir.Columns.Items[14].Visible:=false;
   gqoldir.Columns.Items[15].Visible:=false;
  end;

  if dms.s_clientulg.AsInteger>0 then begin
    Panel1.Visible:=true; GroupBox1.Visible:=true;
    if dms.s_clientulg.AsInteger=2 then begin
       Lopt1_pl.Visible:=false;opt1_pl.Visible:=false;
       Lopt2.Visible:=false;opt2.Visible:=false;
       Lopt2_pl.Visible:=false;opt2_pl.Visible:=false;
       Lschet.Visible:=false;schet.Visible:=false;
       Lopt1_pl_in.Visible:=false;opt1_pl_in.Visible:=false;
       Lopt2_in.Visible:=false;opt2_in.Visible:=false;
       Lopt2_pl_in.Visible:=false;opt2_pl_in.Visible:=false;
       Lschet_in.Visible:=false;schet_in.Visible:=false;
    end;
  end
  else
  begin
    Panel1.Visible:=false; GroupBox1.Visible:=false;
  end;
  if dms.s_clientichkitovar.AsInteger=1 then begin

  end
  else
  begin

  end;
end;

procedure Ts_ostatka.gqoldirDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var holdColor: TColor;
begin
  holdColor := gqoldir.Canvas.Font.Color;
  if Column.FieldName = 's_tovar' then begin
    if (dms.qoldiqturi.AsInteger =1) then begin
      gqoldir.Canvas.Font.Color := clRed; //Brush
      gqoldir.Canvas.Font.Style :=  [fsbold];
      gqoldir.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      gqoldir.Canvas.Font.Color := holdColor;
    end;
  if dms.qoldiqresept.AsInteger = 1 then
    with gqoldir.Canvas do begin
      Brush.Color := clSkyBlue;
      if (dms.qoldiqturi.AsInteger =1) then Font.Color := clRed;
      FillRect(Rect);TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text);
    end;
  end;
end;

procedure Ts_ostatka.yesClick(Sender: TObject);
begin
  if dms.asos_qoldiq.State=dsbrowse then begin
    dms.asos_qoldiq.Append;
    s_ostatka.yes.Caption:='Saqlash';s_ostatka.no.Caption:='Bekor qilish';
    s_ostatka.diler.visible:=false;
    s_ostatka.nomer.Enabled:=true;s_ostatka.n_sana.Enabled:=true;s_ostatka.n_diler.Enabled:=true;
    dms.asos_qoldiqsana.AsDateTime:=dms.setupvaqt.AsDateTime;
    dms.asos_qoldiqclient_id.value:=StrToInt(admin_id);
    dms.asos_qoldiqtur_oper.AsInteger:=5;
    nomer.SetFocus;
  end
  else begin
    dms.setup.Refresh;
    dms.asos_qoldiquser_id.AsInteger:=StrToInt(admin_id);
    dms.asos_qoldiqchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    dms.asos_qoldiq.post;
    dms.asos_qoldiq.Refresh;
    diler.Value:=dms.asos_qoldiqid.AsInteger;
    s_ostatka.yes.Caption:='Yangi xujjat';s_ostatka.no.Caption:='Taxrirlash';
    s_ostatka.nomer.Color:=$00B4E6E0;s_ostatka.n_sana.Color:=$00B4E6E0;s_ostatka.n_diler.Color:=$00B4E6E0;
    s_ostatka.diler.visible:=true;
    kol.SetFocus;
  end;
end;

procedure Ts_ostatka.dilerEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  s_asos.showmodal;
end;

procedure Ts_ostatka.noClick(Sender: TObject);
begin
  if dms.asos_qoldiq.State=dsbrowse then
  dms.asos_qoldiq.edit
  else
  begin
    dms.asos_qoldiq.Cancel;
    s_ostatka.yes.Caption:='Yangi xujjat';s_ostatka.no.Caption:='Taxrirlash';
    s_ostatka.nomer.Color:=$00B4E6E0;s_ostatka.n_sana.Color:=$00B4E6E0;s_ostatka.n_diler.Color:=$00B4E6E0;
    s_ostatka.diler.visible:=true;
  end;
end;

procedure Ts_ostatka.sena_inExit(Sender: TObject);
var n:integer;
begin
  {if setup.foizsiz.Checked=true then begin
    foiz_in.Value:='';exit;
  end;}
  //if (kol_in.Value=0) or (kol_in.Value=null) then n:=0 else n:=kol_in.Value;
  //dms.qoldiqkol_in_ost.AsInteger:=n;

  if (dms.s_tovarkol_in.AsInteger>0) then begin
    if dms.asos_qoldiqdollar.AsInteger=1 then
    begin

      if sena_d.Value>0 then
      begin
        sena_in_d.Value:=RoundTo(sena_d.Value/dms.s_tovarkol_in.AsInteger,-6);
        //sena_in_d.Value:=RoundTo(sena_d.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
        //sena_in.Value:=sena_in_d.Value*dms.k_asoskurs.AsFloat;
        sena_in.Value:=RoundTo(sena.Value/dms.s_tovarkol_in.AsInteger,0)
      end;
      if sotish_d.Value>0 then
      begin
        sotish_in_d.Value:=RoundTo(sotish_d.Value/dms.s_tovarkol_in.AsInteger,-6);
        //sotish_in_d.Value:=RoundTo(sotish_d.Value/dms.s_t_allkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
        sotish_in.Value:=RoundTo(sotish.Value/dms.s_tovarkol_in.AsInteger,-3);
        opt1_in.Value:=RoundTo(opt1.Value/dms.s_tovarkol_in.AsInteger,-3);
        opt1_pl_in.Value:=RoundTo(opt1_pl.Value/dms.s_tovarkol_in.AsInteger,-3);
        opt2_in.Value:=RoundTo(opt2.Value/dms.s_tovarkol_in.AsInteger,-3);
        opt2_pl_in.Value:=RoundTo(opt2_pl.Value/dms.s_tovarkol_in.AsInteger,-3);
        schet_in.Value:=RoundTo(schet.Value/dms.s_tovarkol_in.AsInteger,-3);
      end;
    end
    else
    begin
      if sena.Value>0 then sena_in.Value:=RoundTo(sena.Value/dms.s_tovarkol_in.AsInteger,-3);
      if sotish.Value>0 then sotish_in.Value:=RoundTo(sotish.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if schet.Value>0 then schet_in.Value:=RoundTo(schet.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if opt1.Value>0 then opt1_in.Value:=RoundTo(opt1.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if opt1_pl.Value>0 then opt1_pl_in.Value:=RoundTo(opt1_pl.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if opt2.Value>0 then opt2_in.Value:=RoundTo(opt2.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if opt2_pl.Value>0 then opt2_pl_in.Value:=RoundTo(opt2_pl.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    end;

    DMS.qoldiqfoiz_in.Value:=StrToFloat(foiz.Value);
    //foiz_in.Value:=foiz.Value;
  end
  else begin
    //foiz_in.Value:='';
    sena_in.Value:=0;sotish_in.Value:=0;sena_in_d.Value:=0;sotish_in_d.Value:=0;
  end;
  dms.qoldiqsumma_in.AsFloat:=n*dms.qoldiqsena_in.AsFloat;
end;

procedure Ts_ostatka.n_dilerEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  s_diler.showmodal;
  dms.s_diler.Refresh;
  diler.Refresh;
  if dms.asos_qoldiq.State=dsBrowse then dms.asos_qoldiq.edit;
  dms.asos_qoldiqdiler_id.Value:=dms.s_dilerid.Value;

end;

procedure Ts_ostatka.oyChange(Sender: TObject);
var s:string;
begin
  if (yil.ItemIndex=-1) or (oy.ItemIndex=-1) then exit;

  if oy.ItemIndex=11 then
    s:='01.01.'+inttostr(2018+yil.ItemIndex)
  else
    s:='01.'+inttostr(2+oy.ItemIndex)+'.'+inttostr(2017+yil.ItemIndex);
  srok.Value:=s;srok.Value:=srok.Value-1;

end;

procedure Ts_ostatka.sotishExit(Sender: TObject);
begin
  if dms.s_clientsotishtokirim.AsInteger=1 then begin
    sena.Value:=0;
    senaExit(Sender);exit;
  end;
  if (dms.asos_qoldiqdollar.Value=1) then
  begin
    if ((sotish_d.Value=0) or (sotish_d.Value=null)) and (sotish.value>0) then
      sotish_d.Value:=roundto(sotish.Value/dms.asos_qoldiqkurs.AsFloat,2)
    else
      if (sotish.Value=0) or (sotish.Value=null) then
      sotish.Value:=roundto(sotish_d.Value*dms.asos_qoldiqkurs.AsFloat,dms.s_clientyaxlitlash.Value);
  end;

  if dms.s_clientfoizli.AsInteger=0 then begin
    foiz.Value:='';
    exit;
  end;

  if (sena.Value>0) and (sotish.Value>0) and (foiz.Value='0') and (sotish.Value<>sena.Value) then
  begin
    dms.qoldiqfoiz.AsFloat:=RoundTo((sotish.Value/sena.Value*100-100),-2);
    if dms.s_t_allkol_in.AsInteger>1 then sena_inExit(Sender);
  end
  else
  begin
    if dms.s_t_allkol_in.AsInteger>1 then sena_inExit(Sender);
  end;
end;

procedure Ts_ostatka.RzBitBtn1Click(Sender: TObject);
begin
  sena.Value:=0;foiz.Value:='';sotish.Value:=0;
  sena_in.Value:=0;sotish_in.Value:=0;//foiz_in.Value:='';


end;

procedure Ts_ostatka.kolExit(Sender: TObject);
var d:Currency;
begin
  if (dms.s_tovarsotish.AsInteger+dms.s_tovarsotish_d.AsInteger+dms.s_tovarulg1.AsInteger>0) and (DMS.qoldiq.State=dsInsert) then
  begin
    DMS.qoldiqsena.AsFloat:=dms.s_tovarsena.AsFloat;
    DMS.qoldiqsotish.AsFloat:=dms.s_tovarsotish.AsFloat;
    DMS.qoldiqsena_d.AsFloat:=dms.s_tovarsena_d.AsFloat;
    DMS.qoldiqsotish_d.AsFloat:=dms.s_tovarsotish_d.AsFloat;
    d:=0;dms.qoldiqfoiz.AsFloat:=0;
    if dms.qoldiqsena.AsFloat>0 then begin
      d:=dms.qoldiqsotish.AsFloat/dms.qoldiqsena.AsFloat*100;d:=d-100;
      dms.qoldiqfoiz.AsFloat:=RoundTo(d,-2);
    end;
    DMS.qoldiqopt1.AsFloat:=dms.s_tovarulg1.AsFloat;
    DMS.qoldiqopt1_pl.AsFloat:=dms.s_tovarulg1_pl.AsFloat;
    DMS.qoldiqopt2.AsFloat:=dms.s_tovarulg2.AsFloat;
    DMS.qoldiqopt2_pl.AsFloat:=dms.s_tovarulg2_pl.AsFloat;
    DMS.qoldiqschet.AsFloat:=dms.s_tovarbank.AsFloat;
    if (dms.s_tovarkol_in.AsInteger>0) then begin
      if sena.Value>0 then sena_in.Value:=RoundTo(sena.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if sena_d.Value>0 then sena_in_d.Value:=sena_d.Value/dms.s_tovarkol_in.AsInteger;
      if sotish.Value>0 then sotish_in.Value:=RoundTo(sotish.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if sotish_d.Value>0 then sotish_in_d.Value:=sotish_d.Value/dms.s_tovarkol_in.AsInteger;
      if schet.Value>0 then DMS.qoldiqschet_in.Value:=RoundTo(schet.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if opt1.Value>0 then DMS.qoldiqopt1_in.Value:=RoundTo(opt1.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if opt1_pl.Value>0 then DMS.qoldiqopt1_pl_in.Value:=RoundTo(opt1_pl.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if opt2.Value>0 then DMS.qoldiqopt2_in.Value:=RoundTo(opt2.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
      if opt2_pl.Value>0 then DMS.qoldiqopt2_pl_in.Value:=RoundTo(opt2_pl.Value/dms.s_tovarkol_in.AsInteger,dms.s_clientyaxlitlash_in.Value);
    end;
    if (dms.s_tovarsena.AsInteger+dms.s_tovarsena_d.AsInteger)>0 then save.SetFocus;


  end;
end;

procedure Ts_ostatka.Label7Click(Sender: TObject);
begin
  DMS.asos_qoldiq.Refresh;DMS.qoldiq.Refresh;
end;

end.


