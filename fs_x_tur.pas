unit fs_x_tur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,RzButton, DBCtrlsEh,db, GridsEh, DBGridEh, StdCtrls;

type
  Ts_x_tur = class(TForm)
    DBGridEh1: TDBGridEh;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_x_tur: Ts_x_tur;

implementation

uses fdms, fs_kassa_edit, fulanish;

{$R *.dfm}

procedure Ts_x_tur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_x_tur.State <> dsbrowse then dms.s_x_tur.Post;
end;

procedure Ts_x_tur.FormActivate(Sender: TObject);
begin
DMS.s_x_tur.Open;
end;

end.
