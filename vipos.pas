unit vipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IdAntiFreezeBase, IdAntiFreeze, StdCtrls;

type
  TForm1 = class(TForm)
    t1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    Memo1: TMemo;
    procedure Memo1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Memo1DblClick(Sender: TObject);
var JsonToSend: TStringStream; Json,sResponse: string;
begin
try
   t1.Request.ContentType:=   'application/json';
    Json := '{"method": "Api.SendSaleReceipt","id": 1,"params": { "FactoryID": "00120000010b02083370000a003a00174090",    "Receipt": ';
    Json :=Json +' { "ReceivedCash": 100000, "ReceivedCard": 0,"Time": "2023-07-31 22:18:23","Items": [';
    Json :=Json +'{"SPIC":"02208001001549002",';
    Json :=Json +'"VATPercent":12,';
    Json :=Json +'"Price":100000,';
    Json :=Json +'"Discount":0, "Other":0,"Barcode":"4780081840196","Amount":1,';
    Json :=Json +'"Label":"010478008184019621aO9-dp7 93UDJD","VAT":10714,"Units":1,"PackageCode":"1008907",';
    Json :=Json +'"Name":"aroq: Alaska Ice Land Classic, quvvati 40%,  0,5 ?"}],}},"jsonrpc": "2.0"}';
    JsonToSend := TStringStream.Create(Utf8Encode(Json));
    t1.Request.ContentType := 'application/json';
    //t1.Request.CharSet := 'utf-8';
    try
      sResponse := t1.Post('http://localhost:3449/rpc/api', JsonToSend);
    except
      on E: Exception do
        ShowMessage('Error on request: '#13#10 + e.Message);
    end;
  finally
    JsonToSend.Free;
    Memo1.Lines.Add(sResponse);
  end;
end;

end.
