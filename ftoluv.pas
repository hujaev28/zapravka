unit ftoluv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, GridsEh, ExtCtrls, RzPanel, DBCtrlsEh, DBCtrls,db,
  RzDBCmbo, StdCtrls, RzButton, Mask, DBLookupEh, Grids,
  DBGrids, ImgList, RzBHints, RzTabs, Menus,
  SUIPopupMenu, RzEdit, RzDBEdit, RzRadGrp, RzLstBox, RzChkLst, WordXP,
  OleServer,ShellAPI, DBSumLst, frxDesgn, frxClass, RzStatus, RzDBStat,
  RzDBBnEd, Buttons, RzSpnEdt, RzCmboBx, frxPreview, RzRadChk, RzDBChk,
  RzShellDialogs, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdFTP,IdGlobal,IdFTPCommon,
  ComCtrls,ToolWin,IniFiles, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  frxDBSet;

type
  Ttulov = class(TForm)
    sqltext: TEdit;
    ImageList1: TImageList;
    Balloon: TRzBalloonHints;
    sfPage: TRzPageControl;
    Tab0: TRzTabSheet;
    newpl: TRzBitBtn;
    delpl: TRzBitBtn;
    Tab1: TRzTabSheet;
    ishi: TRzBitBtn;
    zapros: TRzEdit;
    xtur: TRzRadioGroup;
    xGroupyil: TRzGroupBox;
    xlyil: TLabel;
    xyil: TComboBox;
    xchorak: TRzRadioGroup;
    oi: TRzRadioGroup;
    xoraliq: TRzGroupBox;
    xldan: TLabel;
    xlgacha: TLabel;
    dan: TDBDateTimeEditEh;
    gacha: TDBDateTimeEditEh;
    sql: TRzEdit;
    vidpl: TRzCheckList;
    poisk_group: TGroupBox;
    lnom: TLabel;
    nom: TEdit;
    clientnom: TDBLookupComboboxEh;
    TabSheet1: TRzTabSheet;
    RzRapidFireButton1: TRzRapidFireButton;
    Label12: TLabel;
    Label13: TLabel;
    Gridfile: TDBGridEh;
    see: TfrxPreview;
    c: TDBDateTimeEditEh;
    po: TDBDateTimeEditEh;
    yesfile: TRzBitBtn;
    nofile: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    nomfile: TEdit;
    Dpl: TDataSource;
    pl: TZQuery;
    lbd_pl: TZQuery;
    lbd_plid: TIntegerField;
    lbd_plkod: TIntegerField;
    lbd_pln_pl: TIntegerField;
    lbd_pld_pl: TDateField;
    lbd_plnn: TSmallintField;
    lbd_plclient_id: TIntegerField;
    lbd_plsena_pl: TFloatField;
    lbd_plsaldo: TFloatField;
    lbd_plost_pl: TFloatField;
    lbd_plvid: TSmallintField;
    lbd_pls1: TStringField;
    lbd_plter: TSmallintField;
    lbd_plpot1: TSmallintField;
    lbd_plpot2: TSmallintField;
    lbd_plsf: TIntegerField;
    lbd_plsf_pot: TSmallintField;
    lbd_plusername: TStringField;
    lbd_plchangedate: TDateField;
    lbd_pls_vid: TStringField;
    lbd_pldel_flag: TSmallintField;
    Dlbd_pl: TDataSource;
    lbd_pln_dok: TStringField;
    lbd_plrssvoy: TStringField;
    grpl: TDBGridEh;
    plfilter: TRzCheckList;
    clpl: TZQuery;
    Dclpl: TDataSource;
    lbd_pls_client: TStringField;
    Gredit: TGroupBox;
    Label30: TLabel;
    n_pl: TDBNumberEditEh;
    Label31: TLabel;
    d_pl: TDBDateTimeEditEh;
    Label32: TLabel;
    sena_pl: TDBNumberEditEh;
    Label33: TLabel;
    s_vid: TRzDBLookupComboBox;
    Label34: TLabel;
    saldo: TDBNumberEditEh;
    Label14: TLabel;
    ost_pl: TDBNumberEditEh;
    Label1: TLabel;
    Edit1: TEdit;
    client: TDBLookupComboboxEh;
    pul: TZQuery;
    Dpul: TDataSource;
    sfGrid: TDBGridEh;

    procedure FormActivate(Sender: TObject);
    procedure ishiClick(Sender: TObject);
    procedure nosfClick(Sender: TObject);
    procedure yessfClick(Sender: TObject);
    procedure xturClick(Sender: TObject);
    procedure oiClick(Sender: TObject);
    procedure xyilChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure n_regKeyPress(Sender: TObject; var Key: Char);
    procedure lbd_plNewRecord(DataSet: TDataSet);
    procedure lbd_plAfterCancel(DataSet: TDataSet);
    procedure lbd_plAfterEdit(DataSet: TDataSet);
    procedure lbd_plAfterOpen(DataSet: TDataSet);
    procedure lbd_plAfterPost(DataSet: TDataSet);
    procedure lbd_plBeforePost(DataSet: TDataSet);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure newplClick(Sender: TObject);
    procedure delplClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure sena_plExit(Sender: TObject);
    procedure grplDblClick(Sender: TObject);
    procedure clientnomEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    procedure interval(int1,int2:Variant;massiv:Integer;z:String);

  public
  end;

var
  tulov: Ttulov; YYYY, MM, DD: Word;
  poisk: array [1..27] of String;
  vchorak,voy,s1,s2:string;sena:Currency;
  lis_id,lisk:Integer;

implementation

{$R *.dfm}

uses fdms,fulanish, DateUtils, Math,ZConnection, ComObj, ActiveX,fmain;   // ZDataset,
function StrReplace(const Str, Str1, Str2: string): string;
// str - исходна€ строка
// str1 - подстрока, подлежаща€ замене
// str2 - замен€юща€ строка
var
  P, L: Integer;
begin
  Result := str;
  L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then
    begin
      Delete(Result, P, L); // удал€ем ее
      Insert(Str2, Result, P); // вставл€ем новую
    end;
  until P = 0;
end;
function lat_kril(asos:String):String;
var i:Integer;nom_lat,nom_kril,s:String;lat:boolean;
begin
  nom_lat:=asos;nom_kril:=asos;
  lat:=False;
  for i:=1 to Length(asos) do
  if (asos[i] in ['a' .. 'z']) or (asos[i] in ['A' .. 'Z']) then begin lat:=true;Break;end;
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
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure ttulov.interval(int1,int2:Variant;massiv:Integer;z:String);
begin
if int1<>Null or int2<>Null then
begin
  if (int1<>Null) and (int2<>Null) then
    if int1=int2 then
    begin
      poisk[massiv]:=' '+z+' = '+kasaya(int1);
      zapros.Text:=zapros.Text+z+' = '+DateToStr(int1)+'#';
    end
    else
    begin
      poisk[massiv]:=' '+z+' between '+kasaya(int1)+' and '+kasaya(int2);
      zapros.Text:=zapros.Text+z+' между '+DateToStr(int1)+' и '+DateToStr(int2)+'#';
    end;
  if (int1<>Null) and (int2=Null) then
    begin
      poisk[massiv]:=' '+z+' >= '+kasaya(int1);
      zapros.Text:=zapros.Text+z+' c '+DateToStr(int1)+' и позже #';
    end;
  if (int1=Null) and (int2<>Null) then
    begin
      poisk[massiv]:=' '+z+' <= '+kasaya(int2);
      zapros.Text:=zapros.Text+z+' c '+DateToStr(int2)+' и ранее #';
    end;
end;
end;
procedure Ttulov.oiClick(Sender: TObject);
begin
  xturClick(Sender);
end;

procedure Ttulov.xyilChange(Sender: TObject);
begin
  dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);xturClick(Sender);
end;
procedure Ttulov.FormActivate(Sender: TObject);
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
begin
  DMS.setup.Open;

  shortdateformat:='dd.mm.yy'; xyil.Text:= IntToStr(YearOf(now));
  xtur.ItemIndex:=4;gacha.Text:=DateToStr(now);
  if DayOf(Now) > 10 then
    dan.Text:='01.'+_IntToStr(MonthOf(now),2)+'.'+copy(xyil.Text,3,2)
  else
   dan.Text:='01.'+_IntToStr(MonthOf(now)-iif(MonthOf(now)=1,0,1),2)+'.'+copy(xyil.Text,3,2);

  lbd_pl.Close;lbd_pl.SQL.Clear;
  interval(dan.Value, gacha.Value, 1,'pl.d_pl');
  lbd_pl.SQL.Add('SELECT * FROM pl WHERE del_flag=1 and '+poisk[1]+' order by d_pl');
  lbd_pl.open;lbd_pl.Last;
  pul.Open;
  oi.ItemIndex:=MonthOf(now)-1;
  if MonthOf(now) in [1,2,3] then xchorak.ItemIndex:=0;
  if MonthOf(now) in [4,5,6] then xchorak.ItemIndex:=1;
  if MonthOf(now) in [7,8,9] then xchorak.ItemIndex:=2;
  if MonthOf(now) in [10,11,12] then xchorak.ItemIndex:=3;
end;

procedure Ttulov.ishiClick(Sender: TObject);
var i:integer;plus1,plus2:string;
begin
zapros.Text:='';
for i := 1 to 27 do poisk[i]:='';
if clientnom.Value>0 then
begin
  poisk[1]:=' lbd_pl.client_id='+IntToStr(clientnom.Value);
  zapros.Text:='ѕредпри€ти€ = '+clientnom.Text+'#';
end;
if plfilter.ItemChecked[0] then poisk[4]:=' lbd_pl.sena_pl < 0 ';
if plfilter.ItemChecked[1] then if poisk[4]='' then poisk[4]:=' lbd_pl.ost_pl > 0 ' else poisk[4]:=' lbd_pl.sena_pl<0 and lbd_pl.ost_pl>0 ';
for i:=0 to 5 do
begin
if vidpl.ItemChecked[i] then
  begin
    plus1:=plus1+IntToStr(i+1)+',';
    plus2:=plus2+vidpl.ItemCaption(i)+',';
  end;
end;
if plus1<>'' then
begin
  Delete(plus1,length(plus1),1);Delete(plus2,length(plus2),1);
  zapros.Text:=zapros.Text+' to`lovnoma turi = '+plus2+'#';
  poisk[3]:=' ( lbd_pl.vid in ('+plus1+')) ';

end;
if StrToDate(dan.Text)>StrToDate(gacha.Text) then
begin ShowMessage('Oraliq hato');ActiveControl:=dan;Exit;end;
if (dan.Text<>'  .  .  ') then interval(dan.Value, gacha.Value, 2,'lbd_pl.d_pl' );

  sql.Text:='';
  if (poisk[1]>'') then sql.Text:=poisk[1];
  for i := 2 to 4 do
  begin
    if (sql.Text>'') and (poisk[i]>'') then poisk[i]:=' and '+poisk[i];
    sql.Text:=sql.Text+poisk[i];
  end;
  if (sql.Text='') then exit;
  lbd_pl.Close;lbd_pl.SQL.Clear;
  lbd_pl.SQL.Add('SELECT * FROM pl WHERE del_flag=1 and '+sql.Text+' order by d_pl');
  sql.Text:=lbd_pl.SQL.Text;
  lbd_pl.open;lbd_pl.Last;
  sfPage.TabIndex:=0;//ActiveControl:=sfGrid;
end;

procedure Ttulov.nosfClick(Sender: TObject);
begin
  lbd_pl.Cancel;
  sfPage.Pages[0].TabEnabled:=true;sfPage.Pages[1].TabEnabled:=true;sfPage.TabIndex:=0;
end;
procedure Ttulov.yessfClick(Sender: TObject);
begin
  //if pul.FieldByName('n_sf').AsString='' then begin ShowMessage('¬ведите є с-ф');ActiveControl:=n_sf;Exit; end;
  //if pul.FieldByName('d_sf').AsString='' then begin ShowMessage('¬ведите дату с-ф');ActiveControl:=d_sf;Exit; end;
  lbd_pl.post;
end;

procedure Ttulov.xturClick(Sender: TObject);
begin
  zapros.Text:='';
  case xtur.ItemIndex of
  0: begin
      xGroupyil.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;xoraliq.Enabled:=False;
      dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);
      if (clientnom.Value>0) then zapros.Text:=dms.s_client.fieldbyname('nom').AsString;
      zapros.Text:=zapros.Text+';'+xyil.Text+ ' год';
     end;
  1: begin
      xGroupyil.Enabled:=True;xchorak.Enabled:=True;oi.Enabled:=False;xoraliq.Enabled:=False;
      case xchorak.ItemIndex of
      0: begin dan.Text:='01.01.'+copy(xyil.Text,3,2);gacha.Text:='31.03.'+copy(xyil.Text,3,2);vchorak:='I';end;
      1: begin dan.Text:='01.04.'+copy(xyil.Text,3,2);gacha.Text:='30.06.'+copy(xyil.Text,3,2);vchorak:='II';end;
      2: begin dan.Text:='01.07.'+copy(xyil.Text,3,2);gacha.Text:='30.09.'+copy(xyil.Text,3,2);vchorak:='III';end;
      3: begin dan.Text:='01.10.'+copy(xyil.Text,3,2);gacha.Text:='31.12.'+copy(xyil.Text,3,2);vchorak:='IV';end;
      end;
      zapros.Text:=xyil.Text+' год ' +vchorak+ ' квартал';
     end;
  2: begin
      xGroupyil.Enabled:=True;oi.Enabled:=True;xchorak.Enabled:=False;xoraliq.Enabled:=False;
      case oi.ItemIndex of
      0: begin s1:='01.01.';s2:='.02.';voy:='€нвар'; end;
      1: begin s1:='01.02.';s2:='.03.';voy:='феврал';end;
      2: begin s1:='01.03.';s2:='.04.';voy:='март';  end;
      3: begin s1:='01.04.';s2:='.05.';voy:='апрел'; end;
      4: begin s1:='01.05.';s2:='.06.';voy:='май';   end;
      5: begin s1:='01.06.';s2:='.07.';voy:='июн';   end;
      6: begin s1:='01.07.';s2:='.08.';voy:='июл';   end;
      7: begin s1:='01.08.';s2:='.09.';voy:='август';end;
      8: begin s1:='01.09.';s2:='.10.';voy:='сент€бр';end;
      9: begin s1:='01.10.';s2:='.11.';voy:='окт€бр'; end;
      10: begin s1:='01.11.';s2:='.12.';voy:='но€бр'; end;
      11: begin s1:='01.12.';s2:='.01.';voy:='декабр';end;
      end;s2:='01'+s2+copy(xyil.Text,3,2);//ord(IsLeapYear(year)
      if oi.ItemIndex=11 then s2:=DateToStr(IncYear(strTodate(s2))-1) else s2:=DateToStr(strTodate(s2)-1);;
      dan.Text:=s1+copy(xyil.Text,3,2);gacha.Text:=s2;
      zapros.Text:=xyil.Text+' год ' +voy+ ' мес€ц';
     end;
  3: begin
      if dan.Text<>gacha.Text then gacha.Text:=dan.Text;
      xGroupyil.Enabled:=False;xoraliq.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;
      zapros.Text:= ' дата с-ф = '+dan.Text;
     end;
  4: begin
      xGroupyil.Enabled:=False;xoraliq.Enabled:=True;oi.Enabled:=False;xchorak.Enabled:=False;
      zapros.Text:= ' интервал с '+dan.Text+' по '+gacha.text;
     end;
  end;
end;

procedure Ttulov.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  sfPage.ActivePageIndex:=0;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'lisenziya.ini');
  if IniFile.SectionExists(name)=False then
  begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;

procedure Ttulov.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'lisenziya.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Ttulov.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'lisenziya.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Ttulov.n_regKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Ttulov.lbd_plNewRecord(DataSet: TDataSet);
begin
  lbd_pl.FieldByName('vid').AsInteger:=1;
  lbd_pl.FieldByName('d_pl').AsDateTime:=date();
  lbd_pl.FieldByName('n_pl').AsString:='-1';

  grpl.enabled:=false;Gredit.enabled:=true;
  tulov.sfPage.Pages[1].TabEnabled:=false;
  newpl.Enabled:=true;delpl.Enabled:=true;
  newpl.Caption:='Saqlash';delpl.Caption:='Bekor qilish';
  newpl.Font.Color:=clred;delpl.Font.Color:=clred;
  end;

procedure Ttulov.lbd_plAfterCancel(DataSet: TDataSet);
begin
 newpl.Caption:='Yangi';delpl.Caption:='O`chirish';
 newpl.Font.Color:=clBlue;delpl.Font.Color:=clBlue;
 tulov.n_pl.Font.Color:=clBlack;tulov.d_pl.Font.Color:=clBlack;
 tulov.sena_pl.Font.Color:=clBlack;tulov.s_vid.Font.Color:=clBlack;
 tulov.sfPage.Pages[1].TabEnabled:=true;
 grpl.Enabled:=true;Gredit.enabled:=false;
 lbd_plAfterOpen(DataSet);
end;

procedure Ttulov.lbd_plAfterEdit(DataSet: TDataSet);
begin
  newpl.Caption:='Saqlash';delpl.Caption:='Bekor qilish';
  newpl.Font.Color:=clred;delpl.Font.Color:=clred;
  tulov.sfPage.Pages[1].TabEnabled:=false;
  grpl.Enabled:=false;Gredit.enabled:=true;

end;

procedure Ttulov.lbd_plAfterOpen(DataSet: TDataSet);
begin
 if lbd_pl.RecordCount=0 then
 begin
  tulov.delpl.Enabled:=false;
 end
 else
 begin
  tulov.delpl.Enabled:=true;
 end;

end;

procedure Ttulov.lbd_plAfterPost(DataSet: TDataSet);
begin
 grpl.Enabled:=true;Gredit.enabled:=false;tulov.sfPage.Pages[1].TabEnabled:=true;
 newpl.Caption:='Yangi';delpl.Caption:='O`chirish';
 newpl.Font.Color:=clBlue;delpl.Font.Color:=clBlue;


 tulov.n_pl.Font.Color:=clBlack;tulov.d_pl.Font.Color:=clBlack;
 tulov.sena_pl.Font.Color:=clBlack;tulov.s_vid.Font.Color:=clBlack;
end;

procedure Ttulov.lbd_plBeforePost(DataSet: TDataSet);
begin
  dms.setup.Refresh;
  //lbd_pl.fieldbyname('username').AsString:=admin_nom;lbd_pl.fieldbyname('changedate').AsDateTime:=dms.setupvaqt.AsDateTime;
end;

procedure Ttulov.nomKeyPress(Sender: TObject; var Key: Char);
var s,ss:String;
begin
  if Key<>#13 then exit;
  if nom.Text='' then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);exit;end;

  DMS.s_client.Close;DMS.s_client.SQL.Clear;S:=nom.Text;
  if (Length(nom.Text)=9) and ((S[9] in ['0'..'9']) or (S[1] in ['0'..'9'])) then
    DMS.s_client.SQL.Add('select * from s_client WHERE del_flag=1 and '+ss+'(s_client.inn = "'+nom.Text+'")')
  else
    DMS.s_client.SQL.Add('select * from s_client WHERE inn<>"" and del_flag=1 and '+ss+'((nom like "%'+lat_kril(nom.Text)+'%") or (nom like "%'+nom.Text+'%")) order by nom');
  DMS.s_client.open;DMS.s_client.First;
  clientnom.Value:=DMS.s_client.fieldbyname('id').Value;
end;

procedure Ttulov.newplClick(Sender: TObject);
begin
  if lbd_pl.State=dsbrowse then
  begin
    lbd_pl.Append;edit1.SetFocus;
  end
  else
  begin
    if client.Value=null then begin ShowMessage('Korxonani tanlang');ActiveControl:=client;Exit;end;
    if n_pl.Value=null then begin ShowMessage('To`lov nomerini kiriting');ActiveControl:=n_pl;Exit;end;
    if lbd_pl.FieldByName('d_pl').AsVariant=null then begin ShowMessage('To`lov sanasini kiriting');ActiveControl:=d_pl;Exit;end;
    if lbd_pl.fieldbyname('sena_pl').AsFloat=0 then begin ShowMessage('Summani kiriting');ActiveControl:=sena_pl;Exit;end;
    Edit1.text:=dms.s_client.fieldbyname('inn').AsString;
    lbd_pl.Post;
  end;
end;

procedure Ttulov.delplClick(Sender: TObject);
begin
  if lbd_pl.State=dsbrowse then
  begin
    if lbd_pl.RecordCount=0 then exit;
    if lbd_pl.FieldByName('ost_pl').AsFloat<>lbd_pl.FieldByName('sena_pl').AsFloat then
    begin
      ShowMessage('O`chirishdan oldin to`lovlarni tozalang.');
      exit;
    end;
    if MessageDlg(lbd_pln_pl.AsString+'-sonli to`lovnomani o`chirasizmi ?',mtInformation,[mbYes, mbNo], 0) = mrYes then
    begin
      lbd_pl.edit;lbd_pl.FieldByName('del_flag').Value:=0;lbd_pl.post;
     lbd_pl.Refresh;
      lbd_plAfterOpen(lbd_pl);
   end;
  end
  else
  begin
    lbd_pl.Cancel;
  end;
end;

procedure Ttulov.Edit1KeyPress(Sender: TObject; var Key: Char);
var s,ss:String;
begin
  if Key<>#13 then exit;
  if edit1.Text='' then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);exit;end;
  DMS.s_client.Close;DMS.s_client.SQL.Clear;S:=Edit1.Text;
  if (Length(edit1.Text)=9) and ((S[9] in ['0'..'9']) or (S[1] in ['0'..'9'])) then
    DMS.s_client.SQL.Add('select * from s_client WHERE del_flag=1 and '+ss+'(s_client.inn = "'+edit1.Text+'")')
  else
    DMS.s_client.SQL.Add('select * from s_client WHERE inn<>"" and del_flag=1 and '+ss+'((nom like "%'+lat_kril(edit1.Text)+'%") or (nom like "%'+edit1.Text+'%")) order by nom');
  DMS.s_client.open;DMS.s_client.First;
  client.Value:=DMS.s_client.fieldbyname('id').Value;
  if DMS.s_client.RecordCount=0 then exit;
  client.Value:=DMS.s_client.fieldbyname('id').Value;
  if DMS.s_client.RecordCount=1 then sena_pl.SetFocus else client.SetFocus;
end;

procedure Ttulov.sena_plExit(Sender: TObject);
begin
  //if (sena_pl.Value<0) then sena_pl.Value:=0-sena_pl.Value;
  if (ost_pl.Value=null) and (sena_pl.Value<>0) then
  begin
    if sena_pl.Value>0 then
    begin
    saldo.Value:=sena_pl.Value;ost_pl.Value:=sena_pl.Value;
    end
    else
    begin
    saldo.Value:=0-sena_pl.Value;ost_pl.Value:=0-sena_pl.Value;
    end;

  end;
end;

procedure Ttulov.grplDblClick(Sender: TObject);
begin
  //if lbd_plsena_pl.AsFloat<>lbd_plost_pl.AsFloat then ost_pl.Enabled:=False  else ost_pl.Enabled:=true;
  lbd_pl.Edit;
end;

procedure Ttulov.clientnomEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  clientnom.Text:='';
end;

end.

