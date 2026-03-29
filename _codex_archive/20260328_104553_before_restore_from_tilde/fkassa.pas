unit fkassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, DBCtrls, Grids, DBGrids, GridsEh,
  inifiles,IdGlobal,
  RzSplit, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus,
  SUIPopupMenu, jpeg, DBGridEh, DBLookupEh, frxDesgn, frxClass, frxDBSet,
  Buttons, RzSpnEdt, DBCtrlsEh, RzTabs, DB, RzPanel, ExtCtrls, RzDBCmbo,
  RzEdit, RzDBEdit, RzRadGrp, RzDBRGrp, RzCmboBx, RzRadChk,
  RzDBChk, frxOLE, ImgList, IdCoder, IdCoder3to4, IdCoderMIME,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,DelphiZXingQRCode,
  ComCtrls, WordXP, OleServer; //FileCtrl,DelphiZXingQRCode,
const
{������� ���������� �������}
LetInteger: array[0..9]of Char=('0','1','2','3','4','5','6','7','8','9');
{����� EN ���������}
EngLet: string ='`qwertyuiop[]asdfghjkl;''zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>';
{����� RU ���������}
RusLet: string ='������������������������������������������������������������������';
type
  Tkassa = class(TForm)
    frxsf: TfrxReport;
    asos_slave: TfrxDBDataset;
    asos: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    qpopup: TsuiPopupMenu;
    MenuItem2: TMenuItem;
    p_pechat: TsuiPopupMenu;
    MenuItem1: TMenuItem;
    client: TfrxDBDataset;
    varaq: TRzPageControl;
    Tab0: TRzTabSheet;
    Tab2: TRzTabSheet;
    yessf: TRzBitBtn;
    nosf: TRzBitBtn;
    TabSheet2: TRzTabSheet;
    TabSheet1: TRzTabSheet;
    RzRapidFireButton1: TRzRapidFireButton;
    Splitter3: TSplitter;
    TabSheet3: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    TabSheet6: TRzTabSheet;
    Ekrandakorish2: TMenuItem;
    Pright: TRzSizePanel;
    Panel1: TPanel;
    Label1: TLabel;
    soni: TLabel;
    f5: TRzBitBtn;             
    RzSizePanel2: TRzSizePanel;
    g_asos: TDBGridEh;
    RzSizePanel4: TRzSizePanel;
    Label2: TLabel;
    Label8: TLabel;
    cbPrinters: TComboBox;
    chek_del: TsuiPopupMenu;
    tanlash: TComboBox;
    DBGridEh2: TDBGridEh;
    Image3: TImage;
    Image4: TImage;
    RzPanel1: TRzPanel;
    Edit2: TEdit;
    TabSheet8: TRzTabSheet;
    DBGridEh4: TDBGridEh;
    DBGridEh5: TDBGridEh;
    DBGridEh3: TDBGridEh;
    xnew: TRzBitBtn;
    xdel: TRzBitBtn;
    DBGridEh6: TDBGridEh;
    RzPanel2: TRzPanel;
    Edit3: TEdit;
    RzPanel3: TRzPanel;
    Splitter5: TSplitter;
    TabSheet5: TRzTabSheet;
    DBGridEh7: TDBGridEh;
    DBGridEh8: TDBGridEh;
    Label11: TLabel;
    yorliqPrinters: TComboBox;
    chekPrinters: TComboBox;
    Shtri: TLabel;
    Label10: TLabel;
    chekshablon: TComboBox;
    Label15: TLabel;
    yorliqshablon: TComboBox;
    TabSheet7: TRzTabSheet;
    gtimeout: TDBGridEh;
    DBGridEh10: TDBGridEh;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    cheknitahrirlash1: TMenuItem;
    cheg_n: TDBNumberEditEh;
    TabSheet9: TRzTabSheet;
    gpl: TDBGridEh;
    Kassadanpulniexhish1: TMenuItem;
    Gredit: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    n_pl: TDBNumberEditEh;
    d_pl: TDBDateTimeEditEh;
    sena_pl: TDBNumberEditEh;
    vid: TRzDBLookupComboBox;
    Panel2: TPanel;
    newpl: TRzBitBtn;
    delpl: TRzBitBtn;
    Group_sbor: TGroupBox;
    toza: TRzBitBtn;
    hisobla: TRzBitBtn;
    DBGridEh11: TDBGridEh;
    diler: TRzDBLookupComboBox;
    TabSheet10: TRzTabSheet;
    lvo: TLabel;
    vo: TRzDBLookupComboBox;
    Label19: TLabel;
    tulov: TDBNumberEditEh;
    Label20: TLabel;
    saldo: TDBNumberEditEh;
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gform: TGroupBox;
    Label9: TLabel;
    Label25: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Lombor: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    sana: TDBDateTimeEditEh;
    nomer: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    shartnoma: TDBLookupComboboxEh;
    ombor: TDBLookupComboboxEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBNumberEditEh2: TDBNumberEditEh;
    summa: TDBNumberEditEh;
    tulandi: TDBNumberEditEh;
    RzBitBtn3: TRzBitBtn;
    DBGridEh12: TDBGridEh;
    DBGridEh14: TDBGridEh;
    Label18: TLabel;
    haridor: TRzDBLookupComboBox;
    harid: TfrxDBDataset;
    s_diler: TfrxDBDataset;
    xpl: TZQuery;
    RzBitBtn4: TRzBitBtn;
    TabSheet11: TRzTabSheet;
    gmobil: TDBGridEh;
    DBGridEh18: TDBGridEh;
    suiPopupMenu1: TsuiPopupMenu;
    mobil01: TMenuItem;
    Chekniochirish1: TMenuItem;
    Chekniochirish2: TMenuItem;
    summa_ch: TRzDBNumericEdit;
    prim: TRzDBEdit;
    Label22: TLabel;
    sana_poisk: TDBDateTimeEditEh;
    qoldiq: TZQuery;
    Dqoldiq: TDataSource;
    V1: TMenuItem;
    link: TfrxDBDataset;
    MainMenu1: TMainMenu;
    sena_d: TDBNumberEditEh;
    Lsena_d: TLabel;
    Label23: TLabel;
    a4Printers: TComboBox;
    Label24: TLabel;
    a4shablon: TComboBox;
    sana_poisk0: TDBDateTimeEditEh;
    main: TZQuery;
    Dmain: TDataSource;
    suiPopupMenu2: TsuiPopupMenu;
    S1: TMenuItem;
    TabSheet12: TRzTabSheet;
    ts_inv: TZQuery;
    Ds_inv: TDataSource;
    Label27: TLabel;
    RzDBNumericEdit2: TRzDBNumericEdit;
    Label28: TLabel;
    Taqsimla: TRzBitBtn;
    DBGridEh20: TDBGridEh;
    Dxpl: TDataSource;
    Label29: TLabel;
    Label34: TLabel;
    tpl: TZQuery;
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
    tpls_vid: TStringField;
    tpls_user: TStringField;
    tplsrok: TDateField;
    tplinv_id: TIntegerField;
    Dpl: TDataSource;
    Dmain_in: TDataSource;
    koy11: TsuiPopupMenu;
    Seriayanitovarbimanochirish1: TMenuItem;
    koy: TEdit;
    ks_pl: TEdit;
    xplinv_id: TIntegerField;
    xplasos_id: TIntegerField;
    xpluser_id: TIntegerField;
    Tozala: TRzBitBtn;
    xplid: TIntegerField;
    xpln_pl: TIntegerField;
    xpld_pl: TDateField;
    xplsrok: TDateField;
    xplsena_pl: TFloatField;
    xplost_pl: TFloatField;
    xpldel_flag: TSmallintField;
    xplprim: TStringField;
    Lkurs: TLabel;
    Lkonv: TLabel;
    kurs: TDBNumberEditEh;
    tplasos_id: TIntegerField;
    tplkonv: TIntegerField;
    konv: TRzDBComboBox;
    tpechat: TTimer;
    Avtopechat: TButton;
    ser: TZQuery;
    Dser: TDataSource;
    s4: TMenuItem;
    RzSizePanel5: TRzSizePanel;
    RzSizePanel6: TRzSizePanel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    K1: TMenuItem;
    f1: TMenuItem;
    f3: TRzBitBtn;
    timer: TZQuery;
    DBGridEh9: TDBGridEh;
    kat: TZQuery;
    Dkat: TDataSource;
    Panel4: TPanel;
    Panel3: TPanel;
    Label37: TLabel;
    Label21: TLabel;
    sana1: TDBDateTimeEditEh;
    sana2: TDBDateTimeEditEh;
    RzBitBtn5: TRzBitBtn;
    filtr_haridor: TDBLookupComboboxEh;
    Panel5: TPanel;
    DBGridEh15: TDBGridEh;
    varaqf6: TRzPageControl;
    sh1: TRzTabSheet;
    sh2: TRzTabSheet;
    sh3: TRzTabSheet;
    sh4: TRzTabSheet;
    sh5: TRzTabSheet;
    sh6: TRzTabSheet;
    sh7: TRzTabSheet;
    sh8: TRzTabSheet;
    sh9: TRzTabSheet;
    sh10: TRzTabSheet;
    sh11: TRzTabSheet;
    sh12: TRzTabSheet;
    sh13: TRzTabSheet;
    sh14: TRzTabSheet;
    sh15: TRzTabSheet;
    sh16: TRzTabSheet;
    sh17: TRzTabSheet;
    sh18: TRzTabSheet;
    sh19: TRzTabSheet;
    sh20: TRzTabSheet;
    sh21: TRzTabSheet;
    sh22: TRzTabSheet;
    sh23: TRzTabSheet;
    sh24: TRzTabSheet;
    sh25: TRzTabSheet;
    sh26: TRzTabSheet;
    sh27: TRzTabSheet;
    sh28: TRzTabSheet;
    sh29: TRzTabSheet;
    sh30: TRzTabSheet;
    sh31: TRzTabSheet;
    sh32: TRzTabSheet;
    sh33: TRzTabSheet;
    sh34: TRzTabSheet;
    sh35: TRzTabSheet;
    sh36: TRzTabSheet;
    sh37: TRzTabSheet;
    sh38: TRzTabSheet;
    sh39: TRzTabSheet;
    sh40: TRzTabSheet;
    Memo3: TMemo;
    tlink: TZQuery;
    Dlink: TDataSource;
    main_link: TZQuery;
    Dmain_link: TDataSource;
    Timer2: TTimer;
    frxUserDataSet1: TfrxUserDataSet;
    frxOLEObject1: TfrxOLEObject;
    Dialog1: TMenuItem;
    t_id: TEdit;
    Label26: TLabel;
    TabSheet13: TRzTabSheet;
    xldan: TLabel;
    xlgacha: TLabel;
    bot: TButton;
    data1: TDBDateTimeEditEh;
    data2: TDBDateTimeEditEh;
    Dslave: TDataSource;
    IdHTTP1: TIdHTTP;
    IdDecoderMIME1: TIdDecoderMIME;
    zapros: TRzEdit;
    za: TRzEdit;
    Label4: TLabel;
    xizmat: TRzDBNumericEdit;
    Label35: TLabel;
    xizmat_foiz: TDBComboBoxEh;
    Label5: TLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    mlink: TZQuery;
    Memo1: TMemo;
    s_t_all: TZQuery;
    s_t_allid: TIntegerField;
    s_t_allnom: TStringField;
    s_t_allnom_ru: TStringField;
    s_t_allnom_sh: TStringField;
    s_t_allshtrix: TStringField;
    s_t_allqr: TStringField;
    s_t_allshtrixkod: TSmallintField;
    s_t_allqrkod: TSmallintField;
    s_t_allizm_id: TSmallintField;
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
    s_t_allzavod: TStringField;
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
    s_t_allsena_d: TFloatField;
    s_t_allsena_in_d: TFloatField;
    s_t_allsotish_d: TFloatField;
    s_t_allkol_in: TSmallintField;
    s_t_allqoldiq: TStringField;
    s_t_allholat: TIntegerField;
    Dasos_slave: TDataSource;
    asosslave: TZQuery;
    Qaytahisoblash1: TMenuItem;
    pa4: TsuiPopupMenu;
    Ekrandakorish1: TMenuItem;
    Dialog2: TMenuItem;
    extgatashlash1: TMenuItem;
    Memo2: TMemo;
    GroupBox1: TGroupBox;
    Label36: TLabel;
    Label38: TLabel;
    new: TRzBitBtn;
    bekor: TRzBitBtn;
    gclient: TDBGridEh;
    Image7: TImage;
    poisk_h: TEdit;
    GroupBox2: TGroupBox;
    hfio_: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    hfio: TDBEdit;
    DBEdit4: TDBEdit;
    kub: TDBNumberEditEh;
    sot: TDBNumberEditEh;
    jami: TDBNumberEditEh;
    RzRadioGroup2: TRzRadioGroup;
    Label7: TLabel;
    Image2: TImage;
    slave: TZQuery;
    nom_: TEdit;
    tel_: TEdit;
    DBGridEh16: TDBGridEh;
    RzBitBtn6: TRzBitBtn;
    pnlDetails: TPanel;
    lblEncoding: TLabel;
    lblQuietZone: TLabel;
    lblErrorCorrectionLevel: TLabel;
    lblCorner: TLabel;
    lblDrawingMode: TLabel;
    lblScaleToSave: TLabel;
    cmbEncoding: TComboBox;
    edtQuietZone: TEdit;
    cbbErrorCorrectionLevel: TComboBox;
    edtCornerThickness: TEdit;
    udCornerThickness: TUpDown;
    udQuietZone: TUpDown;
    cbbDrawingMode: TComboBox;
    pgcQRDetails: TPageControl;
    tsPreview: TTabSheet;
    pbPreview: TPaintBox;
    lblQRMetrics: TLabel;
    pnlColors: TPanel;
    bvlColors: TBevel;
    lblBackground: TLabel;
    lblForeground: TLabel;
    clrbxBackground: TColorBox;
    clrbxForeground: TColorBox;
    tsEncodedData: TTabSheet;
    mmoEncodedData: TMemo;
    edtScaleToSave: TEdit;
    udScaleToSave: TUpDown;
    MSWord1: TWordApplication;
    WordDocument1: TWordDocument;
    dlgSaveToFile: TSaveDialog;
    QRCode: TRzBitBtn;
    Label41: TLabel;
    Edit4: TEdit;
    DBGridEh1: TDBGridEh;
    Label48: TLabel;
    bonus: TCheckBox;
    Label6: TLabel;
    cheg_d: TDBNumberEditEh;
    pechatlash: TCheckBox;
    main_link1: TfrxDBDataset;
    sql: TZQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField1: TStringField;
    DateField1: TDateField;
    StringField2: TStringField;
    StringField3: TStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    SmallintField3: TSmallintField;
    StringField4: TStringField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    SmallintField6: TSmallintField;
    IntegerField8: TIntegerField;
    SmallintField7: TSmallintField;
    StringField5: TStringField;
    DateField2: TDateField;
    SmallintField8: TSmallintField;
    SmallintField9: TSmallintField;
    StringField6: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    DateField3: TDateField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    chekniochirish3: TMenuItem;
    Label42: TLabel;
    RzDBNumericEdit3: TRzDBNumericEdit;
    turi_: TRzRadioGroup;
    procedure f5Click(Sender: TObject);
    procedure kolKeyPress(Sender: TObject; var Key: Char);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Ekrandakorish2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure varaqClick(Sender: TObject);
    procedure cbPrintersChange(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure TovarlarGetFooterParams(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment;
      State: TGridDrawState; var Text: String);
    procedure tanlashChange(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure xnewClick(Sender: TObject);
    procedure DBGridEh3Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure DBGridEh2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh6Exit(Sender: TObject);
    procedure xdelClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure DBGridEh5DblClick(Sender: TObject);
    procedure g_asosDblClick(Sender: TObject);
    procedure sEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure DBGridEh7DblClick(Sender: TObject);
    procedure yorliqPrintersChange(Sender: TObject);
    procedure chekPrintersChange(Sender: TObject);
    procedure chekshablonChange(Sender: TObject);
    procedure yorliqshablonChange(Sender: TObject);
    procedure TovarlarDblClick(Sender: TObject);
    procedure TovarlarCellClick(Column: TColumnEh);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure gtimeoutDblClick(Sender: TObject);
    procedure cheknitahrirlash1Click(Sender: TObject);
    procedure Kassadanpulniexhish1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure newplClick(Sender: TObject);
    procedure n_plKeyPress(Sender: TObject; var Key: Char);
    procedure delplClick(Sender: TObject);
    procedure hisoblaClick(Sender: TObject);
    procedure tozaClick(Sender: TObject);
    procedure vidExit(Sender: TObject);
    procedure sena_plEnter(Sender: TObject);
    procedure gplExit(Sender: TObject);
    procedure DBLookupComboboxEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh2EditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure mobil01Click(Sender: TObject);
    procedure Chekniochirish2Click(Sender: TObject);
    procedure Chekniochirish1Click(Sender: TObject);
    procedure DBGridEh3DblClick(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure a4PrintersChange(Sender: TObject);
    procedure a4shablonChange(Sender: TObject);
    procedure reklamaExit(Sender: TObject);
    procedure n_plChange(Sender: TObject);
    procedure d_plChange(Sender: TObject);
    procedure sena_plChange(Sender: TObject);
    procedure haridorExit(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure KredirClick(Sender: TObject);
    procedure TaqsimlaClick(Sender: TObject);
    procedure tplAfterCancel(DataSet: TDataSet);
    procedure tplAfterPost(DataSet: TDataSet);
    procedure tplBeforeInsert(DataSet: TDataSet);
    procedure tplAfterScroll(DataSet: TDataSet);
    procedure tplBeforeEdit(DataSet: TDataSet);
    procedure tplNewRecord(DataSet: TDataSet);
    procedure TozalaClick(Sender: TObject);
    procedure xplNewRecord(DataSet: TDataSet);
    procedure DBGridEh20ColExit(Sender: TObject);
    procedure sena_plExit(Sender: TObject);
    procedure sena_dExit(Sender: TObject);
    procedure sena_dEnter(Sender: TObject);
    procedure AvtopechatClick(Sender: TObject);
    procedure s4Click(Sender: TObject);
    procedure reklamaClick(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure f3Click(Sender: TObject);
    procedure g_asosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure Label21DblClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure g_asosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure varaqf6Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure qoldiqCalcFields(DataSet: TDataSet);
    procedure Dialog1Click(Sender: TObject);
    procedure cheg_nExit(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure cheg_nEnter(Sender: TObject);
    procedure poisk_hKeyPress(Sender: TObject; var Key: Char);
    procedure hEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure DBGridEh15DblClick(Sender: TObject);
    procedure varaqf6DblClick(Sender: TObject);
    procedure Ekrandakorish1Click(Sender: TObject);
    procedure Dialog2Click(Sender: TObject);
    procedure newClick(Sender: TObject);
    procedure nom_Exit(Sender: TObject);
    procedure tel_Exit(Sender: TObject);
    procedure nom_KeyPress(Sender: TObject; var Key: Char);
    procedure tel_KeyPress(Sender: TObject; var Key: Char);
    procedure gclientDblClick(Sender: TObject);
    procedure bekorClick(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure cbbErrorCorrectionLevelChange(Sender: TObject);
    procedure cmbEncodingChange(Sender: TObject);
    procedure cbbDrawingModeChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QRCodeClick(Sender: TObject);
    procedure Seriayanitovarbimanochirish1Click(Sender: TObject);
    procedure newExit(Sender: TObject);
    procedure newEnter(Sender: TObject);
    procedure hfio_DblClick(Sender: TObject);
    procedure Label48Click(Sender: TObject);
    procedure chekniochirish3Click(Sender: TObject);
    procedure kubExit(Sender: TObject);
    procedure jamiKeyPress(Sender: TObject; var Key: Char);
    procedure Label44DblClick(Sender: TObject);
    procedure sotExit(Sender: TObject);
  private
    FQRCode: TDelphiZXingQRCode;
    // to fix well-known Delphi 7 error with visually vanishing components
    // under Windows Vista, 7, and later
    FAltFixed: Boolean;
    procedure RemakeQR(s:string);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  kassa: Tkassa;rec:Integer;ed1,amal:string;
  Excel, Sheet, Range, Columns,Selection, Range_shapka,Range_telo,Range_itog,Range_all: Variant;
    CodStr: TStrings;Forward,qidir,almash,Wrap,Replace:olevariant;
implementation

uses QRGraphics, QR_Win1251, QR_URL,frxBarcode,comobj,fdms, fs_tovar, fulanish_k,  Math,Registry,Printers, StrUtils,fkassa_izoh_edit, fkassa_h_edit,
  fsetup, fs_haridor,ClipBrd, MaskUtils, fkassa_kv, fs_haridor_edit,IdMultipartFormData,ShellAPI;

{$R *.dfm}
function kasayatime(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateTimeToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure tkassa.RemakeQR(s:string);
// QR-code generation
begin
  with FQRCode do
  try
    BeginUpdate;
    Data := s;
    Encoding := cmbEncoding.ItemIndex;
    ErrorCorrectionOrdinal := TErrorCorrectionOrdinal
      (cbbErrorCorrectionLevel.ItemIndex);
    QuietZone := StrToIntDef(edtQuietZone.Text, 4);
    EndUpdate(True);
    lblQRMetrics.Caption := IntToStr(Columns) + 'x' + IntToStr(Rows) + ' (' +
      IntToStr(Columns - QuietZone * 2) + 'x' + IntToStr(Rows - QuietZone * 2) +
      ')';
  finally
    pbPreview.Repaint;
  end;
end;

function SumNumToFull(Number:real;s1,s2:string):string;
var PartNum, TruncNum, NumTMP, D: integer;NumStr : string;i, R : byte; Flag11 : boolean;
begin
  D:=1000000;R:=4;//�������� �����
  TruncNum:=Trunc(Number);
  if TruncNum<>0 then
    repeat
      PartNum:=TruncNum div D;Dec(R);D:=D div 1000;
    until PartNum<>0
  else R:=0;// ������� ������
  for i:=R downto 1 do
  begin
    Flag11:=False;
    // ��������� ����� �����
    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'��� ';
      2: NumStr:=NumStr+'������ ';
      3: NumStr:=NumStr+'������ ';
      4: NumStr:=NumStr+'��������� ';
      5: NumStr:=NumStr+'������� ';
      6: NumStr:=NumStr+'�������� ';
      7: NumStr:=NumStr+'������� ';
      8: NumStr:=NumStr+'��������� ';
      9: NumStr:=NumStr+'��������� ';
    end;
    // ��������� ����� ��������
    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'������ ';
          11: NumStr:=NumStr+'����������� ';
          12: NumStr:=NumStr+'���������� ';
          13: NumStr:=NumStr+'���������� ';
          14: NumStr:=NumStr+'������������ ';
          15: NumStr:=NumStr+'���������� ';
          16: NumStr:=NumStr+'����������� ';
          17: NumStr:=NumStr+'���������� ';
          18: NumStr:=NumStr+'������������ ';
          19: NumStr:=NumStr+'������������ ';
        end;
        case i of
          3: NumStr:=NumStr+'��������� ';
          2: NumStr:=NumStr+'����� ';
          1: NumStr:=NumStr+' ';
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'�������� ';
      3: NumStr:=NumStr+'�������� ';
      4: NumStr:=NumStr+'����� ';
      5: NumStr:=NumStr+'��������� ';
      6: NumStr:=NumStr+'���������� ';
      7: NumStr:=NumStr+'��������� ';
      8: NumStr:=NumStr+'����������� ';
      9: NumStr:=NumStr+'��������� ';
    end;
    // ��������� ����� ������
    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:if i=2 then NumStr:=NumStr+'���� ' else NumStr:=NumStr+'���� ';
        2:if i=2 then NumStr:=NumStr+'��� '  else NumStr:=NumStr+'��� ';
        3: NumStr:=NumStr+'��� ';
        4: NumStr:=NumStr+'������ ';
        5: NumStr:=NumStr+'���� ';
        6: NumStr:=NumStr+'����� ';
        7: NumStr:=NumStr+'���� ';
        8: NumStr:=NumStr+'������ ';
        9: NumStr:=NumStr+'������ ';
      end;
      case i of
        3:case NumTMP of
            1: NumStr:=NumStr+'������� ';
            2,3,4: NumStr:=NumStr+'�������� ';
            else NumStr:=NumStr+'��������� ';
          end;
        2:case NumTMP of
            1 : NumStr:=NumStr+'������ ';
            2,3,4: NumStr:=NumStr+'������ ';
            else
              if PartNum<>0 then NumStr:=NumStr+'����� ';
          end;
        1:case NumTMP of
            1 : NumStr:=NumStr;// +s1+' '
            2,3,4: NumStr:=NumStr;// +s1+' '
            else NumStr:=NumStr;// +s1+' '
          end;
      end;
    end;
    if i>1 then begin
      PartNum:=(TruncNum mod (D*1000)) div D;D:=D div 1000;
    end;
  end;
  NumStr:=TrimRight(NumStr)+' '+s1+' ';
  //������� ������
  PartNum:=Round(Frac(Number)*100);
  if PartNum=0 then
  begin
    SumNumToFull:=NumStr+'00 '+s2;Exit;
  end;// ��������� ����� ��������
  NumTMP:=PartNum div 10;
  if NumTMP=0 then NumStr:=NumStr+'0'+IntToStr(PartNum)+' '
  else NumStr:=NumStr+IntToStr(PartNum)+' ';
  // ��������� ����� ������
  NumTMP:=PartNum mod 10;
  case NumTMP of
    1:if PartNum<>11 then  NumStr:=NumStr+s2
      else NumStr:=NumStr+s2;
    2,3,4:
      if (PartNum<5) or (PartNum>14) then NumStr:=NumStr+s2
      else NumStr:=NumStr+s2;
    else NumStr:=NumStr+s2;
  end;
  NumStr:=AnsiUpperCase(copy(NumStr,1,1))+copy(NumStr,2,length(NumStr)-1);
  SumNumToFull:=NumStr;
end;
function RoundLess(Value, Divider: Integer): Integer;
var s:string;
begin
  s:=inttostr(value);
  //s:=copy(s,1,length(s)-3)+'000';
  s:=copy(s,1,length(s)-2)+'00';

  //s:=copy(s,1,length(s)-2)+'00';

  Result:=strtoint(s);
end;
function Round_zzz(Value, Divider: Integer): Integer;
var s:string;
begin
  s:=inttostr(value);
  s:=copy(s,1,length(s)-3)+'000';
  Result:=strtoint(s);
end;

procedure izm(nima,sabab:string;vid:Integer;old_value:String;old_sana:TDateTime;new_value:string;subid:integer);
begin
  dms.protizm.insert;dms.protizm.fieldbyname('vid').AsInteger:=vid;
  dms.protizm.fieldbyname('new_value').AsString:=new_value;
  dms.protizm.fieldbyname('old_changedate').AsDateTime:=old_sana;
  dms.protizm.fieldbyname('new_changedate').AsDateTime:=Now;
  dms.protizm.fieldbyname('old_value').AsString:=old_Value;
  dms.protizm.fieldbyname('subid').AsInteger:=subid;
  dms.protizm.fieldbyname('nima').AsString:=nima;
  dms.protizm.fieldbyname('sabab').AsString:=sabab;
  dms.protizm.Post;
end;
procedure pl_updute;
begin
  exit;
  if dms.asospl_id.AsInteger>0 then begin
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select sum(sum_naqd_ch) as kassa,sum(qarz_summa) as qarz from asos where del_flag=1 and pl_id='+dms.asospl_id.AsString+' group by pl_id');
    dms.main_link.Open;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update pl set sena_pl= '+FloatToStr(dms.main_link.fieldbyname('kassa').asfloat-dms.main_link.fieldbyname('qarz').asfloat)+',ost_pl='+FloatToStr(dms.main_link.fieldbyname('kassa').asfloat-dms.main_link.fieldbyname('qarz').asfloat)+' where id='+dms.asospl_id.AsString);
    dms.link.ExecSQL;
  end;
  if dms.asosplastik_id.AsInteger>0 then begin
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select sum(sum_plast_ch) as kassa from asos where del_flag=1 and plastik_id='+dms.asosplastik_id.AsString+' group by plastik_id');
    dms.main_link.Open;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update pl set sena_pl= '+FloatToStr(dms.main_link.fieldbyname('kassa').asfloat)+',ost_pl='+FloatToStr(dms.main_link.fieldbyname('kassa').asfloat)+' where id='+dms.asosplastik_id.AsString);
    dms.link.ExecSQL;
  end;
  kassa.tpl.Refresh;
end;
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;
    Result := '''' + ResultStr + ''''; end else Result := '';
end;
procedure shalonlar;
var F: TSearchRec;mydir, Path: string; IniFile:TIniFile;
begin
  kassa.chekshablon.Items.Clear;kassa.yorliqshablon.Items.Clear;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  kassa.chekshablon.Text := IniFile.ReadString('BAZA','shablonchek','chek58.fr3');
  kassa.a4shablon.Text := IniFile.ReadString('BAZA','shablona4','chekla4.fr3');
  kassa.yorliqshablon.Text := IniFile.ReadString('BAZA','shablonyorliq','');IniFile.Free;
  MyDir := ExtractFilePath(Application.ExeName);
  if FindFirst(Path + '*.fr3*', faAnyFile, F) = 0 then begin
    repeat
    if (F.Attr <> faDirectory) then begin
      kassa.a4shablon.items.Add(F.Name);
      kassa.chekshablon.items.Add(F.Name);kassa.yorliqshablon.items.Add(F.Name);
    end;
    until FindNext(F) <> 0;FindClose(F);
   end;
end;
//���������� � ���������� ��������� �������
function Translate(Text : string;Lang:string;Dict:TIniFile):string;
var s : string;
begin
 Result:=Text;if Text='' then exit;
 S:=Dict.ReadString(Lang, Text, '');
 if (S='') then Dict.WriteString(Lang, Text, '');if (S<>'') then Result:=S; if (S='~') then Result:='';
end;
procedure TranslateForm(Form : TForm; Lang : string; DictFileName : string);
var Dict : TIniFile;I,J : Integer;Obj:TObject;
begin
 Dict:=TIniFile.Create(DictFileName);
 Form.Caption:=Translate(Form.Name, Lang, Dict);
 For I:=0 to Form.ComponentCount-1 do
 Begin
 Obj:=Form.Components[i];
 if Obj is TRzTabSheet then TRzTabSheet(Obj).Caption:=Translate(TRzTabSheet(Obj).name, Lang, Dict);
 //if Obj is TRzRadioGroup then TRzRadioGroup(Obj).Caption:=Translate(TGroupBox(Obj).name, Lang, Dict);
 if Obj is TGroupBox then TGroupBox(Obj).Caption:=Translate(TGroupBox(Obj).name, Lang, Dict);
 if Obj is TRzGroupBox then TRzGroupBox(Obj).Caption:=Translate(TRzGroupBox(Obj).name, Lang, Dict);
  //if Obj is TRzLabel then TRzLabel(Obj).Caption:=Translate(TRzLabel(Obj).name, Lang, Dict);
 if Obj is TDBGridEh then begin for j:=0 to TDBGridEh(Obj).Columns.Count-1 do TDBGridEh(Obj).Columns[j].Title.Caption:=Translate(TDBGridEh(Obj).Name+TDBGridEh(Obj).Columns[j].FieldName, Lang, Dict);end;
 if Obj is TLabel then TLabel(Obj).Caption:=Translate(TLabel(Obj).name, Lang, Dict);
 if Obj is TRzBitBtn then begin TRzBitBtn(Obj).Caption:=Translate(TRzBitBtn(Obj).name, Lang, Dict);
           TRzBitBtn(Obj).hint:=Translate(TRzBitBtn(Obj).name+'hint', Lang, Dict);end;
if Obj is TMenuItem then begin
 TMenuItem(Obj).Caption:=Translate(TMenuItem(Obj).name, Lang, Dict);
 TMenuItem(Obj).Hint:=Translate(TMenuItem(Obj).name+'Hint', Lang, Dict);end;
 end;
end;

function EngToRus(const s: string): string;
var reS: string;
i,e: integer;
begin
if s = '' then Exit;
reS:=s;
for i:=1 to Length(Res) do
for e:=1 to Length(EngLet) do
if reS[i]=EngLet[e] then
reS[i]:=RusLet[e];
result:=reS;
end;

//���������� � ������� ��������� ����������
function RusToEng(const s: string): string;
var reS: string;
i,e: integer;
begin
if s = '' then Exit;
reS:=s;
for i:=1 to Length(Res) do
for e:=1 to Length(RusLet) do
if reS[i]=RusLet[e] then
reS[i]:=EngLet[e];
result:=reS;
end;
function StrReplace(const Str, Str1, Str2: string): string;
var P,L: Integer;
begin
  Result := str;L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ���� ���������
    if P > 0 then
    begin
      Delete(Result, P, L); // ������� ��
      Insert(Str2, Result, P); // ��������� �����
    end;
  until P = 0;
end;
function _IntToStr(i, Wide: Cardinal): string;
var
  i1: Cardinal;
begin
  Result := '';
  repeat
    i1 := i mod 10;
    i := i div 10;
    Result := char(i1 + ord('0')) + Result;
    dec(Wide);
  until (Wide < 1) and (i < 1)
end;
function GetCharFromVirtualKey(Key: Word): string;
var
   keyboardState: TKeyboardState;
   asciiResult: Integer;
begin
   GetKeyboardState(keyboardState) ;

   SetLength(Result, 2) ;
   asciiResult := ToAscii(key, MapVirtualKey(key, 0),
       keyboardState, @Result[1], 0) ;
   case asciiResult of
     0: Result := '';
     1: SetLength(Result, 1) ;
     2:;
     else
       Result := '';
   end;
end;
procedure ExcelFormatRange(RangeFormat: Variant;Font: string;Size: Byte;AutoFit,jir,perenos: Boolean);
begin
  RangeFormat.Font.Name := Font;RangeFormat.Font.Size := Size;
  RangeFormat.Font.Bold := jir;RangeFormat.WrapText := perenos;
  //if fdm.s_otchet.FieldByName('pokaz_info').AsBoolean then RangeFormat.Columns.AutoFit;
end;
procedure ExceltFormatRange(RangeFormat: Variant;Font: string;Size: Byte;AutoFit,perenos: Boolean);
begin
  RangeFormat.Font.Name := Font;RangeFormat.Font.Size := Size;
  RangeFormat.WrapText := perenos;
  //if fdm.s_otchet.FieldByName('pokaz_info').AsBoolean then RangeFormat.Columns.AutoFit;
end;
procedure ExcelRangeBorders(RangeBorders: Variant; BOutSideSize: Byte; BInsideSize: Byte; BOutSideVerticalLeft: Boolean; BOutSideVerticalRight: Boolean; BInSideVertical: Boolean; BOutSideHorizUp: Boolean; BOutSideHorizDown: Boolean; BInSideHoriz: Boolean);
begin
  if BOutSideVerticalLeft then begin RangeBorders.Borders[7].LineStyle := 1;RangeBorders.Borders[7].Weight := BOutSideSize;RangeBorders.Borders[7].ColorIndex := -4105;end;
  if BOutSideHorizUp then begin RangeBorders.Borders[8].LineStyle := 1;RangeBorders.Borders[8].Weight := BOutSideSize;RangeBorders.Borders[8].ColorIndex := -4105;end;
  if BOutSideHorizDown then begin RangeBorders.Borders[9].LineStyle := 1;RangeBorders.Borders[9].Weight := BOutSideSize;RangeBorders.Borders[9].ColorIndex := -4105;end;
  if BOutSideVerticalRight then begin RangeBorders.Borders[10].LineStyle := 1;RangeBorders.Borders[10].Weight := BOutSideSize;RangeBorders.Borders[10].ColorIndex := -4105; end;
  if BInSideVertical then begin RangeBorders.Borders[11].LineStyle := 1;RangeBorders.Borders[11].Weight := BInSideSize;RangeBorders.Borders[11].ColorIndex := -4105;end;
  if BInsideHoriz then begin RangeBorders.Borders[12].LineStyle := 1;RangeBorders.Borders[12].Weight := BInSideSize;RangeBorders.Borders[12].ColorIndex := -4105;end;
end;
procedure ExcelCreateApplication(FirstSheetName: string; SheetCount,orient: Integer;ExcelVisible: Boolean);
begin
  try Excel := CreateOleObject('Excel.Application');
    Excel.Application.EnableEvents := False;Excel.SheetsInNewWorkbook := SheetCount;Excel.Visible := ExcelVisible;
    Excel.WorkBooks.Add;Sheet := Excel.WorkBooks[1].Sheets[1];Sheet.Name := FirstSheetName;
    Excel.Application.ErrorCheckingOptions.EvaluateToError := False;Excel.Application.ErrorCheckingOptions.EvaluateToError := False;
    Excel.Application.ErrorCheckingOptions.TextDate := False;Excel.Application.ErrorCheckingOptions.NumberAsText := False;
    sheet.pagesetup.orientation:=orient;sheet.pagesetup.leftmargin:=30;sheet.pagesetup.rightmargin:=0;sheet.pagesetup.topmargin:=20;sheet.pagesetup.bottommargin:=20;
    sheet.pagesetup.headermargin:=2;sheet.pagesetup.footermargin:=2;  excel.Application.StandardFontSize := 11;
  except Exception.Create('������.  Excel �� ����������� !!! ');Excel := UnAssigned;
  end;
end;

procedure yangi;

begin
  
end;
procedure yangi3;
begin

end;
procedure yangi_return;
begin
  
end;



function lat_kril(asos:String):String;
var i:Integer;nom_lat,nom_kril,s:String;lat:boolean;
begin
 nom_lat:=asos;nom_kril:=asos;
  lat:=False;
  for i:=1 to Length(asos) do
  if (asos[i] in ['a' .. 'z']) or (asos[i] in ['A' .. 'Z']) then
    begin
      lat:=true;
      Break;
    end;
  if lat=True then
    begin
      for i:=1 to 60 do nom_kril:=StrReplace(nom_kril,harf_lat[i],harf_kril[i]);
      s:=nom_kril;
    end
  else
    begin
      for i:=1 to 60 do nom_lat:=StrReplace(nom_lat,harf_kril[i],harf_lat[i]);
      s:=nom_lat;
    end;
  Result:=s;
end;
procedure Tkassa.f5Click(Sender: TObject);
var s,s_old,ss,stel,telsms:string;kol:integer;f,d,danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;
begin
  if dms.asossumma.AsFloat < dms.asosqarz_summa.AsFloat then begin
    ShowMessage('Qarz summa umumiy summadan katta bo`lish mumkin emas !!!');exit;
  end;
  if dms.main_link.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');kub.SetFocus;exit;end;
  try
    if dms.asossana.AsDateTime>StrToDate('25.12.2026') then begin
      ShowMessage('sana kiritilmagan');exit;
    end;
  except
  end;
  dms.asos.Edit;dms.asosprint_flag.AsFloat:=0;
  DMS.setup.Refresh;
  dms.asossana.AsDateTime:=StrToDate(datetostr(DMS.setupvaqt.AsDateTime));
  dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
  dms.asosxodim_id.Asinteger:=StrToInt(admin_id);

  if ((dms.asosdiler_id.AsInteger=1)) or (dms.asos.State=dsInsert) or (dms.asosdiler_id.AsInteger=0) or (dms.asosdiler_id.AsInteger=-1) then begin
    dms.link.Close;dms.link.sql.Clear;
    if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
      dms.asosdiler_id.AsInteger:=1;
      dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
    end
    else begin
      dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
      dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;
  end;
  dms.asos.Post;
  if dms.asosh_id.AsInteger>0 then
  begin
    haridor_id:=dms.asosh_id.AsString;
    DMS.user.Edit;
    DMS.user.FieldByName('last_h').AsString:=dms.asosh_id.AsString;
    DMS.user.post;
  end;
  dms.s_client.Refresh;
  dms.link.Close;dms.link.sql.Clear;
  dms.link.sql.Add('select s.opt2,s.id,srok,t.nom as s_tovar,t.kol_in as tkol_in,sum(s.kol) as kol,sum(s.kol_in) as kol_in,s.sotish,s.sotish_d,s.sotish_in,s.sotish_in_d from asos_slave s,s_tovar t where t.id=s.tovar_id and s.del_flag=1 and  s.asos_id='+dms.asosid.AsString+' group by tovar_id,s.sotish order by id');
  dms.link.open;

  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
  frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,4)+'''';

  s:=StringReplace(dms.s_clientnom.AsString,'"','^',[rfReplaceAll]);
  s:=StringReplace(s,'"','^',[rfReplaceAll]);
 if DMS.asosh_id.AsInteger>0 then begin
    stel:='';
    DateSeparator := '-';ShortDateFormat := 'yyyy-mm-dd';
    if length(DMS.s_haridortelsms1.AsString)=9 then begin
      stel:='+998'+DMS.s_haridortelsms1.AsString;
      mlink.Close;mlink.sql.Clear;
      mlink.sql.Add('INSERT INTO prot_sms (id,zapros,rezult,sana,tel,flag,platforma,employee_phone) VALUES (NULL, "'+s+' : '+''+'", "chek", "'+DateTimeToStr(now)+'", "'+stel+'", 1,"chek", "+998'+dms.s_clienttelsms1.AsString+'")');
      mlink.ExecSQL;
    end;
    DateSeparator := '.';ShortDateFormat := 'dd.mm.yy';
  end; // h_id


  //Label48Click(sender);
  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.ShowDialog := false;
  frxsf.Height := 100;
  frxsf.ShowReport;
  frxsf.Print;
  Label44DblClick(Sender);
  dms.asos.Close;dms.asos.SQL.Clear;
  //dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'" order by id desc');
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
  dms.asos.open;
  if (not dms.asos.Locate('diler_id',0,[loCaseInsensitive])) then begin
    dms.asos.Append;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;
  end;
  varaqClick(Sender);
  nom_.Text:='';tel_.Text:='';
  nom_.Enabled:=true;tel_.Enabled:=true;
  nom_.SetFocus;
end;

procedure Tkassa.kolKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tkassa.MenuItem2Click(Sender: TObject);
var k,k_in,i:integer;var c:Char;
begin
  //Memo2.Visible:=True;
  Memo2.Clear;
  DMS.s_tovar.Refresh;
  Memo2.Lines.Add('DMS.s_tovar.Refresh');
  if dms.asos_slave.RecordCount=0 then exit;
  if MessageDlg(dms.asos_slaves_tovar.AsString+' -  tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    main.First;
    while not main.eof do begin
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('update slave_main set kirim_id = null where id='+main.fieldbyname('kirim_id').AsString);
      dms.link.ExecSQL;
      main.next;
    end;
    Memo2.Lines.Add('w1');

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update slave_main set del_flag=0 where slave_id='+DMS.asos_slaveid.AsString);
    dms.link.ExecSQL;
    Memo2.Lines.Add('update');

    //if dms.asos_slavekol.AsInteger+dms.asos_slavekol_in.AsInteger>0 then
    //shtrix.Text:='0,0';
    //c:=#13;
    //if dms.asos_slavekol.AsInteger+dms.asos_slavekol_in.AsInteger>0 then
    //shtrixKeyPress(Sender,c);

    Memo2.Lines.Add('minus');

    dms.asos_slave.edit;
    dms.asos_slavedel_flag.AsInteger:=0;
    dms.asos_slave.post;
    Memo2.Lines.Add('del');

    t_id.Text:=dms.asos_slavetovar_id.AsString;
    rec:=dms.asos_slaveid.AsInteger;
    dms.asos_slave.refresh;
  end;
end;

procedure Tkassa.MenuItem1Click(Sender: TObject);
var s3:string;
begin
  DMS.asos_slave.First;
  while  not DMS.asos_slave.Eof do begin
    qoldiq.Close;qoldiq.SQL.Clear;
    if dms.asostur_oper.AsInteger=2 then
      qoldiq.SQL.Add('SELECT *,sum(kol) as kol_ost,sum(kol_in) as kol_in_ost,sum(kol_all) as kol_all_ost from ombor GROUP by nom order by nom desc limit 30' )
    else
      qoldiq.SQL.Add('select a.*,a.sotish as sot,a.sotish_in as sot_in,asos.sana as sana,asos.dollar as dollar from asos_slave a,asos WHERE asos.id=a.asos_id and a.del_flag=1 and a.id = '+DMS.asos_slaveid.AsString);
    qoldiq.open;
    if dms.asos_slavesumma.AsFloat<>dms.asos_slavekol.AsInteger*dms.asos_slavesotish.AsFloat then
      ShowMessage('Summa hato');
    if (DMS.asos_slavekol_in.AsFloat>0) and (dms.asos_slavesumma_in.AsFloat<>dms.asos_slavekol_in.AsInteger*dms.asos_slavesotish_in.AsFloat) then
      ShowMessage('summa in hato');
    if dms.asos_slavesumma_all.AsFloat<>dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat then
      ShowMessage('Jami hato');
    DMS.asos_slave.Next;
  end;

  exit;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
  frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  frxsf.DesignReport;
end;

procedure Tkassa.Ekrandakorish2Click(Sender: TObject);
var s,s_old:string;danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;
begin
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
  dms.link.Close;dms.link.sql.Clear;
  dms.link.sql.Add('select s.id,s.opt2,srok,t.nom as s_tovar,t.kol_in as tkol_in,sum(s.kol) as kol,sum(s.kol_in) as kol_in,s.sotish,s.sotish_in,s.sotish_d,s.sotish_in_d from asos_slave s,s_tovar t where t.id=s.tovar_id and s.del_flag=1 and  s.asos_id='+dms.asosid.AsString+' group by tovar_id,s.sotish  order by id');
  dms.link.open;
  if DMS.asosdiler_id.AsInteger=-1 then s:='___' else s:=_IntToStr(DMS.asosdiler_id.AsInteger,5);
  frxsf.Variables['nnn']:=''''+s+'''';

  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.ShowDialog := false;frxsf.ShowReport;
end;

procedure Tkassa.FormActivate(Sender: TObject);
var IniFile:TIniFile;
begin
    //ShowMessage(dms.asos.SQL.Text);
  if dms.asos.RecordCount=0 then begin
    dms.asos.Append;dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;
    dms.asos.Refresh;
  end;
  {if DMS.s_clientdollar.AsInteger=2 then begin
    kassa.valyuta.ItemIndex:=1;kassa.valyuta.Visible:=false;
  end;}

  kat.Open;
  if dms.s_clientgaraj_turi.Value=1 then kassa.varaq.Pages[6].TabVisible:=true else kassa.varaq.Pages[6].TabVisible:=false;

  if dms.s_clientdollar.AsInteger=0 then begin
    Lkonv.Visible:=false;konv.Visible:=false;
    Lkurs.Visible:=false;kurs.Visible:=false;
    Lsena_d.Visible:=false;sena_d.Visible:=false;

  end;
  if dms.s_clientkomputer.Value=1 then
  kassa.varaq.Pages[7].TabVisible:=true else kassa.varaq.Pages[7].TabVisible:=false;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select *,id as tovar_id from s_tovar WHERE del_flag=1');
  dms.s_tovar.open;
  dms.asos_slave.Refresh;
  if dms.protizm.Active=false then dms.protizm.Open;
  kassa_h_edit.oraliq.Open;
  //kassa_h_edit.lbd_pl.Open;

  
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  chekPrinters.Text := IniFile.ReadString('BAZA','printerchek','');
  tpechat.Enabled:=True;
  IniFile.Destroy;
  //if dms.asos.RecordCount>1 then gasos.Visible:=true else gasos.Visible:=false;
  nom_.Enabled:=true;
  nom_.SetFocus;
  varaqClick(Sender);
end;

procedure Tkassa.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;

end;

procedure Tkassa.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;

end;

procedure Tkassa.FormCreate(Sender: TObject);
var IniFile:TIniFile;H: Integer;
begin
  FQRCode := nil; CodStr := TStringList.Create;
  // number edit
  SetWindowLong(edtQuietZone.Handle, GWL_STYLE,GetWindowLong(edtQuietZone.Handle, GWL_STYLE) or ES_NUMBER);
  //edtQuietZone.Text:='2';
  SetWindowLong(edtCornerThickness.Handle, GWL_STYLE,GetWindowLong(edtCornerThickness.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(edtScaleToSave.Handle, GWL_STYLE,GetWindowLong(edtScaleToSave.Handle, GWL_STYLE) or ES_NUMBER);

  with cmbEncoding do
  begin
    H := ItemHeight;
    Style := csOwnerDrawVariable;
    ItemHeight := H;
    OnChange := nil;
    ItemIndex := 0;
    OnChange := cmbEncodingChange
  end;
  with cbbErrorCorrectionLevel do
  begin
    OnChange := nil;
    ItemIndex := 0;
    OnChange := cbbErrorCorrectionLevelChange
  end;
  with cbbDrawingMode do
  begin
    OnChange := nil;
    ItemIndex := 0;
    OnChange := cbbDrawingModeChange
  end;
  // create and prepare QRCode component
  FQRCode := TDelphiZXingQRCode.Create;
  FQRCode.RegisterEncoder(ENCODING_WIN1251, TWin1251Encoder);
  FQRCode.RegisterEncoder(ENCODING_URL, TURLEncoder);


  jami.DisplayFormat := ',0.00'; // ???????: 1 250.50
 data1.Value:=Date();data2.Value:=Date();
  ed1:='';
  cbPrinters.Items.Assign(Printer.Printers);
  cbPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  chekPrinters.Items.Assign(Printer.Printers);
  chekPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  a4Printers.Items.Assign(Printer.Printers);
  a4Printers.Text := Printer.Printers[Printer.PrinterIndex];
  yorliqPrinters.Items.Assign(Printer.Printers);
  yorliqPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  // Update the label to reflect the default printer
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  chekPrinters.Text := IniFile.ReadString('BAZA','printerchek','');
  a4Printers.Text := IniFile.ReadString('BAZA','printera4','');
  yorliqPrinters.Text := IniFile.ReadString('BAZA','printeryorliq','');
  chekshablon.Text := IniFile.ReadString('BAZA','shablonchek','chek58.fr3');
  a4shablon.Text := IniFile.ReadString('BAZA','shablona4','chekla4.fr3');
  yorliqshablon.Text := IniFile.ReadString('BAZA','yorliqshablon','');IniFile.Free;
  shalonlar;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;
end;

procedure Tkassa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ulanish_k.protinout.Enabled:=false;DMS.setup.Refresh;
  if DMS.protinout.Active then
  begin
  DMS.protinout.edit;
  DMS.protinout.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').AsVariant;
  DMS.protinout.FieldByName('flag').Value:=0;
  DMS.protinout.post;
  end;
      dms.s_user.Edit;
      DMS.s_user.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').Value;
      DMS.s_user.FieldByName('flag').Value:=0;
      dms.s_user.post;

  ulanish_k.Close;
  ShowWindow(Application.Handle, SW_RESTORE);

end;

procedure Tkassa.varaqClick(Sender: TObject);
var m: TRegistry;l: TstringList;s,s3: string;i:integer;
begin
  case varaq.ActivePageIndex of
  10:begin // xarajat
    DMS.lbd_pl.close;DMS.lbd_pl.SQL.Clear;
    DMS.lbd_pl.sql.add('SELECT * FROM pl where del_flag=1 and vid in (1,4,7,9,19) order by d_pl desc');
    DMS.lbd_pl.Open;

    if filtr_haridor.value=null then begin
      tpl.Close;tpl.SQL.Clear;
      tpl.SQL.Add('select * from pl WHERE del_flag=1 and (bank_id=0 or vid = 19) order by d_pl desc ');
      tpl.open;
    end
    else
    begin
      tpl.Close;tpl.SQL.Clear;
      tpl.SQL.Add('select * from pl WHERE del_flag=1 and bank_id=0 and h_id='+inttostr(filtr_haridor.value)+' order by d_pl desc ');
      tpl.open;
    end;
    if DMS.s_diler.Active=false then DMS.s_diler.open;
    if DMS.oraliqpl.Active=false then DMS.oraliqpl.open;

    DMS.s_pl.close;DMS.s_pl.SQL.Clear;
    DMS.s_pl.sql.add('SELECT * FROM s_pl where id = 19 or bank_id=0');
    DMS.s_pl.Open;

    DMS.s_tur_oper.close;DMS.s_tur_oper.SQL.Clear;
    DMS.s_tur_oper.sql.add('SELECT * FROM s_tur_oper where id>10');
    DMS.s_tur_oper.Open;
    DMS.s_x_tur.Open;
    sena_plEnter(Sender);
    //shtrix.SetFocus;
  end;
  0:begin // asosiy
    dms.s_haridor.Refresh;  DMS.s_tovar.Refresh;DMS.shtrix.Refresh;
    if dms.asos.State=dsEdit then dms.asos.Post;if dms.asos.State=dsinsert then dms.asos.Post;
    dms.asos.Close;
    dms.asos.SQL.Clear;
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper in (2,3) and diler_id=0 and client_id='+admin_clid+'  and xodim_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by diler_id desc');
    dms.asos.open;
    if (dms.asossana.AsDateTime<Date) and (dms.asos_slave.RecordCount=0) then begin
      dms.asos.Edit;dms.asossana.AsDateTime:=Date;dms.asos.Post;dms.asos.Refresh;
    end;
    if dms.asos.RecordCount=0 then begin
      dms.asos.Append;dms.asostur_oper.AsInteger:=2;dms.asos.Post;dms.asos.Refresh;
    end;
    tpl.Close;tpl.SQL.Clear;
    tpl.SQL.Add('select * from pl WHERE del_flag=1 and vid <> 1 order by d_pl desc ');
    tpl.open;
    DMS.s_tovar.Refresh;
    dms.asos.First;
    //if dms.asosdollar.value=1 then valyuta.Visible:=true else valyuta.Visible:=false;
    {if dms.asosdollar.value=0 then valyuta.ItemIndex:=0;
    if dms.asosdollar.value=2 then valyuta.ItemIndex:=1;
    if dms.asosdollar.value=1 then valyuta.ItemIndex:=2;}
    varaqf6.Pages[0].TabVisible:=false;
    varaqf6.Pages[1].tabVisible:=false;varaqf6.Pages[2].tabVisible:=false;varaqf6.Pages[3].tabVisible:=false;varaqf6.Pages[4].tabVisible:=false;
    varaqf6.Pages[5].tabVisible:=false;varaqf6.Pages[6].tabVisible:=false;varaqf6.Pages[7].tabVisible:=false;varaqf6.Pages[8].tabVisible:=false;varaqf6.Pages[9].tabVisible:=false;
    varaqf6.Pages[10].tabVisible:=false;varaqf6.Pages[11].tabVisible:=false;varaqf6.Pages[12].tabVisible:=false;varaqf6.Pages[13].tabVisible:=false;varaqf6.Pages[14].tabVisible:=false;
    varaqf6.Pages[15].tabVisible:=false;varaqf6.Pages[16].tabVisible:=false;varaqf6.Pages[17].tabVisible:=false;varaqf6.Pages[18].tabVisible:=false;varaqf6.Pages[19].tabVisible:=false;
    varaqf6.Pages[20].tabVisible:=false;varaqf6.Pages[21].tabVisible:=false;varaqf6.Pages[22].tabVisible:=false;varaqf6.Pages[23].tabVisible:=false;varaqf6.Pages[24].tabVisible:=false;
    varaqf6.Pages[25].tabVisible:=false;varaqf6.Pages[26].tabVisible:=false;varaqf6.Pages[27].tabVisible:=false;varaqf6.Pages[28].tabVisible:=false;varaqf6.Pages[29].tabVisible:=false;
    varaqf6.Pages[30].tabVisible:=false;varaqf6.Pages[31].tabVisible:=false;varaqf6.Pages[32].tabVisible:=false;varaqf6.Pages[33].tabVisible:=false;varaqf6.Pages[34].tabVisible:=false;
    varaqf6.Pages[35].tabVisible:=false;varaqf6.Pages[36].tabVisible:=false;varaqf6.Pages[37].tabVisible:=false;varaqf6.Pages[38].tabVisible:=false;varaqf6.Pages[39].tabVisible:=false;
    varaqf6.Pages[0].Color:=$00B4E6F0;varaqf6.Pages[1].Color:=$00B4E6F0;varaqf6.Pages[2].Color:=$00B4E6F0;varaqf6.Pages[3].Color:=$00B4E6F0;varaqf6.Pages[4].Color:=$00B4E6F0;
    varaqf6.Pages[5].Color:=$00B4E6F0;varaqf6.Pages[6].Color:=$00B4E6F0;varaqf6.Pages[7].Color:=$00B4E6F0;varaqf6.Pages[8].Color:=$00B4E6F0;varaqf6.Pages[9].Color:=$00B4E6F0;
    varaqf6.Pages[10].Color:=$00B4E6F0;varaqf6.Pages[11].Color:=$00B4E6F0;varaqf6.Pages[12].Color:=$00B4E6F0;varaqf6.Pages[13].Color:=$00B4E6F0;varaqf6.Pages[14].Color:=$00B4E6F0;
    varaqf6.Pages[15].Color:=$00B4E6F0;varaqf6.Pages[16].Color:=$00B4E6F0;varaqf6.Pages[17].Color:=$00B4E6F0;varaqf6.Pages[18].Color:=$00B4E6F0;varaqf6.Pages[19].Color:=$00B4E6F0;
    varaqf6.Pages[20].Color:=$00B4E6F0;varaqf6.Pages[21].Color:=$00B4E6F0;varaqf6.Pages[22].Color:=$00B4E6F0;varaqf6.Pages[23].Color:=$00B4E6F0;varaqf6.Pages[24].Color:=$00B4E6F0;
    varaqf6.Pages[25].Color:=$00B4E6F0;varaqf6.Pages[26].Color:=$00B4E6F0;varaqf6.Pages[27].Color:=$00B4E6F0;varaqf6.Pages[28].Color:=$00B4E6F0;varaqf6.Pages[29].Color:=$00B4E6F0;
    varaqf6.Pages[30].Color:=$00B4E6F0;varaqf6.Pages[31].Color:=$00B4E6F0;varaqf6.Pages[32].Color:=$00B4E6F0;varaqf6.Pages[33].Color:=$00B4E6F0;varaqf6.Pages[34].Color:=$00B4E6F0;
    varaqf6.Pages[35].Color:=$00B4E6F0;varaqf6.Pages[36].Color:=$00B4E6F0;varaqf6.Pages[37].Color:=$00B4E6F0;varaqf6.Pages[38].Color:=$00B4E6F0;varaqf6.Pages[39].Color:=$00B4E6F0;
    while not dms.asos.eof do begin
      if dms.asos.RecNo=1 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=2 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=3 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=4 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=5 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=6 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=7 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=8 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=9 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=10 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=11 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=12 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=13 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=14 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=15 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=16 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=17 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=18 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=19 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=20 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=20 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=21 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=22 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=23 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=24 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=25 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=26 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=27 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=28 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=29 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=30 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=30 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=31 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=32 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=33 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=34 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=35 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=36 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=37 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=38 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=39 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=40 then begin varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asosid.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;end;
      if dms.asos.RecNo=dms.asos.RecordCount then begin
        //varaqf6.Pages[dms.asos.RecNo-1].Color:=clLime;
        varaqf6.Pages[dms.asos.RecNo].Caption:=' + ';
        varaqf6.Pages[dms.asos.RecNo].tabVisible:=true;end;
      dms.asos.Next;
    end;
  dms.asos.First;
  //varaqf6.Pages[dms.asos.RecNo-1].Font.color:=clRed;
  varaqf6.ActivePageIndex:=dms.asos.RecNo-1;
  //tur.ItemIndex:=dms.asossotuv_turi.AsInteger-1;
    qoldiq.Close;qoldiq.SQL.Clear;
    kassa.qoldiq.SQL.Add('SELECT *,sum(kol) as kol_ost,sum(kol_in) as kol_in_ost,sum(kol_all) as kol_all_ost from ombor where tovar_id=1');
    qoldiq.open;
    dms.s_haridor.Close;dms.s_haridor.sql.Clear;
    dms.s_haridor.SQL.Add(' SELECT * FROM s_haridor where del_flag=1 and client_id = :id order by nom');
    dms.s_haridor.open;
    poisk_h.Text:='';
    Label48Click(Sender);
    nom_.Enabled:=true;tel_.Enabled:=true;
    sot.Value:=kassa.qoldiq.fieldbyname('sotish').AsFloat;
  end;
  1:begin // x - hisobot
      dms.x_otchet.Close;dms.x_otchet.SQL.Clear; // xodimlar bo`yicha
      dms.x_otchet.SQL.Add('select a.sana,x.fio as xodimnom,count(a.id) as qator,sum(a.summa) as jami,sum(a.sum_naqd) as jami_naqd,sum(a.sum_plastik) as jami_plastir,sum(a.cheg_n) as jami_cheg_n,sum(a.cheg_p) as jami_cheg_p ');
      dms.x_otchet.SQL.Add('from asos a,user x WHERE a.user_id = '+admin_id+' and a.changedate is not null and x.id=a.user_id and a.del_flag=1 and a.sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'"' );
      //a.user_id = '+admin_id+'
      dms.x_otchet.SQL.Add(' group by x.fio order by x.fio ');
      dms.x_otchet.open;
      dms.asos.Close;dms.asos.SQL.Clear;
      dms.asos.SQL.Add('select * from asos where xodim_id = '+admin_id+' and changedate is not null and del_flag=1 and tur_oper in (2,3) and diler_id>0 and client_id='+admin_clid+' and not (pl_id is not Null or plastik_id is not Null) ');
      dms.asos.SQL.Add(' and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'"');
      //dms.asos.SQL.Add(' order by id desc');
      dms.asos.SQL.Add(' order by diler_id desc');
      dms.asos.open;

      //memo1.Lines.add(DMS.asos.SQL.Text);
      tpl.Close;tpl.SQL.Clear;
      tpl.SQL.Add('select * from pl WHERE del_flag=1 and vid=1 order by d_pl desc ');
      tpl.open;

      //if tpl.Active=false then tpl.open else tpl.refresh;
    end;
  6:begin  // tovarni qaytarib olish
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where tur_oper in (4) and del_flag=1 and client_id = '+dms.s_clientid.AsString+' order by sana desc');
      DMS.k_asos.Open;
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT *,id as tovar_id FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;
  7:begin  //  izoh - blaknot
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where qarz_flag>0 and qarz_flag<4 and del_flag=1 and client_id = '+dms.s_clientid.AsString+' order by sana desc');
      DMS.k_asos.Open;
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT *,id as tovar_id FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;
  8:begin // koorporativ
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where h_id>0 and del_flag=1 and client_id = '+dms.s_clientid.AsString+' order by sana desc limit 200');
      DMS.k_asos.Open;
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT *,id as tovar_id FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;
  9:begin // vaqtinchalik cheklar
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where diler_id<0 and del_flag=1 and client_id = '+admin_clid+' order by sana desc');
      DMS.k_asos.Open;
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT *,id as tovar_id FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;
  12:begin // mobil
      dms.s_haridor.Refresh;
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where diler_id>0 and mobil=1 and changedate is null and tur_oper=2 and del_flag=1 and client_id = '+admin_clid+' and user_id <> '+admin_id+' order by sana desc');
      DMS.k_asos.Open;
      //memo2.Visible:=true;
      //memo2.Lines.Add(dms.k_asos.SQL.Text);
      //memo1.Lines.Add(dms.asos_slave.SQL.Text);
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT *,id as tovar_id FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;

  5:begin // sozlash
  m := TRegistry.Create; l := TStringList.Create;
  s := '\System\CurrentControlSet\Control\Print\Printers';
  m.RootKey := HKEY_LOCAL_MACHINE;
  m.OpenKey(s, false);
  m.GetKeyNames(l);
  m.CloseKey;
  {ListBox1.Items.Clear;
  for i := 0 to l.Count - 1 do begin
    m.OpenKey(s + '\' + l[i], false);
      // if m.ReadString('Printer Driver') = 'my printer driver' then ..
    ListBox1.Items.Add(m.ReadString('Name'));
    m.CloseKey;
  end;}
  m.Free;
  l.Free;
  end;
  end;
end;

procedure Tkassa.cbPrintersChange(Sender: TObject);
var IniFile: TIniFile; TempStr1, TempStr2: string; S: array[0..64] of char;
begin
  with Printer do begin
    // Set the new printer based on the ComboBox's selected printer
    PrinterIndex := cbPrinters.ItemIndex;
    // Store the printer name into a temporary string
    TempStr1 := Printers[PrinterIndex];
    // Delete the unnecessary portion of the printer name
    System.Delete(TempStr1, Pos(' on ', TempStr1), Length(TempStr1));
    // Create a TIniFile class
    IniFile := TIniFile.Create('WIN.INI');
    try
      // Retrieve the device name of the selected printer
      TempStr2 := IniFile.ReadString('Devices', TempStr1, '');
      // Change the default printer to that chosen by the user
      IniFile.WriteString('windows', 'device', TempStr1 + ',' + TempStr2);
      // Tell all windows that the default printer changed.
      StrCopy(S, 'windows');
      SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, LongInt(@S));
    finally
      IniFile.Free;
    end;
  end;
  // Update the label to reflect the new printer selection
  //lblPrinter.Caption := Printer.Printers[Printer.PrinterIndex];
end;

procedure Tkassa.MenuItem3Click(Sender: TObject);
var k,k_in:integer;
begin
  if dms.asos.RecordCount=0 then exit;
  k:=0;k_in:=0;
  if MessageDlg(dms.asosdiler_id.AsString+' -  sonli chekni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    kassa.Caption:=inttostr(dms.asosid.AsInteger);

    dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
      if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
      //if DMS.s_tovarqoldiq.AsString='Y' then minus(k,k_in);
      dms.asos_slave.edit;
      dms.asos_slavedel_flag.AsInteger:=0;
      dms.asos_slave.post;
      dms.asos_slave.Next;
    end;
    kassa.Caption:=kassa.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.edit;
    dms.asosdel_flag.AsInteger:=0;
    dms.asos.post;
    kassa.Caption:=kassa.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.Refresh;
    dms.asos_slave.refresh;
    if qoldiq.Active then qoldiq.Refresh;
    pl_updute;
  end;

end;

procedure Tkassa.TovarlarGetFooterParams(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  if (Column.Field.FieldName = 'tovar_nom') then Text := 'Ro`yhat soni = ' + Text
  else if (Column.Field.FieldName = 'VName') then Text := Text + ' records';
end;

procedure Tkassa.tanlashChange(Sender: TObject);
var IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','strixqidir',inttostr(tanlash.ItemIndex));IniFile.Destroy;
end;

procedure Tkassa.Edit3Enter(Sender: TObject);
begin
  RzPanel1.Transparent:=false;
end;

procedure Tkassa.Edit3Exit(Sender: TObject);
begin
  RzPanel1.Transparent:=true;
end;

procedure Tkassa.Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (not dms.asos_slave.Eof) then
  begin
    dms.asos_slave.Next;
  end
  else if (Key = VK_UP) and (not dms.asos_slave.bof) then
  begin
    dms.asos_slave.Prior;Edit3.SelStart:=length(Edit3.Text)+1;
  end;
end;

procedure Tkassa.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then exit;
  if Edit3.Text='' then exit;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select *,kol_in as t_in,sena_d as kirim_d,sena as kirim,id as tovar_id FROM s_tovar WHERE del_flag=1 and shtrix="'+edit3.Text+'"');
  dms.s_tovar.open;
  yangi_return;
  Edit3.Text:='';
  Key:=#0;
end;

procedure Tkassa.xnewClick(Sender: TObject);
begin
  DMS.k_asos.Append;
  if (dms.s_clientdollar.asinteger=2) then dms.asosdollar.AsInteger:=1;
  dms.k_asosmobil.AsInteger:=0;
  DMS.k_asossana.AsDateTime:=Now;
  DMS.k_asostur_oper.AsInteger:=4;
  dms.k_asosclient_id.AsInteger:=dms.s_clientid.AsInteger;
  dms.k_asosuser_id.AsInteger:=dms.s_clientx_id.AsInteger;
  dms.setup.Refresh;
  dms.k_asoschangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  DMS.k_asos.Post;
end;

procedure Tkassa.DBGridEh3Exit(Sender: TObject);
begin
  if dms.k_asos.State = dsedit then dms.k_asos.Post;
end;

procedure Tkassa.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if dms.s_tovar.RecordCount=0 then exit;
  exit;
  if key=#13 then begin
    yangi_return;
  end; // if 13

end;

procedure Tkassa.Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var s,s1,s2:string;y:integer;
begin
  if (Key = VK_RETURN) then
  else
  if (Key = VK_DOWN) and (not dms.s_tovar.Eof) then dms.s_tovar.Next
  else if (Key = VK_UP) and (not dms.s_tovar.bof) then begin dms.s_tovar.Prior;edit2.SelStart:=length(edit2.Text)+1;end
  else
  if length(Edit2.Text) > 0 then begin
    s:=trim(Edit2.Text);s1:=s;s2:='';
    y:=pos(' ',s);
    if y>0 then begin
      s1:=copy(s,1,y-1);
      s2:=copy(s,y+1,length(s)-y);
    end;

    dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
    dms.s_tovar.SQL.Add('select *,id as tovar_id from s_tovar t WHERE del_flag=1 and ' );
    if s2<>'' then begin
      dms.s_tovar.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
      dms.s_tovar.SQL.Add(' and ((t.nom like "%'+lat_kril(s2)+'%") or (t.nom like "%'+s2+'%"))) order by t.nom');
    end
    else
    begin
      dms.s_tovar.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
      dms.s_tovar.SQL.Add(') order by t.nom');
    end;
    dms.s_tovar.open;
    if dms.s_tovar.RecordCount=0 then begin
      dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
      if GetKeyboardLayout(GetWindowThreadProcessId(GetForegroundWindow,nil))=67699721 then
      begin
        s1:=EngToRus(s1);if s2<>'' then EngToRus(s2);
      end
      else
      begin
        s1:=RusToEng(s1);if s2<>'' then RusToEng(s2);
      end;
      dms.s_tovar.SQL.Add('select *,kol_in as t_in,sena_d as kirim_d,sena as kirim,id as tovar_id FROM s_tovar t WHERE del_flag=1 and ');
      if s2<>'' then begin
        dms.s_tovar.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
        dms.s_tovar.SQL.Add(' and ((t.nom like "%'+lat_kril(s2)+'%") or (t.nom like "%'+s2+'%"))) order by t.nom');
      end
      else
      begin
        dms.s_tovar.SQL.Add('(((t.nom like "%'+lat_kril(s1)+'%") or (t.nom like "%'+s1+'%"))');
        dms.s_tovar.SQL.Add(') order by t.nom');
      end;
      dms.s_tovar.open;
    end;
  end;
end;

procedure Tkassa.DBGridEh2DblClick(Sender: TObject);
begin
  if sana_poisk.Value=null then begin ShowMessage('Sanani kiriting'); sana_poisk.SetFocus;exit; end;
  if sana_poisk0.Value=null then sana_poisk0.Value:=sana_poisk.Value;
  DMS.k_asos.close;DMS.k_asos.SQL.Clear;
  DMS.k_asos.sql.add('SELECT asos.* FROM asos,asos_slave s, s_tovar t where t.id='+DMS.s_tovarid.AsString+' and t.id=s.tovar_id and s.asos_id=asos.id and asos.tur_oper in (2) and asos.del_flag=1 and asos.sana between '+kasaya(sana_poisk.Value)+' and '+kasaya(sana_poisk0.Value)+' and asos.client_id = '+dms.s_clientid.AsString+' order by sana desc');
  DMS.k_asos.Open;
  //yangi_return;
end;

procedure Tkassa.DBGridEh2KeyPress(Sender: TObject; var Key: Char);
begin
    if key<>#13 then exit;
    yangi_return;
end;

procedure Tkassa.DBGridEh6Exit(Sender: TObject);
begin
  if dms.k_slave.State = dsedit then dms.k_slave.Post;
end;

procedure Tkassa.xdelClick(Sender: TObject);
begin
  if dms.k_asos.RecordCount=0 then exit;
  //if dms.k_slave.RecordCount>0 then begin ShowMessage('Xujjatni o`chirishdan oldin tovar ro`yhatini tozalang');exit;end;
  if MessageDlg(dms.asossana.AsString+' -  dagi xujjatni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    DMS.k_slave.First;
    while not dms.k_slave.Eof do begin
      DMS.k_slave.Edit;DMS.k_slavedel_flag.Value:=0;DMS.k_slave.Post;
      DMS.k_slave.Next;
    end;
    DMS.k_asos.Edit;DMS.k_asosdel_flag.Value:=0;DMS.k_asos.Post;DMS.k_slave.Refresh;DMS.k_asos.Refresh;
  end;
end;

procedure Tkassa.MenuItem4Click(Sender: TObject);
begin
  if (admin_type='2') and (dms.k_asosprint_flag.Value=1) then begin
    ShowMessage('Qatorni o`chirish mumkin emas');
  end;
  if dms.k_slave.RecordCount=0 then exit;
  if MessageDlg(dms.k_slaves_tovar.AsString+' tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.k_slave.edit;dms.k_slavedel_flag.Value:=0;dms.k_slave.Post;dms.k_slave.Refresh;
  end;
end;

procedure Tkassa.DBGridEh5DblClick(Sender: TObject);
begin
  exit;

  //if tpl.AsInteger>1 then begin ShowMessage('O`zgartirishga ruhsat yoq');exit;end;
  if tpl.RecordCount=0 then begin ShowMessage('X-to`lovnomani tanlang');exit;end;


  DMS.k_asos.Edit;


end;

procedure Tkassa.g_asosDblClick(Sender: TObject);
begin
    if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
    try
      if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
        //ShowMessage('sana kiritilmagan');exit;
      end;
    except
    end;
    dms.asos.Edit;
    kassa_h_edit.showmodal;
end;

procedure Tkassa.sEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if MessageDlg('Diqqat, Haridorni tozalaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNO then exit;
  if (dms.asos.State=dsInactive) or (dms.s_haridor.State=dsInactive) then  exit;
  if dms.asos.State=Dsbrowse then
  dms.asos.edit;
  dms.asosh_id.AsInteger:=0;
  dms.asosqarz_summa.AsFloat:=0;
  dms.asos.Post;
  dms.s_haridor.Close;dms.s_haridor.sql.Clear;
  dms.s_haridor.SQL.Add(' SELECT * FROM s_haridor where del_flag=1 and client_id = :id order by nom');
  dms.s_haridor.open;
  poisk_h.Text:='';
end;

procedure Tkassa.DBGridEh7DblClick(Sender: TObject);
var n:Currency;
begin
  dms.k_slave.First;n:=0;
  while not dms.k_slave.Eof do begin
    n:=n+dms.k_slavesumma_all.AsFloat;
    dms.k_slave.Next;
  end;
  dms.k_asos.Edit;
  if (DMS.k_asoscheg.AsFloat>0) and (dms.k_asoscheg_n.AsFloat+dms.k_asoscheg_p.AsFloat+dms.k_asoscheg_e.AsFloat+dms.k_asoscheg_c.AsFloat=0) then begin
    if dms.k_asossum_naqd.AsFloat>0 then begin
      dms.k_asossum_naqd_ch.AsFloat:=dms.k_asossum_naqd.AsVariant-dms.k_asoscheg.AsFloat;
      dms.k_asoscheg_n.AsFloat:=dms.k_asoscheg.AsFloat;
    end
    else
    if dms.k_asossum_plastik.AsFloat>0 then begin
      dms.k_asossum_plast_ch.AsFloat:=dms.k_asossum_plastik.AsVariant-dms.k_asoscheg.AsFloat;
      dms.k_asoscheg_p.AsFloat:=dms.k_asoscheg.AsFloat;
    end
    else
    if dms.k_asossum_epos.AsFloat>0 then begin
      dms.k_asossum_epos_ch.AsFloat:=dms.k_asossum_epos.AsVariant-dms.k_asoscheg.AsFloat;
      dms.k_asoscheg_e.AsFloat:=dms.k_asoscheg.AsFloat;
    end
    else
    if dms.k_asossum_d.AsFloat>0 then begin
      dms.k_asossum_d_ch.AsFloat:=dms.k_asossum_d.AsVariant-dms.k_asoscheg.AsFloat;
      dms.k_asoscheg_d.AsFloat:=dms.k_asoscheg.AsFloat;
    end;

  end;
  dms.k_asosxodim_id.AsInteger:=StrToInt(admin_id);
  dms.k_asos.post;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
  qoldiq.open;

  //DMS.asos.Locate('id',dms.k_asosid.AsInteger,[loCaseInsensitive]);

  varaq.ActivePageIndex:=0;

  nom_.SetFocus;

exit;
  //if dms.k_asosqarz_flag.AsInteger>1 then begin ShowMessage('O`zgartirishga ruhsat yoq');exit;end;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  //kassa.Memo1.Lines.Add(dms.asos.SQL.Text);
  dms.asos.open;
  qoldiq.open;DMS.x_otchet.open;
  //tpl.Close;tpl.SQL.Clear;
  //tpl.SQL.Add('select * from pl WHERE del_flag=1 and h_id='+inttostr(filtr_haridor.value)+' order by d_pl desc ');
  //tpl.open;
  DMS.asos.Edit;
  kassa_h_edit.showmodal;
end;

procedure Tkassa.yorliqPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printeryorliq',yorliqPrinters.Text);IniFile.Destroy;
end;

procedure Tkassa.chekPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printerchek',chekPrinters.Text);IniFile.Destroy;
  {n:=ListBox1.ItemIndex;lblPrinter.Caption:=ListBox1.Items[n];
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printer',lblPrinter.Caption);IniFile.Destroy;}
end;

procedure Tkassa.chekshablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablonchek',chekshablon.Text);IniFile.Destroy;
  {n:=file_chek.ItemIndex;lblchek.Caption:=file_chek.Items[n];
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','chek',lblchek.Caption);IniFile.Destroy;}
end;

procedure Tkassa.yorliqshablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablonyorliq',yorliqshablon.Text);IniFile.Destroy;
end;

procedure Tkassa.TovarlarDblClick(Sender: TObject);
var s3:string;
begin
  if dms.asos_slave.RecordCount=0 then exit;
  dms.asos_slave.edit;
  kassa_kv.konv.Value:=0;
  kassa_kv.showmodal;
end;

procedure Tkassa.TovarlarCellClick(Column: TColumnEh);
begin
  if dms.asos_slave.RecordCount=0 then exit;
  kassa.qoldiq.Close;kassa.qoldiq.SQL.Clear;
  if dms.asostur_oper.AsInteger=2 then begin
    kassa.qoldiq.SQL.Add('SELECT *,sum(kol) as kol_ost,sum(kol_in) as kol_in_ost,sum(kol_all) as kol_all_ost from ombor where tovar_id='+dms.asos_slavetovar_id.AsString);
    kassa.qoldiq.SQL.Add(' GROUP by tovar_id order by tovar_id desc limit 30');
    kassa.qoldiq.Open;
  end
  else
  begin
    kassa.qoldiq.close;kassa.qoldiq.SQL.Clear;
    kassa.qoldiq.sql.add('SELECT *,kol_in as t_in,sena_d as kirim_d,sena as kirim,id as tovar_id FROM s_tovar where del_flag=1 and id='+dms.asos_slavetovar_id.AsString+' order by nom');
    kassa.qoldiq.Open;
  end;
end;

procedure Tkassa.RzBitBtn1Click(Sender: TObject);
begin
  //shortdateformat:='dd.mm.yyyy';
  DMS.asos.Locate('id',dms.k_asosid.AsInteger,[loCaseInsensitive]);
  if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
  try
    if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
      //ShowMessage('sana kiritilmagan');exit;
  end;
    except
  end;
  dms.asos.Edit;
  dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
  dms.link.Close;dms.link.sql.Clear;
  if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
    dms.asosdiler_id.AsInteger:=1;
    dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
  end
  else begin
    dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
    dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
  end;
  dms.link.ExecSQL;
  dms.asos.Post;
  dms.s_client.Refresh;//dms.asos.Refresh;dms.asos_slave.Refresh;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);

  if DMS.asosdiler_id.AsInteger=-1 then frxsf.Variables['nnn']:=''''+'Noaniq'+''''
  else
  frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;
  frxsf.PrepareReport;
  frxsf.PrintOptions.ShowDialog := false;varaq.ActivePageIndex:=0;
  frxsf.Print;
  if (not dms.asos.Locate('diler_id',0,[loCaseInsensitive])) then begin
      if (dms.s_clientdollar.asinteger=2) then dms.asosdollar.AsInteger:=1;
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;
    end;

end;

procedure Tkassa.RzBitBtn2Click(Sender: TObject);
begin
  DMS.asos.Locate('id',dms.k_asosid.AsInteger,[loCaseInsensitive]);
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
  if DMS.asosdiler_id.AsInteger=-1 then frxsf.Variables['nnn']:=''''+'Noaniq'+''''
  else
  frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;
  frxsf.ShowReport;
end;

procedure Tkassa.gtimeoutDblClick(Sender: TObject);
var n:Currency;
begin
  dms.k_slave.First;n:=0;
  while not dms.k_slave.Eof do begin
    n:=n+dms.k_slavesumma_all.AsFloat;
    dms.k_slave.Next;
  end;
  dms.k_asos.Edit;
  if (DMS.k_asoscheg.AsFloat>0) and (dms.k_asoscheg_n.AsFloat+dms.k_asoscheg_p.AsFloat+dms.k_asoscheg_e.AsFloat+dms.k_asoscheg_c.AsFloat=0) then begin
    if dms.k_asossum_naqd.AsFloat>0 then begin
      dms.k_asossum_naqd_ch.AsFloat:=dms.k_asossum_naqd.AsVariant-dms.k_asoscheg.AsFloat;
      dms.k_asoscheg_n.AsFloat:=dms.k_asoscheg.AsFloat;
    end
    else
    if dms.k_asossum_plastik.AsFloat>0 then begin
      dms.k_asossum_plast_ch.AsFloat:=dms.k_asossum_plastik.AsVariant-dms.k_asoscheg.AsFloat;
      dms.k_asoscheg_p.AsFloat:=dms.k_asoscheg.AsFloat;
    end
    else
    if dms.k_asossum_epos.AsFloat>0 then begin
      dms.k_asossum_epos_ch.AsFloat:=dms.k_asossum_epos.AsVariant-dms.k_asoscheg.AsFloat;
      dms.k_asoscheg_e.AsFloat:=dms.k_asoscheg.AsFloat;
    end
    else
    if dms.k_asossum_d.AsFloat>0 then begin
      dms.k_asossum_d_ch.AsFloat:=dms.k_asossum_d.AsVariant-dms.k_asoscheg.AsFloat;
      dms.k_asoscheg_d.AsFloat:=dms.k_asoscheg.AsFloat;
    end;

  end;
  dms.k_asosxodim_id.AsInteger:=StrToInt(admin_id);
  dms.k_asos.post;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
  qoldiq.open;

  //DMS.asos.Locate('id',dms.k_asosid.AsInteger,[loCaseInsensitive]);

  varaq.ActivePageIndex:=0;
  nom_.SetFocus;
end;

procedure Tkassa.cheknitahrirlash1Click(Sender: TObject);
var s:string;
begin
  //dms.asos.Edit;dms.asosdiler_id.AsVariant:=null;dms.asos.post;
      s:=dms.asosid.AsString;
      dms.asos.Close;dms.asos.SQL.Clear;
      dms.asos.SQL.Add('select * from asos where id='+s+' order by id');
      dms.asos.open;
      qoldiq.open;
      tpl.Close;tpl.SQL.Clear;
      tpl.SQL.Add('select * from pl WHERE del_flag=1 and vid <> 1 order by d_pl desc ');
      tpl.open;
    DMS.s_tovar.Refresh;
    varaq.ActivePageIndex:=0;
    
    //if dms.asosh_id.AsInteger>0 then h.Value:=dms.asosh_id.AsInteger else h.Value:=Null;
    nom_.SetFocus;
    DMS.asos_slave.Refresh;
end;

procedure Tkassa.Kassadanpulniexhish1Click(Sender: TObject);
var f,p,d,c:Currency; i:integer;s:string;ff,pp,dd,cc:integer;
begin
  dms.asos.First;f:=0;p:=0;d:=0;ff:=0;pp:=0;dd:=0;
  for i:=0 to dms.asos.RecordCount-1 do begin
    if (dms.asossumma.AsFloat>0) and (dms.asosdiler_id.AsInteger>0) then begin
      f:=f+dms.asossumma.AsFloat;
      d:=d+dms.asoskurs.AsFloat;
    end;
    if (dms.asossumma.AsFloat>0) and (dms.asosdiler_id.AsInteger>0) then begin
      p:=p+dms.asoscheg_n.AsFloat;
      c:=c+dms.asoscheg_d.AsFloat;
    end;
    dms.asos.Next;
  end;
  if (f+p+d+c=0) then begin
    ShowMessage('Summa 0 ga teng');
    exit;
  end;
  if f>0 then begin
    s:= floattostr(f)+' - asosiy summa , ��� - ' + floattostr(d);
  end;
  if p>0 then begin
    s:=iif(f=0,'',s+#13+' va ')+ floattostr(p)+' bonus summa ' + floattostr(c);
  end;
  if s='' then begin ShowMessage('Kun yopilgan !!!');exit;end;
  if MessageDlg(s+' yaratasizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  if f>0 then begin
    tpl.Append;
    dms.link.Close;dms.link.sql.Clear;
    DMS.s_client.Refresh;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
    begin
      dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString);
      tpln_pl.AsInteger:=1;
    end
    else
    begin
      tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
      dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;

    //tpl.FieldByName('n_pl').AsInteger:=1;
    tpl.FieldByName('d_pl').AsDateTime:=now();
    tpl.FieldByName('vid').AsInteger:=1;tpl.FieldByName('bank_id').AsInteger:=0;
    tpl.FieldByName('sena_pl').AsFloat:=f;
    tpl.FieldByName('ost_pl').AsFloat:=d;
    if p>0 then begin
      tpl.FieldByName('sena_d').AsFloat:=p;
      tpl.FieldByName('ost_d').AsFloat:=c;
    end;
    tpl.Post;
    ff:=tpl.FieldByName('id').AsInteger;
  end;
  dms.asos.First;
  for i:=0 to dms.asos.RecordCount do begin
    if (dms.asospl_id.AsInteger=0)  and (dms.asosdiler_id.AsInteger>0) then begin
      dms.asos.Edit;
      if ff>0 then dms.asospl_id.AsInteger:=ff;
      dms.asos.Post;
    end;
    dms.asos.Next;
  end;
  tpl.Refresh;
  dms.asos.First;
end;

procedure Tkassa.DBGridEh1DblClick(Sender: TObject);
begin
  //if tpl.AsInteger>1 then begin ShowMessage('O`zgartirishga ruhsat yoq');exit;end;
  if tpl.RecordCount=0 then begin ShowMessage('X-to`lovnomani tanlang');exit;end;
  if MessageDlg(' Joriy to`lovnomani o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('update asos set pl_id=0 where pl_id='+tpl.fieldbyname('id').AsString);
  dms.link.ExecSQL;
  tpl.Edit;
  tpl.FieldByName('del_flag').AsInteger:=0;
  tpl.Post;
  tpl.Refresh;
  dms.asos.First;
end;

procedure Tkassa.newplClick(Sender: TObject);
begin
  if tpl.State=dsBrowse then
  begin
    kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
    kassa.gpl.Enabled:=false;
    tpl.Append;
    DMS.s_client.Refresh;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
      tpln_pl.AsInteger:=1
    else
      tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
    tpl.FieldByName('d_pl').AsDateTime:=date();
    tpl.FieldByName('vid').AsInteger:=2;
    tpl.FieldByName('konv').AsInteger:=0;

    vidExit(Sender);
    n_pl.SetFocus;
  end
  else
  begin
    if (tpl.FieldByName('sena_pl').AsInteger+tpl.FieldByName('sena_d').AsInteger)=0 then
    begin
       ShowMessage('Summani kiriting');ActiveControl:=sena_pl;Exit;
    end;
    if (tpl.State=dsInsert) and (tpln_pl.AsInteger=DMS.s_clientlast_pl_k.AsInteger) then begin
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then begin
        tpln_pl.AsInteger:=1;
        dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
        dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
    end;
    tpl.Post;
    hisoblaClick(Sender);
    kassa.newpl.Caption:='Yangi';kassa.delpl.Caption:='o`chirish';
    kassa.gpl.Enabled:=true;

  end;
end;

procedure Tkassa.n_plKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tkassa.delplClick(Sender: TObject);
begin
  if tpl.State=dsBrowse then
  begin
    if MessageDlg('Qatorni o`chrasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      if tpl.fieldbyname('vid').AsInteger=1 then begin // naqd
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set pl_id=null where pl_id='+tplid.AsString);
        dms.link.ExecSQL;
      end;
      if tpl.fieldbyname('vid').AsInteger=19 then begin // plastik
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set plastik_id=null where plastik_id='+tplid.AsString);
        dms.link.ExecSQL;
      end;
      if tpl.fieldbyname('vid').AsInteger=21 then begin // dollar
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set d_id=null where d_id='+tplid.AsString);
        dms.link.ExecSQL;
      end;
      if tpl.fieldbyname('vid').AsInteger=22 then begin // click
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update asos set c_id=null where c_id='+tplid.AsString);
        dms.link.ExecSQL;
      end;

      tpl.Edit;
      tpl.FieldByName('del_flag').AsInteger:=0;
      tpl.Post;
      tpl.Refresh;
      kassa.newpl.Caption:='Yangi';kassa.delpl.Caption:='o`chirish';
      kassa.gpl.Enabled:=true;

    end;
  end
  else
  begin
    tpl.Cancel;
  end;
end;

procedure Tkassa.hisoblaClick(Sender: TObject);
var qoldiq,qpl,echish:Currency;
begin
  //if saldo.Value<0 then begin ShowMessage('Pul yetmayapdi');exit;end;
  dms.oraliqpl.First;
  while not dms.oraliqpl.Eof do begin
    if dms.lbd_pl.Locate('id',dms.oraliqpl.fieldbyname('pl_id').Value,[loPartialKey]) then begin
	    dms.lbd_pl.Edit;
      dms.lbd_pl.fieldbyname('ost_pl').AsFloat:=dms.lbd_pl.fieldbyname('ost_pl').AsFloat+dms.oraliqpl.fieldbyname('ost').AsFloat;
      dms.lbd_pl.fieldbyname('pot1').AsInteger:=0;
      dms.lbd_pl.Post;
    end;
    dms.oraliqpl.delete;
  end;
  echish:=0;
  dms.lbd_pl.First;
  while (not dms.lbd_pl.Eof) and (tpl.fieldbyname('sena_pl').AsFloat>echish) do begin
    if dms.lbd_pl.FieldByName('ost_pl').Value>0 then begin
      if tpl.FieldByName('sena_pl').AsFloat-echish>=dms.lbd_pl.FieldByName('ost_pl').AsFloat then
        begin
          qoldiq:=dms.lbd_pl.FieldByName('ost_pl').AsFloat;
          qpl:=0;
        end
      else begin
        qoldiq:=tpl.FieldByName('sena_pl').AsFloat-echish;
        qpl:=dms.lbd_pl.FieldByName('ost_pl').AsFloat-qoldiq;
      end;
      dms.oraliqpl.Insert;dms.oraliqpl.FieldByName('sf_id').AsInteger:=tpl.fieldbyname('id').AsInteger;
      dms.oraliqpl.FieldByName('pl_id').AsInteger:=dms.lbd_pl.FieldByName('id').AsInteger;
      dms.oraliqpl.FieldByName('ost').AsFloat:=qoldiq;
      dms.oraliqpl.FieldByName('vid').AsInteger:=1;
      dms.oraliqpl.Post;
      echish:=echish+qoldiq;
      dms.lbd_pl.Edit;dms.lbd_pl.FieldByName('ost_pl').AsFloat:=qpl;
      dms.lbd_pl.FieldByName('pot1').AsInteger:=1;dms.lbd_pl.Post;
     end; // ost_l>0
    dms.lbd_pl.Next;
  end;
  sena_plEnter(Sender);
end;

procedure Tkassa.tozaClick(Sender: TObject);
begin
  dms.oraliqpl.First;
  while not dms.oraliqpl.Eof do begin
    if dms.lbd_pl.Locate('id',dms.oraliqpl.fieldbyname('pl_id').AsInteger,[loPartialKey]) then begin
	    dms.lbd_pl.Edit;
      dms.lbd_pl.fieldbyname('ost_pl').AsFloat:=dms.lbd_pl.fieldbyname('ost_pl').AsFloat+dms.oraliqpl.fieldbyname('ost').AsFloat;
      dms.lbd_pl.fieldbyname('pot1').AsInteger:=0;
      dms.lbd_pl.Post;
    end;
    dms.oraliqpl.delete;
  end;
  sena_plEnter(Sender);

end;

procedure Tkassa.vidExit(Sender: TObject);
begin
  tplAfterScroll(tpl);
end;

procedure Tkassa.sena_plEnter(Sender: TObject);
var s:string;echish:Currency;
begin
  if tplkonv.AsVariant=null then exit;
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value='2') and (kurs.Value>0)  then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value='1') and (kurs.Value>0) then
    sena_d.Value:=sena_pl.Value/kurs.Value;


  exit;
  if tpl.Active=false then exit;
  if dms.lbd_pl.Active=false then exit;
  dms.lbd_pl.Close;dms.lbd_pl.SQL.Clear;
  s:='';dms.oraliqpl.First;
  while not dms.oraliqpl.Eof do begin
    s:=s+iif(s='','',',')+dms.oraliqpl.fieldbyname('pl_id').AsString;
    dms.oraliqpl.next;
  end;
  if s<>'' then s:='(ost_pl<>0 or id in ('+s+')) and ' else s:='ost_pl<>0 and ';
  dms.lbd_pl.SQL.Add('select * from pl WHERE '+s+' del_flag=1 and vid in (1,4) order by d_pl');
  dms.lbd_pl.open;
  dms.lbd_pl.First;
  while not dms.lbd_pl.Eof do begin
   if dms.oraliqpl.Locate('pl_id',dms.lbd_pl.fieldbyname('id').Value,[loPartialKey]) then
     begin dms.lbd_pl.Edit;dms.lbd_pl.FieldByName('pot1').AsFloat:=1;dms.lbd_pl.Post;end
   else
    begin dms.lbd_pl.Edit;dms.lbd_pl.FieldByName('pot1').AsFloat:=0;dms.lbd_pl.Post;end;
   dms.lbd_pl.next;
  end;


  dms.lbd_pl.First;echish:=0;
  while not dms.lbd_pl.Eof do begin
    echish:=echish+dms.lbd_pl.fieldbyname('ost_pl').AsFloat;
    dms.lbd_pl.Next;
  end;
  dms.oraliqpl.First;while not dms.oraliqpl.Eof do begin
    echish:=echish+dms.oraliqpl.fieldbyname('ost').AsFloat;
    dms.oraliqpl.Next;
  end;
  tulov.Value:=echish;
  saldo.Value:=tulov.value-sena_pl.Value;
end;

procedure Tkassa.gplExit(Sender: TObject);
begin
  kassa.sena_plExit(Sender);
end;

procedure Tkassa.DBLookupComboboxEh2EditButtons0Click(Sender: TObject;var Handled: Boolean);
begin
  if filtr_haridor.value=null then exit;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and client_id='+admin_clid+' and user_id='+admin_id+' and h_id='+inttostr(filtr_haridor.value)+' order by id desc');
  dms.asos.open;
  qoldiq.open;DMS.x_otchet.open;
  tpl.Close;tpl.SQL.Clear;
  tpl.SQL.Add('select * from pl WHERE del_flag=1 and h_id='+inttostr(filtr_haridor.value)+' order by d_pl desc ');
  tpl.open;

end;

procedure Tkassa.DBLookupComboboxEh2EditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  filtr_haridor.value:=null;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and client_id='+admin_clid+' and user_id='+admin_id+' and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'" order by id desc');
  dms.asos.open;
  qoldiq.open;DMS.x_otchet.open;
  tpl.Close;tpl.SQL.Clear;
  tpl.SQL.Add('select * from pl WHERE del_flag=1 and vid <> 1 order by d_pl desc ');
  tpl.open;

end;

procedure Tkassa.RzBitBtn4Click(Sender: TObject);
begin
    dms.s_haridor.Close;dms.s_haridor.sql.Clear;
    dms.s_haridor.SQL.Add(' SELECT * FROM s_haridor where del_flag=1 and client_id = :id order by nom');
    dms.s_haridor.open;
  forma:='kassa';
  if dms.asosh_id.AsInteger>0 then
  begin
    DMS.user.Edit;
    DMS.user.FieldByName('last_h').AsString:= dms.asosh_id.AsString;
    DMS.user.Post;
  end;
  //haridor_id:=dms.asosh_id.AsString;
    //else
  //haridor_id:='';
  s_haridor.showmodal;
end;

procedure Tkassa.mobil01Click(Sender: TObject);
begin
  dms.k_asos.Edit;
  dms.k_asosmobil.Value:=0;
  dms.k_asos.post;
  dms.k_asos.Refresh;
end;

procedure Tkassa.Chekniochirish2Click(Sender: TObject);
var k,k_in:integer;
begin
  if dms.k_asos.RecordCount=0 then exit;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
  qoldiq.open;

  if (not  DMS.asos.Locate('id',dms.k_asosid.AsInteger,[loCaseInsensitive])) then begin
    ShowMessage('Chek topilmadi');exit;
  end;
  k:=0;k_in:=0;
  if MessageDlg(dms.asosdiler_id.AsString+' -  sonli chekni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    kassa.Caption:=inttostr(dms.asosid.AsInteger);

    dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('update s_tovar set upakavka = null where id='+DMS.s_tovarid.AsString);
      dms.link.ExecSQL;
      if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
      if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
      //if DMS.s_tovarqoldiq.AsString='Y' then minus(k,k_in);
      dms.asos_slave.edit;dms.asos_slavedel_flag.AsInteger:=0;dms.asos_slave.post;
      dms.asos_slave.Next;
    end;
    kassa.Caption:=kassa.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.edit;
    dms.asosdel_flag.AsInteger:=0;
    dms.asos.post;
    kassa.Caption:=kassa.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.Refresh;
    dms.k_asos.Refresh;
    dms.asos_slave.refresh;
    if qoldiq.Active then qoldiq.Refresh;
  end;
end;

procedure Tkassa.Chekniochirish1Click(Sender: TObject);
var k,k_in:integer;
begin
  //ShowMessage('Ruxsat yo`q');
  //exit;
  if dms.asos.RecordCount=0 then exit;
  k:=0;k_in:=0;
  if MessageDlg(dms.asosdiler_id.AsString+' -  sonli chekni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    kassa.Caption:=inttostr(dms.asosid.AsInteger);

    dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('update s_tovar set upakavka = null where id='+DMS.s_tovarid.AsString);
      dms.link.ExecSQL;
      main.First;
      while not main.eof do begin
        dms.link.Close;dms.link.SQL.Clear;
        dms.link.SQL.Add('update slave_main set kirim_id = null where id='+main.fieldbyname('kirim_id').AsString);
        dms.link.ExecSQL;
        main.next;
      end;
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('update slave_main set del_flag=0 where slave_id='+DMS.asos_slaveid.AsString);
      dms.link.ExecSQL;

      if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
      if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
      //if DMS.s_tovarqoldiq.AsString='Y' then minus(k,k_in);
      dms.asos_slave.edit;dms.asos_slavedel_flag.AsInteger:=0;dms.asos_slave.post;
      dms.asos_slave.Next;
    end;
    dms.asos.edit;dms.asosdel_flag.AsInteger:=0;dms.asos.post;
    kassa.Caption:=kassa.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.Refresh;
    dms.asos_slave.refresh;
    if qoldiq.Active then qoldiq.Refresh;
    pl_updute;
  end;
end;

procedure Tkassa.DBGridEh3DblClick(Sender: TObject);
begin
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
  dms.asos_slave.open;
  varaq.ActivePageIndex:=0;
  nom_.SetFocus;
end;

procedure Tkassa.V1Click(Sender: TObject);
begin
  dms.k_asos.Edit;
  dms.k_asosdiler_id.Value:=0;
  dms.k_asos.post;
  dms.k_asos.Refresh;

end;

procedure Tkassa.a4PrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printera4',a4Printers.Text);IniFile.Destroy;
end;

procedure Tkassa.a4shablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablona4',a4shablon.Text);IniFile.Destroy;

end;

procedure Tkassa.reklamaExit(Sender: TObject);
begin
  if dms.asos.State<>dsbrowse then
   dms.asos.post;
end;

procedure Tkassa.n_plChange(Sender: TObject);
begin
  exit;
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;

end;

procedure Tkassa.d_plChange(Sender: TObject);
begin
  exit;
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;

end;

procedure Tkassa.sena_plChange(Sender: TObject);
begin
  exit;
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;

end;

procedure Tkassa.haridorExit(Sender: TObject);
begin
  exit;
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;

end;

procedure Tkassa.S1Click(Sender: TObject);
begin
  if MessageDlg(' seriyani o`chirasizmi?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('update slave_main set kirim_id = null where id='+kassa.main.fieldbyname('kirim_id').AsString);
    dms.link.ExecSQL;

    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('update slave_main set del_flag=0 where id='+kassa.main.fieldbyname('id').AsString);
    dms.main_link.ExecSQL;
    main.Refresh;//main_in.Refresh;
    kassa.main.Refresh;
end;

procedure Tkassa.KredirClick(Sender: TObject);
begin
  //kredit.showmodal;
end;

procedure Tkassa.TaqsimlaClick(Sender: TObject);
var i,kun,kun1,oy,oy1,yil,yil1:integer;d:TDate;s:string;
begin
  if koy.Text='' then begin
    ShowMessage('Oy ni tanlang');exit;
  end;
  if ks_pl.Text='' then begin
    ShowMessage('Summani kiriting');exit;
  end;
  if MessageDlg(' Taqsimlaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  if dms.asos.State=dsbrowse then dms.asos.edit;

  dms.asosinv_id.AsInteger:=strtoint(admin_clid);
  dms.asos.edit;
  d:=Date;
  s:=DateToStr(d); // 2021-01-01
  kun1:=strtoint(copy(s,1,2));oy1:=strtoint(copy(s,4,2));yil1:=strtoint(copy(s,9,2));
  kun:=strtoint(copy(s,1,2));oy:=strtoint(copy(s,4,2));yil:=strtoint(copy(s,9,2));
  for i:=1 to strtoint(koy.Text) do begin
    oy:=oy+1;
    if oy=12 then begin
        oy:=1;yil:=yil+1;
    end;
    if oy<10 then
    s:=inttostr(kun)+'.0'+inttostr(oy)+'.'+inttostr(yil)
    else
    s:=inttostr(kun)+'.'+inttostr(oy)+'.'+inttostr(yil);
    xpl.Append;
    xpl.FieldByName('inv_id').AsInteger:=strtoint(admin_clid);
    xpl.FieldByName('asos_id').AsInteger:=dms.asosid.AsInteger;
    xpl.FieldByName('n_pl').AsString:=inttostr(i);
    xpl.FieldByName('d_pl').AsDateTime:=Now;
    xpl.FieldByName('sena_pl').AsFloat:=StrToFloat(ks_pl.Text);
    xpl.FieldByName('srok').AsString:=s; //  2021-07-17  2021-08-17
    xpl.post;
  end; // for
  xpl.Refresh;
end;

procedure Tkassa.tplAfterCancel(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Yangi';kassa.delpl.Caption:='o`chirish';
  kassa.gpl.Enabled:=true;
end;

procedure Tkassa.tplAfterPost(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Yangi';kassa.delpl.Caption:='o`chirish';
  kassa.gpl.Enabled:=true;
end;

procedure Tkassa.tplBeforeInsert(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;
end;

procedure Tkassa.tplAfterScroll(DataSet: TDataSet);
begin
  case tplvid.AsInteger of
  2:begin
      kassa.lvo.Visible:=true;kassa.vo.Visible:=true;
      kassa.diler.Visible:=false;kassa.haridor.Visible:=false;
      kassa.lvo.Caption:= 'Xarajat turi';
    end;
    3:begin
      kassa.lvo.Visible:=true;kassa.vo.Visible:=false;
      kassa.diler.Visible:=true;kassa.haridor.Visible:=false;
      kassa.lvo.Caption:= 'Mol etkazuvci';
    end;
  4:begin
      kassa.lvo.Visible:=false;kassa.vo.Visible:=false;kassa.diler.Visible:=false;kassa.haridor.Visible:=false;
    end;
  5:begin
      kassa.lvo.Visible:=false;kassa.vo.Visible:=false;kassa.diler.Visible:=false;kassa.haridor.Visible:=false;
    end;
  6,19,21:begin // ???????
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
end;

procedure Tkassa.tplBeforeEdit(DataSet: TDataSet);
begin
  kassa.newpl.Caption:='Saqlash';kassa.delpl.Caption:='Bekor qilish';
  kassa.gpl.Enabled:=false;
end;

procedure Tkassa.tplNewRecord(DataSet: TDataSet);
begin
  tpluser_id.AsInteger:=strtoint(admin_id);
  tplclient_id.AsInteger:=strtoint(admin_clid);
end;

procedure Tkassa.TozalaClick(Sender: TObject);
begin
  if MessageDlg(' Hamma talabnomalarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.asos.Edit;
    dms.asosinv_id.AsInteger:=0;
    dms.asos.post;
    dms.asos.Refresh;
    xpl.First;
    while not xpl.Eof do
    begin
      xpl.Edit;
      xpl.FieldByName('del_flag').AsInteger:=0;
      xpl.post;
      xpl.Next;
    end;
    xpl.Refresh;
  end;
end;

procedure Tkassa.xplNewRecord(DataSet: TDataSet);
begin
    xpl.FieldByName('user_id').AsInteger:=dms.s_user.fieldbyname('id').AsInteger;
    xpl.FieldByName('asos_id').AsInteger:=dms.asosid.AsInteger;

end;

procedure Tkassa.DBGridEh20ColExit(Sender: TObject);
begin
  if xpl.State<>dsbrowse then begin
  xpl.Post;
  end;
end;

procedure Tkassa.sena_plExit(Sender: TObject);
begin
  if tplkonv.AsVariant=null then exit;
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value='2') and (kurs.Value>0)  then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value='1') and (kurs.Value>0) then
    sena_d.Value:=sena_pl.Value/kurs.Value;

end;

procedure Tkassa.sena_dExit(Sender: TObject);
begin
  if tplkonv.AsVariant=null then exit;
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value='2') and (kurs.Value>0)  then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value='1') and (kurs.Value>0) then
    sena_d.Value:=sena_pl.Value/kurs.Value;
end;

procedure Tkassa.sena_dEnter(Sender: TObject);
begin
  if (sena_d.Value>0) and (sena_pl.Value=null) and (konv.Value='2') and (kurs.Value>0)  then
    sena_pl.Value:=sena_d.Value*kurs.Value;
  if (sena_d.Value=null) and (sena_pl.Value>0) and (konv.Value='1') and (kurs.Value>0) then
    sena_d.Value:=sena_pl.Value/kurs.Value;
end;

procedure Tkassa.AvtopechatClick(Sender: TObject);
begin
  if tpechat.Enabled=true then begin
    tpechat.Enabled:=false;
    Avtopechat.Caption:='Start';
  end
  else
  begin
    Avtopechat.Caption:='Stop';
    tpechat.Enabled:=true;
  end;
end;

procedure Tkassa.s4Click(Sender: TObject);
begin
  Clipboard.AsText:=main.fieldbyname('serial').AsString;

end;

procedure Tkassa.reklamaClick(Sender: TObject);
begin
ShowMessage(dms.asos_slave.fieldbyname('sot').AsString);

end;

procedure Tkassa.Label8Click(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','kirim','1');IniFile.Destroy;

end;

procedure Tkassa.K1Click(Sender: TObject);
var firstRow,y,i,l,r,col:integer;ustun:string;
begin
  ExcelCreateApplication('Kunlik savdo', 1,2, false);
  try Sheet := Excel.WorkBooks[1].Sheets[1];except Exception.Create('���� !!! Excel ������������ !!!'); Exit;end;
  y:=1;  Sheet.Columns[y].ColumnWidth :=3;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth := 5;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;
  inc(y);Sheet.Columns[y].ColumnWidth := 7;
  inc(y);Sheet.Columns[y].ColumnWidth := 20;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=15;
  inc(y);Sheet.Columns[y].ColumnWidth :=14;
  inc(y);Sheet.Columns[y].ColumnWidth :=10;

  firstRow:=10;
  y:=0;inc(y);
  Sheet.Cells[firstRow-1,y] := '�';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Sana';
  inc(y);Sheet.Cells[firstRow-1,y] := 'kun';
  inc(y);Sheet.Cells[firstRow-1,y] := 'muddat';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Kun';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Mijoz nomi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Telefon';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Invester nomi';
  inc(y);Sheet.Cells[firstRow-1,y] := 'So`m';
  inc(y);Sheet.Cells[firstRow-1,y] := 'Dollar';
  dms.asos.First;col:=0;l:=0;r:=0;y:=1;
  for i:=0 to dms.asos.RecordCount-1 do begin
    Sheet.Cells[firstrow+i,y]:=inttostr(i+1);
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.asosdiler_id.AsString;
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.asoshfio.AsString;
    Sheet.Cells[firstrow+i,y].NumberFormat := '### ### ###0';
    inc(y);Sheet.Cells[firstrow+i,y]:=dms.asoshfio.AsString;
    Sheet.Cells[firstrow+i,y].NumberFormat := '### ### ##0,00';
    dms.asos.Next;y:=1;
  end;
  col:=i;
  Sheet.Cells[firstrow+col,2] := 'Jami:';
  Sheet.Cells[firstrow+col,9].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  Sheet.Cells[firstrow+col,10].formula := '=SUM(R[-1]C:R[-'+IntToStr(col)+']C)';
  ustun:='J';
  Range_shapka := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(firstRow-1)];
  Range_telo   := Sheet.Range['A' + IntToStr(FirstRow) + ':' +ustun+ IntToStr(firstRow+col)];
  Range_itog   := Sheet.Range['A' + IntToStr(FirstRow+col) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_all    := Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+col)];
  Sheet.Range['A' + IntToStr(FirstRow-2) + ':'+ustun + IntToStr(FirstRow+col)];
  Range_shapka.Interior.ColorIndex := 34;
  Range_shapka.VerticalAlignment := 2;
  Range_shapka.HorizontalAlignment := 3;
  ExcelRangeBorders(Range_all, 3, 2, True, True,True, True, True, True);
  ExcelFormatRange(Range_shapka, 'Times New Roman', 11, True, false,true);
  ExceltFormatRange(Range_telo, 'Times New Roman', 11, false,true);
  ExcelFormatRange(Range_itog, 'Times New Roman', 11, True, True,true);

  //Sheet.Cells[5,1]:=za.Text+' ('+zapros.Text+')';Sheet.Range['A5:'+ustun+'5'].merge;Sheet.Cells[5,1].HorizontalAlignment := 3;
  Excel.Visible := true;Excel := UnAssigned;
end;

procedure Tkassa.f3Click(Sender: TObject);
var s:string;kol:integer;f,danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;
begin
  if (dms.asossum_naqd.AsFloat=0) and (dms.asossum_plastik.AsFloat=0) and (dms.asossum_epos.AsFloat=0) and (dms.asossumma.AsFloat>0) then begin
   dms.asos.edit;
   dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;
   dms.asossum_naqd_ch.AsFloat:=dms.asossumma.AsFloat;
   dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat;
   dms.asos.post;
  end;
  if dms.asossumma.AsFloat < dms.asosqarz_summa.AsFloat then begin
    ShowMessage('Qarz summa umumiy summadan katta bo`lish mumkin emas !!!');exit;
  end;
  {if (dms.asossum_naqd_ch.AsFloat+dms.asoscheg_n.AsFloat) <> dms.asossum_naqd.AsFloat then begin
    ShowMessage('Naqd: '+dms.asossum_naqd_ch.AsString+'+'+dms.asoscheg_n.AsString+' teng emas '+dms.asossum_naqd.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;
  if (dms.asossum_plast_ch.AsFloat+dms.asoscheg_p.AsFloat) <> dms.asossum_plastik.AsFloat then begin
    ShowMessage('Plastik: '+dms.asossum_plast_ch.AsString+'+'+dms.asoscheg_p.AsString+' teng emas '+dms.asossum_plastik.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;
  if (dms.asossum_epos_ch.AsFloat+dms.asoscheg_e.AsFloat) <> dms.asossum_epos.AsFloat then begin
    ShowMessage('Pul o`tkazish: '+dms.asossum_epos_ch.AsString+'+'+dms.asoscheg_e.AsString+' teng emas '+dms.asossum_epos.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;}
    if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
    try
      if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
        //ShowMessage('sana kiritilmagan');exit;
      end;
    except
    end;

    DMS.asos_slave.First;f:=0;kol:=0;
    while not dms.asos_slave.Eof do begin
      if(dms.asosdollar.AsInteger=1) then
        f:=f+DMS.asos_slavekol.AsInteger*DMS.asos_slavesotish_d.AsFloat+DMS.asos_slavekol_in.AsInteger*DMS.asos_slavesotish_in_d.AsFloat
      else
        f:=f+DMS.asos_slavekol.AsInteger*DMS.asos_slavesotish.AsFloat+DMS.asos_slavekol_in.AsInteger*DMS.asos_slavesotish_in.AsFloat;
      dms.asos_slave.Next;
    end;
    if (floattostr(f)<>dms.asossumma.AsString) and (dms.asosdollar.AsInteger=0) then
    begin
      ShowMessage(floattostr(f)+' <> '+floattostr(dms.asossumma.AsFloat));
    end;
    if (floattostr(f)<>dms.asossum_d.AsString) and (dms.asosdollar.AsInteger=1) then
    begin
      ShowMessage(floattostr(f)+' <> '+floattostr(dms.asossum_d.AsFloat));
    end;
    dms.asos.Edit;
    dms.asosxodim_id.AsInteger:=StrToInt(admin_id);
    dms.asosprint_flag.AsFloat:=0;
    dms.asossana.AsDateTime:=StrToDate(datetostr(DMS.setupvaqt.AsDateTime));
    dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
    if ((dms.asosmobil.AsInteger=1) and (dms.asosdiler_id.AsInteger=1)) or (dms.asos.State=dsInsert) or (dms.asosdiler_id.AsInteger=0) or (dms.asosdiler_id.AsInteger=-1) then begin
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
        dms.asosdiler_id.AsInteger:=1;
        dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
        dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
    end;
    dms.asos.Post;
    dms.s_client.Refresh;
    dms.link.Close;dms.link.sql.Clear;
    dms.link.sql.Add('select s.id,s.opt2,srok,t.nom as s_tovar,t.kol_in as tkol_in,sum(s.kol) as kol,sum(s.kol_in) as kol_in,s.sotish,s.sotish_in,s.sotish_d,s.sotish_in_d from asos_slave s,s_tovar t where t.id=s.tovar_id and s.del_flag=1 and  s.asos_id='+dms.asosid.AsString+' group by tovar_id,s.sotish');
    dms.link.open;

  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
  dms.asos.open;
  if (not dms.asos.Locate('diler_id',0,[loCaseInsensitive])) then begin
    dms.asos.Append;
    if (dms.s_clientdollar.asinteger=2) then dms.asosdollar.AsInteger:=1;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;
  end;
  varaqClick(Sender);
  kub.SetFocus;
end;

procedure Tkassa.g_asosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var n:integer; holdColor: TColor;
begin
{if State = [gdFocused] then begin
    Tovarlar.Canvas.Brush.Color := clSilver;
    Tovarlar.Canvas.Font.Style := [fsBold];
    Tovarlar.Canvas.Font.Color := clBlack;
    Tovarlar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;}
  if gdSelected in State then begin
    g_asos.Canvas.Brush.Color := clLime;
    //Tovarlar.Canvas.Font.Style := [fsBold];
    g_asos.Canvas.Font.Color := clBlack;
    // 150119 Tovarlar.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  holdColor := g_asos.Canvas.Font.Color;
  if Column.FieldName = 'summa_ch' then begin
    if dms.asostur_oper.AsInteger = 3 then begin
      g_asos.Canvas.Font.Color := clred; //Brush
      g_asos.Canvas.Font.Style := [fsUnderline];
      g_asos.Canvas.Font.Style :=  [fsbold];
      g_asos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      g_asos.Canvas.Font.Color := holdColor;
    end;
  end;// nom
end;

procedure Tkassa.RzBitBtn5Click(Sender: TObject);
var s:string;
begin
  if (filtr_haridor.Value=0) or  sana1.Value=0  then exit;
  if filtr_haridor.Value>0 then
    s:=s+' h_id = '+IntToStr(filtr_haridor.Value);
  if sana1.Value>0 then
    s:=s+iif(s='','',' and ')+' sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value);

  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where '+s+' and changedate is not null and del_flag=1 and tur_oper in (2,3) and diler_id>0 and client_id='+admin_clid+' order by diler_id desc');
  dms.asos.open;
end;

procedure Tkassa.Label21DblClick(Sender: TObject);
begin
  if panel3.Visible=true then panel3.Visible:=false else panel3.Visible:=true;
end;

procedure Tkassa.Image2Click(Sender: TObject);
begin
  DMS.s_tovar.Refresh;DMS.shtrix.Refresh;
end;

procedure Tkassa.g_asosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var c:char;
begin
//ShowMessage (IntToStr(Ord(Key)));
case Key of
  17:
    if Panel3.Visible=true then
      Panel3.Visible:=false
    else
      Panel3.Visible:=true;

  69:   // e
      if Panel5.Visible=true then
        Panel5.Visible:=false
      else
        Panel5.Visible:=true;
end;
end;

procedure Tkassa.varaqf6Click(Sender: TObject);
begin
  if Trim(varaqf6.ActivePage.Caption)='+' then begin
    dms.asos.Append;
    if (dms.s_clientdollar.asinteger=2) then dms.asosdollar.AsInteger:=1;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;dms.asos.Refresh;
    varaqClick(sender);
    //varaqf6.Pages[dms.asos.RecNo-1].Color:=$00B4E6F0;varaqf6.Pages[dms.asos.RecNo-1].Caption:=dms.asossana.AsString;varaqf6.Pages[dms.asos.RecNo-1].tabVisible:=true;
    //varaqf6.Pages[dms.asos.RecNo].Color:=clLime;varaqf6.Pages[dms.asos.RecNo].Caption:=' + ';varaqf6.Pages[dms.asos.RecNo].tabVisible:=true;
  end
  else
  begin
    dms.asos.first;
    dms.asos.MoveBy(varaqf6.ActivePageIndex);
  end;
  kassa.qoldiq.Close;kassa.qoldiq.SQL.Clear;
  if dms.asostur_oper.value=3 then begin
    kassa.qoldiq.close;kassa.qoldiq.SQL.Clear;
    if  dms.asos_slavetovar_id.AsInteger=0 then
      kassa.qoldiq.sql.add('SELECT *,kol_in as t_in,sena_d as kirim_d,sena as kirim,id as tovar_id FROM s_tovar where del_flag=1 and id=0 order by nom')
    else
      kassa.qoldiq.sql.add('SELECT *,kol_in as t_in,sena_d as kirim_d,sena as kirim,id as tovar_id FROM s_tovar where del_flag=1 and id='+dms.asos_slavetovar_id.AsString+' order by nom');
  end
  else
  begin
    if  dms.asos_slavetovar_id.AsInteger=0 then
      kassa.qoldiq.SQL.Add('SELECT *,sum(kol) as kol_ost,sum(kol_in) as kol_in_ost,sum(kol_all) as kol_all_ost from ombor where tovar_id=0')
    else
      kassa.qoldiq.SQL.Add('SELECT *,sum(kol) as kol_ost,sum(kol_in) as kol_in_ost,sum(kol_all) as kol_all_ost from ombor where tovar_id='+dms.asos_slavetovar_id.AsString+'');

    kassa.qoldiq.SQL.Add(' GROUP by tovar_id order by tovar_id desc limit 30');
  end;
    kassa.qoldiq.Open;
end;

procedure Tkassa.Timer2Timer(Sender: TObject);
var s,s1,s2,s3,ts3:string;y:integer;
begin
  //if (Edit1.Text='') or (ed1='') then exit;
  timer2.Enabled:=false;
  DMS.s_tovar.Refresh;
  DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
end;

procedure Tkassa.qoldiqCalcFields(DataSet: TDataSet);
begin
  if  qoldiq.fieldbyname('dollar').AsInteger=0 then
  qoldiq.fieldbyname('kirim').AsFloat:=qoldiq.fieldbyname('kirim').AsFloat else
  qoldiq.fieldbyname('kirim').AsFloat:=qoldiq.fieldbyname('kirim_d').AsFloat;
end;

procedure Tkassa.Dialog1Click(Sender: TObject);
var s,s_old,ss,stel,telsms:string;kol:integer;f,d,danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;
begin
  if (dms.asossum_naqd.AsFloat=0) and (dms.asossum_plastik.AsFloat=0) and (dms.asossum_epos.AsFloat=0) and (dms.asossumma.AsFloat>0) then begin
    dms.asos.edit;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;
    dms.asossum_naqd_ch.AsFloat:=dms.asossumma.AsFloat;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat;
    dms.asos.post;
   end;
  if dms.asossumma.AsFloat < dms.asosqarz_summa.AsFloat then begin
    ShowMessage('Qarz summa umumiy summadan katta bo`lish mumkin emas !!!');exit;
  end;
  if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');kub.SetFocus;exit;end;
  try
    if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
      //ShowMessage('sana kiritilmagan');exit;
    end;
  except
  end;
  DMS.asos_slave.First;f:=0;d:=0;kol:=0;
  while not dms.asos_slave.Eof do begin
    {if(dms.asosdollar.AsInteger=1) then
      f:=f+DMS.asos_slavekol.AsInteger*DMS.asos_slavesotish_d.AsFloat+DMS.asos_slavekol_in.AsInteger*DMS.asos_slavesotish_in_d.AsFloat
    else
      f:=f+DMS.asos_slavekol.AsInteger*DMS.asos_slavesotish.AsFloat+DMS.asos_slavekol_in.AsInteger*DMS.asos_slavesotish_in.AsFloat;
    }
    if dms.s_clientdollar.AsInteger=2 then begin
      f:=f+dms.asos_slavekol.AsFloat*dms.asos_slavesotish_d.AsFloat+dms.asos_slavekol_in.AsFloat*dms.asos_slavesotish_in_d.AsFloat;
    end;  
    dms.asos_slave.Next;
  end;
  if (floattostr(f)<>dms.asossumma.AsString) and (dms.asosdollar.AsInteger=0) then begin
    ShowMessage(floattostr(f)+' <> '+floattostr(dms.asossumma.AsFloat));
  end;
  if (floattostr(d)<>dms.asossum_d.AsString) and (dms.asosdollar.AsInteger=1) then begin
    ShowMessage(floattostr(d)+' <> '+floattostr(dms.asossum_d.AsFloat));
  end;
  dms.asos.Edit;dms.asosprint_flag.AsFloat:=0;
  DMS.setup.Refresh;
  dms.asossana.AsDateTime:=StrToDate(datetostr(DMS.setupvaqt.AsDateTime));
  dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
  dms.asosxodim_id.Asinteger:=StrToInt(admin_id);
  if ((dms.asosmobil.AsInteger=1) and (dms.asosdiler_id.AsInteger=1)) or (dms.asos.State=dsInsert) or (dms.asosdiler_id.AsInteger=0) or (dms.asosdiler_id.AsInteger=-1) then begin
    dms.link.Close;dms.link.sql.Clear;
    if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
      dms.asosdiler_id.AsInteger:=1;
      dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
    end
    else begin
      dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
      dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;
  end;
  dms.asos.Post;
  dms.s_client.Refresh;
  dms.link.Close;dms.link.sql.Clear;
  dms.link.sql.Add('select s.opt2,s.id,srok,t.nom as s_tovar,t.kol_in as tkol_in,sum(s.kol) as kol,sum(s.kol_in) as kol_in,s.sotish,s.sotish_d,s.sotish_in,s.sotish_in_d from asos_slave s,s_tovar t where t.id=s.tovar_id and s.del_flag=1 and  s.asos_id='+dms.asosid.AsString+' group by tovar_id,s.sotish order by id');
  dms.link.open;
  if dms.asosh_id.AsString<>'' then begin
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
    dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
    dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.asosh_id.AsString+' order by id');
    //Memo1.Visible:=True;memo1.Lines.Clear;
    //memo1.Lines.Add(dms.main_link.SQL.Text);exit;
    dms.main_link.open;
    danq:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
    danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
    chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
    chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
    dms.main_link.Close;dms.main_link.SQL.Clear;
    dms.main_link.SQL.Add('SELECT sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_kirim,sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_d,0)) as b_kirimd,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_chiqim,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_d,0)) as b_chiqimd ');
    dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
    dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
    dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+dms.asosh_id.AsString);
    dms.main_link.SQL.Add(' order by id');
    dms.main_link.open;
    danq:=danq+dms.main_link.fieldbyname('b_chiqim').AsFloat-dms.main_link.fieldbyname('b_kirim').AsFloat;
    danqd:=danqd+dms.main_link.fieldbyname('b_chiqimd').AsFloat-dms.main_link.fieldbyname('b_kirimd').AsFloat;
    kirim:=dms.main_link.fieldbyname('o_kirim').AsFloat;
    kirimd:=dms.main_link.fieldbyname('o_kirimd').AsFloat;
    chiqim:=chiqim+dms.main_link.fieldbyname('o_chiqim').AsFloat;
    chiqimd:=chiqimd+dms.main_link.fieldbyname('o_chiqimd').AsFloat;
  end;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
  frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'���','�����')+'''';
  frxsf.Variables['summa_all']:=''''+dms.asossumma_ch.AsString+'''';
  frxsf.Variables['dollar']:=''''+SumNumToFull(dms.asossum_d_ch.AsFloat,'$','sent')+'''';
  frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'���','�����')+'''';
  if dms.asosh_id.AsInteger>0 then begin
    s:='';ss:='';s_old:='';
    if dms.s_clientdollar.AsInteger = 2 then begin
      s:='OLDINGI QARZDORLIQ:  <b>'+FloatToStr(danq+(chiqim-kirim))+'</b>  SO`M,   $ <b>'+FloatToStr(danqd+(chiqimd-kirimd))+'</b>  JORIY:  '+FloatToStr(danq+(chiqim-kirim)+DMS.asossumma_ch.AsFloat)+'  s`om ,   $ ( <b>'+FloatToStr(danqd+(chiqimd-kirimd)+DMS.asossum_d_ch.AsFloat)+'</b> )';
      ss:='OLDINGI QARZDORLIQ:  '+FloatToStr(danq+(chiqim-kirim))+' SOM,   $ '+FloatToStr(danqd+(chiqimd-kirimd))+'  JORIY:  '+FloatToStr(danq+(chiqim-kirim)+DMS.asossumma_ch.AsFloat)+'  s`om ,   $ ( '+FloatToStr(danqd+(chiqimd-kirimd)+DMS.asossum_d_ch.AsFloat)+' )';
    end
    else
    begin
      if danq+(chiqim-kirim)>0 then begin
        s:=#13#10+' qarz:'+FloatToStr(danq+(chiqim-kirim))+'  ('+dms.asosqarz_summa.AsString+') s`om';
        ss:=' qarz:'+FloatToStr(danq+(chiqim-kirim))+'  ('+dms.asosqarz_summa.AsString+') s`om';
        s_old:=FloatToStr(danq+(chiqim-kirim)-dms.asosqarz_summa.AsFloat);
      end;
      if (danqd+(chiqimd-kirimd))>0 then
      begin
        s:=s+iif(s='',' qarz:',' , ')+' dollar = '+FloatToStr(danqd+(chiqimd-kirimd))+' ('+dms.asosqarz_dollar.AsString+')';
        ss:=ss+iif(s='',' qarz:',' , ')+' dollar = '+FloatToStr(danqd+(chiqimd-kirimd))+' ('+dms.asosqarz_dollar.AsString+')';
        s_old:=s_old+' '+FloatToStr(danqd+(chiqimd-kirimd)-dms.asosqarz_dollar.AsFloat);

      end;
    end;
    frxsf.Variables['haridor']:=''''+s+'''';
    frxsf.Variables['eskiqarz']:=''''+s_old+'''';
    frxsf.Variables['qarz']:=''''+s+'''';
  end
  else
  begin
    frxsf.Variables['eskiqarz']:='''''';
    frxsf.Variables['haridor']:='''''';
    frxsf.Variables['qarz']:='''''';
  end;
  s:=StringReplace(dms.s_clientnom.AsString,'"','^',[rfReplaceAll]);
  s:=StringReplace(s,'"','^',[rfReplaceAll]);
  if DMS.asosh_id.AsInteger>0 then begin
    stel:='';
    DateSeparator := '-';ShortDateFormat := 'yyyy-mm-dd';
    if length(DMS.s_haridortelsms1.AsString)=9 then begin
      stel:='+998'+DMS.s_haridortelsms1.AsString;
      mlink.Close;mlink.sql.Clear;
      mlink.sql.Add('INSERT INTO prot_sms (id,zapros,rezult,sana,tel,flag,platforma,employee_phone) VALUES (NULL, "'+s+' : '+'...'+'", "chek", "'+DateTimeToStr(now)+'", "'+stel+'", 1,"chek", "+998'+dms.s_clienttelsms1.AsString+'")');
      mlink.ExecSQL;
    end;
    DateSeparator := '.';ShortDateFormat := 'dd.mm.yy';
  end; // h_id
  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.ShowDialog := true;
  frxsf.Height := 100;
  //frxsf.ShowReport;
  frxsf.Print;
  dms.asos.Close;dms.asos.SQL.Clear;
  //dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'" order by id desc');
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
  dms.asos.open;
  if (not dms.asos.Locate('diler_id',0,[loCaseInsensitive])) then begin
    dms.asos.Append;
    if (dms.s_clientdollar.asinteger=2) then dms.asosdollar.AsInteger:=1;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;
  end;
  varaqClick(Sender);
  kub.SetFocus;

end;

procedure Tkassa.cheg_nExit(Sender: TObject);
begin
  exit;
//  dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat-cheg_naqd.Value;
    dms.asossumma_ch.AsFloat:=RoundLess(dms.asossumma.AsFloat-cheg_n.Value,dms.s_clientchegirma.AsInteger);
    dms.asossum_naqd_ch.AsFloat:=dms.asossumma_ch.AsFloat;
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_click_ch.AsFloat:=0;
    dms.asos.Post;
    //if dms.asoschangedate.AsDateTime<>null then
    //izm('Naqd chegirma',dms.asosdiler_id.AsString,1,old_Value,dms.asoschangedate.AsDateTime,cheg_n.Value,dms.asosid.AsInteger);

end;

procedure Tkassa.Image6Click(Sender: TObject);
begin
  if dms.asossum_plast_ch.AsFloat>0 then begin
    if dms.asos.State=dsbrowse then dms.asos.Edit;
    dms.asossum_naqd_ch.AsFloat:=dms.asossumma_ch.AsFloat;
    dms.asossum_plast_ch.AsFloat:=0;
    dms.asos.Post;
  end;
  if dms.asossum_epos_ch.AsFloat>0 then begin
    if dms.asos.State=dsbrowse then dms.asos.Edit;
    dms.asossum_naqd_ch.AsFloat:=dms.asossumma_ch.AsFloat;
    dms.asossum_epos_ch.AsFloat:=0;
    dms.asos.Post;
  end;
  if dms.asossum_click_ch.AsFloat>0 then begin
    if dms.asos.State=dsbrowse then dms.asos.Edit;
    dms.asossum_naqd_ch.AsFloat:=dms.asossumma_ch.AsFloat;
    dms.asossum_click_ch.AsFloat:=0;
    dms.asos.Post;
  end;
end;

procedure Tkassa.cheg_nEnter(Sender: TObject);
begin
  cheg_n.SelectAll;
end;

procedure Tkassa.poisk_hKeyPress(Sender: TObject; var Key: Char);
var s,s1,s2,s3:string;y:integer;
begin
  if (Key = #13) then begin
  if Length(poisk_h.Text)>1 then begin
   dms.link.Close;dms.link.sql.Clear;
   dms.link.SQL.Add('select * from s_haridor WHERE del_flag=1 and ((telsms1 like "%'+lat_kril(poisk_h.Text)+'%") or (nom like "%'+lat_kril(poisk_h.Text)+'%") or (nom like "%'+poisk_h.Text+'%")) order by nom');
   dms.link.open;
  end;
end;
end;

procedure Tkassa.hEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  dms.s_haridor.Append;
  dms.s_haridoruser_id.value:=dms.s_user.FieldByName('id').AsInteger;
  dms.s_haridorclient_id.value:=dms.s_user.FieldByName('client_id').AsInteger;
  forma:='plus';
  s_haridor_edit.showmodal;
end;

procedure Tkassa.DBGridEh15DblClick(Sender: TObject);
begin
  if MessageDlg(' Bo`sh qatorlarni tozalaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
   dms.asos.First;
   while not dms.asos.eof do begin
     if dms.asos_slave.RecordCount=0 then
       dms.asos.Delete
     else
       dms.asos.next;
   end;
end;

procedure Tkassa.varaqf6DblClick(Sender: TObject);
begin
  dms.asos.Append;
  if (dms.s_clientdollar.asinteger=2) then dms.asosdollar.AsInteger:=1;
  dms.asostur_oper.AsInteger:=2;
  dms.asos.Post;dms.asos.Refresh;
  varaqClick(sender);
end;

procedure Tkassa.Ekrandakorish1Click(Sender: TObject);
var kol:integer;f,danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;s:string;
begin
  {if (dms.asossum_naqd.AsFloat=0) and (dms.asossum_plastik.AsFloat=0) and (dms.asossum_epos.AsFloat=0) and (dms.asossumma.AsFloat>0) then begin
    dms.asos.edit;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;
    dms.asossum_naqd_ch.AsFloat:=dms.asossumma.AsFloat;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat;
    dms.asos.post;
  end;}
  if dms.asossumma.AsFloat < dms.asosqarz_summa.AsFloat then begin
    ShowMessage('Qarz summa umumiy summadan katta bo`lish mumkin emas !!!');exit;
  end;
  if (dms.asossum_naqd_ch.AsFloat+dms.asoscheg_n.AsFloat) <> dms.asossum_naqd.AsFloat then begin
    ShowMessage('Naqd: '+dms.asossum_naqd_ch.AsString+'+'+dms.asoscheg_n.AsString+' teng emas '+dms.asossum_naqd.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;
  if (dms.asossum_plast_ch.AsFloat+dms.asoscheg_p.AsFloat) <> dms.asossum_plastik.AsFloat then begin
    ShowMessage('Plastik: '+dms.asossum_plast_ch.AsString+'+'+dms.asoscheg_p.AsString+' teng emas '+dms.asossum_plastik.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;
  if (dms.asossum_epos_ch.AsFloat+dms.asoscheg_e.AsFloat) <> dms.asossum_epos.AsFloat then begin
    ShowMessage('Pul o`tkazish: '+dms.asossum_epos_ch.AsString+'+'+dms.asoscheg_e.AsString+' teng emas '+dms.asossum_epos.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;
  if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
  DMS.asos_slave.First;f:=0;kol:=0;
  dms.asos.Edit;
  dms.asosxodim_id.AsInteger:=StrToInt(admin_id);


    dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
    if ((dms.asosmobil.AsInteger=1) and (dms.asosdiler_id.AsInteger=1)) or (dms.asos.State=dsInsert) or (dms.asosdiler_id.AsInteger=0) or (dms.asosdiler_id.AsInteger=-1) then begin
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
        dms.asosdiler_id.AsInteger:=1;
        dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
        dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
    end;
    dms.asos.Post;

    dms.link.Close;dms.link.sql.Clear;
    dms.link.sql.Add('select s.id,s.opt2,srok,t.nom as s_tovar,t.kol_in as tkol_in,sum(s.kol) as kol,sum(s.kol_in) as kol_in,s.sotish,s.sotish_in,s.sotish_d,s.sotish_in_d from asos_slave s,s_tovar t where t.id=s.tovar_id and s.del_flag=1 and  s.asos_id='+dms.asosid.AsString+' group by tovar_id,s.sotish order by s.id ');
    dms.link.open;
    dms.s_client.Refresh;

  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
  dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString+' order by id');
  dms.main_link.open;
  danq:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
  chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_kirim,sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_d,0)) as b_kirimd,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_chiqim,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_d,0)) as b_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+dms.s_haridorid.AsString);
  dms.main_link.SQL.Add(' order by id');
  dms.main_link.open;
  danq:=danq+dms.main_link.fieldbyname('b_chiqim').AsFloat-dms.main_link.fieldbyname('b_kirim').AsFloat;
  danqd:=danqd+dms.main_link.fieldbyname('b_chiqimd').AsFloat-dms.main_link.fieldbyname('b_kirimd').AsFloat;

  kirim:=dms.main_link.fieldbyname('o_kirim').AsFloat;
  kirimd:=dms.main_link.fieldbyname('o_kirimd').AsFloat;
  chiqim:=chiqim+dms.main_link.fieldbyname('o_chiqim').AsFloat;
  chiqimd:=chiqimd+dms.main_link.fieldbyname('o_chiqimd').AsFloat;

  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+a4shablon.Text);
  frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  frxsf.Variables['user_tel']:=''' , '+DMS.s_user.fieldbyname('phone_number').AsString+'''';

    frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'���','�����')+'''';
    frxsf.Variables['summa_all']:=''''+dms.asossumma_ch.AsString+'''';
    frxsf.Variables['dollar']:=''''+SumNumToFull(dms.asossum_d_ch.AsFloat,'$','sent')+'''';

    s:='';

    if a4shablon.Text = 'chekla4_dorital.fr3' then begin
    if (danq+(chiqim-kirim))<>0 then begin
      if dms.asosqarz_summa.AsFloat<>0 then
        s:=s+' JORIY QARZ: <b>'+dms.asosqarz_summa.AsString+'</b>';
      s:= s+' UMUMIY QARZ: <b>'+FloatToStr(danq+(chiqim-kirim))+'</b>';
      s:=s+' SO`M';
    end;
    if (danqd+(chiqimd-kirimd))<>0 then begin
      //if s<>'' then s:=s+'#13#10';
      if dms.asosqarz_dollar.AsFloat<>0 then
        s:=s+' JORIY QARZ: $ <b>'+dms.asosqarz_summa.AsString+'</b>';
      s:= 'UMUMIY QARZ: $ <b>'+FloatToStr(danqd+(chiqimd-kirimd))+'</b>';
    end;
    end
    else
    begin
      if (danq+(chiqim-kirim))<>0 then begin
        s:= 'QARZDORLIQ: <b>'+FloatToStr(danq+(chiqim-kirim))+'</b>';
        if dms.asosqarz_summa.AsFloat<>0 then
          s:=s+' , JORIY QARZ: <b>'+dms.asosqarz_summa.AsString+'</b> SO`M'
        else s:=s+'SO`M';
      end;
      if (danqd+(chiqimd-kirimd))<>0 then begin
        if s<>'' then s:=s+'#13#10';
        s:= 'QARZDORLIQ: $ <b>'+FloatToStr(danqd+(chiqimd-kirimd))+'</b>';
        if dms.asosqarz_dollar.AsFloat<>0 then
          s:=s+' , JORIY QARZ: $ <b>'+dms.asosqarz_summa.AsString+'</b>';
        end;
    end; // if
    if s<>'' then frxsf.Variables['qarz']:=''''+s+''''
    else frxsf.Variables['qarz']:='''''';
    frxsf.Variables['haridor']:='''''';

    frxsf.PrintOptions.Printer := a4Printers.Text;
    frxsf.SelectPrinter;frxsf.PrepareReport;
    frxsf.PrintOptions.ShowDialog := false;
    frxsf.ShowReport;
    //frxsf.Print;
    dms.asos.Close;dms.asos.SQL.Clear;
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
    dms.asos.open;
    if (not dms.asos.Locate('diler_id',0,[loCaseInsensitive])) then begin
      dms.asos.Append; 
      if (dms.s_clientdollar.asinteger=2) then dms.asosdollar.AsInteger:=1;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;
    end;
    varaqClick(Sender);
    kub.SetFocus;
end;

procedure Tkassa.Dialog2Click(Sender: TObject);
var kol:integer;f,danq,danqd,kirim,kirimd,chiqim,chiqimd:Currency;s:string;
begin
  {if (dms.asossum_naqd.AsFloat=0) and (dms.asossum_plastik.AsFloat=0) and (dms.asossum_epos.AsFloat=0) and (dms.asossumma.AsFloat>0) then begin
    dms.asos.edit;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;
    dms.asossum_naqd_ch.AsFloat:=dms.asossumma.AsFloat;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat;
    dms.asos.post;
  end;}
  if dms.asossumma.AsFloat < dms.asosqarz_summa.AsFloat then begin
    ShowMessage('Qarz summa umumiy summadan katta bo`lish mumkin emas !!!');exit;
  end;
  if (dms.asossum_naqd_ch.AsFloat+dms.asoscheg_n.AsFloat) <> dms.asossum_naqd.AsFloat then begin
    ShowMessage('Naqd: '+dms.asossum_naqd_ch.AsString+'+'+dms.asoscheg_n.AsString+' teng emas '+dms.asossum_naqd.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;
  if (dms.asossum_plast_ch.AsFloat+dms.asoscheg_p.AsFloat) <> dms.asossum_plastik.AsFloat then begin
    ShowMessage('Plastik: '+dms.asossum_plast_ch.AsString+'+'+dms.asoscheg_p.AsString+' teng emas '+dms.asossum_plastik.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;
  if (dms.asossum_epos_ch.AsFloat+dms.asoscheg_e.AsFloat) <> dms.asossum_epos.AsFloat then begin
    ShowMessage('Pul o`tkazish: '+dms.asossum_epos_ch.AsString+'+'+dms.asoscheg_e.AsString+' teng emas '+dms.asossum_epos.AsString+#13+'+998935602290 ga telegramm orqali jo`nating !!!');
  end;
  if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
  DMS.asos_slave.First;f:=0;kol:=0;
  dms.asos.Edit;
  dms.asosxodim_id.AsInteger:=StrToInt(admin_id);


    dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
    if ((dms.asosmobil.AsInteger=1) and (dms.asosdiler_id.AsInteger=1)) or (dms.asos.State=dsInsert) or (dms.asosdiler_id.AsInteger=0) or (dms.asosdiler_id.AsInteger=-1) then begin
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
        dms.asosdiler_id.AsInteger:=1;
        dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
        dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
    end;
    dms.asos.Post;

    dms.link.Close;dms.link.sql.Clear;
    dms.link.sql.Add('select s.id,s.opt2,srok,t.nom as s_tovar,t.kol_in as tkol_in,sum(s.kol) as kol,sum(s.kol_in) as kol_in,s.sotish,s.sotish_in,s.sotish_d,s.sotish_in_d from asos_slave s,s_tovar t where t.id=s.tovar_id and s.del_flag=1 and  s.asos_id='+dms.asosid.AsString+' group by tovar_id,s.sotish order by s.id ');
    dms.link.open;
    dms.s_client.Refresh;

  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_dollar,0)) as b_dollar,sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
  dms.main_link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_dollar,0)) as o_dollar,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
  dms.main_link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString+' order by id');
  dms.main_link.open;
  danq:=dms.main_link.fieldbyname('b_summa').AsFloat+dms.main_link.fieldbyname('b_epos').AsFloat;
  danqd:=dms.main_link.fieldbyname('b_dollar').AsFloat;
  chiqim:=dms.main_link.fieldbyname('o_summa').AsFloat+dms.main_link.fieldbyname('o_epos').AsFloat;
  chiqimd:=dms.main_link.fieldbyname('o_dollar').AsFloat;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('SELECT sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_kirim,sum(if(vid in (7,17,25,20) and d_pl < '+kasaya(now)+',sena_d,0)) as b_kirimd,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_chiqim,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_d,0)) as b_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(',sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (7,17,25,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_kirimd,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim,sum(if(vid in (8,18,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_d,0)) as o_chiqimd ');
  dms.main_link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+dms.s_haridorid.AsString);
  dms.main_link.SQL.Add(' order by id');
  dms.main_link.open;
  danq:=danq+dms.main_link.fieldbyname('b_chiqim').AsFloat-dms.main_link.fieldbyname('b_kirim').AsFloat;
  danqd:=danqd+dms.main_link.fieldbyname('b_chiqimd').AsFloat-dms.main_link.fieldbyname('b_kirimd').AsFloat;

  kirim:=dms.main_link.fieldbyname('o_kirim').AsFloat;
  kirimd:=dms.main_link.fieldbyname('o_kirimd').AsFloat;
  chiqim:=chiqim+dms.main_link.fieldbyname('o_chiqim').AsFloat;
  chiqimd:=chiqimd+dms.main_link.fieldbyname('o_chiqimd').AsFloat;

  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+a4shablon.Text);
  frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  frxsf.Variables['user_tel']:=''' , '+DMS.s_user.fieldbyname('phone_number').AsString+'''';

    frxsf.Variables['summa']:=''''+SumNumToFull(dms.asossumma_ch.AsFloat,'���','�����')+'''';
    frxsf.Variables['summa_all']:=''''+dms.asossumma_ch.AsString+'''';
    frxsf.Variables['dollar']:=''''+SumNumToFull(dms.asossum_d_ch.AsFloat,'$','sent')+'''';

    s:='';

    if a4shablon.Text = 'chekla4_dorital.fr3' then begin
    if (danq+(chiqim-kirim))<>0 then begin
      if dms.asosqarz_summa.AsFloat<>0 then
        s:=s+' JORIY QARZ: <b>'+dms.asosqarz_summa.AsString+'</b>';
      s:= s+' UMUMIY QARZ: <b>'+FloatToStr(danq+(chiqim-kirim))+'</b>';
      s:=s+' SO`M';
    end;
    if (danqd+(chiqimd-kirimd))<>0 then begin
      //if s<>'' then s:=s+'#13#10';
      if dms.asosqarz_dollar.AsFloat<>0 then
        s:=s+' JORIY QARZ: $ <b>'+dms.asosqarz_summa.AsString+'</b>';
      s:= 'UMUMIY QARZ: $ <b>'+FloatToStr(danqd+(chiqimd-kirimd))+'</b>';
    end;
    end
    else
    begin
      if (danq+(chiqim-kirim))<>0 then begin
        s:= 'QARZDORLIQ: <b>'+FloatToStr(danq+(chiqim-kirim))+'</b>';
        if dms.asosqarz_summa.AsFloat<>0 then
          s:=s+' , JORIY QARZ: <b>'+dms.asosqarz_summa.AsString+'</b> SO`M'
        else s:=s+'SO`M';
      end;
      if (danqd+(chiqimd-kirimd))<>0 then begin
        if s<>'' then s:=s+'#13#10';
        s:= 'QARZDORLIQ: $ <b>'+FloatToStr(danqd+(chiqimd-kirimd))+'</b>';
        if dms.asosqarz_dollar.AsFloat<>0 then
          s:=s+' , JORIY QARZ: $ <b>'+dms.asosqarz_summa.AsString+'</b>';
        end;
    end; // if
    if s<>'' then frxsf.Variables['qarz']:=''''+s+''''
    else frxsf.Variables['qarz']:='''''';
    frxsf.Variables['haridor']:='''''';

    frxsf.PrintOptions.Printer := a4Printers.Text;
    frxsf.SelectPrinter;frxsf.PrepareReport;
    frxsf.PrintOptions.ShowDialog := true;
    //frxsf.ShowReport;
    frxsf.Print;
    dms.asos.Close;dms.asos.SQL.Clear;
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
    dms.asos.open;
    if (not dms.asos.Locate('diler_id',0,[loCaseInsensitive])) then begin
      dms.asos.Append;
      if (dms.s_clientdollar.asinteger=2) then dms.asosdollar.AsInteger:=1;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;
    end;
    varaqClick(Sender);
    kub.SetFocus;
end;

procedure Tkassa.newClick(Sender: TObject);
begin
  //www.
  if (dms.asosh_id.AsInteger=0) then begin
    dms.s_haridor.Append;
    dms.s_haridoruser_id.value:=dms.s_user.FieldByName('id').AsInteger;
    dms.s_haridorclient_id.value:=dms.s_user.FieldByName('client_id').AsInteger;
    dms.s_haridornom.AsString:=nom_.Text;dms.s_haridortelsms1.AsString:=tel_.Text;
    dms.s_haridor.post;
    DMS.haridorlar.Refresh;

    dms.asos.Edit;
    dms.asosh_id.AsInteger:=dms.s_haridorid.AsInteger;
    dms.asos.Post;
    dms.asos.Refresh;
    hfio_DblClick(sender);
  end;
  if pechatlash.Checked=True then f5Click(sender);
  exit;




  ///
    if dms.asos.RecordCount=0 then
  begin
    dms.asos.Append;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;

  end;
  if (dms.asosh_id.AsInteger=0) then begin
    dms.s_haridor.Append;
    dms.s_haridoruser_id.value:=dms.s_user.FieldByName('id').AsInteger;
    dms.s_haridorclient_id.value:=dms.s_user.FieldByName('client_id').AsInteger;
    dms.s_haridornom.AsString:=nom_.Text;dms.s_haridortelsms1.AsString:=tel_.Text;
    dms.s_haridor.post;
    DMS.haridorlar.Refresh;

    dms.asos.Edit;
    dms.asosh_id.AsInteger:=dms.s_haridorid.AsInteger;
    dms.asos.Post;
    dms.asos.Refresh;
    hfio_DblClick(sender);
  end;
  dms.asos_slaveasos_id.Value:=dms.asosid.AsInteger;
  dms.asos_slave.Post;
  nom_.SetFocus;
  if pechatlash.Checked=True then f5Click(sender);

end;

procedure Tkassa.nom_Exit(Sender: TObject);
 var c:Char;
begin
  if nom_.Text='' then exit;

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id,nom,telsms1 from s_haridor h WHERE (del_flag=1 and nom like  "%'+nom_.Text+'%")');
  dms.link.open;

  if dms.link.RecordCount=1 then begin
      nom_.Text:=dms.link.fieldbyname('nom').AsString;
      nom_.Enabled:=false;tel_.Enabled:=false;
      dms.asos.Edit;
      dms.asosh_id.AsInteger:=dms.link.fieldbyname('id').AsInteger;
      dms.asos.Post;
      Label48Click(sender);
      //poisk_h.Text:=nom_.Text;
      //c:=#13;
      //poisk_hKeyPress(Sender,c);
      dms.haridorlar.Refresh;dms.asos.Refresh;
  end;
  if dms.link.RecordCount>1 then begin

      poisk_h.Text:=nom_.Text;
      c:=#13;
      poisk_hKeyPress(Sender,c);
      dms.haridorlar.Refresh;dms.asos.Refresh;
      nom_.Text:='';
      gclient.SetFocus;
  end;
  if dms.link.RecordCount=0 then begin

      tel_.Text:='';
      tel_.SetFocus;
      exit;
  end;
end;

procedure Tkassa.tel_Exit(Sender: TObject);
var c:Char;
begin
  If tel_.Text='' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select id,nom,telsms1 from s_haridor h WHERE (del_flag=1 and telsms1 like "%'+tel_.Text+'%")');
  dms.link.open;
  if dms.link.RecordCount=1 then begin
      nom_.Text:=dms.link.fieldbyname('nom').AsString;
      nom_.Enabled:=false;tel_.Enabled:=false;
      dms.asos.Edit;
      dms.asosh_id.AsInteger:=DMS.s_haridorid.AsInteger;
      dms.asos.Post;
      poisk_h.Text:=tel_.Text;
      c:=#13;
      poisk_hKeyPress(Sender,c);
      dms.haridorlar.Refresh;dms.asos.Refresh;
      
  end;
  if dms.link.RecordCount>1 then begin
    //if MessageDlg(' Diqqat, telefon nomerini ri`yhatdan tanlang',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      //nom_.Text:=dms.link.fieldbyname('nom').AsString;
      //nom_.Enabled:=false;tel_.Enabled:=false;
      poisk_h.Text:=nom_.Text;
      c:=#13;
      poisk_hKeyPress(Sender,c);
      dms.haridorlar.Refresh;dms.asos.Refresh;
      gclient.SetFocus;
    //end;
  end;
  If (tel_.text<>'') and (nom_.text='') then nom_.SetFocus;
end;

procedure Tkassa.nom_KeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tkassa.tel_KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tkassa.gclientDblClick(Sender: TObject);
begin

    nom_.Text:=dms.link.fieldbyname('nom').AsString;
    tel_.Text:=DMS.link.fieldbyname('telsms1').AsString;
    nom_.Enabled:=false;tel_.Enabled:=false;
  dms.asos.Edit;
  dms.asosh_id.AsInteger:=DMS.link.fieldbyname('id').AsInteger;
  dms.asos.Post;
  Label48Click(sender);
  //dms.asos.Refresh;
  poisk_h.SetFocus;
    Label48Click(sender);

end;

procedure Tkassa.bekorClick(Sender: TObject);
begin
  nom_.Enabled:=true;tel_.Enabled:=true;
  nom_.SetFocus;
end;

procedure Tkassa.RzBitBtn6Click(Sender: TObject);
begin
  if dms.asos_slave.RecordCount>0 then
  begin
  dms.asos_slave.Edit;
  dms.asos_slaveopt1.AsInteger:=0;
  //dms.asos_slavetovar_id.AsInteger:=1;
  dms.asos_slavesena.AsInteger:=0;
  dms.asos_slavesotish.AsInteger:=0;
  dms.asos_slavesumma.AsInteger:=0;
  dms.asos_slave.post;
  end;
  dms.asos.Edit;
  dms.asosh_id.AsInteger:=0;
  dms.asos.post;
  dms.asos.Refresh;dms.asos_slave.Refresh;
  nom_.Enabled:=true;tel_.Enabled:=true;nom_.SetFocus;
end;

procedure Tkassa.cbbErrorCorrectionLevelChange(Sender: TObject);
begin
  //RemakeQR;
end;

procedure Tkassa.cmbEncodingChange(Sender: TObject);
begin
  //RemakeQR;
  mmoEncodedData.Text := FQRCode.FilteredData;
end;

procedure Tkassa.cbbDrawingModeChange(Sender: TObject);
begin
  dlgSaveToFile.FilterIndex := Ord(TQRDrawingMode(cbbDrawingMode.ItemIndex
    div 2) <> drwBitmap) + 1;
  pbPreview.Repaint
end;

procedure Tkassa.FormDestroy(Sender: TObject);
begin
  FQRCode.Free;
end;

procedure Tkassa.QRCodeClick(Sender: TObject);
var Bmp: TBitmap;Jpg: TJPEGImage;rec:Trect;chap,tepa,varaq,v_in,k,k_in:integer;
j:integer;S, T : TFileStream;nomi_s,r,god,opf:string;nomi,Shape,vstart, vend:OleVariant;NameShape:OleVariant;
begin
  if DMS.link.RecordCount=0 then exit;
  if DMS.link.fieldbyname('nom').AsString='' then exit;
  if DMS.link.fieldbyname('nom').AsString<>'' then begin
    RemakeQR(DMS.link.fieldbyname('nom').AsString);
    Bmp := nil;
    try
      Bmp := TBitmap.Create;
      MakeBmp(Bmp, 2, FQRCode, clrbxBackground.Selected,
        clrbxForeground.Selected, udCornerThickness.Position);
    except
      Bmp.Free;
      raise;
    end;
    Clipboard.Assign(Bmp);
  end;

  nomi:=DMS.link.fieldbyname('nom').AsString+'.doc';
  nomi:=ExtractFilePath(Application.ExeName)+'file\'+nomi;nomi_s:=nomi;
  S := TFileStream.Create(ExtractFilePath(Application.ExeName)+'shablon\kart6_4.sab', fmOpenRead);
  try T := TFileStream.Create(nomi, fmOpenWrite or fmCreate);
  try T.CopyFrom(S, S.Size );FileSetDate(T.Handle,FileGetDate(S.Handle));finally T.Free;end;finally S.Free;end;
  MSWord1.ScreenRefresh;
  MSWord1.Documents.Open2000(nomi,EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,  EmptyParam, EmptyParam, EmptyParam,  EmptyParam, EmptyParam);
  WordDocument1.ConnectTo(MSWord1.ActiveDocument);
  MSWord1.Options.CheckSpellingAsYouType:=False;
  MSWord1.Options.CheckGrammarAsYouType:=False;
  qidir:='[qr]';almash:='';
  MSWord1.Selection.Find.Execute(qidir,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,Wrap,EmptyParam,almash,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam);
  MSWord1.Selection.Paste;
  //MSWord1.Selection.InlineShapes.AddPicture(ExtractFilePath(Application.ExeName)+'file\c_'+ts_mijoz.fieldbyname('attachment_id').AsString+'.jpg', False, True,EmptyParam)
  WordDocument1.SaveAs;
  frxsf.PrintOptions.Printer := yorliqPrinters.Text;  //MSWord1.ActivePrinter:='TSC TDP-245';
  MSWord1.PrintOut;
  WordDocument1.Disconnect;
  MSWord1.Quit;
  MSWord1.Disconnect;

  //ShellExecute(handle,nil,pchar(nomi_s),nil,nil,SW_RESTORE);
end;

procedure Tkassa.Seriayanitovarbimanochirish1Click(Sender: TObject);
var Bmp: TBitmap;Jpg: TJPEGImage;rec:Trect;chap,tepa,varaq,v_in,k,k_in:integer;
j:integer;S, T : TFileStream;nomi_s,r,god,opf:string;nomi,Shape,vstart, vend:OleVariant;NameShape:OleVariant;
begin
if dms.asoshfio.AsString<>'' then begin
    RemakeQR(dms.asoshfio.AsString);
    Bmp := nil;
    try
      Bmp := TBitmap.Create;
      MakeBmp(Bmp, 3, FQRCode, clrbxBackground.Selected,
        clrbxForeground.Selected, udCornerThickness.Position);
    except
      Bmp.Free;
      raise;
    end;
    Clipboard.Assign(Bmp);
  end;

  nomi:=DMS.asoshfio.AsString+'.doc';
  nomi:=ExtractFilePath(Application.ExeName)+'file\'+nomi;nomi_s:=nomi;
  S := TFileStream.Create(ExtractFilePath(Application.ExeName)+'shablon\kart6_4.sab', fmOpenRead);
  try T := TFileStream.Create(nomi, fmOpenWrite or fmCreate);
  try T.CopyFrom(S, S.Size );FileSetDate(T.Handle,FileGetDate(S.Handle));finally T.Free;end;finally S.Free;end;
  MSWord1.ScreenRefresh;
  MSWord1.ActiveDocument.Activate;              // ? ��?��
  MSWord1.Documents.Open2000(nomi,EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,  EmptyParam, EmptyParam, EmptyParam,  EmptyParam, EmptyParam);
  WordDocument1.ConnectTo(MSWord1.ActiveDocument);
  MSWord1.Options.CheckSpellingAsYouType:=False;
  MSWord1.Options.CheckGrammarAsYouType:=False;
  qidir:='[qr]';almash:='';
  MSWord1.Selection.Find.Execute(qidir,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,Wrap,EmptyParam,almash,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam);
  MSWord1.Selection.Paste;
  //MSWord1.Selection.InlineShapes.AddPicture(ExtractFilePath(Application.ExeName)+'file\c_'+ts_mijoz.fieldbyname('attachment_id').AsString+'.jpg', False, True,EmptyParam)
  WordDocument1.Save;
  //MSWord1.ActivePrinter:='TSC TDP-245';
  MSWord1.PrintOut;
  WordDocument1.Disconnect;
  MSWord1.Quit;
  MSWord1.Disconnect;

end;

procedure Tkassa.newExit(Sender: TObject);
begin
 new.Color:= clTeal;
end;

procedure Tkassa.newEnter(Sender: TObject);
begin
 new.Color:= clFuchsia;
end;

procedure Tkassa.hfio_DblClick(Sender: TObject);
var Bmp: TBitmap;Jpg: TJPEGImage;rec:Trect;chap,tepa,varaq,v_in,k,k_in:integer;
j:integer;S, T : TFileStream;nomi_s,r,god,opf:string;nomi,Shape,vstart, vend:OleVariant;NameShape:OleVariant;
begin
if dms.asoshfio.AsString<>'' then begin
    RemakeQR(dms.asoshfio.AsString);
    Bmp := nil;
    try
      Bmp := TBitmap.Create;
      MakeBmp(Bmp, 2, FQRCode, clrbxBackground.Selected,
        clrbxForeground.Selected, udCornerThickness.Position);
    except
      Bmp.Free;
      raise;
    end;
    Clipboard.Assign(Bmp);
  end;

  nomi:=DMS.asoshfio.AsString+'.doc';
  nomi:=ExtractFilePath(Application.ExeName)+'file\'+nomi;nomi_s:=nomi;
  S := TFileStream.Create(ExtractFilePath(Application.ExeName)+'shablon\kart6_4.sab', fmOpenRead);
  try T := TFileStream.Create(nomi, fmOpenWrite or fmCreate);
  try T.CopyFrom(S, S.Size );FileSetDate(T.Handle,FileGetDate(S.Handle));finally T.Free;end;finally S.Free;end;
  MSWord1.ScreenRefresh;
  MSWord1.Documents.Open2000(nomi,EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,  EmptyParam, EmptyParam, EmptyParam,  EmptyParam, EmptyParam);
  WordDocument1.ConnectTo(MSWord1.ActiveDocument);
  MSWord1.Options.CheckSpellingAsYouType:=False;
  MSWord1.Options.CheckGrammarAsYouType:=False;
  qidir:='[qr]';almash:='';
  MSWord1.Selection.Find.Execute(qidir,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,Wrap,EmptyParam,almash,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam);
  MSWord1.Selection.Paste;
  //MSWord1.Selection.InlineShapes.AddPicture(ExtractFilePath(Application.ExeName)+'file\c_'+ts_mijoz.fieldbyname('attachment_id').AsString+'.jpg', False, True,EmptyParam)
  WordDocument1.SaveAs;
  frxsf.PrintOptions.Printer := yorliqPrinters.Text;  //MSWord1.ActivePrinter:='TSC TDP-245';
  MSWord1.PrintOut;
  WordDocument1.Disconnect;
  MSWord1.Quit;
  MSWord1.Disconnect;

  //ShellExecute(handle,nil,pchar(nomi_s),nil,nil,SW_RESTORE);
end;

procedure Tkassa.Label48Click(Sender: TObject);
var f,n:Currency;
begin
  //if dms.asosh_id.AsString='' then exit;
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select a.id,a.diler_id,a.sana, h.nom,h.telsms1,a.kurs,a.summa,qabul_sana from asos a,s_haridor h WHERE a.h_id=h.id and  a.del_flag=1 and ');
  //dms.main_link.SQL.Add(' a.id <> '+dms.asosid.AsString+'  and a.h_id='+dms.asosh_id.AsString+'  and a.qabul_sana is null order by a.id');
  dms.main_link.SQL.Add(' a.h_id="'+dms.asosh_id.AsString+'"  and a.qabul_sana is null order by a.id');
  //dms.main_link.Close;
  //memo2.Visible:=true;memo2.Lines.Add(dms.main_link.SQL.Text);
  dms.main_link.open;
  f:=0;n:=0;
  dms.main_link.First;
  while not dms.main_link.eof do begin
      if (DMS.asosid.AsInteger<>dms.main_link.FieldByName('id').AsInteger) then begin
        f:=f+dms.main_link.fieldbyname('summa').AsFloat;
        n:=n+dms.main_link.fieldbyname('kurs').AsFloat;
      end;
    dms.main_link.Next;
  end;
  Label48.Caption:='Bonus cheklar = ' + IntToStr(dms.main_link.RecordCount)+' | m3 = ' + FloatToStr(n*100/100);
  if dms.main_link.RecordCount>10 then
  begin
    ShowMessage('Diqqat !! Mijozga bonus hisoblanadi !');
    bonus.Checked:=true;bonus.Enabled:=false;
    DMS.asos.Edit;
    DMS.asoscheg_n.AsFloat:=f*10/100;
    DMS.asoscheg_d.AsFloat:=n*10/100;
    DMS.asossumma_ch.AsFloat:=DMS.asossumma.AsFloat-f*10/100;

    DMS.asos.post;
  end
  else
    begin bonus.Checked:=false;bonus.Enabled:=true;
    end;

end;

procedure Tkassa.chekniochirish3Click(Sender: TObject);
var k,k_in:integer;
begin
  if dms.k_asos.RecordCount=0 then exit;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
  qoldiq.open;

  if (not  DMS.asos.Locate('id',dms.k_asosid.AsInteger,[loCaseInsensitive])) then begin
    ShowMessage('Chek topilmadi');exit;
  end;
  k:=0;k_in:=0;
  if MessageDlg(dms.asosdiler_id.AsString+' -  sonli chekni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    kassa.Caption:=inttostr(dms.asosid.AsInteger);

    dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('update s_tovar set upakavka = null where id='+DMS.s_tovarid.AsString);
      dms.link.ExecSQL;
      if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
      if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
      //if DMS.s_tovarqoldiq.AsString='Y' then minus(k,k_in);
      dms.asos_slave.edit;dms.asos_slavedel_flag.AsInteger:=0;dms.asos_slave.post;
      dms.asos_slave.Next;
    end;
    kassa.Caption:=kassa.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.edit;
    dms.asosdel_flag.AsInteger:=0;
    dms.asos.post;
    kassa.Caption:=kassa.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.Refresh;
    dms.k_asos.Refresh;
    dms.asos_slave.refresh;
    if qoldiq.Active then qoldiq.Refresh;
  end;


end;

procedure Tkassa.kubExit(Sender: TObject);
var
  vKurs, vSumma: Double;
  vAsosId: Integer;
begin
  if VarIsNull(kub.Value) or VarIsNull(sot.Value) then
    Exit;
  if sot.Value = 0 then
    Exit;

  vKurs := kub.Value;
  vSumma := RoundTo(vKurs * sot.Value, -2);
  jami.Value := vSumma;

  vAsosId := dms.asosid.AsInteger;
  if vAsosId = 0 then
    Exit;

  sql.Close;
  sql.SQL.Clear;
  sql.SQL.Add('UPDATE asos set kurs = :kurs, summa = :summa where id = :id');
  sql.Params.ParamByName('kurs').AsFloat := vKurs;
  sql.Params.ParamByName('summa').AsFloat := vSumma;
  sql.Params.ParamByName('id').AsInteger := vAsosId;
  sql.ExecSQL;
  dms.asos.Refresh;
end;

procedure Tkassa.jamiKeyPress(Sender: TObject; var Key: Char);
begin
  if (jami.Value=0) or VarIsNull(sot.Value) then
    Exit;

  kub.Value := RoundTo(jami.Value / sot.Value, -3);
  sql.Close;
  sql.SQL.Clear;
  sql.SQL.Add('UPDATE asos set kurs = :kurs, summa = :summa where id = :id');
  sql.Params.ParamByName('kurs').AsFloat := dms.asos_slaveopt1.AsFloat;
  sql.Params.ParamByName('summa').AsFloat := dms.asos_slavesumma.AsFloat;
  sql.Params.ParamByName('id').AsInteger := dms.asosid.AsInteger;
  sql.ExecSQL;
  dms.asos.Refresh;

  if nom_.Text<>'' then
    new.SetFocus
  else
    nom_.SetFocus;
end;

procedure Tkassa.Label44DblClick(Sender: TObject);
var f,n:Currency;d:TDateTime;
begin
  f:=0;n:=0;d:=now;
  if bonus.Checked=false then exit;
  dms.main_link.First;
  while (not dms.main_link.eof) do begin
    if (DMS.asosid.AsInteger<>dms.main_link.FieldByName('id').AsInteger) then begin
      f:=f+dms.main_link.fieldbyname('summa').AsFloat;
      n:=n+dms.main_link.fieldbyname('kurs').AsFloat;
      sql.close;sql.SQL.Clear;
      sql.SQL.Add('UPDATE asos set qabul_sana = '+kasayatime(d)+' where id = '+dms.main_link.fieldbyname('id').AsString);
      sql.ExecSQL;
      //Memo2.Visible:=true;Memo2.Lines.Add(sql.SQL.Text);exit;
    end;
    dms.main_link.Next;
  end;
  DMS.asos.Edit;
  dms.asoscheg_d.AsFloat:=n*10/100;
  dms.asoscheg_n.AsFloat:=f*10/100;
  if DMS.asossumma.AsFloat>0 then begin
    DMS.asossumma_ch.AsFloat:=DMS.asos_slavesumma.AsFloat-f*10/100;
    DMS.asossum_d_ch.AsFloat:=DMS.asos_slaveopt1.AsFloat-n*10/100;
    DMS.asosqabul_sana.AsDateTime:=d;
  end;
  DMS.asos.post;

  dms.main_link.Refresh;

end;

procedure Tkassa.sotExit(Sender: TObject);
begin
  if dms.asoskurs.AsFloat=0 then begin
  dms.asos.Edit;
  dms.asossumma.AsFloat:=jami.Value;
  dms.asoskurs.AsFloat:=kub.Value;
  dms.asos.Post;
  end;

end;

end.
