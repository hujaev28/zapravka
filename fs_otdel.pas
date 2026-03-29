
unit fs_otdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,RzButton, DBCtrlsEh,db, GridsEh, DBGridEh, StdCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Ts_otdel = class(TForm)
    DBGridEh1: TDBGridEh;
    Label3: TLabel;
    Ds_otdel: TDataSource;
    ts_otdel: TZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_otdel: Ts_otdel;

implementation

uses fdms;

{$R *.dfm}

procedure Ts_otdel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_otdel.State <> dsbrowse then dms.s_otdel.Post;
end;

end.
