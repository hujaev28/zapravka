object Qarz: TQarz
  Left = 241
  Top = 53
  Width = 1030
  Height = 620
  Caption = 'Qarzdorlik'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 24
  object gclient: TDBGridEh
    Left = 568
    Top = 152
    Width = 233
    Height = 130
    DataSource = Ds_haridor
    EditActions = [geaCopyEh, geaSelectAllEh]
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Visible = False
    Columns = <
      item
        EditButtons = <>
        FieldName = 'hnom'
        Footers = <>
        Width = 192
      end
      item
        EditButtons = <>
        FieldName = 'qarz_summa'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'qarz_epos'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'qarz_dollar'
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'kirim'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'kirimd'
        Footers = <>
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'chiqim'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'chiqimd'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'Jami_summa'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'Jami_dollar'
        Footers = <>
      end>
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 1014
    Height = 484
    Align = alClient
    DataSource = Djamla
    EditActions = [geaCopyEh, geaSelectAllEh]
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'splid'
        Footers = <>
        Visible = False
        Width = 27
      end
      item
        EditButtons = <>
        FieldName = 'sana'
        Footers = <>
        Title.Caption = 'Xujjat|sana'
      end
      item
        EditButtons = <>
        FieldName = 'sfkun'
        Footers = <>
        Title.Caption = 'Xujjat|kun'
        Width = 37
      end
      item
        EditButtons = <>
        FieldName = 'srok'
        Footers = <>
        Title.Caption = 'Muddat|sana'
      end
      item
        EditButtons = <>
        FieldName = 'srokkun'
        Footers = <>
        Title.Caption = 'Muddat|run'
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'xnom'
        Footers = <>
        Title.Caption = 'Mijoz|nomi'
        Width = 180
      end
      item
        EditButtons = <>
        FieldName = 'tel'
        Footers = <>
        Title.Caption = 'Mijoz|nelefon'
        Width = 134
      end
      item
        EditButtons = <>
        FieldName = 'inom'
        Footers = <>
        Title.Caption = 'Investor nomi'
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'qarz_s'
        Footers = <>
        Title.Caption = 'Qarz|so`m'
      end
      item
        EditButtons = <>
        FieldName = 'qarz_d'
        Footers = <>
        Title.Caption = 'Qarz|Dollar'
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'h_id'
        Footers = <>
        Visible = False
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'inv_id'
        Footers = <>
        Visible = False
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'asos_id'
        Footers = <>
        Visible = False
        Width = 29
      end
      item
        EditButtons = <>
        FieldName = 'telegram'
        Footers = <>
        Visible = False
        Width = 20
      end
      item
        EditButtons = <>
        FieldName = 'email'
        Footers = <>
        Visible = False
        Width = 27
      end
      item
        EditButtons = <>
        FieldName = 'tur'
        Footers = <>
        Visible = False
        Width = 20
      end
      item
        EditButtons = <>
        FieldName = 'send'
        Footers = <>
        Title.Caption = 'SMS ketdi'
      end
      item
        EditButtons = <>
        FieldName = 'begin'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'end'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'yaqin'
        Footers = <>
        Title.Caption = 'SMS ketdi|yaqin'
      end
      item
        EditButtons = <>
        FieldName = 'galdi'
        Footers = <>
        Title.Caption = 'SMS ketdi|bugun'
      end
      item
        EditButtons = <>
        FieldName = 'uxladi'
        Footers = <>
        Title.Caption = 'SMS ketdi|o`tgan'
      end>
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 484
    Width = 1014
    Height = 97
    Align = alBottom
    TabOrder = 2
    object hisobla: TRzBitBtn
      Left = 16
      Top = 30
      Width = 129
      Height = 35
      Caption = 'Hisobla'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = hisoblaClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000520B0000520B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8AA
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8AA
        A2E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        AAA2E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        AAD5A2E8E8E8E8E8E8E8E8E8E8E8E8E881E381E8E8E8E8E8E8E8E8E8E8E8AAA2
        A2A2D4A2E8E8E8E8E8E8E8E8E8E881818181AC81E8E8E8E8E8E8E8E8E8E8AAD5
        D4D4D4D4A2E8E8E8E8E8E8E8E8E881E3ACACACAC81E8E8E8E8E8E8E8E8E8E8AA
        D5D4A2AAAAAAE8E8E8E8E8E8E8E8E881E3AC81818181E8E8E8E8E8E8E8E8E8AA
        D5D4D4A2E8E8E8E8E8E8E8E8E8E8E881E3ACAC81E8E8E8E8E8E8E8E8AAA2A2A2
        A2D5D4D4A2E8E8E8E8E8E8E88181818181E3ACAC81E8E8E8E8E8E8E8AAD5D5D4
        D4D4D4D4D4A2E8E8E8E8E8E881E3E3ACACACACACAC81E8E8E8E8E8E8E8AAD5D5
        D4D4A2AAAAAAE8E8E8E8E8E8E881E3E3ACAC81818181E8E8E8E8E8E8E8AAD5D5
        D5D4D4A2E8E8E8E8E8E8E8E8E881E3E3E3ACAC81E8E8E8E8E8E8E8E8E8E8AAD5
        D5D5D4D4A2E8E8E8E8E8E8E8E8E881E3E3E3ACAC81E8E8E8E8E8E8E8E8E8AAD5
        D5D5D4D4D4A2E8E8E8E8E8E8E8E881E3E3E3ACACAC81E8E8E8E8E8E8E8E8E8AA
        D5D5D5D4D4D4A2E8E8E8E8E8E8E8E881E3E3E3ACACAC81E8E8E8E8E8E8E8E8AA
        AAAAAAAAAAAAAAAAE8E8E8E8E8E8E8818181818181818181E8E8}
      NumGlyphs = 2
    end
    object otchet: TRzBitBtn
      Left = 160
      Top = 30
      Width = 137
      Height = 35
      Caption = 'Hisobot'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = otchetClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000730E0000730E00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
        090909090909090909E8E8E881818181818181818181818181E8E809101009E3
        1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
        1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
        1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
        E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
        090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
        101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
        090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
        D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
        0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
        D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
        0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
        D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
        090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object vid: TRzRadioGroup
      Left = 304
      Top = 2
      Width = 705
      Height = 65
      Caption = 'Muddatlar'
      Color = 15132415
      Columns = 5
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Times New Roman'
      Font.Style = []
      GroupStyle = gsBanner
      ItemHotTrack = True
      ItemHeight = 20
      ItemIndex = 0
      Items.Strings = (
        'Jami qarzdorlik'
        '3 kun qoldi'
        'Bugun tugaydi'
        'Muddati o`tgan'
        '3 kundan o`tgan')
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      SpaceEvenly = True
      StartYPos = 8
      TabOrder = 2
      VerticalSpacing = 10
      OnClick = vidClick
    end
    object Dalolatnoma: TRzBitBtn
      Left = 782
      Top = 6
      Width = 51
      Height = 35
      Caption = 'Hisobla'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnClick = DalolatnomaClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000520B0000520B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8AA
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8AA
        A2E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        AAA2E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        AAD5A2E8E8E8E8E8E8E8E8E8E8E8E8E881E381E8E8E8E8E8E8E8E8E8E8E8AAA2
        A2A2D4A2E8E8E8E8E8E8E8E8E8E881818181AC81E8E8E8E8E8E8E8E8E8E8AAD5
        D4D4D4D4A2E8E8E8E8E8E8E8E8E881E3ACACACAC81E8E8E8E8E8E8E8E8E8E8AA
        D5D4A2AAAAAAE8E8E8E8E8E8E8E8E881E3AC81818181E8E8E8E8E8E8E8E8E8AA
        D5D4D4A2E8E8E8E8E8E8E8E8E8E8E881E3ACAC81E8E8E8E8E8E8E8E8AAA2A2A2
        A2D5D4D4A2E8E8E8E8E8E8E88181818181E3ACAC81E8E8E8E8E8E8E8AAD5D5D4
        D4D4D4D4D4A2E8E8E8E8E8E881E3E3ACACACACACAC81E8E8E8E8E8E8E8AAD5D5
        D4D4A2AAAAAAE8E8E8E8E8E8E881E3E3ACAC81818181E8E8E8E8E8E8E8AAD5D5
        D5D4D4A2E8E8E8E8E8E8E8E8E881E3E3E3ACAC81E8E8E8E8E8E8E8E8E8E8AAD5
        D5D5D4D4A2E8E8E8E8E8E8E8E8E881E3E3E3ACAC81E8E8E8E8E8E8E8E8E8AAD5
        D5D5D4D4D4A2E8E8E8E8E8E8E8E881E3E3E3ACACAC81E8E8E8E8E8E8E8E8E8AA
        D5D5D5D4D4D4A2E8E8E8E8E8E8E8E881E3E3E3ACACAC81E8E8E8E8E8E8E8E8AA
        AAAAAAAAAAAAAAAAE8E8E8E8E8E8E8818181818181818181E8E8}
      NumGlyphs = 2
    end
  end
  object Memo1: TMemo
    Left = 624
    Top = 320
    Width = 185
    Height = 89
    TabOrder = 3
    Visible = False
  end
  object s_haridor: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'SELECT * FROM s_haridor where del_flag=1 and client_id = :id ord' +
        'er by nom')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 710
    Top = 125
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object s_haridorid: TIntegerField
      FieldName = 'id'
    end
    object s_haridorhnom: TStringField
      FieldName = 'hnom'
      Size = 255
    end
    object s_haridorqarz_summa: TFloatField
      FieldName = 'qarz_summa'
    end
    object s_haridorqarz_epos: TFloatField
      FieldName = 'qarz_epos'
    end
    object s_haridorqarz_dollar: TFloatField
      FieldName = 'qarz_dollar'
    end
    object s_haridorkirim: TFloatField
      FieldName = 'kirim'
    end
    object s_haridorkirimd: TFloatField
      FieldName = 'kirimd'
    end
    object s_haridorchiqim: TFloatField
      FieldName = 'chiqim'
    end
    object s_haridorchiqimd: TFloatField
      FieldName = 'chiqimd'
    end
    object s_haridorJami_summa: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Jami_summa'
      OnGetText = s_haridorJami_summaGetText
      Calculated = True
    end
    object s_haridorJami_dollar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Jami_dollar'
      OnGetText = s_haridorJami_dollarGetText
      Calculated = True
    end
  end
  object Ds_haridor: TDataSource
    DataSet = s_haridor
    Left = 717
    Top = 157
  end
  object sf: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'select id,nomer,sana,qarz_summa,qarz_dollar,qarz_s_ost,qarz_d_os' +
        't from asos WHERE del_flag=1 and h_id =:id and tur_oper in (2) o' +
        'rder by sana')
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Ds_haridor
    Left = 767
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Dsf: TDataSource
    DataSet = sf
    Left = 767
    Top = 156
  end
  object jamla: TZQuery
    Connection = DMS.lbd
    OnCalcFields = jamlaCalcFields
    SQL.Strings = (
      
        'select DATEDIFF(now(),srok) as sfkun,DATEDIFF(now(),srok) as sro' +
        'kkun,qarz.* from qarz order by xnom')
    Params = <>
    Left = 823
    Top = 168
    object jamlaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object jamlasplid: TIntegerField
      FieldName = 'splid'
      Required = True
    end
    object jamlaxnom: TStringField
      FieldName = 'xnom'
      Size = 255
    end
    object jamlainom: TStringField
      FieldName = 'inom'
      Size = 255
    end
    object jamlatel: TStringField
      FieldName = 'tel'
      Size = 100
    end
    object jamlaqarz_s: TFloatField
      FieldName = 'qarz_s'
    end
    object jamlaqarz_d: TFloatField
      FieldName = 'qarz_d'
    end
    object jamlaqarz_b: TFloatField
      FieldName = 'qarz_b'
    end
    object jamlah_id: TIntegerField
      FieldName = 'h_id'
    end
    object jamlainv_id: TIntegerField
      FieldName = 'inv_id'
    end
    object jamlaasos_id: TIntegerField
      FieldName = 'asos_id'
    end
    object jamlatelegram: TStringField
      FieldName = 'telegram'
      Size = 100
    end
    object jamlaemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object jamlatur: TIntegerField
      FieldName = 'tur'
    end
    object jamlasrok: TDateField
      FieldName = 'srok'
    end
    object jamlasana: TDateField
      FieldName = 'sana'
    end
    object jamlasend: TDateField
      FieldName = 'send'
    end
    object jamlabegin: TDateField
      FieldName = 'begin'
    end
    object jamlaend: TDateField
      FieldName = 'end'
    end
    object jamlayaqin: TIntegerField
      FieldName = 'yaqin'
    end
    object jamlagaldi: TIntegerField
      FieldName = 'galdi'
    end
    object jamlauxladi: TIntegerField
      FieldName = 'uxladi'
    end
    object jamlakun_sana: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'kun_sana'
      Calculated = True
    end
    object jamlakun_muddat: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'kun_muddat'
      OnGetText = jamlakun_muddatGetText
      Calculated = True
    end
    object jamlasfkun: TLargeintField
      FieldName = 'sfkun'
      ReadOnly = True
    end
    object jamlasrokkun: TLargeintField
      FieldName = 'srokkun'
      ReadOnly = True
    end
  end
  object Djamla: TDataSource
    DataSet = jamla
    Left = 831
    Top = 124
  end
end
