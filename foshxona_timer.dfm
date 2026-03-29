object oshxona_timer: Toshxona_timer
  Left = 108
  Top = 31
  Width = 1136
  Height = 696
  Caption = '+'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 24
  object bosmalash: TButton
    Left = 27
    Top = 179
    Width = 134
    Height = 27
    Caption = 'Bittalab'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    Visible = False
    OnClick = bosmalashClick
    OnKeyPress = bosmalashKeyPress
  end
  object chek: TButton
    Left = 21
    Top = 229
    Width = 132
    Height = 25
    Caption = 'Chek'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    Visible = False
    OnClick = chekClick
  end
  object Gasos: TDBGrid
    Left = 8
    Top = 472
    Width = 177
    Height = 145
    DataSource = Dasosall
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = GasosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'diler_id'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 's_xodim'
        Title.Alignment = taCenter
        Title.Caption = 'Hodim'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 's_mobil'
        Title.Alignment = taCenter
        Title.Caption = 'Joy'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sana'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'changedate'
        Title.Alignment = taCenter
        Title.Caption = 'Sana'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'user_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'summa'
        Title.Alignment = taCenter
        Title.Caption = 'Summa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol'
        Title.Alignment = taCenter
        Title.Caption = 'Soni'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sum_naqd'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sum_plastik'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'qabul_sana'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'print_flag'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'xizmat'
        Title.Alignment = taCenter
        Title.Caption = 'Xizmat'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'h_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sum_epos'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sum_naqd_ch'
        Title.Caption = 'Jami'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'summa_ch'
        Title.Alignment = taCenter
        Title.Caption = 'Jami'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'haridor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'xizmat_foiz'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'mobil'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'shartnoma_id'
        Visible = False
      end>
  end
  object GAsos_slave: TDBGrid
    Left = 8
    Top = 292
    Width = 177
    Height = 179
    DataSource = Dasos_slaveall
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'tovar_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'tovar_nom'
        Title.Alignment = taCenter
        Title.Caption = 'Nom'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'izm_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'izm1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'tulov_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'seriya'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'polka'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'srok'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'turi'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'resept'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'qrkod'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'kol'
        Title.Alignment = taCenter
        Title.Caption = 'Soni'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sena'
        Title.Alignment = taCenter
        Title.Caption = 'Baxosi'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sena_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sotish'
        Title.Alignment = taCenter
        Title.Caption = 'Bahosi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summa'
        Title.Alignment = taCenter
        Title.Caption = 'Summasi'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summa_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'summa_all'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sotish_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'foiz'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'foiz_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'subkod'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'user_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'changedate'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'asos_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'del_flag'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'kol_ost'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'kol_in_ost'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'summa_ost'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'summa_in_ost'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'summa_all_ost'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sena_d'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sena_in_d'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sotish_d'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sotish_in_d'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'zakaz'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zakaz_ok'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zakaz_end'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zakaz_see'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zakaz_print'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zakaz_gapir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'foiz_ch2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'foiz_schet'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'foiz_opt1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'foiz_opt2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'opt1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'opt1_pl'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'opt1_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'opt1_pl_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'opt2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'opt2_pl'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'opt2_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'opt2_pl_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'schet'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'schet_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ch2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ch2_in'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 's_tovar'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 's_user'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 's_izm_id'
        Visible = False
      end>
  end
  object start: TButton
    Left = 24
    Top = 14
    Width = 169
    Height = 67
    Caption = 'start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TabStop = False
    OnClick = startClick
  end
  object Edit1: TEdit
    Left = 6
    Top = 89
    Width = 178
    Height = 32
    TabOrder = 5
  end
  object bosmalashold: TButton
    Left = 27
    Top = 139
    Width = 135
    Height = 29
    Caption = 'Buyurtma eski'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = False
    Visible = False
    OnClick = bosmalasholdClick
  end
  object page: TRzPageControl
    Left = 216
    Top = 16
    Width = 841
    Height = 529
    ActivePage = TabSheet3
    TabIndex = 2
    TabOrder = 7
    FixedDimension = 30
    object TabSheet1: TRzTabSheet
      Caption = '1-Ekran'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 837
        Height = 495
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = '2 - ekran'
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 837
        Height = 495
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Sozlash'
      object Label10: TLabel
        Left = 29
        Top = 342
        Width = 106
        Height = 21
        Caption = 'Chek shabloni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 361
        Top = 340
        Width = 75
        Height = 21
        Caption = 'Chek soni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 313
        Top = 303
        Width = 96
        Height = 21
        Caption = 'Chek printeri'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 315
        Top = 254
        Width = 117
        Height = 21
        Caption = 'Shirinlik printeri'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 316
        Top = 214
        Width = 112
        Height = 21
        Caption = 'Ichimlik printer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 314
        Top = 176
        Width = 119
        Height = 21
        Caption = 'Shashlik printeri'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label36: TLabel
        Left = 314
        Top = 136
        Width = 93
        Height = 21
        Caption = 'baliq printeri'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 313
        Top = 96
        Width = 98
        Height = 21
        Caption = 'Salat  printeri'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object ChSalat: TCheckBox
        Left = 24
        Top = 88
        Width = 281
        Height = 33
        Caption = 'Salat buyurtma cheki'
        TabOrder = 0
        OnClick = ChSalatClick
      end
      object Chbaliq: TCheckBox
        Left = 23
        Top = 128
        Width = 262
        Height = 33
        Caption = 'Baliq buyurtma cheki'
        TabOrder = 1
        OnClick = ChbaliqClick
      end
      object Chshashlik: TCheckBox
        Left = 24
        Top = 165
        Width = 269
        Height = 33
        Caption = 'Shashlik buyurtma cheki'
        TabOrder = 2
        OnClick = ChshashlikClick
      end
      object Chichimlik: TCheckBox
        Left = 24
        Top = 207
        Width = 262
        Height = 33
        Caption = 'Ichimlik buyurtma cheki'
        TabOrder = 3
        OnClick = ChichimlikClick
      end
      object Chshirinlik: TCheckBox
        Left = 24
        Top = 248
        Width = 269
        Height = 33
        Caption = 'Shirinlik buyurtma cheki'
        TabOrder = 4
        OnClick = ChshirinlikClick
      end
      object Chmijoz: TCheckBox
        Left = 24
        Top = 292
        Width = 225
        Height = 33
        Caption = 'Mijoz hisob cheki'
        TabOrder = 5
        Visible = False
        OnClick = ChmijozClick
      end
      object chekshablon: TComboBox
        Left = 156
        Top = 338
        Width = 166
        Height = 32
        ItemHeight = 24
        TabOrder = 6
        TabStop = False
        Text = 'chekshablon'
        OnChange = chekshablonChange
      end
      object Ekran: TCheckBox
        Left = 24
        Top = 420
        Width = 89
        Height = 33
        Caption = 'Ekran'
        TabOrder = 7
      end
      object Button1: TButton
        Left = 408
        Top = 408
        Width = 185
        Height = 33
        Caption = #1055#1088#1080#1085#1090#1077#1088' '#1090#1086#1079#1072#1083#1072#1096
        TabOrder = 8
        Visible = False
        WordWrap = True
        OnClick = Button1Click
      end
      object chsoni: TEdit
        Left = 443
        Top = 333
        Width = 49
        Height = 32
        TabOrder = 9
        OnChange = ChsoniChange
      end
      object chekPrinters: TComboBox
        Left = 443
        Top = 293
        Width = 168
        Height = 32
        ItemHeight = 24
        TabOrder = 10
        TabStop = False
        Text = 'chekPrinters'
        OnChange = chekPrintersChange
      end
      object shirinlikPrinters: TComboBox
        Left = 444
        Top = 248
        Width = 168
        Height = 32
        ItemHeight = 24
        TabOrder = 11
        TabStop = False
        Text = 'shirinlikPrinters'
        OnChange = shirinlikPrintersChange
      end
      object ichimlikPrinters: TComboBox
        Left = 443
        Top = 211
        Width = 168
        Height = 32
        ItemHeight = 24
        TabOrder = 12
        TabStop = False
        Text = 'ichimlikPrinters'
        OnChange = ichimlikPrintersChange
      end
      object shashlikPrinters: TComboBox
        Left = 444
        Top = 173
        Width = 168
        Height = 32
        ItemHeight = 24
        TabOrder = 13
        TabStop = False
        Text = 'shashlikPrinters'
        OnChange = shashlikPrintersChange
      end
      object baliqPrinters: TComboBox
        Left = 444
        Top = 133
        Width = 168
        Height = 32
        ItemHeight = 24
        TabOrder = 14
        TabStop = False
        Text = 'baliqPrinters'
        OnChange = baliqPrintersChange
      end
      object salatPrinters: TComboBox
        Left = 444
        Top = 93
        Width = 168
        Height = 32
        ItemHeight = 24
        TabOrder = 15
        TabStop = False
        Text = 'salatPrinters'
        OnChange = salatPrintersChange
      end
    end
  end
  object lbd: TZConnection
    Protocol = 'mysql-5'
    HostName = '127.0.0.1'
    Port = 3306
    Database = 'kafe'
    User = 'info!traffic'
    Password = 'masterkalit'
    Catalog = 'kafe'
    Properties.Strings = (
      'codepage=cp1251'
      'reconnect=true')
    Connected = True
    DesignConnection = True
    Left = 741
    Top = 32
  end
  object tasos_slave: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select s.*,t.nom as s_tovar,user.username as s_user,s_izm.nom as' +
        ' s_izm_id from asos a,user,s_tovar t, asos_slave s left JOIN s_i' +
        'zm on s_izm.id=s.izm_id where a.id=s.asos_id and t.id=s.tovar_id' +
        ' and zakaz is not null and zakaz_print is null and user.id=a.use' +
        'r_id and s.del_flag=1 and a.tur_oper=2 and a.user_id=a.xodim_id ' +
        'and t.brend = 62 and a.client_id=4')
    Params = <>
    DataSource = Dasos
    Left = 687
    Top = 33
  end
  object Dasos_slave: TDataSource
    DataSet = tasos_slave
    Left = 687
    Top = 65
  end
  object frxsf: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'XP-58'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39341.493807129600000000
    ReportOptions.LastChange = 45508.742748344910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var i:integer;'
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  i:=0;'
      'end;'
      ''
      'procedure DetailData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  i:=i+1;'
      'end;'
      ''
      'begin'
      'end.')
    Left = 568
    Top = 32
    Datasets = <
      item
        DataSet = asos
        DataSetName = 'asos'
      end
      item
        DataSet = asos_slave
        DataSetName = 'asos_slave'
      end
      item
        DataSet = client
        DataSetName = 'client'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 78.000000000000000000
      PaperHeight = 3000.000000000000000000
      PaperSize = 256
      RightMargin = 5.000000000000000000
      Frame.Typ = []
      Frame.Width = 3.000000000000000000
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 19.236240000000000000
        Top = 177.637910000000000000
        Width = 275.905690000000000000
        OnBeforePrint = 'DetailData1OnBeforePrint'
        DataSet = asos_slave
        DataSetName = 'asos_slave'
        RowCount = 0
        Stretched = True
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 5.661410000000000000
          Top = -4.000000000000000000
          Width = 207.874067010000000000
          Height = 15.118115120000000000
          StretchMode = smActualHeight
          DataSet = asos_slave
          DataSetName = 'asos_slave'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Nirmala UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8 = (
            '[<asos_slave."s_tovar">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 220.992270000000000000
          Width = 45.354311180000000000
          Height = 11.338585120000000000
          StretchMode = smActualHeight
          DataSet = asos_slave
          DataSetName = 'asos_slave'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Nirmala UI'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[asos_slave."kol"][IIF(<asos_slave."kol_in">=0,'#39#39','#39','#39')][IIF(<aso' +
              's_slave."kol_in">=0,'#39#39', <asos_slave."kol_in"> )]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 219.433210000000000000
          Height = 11.338590000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 271.567100000000000000
          Top = 0.338590000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Height = 11.338590000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Left = 4.779527560000000000
          Top = 14.913420000000000000
          Width = 268.346630000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Top = 154.960730000000000000
        Width = 275.905690000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = client
        DataSetName = 'client'
        RowCount = 0
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 83.149660000000000000
        Top = 219.212740000000000000
        Width = 275.905690000000000000
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = -12.118120000000000000
          Top = 64.252010000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 74.685220000000000000
        Top = 18.897650000000000000
        Width = 275.905690000000000000
        Stretched = True
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 93.047310000000000000
          Top = 3.102350000000000000
          Width = 143.622091180000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = asos
          DataSetName = 'asos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd.mm.yy hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Nirmala UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8 = (
            '[asos_slave."zakaz"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 31.031540000000000000
          Width = 268.346678820000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = asos
          DataSetName = 'asos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Nirmala UI'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = []
          Memo.UTF8 = (
            'Of-t: [asos."s_xodim"] Stol: [asos."s_mobil"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 33.574830000000000000
          Top = 55.535560000000000000
          Width = 154.960778820000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          DataSet = asos
          DataSetName = 'asos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Nirmala UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8 = (
            'Buyurtma nomi')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 234.008040000000000000
          Top = 56.637910000000000000
          Width = 22.677228820000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          DataSet = asos
          DataSetName = 'asos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Nirmala UI'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Soni')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 5.897650000000000000
          Top = 57.700990000000000000
          Width = 266.456692910000000000
          Height = 15.118120000000000000
          Frame.Typ = []
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Top = 55.929190000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
  object tlink: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select t.nom,a.zakaz,a.zakaz_ok,a.kol,a.kol_in from s_tovar t,as' +
        'os_slave a,asos WHERE a.del_flag=1 and asos.tur_oper=2 and a.aso' +
        's_id=asos.id and a.tovar_id=t.id and a.zakaz is not null and a.i' +
        'd=195')
    Params = <>
    Left = 1012
    Top = 48
  end
  object main_link: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_kassa')
    Params = <>
    Left = 964
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 144
    Top = 16
  end
  object Dasos: TDataSource
    DataSet = tasos
    Left = 639
    Top = 65
  end
  object s_client: TZQuery
    Connection = lbd
    SQL.Strings = (
      'select * from s_client where id=:client_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
    DataSource = Dasos
    Left = 526
    Top = 29
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
    object s_clientid: TIntegerField
      FieldName = 'id'
    end
    object s_clientnom: TStringField
      FieldName = 'nom'
      Size = 250
    end
    object s_clientuserpass: TStringField
      FieldName = 'userpass'
      Size = 50
    end
    object s_clientkomu: TSmallintField
      FieldName = 'komu'
    end
    object s_clientadress: TStringField
      FieldName = 'adress'
      Size = 250
    end
    object s_clientmanzil: TStringField
      FieldName = 'manzil'
      Size = 250
    end
    object s_clientindeks: TStringField
      FieldName = 'indeks'
    end
    object s_clientobl: TIntegerField
      FieldName = 'obl'
    end
    object s_clienttuman: TIntegerField
      FieldName = 'tuman'
    end
    object s_clientboss: TStringField
      FieldName = 'boss'
      Size = 150
    end
    object s_clienttel: TStringField
      FieldName = 'tel'
      Size = 50
    end
    object s_clientrs: TStringField
      FieldName = 'rs'
    end
    object s_clientinn: TStringField
      FieldName = 'inn'
      Size = 9
    end
    object s_clientokonh: TStringField
      FieldName = 'okonh'
      Size = 5
    end
    object s_clientbank: TStringField
      FieldName = 'bank'
      Size = 150
    end
    object s_clientkod_bank: TStringField
      FieldName = 'kod_bank'
      Size = 5
    end
    object s_clientflag: TSmallintField
      FieldName = 'flag'
    end
    object s_clientgorod: TStringField
      FieldName = 'gorod'
      Size = 50
    end
    object s_clientactive: TSmallintField
      FieldName = 'active'
    end
    object s_clienttugashsana: TDateField
      FieldName = 'tugashsana'
    end
    object s_clientchangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object s_clientuyu_type: TIntegerField
      FieldName = 'uyu_type'
    end
    object s_clientsana: TDateField
      FieldName = 'sana'
    end
    object s_clientsrok: TDateField
      FieldName = 'srok'
    end
    object s_clientprim: TStringField
      FieldName = 'prim'
      Size = 250
    end
    object s_clientsayt: TStringField
      FieldName = 'sayt'
      Size = 100
    end
    object s_clientemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object s_clientmasul1: TStringField
      FieldName = 'masul1'
      Size = 100
    end
    object s_clienttelsms1: TStringField
      FieldName = 'telsms1'
      Size = 13
    end
    object s_clientmasul2: TStringField
      FieldName = 'masul2'
      Size = 100
    end
    object s_clienttelsms2: TStringField
      FieldName = 'telsms2'
      Size = 13
    end
    object s_clientnik: TSmallintField
      FieldName = 'nik'
    end
    object s_clientdel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object s_clientiamhere: TIntegerField
      FieldName = 'iamhere'
    end
    object s_clientdiamhere: TDateTimeField
      FieldName = 'diamhere'
    end
    object s_clientvaqtout: TDateTimeField
      FieldName = 'vaqtout'
    end
    object s_clientkim: TStringField
      FieldName = 'kim'
      Size = 100
    end
    object s_clienttarmoq: TStringField
      FieldName = 'tarmoq'
      Size = 100
    end
    object s_clientmr: TStringField
      FieldName = 'mr'
    end
    object s_clientuser_id: TIntegerField
      FieldName = 'user_id'
    end
    object s_clientvaqt_in: TDateTimeField
      FieldName = 'vaqt_in'
    end
    object s_clientdisp_n: TIntegerField
      FieldName = 'disp_n'
    end
    object s_clientdisp_d: TDateField
      FieldName = 'disp_d'
    end
    object s_clientssana: TDateField
      FieldName = 'ssana'
    end
    object s_clientsnomer: TStringField
      FieldName = 'snomer'
      Size = 50
    end
    object s_clientgaraj: TIntegerField
      FieldName = 'garaj'
    end
    object s_clientgaraj_turi: TSmallintField
      FieldName = 'garaj_turi'
    end
    object s_clientglav_id: TIntegerField
      FieldName = 'glav_id'
    end
    object s_clientclient_tur: TIntegerField
      FieldName = 'client_tur'
    end
    object s_clientiduz: TIntegerField
      FieldName = 'iduz'
    end
    object s_clientkod: TIntegerField
      FieldName = 'kod'
    end
    object s_clientvazir: TIntegerField
      FieldName = 'vazir'
    end
    object s_clients1: TStringField
      FieldName = 's1'
      Size = 12
    end
    object s_clientflag1: TStringField
      FieldName = 'flag1'
    end
    object s_clientflag2: TStringField
      FieldName = 'flag2'
    end
    object s_clientsumma: TFloatField
      FieldName = 'summa'
      Required = True
    end
    object s_clientedit_it: TSmallintField
      FieldName = 'edit_it'
    end
    object s_clientkolin: TSmallintField
      FieldName = 'kolin'
    end
    object s_clientprikname: TStringField
      FieldName = 'prikname'
      Size = 50
    end
    object s_clientprikdate: TDateTimeField
      FieldName = 'prikdate'
    end
    object s_clientfilenom: TStringField
      FieldName = 'filenom'
      Size = 50
    end
    object s_clientat91: TSmallintField
      FieldName = 'at91'
    end
    object s_clientyaxlitlash: TSmallintField
      FieldName = 'yaxlitlash'
    end
    object s_clientyaxlitlash_in: TSmallintField
      FieldName = 'yaxlitlash_in'
    end
    object s_clientfoiz: TFloatField
      FieldName = 'foiz'
      Required = True
    end
    object s_clientfoiz_in: TFloatField
      FieldName = 'foiz_in'
      Required = True
    end
    object s_clientkomputer: TSmallintField
      FieldName = 'komputer'
      Required = True
    end
    object s_clientchegirma: TFloatField
      FieldName = 'chegirma'
    end
    object s_clientseriya: TSmallintField
      FieldName = 'seriya'
      Required = True
    end
    object s_clientichkitovar: TSmallintField
      FieldName = 'ichkitovar'
      Required = True
    end
    object s_clientlasttz_id: TSmallintField
      FieldName = 'lasttz_id'
    end
    object s_clientlastta_id: TSmallintField
      FieldName = 'lastta_id'
    end
    object s_clientlast_pl_k: TIntegerField
      FieldName = 'last_pl_k'
      Required = True
    end
    object s_clientlast_pl_b: TIntegerField
      FieldName = 'last_pl_b'
      Required = True
    end
    object s_clientkk: TSmallintField
      FieldName = 'kk'
      Required = True
    end
    object s_clientdollar: TIntegerField
      FieldName = 'dollar'
      Required = True
    end
    object s_clientbux: TDateField
      FieldName = 'bux'
    end
    object s_clientfoiz_opt2: TFloatField
      FieldName = 'foiz_opt2'
    end
    object s_clientfoiz_opt1: TFloatField
      FieldName = 'foiz_opt1'
    end
    object s_clientfoiz_schet: TFloatField
      FieldName = 'foiz_schet'
    end
    object s_clientfoiz_ch2: TFloatField
      FieldName = 'foiz_ch2'
    end
  end
  object Ds_client: TDataSource
    DataSet = s_client
    Left = 525
    Top = 61
  end
  object tasos: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select a.*,u.fio as s_xodim from asos a,user u where u.id=a.user' +
        '_id and print_flag=1 limit 1')
    Params = <>
    Left = 638
    Top = 33
    object tasosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object tasosclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object tasoskassa_id: TIntegerField
      FieldName = 'kassa_id'
    end
    object tasosxodim_id: TIntegerField
      FieldName = 'xodim_id'
      Required = True
    end
    object tasossana: TDateField
      FieldName = 'sana'
    end
    object tasosdel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object tasoss_kassa: TStringField
      FieldKind = fkLookup
      FieldName = 's_kassa'
      LookupDataSet = s_kassa
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'kassa_id'
      Size = 150
      Lookup = True
    end
    object tasoschangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object tasosuser_id: TIntegerField
      FieldName = 'user_id'
    end
    object tasossumma: TFloatField
      FieldName = 'summa'
    end
    object tasoskol: TIntegerField
      FieldName = 'kol'
    end
    object tasostur_oper: TSmallintField
      FieldName = 'tur_oper'
    end
    object tasosdiler_id: TIntegerField
      FieldName = 'diler_id'
    end
    object tasosseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object tasosnomer: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object tasossum_naqd: TFloatField
      FieldName = 'sum_naqd'
    end
    object tasossum_plastik: TFloatField
      FieldName = 'sum_plastik'
    end
    object tasosqabul_sana: TDateTimeField
      FieldName = 'qabul_sana'
    end
    object tasosprint_flag: TSmallintField
      FieldName = 'print_flag'
    end
    object tasosombor_id: TIntegerField
      FieldName = 'ombor_id'
    end
    object tasosqarz_summa: TFloatField
      FieldName = 'qarz_summa'
    end
    object tasosqarz_kim: TStringField
      FieldName = 'qarz_kim'
      Size = 100
    end
    object tasosqarz_izoh: TStringField
      FieldName = 'qarz_izoh'
      Size = 250
    end
    object tasosqarz_flag: TSmallintField
      FieldName = 'qarz_flag'
    end
    object tasosh_id: TIntegerField
      FieldName = 'h_id'
    end
    object tasossum_epos: TFloatField
      FieldName = 'sum_epos'
    end
    object tasoscheg_n: TFloatField
      FieldName = 'cheg_n'
    end
    object tasoscheg_p: TFloatField
      FieldName = 'cheg_p'
    end
    object tasoscheg_e: TFloatField
      FieldName = 'cheg_e'
    end
    object tasossum_naqd_ch: TFloatField
      FieldName = 'sum_naqd_ch'
    end
    object tasossum_plast_ch: TFloatField
      FieldName = 'sum_plast_ch'
    end
    object tasossum_epos_ch: TFloatField
      FieldName = 'sum_epos_ch'
    end
    object tasossumma_ch: TFloatField
      FieldName = 'summa_ch'
    end
    object tasospl_id: TIntegerField
      FieldName = 'pl_id'
    end
    object tasosharidor: TStringField
      FieldKind = fkLookup
      FieldName = 'haridor'
      LookupDataSet = s_haridor
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'h_id'
      Size = 150
      Lookup = True
    end
    object tasoskurs: TFloatField
      FieldName = 'kurs'
    end
    object tasosdollar: TSmallintField
      FieldName = 'dollar'
    end
    object tasossum_d: TFloatField
      FieldName = 'sum_d'
    end
    object tasosplastik_id: TIntegerField
      FieldName = 'plastik_id'
    end
    object tasosmobil: TIntegerField
      FieldName = 'mobil'
      Required = True
    end
    object tasosxizmat_foiz: TSmallintField
      FieldName = 'xizmat_foiz'
      Required = True
    end
    object tasosxizmat: TFloatField
      FieldName = 'xizmat'
    end
    object tasosfilial_id: TIntegerField
      FieldName = 'filial_id'
    end
    object tasosshartnoma_id: TIntegerField
      FieldName = 'shartnoma_id'
    end
    object tasoswoywo_bill_type: TSmallintField
      FieldName = 'woywo_bill_type'
    end
    object tasoss_xodim: TStringField
      FieldKind = fkLookup
      FieldName = 's_xodim'
      LookupDataSet = s_user
      LookupKeyFields = 'id'
      LookupResultField = 'fio'
      KeyFields = 'user_id'
      Size = 250
      Lookup = True
    end
    object tasoss_mobil: TStringField
      FieldKind = fkLookup
      FieldName = 's_mobil'
      LookupDataSet = tmobil
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'mobil'
      Size = 50
      Lookup = True
    end
  end
  object s_kassa: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_kassa ')
    Params = <>
    Left = 394
    Top = 31
    object s_kassaid: TIntegerField
      FieldName = 'id'
    end
    object s_kassanom: TStringField
      FieldName = 'nom'
      Size = 150
    end
    object s_kassastatus: TSmallintField
      FieldName = 'status'
    end
    object s_kassauser_id: TIntegerField
      FieldName = 'user_id'
    end
    object s_kassachangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object s_kassaclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object s_kassadel_flag: TSmallintField
      FieldName = 'del_flag'
    end
  end
  object Ds_kassa: TDataSource
    DataSet = s_kassa
    Left = 402
    Top = 63
  end
  object s_user: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM user')
    Params = <>
    Left = 442
    Top = 32
  end
  object Ds_user: TDataSource
    DataSet = s_user
    Left = 442
    Top = 63
  end
  object s_haridor: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_haridor where del_flag=1 order by nom')
    Params = <>
    Left = 488
    Top = 31
    object s_haridorid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object s_haridorclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object s_haridornom: TStringField
      FieldName = 'nom'
      Size = 250
    end
    object s_haridorkomu: TSmallintField
      FieldName = 'komu'
    end
    object s_haridoradress: TStringField
      FieldName = 'adress'
      Size = 250
    end
    object s_haridormanzil: TStringField
      FieldName = 'manzil'
      Size = 250
    end
    object s_haridorindeks: TStringField
      FieldName = 'indeks'
    end
    object s_haridorobl: TIntegerField
      FieldName = 'obl'
    end
    object s_haridortuman: TIntegerField
      FieldName = 'tuman'
    end
    object s_haridorboss: TStringField
      FieldName = 'boss'
      Size = 150
    end
    object s_haridortel: TStringField
      FieldName = 'tel'
      Size = 50
    end
    object s_haridorrs: TStringField
      FieldName = 'rs'
    end
    object s_haridorinn: TStringField
      FieldName = 'inn'
      Size = 9
    end
    object s_haridorokonh: TStringField
      FieldName = 'okonh'
      Size = 9
    end
    object s_haridorbank: TStringField
      FieldName = 'bank'
      Size = 150
    end
    object s_haridorkod_bank: TStringField
      FieldName = 'kod_bank'
      Size = 5
    end
    object s_haridorgorod: TStringField
      FieldName = 'gorod'
      Size = 50
    end
    object s_haridoractive: TSmallintField
      FieldName = 'active'
    end
    object s_haridortugashsana: TDateField
      FieldName = 'tugashsana'
    end
    object s_haridoruser_id: TIntegerField
      FieldName = 'user_id'
    end
    object s_haridorchangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object s_haridoruyu_type: TIntegerField
      FieldName = 'uyu_type'
    end
    object s_haridorsana: TDateField
      FieldName = 'sana'
    end
    object s_haridorsrok: TDateField
      FieldName = 'srok'
    end
    object s_haridorprim: TStringField
      FieldName = 'prim'
      Size = 250
    end
    object s_haridoremail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object s_haridormasul1: TStringField
      FieldName = 'masul1'
      Size = 100
    end
    object s_haridortelsms1: TStringField
      FieldName = 'telsms1'
      Size = 9
    end
    object s_haridormasul2: TStringField
      FieldName = 'masul2'
      Size = 100
    end
    object s_haridortelsms2: TStringField
      FieldName = 'telsms2'
      Size = 9
    end
    object s_haridordel_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object s_haridoriamhere: TIntegerField
      FieldName = 'iamhere'
    end
    object s_haridordiamhere: TDateTimeField
      FieldName = 'diamhere'
    end
    object s_haridorprikname: TStringField
      FieldName = 'prikname'
      Size = 50
    end
    object s_haridorprikdate: TDateTimeField
      FieldName = 'prikdate'
    end
    object s_haridorfilenom: TStringField
      FieldName = 'filenom'
      Size = 50
    end
    object s_haridorvaqt_in: TDateTimeField
      FieldName = 'vaqt_in'
    end
    object s_haridorvaqtout: TDateTimeField
      FieldName = 'vaqtout'
    end
    object s_haridorkim: TStringField
      FieldName = 'kim'
      Size = 100
    end
    object s_haridortarmoq: TStringField
      FieldName = 'tarmoq'
      Size = 100
    end
  end
  object Ds_haridor: TDataSource
    DataSet = s_haridor
    Left = 487
    Top = 63
  end
  object asos: TfrxDBDataset
    UserName = 'asos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'client_id=client_id'
      'kassa_id=kassa_id'
      'xodim_id=xodim_id'
      'sana=sana'
      'del_flag=del_flag'
      's_kassa=s_kassa'
      'changedate=changedate'
      'user_id=user_id'
      'summa=summa'
      'kol=kol'
      'tur_oper=tur_oper'
      'diler_id=diler_id'
      'seriya=seriya'
      'nomer=nomer'
      'sum_naqd=sum_naqd'
      'sum_plastik=sum_plastik'
      'qabul_sana=qabul_sana'
      'print_flag=print_flag'
      'ombor_id=ombor_id'
      'qarz_summa=qarz_summa'
      'qarz_kim=qarz_kim'
      'qarz_izoh=qarz_izoh'
      'qarz_flag=qarz_flag'
      'h_id=h_id'
      'sum_epos=sum_epos'
      'cheg_n=cheg_n'
      'cheg_p=cheg_p'
      'cheg_e=cheg_e'
      'sum_naqd_ch=sum_naqd_ch'
      'sum_plast_ch=sum_plast_ch'
      'sum_epos_ch=sum_epos_ch'
      'summa_ch=summa_ch'
      'pl_id=pl_id'
      'haridor=haridor'
      'kurs=kurs'
      'dollar=dollar'
      'sum_d=sum_d'
      'plastik_id=plastik_id'
      'mobil=mobil'
      'xizmat_foiz=xizmat_foiz'
      'xizmat=xizmat'
      'filial_id=filial_id'
      'shartnoma_id=shartnoma_id'
      'woywo_bill_type=woywo_bill_type'
      's_xodim=s_xodim'
      's_mobil=s_mobil')
    DataSource = Dasos
    BCDToCurrency = False
    Left = 834
    Top = 239
  end
  object client: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'client'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'nom=nom'
      'userpass=userpass'
      'komu=komu'
      'adress=adress'
      'manzil=manzil'
      'indeks=indeks'
      'obl=obl'
      'tuman=tuman'
      'boss=boss'
      'tel=tel'
      'rs=rs'
      'inn=inn'
      'okonh=okonh'
      'bank=bank'
      'kod_bank=kod_bank'
      'flag=flag'
      'gorod=gorod'
      'active=active'
      'tugashsana=tugashsana'
      'changedate=changedate'
      'uyu_type=uyu_type'
      'sana=sana'
      'srok=srok'
      'prim=prim'
      'sayt=sayt'
      'email=email'
      'masul1=masul1'
      'telsms1=telsms1'
      'masul2=masul2'
      'telsms2=telsms2'
      'nik=nik'
      'del_flag=del_flag'
      'iamhere=iamhere'
      'diamhere=diamhere'
      'vaqtout=vaqtout'
      'kim=kim'
      'tarmoq=tarmoq'
      'mr=mr'
      'user_id=user_id'
      's_user=s_user'
      'vaqt_in=vaqt_in'
      'disp_n=disp_n'
      'disp_d=disp_d'
      'ssana=ssana'
      'snomer=snomer'
      'x_id=x_id'
      'garaj=garaj'
      'clnom=clnom')
    DataSource = Ds_client
    BCDToCurrency = False
    Left = 770
    Top = 239
  end
  object asos_slave: TfrxDBDataset
    UserName = 'asos_slave'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'tovar_id=tovar_id'
      'tovar_nom=tovar_nom'
      'izm_id=izm_id'
      'izm1=izm1'
      'tulov_id=tulov_id'
      'seriya=seriya'
      'polka=polka'
      'srok=srok'
      'turi=turi'
      'resept=resept'
      'qrkod=qrkod'
      'kol=kol'
      'kol_in=kol_in'
      'sena=sena'
      'sena_in=sena_in'
      'summa=summa'
      'summa_in=summa_in'
      'summa_all=summa_all'
      'sotish=sotish'
      'sotish_in=sotish_in'
      'foiz=foiz'
      'foiz_in=foiz_in'
      'subkod=subkod'
      'user_id=user_id'
      'changedate=changedate'
      'asos_id=asos_id'
      'del_flag=del_flag'
      'kol_ost=kol_ost'
      'kol_in_ost=kol_in_ost'
      'summa_ost=summa_ost'
      'summa_in_ost=summa_in_ost'
      'summa_all_ost=summa_all_ost'
      'sena_d=sena_d'
      'sena_in_d=sena_in_d'
      'sotish_d=sotish_d'
      'sotish_in_d=sotish_in_d'
      'zakaz=zakaz'
      'zakaz_ok=zakaz_ok'
      'zakaz_end=zakaz_end'
      'zakaz_see=zakaz_see'
      'zakaz_print=zakaz_print'
      'zakaz_gapir=zakaz_gapir'
      'foiz_ch2=foiz_ch2'
      'foiz_schet=foiz_schet'
      'foiz_opt1=foiz_opt1'
      'foiz_opt2=foiz_opt2'
      'opt1=opt1'
      'opt1_pl=opt1_pl'
      'opt1_in=opt1_in'
      'opt1_pl_in=opt1_pl_in'
      'opt2=opt2'
      'opt2_pl=opt2_pl'
      'opt2_in=opt2_in'
      'opt2_pl_in=opt2_pl_in'
      'schet=schet'
      'schet_in=schet_in'
      'ch2=ch2'
      'ch2_in=ch2_in'
      's_tovar=s_tovar'
      's_user=s_user'
      's_izm_id=s_izm_id')
    DataSource = Dasos_slave
    BCDToCurrency = False
    Left = 801
    Top = 240
  end
  object link: TfrxDBDataset
    UserName = 'link'
    CloseDataSource = False
    FieldAliases.Strings = (
      's_tovar=s_tovar'
      'sotish=sotish'
      'sotish_in=sotish_in'
      'seriya=seriya'
      'id=id'
      'srok=srok'
      'tkol_in=tkol_in'
      'kol=kol'
      'kol_in=kol_in')
    DataSource = Dtmobil
    BCDToCurrency = False
    Left = 818
    Top = 271
  end
  object harid: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'Haridor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'client_id=client_id'
      'nom=nom'
      'komu=komu'
      'adress=adress'
      'manzil=manzil'
      'indeks=indeks'
      'obl=obl'
      'tuman=tuman'
      'boss=boss'
      'tel=tel'
      'rs=rs'
      'inn=inn'
      'okonh=okonh'
      'bank=bank'
      'kod_bank=kod_bank'
      'gorod=gorod'
      'active=active'
      'tugashsana=tugashsana'
      'user_id=user_id'
      'changedate=changedate'
      'uyu_type=uyu_type'
      'sana=sana'
      'srok=srok'
      'prim=prim'
      'email=email'
      'masul1=masul1'
      'telsms1=telsms1'
      'masul2=masul2'
      'telsms2=telsms2'
      'del_flag=del_flag'
      'iamhere=iamhere'
      'diamhere=diamhere'
      'prikname=prikname'
      'prikdate=prikdate'
      'filenom=filenom'
      'vaqt_in=vaqt_in'
      'vaqtout=vaqtout'
      'kim=kim'
      'tarmoq=tarmoq')
    DataSource = Ds_haridor
    BCDToCurrency = False
    Left = 866
    Top = 239
  end
  object tmobil: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT* FROM s_mobil ')
    Params = <>
    Left = 860
    Top = 33
  end
  object Dtmobil: TDataSource
    DataSet = tmobil
    Left = 862
    Top = 65
  end
  object tzakaz: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select s.id,s.zakaz,s.kol,s.kol_in,t.nom as s_tovar,user.usernam' +
        'e as s_user,s_izm.nom as s_izm_id,m.nom as stol from s_mobil m,a' +
        'sos a,user,s_tovar t, asos_slave s left JOIN s_izm on s_izm.id=s' +
        '.izm_id where a.mobil=m.id and a.id=s.asos_id and t.id=s.tovar_i' +
        'd')
    Params = <>
    Left = 352
    Top = 32
    object tzakazkol: TIntegerField
      FieldName = 'kol'
    end
    object tzakazs_tovar: TStringField
      FieldName = 's_tovar'
      Size = 250
    end
    object tzakazs_user: TStringField
      FieldName = 's_user'
      Required = True
      Size = 255
    end
    object tzakazs_izm_id: TStringField
      FieldName = 's_izm_id'
      Required = True
      Size = 50
    end
    object tzakazstol: TStringField
      FieldName = 'stol'
      Required = True
      Size = 150
    end
    object tzakazzakaz: TDateTimeField
      FieldName = 'zakaz'
    end
    object tzakazid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object tzakazkol_in: TIntegerField
      FieldName = 'kol_in'
    end
  end
  object Dzakaz: TDataSource
    DataSet = tzakaz
    Left = 352
    Top = 62
  end
  object tasosall: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select a.*,u.fio as s_xodim from asos a,user u where u.id=a.user' +
        '_id and print_flag=1 limit 1')
    Params = <>
    Left = 510
    Top = 137
    object IntegerField1: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'client_id'
    end
    object IntegerField3: TIntegerField
      FieldName = 'kassa_id'
    end
    object IntegerField4: TIntegerField
      FieldName = 'xodim_id'
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'sana'
    end
    object SmallintField1: TSmallintField
      FieldName = 'del_flag'
    end
    object StringField1: TStringField
      FieldKind = fkLookup
      FieldName = 's_kassa'
      LookupDataSet = s_kassa
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'kassa_id'
      Size = 150
      Lookup = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'changedate'
    end
    object IntegerField5: TIntegerField
      FieldName = 'user_id'
    end
    object FloatField1: TFloatField
      FieldName = 'summa'
    end
    object IntegerField6: TIntegerField
      FieldName = 'kol'
    end
    object SmallintField2: TSmallintField
      FieldName = 'tur_oper'
    end
    object IntegerField7: TIntegerField
      FieldName = 'diler_id'
    end
    object StringField2: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object FloatField2: TFloatField
      FieldName = 'sum_naqd'
    end
    object FloatField3: TFloatField
      FieldName = 'sum_plastik'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'qabul_sana'
    end
    object SmallintField3: TSmallintField
      FieldName = 'print_flag'
    end
    object IntegerField8: TIntegerField
      FieldName = 'ombor_id'
    end
    object FloatField4: TFloatField
      FieldName = 'qarz_summa'
    end
    object StringField4: TStringField
      FieldName = 'qarz_kim'
      Size = 100
    end
    object StringField5: TStringField
      FieldName = 'qarz_izoh'
      Size = 250
    end
    object SmallintField4: TSmallintField
      FieldName = 'qarz_flag'
    end
    object IntegerField9: TIntegerField
      FieldName = 'h_id'
    end
    object FloatField5: TFloatField
      FieldName = 'sum_epos'
    end
    object FloatField6: TFloatField
      FieldName = 'cheg_n'
    end
    object FloatField7: TFloatField
      FieldName = 'cheg_p'
    end
    object FloatField8: TFloatField
      FieldName = 'cheg_e'
    end
    object FloatField9: TFloatField
      FieldName = 'sum_naqd_ch'
    end
    object FloatField10: TFloatField
      FieldName = 'sum_plast_ch'
    end
    object FloatField11: TFloatField
      FieldName = 'sum_epos_ch'
    end
    object FloatField12: TFloatField
      FieldName = 'summa_ch'
    end
    object IntegerField10: TIntegerField
      FieldName = 'pl_id'
    end
    object StringField6: TStringField
      FieldKind = fkLookup
      FieldName = 'haridor'
      LookupDataSet = s_haridor
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'h_id'
      Size = 150
      Lookup = True
    end
    object FloatField13: TFloatField
      FieldName = 'kurs'
    end
    object SmallintField5: TSmallintField
      FieldName = 'dollar'
    end
    object FloatField14: TFloatField
      FieldName = 'sum_d'
    end
    object IntegerField11: TIntegerField
      FieldName = 'plastik_id'
    end
    object IntegerField12: TIntegerField
      FieldName = 'mobil'
      Required = True
    end
    object SmallintField6: TSmallintField
      FieldName = 'xizmat_foiz'
      Required = True
    end
    object FloatField15: TFloatField
      FieldName = 'xizmat'
    end
    object IntegerField13: TIntegerField
      FieldName = 'filial_id'
    end
    object IntegerField14: TIntegerField
      FieldName = 'shartnoma_id'
    end
    object SmallintField7: TSmallintField
      FieldName = 'woywo_bill_type'
    end
    object StringField7: TStringField
      FieldKind = fkLookup
      FieldName = 's_xodim'
      LookupDataSet = s_user
      LookupKeyFields = 'id'
      LookupResultField = 'fio'
      KeyFields = 'user_id'
      Size = 250
      Lookup = True
    end
    object StringField8: TStringField
      FieldKind = fkLookup
      FieldName = 's_mobil'
      LookupDataSet = tmobil
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'mobil'
      Size = 50
      Lookup = True
    end
  end
  object Dasosall: TDataSource
    DataSet = tasosall
    Left = 511
    Top = 169
  end
  object tasos_slaveall: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select s.*,t.nom as s_tovar,user.username as s_user,s_izm.nom as' +
        ' s_izm_id from asos a,user,s_tovar t, asos_slave s left JOIN s_i' +
        'zm on s_izm.id=s.izm_id where a.id=s.asos_id and t.id=s.tovar_id' +
        ' and zakaz is not null and zakaz_print is null and user.id=a.use' +
        'r_id and s.del_flag=1 and a.tur_oper=2 and a.user_id=a.xodim_id ' +
        'and t.brend = 62 and a.client_id=4')
    Params = <>
    DataSource = Dasosall
    Left = 567
    Top = 137
  end
  object Dasos_slaveall: TDataSource
    DataSet = tasos_slaveall
    Left = 567
    Top = 169
  end
  object zakaz: TfrxDBDataset
    UserName = 'asos_slave'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kol=kol'
      's_tovar=s_tovar'
      's_user=s_user'
      's_izm_id=s_izm_id'
      'stol=stol'
      'zakaz=zakaz'
      'id=id'
      'kol_in=kol_in')
    DataSource = Dzakaz
    BCDToCurrency = False
    Left = 354
    Top = 127
  end
end
