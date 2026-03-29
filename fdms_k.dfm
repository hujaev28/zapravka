object DMS: TDMS
  OldCreateOrder = False
  Left = 249
  Top = 288
  Height = 413
  Width = 1083
  object lbd: TZConnection
    Protocol = 'mysql-5'
    HostName = '5.182.26.119'
    Port = 3306
    Database = 'uzaart_teda'
    User = 'info!traffic'
    Password = 'masterkalit'
    Catalog = 'uzaart_teda'
    Properties.Strings = (
      'codepage=cp1251'
      'reconnect=true')
    Left = 814
    Top = 17
  end
  object setup: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM `setup`')
    Params = <>
    Left = 114
    Top = 14
    object setupfile_date: TDateField
      FieldName = 'file_date'
    end
    object setupfile_blob: TBlobField
      FieldName = 'file_blob'
    end
    object setupfile_size: TSmallintField
      FieldName = 'file_size'
    end
    object setupfile_nom: TStringField
      FieldName = 'file_nom'
      Size = 150
    end
    object setupver: TSmallintField
      FieldName = 'ver'
      Required = True
    end
    object setupver_timer: TSmallintField
      FieldName = 'ver_timer'
      Required = True
    end
    object setupid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object setupk1: TSmallintField
      FieldName = 'k1'
    end
    object setupk2: TSmallintField
      FieldName = 'k2'
    end
    object setupk3: TSmallintField
      FieldName = 'k3'
    end
    object setupk4: TSmallintField
      FieldName = 'k4'
    end
    object setupk5: TSmallintField
      FieldName = 'k5'
    end
    object setupk6: TSmallintField
      FieldName = 'k6'
    end
    object setupk7: TSmallintField
      FieldName = 'k7'
    end
    object setupk8: TSmallintField
      FieldName = 'k8'
    end
    object setupusername: TStringField
      FieldName = 'username'
      Size = 50
    end
    object setupchangedate: TDateField
      FieldName = 'changedate'
    end
    object setupvaqt: TDateTimeField
      FieldName = 'vaqt'
      Required = True
    end
    object setupariza: TBlobField
      FieldName = 'ariza'
    end
    object setupsmsall: TIntegerField
      FieldName = 'smsall'
      Required = True
    end
    object setupsmsyear: TIntegerField
      FieldName = 'smsyear'
      Required = True
    end
    object setupsmsmonth: TIntegerField
      FieldName = 'smsmonth'
      Required = True
    end
    object setupsmstoday: TIntegerField
      FieldName = 'smstoday'
      Required = True
    end
    object setupsmsvaqt: TDateField
      FieldName = 'smsvaqt'
      Required = True
    end
    object setupverr: TSmallintField
      FieldName = 'verr'
    end
    object setuplk: TIntegerField
      FieldName = 'lk'
      Required = True
    end
    object setuplis: TIntegerField
      FieldName = 'lis'
      Required = True
    end
    object setupnews: TStringField
      FieldName = 'news'
      Size = 250
    end
    object setupval_news: TIntegerField
      FieldName = 'val_news'
    end
  end
  object s_obl: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_obl ')
    Params = <>
    Left = 18
    Top = 9
  end
  object Ds_obl: TDataSource
    DataSet = s_obl
    Left = 18
    Top = 57
  end
  object protinout: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM protinout where id=0')
    Params = <>
    Left = 170
    Top = 14
  end
  object Dprotinout: TDataSource
    DataSet = protinout
    Left = 167
    Top = 65
  end
  object Dsetup: TDataSource
    DataSet = setup
    Left = 119
    Top = 65
  end
  object s_tuman: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_tuman where p_id=:subid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'subid'
        ParamType = ptUnknown
      end>
    DataSource = Ds_obl
    Left = 67
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'subid'
        ParamType = ptUnknown
      end>
  end
  object Ds_tuman: TDataSource
    DataSet = s_tuman
    Left = 66
    Top = 57
  end
  object s_client: TZQuery
    Connection = lbd
    BeforePost = s_clientBeforePost
    SQL.Strings = (
      ''
      
        'select s_xodim.id as x_id,s_client.*,if((uyu_type=0) or (uyu_typ' +
        'e is null),s_client.nom,concat('#39'"'#39',s_client.nom,'#39'" '#39',s_opf.shnom' +
        ')) as nom1 from s_xodim,s_client left JOIN s_opf ON s_opf.id = s' +
        '_client.uyu_type'
      
        ' WHERE s_client.id=s_xodim.client_id and s_xodim.del_flag=1 and ' +
        's_xodim.active=1 and inn="303343820" and s_xodim.login="a.hujaev' +
        'a" and s_client.userpass = "c4ca4238a0b923820dcc509a6f75849b"')
    Params = <>
    Left = 462
    Top = 13
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
    object s_clients_user: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_user
      LookupKeyFields = 'id'
      LookupResultField = 'login'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
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
    object s_clientx_id: TIntegerField
      FieldName = 'x_id'
    end
    object s_clientgaraj: TIntegerField
      FieldName = 'garaj'
    end
    object s_clientclnom: TStringField
      FieldKind = fkLookup
      FieldName = 'clnom'
      LookupDataSet = s_opf
      LookupKeyFields = 'id'
      LookupResultField = 'shnom'
      KeyFields = 'uyu_type'
      Size = 50
      Lookup = True
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
    Left = 461
    Top = 61
  end
  object s_kassa: TZQuery
    Connection = lbd
    BeforePost = s_kassaBeforePost
    OnNewRecord = s_kassaNewRecord
    SQL.Strings = (
      'SELECT * FROM s_kassa where client_id=0 and del_flag=1')
    Params = <>
    Left = 274
    Top = 15
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
    object s_kassas_status: TStringField
      FieldKind = fkCalculated
      FieldName = 's_status'
      OnGetText = s_kassas_statusGetText
      Size = 150
      Calculated = True
    end
    object s_kassaclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object s_kassas_user: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_user
      LookupKeyFields = 'id'
      LookupResultField = 'fio'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
    end
    object s_kassas_client: TStringField
      FieldKind = fkLookup
      FieldName = 's_client'
      LookupDataSet = s_client
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'client_id'
      Size = 150
      Lookup = True
    end
    object s_kassadel_flag: TSmallintField
      FieldName = 'del_flag'
    end
  end
  object Ds_kassa: TDataSource
    DataSet = s_kassa
    Left = 274
    Top = 63
  end
  object s_xodim: TZQuery
    Connection = lbd
    OnNewRecord = s_xodimNewRecord
    SQL.Strings = (
      'SELECT * FROM user order by id')
    Params = <>
    Left = 322
    Top = 15
    object s_xodimid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object s_xodimfio: TStringField
      FieldName = 'fio'
      Size = 250
    end
    object s_xodimlogin: TStringField
      FieldName = 'login'
      Size = 100
    end
    object s_xodimstatus: TIntegerField
      FieldName = 'status'
    end
    object s_xodims_status: TStringField
      FieldKind = fkCalculated
      FieldName = 's_status'
      OnGetText = s_xodims_statusGetText
      Size = 150
      Calculated = True
    end
    object s_xodimuserpass: TStringField
      FieldName = 'userpass'
      Size = 150
    end
    object s_xodimvaqtin: TDateTimeField
      FieldName = 'vaqtin'
    end
    object s_xodimvaqtout: TDateTimeField
      FieldName = 'vaqtout'
    end
    object s_xodimflag: TSmallintField
      FieldName = 'flag'
    end
    object s_xodimclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object s_xodimdel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object s_xodimactive: TSmallintField
      FieldName = 'active'
      OnGetText = s_xodimactiveGetText
    end
    object s_xodimkim: TStringField
      FieldName = 'kim'
      Size = 150
    end
    object s_xodimtarmoq: TStringField
      FieldName = 'tarmoq'
      Size = 150
    end
    object s_xodimusername: TStringField
      FieldName = 'username'
      Size = 255
    end
    object s_xodimauth_key: TStringField
      FieldName = 'auth_key'
      Size = 32
    end
    object s_xodimpassword_hash: TStringField
      FieldName = 'password_hash'
      Size = 255
    end
    object s_xodimpassword_reset_token: TStringField
      FieldName = 'password_reset_token'
      Size = 255
    end
    object s_xodimemail: TStringField
      FieldName = 'email'
      Size = 255
    end
    object s_xodimcreated_at: TIntegerField
      FieldName = 'created_at'
    end
    object s_xodimupdated_at: TIntegerField
      FieldName = 'updated_at'
    end
    object s_xodimsite_address: TStringField
      FieldName = 'site_address'
      Size = 255
    end
    object s_xodimx_tur_id: TIntegerField
      FieldName = 'x_tur_id'
    end
    object s_xodimkod: TStringField
      FieldName = 'kod'
      Size = 13
    end
    object s_xodims_client: TStringField
      FieldKind = fkLookup
      FieldName = 's_client'
      LookupDataSet = s_client
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'client_id'
      Size = 150
      Lookup = True
    end
    object s_xodimdyum: TIntegerField
      FieldName = 'dyum'
      Required = True
    end
    object s_xodimustama: TIntegerField
      FieldName = 'ustama'
      Required = True
    end
    object s_xodimphone_number: TStringField
      FieldName = 'phone_number'
      Size = 255
    end
  end
  object Ds_xodim: TDataSource
    DataSet = s_xodim
    Left = 322
    Top = 63
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
    DataSource = Dk_slave1
    Left = 796
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object s_opf: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_opf')
    Params = <>
    Left = 624
    Top = 16
  end
  object Ds_opf: TDataSource
    DataSet = s_opf
    Left = 624
    Top = 63
  end
  object s_user: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM user')
    Params = <>
    Left = 674
    Top = 16
  end
  object Ds_user: TDataSource
    DataSet = s_user
    Left = 674
    Top = 63
  end
  object s_tovar: TZQuery
    Connection = lbd
    BeforePost = s_tovarBeforePost
    OnNewRecord = s_tovarNewRecord
    SQL.Strings = (
      'SELECT * FROM s_tovar where del_flag=1 and id = 0 order by nom')
    Params = <>
    Left = 220
    Top = 15
    object s_tovarid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object s_tovarnom: TStringField
      FieldName = 'nom'
      Size = 250
    end
    object s_tovarnom_ru: TStringField
      FieldName = 'nom_ru'
      Size = 250
    end
    object s_tovarnom_sh: TStringField
      FieldName = 'nom_sh'
      Size = 50
    end
    object s_tovarizm1: TSmallintField
      FieldName = 'izm1'
    end
    object s_tovarturi: TSmallintField
      FieldName = 'turi'
      OnGetText = s_tovarturiGetText
    end
    object s_tovarresept: TSmallintField
      FieldName = 'resept'
      OnGetText = s_tovarreseptGetText
    end
    object s_tovaraniq: TFloatField
      FieldName = 'aniq'
    end
    object s_tovarminimal: TFloatField
      FieldName = 'minimal'
    end
    object s_tovarmaksimal: TFloatField
      FieldName = 'maksimal'
    end
    object s_tovarsotish: TFloatField
      FieldName = 'sotish'
    end
    object s_tovarzavod_id: TIntegerField
      FieldName = 'zavod_id'
    end
    object s_tovarshtrix: TStringField
      FieldName = 'shtrix'
      Size = 150
    end
    object s_tovardel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object s_tovarzavod: TStringField
      FieldKind = fkLookup
      FieldName = 'zavod'
      LookupDataSet = s_zavod
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'zavod_id'
      Size = 150
      Lookup = True
    end
    object s_tovarupakavka: TIntegerField
      FieldName = 'upakavka'
    end
    object s_tovarshtrixkod: TSmallintField
      FieldName = 'shtrixkod'
    end
    object s_tovarqrkod: TSmallintField
      FieldName = 'qrkod'
    end
    object s_tovars_shtrix: TStringField
      FieldKind = fkCalculated
      FieldName = 's_shtrix'
      OnGetText = s_tovars_shtrixGetText
      Size = 15
      Calculated = True
    end
    object s_tovars_qr: TStringField
      FieldKind = fkCalculated
      FieldName = 's_qr'
      OnGetText = s_tovars_qrGetText
      Size = 15
      Calculated = True
    end
    object s_tovarchangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object s_tovaruser_id: TSmallintField
      FieldName = 'user_id'
    end
    object s_tovars_user: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_user
      LookupKeyFields = 'id'
      LookupResultField = 'login'
      KeyFields = 'user_id'
      Size = 100
      Lookup = True
    end
    object s_tovarkol_in: TSmallintField
      FieldName = 'kol_in'
    end
    object s_tovarizm_id: TSmallintField
      FieldName = 'izm_id'
    end
    object s_tovars_izm: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm'
      LookupDataSet = s_izm
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm_id'
      Size = 50
      Lookup = True
    end
    object s_tovarclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object s_tovars_client: TStringField
      FieldKind = fkLookup
      FieldName = 's_client'
      LookupDataSet = s_client
      LookupKeyFields = 'id'
      LookupResultField = 'masul1'
      KeyFields = 'client_id'
      Size = 150
      Lookup = True
    end
    object s_tovarqr: TStringField
      FieldName = 'qr'
      Size = 250
    end
    object s_tovars_izm1: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm1'
      LookupDataSet = s_izm1
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm1'
      Size = 15
      Lookup = True
    end
    object s_tovarshakl: TStringField
      FieldName = 'shakl'
      Size = 250
    end
    object s_tovarinternom: TStringField
      FieldName = 'internom'
      Size = 250
    end
    object s_tovarmiqdor: TSmallintField
      FieldName = 'miqdor'
    end
    object s_tovarshart: TSmallintField
      FieldName = 'shart'
    end
    object s_tovarkat: TSmallintField
      FieldName = 'kat'
    end
    object s_tovarbrend: TSmallintField
      FieldName = 'brend'
    end
    object s_tovarkg: TSmallintField
      FieldName = 'kg'
    end
    object s_tovarshtrix_full: TStringField
      FieldName = 'shtrix_full'
      Size = 150
    end
    object s_tovarshtrix_in: TStringField
      FieldName = 'shtrix_in'
      Size = 100
    end
    object s_tovarshtrix1: TStringField
      FieldName = 'shtrix1'
      Size = 150
    end
    object s_tovarshtrix2: TStringField
      FieldName = 'shtrix2'
      Size = 150
    end
    object s_tovarustama: TFloatField
      FieldName = 'ustama'
    end
    object s_tovarpapka: TIntegerField
      FieldName = 'papka'
    end
    object s_tovarulg1: TFloatField
      FieldName = 'ulg1'
    end
    object s_tovarulg1_pl: TFloatField
      FieldName = 'ulg1_pl'
    end
    object s_tovarulg2: TFloatField
      FieldName = 'ulg2'
    end
    object s_tovarulg2_pl: TFloatField
      FieldName = 'ulg2_pl'
    end
    object s_tovarbank: TFloatField
      FieldName = 'bank'
    end
    object s_tovarsena: TFloatField
      FieldName = 'sena'
    end
    object s_tovarsena_d: TFloatField
      FieldName = 'sena_d'
    end
    object s_tovarsotish_d: TFloatField
      FieldName = 'sotish_d'
    end
    object s_tovars_kat: TStringField
      FieldKind = fkLookup
      FieldName = 's_kat'
      LookupDataSet = s_kat
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'kat'
      Size = 250
      Lookup = True
    end
    object s_tovartz_id: TSmallintField
      FieldName = 'tz_id'
    end
    object s_tovarotdel: TIntegerField
      FieldName = 'otdel'
      Required = True
    end
    object s_tovarmajbur_dori_id: TIntegerField
      FieldName = 'majbur_dori_id'
    end
    object s_tovarsena_in_d: TFloatField
      FieldName = 'sena_in_d'
    end
    object s_tovarsotish_in_d: TFloatField
      FieldName = 'sotish_in_d'
    end
  end
  object Ds_tovar: TDataSource
    DataSet = s_tovar
    Left = 218
    Top = 63
  end
  object s_zavod: TZQuery
    Connection = lbd
    OnNewRecord = s_zavodNewRecord
    SQL.Strings = (
      'SELECT * FROM s_zavod order by nom')
    Params = <>
    Left = 512
    Top = 14
  end
  object Ds_zavod: TDataSource
    DataSet = s_zavod
    Left = 512
    Top = 62
  end
  object s_izm: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_izm order by nom')
    Params = <>
    Left = 720
    Top = 16
  end
  object Ds_izm: TDataSource
    DataSet = s_izm
    Left = 720
    Top = 63
  end
  object s_izm1: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_izm1 order by nom')
    Params = <>
    Left = 768
    Top = 16
  end
  object Ds_izm1: TDataSource
    DataSet = s_izm1
    Left = 768
    Top = 63
  end
  object s_tovar_link: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_tovar where del_flag=1 order by nom')
    Params = <>
    Left = 249
    Top = 121
    object IntegerField1: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'nom'
      Size = 250
    end
    object IntegerField2: TIntegerField
      FieldName = 'zavod_id'
    end
    object StringField5: TStringField
      FieldKind = fkLookup
      FieldName = 'zavod'
      LookupDataSet = s_zavod
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'zavod_id'
      Size = 150
      Lookup = True
    end
  end
  object Ds_tovar_link: TDataSource
    DataSet = s_tovar_link
    Left = 250
    Top = 169
  end
  object protizm: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM protizm')
    Params = <>
    Left = 189
    Top = 120
  end
  object Dprotizm: TDataSource
    DataSet = protizm
    Left = 189
    Top = 168
  end
  object asos: TZQuery
    Connection = lbd
    OnNewRecord = asosNewRecord
    SQL.Strings = (
      'SELECT * FROM asos where del_flag=1 order by id desc')
    Params = <>
    Left = 422
    Top = 121
    object asosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object asosclient_id: TIntegerField
      FieldName = 'client_id'
    end
    object asoskassa_id: TIntegerField
      FieldName = 'kassa_id'
    end
    object asosxodim_id: TIntegerField
      FieldName = 'xodim_id'
      Required = True
    end
    object asossana: TDateField
      FieldName = 'sana'
    end
    object asosdel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object asoss_kassa: TStringField
      FieldKind = fkLookup
      FieldName = 's_kassa'
      LookupDataSet = s_kassa
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'kassa_id'
      Size = 150
      Lookup = True
    end
    object asoschangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object asosuser_id: TIntegerField
      FieldName = 'user_id'
    end
    object asossumma: TFloatField
      FieldName = 'summa'
    end
    object asoskol: TIntegerField
      FieldName = 'kol'
    end
    object asostur_oper: TSmallintField
      FieldName = 'tur_oper'
    end
    object asosdiler_id: TIntegerField
      FieldName = 'diler_id'
    end
    object asosseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object asosnomer: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object asossum_naqd: TFloatField
      FieldName = 'sum_naqd'
    end
    object asossum_plastik: TFloatField
      FieldName = 'sum_plastik'
    end
    object asoss_dlier: TStringField
      FieldKind = fkLookup
      FieldName = 's_dlier'
      LookupDataSet = s_diler
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'diler_id'
      Size = 250
      Lookup = True
    end
    object asosqabul_sana: TDateTimeField
      FieldName = 'qabul_sana'
    end
    object asosprint_flag: TSmallintField
      FieldName = 'print_flag'
    end
    object asosombor_id: TIntegerField
      FieldName = 'ombor_id'
    end
    object asosfilial_id: TIntegerField
      FieldName = 'filial_id'
    end
    object asosshartnoma_id: TIntegerField
      FieldName = 'shartnoma_id'
    end
    object asosqarz_summa: TFloatField
      FieldName = 'qarz_summa'
    end
    object asosqarz_kim: TStringField
      FieldName = 'qarz_kim'
      Size = 100
    end
    object asosqarz_izoh: TStringField
      FieldName = 'qarz_izoh'
      Size = 250
    end
    object asosqarz_flag: TSmallintField
      FieldName = 'qarz_flag'
    end
    object asosh_id: TIntegerField
      FieldName = 'h_id'
    end
    object asossum_epos: TFloatField
      FieldName = 'sum_epos'
    end
    object asoscheg_n: TFloatField
      FieldName = 'cheg_n'
    end
    object asoscheg_p: TFloatField
      FieldName = 'cheg_p'
    end
    object asoscheg_e: TFloatField
      FieldName = 'cheg_e'
    end
    object asossum_naqd_ch: TFloatField
      FieldName = 'sum_naqd_ch'
    end
    object asossum_plast_ch: TFloatField
      FieldName = 'sum_plast_ch'
    end
    object asossum_epos_ch: TFloatField
      FieldName = 'sum_epos_ch'
    end
    object asossumma_ch: TFloatField
      FieldName = 'summa_ch'
    end
    object asospl_id: TIntegerField
      FieldName = 'pl_id'
    end
    object asosharidor: TStringField
      FieldKind = fkLookup
      FieldName = 'haridor'
      LookupDataSet = s_haridor
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'h_id'
      Size = 150
      Lookup = True
    end
    object asoskurs: TFloatField
      FieldName = 'kurs'
    end
    object asosdollar: TSmallintField
      FieldName = 'dollar'
    end
    object asossum_d: TFloatField
      FieldName = 'sum_d'
    end
    object asosplastik_id: TIntegerField
      FieldName = 'plastik_id'
    end
    object asoss_xodim: TStringField
      FieldKind = fkLookup
      FieldName = 's_xodim'
      LookupDataSet = s_xodim
      LookupKeyFields = 'id'
      LookupResultField = 'username'
      KeyFields = 'xodim_id'
      Size = 150
      Lookup = True
    end
    object asoss_xodimtel: TStringField
      FieldKind = fkLookup
      FieldName = 's_xodimtel'
      LookupDataSet = s_xodim
      LookupKeyFields = 'id'
      LookupResultField = 'phone_number'
      KeyFields = 'xodim_id'
      Size = 15
      Lookup = True
    end
    object asosmobil: TIntegerField
      FieldName = 'mobil'
      Required = True
    end
    object asoss_mobil: TStringField
      FieldKind = fkLookup
      FieldName = 's_mobil'
      LookupDataSet = s_mobil
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'mobil'
      Size = 150
      Lookup = True
    end
    object asosxizmat_foiz: TSmallintField
      FieldName = 'xizmat_foiz'
      Required = True
    end
    object asosxizmat: TFloatField
      FieldName = 'xizmat'
    end
    object asoss_user: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_xodim
      LookupKeyFields = 'id'
      LookupResultField = 'username'
      KeyFields = 'user_id'
      Size = 250
      Lookup = True
    end
    object asoss_usertel: TStringField
      FieldKind = fkLookup
      FieldName = 's_usertel'
      LookupDataSet = s_xodim
      LookupKeyFields = 'id'
      LookupResultField = 'phone_number'
      KeyFields = 'user_id'
      Size = 15
      Lookup = True
    end
    object asosofisant: TStringField
      FieldKind = fkLookup
      FieldName = 'ofisant'
      LookupDataSet = user
      LookupKeyFields = 'id'
      LookupResultField = 'username'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
    end
    object asoscheg_d: TFloatField
      FieldName = 'cheg_d'
    end
    object asossum_d_ch: TFloatField
      FieldName = 'sum_d_ch'
    end
    object asossotuv_turi: TIntegerField
      FieldName = 'sotuv_turi'
    end
    object asosqarz_dollar: TFloatField
      FieldName = 'qarz_dollar'
    end
    object asosreklama: TFloatField
      FieldName = 'reklama'
    end
  end
  object Dasos: TDataSource
    DataSet = asos
    Left = 422
    Top = 169
  end
  object asos_slave: TZQuery
    Connection = lbd
    BeforeEdit = asos_slaveBeforeEdit
    BeforePost = asos_slaveBeforePost
    SQL.Strings = (
      
        'SELECT * FROM asos_slave where del_flag=1 and asos_id=:id  order' +
        ' by id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Dasos
    Left = 479
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object asos_slaveid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object asos_slavetovar_id: TIntegerField
      FieldName = 'tovar_id'
    end
    object asos_slavetovar_nom: TStringField
      FieldName = 'tovar_nom'
      Size = 250
    end
    object asos_slavetulov_id: TIntegerField
      FieldName = 'tulov_id'
    end
    object asos_slavesrok: TDateField
      FieldName = 'srok'
    end
    object asos_slavesubkod: TSmallintField
      FieldName = 'subkod'
    end
    object asos_slaveuser_id: TIntegerField
      FieldName = 'user_id'
    end
    object asos_slaves_user: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_user
      LookupKeyFields = 'id'
      LookupResultField = 'fio'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
    end
    object asos_slavechangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object asos_slaveasos_id: TIntegerField
      FieldName = 'asos_id'
    end
    object asos_slavedel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object asos_slavesena: TFloatField
      FieldName = 'sena'
    end
    object asos_slavesumma: TFloatField
      FieldName = 'summa'
    end
    object asos_slaveizm_id: TSmallintField
      FieldName = 'izm_id'
    end
    object asos_slavesotish: TFloatField
      FieldName = 'sotish'
      Required = True
    end
    object asos_slaveturi: TSmallintField
      FieldName = 'turi'
      Required = True
    end
    object asos_slaveresept: TSmallintField
      FieldName = 'resept'
      Required = True
    end
    object asos_slaveqrkod: TSmallintField
      FieldName = 'qrkod'
    end
    object asos_slaveizm1: TSmallintField
      FieldName = 'izm1'
    end
    object asos_slaveseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object asos_slavesena_in: TFloatField
      FieldName = 'sena_in'
    end
    object asos_slavesumma_in: TFloatField
      FieldName = 'summa_in'
    end
    object asos_slavesumma_all: TFloatField
      FieldName = 'summa_all'
    end
    object asos_slavesotish_in: TFloatField
      FieldName = 'sotish_in'
    end
    object asos_slavekol_ost: TIntegerField
      FieldName = 'kol_ost'
      Required = True
    end
    object asos_slavekol_in_ost: TIntegerField
      FieldName = 'kol_in_ost'
      Required = True
    end
    object asos_slaves_izm_id: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm_id'
      LookupDataSet = s_izm
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm_id'
      Size = 15
      Lookup = True
    end
    object asos_slaves_izm1: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm1'
      LookupDataSet = s_izm1
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm1'
      Size = 15
      Lookup = True
    end
    object asos_slaves_tovar: TStringField
      FieldKind = fkLookup
      FieldName = 's_tovar'
      LookupDataSet = s_tovar
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'tovar_id'
      Size = 150
      Lookup = True
    end
    object asos_slavefoiz: TFloatField
      FieldName = 'foiz'
    end
    object asos_slavefoiz_in: TFloatField
      FieldName = 'foiz_in'
    end
    object asos_slavepolka: TStringField
      FieldName = 'polka'
      Size = 50
    end
    object asos_slavesena_d: TFloatField
      FieldName = 'sena_d'
    end
    object asos_slavesena_in_d: TFloatField
      FieldName = 'sena_in_d'
    end
    object asos_slavesotish_d: TFloatField
      FieldName = 'sotish_d'
    end
    object asos_slavesotish_in_d: TFloatField
      FieldName = 'sotish_in_d'
    end
    object asos_slavezakaz: TDateTimeField
      FieldName = 'zakaz'
    end
    object asos_slavezakaz_ok: TDateTimeField
      FieldName = 'zakaz_ok'
    end
    object asos_slavezakaz_end: TDateTimeField
      FieldName = 'zakaz_end'
    end
    object asos_slavezakaz_print: TSmallintField
      FieldName = 'zakaz_print'
    end
    object asos_slavekol: TIntegerField
      FieldName = 'kol'
    end
    object asos_slavekol_in: TIntegerField
      FieldName = 'kol_in'
    end
    object asos_slaveopt1: TFloatField
      FieldName = 'opt1'
    end
  end
  object Dasos_slave: TDataSource
    DataSet = asos_slave
    Left = 479
    Top = 169
  end
  object s_diler: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_diler')
    Params = <>
    Left = 374
    Top = 13
    object s_dilerid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object s_dilerkod: TIntegerField
      FieldName = 'kod'
    end
    object s_dilernom: TStringField
      FieldName = 'nom'
      Size = 250
    end
    object s_dileruserpass: TStringField
      FieldName = 'userpass'
      Required = True
      Size = 50
    end
    object s_dilerkomu: TSmallintField
      FieldName = 'komu'
    end
    object s_dileradress: TStringField
      FieldName = 'adress'
      Size = 250
    end
    object s_dilermanzil: TStringField
      FieldName = 'manzil'
      Size = 250
    end
    object s_dilerindeks: TStringField
      FieldName = 'indeks'
    end
    object s_dilerobl: TIntegerField
      FieldName = 'obl'
    end
    object s_dilerboss: TStringField
      FieldName = 'boss'
      Size = 150
    end
    object s_dilertel: TStringField
      FieldName = 'tel'
      Size = 50
    end
    object s_dilerrs: TStringField
      FieldName = 'rs'
    end
    object s_dilermr: TStringField
      FieldName = 'mr'
    end
    object s_dilerinn: TStringField
      FieldName = 'inn'
      Size = 9
    end
    object s_dilerokonh: TStringField
      FieldName = 'okonh'
      Size = 9
    end
    object s_dilerbank: TStringField
      FieldName = 'bank'
      Size = 150
    end
    object s_dilerkod_bank: TStringField
      FieldName = 'kod_bank'
      Size = 5
    end
    object s_dilerflag: TSmallintField
      FieldName = 'flag'
    end
    object s_dilergorod: TStringField
      FieldName = 'gorod'
      Size = 50
    end
    object s_dileractive: TSmallintField
      FieldName = 'active'
    end
    object s_dilertugashsana: TDateField
      FieldName = 'tugashsana'
    end
    object s_dileruser_id: TIntegerField
      FieldName = 'user_id'
    end
    object s_dilerchangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object s_dileruyu_type: TIntegerField
      FieldName = 'uyu_type'
    end
    object s_dilerarendachi_kodi: TIntegerField
      FieldName = 'arendachi_kodi'
    end
    object s_dileravto: TIntegerField
      FieldName = 'avto'
      Required = True
    end
    object s_dilersana: TDateField
      FieldName = 'sana'
    end
    object s_dilersrok: TDateField
      FieldName = 'srok'
    end
    object s_dilersayt: TStringField
      FieldName = 'sayt'
      Size = 100
    end
    object s_dileremail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object s_dilermasul1: TStringField
      FieldName = 'masul1'
      Size = 100
    end
    object s_dilertelsms1: TStringField
      FieldName = 'telsms1'
      Size = 9
    end
    object s_dilermasul2: TStringField
      FieldName = 'masul2'
      Size = 100
    end
    object s_dilertelsms2: TStringField
      FieldName = 'telsms2'
      Size = 9
    end
    object s_dilertelinternet: TSmallintField
      FieldName = 'telinternet'
      Required = True
    end
    object s_dilernik: TSmallintField
      FieldName = 'nik'
      Required = True
    end
    object s_dilersumma: TFloatField
      FieldName = 'summa'
      Required = True
    end
    object s_dilerssana: TDateField
      FieldName = 'ssana'
    end
    object s_dilersnomer: TStringField
      FieldName = 'snomer'
      Size = 50
    end
    object s_dilerdel_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object s_dileriamhere: TIntegerField
      FieldName = 'iamhere'
    end
    object s_dilerdiamhere: TDateTimeField
      FieldName = 'diamhere'
    end
    object s_dilerprikname: TStringField
      FieldName = 'prikname'
      Size = 50
    end
    object s_dilerprikdate: TDateTimeField
      FieldName = 'prikdate'
    end
    object s_dilervaqt_in: TDateTimeField
      FieldName = 'vaqt_in'
    end
    object s_dilervaqtout: TDateTimeField
      FieldName = 'vaqtout'
    end
    object s_dilerkim: TStringField
      FieldName = 'kim'
      Size = 100
    end
    object s_dilertarmoq: TStringField
      FieldName = 'tarmoq'
      Size = 100
    end
    object s_dilers_user: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_client
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
    end
  end
  object Ds_diler: TDataSource
    DataSet = s_diler
    Left = 373
    Top = 61
  end
  object asos_qoldiq: TZQuery
    Connection = lbd
    BeforeInsert = asos_qoldiqBeforeInsert
    BeforeEdit = asos_qoldiqBeforeEdit
    AfterPost = asos_qoldiqAfterPost
    AfterCancel = asos_qoldiqAfterCancel
    OnNewRecord = asos_qoldiqNewRecord
    SQL.Strings = (
      'SELECT * FROM asos where del_flag=1 and tur_oper = 5 ')
    Params = <>
    Left = 543
    Top = 121
    object asos_qoldiqid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object asos_qoldiqclient_id: TIntegerField
      FieldName = 'client_id'
      Required = True
    end
    object asos_qoldiqkassa_id: TIntegerField
      FieldName = 'kassa_id'
    end
    object asos_qoldiqxodim_id: TIntegerField
      FieldName = 'xodim_id'
    end
    object asos_qoldiqseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object asos_qoldiqnomer: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object asos_qoldiqsana: TDateField
      FieldName = 'sana'
      Required = True
    end
    object asos_qoldiqsumma: TFloatField
      FieldName = 'summa'
    end
    object asos_qoldiqkol: TIntegerField
      FieldName = 'kol'
    end
    object asos_qoldiqchangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object asos_qoldiquser_id: TIntegerField
      FieldName = 'user_id'
    end
    object asos_qoldiqdel_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object asos_qoldiqtur_oper: TSmallintField
      FieldName = 'tur_oper'
    end
    object asos_qoldiqdiler_id: TIntegerField
      FieldName = 'diler_id'
    end
    object asos_qoldiqs_diler: TStringField
      FieldKind = fkLookup
      FieldName = 's_diler'
      LookupDataSet = s_diler
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'diler_id'
      Size = 150
      Lookup = True
    end
    object asos_qoldiqjami: TStringField
      FieldKind = fkCalculated
      FieldName = 'jami'
      OnGetText = asos_qoldiqjamiGetText
      Size = 250
      Calculated = True
    end
    object asos_qoldiqsum_naqd: TFloatField
      FieldName = 'sum_naqd'
      Required = True
    end
    object asos_qoldiqsum_plastik: TFloatField
      FieldName = 'sum_plastik'
      Required = True
    end
    object asos_qoldiqshartnoma_id: TIntegerField
      FieldName = 'shartnoma_id'
    end
    object asos_qoldiqdollar: TSmallintField
      FieldName = 'dollar'
    end
    object asos_qoldiqkurs: TFloatField
      FieldName = 'kurs'
    end
  end
  object Dasos_qoldiq: TDataSource
    DataSet = asos_qoldiq
    Left = 543
    Top = 169
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
    DataSource = Ds_tovar
    Left = 659
    Top = 121
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
      LookupDataSet = s_user
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
      LookupDataSet = s_izm
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
      LookupDataSet = asos_qoldiq
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
      OnGetText = qoldiqs_qrkodGetText
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
      LookupDataSet = asos_qoldiq
      LookupKeyFields = 'id'
      LookupResultField = 'sana'
      KeyFields = 'asos_id'
      Size = 30
      Lookup = True
    end
    object qoldiqs_izm1: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm1'
      LookupDataSet = s_izm1
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
      LookupDataSet = asos_qoldiq
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
      LookupDataSet = s_tovar
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'tovar_id'
      Size = 150
      Lookup = True
    end
    object qoldiqfoyda: TFloatField
      FieldKind = fkCalculated
      FieldName = 'foyda'
      OnGetText = qoldiqfoydaGetText
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
      LookupDataSet = s_tovar
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
    Left = 659
    Top = 169
  end
  object s_ombor: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'SELECT t.shtrix,z.nom as znom,d.nom as dnom,s.kol_ost*s.sotish a' +
        's q,s.kol_in_ost*s.sotish_in as q_in, s.kol_ost*s.sotish+s.kol_i' +
        'n_ost*s.sotish_in as q_all,s.*,t.nom as s_tovar,z.nom as s_zavod' +
        ',d.nom as s_diler'
      ' FROM asos a,asos_slave s,s_tovar t,s_zavod z,s_diler d'
      
        '  where (a.tur_oper=1 or a.tur_oper=4 or a.tur_oper=5) and (s.ko' +
        'l_ost>0 or s.kol_in_ost>0) and d.id=a.diler_id and z.id=t.zavod_' +
        'id and t.id=s.tovar_id and a.id=s.asos_id and a.id=s.asos_id and' +
        ' s.del_flag=1 and a.client_id = 0 order by s_tovar'
      ''
      ' ')
    Params = <>
    DataSource = Ds_client
    Left = 709
    Top = 121
  end
  object Ds_ombor: TDataSource
    DataSet = s_ombor
    Left = 709
    Top = 169
  end
  object asos_all: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'SELECT * FROM asos where del_flag=1 and  id=:asos_id order by sa' +
        'na')
    Params = <
      item
        DataType = ftUnknown
        Name = 'asos_id'
        ParamType = ptUnknown
      end>
    DataSource = Ds_ombor
    Left = 752
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'asos_id'
        ParamType = ptUnknown
      end>
    object IntegerField3: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'client_id'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'kassa_id'
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'xodim_id'
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'sana'
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object StringField2: TStringField
      FieldKind = fkLookup
      FieldName = 's_kassa'
      LookupDataSet = s_kassa
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'kassa_id'
      Size = 150
      Lookup = True
    end
    object StringField3: TStringField
      FieldKind = fkLookup
      FieldName = 's_xodim'
      LookupDataSet = s_xodim
      LookupKeyFields = 'id'
      LookupResultField = 'login'
      KeyFields = 'xodim_id'
      Size = 150
      Lookup = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'changedate'
    end
    object IntegerField7: TIntegerField
      FieldName = 'user_id'
    end
    object StringField4: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_xodim
      LookupKeyFields = 'id'
      LookupResultField = 'fio'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
    end
    object FloatField1: TFloatField
      FieldName = 'summa'
    end
    object IntegerField8: TIntegerField
      FieldName = 'kol'
      Required = True
    end
    object SmallintField2: TSmallintField
      FieldName = 'tur_oper'
      Required = True
    end
    object IntegerField9: TIntegerField
      FieldName = 'diler_id'
    end
    object asos_alls_diler: TStringField
      FieldKind = fkLookup
      FieldName = 's_diler'
      LookupDataSet = s_diler
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'diler_id'
      Size = 150
      Lookup = True
    end
    object asos_allseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object asos_allnomer: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object asos_alljami: TStringField
      FieldKind = fkCalculated
      FieldName = 'jami'
      OnGetText = asos_alljamiGetText
      Size = 250
      Calculated = True
    end
    object asos_alls_tur_oper: TStringField
      FieldKind = fkLookup
      FieldName = 's_tur_oper'
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'tur_oper'
      Size = 150
      Lookup = True
    end
  end
  object Dasos_all: TDataSource
    DataSet = asos_all
    Left = 752
    Top = 169
  end
  object asos_all_tanla: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'SELECT * FROM asos where del_flag=1 and  id=:asos_id order by sa' +
        'na')
    Params = <
      item
        DataType = ftUnknown
        Name = 'asos_id'
        ParamType = ptUnknown
      end>
    Left = 898
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'asos_id'
        ParamType = ptUnknown
      end>
    object asos_all_tanlaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object asos_all_tanlaclient_id: TIntegerField
      FieldName = 'client_id'
      Required = True
    end
    object asos_all_tanlakassa_id: TIntegerField
      FieldName = 'kassa_id'
    end
    object asos_all_tanlaxodim_id: TIntegerField
      FieldName = 'xodim_id'
    end
    object asos_all_tanlaseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object asos_all_tanlanomer: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object asos_all_tanlasana: TDateField
      FieldName = 'sana'
      Required = True
    end
    object asos_all_tanlasumma: TFloatField
      FieldName = 'summa'
    end
    object asos_all_tanlakol: TIntegerField
      FieldName = 'kol'
    end
    object asos_all_tanlachangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object asos_all_tanlauser_id: TIntegerField
      FieldName = 'user_id'
    end
    object asos_all_tanladel_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object asos_all_tanlatur_oper: TSmallintField
      FieldName = 'tur_oper'
    end
    object asos_all_tanladiler_id: TIntegerField
      FieldName = 'diler_id'
    end
    object asos_all_tanlas_tur_oper: TStringField
      FieldKind = fkLookup
      FieldName = 's_tur_oper'
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'tur_oper'
      Size = 150
      Lookup = True
    end
    object asos_all_tanlajami: TStringField
      FieldKind = fkCalculated
      FieldName = 'jami'
      OnGetText = asos_all_tanlajamiGetText
      Size = 150
      Calculated = True
    end
    object asos_all_tanlas_diler: TStringField
      FieldKind = fkLookup
      FieldName = 's_diler'
      LookupDataSet = s_diler
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'diler_id'
      Size = 150
      Lookup = True
    end
  end
  object Dasos_all_tanla: TDataSource
    DataSet = asos_all_tanla
    Left = 898
    Top = 169
  end
  object s_qoldiq: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'SELECT * FROM asos_slave where del_flag=1 and asos_id=:id order ' +
        'by id desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 23
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Ds_qoldiq: TDataSource
    DataSet = s_qoldiq
    Left = 23
    Top = 169
  end
  object s_tur_oper: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_tur_oper')
    Params = <>
    Left = 79
    Top = 121
  end
  object Ds_tur_oper: TDataSource
    DataSet = s_tur_oper
    Left = 82
    Top = 169
  end
  object s_t_all: TZQuery
    Connection = lbd
    SortedFields = 'nom'
    SQL.Strings = (
      'SELECT * FROM s_tovar where del_flag=1 and id = 0 order by nom')
    Params = <>
    IndexFieldNames = 'nom Asc'
    Left = 312
    Top = 121
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
    object s_t_allzavod_id: TIntegerField
      FieldName = 'zavod_id'
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
    object s_t_allzavod: TStringField
      FieldKind = fkLookup
      FieldName = 'zavod'
      LookupDataSet = s_zavod
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'zavod_id'
      Size = 150
      Lookup = True
    end
    object s_t_allshtrix_in: TStringField
      FieldName = 'shtrix_in'
      Size = 100
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
    Left = 313
    Top = 169
  end
  object client_edit: TZQuery
    Connection = lbd
    BeforePost = client_editBeforePost
    SQL.Strings = (
      'select * from s_client  WHERE del_flag=1')
    Params = <>
    Left = 862
    Top = 13
    object client_editid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object client_editiduz: TIntegerField
      FieldName = 'iduz'
    end
    object client_editkod: TIntegerField
      FieldName = 'kod'
    end
    object client_editnom: TStringField
      FieldName = 'nom'
      Size = 250
    end
    object client_edituserpass: TStringField
      FieldName = 'userpass'
      Required = True
      Size = 50
    end
    object client_editkomu: TSmallintField
      FieldName = 'komu'
    end
    object client_editvazir: TIntegerField
      FieldName = 'vazir'
    end
    object client_editadress: TStringField
      FieldName = 'adress'
      Size = 250
    end
    object client_editmanzil: TStringField
      FieldName = 'manzil'
      Size = 250
    end
    object client_editindeks: TStringField
      FieldName = 'indeks'
    end
    object client_editobl: TIntegerField
      FieldName = 'obl'
    end
    object client_edittuman: TIntegerField
      FieldName = 'tuman'
    end
    object client_editboss: TStringField
      FieldName = 'boss'
      Size = 150
    end
    object client_edittel: TStringField
      FieldName = 'tel'
      Size = 50
    end
    object client_editrs: TStringField
      FieldName = 'rs'
    end
    object client_editmr: TStringField
      FieldName = 'mr'
    end
    object client_editinn: TStringField
      FieldName = 'inn'
      Size = 9
    end
    object client_editokonh: TStringField
      FieldName = 'okonh'
      Size = 9
    end
    object client_editbank: TStringField
      FieldName = 'bank'
      Size = 150
    end
    object client_editkod_bank: TStringField
      FieldName = 'kod_bank'
      Size = 5
    end
    object client_edits1: TStringField
      FieldName = 's1'
      Size = 12
    end
    object client_editflag: TSmallintField
      FieldName = 'flag'
    end
    object client_editflag1: TStringField
      FieldName = 'flag1'
    end
    object client_editflag2: TStringField
      FieldName = 'flag2'
    end
    object client_editgorod: TStringField
      FieldName = 'gorod'
      Size = 50
    end
    object client_editactive: TSmallintField
      FieldName = 'active'
    end
    object client_edittugashsana: TDateField
      FieldName = 'tugashsana'
    end
    object client_edituser_id: TIntegerField
      FieldName = 'user_id'
    end
    object client_editchangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object client_edituyu_type: TIntegerField
      FieldName = 'uyu_type'
    end
    object client_editgaraj: TIntegerField
      FieldName = 'garaj'
    end
    object client_editgaraj_turi: TSmallintField
      FieldName = 'garaj_turi'
      Required = True
    end
    object client_editarendachi_kodi: TIntegerField
      FieldName = 'arendachi_kodi'
    end
    object client_editarendachi_nomi: TStringField
      FieldName = 'arendachi_nomi'
      Size = 128
    end
    object client_editjivoy: TSmallintField
      FieldName = 'jivoy'
      Required = True
    end
    object client_edittja: TSmallintField
      FieldName = 'tja'
      Required = True
    end
    object client_editavto: TIntegerField
      FieldName = 'avto'
      Required = True
    end
    object client_editsana: TDateField
      FieldName = 'sana'
    end
    object client_editsrok: TDateField
      FieldName = 'srok'
    end
    object client_editprim: TStringField
      FieldName = 'prim'
      Size = 250
    end
    object client_edittez: TIntegerField
      FieldName = 'tez'
      Required = True
    end
    object client_editstos: TSmallintField
      FieldName = 'stos'
      Required = True
    end
    object client_edittods_sana: TDateField
      FieldName = 'tods_sana'
    end
    object client_edittods: TSmallintField
      FieldName = 'tods'
      Required = True
    end
    object client_editsayt: TStringField
      FieldName = 'sayt'
      Size = 100
    end
    object client_editemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object client_editmasul1: TStringField
      FieldName = 'masul1'
      Size = 100
    end
    object client_edittelsms1: TStringField
      FieldName = 'telsms1'
      Size = 9
    end
    object client_editmasul2: TStringField
      FieldName = 'masul2'
      Size = 100
    end
    object client_edittelsms2: TStringField
      FieldName = 'telsms2'
      Size = 9
    end
    object client_editkomputer: TSmallintField
      FieldName = 'komputer'
      Required = True
    end
    object client_editprinter: TSmallintField
      FieldName = 'printer'
      Required = True
    end
    object client_editskaner: TSmallintField
      FieldName = 'skaner'
      Required = True
    end
    object client_editesp: TSmallintField
      FieldName = 'esp'
      Required = True
    end
    object client_edittelinternet: TSmallintField
      FieldName = 'telinternet'
      Required = True
    end
    object client_editprimoferta: TStringField
      FieldName = 'primoferta'
      Size = 150
    end
    object client_editsanaforma1: TDateField
      FieldName = 'sanaforma1'
    end
    object client_editsanaoplata: TDateField
      FieldName = 'sanaoplata'
    end
    object client_editoferta: TDateField
      FieldName = 'oferta'
    end
    object client_editnik: TSmallintField
      FieldName = 'nik'
      Required = True
    end
    object client_editsumma: TFloatField
      FieldName = 'summa'
      Required = True
    end
    object client_editedit_it: TSmallintField
      FieldName = 'edit_it'
    end
    object client_editssana: TDateField
      FieldName = 'ssana'
    end
    object client_editsnomer: TStringField
      FieldName = 'snomer'
      Size = 50
    end
    object client_editost_n_sbor: TFloatField
      FieldName = 'ost_n_sbor'
    end
    object client_editost_n_posh: TFloatField
      FieldName = 'ost_n_posh'
    end
    object client_editdel_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object client_editkolin: TSmallintField
      FieldName = 'kolin'
    end
    object client_editiamhere: TIntegerField
      FieldName = 'iamhere'
    end
    object client_editdiamhere: TDateTimeField
      FieldName = 'diamhere'
    end
    object client_editprikname: TStringField
      FieldName = 'prikname'
      Size = 50
    end
    object client_editprikdate: TDateTimeField
      FieldName = 'prikdate'
    end
    object client_editfilenom: TStringField
      FieldName = 'filenom'
      Size = 50
    end
    object client_editat91: TSmallintField
      FieldName = 'at91'
    end
    object client_edittender_n: TIntegerField
      FieldName = 'tender_n'
    end
    object client_edittender_d: TDateField
      FieldName = 'tender_d'
    end
    object client_editxizmat_n: TIntegerField
      FieldName = 'xizmat_n'
    end
    object client_editxizmat_d: TDateField
      FieldName = 'xizmat_d'
    end
    object client_editdisp_n: TIntegerField
      FieldName = 'disp_n'
    end
    object client_editdisp_d: TDateField
      FieldName = 'disp_d'
    end
    object client_editvaqt_in: TDateTimeField
      FieldName = 'vaqt_in'
    end
    object client_editvaqtout: TDateTimeField
      FieldName = 'vaqtout'
    end
    object client_editkim: TStringField
      FieldName = 'kim'
      Size = 100
    end
    object client_edittarmoq: TStringField
      FieldName = 'tarmoq'
      Size = 100
    end
    object client_editdollar: TIntegerField
      FieldName = 'dollar'
      Required = True
    end
    object client_editbux: TDateField
      FieldName = 'bux'
    end
    object client_edityaxlitlash: TSmallintField
      FieldName = 'yaxlitlash'
      Required = True
    end
    object client_edityaxlitlash_in: TSmallintField
      FieldName = 'yaxlitlash_in'
      Required = True
    end
    object client_editfoiz: TFloatField
      FieldName = 'foiz'
    end
    object client_editfoiz_in: TFloatField
      FieldName = 'foiz_in'
      Required = True
    end
    object client_editfoiz_opt2: TFloatField
      FieldName = 'foiz_opt2'
    end
    object client_editfoiz_opt1: TFloatField
      FieldName = 'foiz_opt1'
    end
    object client_editfoiz_schet: TFloatField
      FieldName = 'foiz_schet'
    end
    object client_editfoiz_ch2: TFloatField
      FieldName = 'foiz_ch2'
    end
  end
  object Dclient_edit: TDataSource
    DataSet = client_edit
    Left = 862
    Top = 61
  end
  object k_asos: TZQuery
    Connection = lbd
    AfterScroll = k_asosAfterScroll
    SQL.Strings = (
      'SELECT * FROM asos where del_flag=1 order by sana')
    Params = <>
    Left = 911
    Top = 14
    object k_asosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object k_asosclient_id: TIntegerField
      FieldName = 'client_id'
      Required = True
    end
    object k_asoskassa_id: TIntegerField
      FieldName = 'kassa_id'
    end
    object k_asosxodim_id: TIntegerField
      FieldName = 'xodim_id'
    end
    object k_asosseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object k_asosnomer: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object k_asossana: TDateField
      FieldName = 'sana'
    end
    object k_asossumma: TFloatField
      FieldName = 'summa'
      OnGetText = k_asossummaGetText
    end
    object k_asossum_naqd: TFloatField
      FieldName = 'sum_naqd'
    end
    object k_asossum_plastik: TFloatField
      FieldName = 'sum_plastik'
    end
    object k_asoskol: TIntegerField
      FieldName = 'kol'
    end
    object k_asoschangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object k_asosuser_id: TIntegerField
      FieldName = 'user_id'
    end
    object k_asosdel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object k_asostur_oper: TSmallintField
      FieldName = 'tur_oper'
    end
    object k_asosdiler_id: TIntegerField
      FieldName = 'diler_id'
    end
    object k_asosshartnoma_id: TIntegerField
      FieldName = 'shartnoma_id'
    end
    object k_asoss_shartnoma: TStringField
      FieldKind = fkLookup
      FieldName = 's_shartnoma'
      LookupDataSet = shartnoma
      LookupKeyFields = 'id'
      LookupResultField = 'nomer'
      KeyFields = 'shartnoma_id'
      Size = 150
      Lookup = True
    end
    object k_asoss_dlier: TStringField
      FieldKind = fkLookup
      FieldName = 's_dlier'
      LookupDataSet = s_diler
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'diler_id'
      Size = 150
      Lookup = True
    end
    object k_asosqabul_sana: TDateTimeField
      FieldName = 'qabul_sana'
    end
    object k_asosprint_flag: TSmallintField
      FieldName = 'print_flag'
    end
    object k_asosombor_id: TIntegerField
      FieldName = 'ombor_id'
    end
    object k_asosfilial_id: TIntegerField
      FieldName = 'filial_id'
    end
    object k_asoss_filial: TStringField
      FieldKind = fkLookup
      FieldName = 's_filial'
      LookupDataSet = s_filial
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'filial_id'
      Size = 150
      Lookup = True
    end
    object k_asosholat: TStringField
      FieldKind = fkCalculated
      FieldName = 'holat'
      OnGetText = k_asosholatGetText
      Size = 150
      Calculated = True
    end
    object k_asosqarz_summa: TFloatField
      FieldName = 'qarz_summa'
    end
    object k_asosqarz_kim: TStringField
      FieldName = 'qarz_kim'
      Size = 100
    end
    object k_asosqarz_flag: TSmallintField
      FieldName = 'qarz_flag'
    end
    object k_asosqarz_izoh: TStringField
      FieldName = 'qarz_izoh'
      Size = 250
    end
    object k_asosh_id: TIntegerField
      FieldName = 'h_id'
    end
    object k_asoss_h: TStringField
      FieldKind = fkLookup
      FieldName = 's_h'
      LookupDataSet = s_haridor
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'h_id'
      Size = 250
      Lookup = True
    end
    object k_asossum_epos: TFloatField
      FieldName = 'sum_epos'
    end
    object k_asoscheg_n: TFloatField
      FieldName = 'cheg_n'
    end
    object k_asoscheg_p: TFloatField
      FieldName = 'cheg_p'
    end
    object k_asossum_naqd_ch: TFloatField
      FieldName = 'sum_naqd_ch'
    end
    object k_asossum_plast_ch: TFloatField
      FieldName = 'sum_plast_ch'
    end
    object k_asossum_epos_ch: TFloatField
      FieldName = 'sum_epos_ch'
    end
    object k_asoscheg_e: TFloatField
      FieldName = 'cheg_e'
    end
    object k_asossumma_ch: TFloatField
      FieldName = 'summa_ch'
    end
    object k_asospl_id: TIntegerField
      FieldName = 'pl_id'
    end
    object k_asoskurs: TFloatField
      FieldName = 'kurs'
    end
    object k_asosdollar: TSmallintField
      FieldName = 'dollar'
    end
    object k_asossum_d: TFloatField
      FieldName = 'sum_d'
    end
    object k_asoss_xodim: TStringField
      FieldKind = fkLookup
      FieldName = 's_xodim'
      LookupDataSet = s_xodim
      LookupKeyFields = 'id'
      LookupResultField = 'username'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
    end
    object k_asosmobil: TIntegerField
      FieldName = 'mobil'
      Required = True
    end
    object k_asoss_mobil: TStringField
      FieldKind = fkLookup
      FieldName = 's_mobil'
      LookupDataSet = s_mobil
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'mobil'
      Size = 150
      Lookup = True
    end
    object k_asosxizmat_foiz: TSmallintField
      FieldName = 'xizmat_foiz'
      Required = True
    end
    object k_asosxizmat: TFloatField
      FieldName = 'xizmat'
    end
    object k_asoscheg_d: TFloatField
      FieldName = 'cheg_d'
    end
    object k_asossum_d_ch: TFloatField
      FieldName = 'sum_d_ch'
    end
    object k_asosqarz_dollar: TFloatField
      FieldName = 'qarz_dollar'
    end
  end
  object Dk_asos: TDataSource
    DataSet = k_asos
    Left = 911
    Top = 62
  end
  object k_slave: TZQuery
    Connection = lbd
    BeforeEdit = asos_slaveBeforeEdit
    BeforePost = k_slaveBeforePost
    SQL.Strings = (
      'SELECT * FROM asos_slave where del_flag=1 and asos_id=:id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Dk_asos
    Left = 959
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object k_slaveid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object k_slavetovar_id: TIntegerField
      FieldName = 'tovar_id'
      Required = True
    end
    object k_slavetovar_nom: TStringField
      FieldName = 'tovar_nom'
      Size = 250
    end
    object k_slaveizm_id: TSmallintField
      FieldName = 'izm_id'
    end
    object k_slaveizm1: TSmallintField
      FieldName = 'izm1'
    end
    object k_slavetulov_id: TIntegerField
      FieldName = 'tulov_id'
    end
    object k_slaveseriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object k_slavesrok: TDateField
      FieldName = 'srok'
    end
    object k_slaveturi: TSmallintField
      FieldName = 'turi'
      Required = True
    end
    object k_slaveresept: TSmallintField
      FieldName = 'resept'
      Required = True
    end
    object k_slaveqrkod: TSmallintField
      FieldName = 'qrkod'
    end
    object k_slavesena: TFloatField
      FieldName = 'sena'
    end
    object k_slavesena_in: TFloatField
      FieldName = 'sena_in'
    end
    object k_slavesumma: TFloatField
      FieldName = 'summa'
    end
    object k_slavesumma_in: TFloatField
      FieldName = 'summa_in'
    end
    object k_slavesumma_all: TFloatField
      FieldName = 'summa_all'
    end
    object k_slavesotish: TFloatField
      FieldName = 'sotish'
      Required = True
    end
    object k_slavesotish_in: TFloatField
      FieldName = 'sotish_in'
    end
    object k_slavefoiz: TFloatField
      FieldName = 'foiz'
    end
    object k_slavefoiz_in: TFloatField
      FieldName = 'foiz_in'
    end
    object k_slavesubkod: TSmallintField
      FieldName = 'subkod'
      Required = True
    end
    object k_slaveuser_id: TIntegerField
      FieldName = 'user_id'
    end
    object k_slavechangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object k_slaveasos_id: TIntegerField
      FieldName = 'asos_id'
      Required = True
    end
    object k_slavedel_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object k_slavekol_ost: TIntegerField
      FieldName = 'kol_ost'
      Required = True
    end
    object k_slavekol_in_ost: TIntegerField
      FieldName = 'kol_in_ost'
      Required = True
    end
    object k_slaves_tovar: TStringField
      FieldKind = fkLookup
      FieldName = 's_tovar'
      LookupDataSet = s_t_all
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'tovar_id'
      Size = 150
      Lookup = True
    end
    object k_slaves_izm1: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm1'
      LookupDataSet = s_izm1
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm1'
      Size = 50
      Lookup = True
    end
    object k_slaves_izm: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm'
      LookupDataSet = s_izm
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm_id'
      Size = 50
      Lookup = True
    end
    object k_slavepolka: TStringField
      FieldName = 'polka'
      Size = 50
    end
    object k_slavesena_d: TFloatField
      FieldName = 'sena_d'
    end
    object k_slavesena_in_d: TFloatField
      FieldName = 'sena_in_d'
    end
    object k_slavesotish_d: TFloatField
      FieldName = 'sotish_d'
    end
    object k_slavesotish_in_d: TFloatField
      FieldName = 'sotish_in_d'
    end
    object k_slavekol: TIntegerField
      FieldName = 'kol'
      Required = True
    end
    object k_slavekol_in: TIntegerField
      FieldName = 'kol_in'
      Required = True
    end
    object k_slavezakaz: TDateTimeField
      FieldName = 'zakaz'
    end
    object k_slavezakaz_ok: TDateTimeField
      FieldName = 'zakaz_ok'
    end
    object k_slavezakaz_end: TDateTimeField
      FieldName = 'zakaz_end'
    end
    object k_slavezakaz_print: TSmallintField
      FieldName = 'zakaz_print'
    end
    object k_slaveopt1: TFloatField
      FieldName = 'opt1'
    end
  end
  object Dk_slave: TDataSource
    DataSet = k_slave
    Left = 959
    Top = 62
  end
  object lbdserver: TZConnection
    Protocol = 'mysql-5'
    HostName = '127.0.0.1'
    Port = 5500
    Database = 'uzaart_teda'
    User = 'info!traffic'
    Password = 'masterkalit'
    Catalog = 'uzaart_teda'
    Properties.Strings = (
      'codepage=cp1251'
      'reconnect=true')
    DesignConnection = True
    Left = 958
    Top = 121
  end
  object comments: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM comments')
    Params = <>
    Left = 615
    Top = 121
  end
  object s_komu: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM lbd_items WHERE i_type LIKE '#39'komu'#39' and subid>1')
    Params = <>
    Left = 568
    Top = 14
  end
  object Ds_komu: TDataSource
    DataSet = s_komu
    Left = 568
    Top = 64
  end
  object shartnoma: TZQuery
    Connection = lbd
    AfterInsert = shartnomaAfterInsert
    AfterEdit = shartnomaAfterEdit
    BeforePost = shartnomaBeforePost
    AfterPost = shartnomaAfterPost
    AfterCancel = shartnomaAfterCancel
    OnNewRecord = shartnomaNewRecord
    SQL.Strings = (
      'SELECT * FROM shartnoma')
    Params = <>
    Left = 23
    Top = 241
    object shartnomaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object shartnomanomer: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object shartnomasana: TDateField
      FieldName = 'sana'
    end
    object shartnomauser_id: TIntegerField
      FieldName = 'user_id'
    end
    object shartnomachangedate: TDateTimeField
      FieldName = 'changedate'
    end
    object shartnomas_diler: TStringField
      FieldKind = fkLookup
      FieldName = 's_diler'
      LookupDataSet = s_diler
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'diler_id'
      Size = 150
      Lookup = True
    end
    object shartnomadel_flag: TSmallintField
      FieldName = 'del_flag'
    end
    object shartnomasumma: TFloatField
      FieldName = 'summa'
    end
    object shartnomaqoldiq: TFloatField
      FieldName = 'qoldiq'
    end
    object shartnomasrok: TDateField
      FieldName = 'srok'
    end
    object shartnomadiler_id: TIntegerField
      FieldName = 'diler_id'
    end
    object shartnomaclient_id: TIntegerField
      FieldName = 'client_id'
      Required = True
    end
  end
  object Dshartnoma: TDataSource
    DataSet = shartnoma
    Left = 23
    Top = 289
  end
  object s_filial: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'SELECT * FROM s_client where del_flag=1 and (glav_id>0 or glav_i' +
        'd=:x_id)'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'x_id'
        ParamType = ptUnknown
      end>
    Left = 887
    Top = 237
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'x_id'
        ParamType = ptUnknown
      end>
  end
  object Ds_filial: TDataSource
    DataSet = s_filial
    Left = 887
    Top = 288
  end
  object qoldiq_sklad: TZQuery
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
    DataSource = Ds_tovar
    Left = 816
    Top = 238
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object StringField6: TStringField
      FieldName = 'tovar_nom'
      Size = 250
    end
    object DateField2: TDateField
      FieldName = 'srok'
    end
    object SmallintField3: TSmallintField
      FieldName = 'subkod'
    end
    object StringField7: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_user
      LookupKeyFields = 'id'
      LookupResultField = 'fio'
      KeyFields = 'user_id'
      Size = 150
      Lookup = True
    end
    object IntegerField10: TIntegerField
      FieldName = 'asos_id'
    end
    object SmallintField4: TSmallintField
      FieldName = 'del_flag'
    end
    object FloatField2: TFloatField
      FieldName = 'sotish'
      Required = True
    end
    object SmallintField5: TSmallintField
      FieldName = 'kol_in'
      Required = True
    end
    object SmallintField6: TSmallintField
      FieldName = 'turi'
      Required = True
    end
    object SmallintField7: TSmallintField
      FieldName = 'resept'
      Required = True
    end
    object StringField8: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm'
      LookupDataSet = s_izm
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm_id'
      Size = 50
      Lookup = True
    end
    object StringField9: TStringField
      FieldKind = fkCalculated
      FieldName = 'jami'
      Size = 250
      Calculated = True
    end
    object StringField10: TStringField
      FieldKind = fkLookup
      FieldName = 's_diler'
      LookupDataSet = asos_qoldiq
      LookupKeyFields = 'id'
      LookupResultField = 's_diler'
      KeyFields = 'asos_id'
      Size = 150
      Lookup = True
    end
    object SmallintField8: TSmallintField
      FieldName = 'qrkod'
    end
    object StringField11: TStringField
      FieldKind = fkCalculated
      FieldName = 's_qrkod'
      OnGetText = qoldiqs_qrkodGetText
      Size = 10
      Calculated = True
    end
    object IntegerField11: TIntegerField
      FieldName = 'user_id'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'changedate'
    end
    object StringField12: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object FloatField3: TFloatField
      FieldName = 'sena_in'
    end
    object FloatField4: TFloatField
      FieldName = 'sotish_in'
    end
    object SmallintField11: TSmallintField
      FieldName = 'izm1'
    end
    object StringField13: TStringField
      FieldKind = fkLookup
      FieldName = 's_nomer'
      LookupDataSet = asos_qoldiq
      LookupKeyFields = 'id'
      LookupResultField = 'sana'
      KeyFields = 'asos_id'
      Size = 30
      Lookup = True
    end
    object StringField14: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm1'
      LookupDataSet = s_izm1
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm1'
      Size = 15
      Lookup = True
    end
    object FloatField5: TFloatField
      FieldName = 'summa_in'
    end
    object FloatField6: TFloatField
      FieldName = 'summa_all'
    end
    object IntegerField12: TIntegerField
      FieldName = 'kol_ost'
      Required = True
    end
    object IntegerField13: TIntegerField
      FieldName = 'kol_in_ost'
      Required = True
    end
    object FloatField7: TFloatField
      FieldName = 'summa_ost'
    end
    object FloatField8: TFloatField
      FieldName = 'summa_in_ost'
    end
    object FloatField9: TFloatField
      FieldName = 'summa_all_ost'
      Required = True
    end
    object FloatField10: TFloatField
      FieldName = 'summa'
    end
    object SmallintField12: TSmallintField
      FieldName = 'kol'
      Required = True
    end
    object SmallintField13: TSmallintField
      FieldName = 'izm_id'
    end
    object IntegerField14: TIntegerField
      FieldName = 'tulov_id'
    end
    object FloatField11: TFloatField
      FieldName = 'sena'
    end
    object IntegerField15: TIntegerField
      FieldName = 'tovar_id'
      Required = True
    end
    object StringField15: TStringField
      FieldKind = fkLookup
      FieldName = 's_sana'
      LookupDataSet = asos_qoldiq
      LookupKeyFields = 'id'
      LookupResultField = 'sana'
      KeyFields = 'asos_id'
      Size = 25
      Lookup = True
    end
    object IntegerField16: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object StringField16: TStringField
      FieldKind = fkLookup
      FieldName = 's_tovar'
      LookupDataSet = s_tovar
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'tovar_id'
      Size = 150
      Lookup = True
    end
    object FloatField12: TFloatField
      FieldKind = fkCalculated
      FieldName = 'foyda'
      OnGetText = qoldiqfoydaGetText
      Calculated = True
    end
    object FloatField13: TFloatField
      FieldName = 'foiz'
    end
    object FloatField14: TFloatField
      FieldName = 'foiz_in'
    end
    object StringField17: TStringField
      FieldKind = fkLookup
      FieldName = 'zavod'
      LookupDataSet = s_tovar
      LookupKeyFields = 'id'
      LookupResultField = 'zavod'
      KeyFields = 'tovar_id'
      Size = 150
      Lookup = True
    end
  end
  object Dqoldiq_sklad: TDataSource
    DataSet = qoldiq_sklad
    Left = 816
    Top = 286
  end
  object s_haridor: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'SELECT * FROM s_haridor where del_flag=1 and client_id = :id ord' +
        'er by nom')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Ds_client
    Left = 422
    Top = 13
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
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
    Left = 421
    Top = 61
  end
  object Dlink: TDataSource
    DataSet = link
    Left = 798
    Top = 169
  end
  object s_kat: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_kat')
    Params = <>
    Left = 424
    Top = 240
  end
  object Ds_kat: TDataSource
    DataSet = s_kat
    Left = 424
    Top = 287
  end
  object s_brend: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_brend')
    Params = <>
    Left = 480
    Top = 240
    object s_brendid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object s_brendnom: TStringField
      FieldName = 'nom'
      Required = True
      Size = 250
    end
    object s_brendkat_id: TSmallintField
      FieldName = 'kat_id'
    end
    object s_brendkat: TStringField
      FieldKind = fkLookup
      FieldName = 'kat'
      LookupDataSet = s_kat
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'kat_id'
      Size = 150
      Lookup = True
    end
  end
  object Ds_brend: TDataSource
    DataSet = s_brend
    Left = 480
    Top = 287
  end
  object main_link: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_kassa')
    Params = <>
    Left = 836
    Top = 120
  end
  object Dmain_link: TDataSource
    DataSet = main_link
    Left = 838
    Top = 169
  end
  object tpl: TZQuery
    Connection = lbd
    AfterScroll = tplAfterScroll
    BeforeInsert = tplBeforeInsert
    BeforeEdit = tplBeforeEdit
    AfterPost = tplAfterPost
    AfterCancel = tplAfterCancel
    OnNewRecord = tplNewRecord
    SQL.Strings = (
      'select * from pl  where del_flag=1')
    Params = <>
    Left = 105
    Top = 240
    object tplid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object tplbank_id: TIntegerField
      FieldName = 'bank_id'
      Required = True
    end
    object tplkod: TIntegerField
      FieldName = 'kod'
    end
    object tpln_pl: TIntegerField
      FieldName = 'n_pl'
    end
    object tpln_dok: TStringField
      FieldName = 'n_dok'
      Size = 10
    end
    object tpld_pl: TDateField
      FieldName = 'd_pl'
      Required = True
    end
    object tplrssvoy: TStringField
      FieldName = 'rssvoy'
      Size = 26
    end
    object tplrs: TStringField
      FieldName = 'rs'
      Size = 21
    end
    object tplvo: TSmallintField
      FieldName = 'vo'
      Required = True
    end
    object tplnn: TSmallintField
      FieldName = 'nn'
    end
    object tplclient: TIntegerField
      FieldName = 'client'
    end
    object tplclient_id: TIntegerField
      FieldName = 'client_id'
      Required = True
    end
    object tpluser_id: TIntegerField
      FieldName = 'user_id'
      Required = True
    end
    object tplsena_pl: TFloatField
      FieldName = 'sena_pl'
    end
    object tplsena_d: TFloatField
      FieldName = 'sena_d'
    end
    object tplsaldo: TFloatField
      FieldName = 'saldo'
    end
    object tplsaldo_d: TFloatField
      FieldName = 'saldo_d'
    end
    object tplost_pl: TFloatField
      FieldName = 'ost_pl'
    end
    object tplost_d: TFloatField
      FieldName = 'ost_d'
    end
    object tplkurs: TFloatField
      FieldName = 'kurs'
    end
    object tplvid: TSmallintField
      FieldName = 'vid'
    end
    object tpls1: TStringField
      FieldName = 's1'
      Size = 12
    end
    object tplter: TSmallintField
      FieldName = 'ter'
    end
    object tplpot1: TSmallintField
      FieldName = 'pot1'
    end
    object tplpot2: TSmallintField
      FieldName = 'pot2'
    end
    object tplsf: TIntegerField
      FieldName = 'sf'
    end
    object tplsf_pot: TSmallintField
      FieldName = 'sf_pot'
    end
    object tplusername: TStringField
      FieldName = 'username'
      Size = 50
    end
    object tplchangedate: TDateField
      FieldName = 'changedate'
    end
    object tplstos: TSmallintField
      FieldName = 'stos'
      Required = True
    end
    object tpldel_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object tplprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object tplstatrashod: TIntegerField
      FieldName = 'statrashod'
    end
    object tpldiler_id: TIntegerField
      FieldName = 'diler_id'
    end
    object tplh_id: TIntegerField
      FieldName = 'h_id'
    end
    object tpls_vid: TStringField
      FieldKind = fkLookup
      FieldName = 's_vid'
      LookupDataSet = s_pl
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'vid'
      Size = 255
      Lookup = True
    end
    object tpls_user: TStringField
      FieldKind = fkLookup
      FieldName = 's_user'
      LookupDataSet = s_xodim
      LookupKeyFields = 'id'
      LookupResultField = 'fio'
      KeyFields = 'user_id'
      Size = 255
      Lookup = True
    end
  end
  object Dpl: TDataSource
    DataSet = tpl
    Left = 105
    Top = 293
  end
  object Dx_otchet: TDataSource
    DataSet = x_otchet
    Left = 560
    Top = 287
  end
  object x_otchet: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select a.sana,x.fio as xodimnom,count(a.id) as qator,sum(a.summa' +
        ') as jami,sum(a.sum_naqd) as jami_naqd,sum(a.sum_plastik) as jam' +
        'i_plastir,sum(a.cheg_n) as jami_cheg_n,sum(a.cheg_p) as jami_che' +
        'g_p'
      
        'from asos a,s_xodim x WHERE x.id=a.xodim_id and a.del_flag=1 and' +
        ' a.client_id = 12'
      'group by x.fio order by x.fio ')
    Params = <>
    Left = 559
    Top = 241
    object x_otchetsana: TDateField
      FieldName = 'sana'
      Required = True
    end
    object x_otchetxodimnom: TStringField
      FieldName = 'xodimnom'
      Size = 250
    end
    object x_otchetqator: TLargeintField
      FieldName = 'qator'
      ReadOnly = True
    end
    object x_otchetjami: TFloatField
      FieldName = 'jami'
      ReadOnly = True
    end
    object x_otchetjami_naqd: TFloatField
      FieldName = 'jami_naqd'
      ReadOnly = True
    end
    object x_otchetjami_plastir: TFloatField
      FieldName = 'jami_plastir'
      ReadOnly = True
    end
    object x_otchetjami_cheg_n: TFloatField
      FieldName = 'jami_cheg_n'
      ReadOnly = True
    end
    object x_otchetjami_cheg_p: TFloatField
      FieldName = 'jami_cheg_p'
      ReadOnly = True
    end
  end
  object x_asos: TZQuery
    Connection = lbd
    BeforeInsert = x_asosBeforeInsert
    BeforeEdit = x_asosBeforeEdit
    AfterPost = x_asosAfterPost
    AfterCancel = x_asosAfterCancel
    SQL.Strings = (
      'SELECT * FROM asos where del_flag=1 order by sana')
    Params = <>
    Left = 719
    Top = 238
  end
  object Dx_asos: TDataSource
    DataSet = x_asos
    Left = 719
    Top = 286
  end
  object lbd_pl: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select * from pl where client_id=:client_id and vid=4 and del_fl' +
        'ag=1 order by d_pl,n_pl')
    Params = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
    Left = 156
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
  end
  object Dlbd_pl: TDataSource
    DataSet = lbd_pl
    Left = 156
    Top = 293
  end
  object oraliq: TZQuery
    Connection = lbd
    SQL.Strings = (
      'select * from oraliq where asos_id=:id ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
    MasterFields = 'id'
    MasterSource = Dasos
    Left = 220
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Doraliq: TDataSource
    DataSet = oraliq
    Left = 220
    Top = 293
  end
  object Ds_x_tur: TDataSource
    DataSet = s_x_tur
    Left = 616
    Top = 287
  end
  object s_x_tur: TZQuery
    Connection = lbd
    OnNewRecord = s_x_turNewRecord
    SQL.Strings = (
      'select * from s_x_tur')
    Params = <>
    Left = 615
    Top = 241
  end
  object s_pl: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_pl')
    Params = <>
    Left = 312
    Top = 240
  end
  object Ds_pl: TDataSource
    DataSet = s_pl
    Left = 312
    Top = 287
  end
  object oraliqpl: TZQuery
    Connection = lbd
    SQL.Strings = (
      'select * from oraliq where asos_id=:id ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
    MasterFields = 'id'
    MasterSource = Dpl
    Left = 268
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object Doraliqpl: TDataSource
    DataSet = oraliqpl
    Left = 268
    Top = 293
  end
  object s_kurs: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_kurs order by id')
    Params = <>
    Left = 360
    Top = 240
  end
  object Ds_kurs: TDataSource
    DataSet = s_kurs
    Left = 360
    Top = 287
  end
  object user: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM user where status=10')
    Params = <>
    Left = 370
    Top = 119
  end
  object Duser: TDataSource
    DataSet = user
    Left = 370
    Top = 167
  end
  object s_mobil: TZQuery
    Connection = lbd
    SQL.Strings = (
      'select * from s_mobil order by nn')
    Params = <>
    Left = 937
    Top = 237
  end
  object Ds_mobil: TDataSource
    DataSet = s_mobil
    Left = 937
    Top = 285
  end
  object salat: TZQuery
    Connection = lbd
    SQL.Strings = (
      
        'select t.nom,a.zakaz,a.zakaz_ok,a.kol,a.kol_in from s_tovar t,as' +
        'os_slave a,asos WHERE a.del_flag=1 and asos.tur_oper=2 and a.aso' +
        's_id=asos.id and a.tovar_id=t.id and a.zakaz is not null and a.i' +
        'd=195')
    Params = <>
    Left = 764
    Top = 240
  end
  object Dsalat: TDataSource
    DataSet = salat
    Left = 766
    Top = 289
  end
  object k_slave1: TZQuery
    Connection = lbd
    BeforeEdit = asos_slaveBeforeEdit
    BeforePost = k_slave1BeforePost
    SQL.Strings = (
      'SELECT * FROM asos_slave where del_flag=1 and asos_id=:id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    DataSource = Dk_asos
    Left = 1007
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object k_slave1id: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object k_slave1tovar_id: TIntegerField
      FieldName = 'tovar_id'
      Required = True
    end
    object k_slave1tovar_nom: TStringField
      FieldName = 'tovar_nom'
      Size = 250
    end
    object k_slave1izm_id: TSmallintField
      FieldName = 'izm_id'
    end
    object k_slave1izm1: TSmallintField
      FieldName = 'izm1'
    end
    object k_slave1tulov_id: TIntegerField
      FieldName = 'tulov_id'
    end
    object k_slave1seriya: TStringField
      FieldName = 'seriya'
      Size = 50
    end
    object k_slave1polka: TStringField
      FieldName = 'polka'
      Size = 50
    end
    object k_slave1srok: TDateField
      FieldName = 'srok'
    end
    object k_slave1turi: TSmallintField
      FieldName = 'turi'
      Required = True
    end
    object k_slave1resept: TSmallintField
      FieldName = 'resept'
      Required = True
    end
    object k_slave1qrkod: TIntegerField
      FieldName = 'qrkod'
    end
    object k_slave1kol: TIntegerField
      FieldName = 'kol'
    end
    object k_slave1kol_in: TIntegerField
      FieldName = 'kol_in'
    end
    object k_slave1sena_in: TFloatField
      FieldName = 'sena_in'
    end
    object k_slave1summa: TFloatField
      FieldName = 'summa'
    end
    object k_slave1summa_in: TFloatField
      FieldName = 'summa_in'
    end
    object k_slave1summa_all: TFloatField
      FieldName = 'summa_all'
    end
    object k_slave1sotish: TFloatField
      FieldName = 'sotish'
      Required = True
    end
    object k_slave1sotish_in: TFloatField
      FieldName = 'sotish_in'
    end
    object k_slave1foiz: TFloatField
      FieldName = 'foiz'
    end
    object k_slave1foiz_in: TFloatField
      FieldName = 'foiz_in'
    end
    object k_slave1subkod: TSmallintField
      FieldName = 'subkod'
      Required = True
    end
    object k_slave1user_id: TIntegerField
      FieldName = 'user_id'
    end
    object k_slave1changedate: TDateTimeField
      FieldName = 'changedate'
    end
    object k_slave1asos_id: TIntegerField
      FieldName = 'asos_id'
      Required = True
    end
    object k_slave1del_flag: TSmallintField
      FieldName = 'del_flag'
      Required = True
    end
    object k_slave1kol_ost: TIntegerField
      FieldName = 'kol_ost'
      Required = True
    end
    object k_slave1kol_in_ost: TIntegerField
      FieldName = 'kol_in_ost'
      Required = True
    end
    object k_slave1sena_d: TFloatField
      FieldName = 'sena_d'
    end
    object k_slave1sena_in_d: TFloatField
      FieldName = 'sena_in_d'
    end
    object k_slave1sotish_d: TFloatField
      FieldName = 'sotish_d'
    end
    object k_slave1sotish_in_d: TFloatField
      FieldName = 'sotish_in_d'
    end
    object k_slave1zakaz: TDateTimeField
      FieldName = 'zakaz'
    end
    object k_slave1zakaz_ok: TDateTimeField
      FieldName = 'zakaz_ok'
    end
    object k_slave1zakaz_end: TDateTimeField
      FieldName = 'zakaz_end'
    end
    object k_slave1zakaz_print: TSmallintField
      FieldName = 'zakaz_print'
    end
    object k_slave1s_tovar: TStringField
      FieldKind = fkLookup
      FieldName = 's_tovar'
      LookupDataSet = s_t_all
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'tovar_id'
      Size = 150
      Lookup = True
    end
    object k_slave1s_izm1: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm1'
      LookupDataSet = s_izm1
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm1'
      Size = 250
      Lookup = True
    end
    object k_slave1s_izm: TStringField
      FieldKind = fkLookup
      FieldName = 's_izm'
      LookupDataSet = s_izm
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'izm_id'
      Size = 150
      Lookup = True
    end
    object k_slave1sena: TFloatField
      FieldName = 'sena'
    end
    object k_slave1s_sena: TStringField
      FieldKind = fkCalculated
      FieldName = 's_sena'
      OnGetText = k_slave1s_senaGetText
      Size = 150
      Calculated = True
    end
    object k_slave1opt1: TFloatField
      FieldName = 'opt1'
    end
    object k_slave1opt1_in: TFloatField
      FieldName = 'opt1_in'
    end
    object k_slave1opt2: TFloatField
      FieldName = 'opt2'
    end
    object k_slave1opt2_in: TFloatField
      FieldName = 'opt2_in'
    end
    object k_slave1schet: TFloatField
      FieldName = 'schet'
    end
    object k_slave1schet_in: TFloatField
      FieldName = 'schet_in'
    end
    object k_slave1zakaz_gapir: TIntegerField
      FieldName = 'zakaz_gapir'
    end
    object k_slave1foiz_ch2: TFloatField
      FieldName = 'foiz_ch2'
    end
    object k_slave1foiz_schet: TFloatField
      FieldName = 'foiz_schet'
    end
    object k_slave1foiz_opt1: TFloatField
      FieldName = 'foiz_opt1'
    end
    object k_slave1foiz_opt2: TFloatField
      FieldName = 'foiz_opt2'
    end
    object k_slave1opt1_pl: TFloatField
      FieldName = 'opt1_pl'
    end
    object k_slave1opt1_pl_in: TFloatField
      FieldName = 'opt1_pl_in'
    end
    object k_slave1opt2_pl: TFloatField
      FieldName = 'opt2_pl'
    end
    object k_slave1opt2_pl_in: TFloatField
      FieldName = 'opt2_pl_in'
    end
    object k_slave1s_sotish: TStringField
      FieldKind = fkCalculated
      FieldName = 's_sotish'
      OnGetText = k_slave1s_sotishGetText
      Size = 150
      Calculated = True
    end
  end
  object Dk_slave1: TDataSource
    DataSet = k_slave1
    Left = 1007
    Top = 62
  end
  object s_papka: TZQuery
    Connection = lbd
    SQL.Strings = (
      'SELECT * FROM s_papka')
    Params = <>
    Left = 135
    Top = 121
  end
  object Ds_papka: TDataSource
    DataSet = s_papka
    Left = 138
    Top = 169
  end
  object gapir: TZQuery
    Connection = lbd
    Params = <>
    Left = 1012
    Top = 120
  end
  object Dgapir: TDataSource
    DataSet = gapir
    Left = 1014
    Top = 181
  end
end
