unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,EncdDecd, OleCtrls, SHDocVw,shellApi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var s,merchant_id,orderID,mAmount:string;Flags: OleVariant;
begin
Flags:=2;
  merchant_id := 'f72c8a61055e6d4cf897ddb301f5616f5f6ddd8b';
  orderID := '2020';
  mAmount := '555';

  s := 'm='+merchant_id+';ac.order_id='+orderID+';a='+mAmount;
  WebBrowser1.Navigate('https://pay.woy-wo.uz/'+EncodeString(s),Flags);

end;

procedure TForm1.Button2Click(Sender: TObject);

begin
ShellExecute(0, 'open', PChar(VarToStr('chrome.exe')), '', '.', SW_SHOW);
end;

end.
