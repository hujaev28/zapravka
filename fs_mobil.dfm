object s_mobil: Ts_mobil
  Left = 138
  Top = 104
  Width = 1106
  Height = 556
  Caption = 's_mobil'
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
    Width = 1090
    Height = 517
    Align = alClient
    DataSource = DMS.Ds_mobil
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
        FieldName = 'id'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'nom'
        Footers = <>
        Width = 925
      end
      item
        EditButtons = <>
        FieldName = 'foiz'
        Footers = <>
        Visible = False
        Width = 51
      end
      item
        EditButtons = <>
        FieldName = 'nn'
        Footers = <>
        Visible = False
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'activ'
        Footers = <>
        Visible = False
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'qavat'
        Footers = <>
        Visible = False
        Width = 73
      end>
  end
end
