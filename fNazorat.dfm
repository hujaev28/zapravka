object Nazorat: TNazorat
  Left = 219
  Top = 189
  Width = 1088
  Height = 516
  Caption = 'Nazorat'
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
  object Button4: TButton
    Left = 8
    Top = 64
    Width = 57
    Height = 25
    Caption = 'Xisobla'
    TabOrder = 0
    OnClick = Button4Click
  end
  object Memonaz: TMemo
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
  object DBGrid1: TDBGrid
    Left = 382
    Top = 46
    Width = 315
    Height = 203
    DataSource = ds_haridor
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 753
    Top = 216
    Width = 291
    Height = 137
    DataSource = DMS.Ds_inv
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 752
    Top = 3
    Width = 291
    Height = 209
    DataSource = Dpl
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid4: TDBGrid
    Left = 20
    Top = 296
    Width = 291
    Height = 177
    DataSource = Dsf
    TabOrder = 6
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
    TabOrder = 7
    OnClick = Button1Click
  end
  object DBGrid5: TDBGrid
    Left = 324
    Top = 296
    Width = 291
    Height = 177
    DataSource = Dqarz
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid6: TDBGrid
    Left = 753
    Top = 358
    Width = 291
    Height = 113
    DataSource = Doraliqpl
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object s_haridor: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'select id,nom,qarz_flag from s_haridor WHERE del_flag=1 and (qar' +
        'z_flag is null or qarz_flag=1 or qarz_flag=-1) order by nom ')
    Params = <>
    Left = 647
    Top = 88
  end
  object ds_haridor: TDataSource
    DataSet = s_haridor
    Left = 647
    Top = 124
  end
  object oraliq: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'SELECT oraliq.* FROM oraliq WHERE sf_id = :id and vid=1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Dsf
    Left = 570
    Top = 89
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object oraliqsf_id: TIntegerField
      FieldName = 'sf_id'
      Required = True
    end
    object oraliqost: TFloatField
      FieldName = 'ost'
      Required = True
    end
    object oraliqpl_id: TIntegerField
      FieldName = 'pl_id'
      Required = True
    end
    object oraliqvid: TSmallintField
      FieldName = 'vid'
      Required = True
    end
  end
  object Doraliq: TDataSource
    DataSet = oraliq
    Left = 570
    Top = 118
  end
  object pl: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'select konv,inv_id,id,n_pl,d_pl,nn,client_id,h_id,saldo,vid,sf,s' +
        'f_pot,del_flag,pot1,if(konv=1,0,sena_pl) as sena_pl,ost_pl,if(ko' +
        'nv=2,0,sena_d) as sena_d,ost_d from pl WHERE del_flag=1 and vid ' +
        'in (7,17,20) and h_id =:id  order by d_pl ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = ds_haridor
    Left = 612
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object plid: TIntegerField
      FieldName = 'id'
    end
    object pln_pl: TIntegerField
      FieldName = 'n_pl'
    end
    object pld_pl: TDateField
      FieldName = 'd_pl'
    end
    object plnn: TSmallintField
      FieldName = 'nn'
    end
    object plclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object plsena_pl: TFloatField
      FieldName = 'sena_pl'
    end
    object plsaldo: TFloatField
      FieldName = 'saldo'
    end
    object plost_pl: TFloatField
      FieldName = 'ost_pl'
    end
    object plvid: TSmallintField
      FieldName = 'vid'
    end
    object plsf: TIntegerField
      FieldName = 'sf'
    end
    object plsf_pot: TSmallintField
      FieldName = 'sf_pot'
    end
    object pldel_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object plpot1: TSmallintField
      FieldName = 'pot1'
    end
    object plh_id: TIntegerField
      FieldName = 'h_id'
    end
    object plsena_d: TFloatField
      FieldName = 'sena_d'
      ReadOnly = True
    end
    object plost_d: TFloatField
      FieldName = 'ost_d'
    end
    object plinv_id: TIntegerField
      FieldName = 'inv_id'
    end
    object plkonv: TIntegerField
      FieldName = 'konv'
    end
  end
  object Dpl: TDataSource
    DataSet = pl
    Left = 612
    Top = 117
  end
  object sf: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'select * from asos WHERE del_flag=1 and (qarz_summa >0 or qarz_d' +
        'ollar>0 or sum_epos_ch > 0) and h_id =:id and tur_oper in (2) or' +
        'der by sana')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = ds_haridor
    Left = 695
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Dsf: TDataSource
    DataSet = sf
    Left = 695
    Top = 116
  end
  object Dlink: TDataSource
    DataSet = link
    Left = 751
    Top = 116
  end
  object link: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'SELECT distinct cl.id,cl.inn,cl.nom FROM s_client cl,lbd_sf sf w' +
        'here sf.client_id=cl.id ')
    Params = <>
    Left = 751
    Top = 80
  end
  object qarz: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'select d_pl as sana,id,n_pl,d_pl,nn,client_id,h_id,saldo,vid,sf,' +
        'sf_pot,del_flag,pot1,h_id,asos_id,inv_id,srok,if(konv=1,0,sena_p' +
        'l) as sena_pl,ost_pl,if(konv=2,0,sena_d) as sena_d,ost_d from pl' +
        ' WHERE del_flag=1 and vid in (8,18) and h_id =:id  order by d_pl')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = ds_haridor
    Left = 791
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Dqarz: TDataSource
    DataSet = qarz
    Left = 791
    Top = 116
  end
  object oraliqpl: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'SELECT oraliq.* FROM oraliq WHERE sf_id = :id and vid=2')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Dqarz
    Left = 522
    Top = 89
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'sf_id'
      Required = True
    end
    object FloatField1: TFloatField
      FieldName = 'ost'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'pl_id'
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'vid'
      Required = True
    end
  end
  object Doraliqpl: TDataSource
    DataSet = oraliqpl
    Left = 522
    Top = 118
  end
  object jamla: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      'select * from qarz WHERE splid=:id and tur=1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Dsf
    Left = 839
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
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
  end
  object Djamla: TDataSource
    DataSet = jamla
    Left = 839
    Top = 116
  end
  object jpl: TZQuery
    Connection = DMS.lbd
    SQL.Strings = (
      
        'select id,n_pl,d_pl,nn,client_id,h_id,saldo,vid,sf,sf_pot,del_fl' +
        'ag,pot1,if(konv=1,0,sena_pl) as sena_pl,ost_pl,if(konv=2,0,sena_' +
        'd) as sena_d,ost_d from pl WHERE del_flag=1 and vid in (8,18) an' +
        'd h_id =:id  order by d_pl')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Dqarz
    Left = 879
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Djpl: TDataSource
    DataSet = jpl
    Left = 879
    Top = 116
  end
end
