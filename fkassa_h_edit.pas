unit fkassa_h_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles,DBGridEh, DBCtrlsEh, RzCmboBx, RzDBCmbo, DBLookupEh, StdCtrls, DBCtrls,
  Mask, Dialogs, RzButton, RzEdit, RzDBEdit, GridsEh, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tkassa_h_edit = class(TForm)
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gform: TGroupBox;
    Label10: TLabel;
    Label25: TLabel;
    Label1: TLabel;
    Label12: TLabel;
    summa_ch: TDBNumberEditEh;
    qarz_izoh: TDBEdit;
    qarz_flag: TRzDBComboBox;
    haridor: TDBLookupComboboxEh;
    Label2: TLabel;
    qarz_summa: TDBNumberEditEh;
    Label3: TLabel;
    sum_naqd: TDBNumberEditEh;
    Label4: TLabel;
    sum_plastik: TDBNumberEditEh;
    sum_epos: TDBNumberEditEh;
    Label5: TLabel;
    varaqa: TRzBitBtn;
    Label14: TLabel;
    nomer: TDBEdit;
    Label15: TLabel;
    sana: TDBDateTimeEditEh;
    bosmalash: TRzBitBtn;
    Label16: TLabel;
    sum_d: TDBNumberEditEh;
    Label17: TLabel;
    sum_d_ch: TRzDBNumericEdit;
    Label18: TLabel;
    cheg_d: TDBNumberEditEh;
    Label19: TLabel;
    qarz_dollar: TDBNumberEditEh;
    Label20: TLabel;
    inv: TDBLookupComboboxEh;
    Kurs: TRzDBNumericEdit;
    Label21: TLabel;
    Label22: TLabel;
    sum_click: TDBNumberEditEh;
    Label26: TLabel;
    farq: TRzMaskEdit;
    Label27: TLabel;
    srok: TDBDateTimeEditEh;
    Group_sbor: TGroupBox;
    DBGridEh1: TDBGridEh;
    oraliq: TZQuery;
    oraliqsf_id: TIntegerField;
    oraliqost: TFloatField;
    oraliqpl_id: TIntegerField;
    oraliqvid: TSmallintField;
    Doraliq: TDataSource;
    lbd_pl: TZQuery;
    Dlbd_pl: TDataSource;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure varaqaClick(Sender: TObject);
    procedure bosmalashClick(Sender: TObject);
    procedure sum_d_chExit(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure sum_d_chKeyPress(Sender: TObject; var Key: Char);
    procedure cheg_dExit(Sender: TObject);
    procedure farqExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kassa_h_edit: Tkassa_h_edit;

implementation

{$R *.dfm}
uses fulanish_k, fdms, fkassa, fsetup,Math;
function SumNumToFull(Number:real;s1,s2:string):string;
var PartNum, TruncNum, NumTMP, D: integer;NumStr : string;i, R : byte; Flag11 : boolean;
begin
  D:=1000000;R:=4;//выдел€ем рубли
  TruncNum:=Trunc(Number);
  if TruncNum<>0 then
    repeat
      PartNum:=TruncNum div D;Dec(R);D:=D div 1000;
    until PartNum<>0
  else R:=0;// перевод рублей
  for i:=R downto 1 do
  begin
    Flag11:=False;
    // выделение цифры сотен
    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'сто ';
      2: NumStr:=NumStr+'двести ';
      3: NumStr:=NumStr+'триста ';
      4: NumStr:=NumStr+'четыреста ';
      5: NumStr:=NumStr+'п€тьсот ';
      6: NumStr:=NumStr+'шестьсот ';
      7: NumStr:=NumStr+'семьсот ';
      8: NumStr:=NumStr+'восемьсот ';
      9: NumStr:=NumStr+'дев€тьсот ';
    end;
    // выделение цифры дес€тков
    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'дес€ть ';
          11: NumStr:=NumStr+'одиннадцать ';
          12: NumStr:=NumStr+'двенадцать ';
          13: NumStr:=NumStr+'тринадцать ';
          14: NumStr:=NumStr+'четырнадцать ';
          15: NumStr:=NumStr+'п€тнадцать ';
          16: NumStr:=NumStr+'шестнадцать ';
          17: NumStr:=NumStr+'семнадцать ';
          18: NumStr:=NumStr+'восемнадцать ';
          19: NumStr:=NumStr+'дев€тнадцать ';
        end;
        case i of
          3: NumStr:=NumStr+'миллионов ';
          2: NumStr:=NumStr+'тыс€ч ';
          1: NumStr:=NumStr+' ';
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'двадцать ';
      3: NumStr:=NumStr+'тридцать ';
      4: NumStr:=NumStr+'сорок ';
      5: NumStr:=NumStr+'п€тьдес€т ';
      6: NumStr:=NumStr+'шестьдес€т ';
      7: NumStr:=NumStr+'семьдес€т ';
      8: NumStr:=NumStr+'восемьдес€т ';
      9: NumStr:=NumStr+'дев€носто ';
    end;
    // выделение цифры единиц
    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:if i=2 then NumStr:=NumStr+'одна ' else NumStr:=NumStr+'один ';
        2:if i=2 then NumStr:=NumStr+'две '  else NumStr:=NumStr+'два ';
        3: NumStr:=NumStr+'три ';
        4: NumStr:=NumStr+'четыре ';
        5: NumStr:=NumStr+'п€ть ';
        6: NumStr:=NumStr+'шесть ';
        7: NumStr:=NumStr+'семь ';
        8: NumStr:=NumStr+'восемь ';
        9: NumStr:=NumStr+'дев€ть ';
      end;
      case i of
        3:case NumTMP of
            1: NumStr:=NumStr+'миллион ';
            2,3,4: NumStr:=NumStr+'миллиона ';
            else NumStr:=NumStr+'миллионов ';
          end;
        2:case NumTMP of
            1 : NumStr:=NumStr+'тыс€ча ';
            2,3,4: NumStr:=NumStr+'тыс€чи ';
            else
              if PartNum<>0 then NumStr:=NumStr+'тыс€ч ';
          end;
        1:case NumTMP of
            1 : NumStr:=NumStr;// +s1+' '
            2,3,4: NumStr:=NumStr;// +s1+' '
            else NumStr:=NumStr;// +s1+' '
          end;
      end;
    end;
    if i>1 then begin
      PartNum:=(TruncNum mod (D*1000)) div D;D:=D div 1000;
    end;
  end;
  NumStr:=TrimRight(NumStr)+' '+s1+' ';
  //перевод копеек
  PartNum:=Round(Frac(Number)*100);
  if PartNum=0 then
  begin
    SumNumToFull:=NumStr+'00 '+s2;Exit;
  end;// выделение цифры дес€тков
  NumTMP:=PartNum div 10;
  if NumTMP=0 then NumStr:=NumStr+'0'+IntToStr(PartNum)+' '
  else NumStr:=NumStr+IntToStr(PartNum)+' ';
  // выделение цифры единиц
  NumTMP:=PartNum mod 10;
  case NumTMP of
    1:if PartNum<>11 then  NumStr:=NumStr+s2
      else NumStr:=NumStr+s2;
    2,3,4:
      if (PartNum<5) or (PartNum>14) then NumStr:=NumStr+s2
      else NumStr:=NumStr+s2;
    else NumStr:=NumStr+s2;
  end;
  NumStr:=AnsiUpperCase(copy(NumStr,1,1))+copy(NumStr,2,length(NumStr)-1);
  SumNumToFull:=NumStr;
end;
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;

function StrReplace(const Str, Str1, Str2: string): string;
var P, L: Integer;
begin
  Result := str;L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then begin
      Delete(Result, P, L); // удал€ем ее
      Insert(Str2, Result, P); // вставл€ем новую
    end;
  until P = 0;
end;

procedure Tkassa_h_edit.saveClick(Sender: TObject);
begin
  if dms.asos.State=dsbrowse then exit;
  //if haridor.Value=Null then begin
  //  ShowMessage('Haridorni tanlang');haridor.SetFocus;exit;
  //end;
  //if dms.asossumma_ch.AsFloat < dms.asosqarz_summa.AsFloat then begin
  //  ShowMessage('Qarz summa noto`g`ri');exit;
  //end;
  {if (dms.asossum_naqd_ch.AsFloat+dms.asoscheg_n.AsFloat) <> dms.asossum_naqd.AsFloat then begin
    ShowMessage('Naqd summa noto`g`ri');exit;
  end;
  if (dms.asossum_plast_ch.AsFloat+dms.asoscheg_p.AsFloat) <> dms.asossum_plastik.AsFloat then begin
    ShowMessage('Plastik summa noto`g`ri');exit;
  end;
  if (dms.asossum_epos_ch.AsFloat+dms.asoscheg_e.AsFloat) <> dms.asossum_epos.AsFloat then begin
    ShowMessage('H/r summa noto`g`ri');exit;
  end;
  if (dms.asossum_naqd.AsFloat+dms.asossum_plastik.AsFloat+dms.asossum_epos.AsFloat) <> (dms.asossumma.AsFloat+dms.asosxizmat.AsFloat) then begin
    ShowMessage('Chek summa noto`g`ri');exit;
  end;}
  //if dms.k_asosqarz_flag.AsInteger=4 then
  if MessageDlg(' Ushbu ma`lumotlarni saqlaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.asos.Post;
  end;
  kassa_h_edit.Close;
end;

procedure Tkassa_h_edit.cancelClick(Sender: TObject);
begin
  dms.asos.Cancel;kassa_h_edit.Close;
end;

procedure Tkassa_h_edit.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;
end;

procedure Tkassa_h_edit.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;
end;

procedure Tkassa_h_edit.FormCreate(Sender: TObject);
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
procedure Tkassa_h_edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dms.k_asos.Cancel;
end;

procedure Tkassa_h_edit.varaqaClick(Sender: TObject);
var danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;s:string;
begin
  if dms.asossumma_ch.AsFloat < dms.asosqarz_summa.AsFloat then begin
    ShowMessage('Qarz summa noto`g`ri');exit;
  end;
  if MessageDlg(' Ushbu ma`lumotlarni saqlaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

  dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
  if (dms.asos.State=dsInsert) or (dms.asosdiler_id.AsInteger=0) or (dms.asosdiler_id.AsInteger=-1) then
  begin
    dms.link.Close;dms.link.sql.Clear;
    if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
      dms.asosdiler_id.AsInteger:=1;
      dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
    end
    else begin
      dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
      dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;
  end;
  dms.asos.Post;
  dms.s_client.Refresh;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
  dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString+' order by id');
  dms.main_link.open;
  danq:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
  chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_kirim,sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_d,0)) as b_kirimd,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_chiqim,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_d,0)) as b_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+dms.s_haridorid.AsString);
  dms.main_link.SQL.Add(' order by id');
  dms.main_link.open;
  danq:=danq+dms.main_link.fieldbyname('b_chiqim').AsFloat-dms.main_link.fieldbyname('b_kirim').AsFloat;
  danqd:=danqd+dms.main_link.fieldbyname('b_chiqimd').AsFloat-dms.main_link.fieldbyname('b_kirimd').AsFloat;

  kirim:=dms.main_link.fieldbyname('o_kirim').AsFloat;
  kirimd:=dms.main_link.fieldbyname('o_kirimd').AsFloat;
  chiqim:=chiqim+dms.main_link.fieldbyname('o_chiqim').AsFloat;
  chiqimd:=chiqimd+dms.main_link.fieldbyname('o_chiqimd').AsFloat;
  s:='';
    if (danq+(chiqim-kirim))>0 then begin
      s:= 'QARZDORLIQ: <b>'+FloatToStr(danq+(chiqim-kirim))+'</b>';
      if dms.asosqarz_summa.AsFloat>0 then
        s:=s+' , JORIY QARZ: <b>'+dms.asosqarz_summa.AsString+'</b> SO`M'
      else
        s:=s+'SO`M';
    end;
    if (danqd+(chiqimd-kirimd))>0 then begin
      if s<>'' then s:=s+'#13#10';
      s:= 'QARZDORLIQ: $ <b>'+FloatToStr(danqd+(chiqimd-kirimd))+'</b>';
      if dms.asosqarz_dollar.AsFloat>0 then
         s:=s+' , JORIY QARZ: $ <b>'+dms.asosqarz_summa.AsString+'</b>';
    end;
  if (dms.s_clientdollar.AsInteger=2) then //and ((kassa.qoldiqsotish_d.AsFloat+kassa.qoldiqsotish_in_d.AsFloat)>0)
  begin
    kassa.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_chiqim_d2.fr3');
    if dms.asossum_epos_ch.AsFloat>0 then
      kassa.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossum_epos_ch.AsFloat,'сум','тийин')+''''
    else
      kassa.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'сум','тийин')+'''';
    kassa.frxsf.Variables['summa_all']:=''''+dms.asossumma_ch.AsString+'''';
    kassa.frxsf.Variables['dollar']:=''''+SumNumToFull(dms.asossum_d_ch.AsFloat,'$','sent')+'''';
    kassa.frxsf.Variables['qarz']:=''''+FloatToStr(danq+(chiqim-kirim))+'''';
  end
  else
  begin
    kassa.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_chiqim.fr3');
    if dms.asossum_epos_ch.AsFloat>0 then
      kassa.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossum_epos_ch.AsFloat,'сум','тийин')+''''
    else
      kassa.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'сум','тийин')+'''';
    kassa.frxsf.Variables['qarz']:=''''+FloatToStr(danq+(chiqim-kirim))+'''';
  end;
  if s<>'' then
      kassa.frxsf.Variables['qarz']:=''''+s+''''
  else
      kassa.frxsf.Variables['qarz']:='''''';
  kassa.frxsf.PrintOptions.Printer := kassa.chekPrinters.Text;
  kassa.frxsf.SelectPrinter;kassa.frxsf.PrepareReport;
  kassa.frxsf.PrintOptions.ShowDialog := True;
  kassa.frxsf.PrintOptions.Copies := 2;
  kassa.frxsf.Print;

    dms.asos.Close;dms.asos.SQL.Clear;
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'" order by id desc');
    dms.asos.open;
    if (not dms.asos.Locate('diler_id',0,[loCaseInsensitive])) then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;
    end;
    kassa_h_edit.Close;
  end;
end;

procedure Tkassa_h_edit.bosmalashClick(Sender: TObject);
var danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;s:string;
begin
  dms.asos.Post;
  dms.s_client.Refresh;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
  dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString+' order by id');
  dms.main_link.open;
  danq:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
  chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_kirim,sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_d,0)) as b_kirimd,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_chiqim,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_d,0)) as b_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+dms.s_haridorid.AsString);
  dms.main_link.SQL.Add(' order by id');
  dms.main_link.open;
  danq:=danq+dms.main_link.fieldbyname('b_chiqim').AsFloat-dms.main_link.fieldbyname('b_kirim').AsFloat;
  danqd:=danqd+dms.main_link.fieldbyname('b_chiqimd').AsFloat-dms.main_link.fieldbyname('b_kirimd').AsFloat;

  kirim:=dms.main_link.fieldbyname('o_kirim').AsFloat;
  kirimd:=dms.main_link.fieldbyname('o_kirimd').AsFloat;
  chiqim:=chiqim+dms.main_link.fieldbyname('o_chiqim').AsFloat;
  chiqimd:=chiqimd+dms.main_link.fieldbyname('o_chiqimd').AsFloat;
  s:='';
    if (danq+(chiqim-kirim))>0 then begin
      s:= 'QARZDORLIQ: <b>'+FloatToStr(danq+(chiqim-kirim))+'</b>';
      if dms.asosqarz_summa.AsFloat>0 then
        s:=s+' , JORIY QARZ: <b>'+dms.asosqarz_summa.AsString+'</b> SO`M'
      else
        s:=s+'SO`M';
    end;
    if (danqd+(chiqimd-kirimd))>0 then begin
      if s<>'' then s:=s+'#13#10';
      s:= 'QARZDORLIQ: $ <b>'+FloatToStr(danqd+(chiqimd-kirimd))+'</b>';
      if dms.asosqarz_dollar.AsFloat>0 then
         s:=s+' , JORIY QARZ: $ <b>'+dms.asosqarz_summa.AsString+'</b>';
    end;
  if (dms.s_clientdollar.AsInteger=2) then //and ((kassa.qoldiqsotish_d.AsFloat+kassa.qoldiqsotish_in_d.AsFloat)>0)
  begin
    kassa.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_chiqim_d2.fr3');
    if dms.asossum_epos_ch.AsFloat>0 then
      kassa.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossum_epos_ch.AsFloat,'сум','тийин')+''''
    else
      kassa.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'сум','тийин')+'''';
    kassa.frxsf.Variables['summa_all']:=''''+dms.asossumma_ch.AsString+'''';
    kassa.frxsf.Variables['dollar']:=''''+SumNumToFull(dms.asossum_d_ch.AsFloat,'$','sent')+'''';
    kassa.frxsf.Variables['qarz']:=''''+FloatToStr(danq+(chiqim-kirim))+'''';

  end
  else
  begin
    kassa.frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'sf_chiqim.fr3');
    kassa.frxsf.Variables['qarz']:=''''+FloatToStr(danq+(chiqim-kirim))+'''';
    if dms.asossum_epos_ch.AsFloat>0 then
      kassa.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossum_epos_ch.AsFloat,'сум','тийин')+''''
    else
      kassa.frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'сум','тийин')+'''';
  end;
  if s<>'' then
      kassa.frxsf.Variables['qarz']:=''''+s+''''
  else
    kassa.frxsf.Variables['qarz']:='''''';
  kassa.frxsf.PrintOptions.Printer := kassa.chekPrinters.Text;
  kassa.frxsf.SelectPrinter;kassa.frxsf.PrepareReport;
  kassa.frxsf.PrintOptions.ShowDialog := True;
  kassa.frxsf.PrintOptions.Copies := 2;
  kassa.frxsf.ShowReport;
  dms.asos.Edit;
end;

procedure Tkassa_h_edit.sum_d_chExit(Sender: TObject);
begin
  if dms.asossum_d_ch.AsFloat=0 then exit;
  if dms.asoskurs.AsFloat=0 then begin
    ShowMessage('Kursni kiriting');exit;
  end;
  dms.asossum_d.AsVariant:=dms.asossum_d_ch.AsVariant+dms.asoscheg_d.AsVariant;

  dms.asossum_naqd.AsVariant:=dms.asossumma_ch.AsFloat-dms.asossum_d_ch.AsFloat*dms.asoskurs.AsFloat;
  dms.asossum_naqd_ch.AsVariant:=RoundTo(dms.asossum_naqd.AsFloat,-2);
  dms.asoscheg_n.AsVariant:=dms.asossum_naqd.AsVariant-dms.asossum_naqd_ch.AsVariant; farqExit(sender);
end;

procedure Tkassa_h_edit.Label5Click(Sender: TObject);
begin
  if dms.asossum_naqd_ch.AsFloat=0 then exit;
  dms.asossum_epos.AsFloat:=dms.asossum_naqd.AsFloat;
  dms.asossum_epos_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat;
  dms.asoscheg_e.AsFloat:=dms.asoscheg_n.AsFloat;
  dms.asossum_naqd.AsFloat:=0;dms.asossum_naqd_ch.AsFloat:=0;dms.asoscheg_n.AsFloat:=0;
end;

procedure Tkassa_h_edit.sum_d_chKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tkassa_h_edit.cheg_dExit(Sender: TObject);
begin
  sum_d.Value:=sum_d_ch.Value+cheg_d.Value;
  farqExit(sender);
end;

procedure Tkassa_h_edit.farqExit(Sender: TObject);
begin
  farq.Text:=FloatToStr(dms.asossumma_ch.AsFloat-(dms.asossum_d_ch.AsFloat*dms.asoskurs.AsFloat+dms.asossum_naqd_ch.AsFloat+dms.asossum_plast_ch.AsFloat+dms.asossum_click_ch.AsFloat+dms.asossum_epos_ch.AsFloat));
end;

end.







