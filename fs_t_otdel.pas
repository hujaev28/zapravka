unit fs_t_otdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,RzButton, DBCtrlsEh,db, GridsEh, DBGridEh, StdCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask, RzEdit;

type
  Ts_t_otdel = class(TForm)
    DBGridEh1: TDBGridEh;
    Label3: TLabel;
    Ds_t_otdel: TDataSource;
    ts_t_otdel: TZQuery;
    DBGridEh2: TDBGridEh;
    RzEdit1: TRzEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure ts_t_otdelNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_t_otdel: Ts_t_otdel;

implementation

uses fdms, fs_kassa_edit, fulanish;

{$R *.dfm}

procedure Ts_t_otdel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ts_t_otdel.State <> dsbrowse then ts_t_otdel.Post;
end;

procedure Ts_t_otdel.DBGridEh1DblClick(Sender: TObject);
begin
  DMS.link.close;DMS.link.SQL.Clear;
  DMS.link.sql.add('SELECT id,nom,otdel from s_tovar where del_flag=1 and otdel = '+ts_t_otdel.fieldbyname('id').AsString+' order by nom');
  DMS.link.Open;
  RzEdit1.Text:=inttostr(DMS.link.RecordCount);
end;

procedure Ts_t_otdel.ts_t_otdelNewRecord(DataSet: TDataSet);
begin
 ts_t_otdel.FieldByName('client_id').AsInteger:=dms.s_clientid.AsInteger;
 ts_t_otdel.FieldByName('user_id').AsInteger:=dms.s_user.fieldbyname('id').AsInteger;
end;

end.
