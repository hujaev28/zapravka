unit fs_kassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,RzButton, StdCtrls,
   Mask, DBCtrlsEh, DBGridEh, DBLookupEh, GridsEh;

type
  Ts_kassa = class(TForm)
    gclient: TDBGridEh;
    xnew: TRzBitBtn;
    xedit: TRzBitBtn;
    xdel: TRzBitBtn;
    procedure xnewClick(Sender: TObject);
    procedure xeditClick(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure gclientDblClick(Sender: TObject);
    procedure gclientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_kassa: Ts_kassa;

implementation

uses fdms, fs_kassa_edit, fulanish;

{$R *.dfm}

procedure Ts_kassa.xnewClick(Sender: TObject);
begin
  dms.s_kassa.Append;
  s_kassa_edit.status.Checked:=True;
  s_kassa_edit.ShowModal;
end;

procedure Ts_kassa.xeditClick(Sender: TObject);
begin
  dms.s_kassa.edit;
  if dms.s_kassa.FieldByName('status').Value=1 then
  s_kassa_edit.status.Checked:=True else s_kassa_edit.status.Checked:=False;
  s_kassa_edit.ShowModal;
end; //  shtrix 

procedure Ts_kassa.xdelClick(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id,sana from asos WHERE del_flag=1 and (kassa_id = '+dms.s_kassa.fieldbyname('id').AsString+')');
  dms.link.open;
  if dms.link.RecordCount>0 then begin
    ShowMessage('Uchbu kassa bo`yicha '+dms.link.fieldbyname('sana').AsString+' da amal bajarilgan. Oldin amalni o`chiring');
    exit;
  end;
 if MessageDlg('Siz Kassa spravochnikidan ushbu ma`lumotni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     DMS.s_kassa.Edit;
     DMS.s_kassadel_flag.Value:=0;
     DMS.s_kassa.Post;
     DMS.s_kassa.Refresh;
   end;
end;

procedure Ts_kassa.gclientDblClick(Sender: TObject);
begin
  xeditClick(Sender);
end;

procedure Ts_kassa.gclientKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if admin_type<>'2' then begin
    exit;
  end;
  if key=VK_INSERT then xnewClick(Sender);
  if key=VK_RETURN then xeditClick(Sender);
end;

procedure Ts_kassa.FormActivate(Sender: TObject);
begin
  if admin_type='2' then begin
    exit;
  end;
  xnew.Visible:=false;xedit.Visible:=false;xdel.Visible:=false;
end;

end.
