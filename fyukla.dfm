object Yukla: TYukla
  Left = 383
  Top = 133
  Width = 1088
  Height = 713
  Caption = 'Yuklab olish'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object progress: TRzProgressBar
    Left = 7
    Top = 240
    Width = 322
    Height = 25
    BarColor = clBlue
    BarStyle = bsGradient
    BorderColor = clWhite
    BorderWidth = 0
    FlatColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    InteriorOffset = 0
    ParentFont = False
    PartsComplete = 0
    Percent = 0
    TotalParts = 0
  end
  object Label1: TLabel
    Left = 16
    Top = 320
    Width = 36
    Height = 13
    Caption = 'asos_id'
  end
  object Label2: TLabel
    Left = 16
    Top = 296
    Width = 14
    Height = 13
    Caption = 'kol'
  end
  object xldan: TLabel
    Left = 24
    Top = 383
    Width = 116
    Height = 21
    Caption = 'Oraliq sana dan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object xlgacha: TLabel
    Left = 286
    Top = 382
    Width = 43
    Height = 21
    Caption = 'gacha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 310
    Top = 438
    Width = 33
    Height = 21
    Caption = 'Kod'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Button4: TButton
    Left = 8
    Top = 64
    Width = 57
    Height = 25
    Caption = 'Xisobla'
    TabOrder = 0
    OnClick = Button4Click
  end
  object Memoykla: TMemo
    Left = 70
    Top = 8
    Width = 267
    Height = 201
    TabOrder = 1
  end
  object hisobla: TCheckBox
    Left = 152
    Top = 208
    Width = 96
    Height = 17
    Caption = 'Hisoblash'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object DBGrid4: TDBGrid
    Left = 576
    Top = 24
    Width = 431
    Height = 161
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 144
    Width = 57
    Height = 25
    Caption = 'flag=0'
    TabOrder = 4
  end
  object Button2: TButton
    Left = 720
    Top = 216
    Width = 97
    Height = 25
    Caption = 'tovar baza'
    TabOrder = 5
    OnClick = Button2Click
  end
  object termez: TButton
    Left = 872
    Top = 272
    Width = 121
    Height = 33
    Caption = 'tovar baza termez'
    TabOrder = 6
    Visible = False
    OnClick = termezClick
  end
  object yodgor: TButton
    Left = 152
    Top = 310
    Width = 121
    Height = 27
    Caption = 'tovar baza  YUKLASH'
    TabOrder = 7
    OnClick = yodgorClick
  end
  object Edit_asos_id: TEdit
    Left = 58
    Top = 316
    Width = 81
    Height = 21
    TabOrder = 8
  end
  object Edit_kol: TEdit
    Left = 58
    Top = 292
    Width = 81
    Height = 21
    TabOrder = 9
  end
  object Button3: TButton
    Left = 472
    Top = 379
    Width = 89
    Height = 27
    Caption = 'Botga jo`natish'
    TabOrder = 10
    OnClick = Button3Click
  end
  object sana1: TDBDateTimeEditEh
    Left = 152
    Top = 379
    Width = 106
    Height = 27
    Color = clInfoBk
    EditButtons = <>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Value = 45007d
    Visible = True
    EditFormat = 'DD.MM.YY'
  end
  object sana2: TDBDateTimeEditEh
    Left = 346
    Top = 379
    Width = 111
    Height = 27
    Color = clInfoBk
    EditButtons = <>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Value = 45008d
    Visible = True
    EditFormat = 'DD.MM.YY'
  end
  object zapros: TRzEdit
    Left = 786
    Top = 443
    Width = 25
    Height = 21
    TabOrder = 13
  end
  object za: TRzEdit
    Left = 858
    Top = 443
    Width = 25
    Height = 21
    TabOrder = 14
  end
  object Button5: TButton
    Left = 376
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 15
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 816
    Top = 398
    Width = 121
    Height = 27
    Caption = 'kafe  YUKLASH'
    TabOrder = 16
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 872
    Top = 232
    Width = 113
    Height = 33
    Caption = 'tovar baza termez'
    TabOrder = 17
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 888
    Top = 200
    Width = 105
    Height = 25
    Caption = 'tovar baza Araq'
    TabOrder = 18
    OnClick = Button8Click
  end
  object tasnif: TButton
    Left = 688
    Top = 358
    Width = 121
    Height = 27
    Caption = 'tasnif  YUKLASH'
    TabOrder = 19
    OnClick = tasnifClick
  end
  object Button9: TButton
    Left = 848
    Top = 358
    Width = 121
    Height = 27
    Caption = 'tasnif  YUKLASH'
    TabOrder = 20
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 704
    Top = 398
    Width = 89
    Height = 27
    Caption = #1094#1077#1085#1090#1088'  YUKLA'
    TabOrder = 21
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 592
    Top = 398
    Width = 89
    Height = 27
    Caption = 'Haridor  YUKLA'
    TabOrder = 22
    OnClick = Button11Click
  end
  object kod: TEdit
    Left = 354
    Top = 438
    Width = 81
    Height = 21
    TabOrder = 23
  end
  object Button12: TButton
    Left = 720
    Top = 256
    Width = 113
    Height = 33
    Caption = 'tovar baza nadmes'
    TabOrder = 24
    OnClick = Button12Click
  end
  object termez_10: TButton
    Left = 872
    Top = 312
    Width = 121
    Height = 33
    Caption = 'tovar baza termez 10'
    TabOrder = 25
    OnClick = termez_10Click
  end
  object Button13: TButton
    Left = 456
    Top = 510
    Width = 89
    Height = 27
    Caption = 'sadp YUKLA'
    TabOrder = 26
    OnClick = Button13Click
  end
  object nakl: TButton
    Left = 576
    Top = 510
    Width = 89
    Height = 27
    Caption = 'nakl YUKLA'
    TabOrder = 27
    OnClick = naklClick
  end
  object kat: TButton
    Left = 704
    Top = 510
    Width = 89
    Height = 27
    Caption = 'kat YUKLA'
    TabOrder = 28
    OnClick = katClick
  end
  object Button14: TButton
    Left = 152
    Top = 518
    Width = 89
    Height = 27
    Caption = 'Price YUKLA'
    TabOrder = 29
    OnClick = Button14Click
  end
  object s_tovar: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'SELECT * FROM s_tovar')
    Params = <>
    Left = 458
    Top = 81
  end
  object Ds_tovar: TDataSource
    DataSet = s_tovar
    Left = 458
    Top = 110
  end
  object asos_slave: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'SELECT * FROM asos_slave')
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    DataSource = Ds_tovar
    Left = 506
    Top = 81
    ParamData = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
  end
  object Dasos_slave: TDataSource
    DataSet = asos_slave
    Left = 506
    Top = 110
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
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
    Left = 368
    Top = 104
  end
  object IdDecoderMIME1: TIdDecoderMIME
    FillChar = '='
    Left = 488
    Top = 24
  end
  object ttasnif: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'SELECT * FROM tasnif')
    Params = <>
    Left = 546
    Top = 81
  end
  object Dtasnif: TDataSource
    DataSet = ttasnif
    Left = 546
    Top = 110
  end
  object k_guruh: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'SELECT * FROM k_guruh')
    Params = <>
    Left = 626
    Top = 193
  end
  object Dk_guruh: TDataSource
    DataSet = k_guruh
    Left = 626
    Top = 222
  end
  object k_sinf: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'SELECT * FROM k_sinf')
    Params = <>
    Left = 666
    Top = 193
  end
  object Dk_sinf: TDataSource
    DataSet = k_sinf
    Left = 666
    Top = 222
  end
  object ZQuery1: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'SELECT * FROM tasnif')
    Params = <>
    Left = 450
    Top = 169
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 450
    Top = 198
  end
end
