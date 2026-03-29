unit fs_kassa_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzRadChk, Mask, RzEdit, RzDBEdit, RzLabel, ExtCtrls,
  RzPanel, RzButton, DBGridEh, DBCtrlsEh, DBLookupEh;

type
  Ts_kassa_edit = class(TForm)
    Label1: TLabel;
    nom: TRzDBEdit;
    RzLabel1: TRzLabel;
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    status: TRzCheckBox;
    RzPanel1: TRzPanel;
    Label7: TLabel;
    client: TDBLookupComboboxEh;
    procedure saveClick(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure statusMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_kassa_edit: Ts_kassa_edit;

implementation

uses fdms;

{$R *.dfm}

procedure Ts_kassa_edit.saveClick(Sender: TObject);
begin
  if dms.s_kassa.FieldByName('nom').AsString='' then begin
    ShowMessage('Kassa nomini kiriting');ActiveControl:=nom;Exit;
  end;
  if s_kassa_edit.status.Checked  then
  dms.s_kassa.FieldByName('status').Value:=1 else dms.s_kassa.FieldByName('status').Value:=0;
  dms.s_kassa.post;
  s_kassa_edit.Close;
end;

procedure Ts_kassa_edit.cancelClick(Sender: TObject);
begin
  dms.s_kassa.Cancel;
  s_kassa_edit.Close;
end;

procedure Ts_kassa_edit.statusMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if status.Checked=false then
    dms.s_kassa.FieldByName('status').value:=1
  else
    dms.s_kassa.FieldByName('status').value:=0;
end;

procedure Ts_kassa_edit.nomKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Ts_kassa_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dms.s_kassa.Cancel;
end;

end.
