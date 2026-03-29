unit fs_kat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,RzButton, DBCtrlsEh,db, GridsEh, DBGridEh, StdCtrls;

type
  Ts_kat = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Label3: TLabel;
    RzBitBtn1: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_kat: Ts_kat;

implementation

uses fdms, fs_kassa_edit, fulanish;

{$R *.dfm}

procedure Ts_kat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_kat.State <> dsbrowse then dms.s_kat.Post;
  if dms.s_brend.State <> dsbrowse then dms.s_brend.Post;
end;

procedure Ts_kat.RzBitBtn1Click(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select count(kat) as kol from s_tovar where kat='+DMS.s_katid.AsString+' group by kat order by kat');
  dms.link.open;
  if MessageDlg('Ushnu kategoriyani '+(dms.link.fieldbyname('kol').AsString)+' dona tovarlari bilan o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     dms.link.Close;dms.link.SQL.Clear;
     dms.link.SQL.Add('delete from s_tovar where kat='+DMS.s_katid.AsString);
     dms.link.ExecSQL;
     DMS.s_kat.Delete;
     DMS.s_kat.Refresh;
  end;

end;

end.
