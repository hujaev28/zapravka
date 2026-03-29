unit fs_xodim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, RzButton,
  GridsEh;

type
  Ts_xodim = class(TForm)
    gclient: TDBGridEh;
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    DBGridEh1: TDBGridEh;
    RzBitBtn1: TRzBitBtn;
    procedure xnewClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure gclientDblClick(Sender: TObject);
    procedure gclientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_xodim: Ts_xodim;

implementation

uses fdms, fs_xodim_edit, DB, Math, fulanish;

{$R *.dfm}

procedure Ts_xodim.xnewClick(Sender: TObject);
begin
  dms.s_xodim.Append;dms.s_xodimstatus.Value:=1;
  dms.s_xodimclient_id.Value:=StrToInt(admin_clid);
  s_xodim_edit.Caption:='Korxona nomi = << '+dms.s_clientnom.AsString+' >>';
  s_xodim_edit.activ.Checked:=True;
  s_xodim_edit.ShowModal;
end;

procedure Ts_xodim.xeditClick(Sender: TObject);
begin
  dms.s_xodim.edit;
  if dms.s_xodimactive.Value=1 then
  s_xodim_edit.activ.Checked:=True else s_xodim_edit.activ.Checked:=False;
  s_xodim_edit.ShowModal;
end;

procedure Ts_xodim.xdelClick(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * from asos WHERE del_flag=1 and (user_id = '+dms.s_xodimid.AsString+')');
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('Uchbu xodim '+dms.link.fieldbyname('sana').AsString+','+dms.link.fieldbyname('tur_oper').AsString+','+dms.link.fieldbyname('id').AsString+' da amal bajargan. Oldin amalni o`chiring.');
    exit;
  end;
 if MessageDlg('Siz Xodimlar spravochnikidan ushbu ma`lumotni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     DMS.s_xodim.Edit;
     DMS.s_xodimdel_flag.Value:=0;
     DMS.s_xodim.Post;
     DMS.s_xodim.Refresh;
   end;
end;

procedure Ts_xodim.gclientDblClick(Sender: TObject);
begin
  {if admin_type<>'2' then begin
    exit;
  end;}
  xeditClick(Sender);
end;

procedure Ts_xodim.gclientKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key=VK_INSERT then xnewClick(Sender);
  if key=VK_RETURN then xeditClick(Sender);
end;

procedure Ts_xodim.FormActivate(Sender: TObject);
begin
    //xnew.Visible:=false;xedit.Visible:=false;xdel.Visible:=false;
  if dms.s_xodim.Active=false then dms.s_xodim.Open;
end;

procedure Ts_xodim.RzBitBtn1Click(Sender: TObject);
begin
  dms.user.Open;
end;

end.
