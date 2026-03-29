unit splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ExtCtrls, StdCtrls;

type
  TsplashForm = class(TForm)
    sltizim: TLabel;
    slkuting: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    til:string;
  end;

var
  splashForm: TsplashForm;

implementation

{$R *.dfm}
end.
