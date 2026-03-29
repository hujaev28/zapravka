object protizm: Tprotizm
  Left = 114
  Top = 72
  Width = 1153
  Height = 600
  Caption = 'O`zgartirilgan cheklar'
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
  object g_asos: TDBGridEh
    Left = 0
    Top = 0
    Width = 1137
    Height = 249
    TabStop = False
    Align = alTop
    DataSource = DMS.Dprotizm
    EditActions = [geaCopyEh, geaSelectAllEh]
    EvenRowColor = clWindow
    FixedColor = 15132415
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clLime
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clBlack
    FooterFont.Height = -19
    FooterFont.Name = 'Times New Roman'
    FooterFont.Style = []
    FooterRowCount = 1
    OddRowColor = clWindow
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
    ParentFont = False
    ReadOnly = True
    SumList.Active = True
    SumList.VirtualRecords = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nima'
        Footers = <>
        Title.Caption = 'Amal turi'
        Width = 214
      end
      item
        EditButtons = <>
        FieldName = 'old_value'
        Footers = <>
        Title.Caption = 'Oldingi|qiymat'
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'old_adminnom'
        Footers = <>
        Title.Caption = 'Oldingi| admin'
        Visible = False
        Width = 131
      end
      item
        EditButtons = <>
        FieldName = 'old_changedate'
        Footers = <>
        Title.Caption = 'Oldingi|sana'
      end
      item
        EditButtons = <>
        FieldName = 'new_value'
        Footers = <>
        Title.Caption = 'Yangi|qiymat'
        Width = 156
      end
      item
        EditButtons = <>
        FieldName = 'new_adminnom'
        Footers = <>
        Title.Caption = 'Yangi|admin'
        Visible = False
        Width = 223
      end
      item
        EditButtons = <>
        FieldName = 'new_changedate'
        Footers = <>
        Title.Caption = 'Yangi|sana'
        Width = 178
      end
      item
        EditButtons = <>
        FieldName = 'subid'
        Footers = <>
        Title.Caption = 'Kod'
      end
      item
        EditButtons = <>
        FieldName = 'sabab'
        Footers = <>
        Width = 335
      end
      item
        EditButtons = <>
        FieldName = 'vid'
        Footers = <>
        Visible = False
      end>
  end
end
