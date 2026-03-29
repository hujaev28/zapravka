unit fNazorat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RzPrgres, Grids, DBGrids;

type
  TNazorat = class(TForm)
    Button4: TButton;
    progress: TRzProgressBar;
    s_haridor: TZQuery;
    ds_haridor: TDataSource;
    oraliq: TZQuery;
    oraliqsf_id: TIntegerField;
    oraliqost: TFloatField;
    oraliqpl_id: TIntegerField;
    oraliqvid: TSmallintField;
    Doraliq: TDataSource;
    pl: TZQuery;
    plid: TIntegerField;
    pln_pl: TIntegerField;
    pld_pl: TDateField;
    plnn: TSmallintField;
    plclient_id: TIntegerField;
    plsena_pl: TFloatField;
    plsaldo: TFloatField;
    plost_pl: TFloatField;
    plvid: TSmallintField;
    plsf: TIntegerField;
    plsf_pot: TSmallintField;
    pldel_flag: TSmallintField;
    Dpl: TDataSource;
    sf: TZQuery;
    Dsf: TDataSource;
    Memonaz: TMemo;
    hisobla: TCheckBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    plpot1: TSmallintField;
    Button1: TButton;
    Dlink: TDataSource;
    link: TZQuery;
    qarz: TZQuery;
    Dqarz: TDataSource;
    DBGrid5: TDBGrid;
    oraliqpl: TZQuery;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    IntegerField2: TIntegerField;
    SmallintField1: TSmallintField;
    Doraliqpl: TDataSource;
    DBGrid6: TDBGrid;
    jamla: TZQuery;
    Djamla: TDataSource;
    jpl: TZQuery;
    Djpl: TDataSource;
    plh_id: TIntegerField;
    plsena_d: TFloatField;
    plost_d: TFloatField;
    plinv_id: TIntegerField;
    plkonv: TIntegerField;
    jamlaid: TIntegerField;
    jamlasplid: TIntegerField;
    jamlaxnom: TStringField;
    jamlainom: TStringField;
    jamlatel: TStringField;
    jamlaqarz_s: TFloatField;
    jamlaqarz_d: TFloatField;
    jamlaqarz_b: TFloatField;
    jamlah_id: TIntegerField;
    jamlainv_id: TIntegerField;
    jamlaasos_id: TIntegerField;
    jamlatelegram: TStringField;
    jamlaemail: TStringField;
    jamlatur: TIntegerField;
    jamlasrok: TDateField;
    jamlasana: TDateField;
    jamlasend: TDateField;
    jamlabegin: TDateField;
    jamlaend: TDateField;
    jamlayaqin: TIntegerField;
    jamlagaldi: TIntegerField;
    jamlauxladi: TIntegerField;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Nazorat: TNazorat;

implementation
uses fulanish,fdms, Math;

{$R *.dfm}
procedure TNazorat.Button4Click(Sender: TObject);
var s_d,s_sf,s_b,s_pl,ost,ost_d,ost_b,echish,echish_d,echish_b,qoldiq,qoldiq_d,qoldiq_b,qpln,qpld,qplb:Currency;i:integer;
begin
  i:=1;progress.Percent:=0;
  //if cl.Active=False then cl.Open else cl.next;
  ulanish.protinout.Enabled:=False;
  s_haridor.Refresh;
  sf.Refresh;
  pl.Refresh;
  qarz.Refresh;
  oraliq.Refresh;
  oraliqpl.Refresh;
  while not s_haridor.Eof do begin
    Memonaz.Lines.Add(IntToStr(i)+';'+s_haridor.Fieldbyname('id').AsString+' ; '+s_haridor.FieldValues['nom']);
    inc(i);
    pl.First;  // ost_pl = sena_pl
    while not pl.Eof do begin
      pl.Edit;
      pl.fieldbyname('ost_pl').AsFloat:=pl.fieldbyname('sena_pl').AsFloat;
      pl.fieldbyname('ost_d').AsFloat:=pl.fieldbyname('sena_d').AsFloat;
      if pl.fieldbyname('konv').AsInteger=1 then begin
        pl.fieldbyname('ost_pl').AsFloat:=0;
        pl.fieldbyname('ost_d').AsFloat:=pl.fieldbyname('sena_d').AsFloat;
      end;
      if pl.fieldbyname('konv').AsInteger=2 then begin
        pl.fieldbyname('ost_pl').AsFloat:=pl.fieldbyname('sena_pl').AsFloat;
        pl.fieldbyname('ost_d').AsFloat:=0;
      end;
      pl.post;pl.Next;
    end;
    jamla.close;jamla.SQL.Clear;
    jamla.SQL.Add('select * from qarz WHERE splid=:id and tur=1'); //qarz_flag = 2
    jamla.Open;
    jpl.close;jpl.SQL.Clear;
    jpl.SQL.Add('select * from qarz WHERE splid=:id and tur=2'); //qarz_flag = 2
    jpl.Open;
    sf.First;
    while not sf.Eof do begin // sf eof
      oraliq.First;while not oraliq.Eof do oraliq.delete; // tozala
      echish:=0;echish_d:=0;
      pl.First;
      while (not pl.Eof) do begin //  pl eof
        if sf.fieldbyname('inv_id').AsInteger=plinv_id.AsInteger then begin
          qpln:=(sf.fieldbyname('qarz_summa').AsFloat+sf.fieldbyname('sum_epos_ch').AsFloat)-echish;
          qpld:=sf.fieldbyname('qarz_dollar').AsFloat-echish_d;
          if qpln>0 then begin
            if pl.fieldbyname('ost_pl').Value>0 then begin
              if (sf.fieldbyname('qarz_summa').AsFloat+sf.fieldbyname('sum_epos_ch').AsFloat)-echish>=pl.FieldByName('ost_pl').AsFloat then begin
                qoldiq:=pl.FieldByName('ost_pl').AsFloat;qpln:=0;end
              else
              begin
                qoldiq:=(sf.fieldbyname('qarz_summa').AsFloat+sf.fieldbyname('sum_epos_ch').AsFloat)-echish;
                qpln:=pl.FieldByName('ost_pl').AsFloat-qoldiq;
              end;
              oraliq.Insert;
              oraliq.FieldByName('sf_id').AsInteger:=sf.FieldByName('id').AsInteger;
              oraliq.FieldByName('vid').AsInteger:=1;
              oraliq.FieldByName('pl_id').AsInteger:=pl.FieldByName('id').AsInteger;
              oraliq.FieldByName('ost').AsFloat:=qoldiq;
              oraliq.Post;
              echish:=echish+qoldiq;
              pl.Edit;pl.FieldByName('ost_pl').AsFloat:=qpln;
              pl.FieldByName('pot1').AsInteger:=1;pl.Post;
            end;
          end; // qpln>0
          if qpld>0 then begin
            if pl.fieldbyname('ost_d').Value>0 then begin
              if sf.FieldByName('qarz_dollar').AsFloat-echish_d>=pl.FieldByName('ost_d').AsFloat then begin
                qoldiq_d:=pl.FieldByName('ost_d').AsFloat;qpld:=0;end
              else
              begin
                qoldiq_d:=sf.FieldByName('qarz_dollar').AsFloat-echish_d;
                qpld:=pl.FieldByName('ost_d').AsFloat-qoldiq_d;
              end;
              oraliq.Insert;
              oraliq.FieldByName('sf_id').AsInteger:=sf.FieldByName('id').AsInteger;
              oraliq.FieldByName('vid').AsInteger:=1;
              oraliq.FieldByName('pl_id').AsInteger:=pl.FieldByName('id').AsInteger;
              oraliq.FieldByName('ost').AsFloat:=qoldiq_d;
              oraliq.Post;
              echish_d:=echish_d+qoldiq_d;
              pl.Edit;pl.FieldByName('ost_d').AsFloat:=qpld;
              pl.FieldByName('pot1').AsInteger:=1;pl.Post;
           end;
          end; // dpl>0
        end; // inv_id
        pl.Next;
      end;// pl eof
      sf.Edit;
      sf.FieldByName('qarz_s_ost').AsFloat:=(sf.fieldbyname('qarz_summa').AsFloat+sf.fieldbyname('sum_epos_ch').AsFloat)-echish;
      sf.FieldByName('qarz_d_ost').AsFloat:=sf.FieldByName('qarz_dollar').AsFloat-echish_d;
      sf.Post;
      if jamla.RecordCount=0 then
         jamla.Insert
      else
         jamla.edit;
      jamla.FieldByName('splid').AsInteger:=sf.FieldByName('id').AsInteger;
      jamla.FieldByName('sana').AsFloat:=sf.FieldByName('sana').AsFloat;
      jamla.FieldByName('qarz_s').AsFloat:=sf.FieldByName('qarz_s_ost').AsFloat;
      jamla.FieldByName('qarz_d').AsFloat:=sf.FieldByName('qarz_d_ost').AsFloat;
      jamla.FieldByName('splid').AsInteger:=sf.FieldByName('id').AsInteger;
      jamla.FieldByName('h_id').AsInteger:=sf.FieldByName('h_id').AsInteger;
      jamla.FieldByName('inv_id').AsInteger:=sf.FieldByName('inv_id').AsInteger;
      jamla.FieldByName('asos_id').AsInteger:=sf.FieldByName('id').AsInteger;
      jamla.FieldByName('tur').AsInteger:=1;
      dms.s_haridor.locate('id',sf.FieldByName('h_id').AsInteger,[loCaseInsensitive]);
      dms.ts_inv.locate('id',sf.FieldByName('inv_id').AsInteger,[loCaseInsensitive]);
      jamla.FieldByName('xnom').AsString:=dms.s_haridor.FieldByName('nom').AsString;
      if sf.FieldByName('inv_id').AsInteger>0 then
        jamla.FieldByName('inom').AsString:=dms.ts_inv.FieldByName('nom').AsString
      else
        jamla.FieldByName('inom').AsVariant:=null;
      jamla.FieldByName('tel').AsString:=dms.s_haridor.FieldByName('telsms1').AsString;
      if sf.FieldByName('srok').AsString='' then
        jamla.FieldByName('srok').AsVariant:=null
      else
        jamla.FieldByName('srok').AsDateTime:=sf.FieldByName('srok').AsDateTime;

      jamla.post;
      sf.Next;//exit;
    end; // sf
    qarz.First;
    while not qarz.Eof do begin // sf eof
      oraliqpl.First;while not oraliqpl.Eof do oraliqpl.delete; // tozala
      echish:=0;echish_d:=0;
      pl.First;
      while (not pl.Eof) do begin
        if qarz.fieldbyname('inv_id').AsInteger=plinv_id.AsInteger then begin
          qpln:=qarz.fieldbyname('sena_pl').AsFloat-echish;
          qpld:=qarz.fieldbyname('sena_d').AsFloat-echish_d;

          if qpln>0 then begin
            if pl.fieldbyname('ost_pl').Value>0 then begin
              if qarz.FieldByName('sena_pl').AsFloat-echish>=pl.FieldByName('ost_pl').AsFloat then begin
                qoldiq:=pl.FieldByName('ost_pl').AsFloat;qpln:=0;end
              else
              begin
                qoldiq:=pl.FieldByName('sena_pl').AsFloat-echish;
                qpln:=pl.FieldByName('ost_pl').AsFloat-qoldiq;
              end;
              oraliqpl.Insert;
              oraliqpl.FieldByName('sf_id').AsInteger:=qarz.FieldByName('id').AsInteger;
              oraliqpl.FieldByName('vid').AsInteger:=2;
              oraliqpl.FieldByName('pl_id').AsInteger:=pl.FieldByName('id').AsInteger;
              oraliqpl.FieldByName('ost').AsFloat:=qoldiq;
              oraliqpl.Post;
              echish:=echish+qoldiq;
              pl.Edit;
              pl.FieldByName('ost_pl').AsFloat:=qpln;
              pl.FieldByName('pot1').AsInteger:=1;
              pl.Post;
            end;
          end; // qpln
          if qpld>0 then begin
            if pl.fieldbyname('ost_d').Value>0 then begin
              if qarz.FieldByName('sena_d').AsFloat-echish_d>=pl.FieldByName('ost_d').AsFloat then begin
                qoldiq_d:=pl.FieldByName('ost_d').AsFloat;qpld:=0;end
              else
              begin
                qoldiq_d:=pl.FieldByName('sena_d').AsFloat-echish_d;
                qpld:=pl.FieldByName('ost_d').AsFloat-qoldiq_d;
              end;
              oraliqpl.Insert;
              oraliqpl.FieldByName('sf_id').AsInteger:=qarz.FieldByName('id').AsInteger;
              oraliqpl.FieldByName('vid').AsInteger:=2;
              oraliqpl.FieldByName('pl_id').AsInteger:=pl.FieldByName('id').AsInteger;
              oraliqpl.FieldByName('ost').AsFloat:=qoldiq_d;
              oraliqpl.Post;
              echish_d:=echish_d+qoldiq_d;
              pl.Edit;
              pl.FieldByName('ost_d').AsFloat:=qpld;
              pl.FieldByName('pot1').AsInteger:=1;pl.Post;
            end;
          end;// qpld
        end; // inv_id
        pl.Next;
      end;// pl eof

      qarz.Edit;
      qarz.FieldByName('ost_pl').AsFloat:=qarz.FieldByName('sena_pl').AsFloat-echish;
      qarz.FieldByName('ost_d').AsFloat:=qarz.FieldByName('sena_d').AsFloat-echish_d;
      qarz.Post;
      if jpl.RecordCount=0 then
          jpl.Insert
      else
          jpl.edit;
      jpl.FieldByName('splid').AsInteger:=qarz.FieldByName('id').AsInteger;
      jpl.FieldByName('sana').AsFloat:=qarz.FieldByName('sana').AsFloat;
      jpl.FieldByName('qarz_s').AsFloat:=qarz.FieldByName('ost_pl').AsFloat;
      jpl.FieldByName('qarz_d').AsFloat:=qarz.FieldByName('ost_d').AsFloat;
      jpl.FieldByName('h_id').AsInteger:=qarz.FieldByName('h_id').AsInteger;
      jpl.FieldByName('inv_id').AsInteger:=qarz.FieldByName('inv_id').AsInteger;
      jpl.FieldByName('asos_id').AsInteger:=qarz.FieldByName('asos_id').AsInteger;
      jpl.FieldByName('tur').AsInteger:=2;
      dms.s_haridor.locate('id',qarz.FieldByName('h_id').AsInteger,[loCaseInsensitive]);
      dms.ts_inv.locate('id',qarz.FieldByName('inv_id').AsInteger,[loCaseInsensitive]);
      jpl.FieldByName('xnom').AsString:=dms.s_haridor.FieldByName('nom').AsString;
      jpl.FieldByName('tel').AsString:=dms.s_haridor.FieldByName('telsms1').AsString;
      if jpl.FieldByName('inv_id').AsInteger>0 then
        jpl.FieldByName('inom').AsString:=dms.ts_inv.FieldByName('nom').AsString
      else
        jpl.FieldByName('inom').AsVariant:=null;
      if qarz.FieldByName('srok').AsString='' then
        jpl.FieldByName('srok').AsVariant:=null
      else
        jpl.FieldByName('srok').AsDateTime:=qarz.FieldByName('srok').AsDateTime;
      jpl.post;
      qarz.Next;
    end; // qarz
    s_haridor.edit;
    s_haridor.fieldbyname('qarz_flag').Value:=2;
    s_haridor.post;
    progress.Percent:=Trunc((s_haridor.RecNo)/s_haridor.RecordCount*100);
    s_haridor.Next;
  end; // haridor
  sf.Refresh;
  pl.Refresh;
  qarz.Refresh;
  oraliq.Refresh;
  oraliqpl.Refresh;
  ulanish.protinout.Enabled:=true;
end;

procedure TNazorat.Button1Click(Sender: TObject);
begin
  link.close;link.SQL.Clear;
  link.SQL.Add('UPDATE s_haridor SET qarz_flag = 1 WHERE id>0'); //qarz_flag = 2
  link.ExecSQL;
  s_haridor.Refresh;
end;

procedure TNazorat.FormActivate(Sender: TObject);
begin
  s_haridor.open;
  sf.open;
  pl.open;
  qarz.open;
  oraliq.open;
  oraliqpl.open;
end;

end.
