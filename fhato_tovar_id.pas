unit fhato_tovar_id;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, Mask, DBCtrls, RzPrgres,
  RzButton;

type
  Thato = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Button2: TButton;
    test: TRzBitBtn;
    qoldiq_tekshir: TRzBitBtn;
    t_id: TEdit;
    progressl_lk: TRzProgressBar;
    Memo1: TMemo;
    s_t_all: TZQuery;
    s_t_allid: TIntegerField;
    s_t_allnom: TStringField;
    s_t_allnom_ru: TStringField;
    s_t_allnom_sh: TStringField;
    s_t_allshtrix: TStringField;
    s_t_allqr: TStringField;
    s_t_allshtrixkod: TSmallintField;
    s_t_allqrkod: TSmallintField;
    s_t_allizm_id: TSmallintField;
    s_t_allizm1: TSmallintField;
    s_t_allturi: TSmallintField;
    s_t_allresept: TSmallintField;
    s_t_allaniq: TFloatField;
    s_t_allminimal: TFloatField;
    s_t_allmaksimal: TFloatField;
    s_t_allsotish: TFloatField;
    s_t_allzavod_id: TIntegerField;
    s_t_alldel_flag: TSmallintField;
    s_t_allupakavka: TIntegerField;
    s_t_alluser_id: TSmallintField;
    s_t_allclient_id: TIntegerField;
    s_t_allchangedate: TDateTimeField;
    s_t_allzavod: TStringField;
    s_t_allshtrix_in: TStringField;
    s_t_alltz_id: TSmallintField;
    s_t_allkg: TSmallintField;
    s_t_allshtrix_full: TStringField;
    s_t_allshtrix1: TStringField;
    s_t_allshtrix2: TStringField;
    s_t_allkat: TSmallintField;
    s_t_allbrend: TSmallintField;
    s_t_allpapka: TIntegerField;
    s_t_allshakl: TStringField;
    s_t_allinternom: TStringField;
    s_t_allmajbur_dori_id: TIntegerField;
    s_t_allmiqdor: TSmallintField;
    s_t_allshart: TSmallintField;
    s_t_allustama: TFloatField;
    s_t_allulg1: TFloatField;
    s_t_allulg1_pl: TFloatField;
    s_t_allulg2: TFloatField;
    s_t_allulg2_pl: TFloatField;
    s_t_allbank: TFloatField;
    s_t_allsena: TFloatField;
    s_t_allsena_d: TFloatField;
    s_t_allsena_in_d: TFloatField;
    s_t_allsotish_d: TFloatField;
    s_t_allkol_in: TSmallintField;
    s_t_allqoldiq: TStringField;
    s_t_allholat: TIntegerField;
    asos_slave: TZQuery;
    Dasos_slave: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure testClick(Sender: TObject);
    procedure qoldiq_tekshirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  hato: Thato;
  kirim_s,kirim_d,sotish,sotish_d,sotish_in,sotish_in_d,ulg1,ulg1_pl,ulg2,ulg2_pl,schet:currency;

implementation

{$R *.dfm}
uses fdms;
procedure add_ombor;
var k,k_in:integer;
begin
  DMS.tombor.Append;
  DMS.tombor.FieldByName('id').AsInteger:=dms.link.fieldbyname('id').AsInteger;
  DMS.tombor.FieldByName('tovar_id').AsInteger:=dms.link.fieldbyname('tovar_id').AsInteger;
  DMS.tombor.FieldByName('t_in').AsInteger:=dms.link.fieldbyname('t_in').AsInteger;
  if dms.link.fieldbyname('t_in').AsInteger<1 then DMS.tombor.FieldByName('t_in').AsInteger:=1;
  //DMS.tombor.FieldByName('zavod_nom').AsString:='';
  DMS.tombor.FieldByName('nom').AsString:=dms.link.fieldbyname('nom').AsString;
  DMS.tombor.FieldByName('nom_sh').AsString:=dms.link.fieldbyname('nom_sh').AsString;
  DMS.tombor.FieldByName('kat').AsString:=dms.link.fieldbyname('knom').AsString;
  DMS.tombor.FieldByName('kirim').AsFloat:=kirim_s;
  DMS.tombor.FieldByName('kirim_d').AsFloat:=kirim_d;
  DMS.tombor.FieldByName('dollar').AsInteger:=dms.link.fieldbyname('kesak').AsInteger;
  DMS.tombor.FieldByName('kurs').AsFloat:=dms.link.fieldbyname('kesakd').AsFloat;
  if dms.link.fieldbyname('sana').AsVariant=null then
    DMS.tombor.FieldByName('sana').AsVariant:=null
  else
    DMS.tombor.FieldByName('sana').AsDateTime:=dms.link.fieldbyname('sana').AsDateTime;
  DMS.tombor.FieldByName('kir_all').AsInteger:=dms.link.fieldbyname('kol_in').AsInteger+dms.link.fieldbyname('kol').AsInteger*dms.link.fieldbyname('t_in').AsInteger;;
  if (dms.s_clientqoldiq.AsInteger=1) and (hato.s_t_all.fieldbyname('qoldiq').AsString='Y') then begin
    k:=Trunc(DMS.tombor.FieldByName('kir_all').AsInteger / hato.s_t_allkol_in.AsInteger); // 20
    k_in:=DMS.tombor.FieldByName('kir_all').AsInteger - k*hato.s_t_allkol_in.AsInteger;  // 0
    DMS.tombor.FieldByName('kol').AsInteger:=k;
    DMS.tombor.FieldByName('kol_in').AsInteger:=k_in;
    DMS.tombor.FieldByName('kol_all').AsInteger:=k*hato.s_t_allkol_in.AsInteger+k_in;
    DMS.tombor.FieldByName('qoldiq').AsVariant:=1
  end
  else
  begin
    DMS.tombor.FieldByName('kol').AsInteger:=0;
    DMS.tombor.FieldByName('kol_in').AsInteger:=0;
    DMS.tombor.FieldByName('kol_all').AsInteger:=0;
    DMS.tombor.FieldByName('qoldiq').AsVariant:=2;
  end;
  DMS.tombor.FieldByName('polka').AsString:=dms.link.fieldbyname('polka').AsString;
  DMS.tombor.FieldByName('seriya').AsString:=dms.link.fieldbyname('seriya').AsString;
  if dms.link.fieldbyname('srok').AsVariant=null then
    DMS.tombor.FieldByName('srok').AsVariant:=null
  else
    DMS.tombor.FieldByName('srok').AsDateTime:=dms.link.fieldbyname('srok').AsDateTime;

  DMS.tombor.FieldByName('sotish').AsFloat:=sotish;
  DMS.tombor.FieldByName('sotish_d').AsFloat:=sotish_d;
  DMS.tombor.FieldByName('sotish_in').AsFloat:=sotish_in;
  DMS.tombor.FieldByName('sotish_in_d').AsFloat:=sotish_in_d;
  DMS.tombor.FieldByName('ulg1').AsFloat:=ulg1;
  DMS.tombor.FieldByName('ulg1_pl').AsFloat:=ulg1_pl;
  DMS.tombor.FieldByName('ulg2').AsFloat:=ulg2;
  DMS.tombor.FieldByName('ulg2_pl').AsFloat:=ulg2_pl;
  DMS.tombor.FieldByName('schet').AsFloat:=schet;
  DMS.tombor.post;
end;
procedure Thato.Button1Click(Sender: TObject);
begin
  if Edit1.Text<>'123456' then exit;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select * from asos_slave');
  dms.main_link.Open;

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select s.id,s.asos_id,a.sana,a.changedate,a.h_id from asos a left join asos_slave s on a.id=s.asos_id where a.h_id is not null and  a.tur_oper=2 and sana BETWEEN "2018-09-01" and "2022-09-01" ORDER BY `s`.`id` DESC');
  dms.link.Open;
  while not dms.link.Eof do  begin
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('delete from asos_slave where id='+dms.link.fieldbyname('id').AsString);
    dms.main_link.ExecSQL;
    dms.link.Next;
  end;
end;

procedure Thato.Button2Click(Sender: TObject);
begin
  if Edit1.Text<>'123456' then exit;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select id from asos_slave');
  dms.main_link.Open;

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id from asos where tur_oper=2 ');
  dms.link.Open;
  while not dms.link.Eof do  begin
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('delete from asos_slave where asos_id='+dms.link.fieldbyname('id').AsString);
    dms.main_link.ExecSQL;
    dms.link.Delete;
  end;

end;

procedure Thato.testClick(Sender: TObject);
var kam,sot,limit:integer;s_t_id:string;
begin
  memo1.Visible:=true;memo1.Lines.Clear;memo1.Refresh;
  memo1.Lines.Add('Tovarlarning qoldiqlarini qayta hisoblash jarayoni boshlandi');
  memo1.Lines.Add('Iltimos kutib turing !!!');
  s_t_all.Close;s_t_all.SQL.Clear;
  if t_id.Text<>'' then s_t_id:=' id='+t_id.Text+' and ' else s_t_id:='';
  s_t_all.SQL.Add('select * from s_tovar WHERE '+s_t_id +' del_flag=1 order by id');
  s_t_all.open;
  dms.tombor.Refresh;
  while not s_t_all.Eof do begin
    progressl_lk.Percent:=Trunc((s_t_all.RecNo)/s_t_all.RecordCount*100);
    if (dms.s_clientqoldiq.AsInteger=1) and (s_t_allholat.AsInteger=1) then begin
    if s_t_allqoldiq.AsString='Y' then begin
      dms.main_link.Close;dms.main_link.SQL.Clear;
      dms.main_link.SQL.Add('select sum(a.kol) as kol_1,sum(a.kol_in) as kol_in_1 from s_tovar t,asos_slave a,asos ');
      dms.main_link.SQL.Add('WHERE a.del_flag=1 and asos.tur_oper in (2,4) and a.asos_id=asos.id and t.id=a.tovar_id and a.tovar_id='+s_t_allid.AsString+' group by a.tovar_id order by a.tovar_id');
      dms.main_link.open;
      sot:=dms.main_link.fieldbyname('kol_1').AsInteger*s_t_allkol_in.AsInteger+dms.main_link.fieldbyname('kol_in_1').AsInteger;
      dms.main_link.Close;dms.main_link.SQL.Clear;
      dms.main_link.SQL.Add('SELECT sum(kol) as kol_1,sum(kol_in) as kol_in_1 from ombor where tovar_id='+s_t_allid.AsString+' GROUP by nom order by nom desc;');
      dms.main_link.open;
      limit:=dms.main_link.fieldbyname('kol_1').AsInteger*s_t_allkol_in.AsInteger+dms.main_link.fieldbyname('kol_in_1').AsInteger;
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('select sum(a.kol) as kol_1,sum(a.kol_in) as kol_in_1,t.nom as nom from s_tovar t,asos_slave a,asos ');
      dms.link.SQL.Add('WHERE a.del_flag=1 and asos.tur_oper in (1,5) and a.asos_id=asos.id and t.id=a.tovar_id and a.tovar_id='+s_t_allid.AsString+' group by a.tovar_id order by a.tovar_id');
      dms.link.open;
      kam:=dms.link.fieldbyname('kol_1').AsInteger*s_t_allkol_in.AsInteger+dms.link.fieldbyname('kol_in_1').AsInteger;
      if kam-sot<>limit then begin
        Memo1.Visible:=true;
        memo1.Lines.add('Xatolik:  '+s_t_allid.AsString+' '+s_t_allnom.AsString+' = '+IntToStr(kam-sot)+' <> '+inttostr(limit));
        //exit;
      end;
    end;
    end
    else
    begin
      if (s_t_allholat.AsInteger=0) and (dms.tombor.Locate('tovar_id',s_t_allid.AsInteger,[loCaseInsensitive])) then begin
        Memo1.Visible:=true;
        memo1.Lines.add(' 1/Xatolik:  '+s_t_allid.AsString+' '+s_t_allnom.AsString);
        //exit;
      end;
    end;
    s_t_all.Next;
  end;
  memo1.Lines.Add('Jarayon tugadi, sabr uchun rahmat  !!!');
end;

procedure Thato.qoldiq_tekshirClick(Sender: TObject);
var kam,sot,limit,k,k_in:integer;s_t_id:string;
begin
  memo1.Visible:=true;memo1.Lines.Clear;memo1.Refresh;
  memo1.Lines.Add('Tovarlarning qoldiqlarini qayta hisoblash jarayoni boshlandi');
  memo1.Lines.Add('Iltimos kutib turing !!!');
  if t_id.Text<>'-' then begin
    s_t_all.Close;s_t_all.SQL.Clear;
    if t_id.Text<>'' then s_t_id:=' id='+t_id.Text+' and ' else s_t_id:='';
    s_t_all.SQL.Add('select * from s_tovar WHERE '+s_t_id +' del_flag=1 and holat=1 order by id');
    s_t_all.open;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    if t_id.Text<>'' then
      dms.main_link.SQL.Add('delete from ombor WHERE tovar_id='+t_id.Text)
    else
      dms.main_link.SQL.Add('TRUNCATE TABLE ombor');
    dms.main_link.ExecSQL;dms.tombor.Refresh;
  end;Memo1.Visible:=true;
  while not s_t_all.Eof do begin
    progressl_lk.Percent:=Trunc((s_t_all.RecNo)/s_t_all.RecordCount*100);
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select sum(a.kol) as kol_1,sum(a.kol_in) as kol_in_1 from s_tovar t,asos_slave a,asos ');
    dms.main_link.SQL.Add('WHERE a.del_flag=1 and asos.tur_oper in (2,4) and a.asos_id=asos.id and t.id=a.tovar_id and a.tovar_id='+s_t_allid.AsString+' group by a.tovar_id order by a.tovar_id');
    //Memo1.Visible:=true;memo1.Lines.add(dms.main_link.SQL.Text);exit;
    dms.main_link.open;
    //memo1.Lines.add(s_t_allnom.AsString);
    sot:=dms.main_link.fieldbyname('kol_1').AsInteger*s_t_allkol_in.AsInteger+dms.main_link.fieldbyname('kol_in_1').AsInteger;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select a.*,t.kol_in as t_in,t.nom as nom,t.nom_sh as nom_sh,asos.sana,s_kat.nom as knom,asos.dollar as kesak,asos.kurs as kesakd from asos_slave a,asos,s_tovar t left JOIN s_kat ON s_kat.id = t.kat ');
    dms.link.SQL.Add('WHERE a.del_flag=1 and asos.tur_oper in (1,5) and a.asos_id=asos.id and t.id=a.tovar_id and a.tovar_id='+s_t_allid.AsString+' order by a.id desc');
    dms.link.open;
    kirim_s:=dms.link.fieldbyname('sena').AsFloat;
    kirim_d:=dms.link.fieldbyname('sena_d').AsFloat;
    sotish:=dms.link.fieldbyname('sotish').AsFloat;
    sotish_d:=dms.link.fieldbyname('sotish_d').AsFloat;
    sotish_in:=dms.link.fieldbyname('sotish_in').AsFloat;
    sotish_in_d:=dms.link.fieldbyname('sotish_in_d').AsFloat;
    ulg1:=dms.link.fieldbyname('opt1').AsFloat;
    ulg1_pl:=dms.link.fieldbyname('opt1_pl').AsFloat;
    ulg2:=dms.link.fieldbyname('opt2').AsFloat;
    ulg2_pl:=dms.link.fieldbyname('opt2_pl').AsFloat;
    schet:=dms.link.fieldbyname('schet').AsFloat;
    limit:=0;
    if (dms.s_clientqoldiq.AsInteger=0) or (s_t_allqoldiq.AsString<>'Y') then begin
      if not dms.tombor.locate('id',dms.link.fieldbyname('id').AsInteger,[loCaseInsensitive]) then add_ombor;
    end
    else
    begin
      if dms.link.RecordCount>0 then begin
        while not dms.link.eof do begin
          limit:=limit+dms.link.fieldbyname('kol').AsInteger*s_t_allkol_in.AsInteger+dms.link.fieldbyname('kol_in').AsInteger;
          dms.link.Next;
        end;
        dms.link.first;
        if (sot>limit) and (s_t_allqoldiq.AsString='Y') then begin
          Memo1.Visible:=true; memo1.Lines.add('Xatolik '+s_t_allid.AsString+' '+s_t_allnom.AsString+' - '+inttostr(sot)+'>'+inttostr(limit));
          asos_slave.Close;asos_slave.SQL.Clear;
          asos_slave.SQL.Add('select * from asos_slave where tovar_id=  '+s_t_allid.AsString);
          asos_slave.open;
          //t_id.Text:='-';exit;
        end;
        if (s_t_allqoldiq.AsString<>'Y') then begin
          if not dms.tombor.locate('id',dms.link.fieldbyname('id').AsInteger,[loCaseInsensitive]) then add_ombor;
        end;
        while not dms.link.eof do begin
          if not dms.tombor.locate('id',dms.link.fieldbyname('id').AsInteger,[loCaseInsensitive]) then add_ombor;
          kam:=dms.tombor.fieldbyname('kol_all').AsInteger;
          if sot>kam then begin
            dms.tombor.edit;dms.tombor.fieldbyname('kol').AsInteger:=0;dms.tombor.fieldbyname('kol_in').AsInteger:=0;
            dms.tombor.fieldbyname('kol_all').AsInteger:=0;
            dms.tombor.Post;sot:=sot-kam;
          end
          else
          begin
            sot:=kam-sot;k:=Trunc(sot / s_t_allkol_in.AsInteger);k_in:=sot - k*s_t_allkol_in.AsInteger;
            dms.tombor.edit;dms.tombor.fieldbyname('kol').AsInteger:=k;dms.tombor.fieldbyname('kol_in').AsInteger:=k_in;
            dms.tombor.fieldbyname('kol_all').AsInteger:=sot;dms.tombor.Post;sot:=0;
          end;
          dms.link.Next;
        end; // while
      end; //record >0
    end; // qoldiq=0

    Application.ProcessMessages;
    s_t_all.Next;
  end; // tovar
  t_id.Text:='';
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('delete from ombor WHERE qoldiq=1 and kol_all=0');
  dms.main_link.ExecSQL;
  while not dms.main_link.Eof do begin
    dms.main_link.Edit;
    //dms.main_link.fieldbyname('kirim').AsFloat:=kirim;
    //dms.main_link.fieldbyname('kirim_d').AsFloat:=kirim_d;
    dms.main_link.fieldbyname('sotish').AsFloat:=sotish;
    dms.main_link.fieldbyname('sotish_d').AsFloat:=sotish_d;
    dms.main_link.fieldbyname('sotish_in').AsFloat:=sotish_in;
    dms.main_link.fieldbyname('sotish_in_d').AsFloat:=sotish_in_d;
    dms.main_link.fieldbyname('ulg1').AsFloat:=ulg1;
    dms.main_link.fieldbyname('ulg1_pl').AsFloat:=ulg1_pl;
    dms.main_link.fieldbyname('ulg2').AsFloat:=ulg2;
    dms.main_link.fieldbyname('ulg2_pl').AsFloat:=ulg2_pl;
    dms.main_link.fieldbyname('schet').AsFloat:=schet;
    dms.main_link.Post;
    dms.main_link.Next;
  end;
  dms.tombor.Refresh;
  memo1.Lines.Add('Jarayon tugadi, sabr uchun rahmat  !!!');
end;

end.
