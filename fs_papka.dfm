object s_papka: Ts_papka
  Left = 449
  Top = 162
  Width = 691
  Height = 480
  Caption = 's_papka'
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
    Width = 675
    Height = 442
    Align = alClient
    DataSource = DMS.Ds_papka
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
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'nom'
        Footers = <>
        Width = 251
      end
      item
        EditButtons = <>
        FieldName = 'kat'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'nom_sh'
        Footers = <>
        Width = 247
      end>
  end
end
