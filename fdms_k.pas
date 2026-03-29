unit fdms;

interface

uses
  SysUtils, ZDataset, ZAbstractDataset, ZConnection, ZAbstractRODataset, DB,
  Classes;
type
  TDMS = class(TDataModule)
    lbd: TZConnection;
    setup: TZQuery;
    s_obl: TZQuery;
    Ds_obl: TDataSource;
    protinout: TZQuery;
    Dprotinout: TDataSource;
    Dsetup: TDataSource;
    setupfile_date: TDateField;
    setupfile_blob: TBlobField;
    setupfile_nom: TStringField;
    setupfile_size: TSmallintField;
    setupver: TSmallintField;
    setupver_timer: TSmallintField;
    setupid: TIntegerField;
    setupk1: TSmallintField;
    setupk2: TSmallintField;
    setupk3: TSmallintField;
    setupk4: TSmallintField;
    setupk5: TSmallintField;
    setupk6: TSmallintField;
    setupk7: TSmallintField;
    setupk8: TSmallintField;
    setupusername: TStringField;
    setupchangedate: TDateField;
    setupvaqt: TDateTimeField;
    setupariza: TBlobField;
    setupsmsall: TIntegerField;
    setupsmsyear: TIntegerField;
    setupsmsmonth: TIntegerField;
    setupsmstoday: TIntegerField;
    setupsmsvaqt: TDateField;
    setupverr: TSmallintField;
    s_tuman: TZQuery;
    Ds_tuman: TDataSource;
    s_client: TZQuery;
    Ds_client: TDataSource;
    s_kassa: TZQuery;
    Ds_kassa: TDataSource;
    s_xodim: TZQuery;
    Ds_xodim: TDataSource;
    link: TZQuery;
    s_kassaid: TIntegerField;
    s_kassanom: TStringField;
    s_kassastatus: TSmallintField;
    s_kassauser_id: TIntegerField;
    s_kassachangedate: TDateTimeField;
    s_kassas_status: TStringField;
    s_xodimid: TIntegerField;
    s_xodimlogin: TStringField;
    s_xodimstatus: TIntegerField;
    s_xodims_status: TStringField;
    s_clientid: TIntegerField;
    s_clientnom: TStringField;
    s_clientuserpass: TStringField;
    s_clientkomu: TSmallintField;
    s_clientadress: TStringField;
    s_clientmanzil: TStringField;
    s_clientindeks: TStringField;
    s_clientobl: TIntegerField;
    s_clienttuman: TIntegerField;
    s_clientboss: TStringField;
    s_clienttel: TStringField;
    s_clientrs: TStringField;
    s_clientinn: TStringField;
    s_clientokonh: TStringField;
    s_clientbank: TStringField;
    s_clientkod_bank: TStringField;
    s_clientflag: TSmallintField;
    s_clientgorod: TStringField;
    s_clientactive: TSmallintField;
    s_clienttugashsana: TDateField;
    s_clientchangedate: TDateTimeField;
    s_clientuyu_type: TIntegerField;
    s_clientsana: TDateField;
    s_clientsrok: TDateField;
    s_clientprim: TStringField;
    s_clientsayt: TStringField;
    s_clientemail: TStringField;
    s_clientmasul1: TStringField;
    s_clienttelsms1: TStringField;
    s_clientmasul2: TStringField;
    s_clienttelsms2: TStringField;
    s_clientnik: TSmallintField;
    s_clientdel_flag: TSmallintField;
    s_clientiamhere: TIntegerField;
    s_clientdiamhere: TDateTimeField;
    s_clientvaqtout: TDateTimeField;
    s_clientkim: TStringField;
    s_clienttarmoq: TStringField;
    s_opf: TZQuery;
    Ds_opf: TDataSource;
    s_user: TZQuery;
    Ds_user: TDataSource;
    s_tovar: TZQuery;
    Ds_tovar: TDataSource;
    s_zavod: TZQuery;
    Ds_zavod: TDataSource;
    s_tovarid: TIntegerField;
    s_tovarnom: TStringField;
    s_tovarnom_ru: TStringField;
    s_tovarnom_sh: TStringField;
    s_tovarizm1: TSmallintField;
    s_tovarturi: TSmallintField;
    s_tovarresept: TSmallintField;
    s_tovaraniq: TFloatField;
    s_tovarminimal: TFloatField;
    s_tovarmaksimal: TFloatField;
    s_tovarsotish: TFloatField;
    s_tovarzavod_id: TIntegerField;
    s_tovarshtrix: TStringField;
    s_tovardel_flag: TSmallintField;
    s_tovarzavod: TStringField;
    s_tovarupakavka: TIntegerField;
    s_izm: TZQuery;
    Ds_izm: TDataSource;
    s_izm1: TZQuery;
    Ds_izm1: TDataSource;
    s_clientmr: TStringField;
    s_tovar_link: TZQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField5: TStringField;
    Ds_tovar_link: TDataSource;
    s_tovarshtrixkod: TSmallintField;
    s_tovarqrkod: TSmallintField;
    s_tovars_shtrix: TStringField;
    s_tovars_qr: TStringField;
    setuplk: TIntegerField;
    setuplis: TIntegerField;
    setupnews: TStringField;
    setupval_news: TIntegerField;
    s_tovarchangedate: TDateTimeField;
    protizm: TZQuery;
    Dprotizm: TDataSource;
    s_tovaruser_id: TSmallintField;
    s_tovars_user: TStringField;
    s_clientuser_id: TIntegerField;
    s_clients_user: TStringField;
    s_xodimuserpass: TStringField;
    s_xodimvaqtin: TDateTimeField;
    s_xodimvaqtout: TDateTimeField;
    s_xodimflag: TSmallintField;
    s_xodimclient_id: TIntegerField;
    s_xodimdel_flag: TSmallintField;
    s_xodimactive: TSmallintField;
    s_clientvaqt_in: TDateTimeField;
    s_xodimkim: TStringField;
    s_xodimtarmoq: TStringField;
    s_xodimfio: TStringField;
    s_kassaclient_id: TIntegerField;
    s_kassas_user: TStringField;
    s_kassas_client: TStringField;
    s_kassadel_flag: TSmallintField;
    asos: TZQuery;
    Dasos: TDataSource;
    asosid: TIntegerField;
    asosclient_id: TIntegerField;
    asoskassa_id: TIntegerField;
    asosxodim_id: TIntegerField;
    asossana: TDateField;
    asosdel_flag: TSmallintField;
    asoss_kassa: TStringField;
    asoschangedate: TDateTimeField;
    asosuser_id: TIntegerField;
    asos_slave: TZQuery;
    Dasos_slave: TDataSource;
    asos_slaveid: TIntegerField;
    asos_slavetovar_id: TIntegerField;
    asos_slavetovar_nom: TStringField;
    asos_slavetulov_id: TIntegerField;
    asos_slavesrok: TDateField;
    asos_slavesubkod: TSmallintField;
    asos_slaveuser_id: TIntegerField;
    asos_slavechangedate: TDateTimeField;
    asos_slaveasos_id: TIntegerField;
    asos_slavedel_flag: TSmallintField;
    asos_slaves_user: TStringField;
    asos_slavesena: TFloatField;
    asos_slavesumma: TFloatField;
    asossumma: TFloatField;
    asoskol: TIntegerField;
    asostur_oper: TSmallintField;
    asos_slaveizm_id: TSmallintField;
    s_clientdisp_n: TIntegerField;
    s_clientdisp_d: TDateField;
    s_clientssana: TDateField;
    s_clientsnomer: TStringField;
    s_diler: TZQuery;
    Ds_diler: TDataSource;
    asos_qoldiq: TZQuery;
    Dasos_qoldiq: TDataSource;
    qoldiq: TZQuery;
    StringField32: TStringField;
    DateField7: TDateField;
    SmallintField9: TSmallintField;
    StringField33: TStringField;
    IntegerField21: TIntegerField;
    SmallintField10: TSmallintField;
    Dqoldiq: TDataSource;
    qoldiqsotish: TFloatField;
    s_dilerid: TIntegerField;
    s_dilerkod: TIntegerField;
    s_dilernom: TStringField;
    s_dileruserpass: TStringField;
    s_dilerkomu: TSmallintField;
    s_dileradress: TStringField;
    s_dilermanzil: TStringField;
    s_dilerindeks: TStringField;
    s_dilerobl: TIntegerField;
    s_dilerboss: TStringField;
    s_dilertel: TStringField;
    s_dilerrs: TStringField;
    s_dilermr: TStringField;
    s_dilerinn: TStringField;
    s_dilerokonh: TStringField;
    s_dilerbank: TStringField;
    s_dilerkod_bank: TStringField;
    s_dilerflag: TSmallintField;
    s_dilergorod: TStringField;
    s_dileractive: TSmallintField;
    s_dilertugashsana: TDateField;
    s_dileruser_id: TIntegerField;
    s_dilerchangedate: TDateTimeField;
    s_dileruyu_type: TIntegerField;
    s_dilerarendachi_kodi: TIntegerField;
    s_dileravto: TIntegerField;
    s_dilersana: TDateField;
    s_dilersrok: TDateField;
    s_dilersayt: TStringField;
    s_dileremail: TStringField;
    s_dilermasul1: TStringField;
    s_dilertelsms1: TStringField;
    s_dilermasul2: TStringField;
    s_dilertelsms2: TStringField;
    s_dilertelinternet: TSmallintField;
    s_dilernik: TSmallintField;
    s_dilersumma: TFloatField;
    s_dilerssana: TDateField;
    s_dilersnomer: TStringField;
    s_dilerdel_flag: TSmallintField;
    s_dileriamhere: TIntegerField;
    s_dilerdiamhere: TDateTimeField;
    s_dilerprikname: TStringField;
    s_dilerprikdate: TDateTimeField;
    s_dilervaqt_in: TDateTimeField;
    s_dilervaqtout: TDateTimeField;
    s_dilerkim: TStringField;
    s_dilertarmoq: TStringField;
    asosdiler_id: TIntegerField;
    asos_slavesotish: TFloatField;
    qoldiqkol_in: TSmallintField;
    s_tovarkol_in: TSmallintField;
    qoldiqturi: TSmallintField;
    qoldiqresept: TSmallintField;
    s_tovarizm_id: TSmallintField;
    s_tovars_izm: TStringField;
    qoldiqs_izm: TStringField;
    asos_qoldiqid: TIntegerField;
    asos_qoldiqclient_id: TIntegerField;
    asos_qoldiqkassa_id: TIntegerField;
    asos_qoldiqxodim_id: TIntegerField;
    asos_qoldiqseriya: TStringField;
    asos_qoldiqnomer: TStringField;
    asos_qoldiqsana: TDateField;
    asos_qoldiqsumma: TFloatField;
    asos_qoldiqkol: TIntegerField;
    asos_qoldiqchangedate: TDateTimeField;
    asos_qoldiquser_id: TIntegerField;
    asos_qoldiqdel_flag: TSmallintField;
    asos_qoldiqtur_oper: TSmallintField;
    asos_qoldiqdiler_id: TIntegerField;
    asos_qoldiqs_diler: TStringField;
    qoldiqjami: TStringField;
    asos_qoldiqjami: TStringField;
    qoldiqs_diler: TStringField;
    s_ombor: TZQuery;
    Ds_ombor: TDataSource;
    asos_all: TZQuery;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    DateField1: TDateField;
    SmallintField1: TSmallintField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    IntegerField7: TIntegerField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    IntegerField8: TIntegerField;
    SmallintField2: TSmallintField;
    IntegerField9: TIntegerField;
    Dasos_all: TDataSource;
    asos_alls_diler: TStringField;
    asos_allseriya: TStringField;
    asos_allnomer: TStringField;
    asos_alljami: TStringField;
    asos_alls_tur_oper: TStringField;
    s_dilers_user: TStringField;
    qoldiqqrkod: TSmallintField;
    asos_slaveturi: TSmallintField;
    asos_slaveresept: TSmallintField;
    asos_slaveqrkod: TSmallintField;
    qoldiqs_qrkod: TStringField;
    asos_all_tanla: TZQuery;
    Dasos_all_tanla: TDataSource;
    asos_all_tanlaid: TIntegerField;
    asos_all_tanlaclient_id: TIntegerField;
    asos_all_tanlakassa_id: TIntegerField;
    asos_all_tanlaxodim_id: TIntegerField;
    asos_all_tanlaseriya: TStringField;
    asos_all_tanlanomer: TStringField;
    asos_all_tanlasana: TDateField;
    asos_all_tanlasumma: TFloatField;
    asos_all_tanlakol: TIntegerField;
    asos_all_tanlachangedate: TDateTimeField;
    asos_all_tanlauser_id: TIntegerField;
    asos_all_tanladel_flag: TSmallintField;
    asos_all_tanlatur_oper: TSmallintField;
    asos_all_tanladiler_id: TIntegerField;
    asos_all_tanlas_tur_oper: TStringField;
    asos_all_tanlajami: TStringField;
    asos_all_tanlas_diler: TStringField;
    qoldiquser_id: TIntegerField;
    qoldiqchangedate: TDateTimeField;
    s_tovarclient_id: TIntegerField;
    s_tovars_client: TStringField;
    s_tovarqr: TStringField;
    qoldiqseriya: TStringField;
    qoldiqsena_in: TFloatField;
    qoldiqsotish_in: TFloatField;
    s_tovars_izm1: TStringField;
    qoldiqizm1: TSmallintField;
    qoldiqs_nomer: TStringField;
    qoldiqs_izm1: TStringField;
    qoldiqsumma_in: TFloatField;
    qoldiqsumma_all: TFloatField;
    s_qoldiq: TZQuery;
    Ds_qoldiq: TDataSource;
    qoldiqkol_ost: TIntegerField;
    qoldiqkol_in_ost: TIntegerField;
    asos_slaveizm1: TSmallintField;
    asos_slaveseriya: TStringField;
    asos_slavesena_in: TFloatField;
    asos_slavesumma_in: TFloatField;
    asos_slavesumma_all: TFloatField;
    asos_slavesotish_in: TFloatField;
    asos_slavekol_ost: TIntegerField;
    asos_slavekol_in_ost: TIntegerField;
    asos_slaves_izm_id: TStringField;
    asos_slaves_izm1: TStringField;
    s_clientx_id: TIntegerField;
    qoldiqsumma: TFloatField;
    qoldiqizm_id: TSmallintField;
    qoldiqtulov_id: TIntegerField;
    qoldiqsena: TFloatField;
    qoldiqtovar_id: TIntegerField;
    s_tur_oper: TZQuery;
    Ds_tur_oper: TDataSource;
    qoldiqs_sana: TStringField;
    qoldiqid: TIntegerField;
    s_clientgaraj: TIntegerField;
    s_t_all: TZQuery;
    Ds_t_all: TDataSource;
    s_t_allid: TIntegerField;
    s_t_allnom: TStringField;
    s_t_allnom_ru: TStringField;
    s_t_allnom_sh: TStringField;
    s_t_allshtrix: TStringField;
    s_t_allqr: TStringField;
    s_t_allshtrixkod: TSmallintField;
    s_t_allqrkod: TSmallintField;
    s_t_allizm_id: TSmallintField;
    s_t_allkol_in: TSmallintField;
    s_t_allizm1: TSmallintField;
    s_t_allturi: TSmallintField;
    s_t_allresept: TSmallintField;
    s_t_allaniq: TFloatField;
    s_t_allminimal: TFloatField;
    s_t_allmaksimal: TFloatField;
    s_t_allsotish: TFloatField;
    s_t_allzavod_id: TIntegerField;
    s_t_alldel_flag: TSmallintField;
    s_t_allupakavka: TIntegerField;
    s_t_alluser_id: TSmallintField;
    s_t_allclient_id: TIntegerField;
    s_t_allchangedate: TDateTimeField;
    asos_slaves_tovar: TStringField;
    s_clientclnom: TStringField;
    qoldiqs_tovar: TStringField;
    client_edit: TZQuery;
    Dclient_edit: TDataSource;
    client_editid: TIntegerField;
    client_editiduz: TIntegerField;
    client_editkod: TIntegerField;
    client_editnom: TStringField;
    client_edituserpass: TStringField;
    client_editkomu: TSmallintField;
    client_editvazir: TIntegerField;
    client_editadress: TStringField;
    client_editmanzil: TStringField;
    client_editindeks: TStringField;
    client_editobl: TIntegerField;
    client_edittuman: TIntegerField;
    client_editboss: TStringField;
    client_edittel: TStringField;
    client_editrs: TStringField;
    client_editmr: TStringField;
    client_editinn: TStringField;
    client_editokonh: TStringField;
    client_editbank: TStringField;
    client_editkod_bank: TStringField;
    client_edits1: TStringField;
    client_editflag: TSmallintField;
    client_editflag1: TStringField;
    client_editflag2: TStringField;
    client_editgorod: TStringField;
    client_editactive: TSmallintField;
    client_edittugashsana: TDateField;
    client_edituser_id: TIntegerField;
    client_editchangedate: TDateTimeField;
    client_edituyu_type: TIntegerField;
    client_editgaraj: TIntegerField;
    client_editgaraj_turi: TSmallintField;
    client_editarendachi_kodi: TIntegerField;
    client_editarendachi_nomi: TStringField;
    client_editjivoy: TSmallintField;
    client_edittja: TSmallintField;
    client_editavto: TIntegerField;
    client_editsana: TDateField;
    client_editsrok: TDateField;
    client_editprim: TStringField;
    client_edittez: TIntegerField;
    client_editstos: TSmallintField;
    client_edittods_sana: TDateField;
    client_edittods: TSmallintField;
    client_editsayt: TStringField;
    client_editemail: TStringField;
    client_editmasul1: TStringField;
    client_edittelsms1: TStringField;
    client_editmasul2: TStringField;
    client_edittelsms2: TStringField;
    client_editkomputer: TSmallintField;
    client_editprinter: TSmallintField;
    client_editskaner: TSmallintField;
    client_editesp: TSmallintField;
    client_edittelinternet: TSmallintField;
    client_editprimoferta: TStringField;
    client_editsanaforma1: TDateField;
    client_editsanaoplata: TDateField;
    client_editoferta: TDateField;
    client_editnik: TSmallintField;
    client_editsumma: TFloatField;
    client_editedit_it: TSmallintField;
    client_editssana: TDateField;
    client_editsnomer: TStringField;
    client_editost_n_sbor: TFloatField;
    client_editost_n_posh: TFloatField;
    client_editdel_flag: TSmallintField;
    client_editkolin: TSmallintField;
    client_editiamhere: TIntegerField;
    client_editdiamhere: TDateTimeField;
    client_editprikname: TStringField;
    client_editprikdate: TDateTimeField;
    client_editfilenom: TStringField;
    client_editat91: TSmallintField;
    client_edittender_n: TIntegerField;
    client_edittender_d: TDateField;
    client_editxizmat_n: TIntegerField;
    client_editxizmat_d: TDateField;
    client_editdisp_n: TIntegerField;
    client_editdisp_d: TDateField;
    client_editvaqt_in: TDateTimeField;
    client_editvaqtout: TDateTimeField;
    client_editkim: TStringField;
    client_edittarmoq: TStringField;
    asosseriya: TStringField;
    asosnomer: TStringField;
    asossum_naqd: TFloatField;
    asossum_plastik: TFloatField;
    qoldiqfoyda: TFloatField;
    s_clientgaraj_turi: TSmallintField;
    k_asos: TZQuery;
    Dk_asos: TDataSource;
    k_slave: TZQuery;
    Dk_slave: TDataSource;
    s_tovarshakl: TStringField;
    s_tovarinternom: TStringField;
    lbdserver: TZConnection;
    qoldiqfoiz: TFloatField;
    qoldiqfoiz_in: TFloatField;
    asos_slavefoiz: TFloatField;
    asos_slavefoiz_in: TFloatField;
    qoldiqzavod: TStringField;
    comments: TZQuery;
    s_komu: TZQuery;
    Ds_komu: TDataSource;
    asoss_dlier: TStringField;
    s_tovarmiqdor: TSmallintField;
    s_tovarshart: TSmallintField;
    shartnoma: TZQuery;
    Dshartnoma: TDataSource;
    shartnomaid: TIntegerField;
    shartnomanomer: TStringField;
    shartnomasana: TDateField;
    shartnomauser_id: TIntegerField;
    shartnomachangedate: TDateTimeField;
    shartnomas_diler: TStringField;
    shartnomadel_flag: TSmallintField;
    shartnomasumma: TFloatField;
    shartnomaqoldiq: TFloatField;
    asos_qoldiqsum_naqd: TFloatField;
    asos_qoldiqsum_plastik: TFloatField;
    asos_qoldiqshartnoma_id: TIntegerField;
    shartnomasrok: TDateField;
    shartnomadiler_id: TIntegerField;
    k_asosid: TIntegerField;
    k_asosclient_id: TIntegerField;
    k_asoskassa_id: TIntegerField;
    k_asosxodim_id: TIntegerField;
    k_asosseriya: TStringField;
    k_asosnomer: TStringField;
    k_asossana: TDateField;
    k_asossumma: TFloatField;
    k_asossum_naqd: TFloatField;
    k_asossum_plastik: TFloatField;
    k_asoskol: TIntegerField;
    k_asoschangedate: TDateTimeField;
    k_asosuser_id: TIntegerField;
    k_asosdel_flag: TSmallintField;
    k_asostur_oper: TSmallintField;
    k_asosdiler_id: TIntegerField;
    k_asosshartnoma_id: TIntegerField;
    k_asoss_shartnoma: TStringField;
    k_asoss_dlier: TStringField;
    k_slaveid: TIntegerField;
    k_slavetovar_id: TIntegerField;
    k_slavetovar_nom: TStringField;
    k_slaveizm_id: TSmallintField;
    k_slaveizm1: TSmallintField;
    k_slavetulov_id: TIntegerField;
    k_slaveseriya: TStringField;
    k_slavesrok: TDateField;
    k_slaveturi: TSmallintField;
    k_slaveresept: TSmallintField;
    k_slaveqrkod: TSmallintField;
    k_slavesena: TFloatField;
    k_slavesena_in: TFloatField;
    k_slavesumma: TFloatField;
    k_slavesumma_in: TFloatField;
    k_slavesumma_all: TFloatField;
    k_slavesotish: TFloatField;
    k_slavesotish_in: TFloatField;
    k_slavefoiz: TFloatField;
    k_slavefoiz_in: TFloatField;
    k_slavesubkod: TSmallintField;
    k_slaveuser_id: TIntegerField;
    k_slavechangedate: TDateTimeField;
    k_slaveasos_id: TIntegerField;
    k_slavedel_flag: TSmallintField;
    k_slavekol_ost: TIntegerField;
    k_slavekol_in_ost: TIntegerField;
    k_slaves_tovar: TStringField;
    k_slaves_izm1: TStringField;
    k_slaves_izm: TStringField;
    s_t_allzavod: TStringField;
    k_asosqabul_sana: TDateTimeField;
    k_asosprint_flag: TSmallintField;
    k_asosombor_id: TIntegerField;
    k_asosfilial_id: TIntegerField;
    s_clientglav_id: TIntegerField;
    s_clientclient_tur: TIntegerField;
    s_filial: TZQuery;
    Ds_filial: TDataSource;
    k_asoss_filial: TStringField;
    qoldiq_sklad: TZQuery;
    StringField6: TStringField;
    DateField2: TDateField;
    SmallintField3: TSmallintField;
    StringField7: TStringField;
    IntegerField10: TIntegerField;
    SmallintField4: TSmallintField;
    FloatField2: TFloatField;
    SmallintField5: TSmallintField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    SmallintField8: TSmallintField;
    StringField11: TStringField;
    IntegerField11: TIntegerField;
    DateTimeField2: TDateTimeField;
    StringField12: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    SmallintField11: TSmallintField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    SmallintField12: TSmallintField;
    SmallintField13: TSmallintField;
    IntegerField14: TIntegerField;
    FloatField11: TFloatField;
    IntegerField15: TIntegerField;
    StringField15: TStringField;
    IntegerField16: TIntegerField;
    StringField16: TStringField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField17: TStringField;
    Dqoldiq_sklad: TDataSource;
    qoldiqpolka: TStringField;
    k_slavepolka: TStringField;
    k_asosholat: TStringField;
    asosqabul_sana: TDateTimeField;
    asosprint_flag: TSmallintField;
    asosombor_id: TIntegerField;
    asosfilial_id: TIntegerField;
    asosshartnoma_id: TIntegerField;
    s_clientiduz: TIntegerField;
    s_clientkod: TIntegerField;
    s_clientvazir: TIntegerField;
    s_clients1: TStringField;
    s_clientflag1: TStringField;
    s_clientflag2: TStringField;
    s_clientsumma: TFloatField;
    s_clientedit_it: TSmallintField;
    s_clientkolin: TSmallintField;
    s_clientprikname: TStringField;
    s_clientprikdate: TDateTimeField;
    s_clientfilenom: TStringField;
    s_clientat91: TSmallintField;
    k_asosqarz_summa: TFloatField;
    k_asosqarz_kim: TStringField;
    k_asosqarz_izoh: TStringField;
    k_asosqarz_flag: TSmallintField;
    asosqarz_summa: TFloatField;
    asosqarz_kim: TStringField;
    asosqarz_izoh: TStringField;
    asosqarz_flag: TSmallintField;
    s_clientyaxlitlash: TSmallintField;
    s_clientyaxlitlash_in: TSmallintField;
    s_clientfoiz: TFloatField;
    s_clientfoiz_in: TFloatField;
    s_clientkomputer: TSmallintField;
    s_haridor: TZQuery;
    Ds_haridor: TDataSource;
    asosh_id: TIntegerField;
    s_haridorid: TIntegerField;
    s_haridorclient_id: TIntegerField;
    s_haridornom: TStringField;
    s_haridorkomu: TSmallintField;
    s_haridoradress: TStringField;
    s_haridormanzil: TStringField;
    s_haridorindeks: TStringField;
    s_haridorobl: TIntegerField;
    s_haridortuman: TIntegerField;
    s_haridorboss: TStringField;
    s_haridortel: TStringField;
    s_haridorrs: TStringField;
    s_haridorinn: TStringField;
    s_haridorokonh: TStringField;
    s_haridorbank: TStringField;
    s_haridorkod_bank: TStringField;
    s_haridorgorod: TStringField;
    s_haridoractive: TSmallintField;
    s_haridortugashsana: TDateField;
    s_haridoruser_id: TIntegerField;
    s_haridorchangedate: TDateTimeField;
    s_haridoruyu_type: TIntegerField;
    s_haridorsana: TDateField;
    s_haridorsrok: TDateField;
    s_haridorprim: TStringField;
    s_haridoremail: TStringField;
    s_haridormasul1: TStringField;
    s_haridortelsms1: TStringField;
    s_haridormasul2: TStringField;
    s_haridortelsms2: TStringField;
    s_haridordel_flag: TSmallintField;
    s_haridoriamhere: TIntegerField;
    s_haridordiamhere: TDateTimeField;
    s_haridorprikname: TStringField;
    s_haridorprikdate: TDateTimeField;
    s_haridorfilenom: TStringField;
    s_haridorvaqt_in: TDateTimeField;
    s_haridorvaqtout: TDateTimeField;
    s_haridorkim: TStringField;
    s_haridortarmoq: TStringField;
    k_asosh_id: TIntegerField;
    k_asoss_h: TStringField;
    Dlink: TDataSource;
    s_kat: TZQuery;
    Ds_kat: TDataSource;
    s_brend: TZQuery;
    Ds_brend: TDataSource;
    s_tovarkat: TSmallintField;
    s_tovarbrend: TSmallintField;
    s_brendid: TIntegerField;
    s_brendnom: TStringField;
    s_brendkat_id: TSmallintField;
    s_brendkat: TStringField;
    asossum_epos: TFloatField;
    asoscheg_n: TFloatField;
    asoscheg_p: TFloatField;
    asoscheg_e: TFloatField;
    asossum_naqd_ch: TFloatField;
    asossum_plast_ch: TFloatField;
    asossum_epos_ch: TFloatField;
    asossumma_ch: TFloatField;
    main_link: TZQuery;
    Dmain_link: TDataSource;
    k_asossum_epos: TFloatField;
    k_asoscheg_n: TFloatField;
    k_asoscheg_p: TFloatField;
    k_asoscheg_e: TFloatField;
    k_asossum_naqd_ch: TFloatField;
    k_asossum_plast_ch: TFloatField;
    k_asossum_epos_ch: TFloatField;
    k_asossumma_ch: TFloatField;
    s_clientchegirma: TFloatField;
    s_clientseriya: TSmallintField;
    s_clientichkitovar: TSmallintField;
    s_tovarkg: TSmallintField;
    s_tovarshtrix_full: TStringField;
    s_tovarshtrix_in: TStringField;
    s_clientlasttz_id: TSmallintField;
    s_clientlastta_id: TSmallintField;
    tpl: TZQuery;
    Dpl: TDataSource;
    asospl_id: TIntegerField;
    k_asospl_id: TIntegerField;
    Dx_otchet: TDataSource;
    x_otchet: TZQuery;
    x_otchetsana: TDateField;
    x_otchetxodimnom: TStringField;
    x_otchetqator: TLargeintField;
    x_otchetjami: TFloatField;
    x_otchetjami_naqd: TFloatField;
    x_otchetjami_plastir: TFloatField;
    x_otchetjami_cheg_n: TFloatField;
    x_otchetjami_cheg_p: TFloatField;
    x_asos: TZQuery;
    Dx_asos: TDataSource;
    lbd_pl: TZQuery;
    Dlbd_pl: TDataSource;
    oraliq: TZQuery;
    Doraliq: TDataSource;
    Ds_x_tur: TDataSource;
    s_x_tur: TZQuery;
    s_pl: TZQuery;
    Ds_pl: TDataSource;
    oraliqpl: TZQuery;
    Doraliqpl: TDataSource;
    k_asoskurs: TFloatField;
    k_asosdollar: TSmallintField;
    s_kurs: TZQuery;
    Ds_kurs: TDataSource;
    k_slavesena_d: TFloatField;
    k_slavesena_in_d: TFloatField;
    k_slavesotish_d: TFloatField;
    k_slavesotish_in_d: TFloatField;
    k_asossum_d: TFloatField;
    s_tovarshtrix1: TStringField;
    s_tovarshtrix2: TStringField;
    asosharidor: TStringField;
    asoskurs: TFloatField;
    asosdollar: TSmallintField;
    asossum_d: TFloatField;
    asos_slavepolka: TStringField;
    asos_slavesena_d: TFloatField;
    asos_slavesena_in_d: TFloatField;
    asos_slavesotish_d: TFloatField;
    asos_slavesotish_in_d: TFloatField;
    asosplastik_id: TIntegerField;
    k_slavekol: TIntegerField;
    k_slavekol_in: TIntegerField;
    user: TZQuery;
    Duser: TDataSource;
    s_xodimusername: TStringField;
    s_xodimauth_key: TStringField;
    s_xodimpassword_hash: TStringField;
    s_xodimpassword_reset_token: TStringField;
    s_xodimemail: TStringField;
    s_xodimcreated_at: TIntegerField;
    s_xodimupdated_at: TIntegerField;
    s_xodimsite_address: TStringField;
    s_xodimx_tur_id: TIntegerField;
    s_xodimkod: TStringField;
    s_xodims_client: TStringField;
    shartnomaclient_id: TIntegerField;
    asoss_xodim: TStringField;
    k_asoss_xodim: TStringField;
    asosmobil: TIntegerField;
    k_asosmobil: TIntegerField;
    s_clientlast_pl_k: TIntegerField;
    s_clientlast_pl_b: TIntegerField;
    s_clientkk: TSmallintField;
    s_mobil: TZQuery;
    Ds_mobil: TDataSource;
    k_asoss_mobil: TStringField;
    asoss_mobil: TStringField;
    k_asosxizmat_foiz: TSmallintField;
    k_asosxizmat: TFloatField;
    asosxizmat_foiz: TSmallintField;
    asosxizmat: TFloatField;
    qoldiqkol: TIntegerField;
    asos_slavezakaz: TDateTimeField;
    asos_slavezakaz_ok: TDateTimeField;
    asos_slavezakaz_end: TDateTimeField;
    salat: TZQuery;
    Dsalat: TDataSource;
    asos_slavezakaz_print: TSmallintField;
    asos_slavekol: TIntegerField;
    asos_slavekol_in: TIntegerField;
    k_slave1: TZQuery;
    Dk_slave1: TDataSource;
    k_slave1id: TIntegerField;
    k_slave1tovar_id: TIntegerField;
    k_slave1tovar_nom: TStringField;
    k_slave1izm_id: TSmallintField;
    k_slave1izm1: TSmallintField;
    k_slave1tulov_id: TIntegerField;
    k_slave1seriya: TStringField;
    k_slave1polka: TStringField;
    k_slave1srok: TDateField;
    k_slave1turi: TSmallintField;
    k_slave1resept: TSmallintField;
    k_slave1qrkod: TIntegerField;
    k_slave1kol: TIntegerField;
    k_slave1kol_in: TIntegerField;
    k_slave1sena_in: TFloatField;
    k_slave1summa: TFloatField;
    k_slave1summa_in: TFloatField;
    k_slave1summa_all: TFloatField;
    k_slave1sotish: TFloatField;
    k_slave1sotish_in: TFloatField;
    k_slave1foiz: TFloatField;
    k_slave1foiz_in: TFloatField;
    k_slave1subkod: TSmallintField;
    k_slave1user_id: TIntegerField;
    k_slave1changedate: TDateTimeField;
    k_slave1asos_id: TIntegerField;
    k_slave1del_flag: TSmallintField;
    k_slave1kol_ost: TIntegerField;
    k_slave1kol_in_ost: TIntegerField;
    k_slave1sena_d: TFloatField;
    k_slave1sena_in_d: TFloatField;
    k_slave1sotish_d: TFloatField;
    k_slave1sotish_in_d: TFloatField;
    k_slave1zakaz: TDateTimeField;
    k_slave1zakaz_ok: TDateTimeField;
    k_slave1zakaz_end: TDateTimeField;
    k_slave1zakaz_print: TSmallintField;
    k_slave1s_tovar: TStringField;
    k_slavezakaz: TDateTimeField;
    k_slavezakaz_ok: TDateTimeField;
    k_slavezakaz_end: TDateTimeField;
    k_slavezakaz_print: TSmallintField;
    k_slave1s_izm1: TStringField;
    k_slave1s_izm: TStringField;
    s_clientdollar: TIntegerField;
    client_editdollar: TIntegerField;
    client_editbux: TDateField;
    s_clientbux: TDateField;
    k_slave1sena: TFloatField;
    k_slave1s_sena: TStringField;
    tplid: TIntegerField;
    tplbank_id: TIntegerField;
    tplkod: TIntegerField;
    tpln_pl: TIntegerField;
    tpln_dok: TStringField;
    tpld_pl: TDateField;
    tplrssvoy: TStringField;
    tplrs: TStringField;
    tplvo: TSmallintField;
    tplnn: TSmallintField;
    tplclient: TIntegerField;
    tplclient_id: TIntegerField;
    tpluser_id: TIntegerField;
    tplsena_pl: TFloatField;
    tplsena_d: TFloatField;
    tplsaldo: TFloatField;
    tplsaldo_d: TFloatField;
    tplost_pl: TFloatField;
    tplost_d: TFloatField;
    tplkurs: TFloatField;
    tplvid: TSmallintField;
    tpls1: TStringField;
    tplter: TSmallintField;
    tplpot1: TSmallintField;
    tplpot2: TSmallintField;
    tplsf: TIntegerField;
    tplsf_pot: TSmallintField;
    tplusername: TStringField;
    tplchangedate: TDateField;
    tplstos: TSmallintField;
    tpldel_flag: TSmallintField;
    tplprim: TStringField;
    tplstatrashod: TIntegerField;
    tpldiler_id: TIntegerField;
    tplh_id: TIntegerField;
    s_tovarustama: TFloatField;
    s_xodimdyum: TIntegerField;
    s_xodimustama: TIntegerField;
    s_papka: TZQuery;
    Ds_papka: TDataSource;
    s_tovarpapka: TIntegerField;
    gapir: TZQuery;
    Dgapir: TDataSource;
    k_slave1opt1: TFloatField;
    k_slave1opt1_in: TFloatField;
    k_slave1opt2: TFloatField;
    k_slave1opt2_in: TFloatField;
    k_slave1schet: TFloatField;
    k_slave1schet_in: TFloatField;
    k_slave1zakaz_gapir: TIntegerField;
    qoldiqsena_d: TFloatField;
    qoldiqsena_in_d: TFloatField;
    qoldiqsotish_d: TFloatField;
    qoldiqsotish_in_d: TFloatField;
    qoldiqzakaz: TDateTimeField;
    qoldiqzakaz_ok: TDateTimeField;
    qoldiqzakaz_end: TDateTimeField;
    qoldiqzakaz_print: TSmallintField;
    qoldiqzakaz_gapir: TIntegerField;
    k_slave1foiz_ch2: TFloatField;
    k_slave1foiz_schet: TFloatField;
    k_slave1foiz_opt1: TFloatField;
    k_slave1foiz_opt2: TFloatField;
    client_edityaxlitlash: TSmallintField;
    client_edityaxlitlash_in: TSmallintField;
    client_editfoiz: TFloatField;
    client_editfoiz_in: TFloatField;
    client_editfoiz_opt2: TFloatField;
    client_editfoiz_opt1: TFloatField;
    client_editfoiz_schet: TFloatField;
    client_editfoiz_ch2: TFloatField;
    s_clientfoiz_opt2: TFloatField;
    s_clientfoiz_opt1: TFloatField;
    s_clientfoiz_schet: TFloatField;
    s_clientfoiz_ch2: TFloatField;
    s_tovarulg1: TFloatField;
    s_tovarulg1_pl: TFloatField;
    s_tovarulg2: TFloatField;
    s_tovarulg2_pl: TFloatField;
    s_tovarbank: TFloatField;
    s_tovarsena: TFloatField;
    k_slave1opt1_pl: TFloatField;
    k_slave1opt1_pl_in: TFloatField;
    k_slave1opt2_pl: TFloatField;
    k_slave1opt2_pl_in: TFloatField;
    qoldiqfoiz_ch2: TFloatField;
    qoldiqfoiz_schet: TFloatField;
    qoldiqfoiz_opt1: TFloatField;
    qoldiqfoiz_opt2: TFloatField;
    qoldiqopt1: TFloatField;
    qoldiqopt1_pl: TFloatField;
    qoldiqopt1_pl_in: TFloatField;
    qoldiqopt2: TFloatField;
    qoldiqopt2_pl: TFloatField;
    qoldiqopt2_in: TFloatField;
    qoldiqopt2_pl_in: TFloatField;
    qoldiqschet: TFloatField;
    qoldiqschet_in: TFloatField;
    qoldiqch2_in: TFloatField;
    qoldiqopt1_in: TFloatField;
    s_t_allshtrix_in: TStringField;
    s_t_alltz_id: TSmallintField;
    s_t_allkg: TSmallintField;
    s_t_allshtrix_full: TStringField;
    s_t_allshtrix1: TStringField;
    s_t_allshtrix2: TStringField;
    s_t_allkat: TSmallintField;
    s_t_allbrend: TSmallintField;
    s_t_allpapka: TIntegerField;
    s_t_allshakl: TStringField;
    s_t_allinternom: TStringField;
    s_t_allmajbur_dori_id: TIntegerField;
    s_t_allmiqdor: TSmallintField;
    s_t_allshart: TSmallintField;
    s_t_allustama: TFloatField;
    s_t_allulg1: TFloatField;
    s_t_allulg1_pl: TFloatField;
    s_t_allulg2: TFloatField;
    s_t_allulg2_pl: TFloatField;
    s_t_allbank: TFloatField;
    s_t_allsena: TFloatField;
    asoss_user: TStringField;
    asosofisant: TStringField;
    asos_qoldiqdollar: TSmallintField;
    asos_qoldiqkurs: TFloatField;
    s_t_allsena_d: TFloatField;
    s_t_allsena_in_d: TFloatField;
    s_t_allsotish_d: TFloatField;
    s_tovarsena_d: TFloatField;
    s_tovarsotish_d: TFloatField;
    asos_slaveopt1: TFloatField;
    asoscheg_d: TFloatField;
    asossum_d_ch: TFloatField;
    asossotuv_turi: TIntegerField;
    asosqarz_dollar: TFloatField;
    k_asoscheg_d: TFloatField;
    k_asossum_d_ch: TFloatField;
    k_asosqarz_dollar: TFloatField;
    k_slaveopt1: TFloatField;
    tpls_vid: TStringField;
    s_tovars_kat: TStringField;
    tpls_user: TStringField;
    k_slave1s_sotish: TStringField;
    s_xodimphone_number: TStringField;
    asoss_xodimtel: TStringField;
    asoss_usertel: TStringField;
    s_tovartz_id: TSmallintField;
    s_tovarotdel: TIntegerField;
    s_tovarmajbur_dori_id: TIntegerField;
    s_tovarsena_in_d: TFloatField;
    s_tovarsotish_in_d: TFloatField;
    asosreklama: TFloatField;
    procedure s_kassas_statusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_xodims_statusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_tovarturiGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_tovarreseptGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_tovars_shtrixGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_tovars_qrGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_tovarBeforePost(DataSet: TDataSet);
    procedure s_xodimactiveGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_kassaBeforePost(DataSet: TDataSet);
    procedure s_clientBeforePost(DataSet: TDataSet);
    procedure asos_qoldiqjamiGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure asos_qoldiqBeforeInsert(DataSet: TDataSet);
    procedure asos_qoldiqBeforeEdit(DataSet: TDataSet);
    procedure asos_qoldiqAfterPost(DataSet: TDataSet);
    procedure asos_qoldiqNewRecord(DataSet: TDataSet);
    procedure asos_alljamiGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qoldiqs_qrkodGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure s_ombors_qrkodGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure asos_all_tanlajamiGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure asos_slaveBeforeEdit(DataSet: TDataSet);
    procedure client_editBeforePost(DataSet: TDataSet);
    procedure qoldiqfoydaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure asos_slaveBeforePost(DataSet: TDataSet);
    procedure shartnomaBeforePost(DataSet: TDataSet);
    procedure shartnomaAfterEdit(DataSet: TDataSet);
    procedure shartnomaAfterInsert(DataSet: TDataSet);
    procedure shartnomaAfterPost(DataSet: TDataSet);
    procedure shartnomaAfterCancel(DataSet: TDataSet);
    procedure k_asosAfterScroll(DataSet: TDataSet);
    procedure k_slaveBeforePost(DataSet: TDataSet);
    procedure k_asosholatGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure x_asosAfterCancel(DataSet: TDataSet);
    procedure x_asosAfterPost(DataSet: TDataSet);
    procedure x_asosBeforeEdit(DataSet: TDataSet);
    procedure x_asosBeforeInsert(DataSet: TDataSet);
    procedure s_x_turNewRecord(DataSet: TDataSet);
    procedure tplAfterCancel(DataSet: TDataSet);
    procedure tplAfterPost(DataSet: TDataSet);
    procedure tplBeforeEdit(DataSet: TDataSet);
    procedure tplBeforeInsert(DataSet: TDataSet);
    procedure tplAfterScroll(DataSet: TDataSet);
    procedure tplsena_plGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure shartnomaNewRecord(DataSet: TDataSet);
    procedure s_tovarNewRecord(DataSet: TDataSet);
    procedure s_zavodNewRecord(DataSet: TDataSet);
    procedure s_kassaNewRecord(DataSet: TDataSet);
    procedure s_xodimNewRecord(DataSet: TDataSet);
    procedure asosNewRecord(DataSet: TDataSet);
    procedure asos_qoldiqAfterCancel(DataSet: TDataSet);
    procedure tplNewRecord(DataSet: TDataSet);
    procedure k_slave1BeforePost(DataSet: TDataSet);
    procedure k_slave1s_senaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure k_asossummaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qoldiqsoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure k_slave1s_sotishGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMS: TDMS;

implementation

uses fulanish, fs_ostatka, fs_tovar_edit, fshartnoma, fkirim,
  fkafe, fkassa;

{$R *.dfm}

procedure TDMS.s_kassas_statusGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if dms.s_kassastatus.AsInteger=1 then Text:='Aktiv' else text:='Passiv';
end;

procedure TDMS.s_xodims_statusGetText(Sender: TField; var Text: String;DisplayText: Boolean);
begin
  if dms.s_xodimstatus.AsInteger=1 then Text:='Aktiv' else text:='Passiv';
end;

procedure TDMS.s_tovarturiGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if dms.s_tovarturi.AsInteger=1 then Text:='Ha' else text:='---';
end;

procedure TDMS.s_tovarreseptGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if dms.s_tovarresept.AsInteger=1 then Text:='Ha' else text:='---';
end;

procedure TDMS.s_tovars_shtrixGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if dms.s_tovarshtrixkod.AsInteger=1 then Text:='Ha' else text:='---';
end;

procedure TDMS.s_tovars_qrGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if dms.s_tovarqrkod.AsInteger=1 then Text:='Ha' else text:='---';
end;

procedure TDMS.s_tovarBeforePost(DataSet: TDataSet);
begin
  DMS.setup.Refresh;
  dms.s_tovarchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  If dms.s_tovar.State=dsInsert then exit;
  if (dms.s_tovarnom.Value<>s_tovar_edit.oldnom.text) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('nima').AsString:='Товар номи';
  dms.protizm.fieldbyname('old_value').AsString:=s_tovar_edit.oldnom.text;
  if dms.s_tovaruser_id.AsInteger>0 then
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=dms.s_tovars_user.Value
  else
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=dms.s_tovars_client.Value;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=dms.s_tovarchangedate.Value;
  dms.protizm.fieldbyname('new_value').AsString:=dms.s_tovarnom.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=dms.s_tovarid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=admin_nom;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;
  if (dms.s_tovarshtrix.Value<>s_tovar_edit.oldshtrix.text) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('nima').AsString:='Товар shtrix';
  dms.protizm.fieldbyname('old_value').AsString:=s_tovar_edit.oldshtrix.text;
  if dms.s_tovaruser_id.AsInteger>0 then
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=dms.s_tovars_user.Value
  else
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=dms.s_tovars_client.Value;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=dms.s_tovarchangedate.Value;
  dms.protizm.fieldbyname('new_value').AsString:=dms.s_tovarshtrix.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=dms.s_tovarid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=admin_nom;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;
  if (dms.s_tovaraniq.Value>0) and (s_tovar_edit.oldaniq.Value>0) and  (s_tovar_edit.oldaniq.Value<>dms.s_tovaraniq.Value) then begin
  DMS.protizm.Insert;
  dms.protizm.fieldbyname('nima').AsString:='Isht.narx';
  dms.protizm.fieldbyname('old_value').AsString:=s_tovar_edit.oldaniq.Text;
  if dms.s_tovaruser_id.AsInteger>0 then
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=dms.s_tovars_user.Value
  else
  dms.protizm.fieldbyname('old_adminnom').AsVariant:=dms.s_tovars_client.Value;
  dms.protizm.fieldbyname('old_changedate').AsVariant:=dms.s_tovarchangedate.Value;
  dms.protizm.fieldbyname('new_value').AsString:=dms.s_tovaraniq.AsString;
  dms.protizm.fieldbyname('subid').AsInteger:=dms.s_tovarid.AsInteger;
  dms.protizm.fieldbyname('new_adminnom').AsString:=admin_nom;
  dms.protizm.fieldbyname('new_changedate').AsVariant:=dms.setup.fieldbyname('vaqt').Value;
  DMS.protizm.Post;
  end;

end;

procedure TDMS.s_xodimactiveGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if dms.s_xodimactive.AsInteger=1 then Text:='Aktiv' else text:='Passiv';
end;

procedure TDMS.s_kassaBeforePost(DataSet: TDataSet);
begin
  if s_kassa.Active = false then exit;
  dms.setup.Refresh;
  dms.s_kassachangedate.AsDateTime:=dms.setupvaqt.AsDateTime;

end;

procedure TDMS.s_clientBeforePost(DataSet: TDataSet);
begin
  if (s_client.Active = false) and (admin_type<>'3') and (admin_id='') then exit;
  dms.setup.Refresh;
  dms.s_clientuser_id.AsInteger:=StrToInt(admin_id);
  dms.s_clientchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
end;

procedure TDMS.asos_qoldiqjamiGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if dms.asos_qoldiqs_diler.AsString='' then
    text:='sana='+dms.asos_qoldiqsana.AsString
  else
    text:='№='+dms.asos_qoldiqnomer.AsString+'; sana='+dms.asos_qoldiqsana.AsString+' ; diler:'+dms.asos_qoldiqs_diler.AsString;
end;

procedure TDMS.asos_qoldiqBeforeInsert(DataSet: TDataSet);
begin
  exit;
  s_ostatka.yes.Caption:='Saqlash';s_ostatka.no.Caption:='Bekor qilish';
  s_ostatka.diler.visible:=false;
  s_ostatka.nomer.Enabled:=true;s_ostatka.n_sana.Enabled:=true;s_ostatka.n_diler.Enabled:=true;
  //s_ostatka.nomer.Color:=clWindow;s_ostatka.n_sana.Color:=clWindow;s_ostatka.n_diler.Color:=clWindow;
  end;

procedure TDMS.asos_qoldiqBeforeEdit(DataSet: TDataSet);
begin
  exit;
  s_ostatka.yes.Caption:='Saqlash';s_ostatka.no.Caption:='Bekor qilish';
  s_ostatka.diler.visible:=false;
  s_ostatka.nomer.Enabled:=true;s_ostatka.n_sana.Enabled:=true;s_ostatka.n_diler.Enabled:=true;
  //s_ostatka.nomer.Color:=clWindow;s_ostatka.n_sana.Color:=clWindow;s_ostatka.n_diler.Color:=clWindow;

end;

procedure TDMS.asos_qoldiqAfterPost(DataSet: TDataSet);
begin
  exit;
  s_ostatka.yes.Caption:='Yangi xujjat';s_ostatka.no.Caption:='Taxrirlash';
  s_ostatka.nomer.Color:=$00B4E6E0;s_ostatka.n_sana.Color:=$00B4E6E0;s_ostatka.n_diler.Color:=$00B4E6E0;
  s_ostatka.diler.visible:=true;

end;

procedure TDMS.asos_qoldiqNewRecord(DataSet: TDataSet);
begin
  dms.asos_qoldiqsana.AsDateTime:=dms.setupvaqt.AsDateTime;
  dms.asos_qoldiqclient_id.value:=StrToInt(admin_id);
  dms.asos_qoldiqtur_oper.AsInteger:=5;
end;

procedure TDMS.asos_alljamiGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if dms.asos_alls_diler.AsString='' then text:='Diler='+'Mol etkazuvchi tanlanmagan ;sana='+dms.asos_all.fieldbyname('sana').AsString
  else
  text:='Diler='+dms.asos_alls_diler.AsString+' ;sana='+dms.asos_all.fieldbyname('sana').AsString;
end;

procedure TDMS.qoldiqs_qrkodGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if dms.qoldiqqrkod.AsInteger=1 then Text:='Ha' else text:='---';

end;

procedure TDMS.s_ombors_qrkodGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if dms.s_ombor.FieldByName('qrkod').AsInteger=1 then Text:='Ha' else text:='---';
end;

procedure TDMS.asos_all_tanlajamiGetText(Sender: TField; var Text: String;DisplayText: Boolean);
begin
  if dms.asos_alls_diler.AsString='' then text:='Diler='+'Mol etkazuvchi tanlanmagan ;sana='+dms.asos_all.fieldbyname('sana').AsString
  else
  text:='Diler='+dms.asos_alls_diler.AsString+' ;sana='+dms.asos_all.fieldbyname('sana').AsString;

end;

procedure TDMS.asos_slaveBeforeEdit(DataSet: TDataSet);
begin
  exit;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE id='+DMS.asos_slavetovar_id.AsString);
  dms.s_tovar.open;
end;

procedure TDMS.client_editBeforePost(DataSet: TDataSet);
begin
  if (client_edit.Active = false) and (admin_type<>'3') then exit;
  dms.setup.Refresh;
  dms.client_edituser_id.AsInteger:=StrToInt(admin_id);
  dms.client_editchangedate.AsDateTime:=dms.setupvaqt.AsDateTime;

end;

procedure TDMS.qoldiqfoydaGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
 text:=floatToStr((dms.qoldiqkol.AsInteger*dms.qoldiqsotish.AsFloat-dms.qoldiqkol.AsInteger*dms.qoldiqsena.AsFloat)+(dms.qoldiqkol_in.AsInteger*dms.qoldiqsotish_in.AsFloat-dms.qoldiqkol_in.AsInteger*dms.qoldiqsena_in.AsFloat));
end;

procedure TDMS.asos_slaveBeforePost(DataSet: TDataSet);
begin
  dms.setup.Refresh;
  dms.asos_slaveuser_id.AsInteger:=StrToInt(admin_id);
  dms.asos_slavechangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
end;

procedure TDMS.shartnomaBeforePost(DataSet: TDataSet);
begin
  dms.setup.Refresh;

  dms.shartnomachangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
end;

procedure TDMS.shartnomaAfterEdit(DataSet: TDataSet);
begin
  shartnomalar.save.visible:=true;shartnomalar.cancel.visible:=true;
  shartnomalar.new.visible:=false;shartnomalar.del.visible:=false;
end;

procedure TDMS.shartnomaAfterInsert(DataSet: TDataSet);
begin
  shartnomalar.save.visible:=true;shartnomalar.cancel.visible:=true;
  shartnomalar.new.visible:=false;shartnomalar.del.visible:=false;
end;

procedure TDMS.shartnomaAfterPost(DataSet: TDataSet);
begin
  shartnomalar.save.visible:=false;shartnomalar.cancel.visible:=false;
  shartnomalar.new.visible:=true;shartnomalar.del.visible:=true;
end;

procedure TDMS.shartnomaAfterCancel(DataSet: TDataSet);
begin
  shartnomalar.save.visible:=false;shartnomalar.cancel.visible:=false;
  shartnomalar.new.visible:=true;shartnomalar.del.visible:=true;

end;

procedure TDMS.k_asosAfterScroll(DataSet: TDataSet);
begin
  //kirim.tovarlar.SumList.RecalcAll;
end;

procedure TDMS.k_slaveBeforePost(DataSet: TDataSet);
begin
  dms.k_slavesumma.AsFloat:=dms.k_slavekol.AsInteger*dms.k_slavesena.AsFloat;
  dms.k_slavesumma_in.AsFloat:=dms.k_slavekol_in.AsInteger*dms.k_slavesena_in.AsFloat;
  dms.k_slavesumma_all.AsFloat:=dms.k_slavesumma.AsFloat+dms.k_slavesumma_in.AsFloat;
end;

procedure TDMS.k_asosholatGetText(Sender: TField; var Text: String;DisplayText: Boolean);
begin
  if k_asosprint_flag.Value=1 then
    text:='Rahbar tomonidan tasdiqlangan'
  else
    text:='Rahbar tomonidan ko`rib chiqilmagan';
end;

procedure TDMS.x_asosAfterCancel(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Yangi';kassa.delpl.Caption:='o`chirish';
  kassa.gpl.Enabled:=true;
end;

procedure TDMS.x_asosAfterPost(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Yangi';kassa.delpl.Caption:='o`chirish';
  kassa.gpl.Enabled:=true;
end;

procedure TDMS.x_asosBeforeEdit(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;
end;

procedure TDMS.x_asosBeforeInsert(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;
end;

procedure TDMS.s_x_turNewRecord(DataSet: TDataSet);
begin
  dms.s_x_tur.FieldByName('status').AsInteger:=1;
end;

procedure TDMS.tplAfterCancel(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Yangi';kassa.delpl.Caption:='o`chirish';
  kassa.gpl.Enabled:=true;
  kafe.newpl.Caption:='Yangi';kafe.delpl.Caption:='o`chirish';
  kafe.gpl.Enabled:=true;
end;

procedure TDMS.tplAfterPost(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Yangi';kassa.delpl.Caption:='o`chirish';
  kassa.gpl.Enabled:=true;
  kafe.newpl.Caption:='Yangi';kafe.delpl.Caption:='o`chirish';
  kafe.gpl.Enabled:=true;

end;

procedure TDMS.tplBeforeEdit(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;
  kafe.newpl.Caption:='Saqlash';kafe.delpl.Caption:='Bekor qilish';
  kafe.gpl.Enabled:=false;
end;

procedure TDMS.tplBeforeInsert(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;
  kafe.newpl.Caption:='Saqlash';kafe.delpl.Caption:='Bekor qilish';
  kafe.gpl.Enabled:=false;
end;

procedure TDMS.tplAfterScroll(DataSet: TDataSet);
begin
  case dms.tplvid.AsInteger of
  2:begin
      kassa.lvo.Visible:=true;kassa.vo.Visible:=true;
      kassa.diler.Visible:=false;kassa.haridor.Visible:=false;
      kassa.lvo.Caption:= 'Xarajat turi';
      kafe.lvo.Visible:=true;kafe.vo.Visible:=true;
      kafe.diler.Visible:=false;kafe.haridor.Visible:=false;
      kafe.lvo.Caption:= 'Xarajat turi';
    end;
  3:begin
      kassa.lvo.Visible:=true;kassa.vo.Visible:=false;
      kassa.diler.Visible:=true;kassa.haridor.Visible:=false;
      kassa.lvo.Caption:= 'Mol etkazuvci';
      kafe.lvo.Visible:=true;kafe.vo.Visible:=false;
      kafe.diler.Visible:=true;kafe.haridor.Visible:=false;
      kafe.lvo.Caption:= 'Mol etkazuvci';
    end;
  4:begin
      kassa.lvo.Visible:=false;kassa.vo.Visible:=false;kassa.diler.Visible:=false;kassa.haridor.Visible:=false;
    end;
  5:begin
      kassa.lvo.Visible:=false;kassa.vo.Visible:=false;kassa.diler.Visible:=false;kassa.haridor.Visible:=false;
    end;
  6,19:begin // инкасса
      kassa.lvo.Visible:=false;kassa.diler.Visible:=false;kassa.vo.Visible:=false;kassa.haridor.Visible:=false;
    end;
  7:begin
      kassa.lvo.Visible:=true;kassa.vo.Visible:=false;
      kassa.diler.Visible:=false;kassa.haridor.Visible:=true;
      kassa.lvo.Caption:= 'Haridor';
    end;
  8:begin
      kassa.lvo.Visible:=true;kassa.vo.Visible:=false;
      kassa.diler.Visible:=false;kassa.haridor.Visible:=true;
      kassa.lvo.Caption:= 'Haridor';
    end;
  9:begin
      kassa.lvo.Visible:=true;kassa.vo.Visible:=false;
      kassa.diler.Visible:=true;kassa.haridor.Visible:=false;
      kassa.lvo.Caption:= 'Mol etkazuvci';
    end;
  end;
  case dms.tplvid.AsInteger of
  2:begin
      kafe.lvo.Visible:=true;kafe.vo.Visible:=true;
      kafe.diler.Visible:=false;kafe.haridor.Visible:=false;
      kafe.lvo.Caption:= 'Xarajat turi';
    end;
  3:begin
      kafe.lvo.Visible:=true;kafe.vo.Visible:=false;
      kafe.diler.Visible:=true;kafe.haridor.Visible:=false;
      kafe.lvo.Caption:= 'Mol etkazuvci';
    end;
  4:begin
      kafe.lvo.Visible:=false;kafe.vo.Visible:=false;kafe.diler.Visible:=false;kafe.haridor.Visible:=false;
    end;
  5:begin
      kafe.lvo.Visible:=false;kafe.vo.Visible:=false;kafe.diler.Visible:=false;kafe.haridor.Visible:=false;
    end;
  6,19:begin // инкасса
      kafe.lvo.Visible:=false;kafe.diler.Visible:=false;kafe.vo.Visible:=false;kafe.haridor.Visible:=false;
    end;
  7:begin
      kafe.lvo.Visible:=true;kafe.vo.Visible:=false;
      kafe.diler.Visible:=false;kafe.haridor.Visible:=true;
      kafe.lvo.Caption:= 'Haridor';
    end;
  8:begin
      kafe.lvo.Visible:=true;kafe.vo.Visible:=false;
      kafe.diler.Visible:=false;kafe.haridor.Visible:=true;
      kafe.lvo.Caption:= 'Haridor';
    end;
  9:begin
      kafe.lvo.Visible:=true;kafe.vo.Visible:=false;
      kafe.diler.Visible:=true;kafe.haridor.Visible:=false;
      kafe.lvo.Caption:= 'Mol etkazuvci';
    end;

  end;

end;

procedure TDMS.tplsena_plGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if tplvid.Value in [2,3,5,6,8,11,13,14,18] then
  text:='-'+tplsena_pl.AsString else text:=tplsena_pl.AsString;

end;

procedure TDMS.shartnomaNewRecord(DataSet: TDataSet);
begin
  dms.shartnomauser_id.AsInteger:=StrToInt(admin_id);
  dms.shartnomaclient_id.AsInteger:=StrToInt(admin_clid);
end;

procedure TDMS.s_tovarNewRecord(DataSet: TDataSet);
begin
  dms.s_tovarturi.Value:=0;dms.s_tovarresept.Value:=0; dms.s_tovarotdel.Value:=1;
  dms.s_tovarshtrixkod.Value:=1;dms.s_tovarqrkod.Value:=0;
  dms.s_tovarkat.Value:=0;dms.s_tovarbrend.Value:=0;
  dms.s_tovarizm_id.Value:=3;dms.s_tovarizm1.Value:=2;
  dms.s_tovarclient_id.AsInteger:=StrToInt(admin_clid);
  dms.s_tovaruser_id.AsInteger:=StrToInt(admin_id);
  dms.s_tovarclient_id.AsInteger:=dms.s_clientid.AsInteger;
end;

procedure TDMS.s_zavodNewRecord(DataSet: TDataSet);
begin
  dms.s_zavod.FieldByName('client_id').AsInteger:=StrToInt(admin_clid);
  dms.s_zavod.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
end;

procedure TDMS.s_kassaNewRecord(DataSet: TDataSet);
begin
  dms.s_kassauser_id.AsInteger:=StrToInt(admin_id);
  dms.s_kassaclient_id.AsInteger:=StrToInt(admin_clid);
end;

procedure TDMS.s_xodimNewRecord(DataSet: TDataSet);
begin
  dms.s_xodimclient_id.AsInteger:=StrToInt(admin_clid);
end;

procedure TDMS.asosNewRecord(DataSet: TDataSet);
begin
  dms.asosmobil.AsInteger:=0;
  dms.setup.Refresh;
  dms.asossana.AsDateTime:=dms.setupvaqt.AsDateTime;
  dms.asosxodim_id.AsInteger:=StrToInt(admin_id);
  dms.asosuser_id.AsInteger:=StrToInt(admin_id);
  dms.asosclient_id.AsInteger:=StrToInt(admin_clid);
end;

procedure TDMS.asos_qoldiqAfterCancel(DataSet: TDataSet);
begin
  exit;
  s_ostatka.yes.Caption:='Yangi xujjat';s_ostatka.no.Caption:='Taxrirlash';
  s_ostatka.nomer.Color:=$00B4E6E0;s_ostatka.n_sana.Color:=$00B4E6E0;s_ostatka.n_diler.Color:=$00B4E6E0;
  s_ostatka.diler.visible:=true;

end;

procedure TDMS.tplNewRecord(DataSet: TDataSet);
begin
  tpluser_id.AsInteger:=StrToInt(admin_id);
  tplclient_id.AsInteger:=dms.s_clientid.AsInteger;
end;

procedure TDMS.k_slave1BeforePost(DataSet: TDataSet);
begin
  dms.k_slave1summa.AsFloat:=dms.k_slave1kol.AsInteger*dms.k_slave1sena.AsFloat;
  dms.k_slave1summa_in.AsFloat:=dms.k_slave1kol_in.AsInteger*dms.k_slave1sena_in.AsFloat;
  dms.k_slave1summa_all.AsFloat:=dms.k_slave1summa.AsFloat+dms.k_slave1summa_in.AsFloat;

end;

procedure TDMS.k_slave1s_senaGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if dms.s_clientdollar.Value>1 then
    if dms.k_slave1sena_d.AsFloat>0 then
      text:=dms.k_slave1sena_d.AsString
    else
      text:=dms.k_slave1sena.AsString;
end;

procedure TDMS.k_asossummaGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if dms.s_clientdollar.Value=1 then
    text:=dms.k_asossum_d.AsString
  else
    text:=dms.k_asossumma.AsString;
end;

procedure TDMS.qoldiqsoGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text:='sds';
end;

procedure TDMS.k_slave1s_sotishGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if dms.s_clientdollar.Value>1 then
    if dms.k_slave1sena_d.AsFloat>0 then
      text:=FloatToStr(dms.k_slave1kol.AsInteger*dms.k_slave1sena_d.AsFloat)
    else
      text:=FloatToStr(dms.k_slave1kol.AsInteger*dms.k_slave1sena.AsFloat);

end;

end.
