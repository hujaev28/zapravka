unit fs_kurs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh;

type
  Ts_kurs = class(TForm)
    Gs_kurs: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_kurs: Ts_kurs;

implementation

uses fdms,db;

{$R *.dfm}

procedure Ts_kurs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_kurs.State <> dsbrowse then dms.s_kurs.Post;
end;

end.
