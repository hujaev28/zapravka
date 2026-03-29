object s_kurs: Ts_kurs
  Left = 597
  Top = 176
  Width = 435
  Height = 480
  Caption = 'Dollar kursi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Gs_kurs: TDBGridEh
    Left = 0
    Top = 0
    Width = 419
    Height = 442
    Align = alClient
    DataSource = DMS.Ds_kurs
    EditActions = [geaCopyEh]
    FixedColor = 15132415
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Times New Roman'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -17
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'data1'
        Footers = <>
        Title.Caption = 'Boshlanish'
        Width = 119
      end
      item
        EditButtons = <>
        FieldName = 'data2'
        Footers = <>
        Title.Caption = 'Tugashi'
        Width = 144
      end
      item
        EditButtons = <>
        FieldName = 'dollar'
        Footers = <>
        Title.Caption = 'Kurs'
        Width = 98
      end>
  end
end
