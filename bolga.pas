unit bolga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, ComCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    lbd: TZConnection;
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
    s_t_allkol_in: TSmallintField;
    s_t_allizm1: TSmallintField;
    s_t_allturi: TSmallintField;
    s_t_allresept: TSmallintField;
    s_t_allaniq: TFloatField;
    s_t_allminimal: TFloatField;
    s_t_allmaksimal: TFloatField;
    s_t_allsotish: TFloatField;
    s_t_alldel_flag: TSmallintField;
    s_t_allupakavka: TIntegerField;
    s_t_alluser_id: TSmallintField;
    s_t_allclient_id: TIntegerField;
    s_t_allchangedate: TDateTimeField;
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
    Ds_t_all: TDataSource;
    link: TZQuery;
    Dlink: TDataSource;
    main_link: TZQuery;
    Dmain_link: TDataSource;
    qoldiq: TZQuery;
    StringField32: TStringField;
    DateField7: TDateField;
    SmallintField9: TSmallintField;
    StringField33: TStringField;
    IntegerField21: TIntegerField;
    SmallintField10: TSmallintField;
    qoldiqsotish: TFloatField;
    qoldiqkol_in: TSmallintField;
    qoldiqturi: TSmallintField;
    qoldiqresept: TSmallintField;
    qoldiqs_izm: TStringField;
    qoldiqjami: TStringField;
    qoldiqs_diler: TStringField;
    qoldiqqrkod: TSmallintField;
    qoldiqs_qrkod: TStringField;
    qoldiquser_id: TIntegerField;
    qoldiqchangedate: TDateTimeField;
    qoldiqseriya: TStringField;
    qoldiqsena_in: TFloatField;
    qoldiqsotish_in: TFloatField;
    qoldiqizm1: TSmallintField;
    qoldiqs_nomer: TStringField;
    qoldiqs_izm1: TStringField;
    qoldiqsumma_in: TFloatField;
    qoldiqsumma_all: TFloatField;
    qoldiqkol_ost: TIntegerField;
    qoldiqkol_in_ost: TIntegerField;
    qoldiqsumma: TFloatField;
    qoldiqizm_id: TSmallintField;
    qoldiqtulov_id: TIntegerField;
    qoldiqsena: TFloatField;
    qoldiqtovar_id: TIntegerField;
    qoldiqs_sana: TStringField;
    qoldiqid: TIntegerField;
    qoldiqs_tovar: TStringField;
    qoldiqfoyda: TFloatField;
    qoldiqfoiz: TFloatField;
    qoldiqfoiz_in: TFloatField;
    qoldiqzavod: TStringField;
    qoldiqpolka: TStringField;
    qoldiqkol: TIntegerField;
    qoldiqsena_d: TFloatField;
    qoldiqsena_in_d: TFloatField;
    qoldiqsotish_d: TFloatField;
    qoldiqsotish_in_d: TFloatField;
    qoldiqzakaz: TDateTimeField;
    qoldiqzakaz_ok: TDateTimeField;
    qoldiqzakaz_end: TDateTimeField;
    qoldiqzakaz_print: TSmallintField;
    qoldiqzakaz_gapir: TIntegerField;
    qoldiqfoiz_ch2: TFloatField;
    qoldiqfoiz_schet: TFloatField;
    qoldiqfoiz_opt1: TFloatField;
    qoldiqfoiz_opt2: TFloatField;
    qoldiqopt1: TFloatField;
    qoldiqopt1_pl: TFloatField;
    qoldiqopt1_pl_in: TFloatField;
    qoldiqopt2: TFloatField;
    qoldiqopt2_pl: TFloatField;
    qoldiqopt2_in: TFloatField;
    qoldiqopt2_pl_in: TFloatField;
    qoldiqschet: TFloatField;
    qoldiqschet_in: TFloatField;
    qoldiqch2_in: TFloatField;
    qoldiqopt1_in: TFloatField;
    Dqoldiq: TDataSource;
    xPrBar: TProgressBar;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var kol,kol_in,kol_jami,ost_jami,itog:integer;
begin
  memo1.Visible:=true;memo1.Lines.Clear;memo1.Lines.Add('Tovarlarning qoldiqlarini qayta hisoblash jarayoni boshlandi');
  memo1.Lines.Add('Iltimos kutib turing !!!');
  s_t_all.Close;s_t_all.SQL.Clear;
  s_t_all.SQL.Add('select * from s_tovar WHERE del_flag=1 and (upakavka=2 or upakavka is null ) order by id');
  s_t_all.open;
  xPrBar.Position:=0;xPrBar.Max:=s_t_all.RecordCount;
  while not s_t_all.Eof do begin
  xPrBar.Position:=s_t_all.RecNo;
  memo1.Lines.Add(' tovar '+s_t_allid.AsString+' nom '+s_t_allnom.AsString);
  link.Close;link.SQL.Clear;
  link.SQL.Add('select s.id,s.kol,s.kol_ost,s.kol_in,s.tovar_id from asos a,asos_slave s WHERE s.tovar_id = '+s_t_allid.AsString+' and a.id=s.asos_id and s.del_flag=1 and a.tur_oper=2 order by s.id');
  link.open;
  qoldiq.Close;qoldiq.SQL.Clear;
  qoldiq.SQL.Add('UPDATE asos_slave s INNER JOIN asos a ON a.id = s.asos_id SET s.kol_ost=0,s.kol_in_ost=0 WHERE a.tur_oper in (2) and s.tovar_id = '+s_t_allid.AsString+' and s.del_flag=1');
  qoldiq.ExecSQL;
  qoldiq.Close;qoldiq.SQL.Clear;
  qoldiq.SQL.Add('UPDATE asos_slave s INNER JOIN asos a ON a.id = s.asos_id SET s.kol_ost=s.kol,s.kol_in_ost=s.kol_in WHERE a.tur_oper in (1,4,5) and s.tovar_id = '+s_t_allid.AsString+' and s.del_flag=1');
  qoldiq.ExecSQL;itog:=0;
  //memo1.Lines.Add(dms.qoldiq.SQL.Text);exit;
  while not link.Eof do begin
    kol_jami:=link.fieldbyname('kol').AsInteger*s_t_allkol_in.AsInteger+link.fieldbyname('kol_in').AsInteger;
    itog:=itog+kol_jami;
    kol:=link.FieldByName('kol').AsInteger;
    kol_in:=link.FieldByName('kol_in').AsInteger;
    qoldiq.Close;qoldiq.SQL.Clear;
    qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in from s_tovar t,asos_slave a,asos WHERE a.tovar_id = '+s_t_allid.AsString+' and (a.kol_ost>0 or a.kol_in_ost>0) and a.del_flag=1 and asos.tur_oper in (1,4,5) and a.asos_id=asos.id and a.tovar_id=t.id order by a.id ');
    qoldiq.open;
    if not qoldiq.locate('id',link.fieldbyname('kol_ost').AsInteger,[loCaseInsensitive]) then
    qoldiq.first;
    while (not qoldiq.Eof) and (kol_jami>0) do begin
      ost_jami:=qoldiqkol_ost.AsInteger*s_t_allkol_in.AsInteger+qoldiqkol_in_ost.AsInteger;
      qoldiq.Edit;
      if kol_jami>=ost_jami then begin
        kol_jami := kol_jami-ost_jami;
        ost_jami:=0;
        qoldiqkol_ost.AsInteger:=0;
        qoldiqkol_in_ost.Value:=0;
      end
      else
      begin
        ost_jami:=ost_jami - kol_jami;
        qoldiqkol_ost.AsInteger:=Trunc(ost_jami / s_t_allkol_in.AsInteger);
        qoldiqkol_in_ost.Value:=ost_jami - qoldiqkol_ost.Value*s_t_allkol_in.AsInteger;
        kol_jami := 0;
      end;
      main_link.Close;main_link.SQL.Clear;
      main_link.SQL.Add('UPDATE asos_slave SET kol_ost='+qoldiqid.AsString+',kol_in_ost='+IntToStr(kol_jami)+' WHERE id='+link.fieldbyname('id').AsString);
      main_link.ExecSQL;
      qoldiq.Post;
      qoldiq.Next;
    end;
    link.Next;
  end;
  main_link.Close;main_link.SQL.Clear;
  main_link.SQL.Add('select sum(s.kol) as kol,sum(s.kol_in) as kol_in,sum(s.kol_ost) as kol_ost,sum(s.kol_in_ost) as kol_in_ost from asos_slave s,asos a where a.id = s.asos_id and a.tur_oper in (1,4,5) and s.tovar_id = '+s_t_allid.AsString+' and s.del_flag=1 group by s.tovar_id');
  main_link.Open;
  itog:=main_link.FieldByName('kol').AsInteger*s_t_allkol_in.AsInteger+main_link.FieldByName('kol_in').AsInteger-itog;
  if (itog<>main_link.FieldByName('kol_ost').AsInteger*s_t_allkol_in.AsInteger+main_link.FieldByName('kol_in_ost').AsInteger ) then
  begin
    memo1.Lines.Add(' tovar '+s_t_allnom.AsString+'='+IntToStr(itog)+'<> '+inttostr(main_link.FieldByName('kol_ost').AsInteger*s_t_allkol_in.AsInteger+main_link.FieldByName('kol_in_ost').AsInteger ));
    s_t_all.Edit;s_t_allupakavka.AsInteger:=2;s_t_all.Post;
    //Exit;
  end
  else
  begin
    s_t_all.Edit;s_t_allupakavka.AsInteger:=5;s_t_all.Post;
  end;
  s_t_all.Next;
  end; //dms.s_t_all

  memo1.Lines.Add('Jarayon tugadi');

end;

end.
