object oshxona: Toshxona
  Left = 24
  Top = 12
  Width = 1282
  Height = 627
  Caption = 'oshxona 7.0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 8
    Width = 89
    Height = 31
    Caption = 'Taomlar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 496
    Top = 8
    Width = 238
    Height = 31
    Caption = 'Baliqxona va shashlik'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 1048
    Top = 8
    Width = 84
    Height = 31
    Caption = 'Salatlar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object taomlar: TDBGridEh
    Left = 8
    Top = 48
    Width = 393
    Height = 521
    TabStop = False
    DataSource = DMS.Dlink
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -17
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = taomlarDblClick
    OnDrawColumnCell = taomlarDrawColumnCell
    OnEnter = taomlarEnter
    OnExit = taomlarExit
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nom'
        Footers = <>
        Title.Caption = 'Taom nomi'
        Width = 145
      end
      item
        EditButtons = <>
        FieldName = 'fio'
        Footers = <>
        Title.Caption = 'FIO'
        Visible = False
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'mnom'
        Footers = <>
        Title.Caption = 'Xona'
        Visible = False
        Width = 45
      end
      item
        DisplayFormat = 'hh:nn'
        EditButtons = <>
        FieldName = 'zakaz'
        Footers = <>
        Title.Caption = 'Buyurtma'
        Width = 71
      end
      item
        DisplayFormat = 'hh:nn'
        EditButtons = <>
        FieldName = 'zakaz_ok'
        Footers = <>
        Title.Caption = 'Tayyor'
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'kol'
        Footers = <>
        Title.Caption = 'Soni'
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'kol_in'
        Footers = <>
        Title.Caption = 'Gramm'
        Visible = False
        Width = 68
      end>
  end
  object baliq: TDBGridEh
    Left = 408
    Top = 48
    Width = 441
    Height = 521
    TabStop = False
    DataSource = DMS.Dmain_link
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -17
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = baliqDblClick
    OnDrawColumnCell = baliqDrawColumnCell
    OnEnter = baliqEnter
    OnExit = baliqExit
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nom'
        Footers = <>
        Title.Caption = 'Nomi'
        Width = 122
      end
      item
        EditButtons = <>
        FieldName = 'fio'
        Footers = <>
        Title.Caption = 'FIO'
        Visible = False
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'mnom'
        Footers = <>
        Title.Caption = 'Xona'
        Visible = False
      end
      item
        DisplayFormat = 'hh:nn'
        EditButtons = <>
        FieldName = 'zakaz'
        Footers = <>
        Title.Caption = 'Buyurtma'
        Width = 68
      end
      item
        DisplayFormat = 'hh:nn'
        EditButtons = <>
        FieldName = 'zakaz_ok'
        Footers = <>
        Title.Caption = 'Tayyor'
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'kol'
        Footers = <>
        Title.Caption = 'Soni'
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'kol_in'
        Footers = <>
        Title.Caption = 'Gramm'
        Visible = False
        Width = 50
      end>
  end
  object salat: TDBGridEh
    Left = 856
    Top = 48
    Width = 400
    Height = 521
    TabStop = False
    DataSource = DMS.Dsalat
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -17
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = salatDblClick
    OnDrawColumnCell = salatDrawColumnCell
    OnEnter = salatEnter
    OnExit = salatExit
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nom'
        Footers = <>
        Title.Caption = 'Salat nomi'
        Width = 188
      end
      item
        DisplayFormat = 'hh:nn'
        EditButtons = <>
        FieldName = 'zakaz'
        Footers = <>
        Title.Caption = 'Buyurtma'
        Width = 70
      end
      item
        DisplayFormat = 'hh:nn'
        EditButtons = <>
        FieldName = 'zakaz_ok'
        Footers = <>
        Title.Caption = 'Tayyor'
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'kol'
        Footers = <>
        Title.Caption = 'Soni'
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'kol_in'
        Footers = <>
        Title.Caption = 'Gramm'
        Visible = False
        Width = 68
      end>
  end
  object btn_t: TRzBitBtn
    Left = 80
    Top = 8
    Width = 33
    Height = 33
    TabOrder = 3
    OnClick = btn_tClick
    ImageIndex = 0
    Images = ulanish_k.Image_oshxona
  end
  object btn_b: TRzBitBtn
    Left = 440
    Top = 7
    Width = 33
    Height = 33
    TabOrder = 4
    OnClick = btn_bClick
    ImageIndex = 0
    Images = ulanish_k.Image_oshxona
  end
  object btn_s: TRzBitBtn
    Left = 946
    Top = 8
    Width = 33
    Height = 33
    TabOrder = 5
    OnClick = btn_sClick
    ImageIndex = 0
    Images = ulanish_k.Image_oshxona
  end
  object RzBitBtn1: TRzBitBtn
    Left = 296
    Top = 8
    Width = 33
    Height = 33
    TabOrder = 6
    OnClick = RzBitBtn1Click
    ImageIndex = 0
    Images = ulanish_k.Image_oshxona
  end
  object MediaPlayer1: TMediaPlayer
    Left = 16
    Top = 480
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 7
  end
  object DBGridEh1: TDBGridEh
    Left = 776
    Top = 416
    Width = 310
    Height = 121
    TabStop = False
    DataSource = DMS.Dgapir
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -17
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
    UseMultiTitle = True
    Visible = False
    OnDblClick = baliqDblClick
    OnDrawColumnCell = baliqDrawColumnCell
    OnEnter = baliqEnter
    OnExit = baliqExit
  end
  object T_t: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = T_tTimer
    Left = 168
    Top = 8
  end
  object t_b: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = t_bTimer
    Left = 752
    Top = 8
  end
  object t_s: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = t_sTimer
    Left = 896
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 336
    Top = 8
  end
end
