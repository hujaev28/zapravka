unit fs_mobil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh;

type
  Ts_mobil = class(TForm)
    Gs_kurs: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_mobil: Ts_mobil;

implementation

uses fdms,db;

{$R *.dfm}

procedure Ts_mobil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_mobil.State <> dsbrowse then dms.s_mobil.Post;
end;

end.
