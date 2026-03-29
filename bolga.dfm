object Form1: TForm1
  Left = 230
  Top = 156
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
  object Button1: TButton
    Left = 80
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 432
    Top = 120
    Width = 465
    Height = 225
    TabOrder = 1
  end
  object xPrBar: TProgressBar
    Left = 169
    Top = 48
    Width = 667
    Height = 24
    Smooth = True
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 120
    Width = 320
    Height = 273
    DataSource = Ds_t_all
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object lbd: TZConnection
    Protocol = 'mysql-5'
    HostName = '127.0.0.1'
    Port = 3306
    Database = 'mix'
    User = 'info!traffic'
    Password = 'masterkalit'
    Catalog = 'mix'
    Properties.Strings = (
      'codepage=cp1251'
      'reconnect=true')
    Left = 806
    Top = 17
  end
  object s_t_all: TZQuery
    Connection = lbd
    SortedFields = 'nom'
    SQL.Strings = (
      'SELECT * FROM s_tovar where del_flag=1 and id = 0 order by nom')
    Params = <>
    IndexFieldNames = 'nom Asc'
    Left = 344
    Top = 25
    object s_t_allid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object s_t_allnom: TStringField
      FieldName = 'nom'
      Size = 250
    end
    object s_t_allnom_ru: TStringField
      FieldName = 'nom_ru'
      Size = 250
    end
    object s_t_allnom_sh: TStringField
      FieldName = 'nom_sh'
      Size = 50
    end
    object s_t_allshtrix: TStringField
      FieldName = 'shtrix'
      Size = 150
    end
    object s_t_allqr: TStringField
      FieldName = 'qr'
      Size = 250
    end
    object s_t_allshtrixkod: TSmallintField
      FieldName = 'shtrixkod'
      Required = True
    end
    object s_t_allqrkod: TSmallintField
      FieldName = 'qrkod'
      Required = True
    end
    object s_t_allizm_id: TSmallintField
      FieldName = 'izm_id'
    end
    object s_t_allkol_in: TSmallintField
      FieldName = 'kol_in'
      Required = True
    end
    object s_t_allizm1: TSmallintField
      FieldName = 'izm1'
    end
    object s_t_allturi: TSmallintField
      FieldName = 'turi'
    end
    object s_t_allresept: TSmallintField
      FieldName = 'resept'
    end
    object s_t_allaniq: TFloatField
      FieldName = 'aniq'
    end
    object s_t_allminimal: TFloatField
      FieldName = 'minimal'
    end
    object s_t_allmaksimal: TFloatField
      FieldName = 'maksimal'
    end
    object s_t_allsotish: TFloatField
      FieldName = 'sotish'
    end
    object s_t_alldel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object s_t_allupakavka: TIntegerField
      FieldName = 'upakavka'
    end
    object s_t_alluser_id: TSmallintField
      FieldName = 'user_id'
    end
    object s_t_allclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object s_t_allchangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object s_t_alltz_id: TSmallintField
      FieldName = 'tz_id'
    end
    object s_t_allkg: TSmallintField
      FieldName = 'kg'
    end
    object s_t_allshtrix_full: TStringField
      FieldName = 'shtrix_full'
      Size = 150
    end
    object s_t_allshtrix1: TStringField
      FieldName = 'shtrix1'
      Size = 150
    end
    object s_t_allshtrix2: TStringField
      FieldName = 'shtrix2'
      Size = 150
    end
    object s_t_allkat: TSmallintField
      FieldName = 'kat'
      Required = True
    end
    object s_t_allbrend: TSmallintField
      FieldName = 'brend'
      Required = True
    end
    object s_t_allpapka: TIntegerField
      FieldName = 'papka'
    end
    object s_t_allshakl: TStringField
      FieldName = 'shakl'
      Size = 250
    end
    object s_t_allinternom: TStringField
      FieldName = 'internom'
      Size = 250
    end
    object s_t_allmajbur_dori_id: TIntegerField
      FieldName = 'majbur_dori_id'
    end
    object s_t_allmiqdor: TSmallintField
      FieldName = 'miqdor'
    end
    object s_t_allshart: TSmallintField
      FieldName = 'shart'
    end
    object s_t_allustama: TFloatField
      FieldName = 'ustama'
    end
    object s_t_allulg1: TFloatField
      FieldName = 'ulg1'
    end
    object s_t_allulg1_pl: TFloatField
      FieldName = 'ulg1_pl'
    end
    object s_t_allulg2: TFloatField
      FieldName = 'ulg2'
    end
    object s_t_allulg2_pl: TFloatField
      FieldName = 'ulg2_pl'
    end
    object s_t_allbank: TFloatField
      FieldName = 'bank'
    end
    object s_t_allsena: TFloatField
      FieldName = 'sena'
    end
    object s_t_allsena_d: TFloatField
      FieldName = 'sena_d'
    end
    object s_t_allsena_in_d: TFloatField
      FieldName = 'sena_in_d'
    end
    object s_t_allsotish_d: TFloatField
      FieldName = 'sotish_d'
    end
  end
  object Ds_t_all: TDataSource
    DataSet = s_t_all
    Left = 345
    Top = 73
  end
  object link: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT id,nom,otdel from s_tovar where del_flag=1')
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 388
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Dlink: TDataSource
    DataSet = link
    Left = 390
    Top = 73
  end
  object main_link: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_kassa')
    Params = <>
    Left = 432
    Top = 23
  end
  object Dmain_link: TDataSource
    DataSet = main_link
    Left = 430
    Top = 73
  end
  object qoldiq: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'SELECT * FROM asos_slave where del_flag=1 and tovar_id=:id order' +
        ' by id desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 475
    Top = 25
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object StringField32: TStringField
      FieldName = 'tovar_nom'
      Size = 250
    end
    object DateField7: TDateField
      FieldName = 'srok'
    end
    object SmallintField9: TSmallintField
      FieldName = 'subkod'
    end
    object StringField33: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupKeyFields = 'id'
      LookupResultField = 'fio'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
    end
    object IntegerField21: TIntegerField
      FieldName = 'asos_id'
    end
    object SmallintField10: TSmallintField
      FieldName = 'del_flag'
    end
    object qoldiqsotish: TFloatField
      FieldName = 'sotish'
    end
    object qoldiqkol_in: TSmallintField
      FieldName = 'kol_in'
    end
    object qoldiqturi: TSmallintField
      FieldName = 'turi'
    end
    object qoldiqresept: TSmallintField
      FieldName = 'resept'
    end
    object qoldiqs_izm: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm'
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm_id'
      Size = 50
      Lookup = True
    end
    object qoldiqjami: TStringField
      FieldKind = fkCalculated
      FieldName = 'jami'
      Size = 250
      Calculated = True
    end
    object qoldiqs_diler: TStringField
      FieldKind = fkLookup
      FieldName = 's_diler'
      LookupKeyFields = 'id'
      LookupResultField = 's_diler'
      KeyFields = 'asos_id'
      Size = 150
      Lookup = True
    end
    object qoldiqqrkod: TSmallintField
      FieldName = 'qrkod'
    end
    object qoldiqs_qrkod: TStringField
      FieldKind = fkCalculated
      FieldName = 's_qrkod'
      Size = 10
      Calculated = True
    end
    object qoldiquser_id: TIntegerField
      FieldName = 'user_id'
    end
    object qoldiqchangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object qoldiqseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object qoldiqsena_in: TFloatField
      FieldName = 'sena_in'
    end
    object qoldiqsotish_in: TFloatField
      FieldName = 'sotish_in'
    end
    object qoldiqizm1: TSmallintField
      FieldName = 'izm1'
    end
    object qoldiqs_nomer: TStringField
      FieldKind = fkLookup
      FieldName = 's_nomer'
      LookupKeyFields = 'id'
      LookupResultField = 'sana'
      KeyFields = 'asos_id'
      Size = 30
      Lookup = True
    end
    object qoldiqs_izm1: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm1'
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm1'
      Size = 15
      Lookup = True
    end
    object qoldiqsumma_in: TFloatField
      FieldName = 'summa_in'
    end
    object qoldiqsumma_all: TFloatField
      FieldName = 'summa_all'
    end
    object qoldiqkol_ost: TIntegerField
      FieldName = 'kol_ost'
    end
    object qoldiqkol_in_ost: TIntegerField
      FieldName = 'kol_in_ost'
    end
    object qoldiqsumma: TFloatField
      FieldName = 'summa'
    end
    object qoldiqizm_id: TSmallintField
      FieldName = 'izm_id'
    end
    object qoldiqtulov_id: TIntegerField
      FieldName = 'tulov_id'
    end
    object qoldiqsena: TFloatField
      FieldName = 'sena'
    end
    object qoldiqtovar_id: TIntegerField
      FieldName = 'tovar_id'
    end
    object qoldiqs_sana: TStringField
      FieldKind = fkLookup
      FieldName = 's_sana'
      LookupKeyFields = 'id'
      LookupResultField = 'sana'
      KeyFields = 'asos_id'
      Size = 25
      Lookup = True
    end
    object qoldiqid: TIntegerField
      FieldName = 'id'
    end
    object qoldiqs_tovar: TStringField
      FieldKind = fkLookup
      FieldName = 's_tovar'
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'tovar_id'
      Size = 150
      Lookup = True
    end
    object qoldiqfoyda: TFloatField
      FieldKind = fkCalculated
      FieldName = 'foyda'
      Calculated = True
    end
    object qoldiqfoiz: TFloatField
      FieldName = 'foiz'
    end
    object qoldiqfoiz_in: TFloatField
      FieldName = 'foiz_in'
    end
    object qoldiqzavod: TStringField
      FieldKind = fkLookup
      FieldName = 'zavod'
      LookupKeyFields = 'id'
      LookupResultField = 'zavod'
      KeyFields = 'tovar_id'
      Size = 150
      Lookup = True
    end
    object qoldiqpolka: TStringField
      FieldName = 'polka'
      Size = 50
    end
    object qoldiqkol: TIntegerField
      FieldName = 'kol'
    end
    object qoldiqsena_d: TFloatField
      FieldName = 'sena_d'
    end
    object qoldiqsena_in_d: TFloatField
      FieldName = 'sena_in_d'
    end
    object qoldiqsotish_d: TFloatField
      FieldName = 'sotish_d'
    end
    object qoldiqsotish_in_d: TFloatField
      FieldName = 'sotish_in_d'
    end
    object qoldiqzakaz: TDateTimeField
      FieldName = 'zakaz'
    end
    object qoldiqzakaz_ok: TDateTimeField
      FieldName = 'zakaz_ok'
    end
    object qoldiqzakaz_end: TDateTimeField
      FieldName = 'zakaz_end'
    end
    object qoldiqzakaz_print: TSmallintField
      FieldName = 'zakaz_print'
    end
    object qoldiqzakaz_gapir: TIntegerField
      FieldName = 'zakaz_gapir'
    end
    object qoldiqfoiz_ch2: TFloatField
      FieldName = 'foiz_ch2'
    end
    object qoldiqfoiz_schet: TFloatField
      FieldName = 'foiz_schet'
    end
    object qoldiqfoiz_opt1: TFloatField
      FieldName = 'foiz_opt1'
    end
    object qoldiqfoiz_opt2: TFloatField
      FieldName = 'foiz_opt2'
    end
    object qoldiqopt1: TFloatField
      FieldName = 'opt1'
    end
    object qoldiqopt1_pl: TFloatField
      FieldName = 'opt1_pl'
    end
    object qoldiqopt1_pl_in: TFloatField
      FieldName = 'opt1_pl_in'
    end
    object qoldiqopt2: TFloatField
      FieldName = 'opt2'
    end
    object qoldiqopt2_pl: TFloatField
      FieldName = 'opt2_pl'
    end
    object qoldiqopt2_in: TFloatField
      FieldName = 'opt2_in'
    end
    object qoldiqopt2_pl_in: TFloatField
      FieldName = 'opt2_pl_in'
    end
    object qoldiqschet: TFloatField
      FieldName = 'schet'
    end
    object qoldiqschet_in: TFloatField
      FieldName = 'schet_in'
    end
    object qoldiqch2_in: TFloatField
      FieldName = 'ch2_in'
    end
    object qoldiqopt1_in: TFloatField
      FieldName = 'opt1_in'
    end
  end
  object Dqoldiq: TDataSource
    DataSet = qoldiq
    Left = 475
    Top = 73
  end
end
