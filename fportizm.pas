unit fportizm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh;

type
  Tprotizm = class(TForm)
    g_asos: TDBGridEh;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  protizm: Tprotizm;

implementation
uses fdms;
{$R *.dfm}

procedure Tprotizm.FormActivate(Sender: TObject);
begin

  dms.protizm.Open;
end;

end.
