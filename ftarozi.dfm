object tarozi: Ttarozi
  Left = 352
  Top = 115
  Width = 948
  Height = 593
  Caption = 'Tarozi'
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
    Left = 8
    Top = 216
    Width = 32
    Height = 20
    Caption = 'Soni'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 350
    Width = 32
    Height = 20
    Caption = 'Soni'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 932
    Height = 209
    Align = alTop
    DataSource = Dplu
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PluNo'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PluCode'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PluName'
        Title.Alignment = taCenter
        Width = 314
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnitPrice'
        Title.Alignment = taCenter
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnitWeight'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValidDate'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tare'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PriceChangeable'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Transferable'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Department'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Counter'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'WeightUnit'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BarcodeType'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LabelFormat'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 375
    Width = 932
    Height = 179
    Align = alBottom
    DataSource = Ds_tovar
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tz_id'
        Title.Alignment = taCenter
        Title.Caption = 'pluNo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'shtrix_in'
        Title.Alignment = taCenter
        Title.Caption = 'PluCode'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nom'
        Title.Alignment = taCenter
        Title.Caption = 'PluName'
        Width = 408
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nom_ru'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nom_sh'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'shtrix'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'kg'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'shtrix_full'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'shtrixkod'
        Title.Alignment = taCenter
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol_in'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'aniq'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sotish'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Visible = False
      end>
  end
  object Bittalab: TButton
    Left = 56
    Top = 264
    Width = 90
    Height = 36
    Caption = 'Bittalab'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = BittalabClick
  end
  object jami: TButton
    Left = 168
    Top = 264
    Width = 90
    Height = 36
    Caption = 'Jami'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = jamiClick
  end
  object Pechat: TButton
    Left = 288
    Top = 266
    Width = 90
    Height = 36
    Caption = 'Pechat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = PechatClick
  end
  object ado_kol: TDBNumberEditEh
    Left = 56
    Top = 216
    Width = 74
    Height = 21
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object z_kol: TDBNumberEditEh
    Left = 56
    Top = 350
    Width = 74
    Height = 21
    EditButtons = <>
    TabOrder = 6
    Visible = True
  end
  object Button1: TButton
    Left = 608
    Top = 266
    Width = 145
    Height = 36
    Caption = 'Yukla EXCEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = PechatClick
  end
  object Button2: TButton
    Left = 784
    Top = 266
    Width = 121
    Height = 36
    Caption = 'Yukla TXT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 416
    Top = 266
    Width = 90
    Height = 36
    Caption = 'tozala'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Button3Click
  end
  object Yangilash: TButton
    Left = 176
    Top = 330
    Width = 90
    Height = 36
    Caption = 'Yangilash'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = YangilashClick
  end
  object plu: TButton
    Left = 688
    Top = 322
    Width = 121
    Height = 36
    Caption = 'PLU'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = pluClick
  end
  object Button4: TButton
    Left = 528
    Top = 322
    Width = 145
    Height = 36
    Caption = 'Yukla EXCEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 536
    Top = 226
    Width = 217
    Height = 36
    Caption = 'Yukla EXCEL '#1071#1085#1075#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = Button5Click
  end
  object ZConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\printer\LP-16_Cy' +
      'rillic\example.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 160
    Top = 224
  end
  object tplu: TADOQuery
    Connection = ZConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from plu order by pluno')
    Left = 208
    Top = 224
  end
  object Dplu: TDataSource
    DataSet = tplu
    Left = 248
    Top = 224
  end
  object ts_tovar: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'SELECT * FROM s_tovar where del_flag=1 and kol_in=1000 order by ' +
        'shtrix_in')
    Params = <>
    Left = 360
    Top = 224
  end
  object Ds_tovar: TDataSource
    DataSet = ts_tovar
    Left = 416
    Top = 223
  end
  object z_zapros: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'SELECT * FROM s_tovar where del_flag=1 and kol_in=1000  order by' +
        ' tz_id ')
    Params = <>
    Left = 328
    Top = 320
  end
  object ado_zapros: TADOQuery
    Connection = ZConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from plu')
    Left = 208
    Top = 296
  end
  object qoldiq: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'SELECT asos_slave.sotish FROM asos_slave,asos where asos_slave.d' +
        'el_flag=1 and asos.id=asos_slave.asos_id and asos_slave.tovar_id' +
        '=:id and (tur_oper=1 or tur_oper=5) order by asos_slave.id desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Ds_tovar
    Left = 467
    Top = 225
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
