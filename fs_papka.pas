unit fs_papka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh;

type
  Ts_papka = class(TForm)
    Gs_kurs: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_papka: Ts_papka;

implementation

uses fdms,db;

{$R *.dfm}

procedure Ts_papka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dms.s_papka.State <> dsbrowse then dms.s_papka.Post;
end;

end.
