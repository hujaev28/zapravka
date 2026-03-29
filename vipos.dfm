object Form1: TForm1
  Left = 193
  Top = 126
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 384
    Top = 40
    Width = 441
    Height = 297
    TabOrder = 0
    OnDblClick = Memo1DblClick
  end
  object t1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'http://localhost:3449/rpc/api'
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 192
    Top = 24
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 248
    Top = 32
  end
end
