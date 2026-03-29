unit foshxona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GridsEh, DBGridEh, ExtCtrls, RzButton, MPlayer;

type
  Toshxona = class(TForm)
    taomlar: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    baliq: TDBGridEh;
    salat: TDBGridEh;
    T_t: TTimer;
    btn_t: TRzBitBtn;
    t_b: TTimer;
    btn_b: TRzBitBtn;
    t_s: TTimer;
    btn_s: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    DBGridEh1: TDBGridEh;
    procedure taomlarDblClick(Sender: TObject);
    procedure baliqDblClick(Sender: TObject);
    procedure salatDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_tClick(Sender: TObject);
    procedure taomlarExit(Sender: TObject);
    procedure taomlarEnter(Sender: TObject);
    procedure t_bTimer(Sender: TObject);
    procedure baliqEnter(Sender: TObject);
    procedure baliqExit(Sender: TObject);
    procedure btn_bClick(Sender: TObject);
    procedure btn_sClick(Sender: TObject);
    procedure t_sTimer(Sender: TObject);
    procedure salatEnter(Sender: TObject);
    procedure salatExit(Sender: TObject);
    procedure taomlarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure baliqDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure salatDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure T_tTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  oshxona: Toshxona;t,b,s:integer;

implementation

{$R *.dfm}
uses fdms, fulanish,mmsystem;
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateTimeToStr(Date);ShortDateFormat := OldFormat;
    Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure Toshxona.taomlarDblClick(Sender: TObject);
begin
  if dms.link.RecordCount=0 then exit;
  t:=2;btn_t.ImageIndex:=1;
  if MessageDlg('<< '+dms.link.fieldbyname('nom').AsString+' >> tayyor bo`ldimi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.comments.Close;dms.comments.SQL.Clear;
    dms.comments.SQL.Add('update asos_slave set zakaz_see=1,zakaz_ok='+kasaya(now())+' where id='+dms.link.fieldbyname('id').AsString);
    dms.comments.ExecSQL;
  end;
  t:=1;btn_t.ImageIndex:=0;t_t.Interval:=3000;
  btn_t.SetFocus;
end;

procedure Toshxona.baliqDblClick(Sender: TObject);
begin
  if dms.main_link.RecordCount=0 then exit; b:=2;btn_b.ImageIndex:=1;
  if MessageDlg('<< '+dms.main_link.fieldbyname('nom').AsString+' >> tayyor bo`ldimi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.comments.Close;dms.comments.SQL.Clear;
    dms.comments.SQL.Add('update asos_slave set zakaz_see=1,zakaz_ok='+kasaya(now())+' where id='+dms.main_link.fieldbyname('id').AsString);
    dms.comments.ExecSQL;
  end;
  dms.main_link.Open;
  b:=1;btn_b.ImageIndex:=0;t_b.Interval:=3000;
  btn_b.SetFocus;

end;

procedure Toshxona.salatDblClick(Sender: TObject);
begin
  if dms.salat.RecordCount=0 then exit;b:=2;btn_b.ImageIndex:=1;
  if MessageDlg('<< '+dms.salat.fieldbyname('nom').AsString+' >> tayyor bo`ldimi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.comments.Close;dms.comments.SQL.Clear;
    dms.comments.SQL.Add('update asos_slave set zakaz_see=1,zakaz_ok='+kasaya(now())+' where id='+dms.salat.fieldbyname('id').AsString);
    dms.comments.ExecSQL;
  end;
  s:=1;btn_s.ImageIndex:=0;t_s.Interval:=3000;
  btn_s.SetFocus;

end;

procedure Toshxona.FormActivate(Sender: TObject);
begin
  t:=1;b:=1;s:=1;
  T_t.Enabled:=true;T_s.Enabled:=true;T_b.Enabled:=true;
end;

procedure Toshxona.btn_tClick(Sender: TObject);
begin
  btn_t.ImageIndex:=0;t_t.Interval:=3000;DMS.link.Open;t:=1;
end;

procedure Toshxona.taomlarExit(Sender: TObject);
begin
  t:=1;btn_t.ImageIndex:=0;t_t.Interval:=3000;
end;

procedure Toshxona.taomlarEnter(Sender: TObject);
begin
  t:=2;btn_t.ImageIndex:=1;t_t.Interval:=10000;
end;

procedure Toshxona.t_bTimer(Sender: TObject);
begin
  if b=2 then
  begin
    b:=1;btn_b.SetFocus;
  end;
  if b<>1 then exit;
  b:=1;
  btn_b.ImageIndex:=0;t_b.Interval:=3000;
  try
  dms.main_link.Close;dms.main_link.Open;
  except
  end;

end;

procedure Toshxona.baliqEnter(Sender: TObject);
begin
  b:=2;btn_b.ImageIndex:=1;t_b.Interval:=10000;
end;

procedure Toshxona.baliqExit(Sender: TObject);
begin
  b:=1;btn_b.ImageIndex:=0;t_b.Interval:=3000;
end;

procedure Toshxona.btn_bClick(Sender: TObject);
begin
  btn_b.ImageIndex:=0;t_b.Interval:=3000;DMS.main_link.Open; b:=1;

end;

procedure Toshxona.btn_sClick(Sender: TObject);
begin
  btn_s.ImageIndex:=0;t_s.Interval:=3000;s:=1;
end;

procedure Toshxona.t_sTimer(Sender: TObject);
begin
  if s=2 then
  begin
    s:=1;btn_s.SetFocus;
  end;
  if s<>1 then exit;
  s:=1;
  btn_s.ImageIndex:=0;t_s.Interval:=3000;
  try
  dms.salat.Close;dms.salat.Open;
  except
  end;
end;

procedure Toshxona.salatEnter(Sender: TObject);
begin
  s:=2;btn_s.ImageIndex:=1;t_s.Interval:=10000;
end;

procedure Toshxona.salatExit(Sender: TObject);
begin
  s:=1;btn_s.ImageIndex:=0;t_s.Interval:=3000;
end;

procedure Toshxona.taomlarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var  holdColor: TColor;n:integer;
begin
  holdColor := taomlar.Canvas.Font.Color;
  if (Column.FieldName = 'nom') then begin //and (btn_t.ImageIndex=0)
    if (dms.link.FieldByName('zakaz_ok').AsVariant = null) then begin

      taomlar.Canvas.Brush.Color := clYellow;
      taomlar.Canvas.Font.Color := clBlue;
      taomlar.Canvas.Font.Style :=  [fsbold];
      taomlar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      //taomlar.Canvas.Font.Color := holdColor;
    end;
  end;
end;

procedure Toshxona.baliqDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var  holdColor: TColor;n:integer;
begin
  if (Column.FieldName = 'nom') then begin //and (btn_t.ImageIndex=0)
    if (dms.main_link.FieldByName('zakaz_ok').AsVariant = null) then begin
      baliq.Canvas.Brush.Color := clYellow;
      baliq.Canvas.Font.Color := clBlue;
      baliq.Canvas.Font.Style :=  [fsbold];
      baliq.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

end;

procedure Toshxona.salatDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var holdColor: TColor;n:integer;
begin
  if (Column.FieldName = 'nom') then begin //and (btn_t.ImageIndex=0)
    if (dms.salat.FieldByName('zakaz_ok').AsVariant = null) then begin
      salat.Canvas.Brush.Color := clYellow;
      salat.Canvas.Font.Color := clBlue;
      salat.Canvas.Font.Style :=  [fsbold];
      salat.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

end;

procedure Toshxona.RzBitBtn1Click(Sender: TObject);
begin
  MediaPlayer1.FileName:=ExtractFilePath(Application.ExeName)+'sound.wav';
  MediaPlayer1.Open;MediaPlayer1.Play;

end;

procedure Toshxona.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
try
  dms.gapir.Close;dms.gapir.Open;
  while not dms.gapir.eof do begin
    if dms.gapir.FieldByName('zakaz_gapir').AsVariant = null then begin
      case dms.gapir.FieldByName('brend').AsInteger of
      57:begin MediaPlayer1.FileName:=ExtractFilePath(Application.ExeName)+'taom.wav';

      end;
      62:begin MediaPlayer1.FileName:=ExtractFilePath(Application.ExeName)+'baliq.wav';

        end;
      60:begin MediaPlayer1.FileName:=ExtractFilePath(Application.ExeName)+'salat.wav';

      end;
      end;
      dms.s_obl.Close;dms.s_obl.SQL.Clear;
      dms.s_obl.SQL.Add('UPDATE asos_slave SET zakaz_gapir=1 where id='+dms.gapir.fieldbyname('id').AsString);
      dms.s_obl.ExecSQL;
      MediaPlayer1.Open;MediaPlayer1.Play;
      Timer1.Enabled:=True;
      exit;
    end;
    dms.gapir.Next;
  end;
  except
    
  end;
  if Timer1.Enabled=false then Timer1.Enabled:=True;
end;

procedure Toshxona.T_tTimer(Sender: TObject);
begin
  if t=2 then
  begin
    t:=1;btn_t.SetFocus;
  end;
  if t<>1 then exit;
  t:=1;
  btn_t.ImageIndex:=0;t_t.Interval:=10000;
  try 
    dms.link.Close;dms.link.Open;
  except
    //DMS.lbd.Disconnect;
  end;
end;

end.
