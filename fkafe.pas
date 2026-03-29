
unit fkafe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, DBCtrls, Grids, DBGrids, GridsEh,
  inifiles,IdGlobal,
  RzSplit, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus,
  SUIPopupMenu, jpeg, DBGridEh, DBLookupEh, frxDesgn, frxClass, frxDBSet,
  Buttons, RzSpnEdt, DBCtrlsEh, RzTabs, DB, RzPanel, ExtCtrls, RzDBCmbo,
  RzEdit, RzDBEdit, RzLabel, RzDBLbl, RzRadGrp, RzDBRGrp, RzLstBox,
  RzDBList, frxOLE; //FileCtrl,
const
{символы десятичной системы}
LetInteger: array[0..9]of Char=('0','1','2','3','4','5','6','7','8','9');
{буквы EN раскладки}
EngLet: string ='`qwertyuiop[]asdfghjkl;''zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>';
{буквы RU раскладки}
RusLet: string ='ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ';
type
  Tkafe = class(TForm)
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
    RzSizePanel1: TRzSizePanel;
    f5: TRzBitBtn;
    f8: TRzBitBtn;
    f7: TRzBitBtn;
    RzSizePanel2: TRzSizePanel;
    g_asos: TDBGridEh;
    Label7: TLabel;
    RzSizePanel4: TRzSizePanel;
    Label2: TLabel;
    Label8: TLabel;
    cbPrinters: TComboBox;
    chek_del: TsuiPopupMenu;
    MenuItem3: TMenuItem;
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
    f6: TRzBitBtn;
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
    DBGridEh9: TDBGridEh;
    DBGridEh10: TDBGridEh;
    Pechat: TRzBitBtn;
    Ekran: TRzBitBtn;
    f11: TRzBitBtn;
    f12: TRzBitBtn;
    cheknitahrirlash1: TMenuItem;
    f9: TRzBitBtn;
    f10: TRzBitBtn;
    TabSheet9: TRzTabSheet;
    gpl: TDBGridEh;
    Kassadanpulniexhish1: TMenuItem;
    Gredit: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    d_pl: TDBDateTimeEditEh;
    vid: TRzDBLookupComboBox;
    Panel2: TPanel;
    DBGridEh13: TDBGridEh;
    Group_sbor: TGroupBox;
    toza: TRzBitBtn;
    hisobla: TRzBitBtn;
    DBGridEh11: TDBGridEh;
    diler: TRzDBLookupComboBox;
    TabSheet10: TRzTabSheet;
    lvo: TLabel;
    vo: TRzDBLookupComboBox;
    Label19: TLabel;
    Label20: TLabel;
    tplpopup: TsuiPopupMenu;
    newsfm: TMenuItem;
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    gform: TGroupBox;
    Label9: TLabel;
    Label25: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Lombor: TLabel;
    Label17: TLabel;
    sana: TDBDateTimeEditEh;
    nomer: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    shartnoma: TDBLookupComboboxEh;
    ombor: TDBLookupComboboxEh;
    DBGridEh12: TDBGridEh;
    DBGridEh14: TDBGridEh;
    Label18: TLabel;
    haridor: TRzDBLookupComboBox;
    factura: TRzBitBtn;
    harid: TfrxDBDataset;
    s_diler: TfrxDBDataset;
    Dxpl: TDataSource;
    xpl: TZQuery;
    gplid: TIntegerField;
    gplbank_id: TIntegerField;
    gpln_pl: TIntegerField;
    gpln_dok: TStringField;
    gpld_pl: TDateField;
    gplrssvoy: TStringField;
    gplrs: TStringField;
    gplvo: TSmallintField;
    gplnn: TSmallintField;
    gplclient_id: TIntegerField;
    gplsena_pl: TFloatField;
    gplsaldo: TFloatField;
    gplost_pl: TFloatField;
    gplvid: TSmallintField;
    gplchangedate: TDateField;
    gpldel_flag: TSmallintField;
    gpldiler_id: TIntegerField;
    gplh_id: TIntegerField;
    gpldiler: TStringField;
    gplharidor: TStringField;
    gplharajat: TStringField;
    gpltur: TStringField;
    gpls_plvid: TIntegerField;
    RzBitBtn4: TRzBitBtn;
    filtr_haridor: TDBLookupComboboxEh;
    Label21: TLabel;
    DBGridEh15: TDBGridEh;
    TabSheet11: TRzTabSheet;
    gr_mobil: TDBGridEh;
    DBGridEh18: TDBGridEh;
    suiPopupMenu1: TsuiPopupMenu;
    mobil01: TMenuItem;
    Chekniochirish1: TMenuItem;
    Chekniochirish2: TMenuItem;
    TabSheet12: TRzTabSheet;
    qavat1: TGroupBox;
    s1_6: TRzBitBtn;
    s1_14: TRzBitBtn;
    s1_22: TRzBitBtn;
    s1_7: TRzBitBtn;
    s1_15: TRzBitBtn;
    s1_23: TRzBitBtn;
    s1_9: TRzBitBtn;
    s1_17: TRzBitBtn;
    s1_25: TRzBitBtn;
    s1_8: TRzBitBtn;
    s1_16: TRzBitBtn;
    s1_24: TRzBitBtn;
    s1_11: TRzBitBtn;
    s1_19: TRzBitBtn;
    s1_27: TRzBitBtn;
    s1_10: TRzBitBtn;
    s1_18: TRzBitBtn;
    s1_26: TRzBitBtn;
    s1_30: TRzBitBtn;
    s1_31: TRzBitBtn;
    s1_32: TRzBitBtn;
    s1_33: TRzBitBtn;
    s1_34: TRzBitBtn;
    s1_35: TRzBitBtn;
    s1_43: TRzBitBtn;
    s1_42: TRzBitBtn;
    s1_41: TRzBitBtn;
    s1_40: TRzBitBtn;
    s1_39: TRzBitBtn;
    s1_38: TRzBitBtn;
    s1_36: TRzBitBtn;
    s1_44: TRzBitBtn;
    s1_37: TRzBitBtn;
    s1_45: TRzBitBtn;
    s1_12: TRzBitBtn;
    s1_13: TRzBitBtn;
    s1_20: TRzBitBtn;
    s1_21: TRzBitBtn;
    s1_28: TRzBitBtn;
    s1_29: TRzBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    soni: TLabel;
    Label6: TLabel;
    tovar: TDBGridEh;
    Tovarlar: TDBGridEh;
    Label1: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    xizmat_foiz: TDBComboBoxEh;
    taomlar: TButton;
    Ichimliklar: TButton;
    Shirinliklar: TButton;
    Salatlar: TButton;
    kabinalar: TDBLookupComboboxEh;
    Ofisant: TDBLookupComboboxEh;
    naqd: TRzDBNumericEdit;
    plastik: TRzDBNumericEdit;
    epos: TRzDBNumericEdit;
    cheg_n: TRzDBNumericEdit;
    cheg_p: TRzDBNumericEdit;
    cheg_e: TRzDBNumericEdit;
    xizmat: TRzDBNumericEdit;
    summa_ch: TRzDBNumericEdit;
    prim: TRzDBEdit;
    Label4: TLabel;
    Label24: TLabel;
    salatPrinters: TComboBox;
    Label36: TLabel;
    baliqPrinters: TComboBox;
    flink: TfrxDBDataset;
    n_pl: TRzDBNumericEdit;
    tulov: TRzDBNumericEdit;
    saldo: TRzDBNumericEdit;
    Label37: TLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    Label38: TLabel;
    RzDBNumericEdit2: TRzDBNumericEdit;
    summa: TRzDBNumericEdit;
    tulandi: TRzDBNumericEdit;
    pul_plastik: TRzNumericEdit;
    pul_naqd: TRzNumericEdit;
    Memo1: TMemo;
    s1_1: TRzBitBtn;
    s1_2: TRzBitBtn;
    s1_3: TRzBitBtn;
    s1_4: TRzBitBtn;
    s1_5: TRzBitBtn;
    Button1: TButton;
    GroupBox1: TGroupBox;
    s2_6: TRzBitBtn;
    s2_14: TRzBitBtn;
    s2_22: TRzBitBtn;
    s2_7: TRzBitBtn;
    s2_15: TRzBitBtn;
    s2_23: TRzBitBtn;
    s2_9: TRzBitBtn;
    s2_17: TRzBitBtn;
    s2_25: TRzBitBtn;
    s2_8: TRzBitBtn;
    s2_16: TRzBitBtn;
    s2_24: TRzBitBtn;
    s2_11: TRzBitBtn;
    s2_19: TRzBitBtn;
    s2_27: TRzBitBtn;
    s2_10: TRzBitBtn;
    s2_18: TRzBitBtn;
    s2_26: TRzBitBtn;
    s2_30: TRzBitBtn;
    s2_31: TRzBitBtn;
    s2_32: TRzBitBtn;
    s2_33: TRzBitBtn;
    s2_34: TRzBitBtn;
    s2_35: TRzBitBtn;
    s2_43: TRzBitBtn;
    s2_42: TRzBitBtn;
    s2_41: TRzBitBtn;
    s2_40: TRzBitBtn;
    s2_39: TRzBitBtn;
    s2_38: TRzBitBtn;
    s2_36: TRzBitBtn;
    s2_44: TRzBitBtn;
    s2_37: TRzBitBtn;
    s2_45: TRzBitBtn;
    s2_12: TRzBitBtn;
    s2_13: TRzBitBtn;
    s2_20: TRzBitBtn;
    s2_21: TRzBitBtn;
    s2_28: TRzBitBtn;
    s2_29: TRzBitBtn;
    s2_1: TRzBitBtn;
    s2_2: TRzBitBtn;
    s2_3: TRzBitBtn;
    s2_4: TRzBitBtn;
    s2_5: TRzBitBtn;
    GroupBox2: TGroupBox;
    s3_6: TRzBitBtn;
    s3_14: TRzBitBtn;
    s3_22: TRzBitBtn;
    s3_7: TRzBitBtn;
    s3_15: TRzBitBtn;
    s3_23: TRzBitBtn;
    s3_9: TRzBitBtn;
    s3_17: TRzBitBtn;
    s3_25: TRzBitBtn;
    s3_8: TRzBitBtn;
    s3_16: TRzBitBtn;
    s3_24: TRzBitBtn;
    s3_11: TRzBitBtn;
    s3_19: TRzBitBtn;
    s3_27: TRzBitBtn;
    s3_10: TRzBitBtn;
    s3_18: TRzBitBtn;
    s3_26: TRzBitBtn;
    s3_30: TRzBitBtn;
    s3_31: TRzBitBtn;
    s3_32: TRzBitBtn;
    s3_33: TRzBitBtn;
    s3_34: TRzBitBtn;
    s3_35: TRzBitBtn;
    s3_43: TRzBitBtn;
    s3_42: TRzBitBtn;
    s3_41: TRzBitBtn;
    s3_40: TRzBitBtn;
    s3_39: TRzBitBtn;
    s3_38: TRzBitBtn;
    s3_36: TRzBitBtn;
    s3_44: TRzBitBtn;
    s3_37: TRzBitBtn;
    s3_45: TRzBitBtn;
    s3_12: TRzBitBtn;
    s3_13: TRzBitBtn;
    s3_20: TRzBitBtn;
    s3_21: TRzBitBtn;
    s3_28: TRzBitBtn;
    s3_29: TRzBitBtn;
    s3_1: TRzBitBtn;
    s3_2: TRzBitBtn;
    s3_3: TRzBitBtn;
    s3_4: TRzBitBtn;
    s3_5: TRzBitBtn;
    cheg_plastik: TRzNumericEdit;
    Label23: TLabel;
    shtrix: TEdit;
    h: TDBLookupComboboxEh;
    q_sum: TRzNumericEdit;
    gqoldiq: TDBGridEh;
    sena_pl: TRzDBNumericEdit;
    cheg_naqd: TRzNumericEdit;
    Label14: TLabel;
    telefon: TEdit;
    newpl: TRzBitBtn;
    delpl: TRzBitBtn;
    p_haridor: TRzPageControl;
    TabSheet13: TRzTabSheet;
    TabSheet14: TRzTabSheet;
    TabSheet15: TRzTabSheet;
    RzLabel1: TRzLabel;
    p_xisobla: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    gachaq: TRzNumericEdit;
    RzLabel2: TRzLabel;
    b_soni: TRzNumericEdit;
    DBGridEh16: TDBGridEh;
    DBGrid1: TDBGrid;
    TabSheet16: TRzTabSheet;
    DBGridEh17: TDBGridEh;
    Label16: TLabel;
    Label22: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    fzet: TfrxDBDataset;
    Panel3: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    sana1: TDBDateTimeEditEh;
    sana2: TDBDateTimeEditEh;
    RzBitBtn5: TRzBitBtn;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Edit5: TEdit;
    px_otchet: TsuiPopupMenu;
    MenuItem4: TMenuItem;
    ztovar: TZQuery;
    fztovar: TfrxDBDataset;
    Dztovar: TDataSource;
    DBGridEh19: TDBGridEh;
    DBGridEh1: TDBGridEh;
    xisobot: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    Yopish: TRzBitBtn;
    DBGridEh40: TDBGrid;
    RzBitBtn2: TRzBitBtn;
    Label41: TLabel;
    Edit1: TEdit;
    Edit4: TEdit;
    f3: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    zofis: TZQuery;
    Dofis: TDataSource;
    fofis: TfrxDBDataset;
    qoldiq: TZQuery;
    qoldiqzavod_nom: TStringField;
    qoldiqpolka: TStringField;
    qoldiqseriya: TStringField;
    qoldiqsrok: TDateField;
    qoldiqschet: TFloatField;
    qoldiqsotish: TFloatField;
    qoldiqkirim: TFloatField;
    qoldiqkirim_d: TFloatField;
    qoldiqtovar_id: TIntegerField;
    qoldiqnom: TStringField;
    qoldiqkol_ost: TLargeintField;
    qoldiqkol_in_ost: TLargeintField;
    qoldiqkol_all_ost: TLargeintField;
    qoldiqqoldiq: TSmallintField;
    qoldiqid: TLargeintField;
    qoldiqsotish_d: TFloatField;
    qoldiqsotish_in: TFloatField;
    qoldiqsotish_in_d: TFloatField;
    qoldiqt_in: TSmallintField;
    qoldiqnom_sh: TStringField;
    qoldiqkat: TStringField;
    qoldiqsana: TDateField;
    qoldiqulg1: TFloatField;
    qoldiqulg1_pl: TFloatField;
    qoldiqulg2: TFloatField;
    qoldiqulg2_pl: TFloatField;
    qoldiqdollar: TSmallintField;
    qoldiqkurs: TFloatField;
    Dqoldiq: TDataSource;
    tur: TRzRadioGroup;
    CheckBox1: TCheckBox;
    RzBitBtn6: TRzBitBtn;
    RzBitBtn7: TRzBitBtn;
    procedure f5Click(Sender: TObject);
    procedure kolKeyPress(Sender: TObject; var Key: Char);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Ekrandakorish2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure shtrixKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TovarlarEnter(Sender: TObject);
    procedure shtrixKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure shtrixEnter(Sender: TObject);
    procedure shtrixExit(Sender: TObject);
    procedure f7Click(Sender: TObject);
    procedure f8Click(Sender: TObject);
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
    procedure gqoldiqDblClick(Sender: TObject);
    procedure f6Click(Sender: TObject);
    procedure PechatClick(Sender: TObject);
    procedure EkranClick(Sender: TObject);
    procedure DBGridEh9DblClick(Sender: TObject);
    procedure f11Click(Sender: TObject);
    procedure f12Click(Sender: TObject);
    procedure cheknitahrirlash1Click(Sender: TObject);
    procedure f9Click(Sender: TObject);
    procedure f10Click(Sender: TObject);
    procedure cheg_naqdExit(Sender: TObject);
    procedure cheg_naqdKeyPress(Sender: TObject; var Key: Char);
    procedure Kassadanpulniexhish1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure newplClick(Sender: TObject);
    procedure delplClick(Sender: TObject);
    procedure hisoblaClick(Sender: TObject);
    procedure tozaClick(Sender: TObject);
    procedure vidExit(Sender: TObject);
    procedure sena_plEnter(Sender: TObject);
    procedure gplExit(Sender: TObject);
    procedure newsfmClick(Sender: TObject);
    procedure DBLookupComboboxEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh2EditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure facturaClick(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure mobil01Click(Sender: TObject);
    procedure Chekniochirish2Click(Sender: TObject);
    procedure Chekniochirish1Click(Sender: TObject);
    procedure tovarDblClick(Sender: TObject);
    procedure xizmat_foizChange(Sender: TObject);
    procedure xizmat_foizExit(Sender: TObject);
    procedure xizmat_foizEnter(Sender: TObject);
    procedure taomlarClick(Sender: TObject);
    procedure SalatlarClick(Sender: TObject);
    procedure ShirinliklarClick(Sender: TObject);
    procedure IchimliklarClick(Sender: TObject);
    procedure OfisantChange(Sender: TObject);
    procedure kabinalarChange(Sender: TObject);
    procedure hChange(Sender: TObject);
    procedure hEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure gr_mobilDblClick(Sender: TObject);
    procedure salatPrintersChange(Sender: TObject);
    procedure baliqPrintersChange(Sender: TObject);
    procedure s1_1Click(Sender: TObject);
    procedure s1_2Click(Sender: TObject);
    procedure s1_3Click(Sender: TObject);
    procedure s1_4Click(Sender: TObject);
    procedure s1_5Click(Sender: TObject);
    procedure s1_6Click(Sender: TObject);
    procedure s1_7Click(Sender: TObject);
    procedure s1_8Click(Sender: TObject);
    procedure s1_9Click(Sender: TObject);
    procedure s1_10Click(Sender: TObject);
    procedure s1_11Click(Sender: TObject);
    procedure s1_12Click(Sender: TObject);
    procedure s1_13Click(Sender: TObject);
    procedure s1_14Click(Sender: TObject);
    procedure s1_15Click(Sender: TObject);
    procedure s1_16Click(Sender: TObject);
    procedure s1_17Click(Sender: TObject);
    procedure s1_18Click(Sender: TObject);
    procedure s1_19Click(Sender: TObject);
    procedure s1_20Click(Sender: TObject);
    procedure s1_21Click(Sender: TObject);
    procedure s1_22Click(Sender: TObject);
    procedure s1_30Click(Sender: TObject);
    procedure s1_25Click(Sender: TObject);
    procedure s1_23Click(Sender: TObject);
    procedure s1_24Click(Sender: TObject);
    procedure s1_26Click(Sender: TObject);
    procedure s1_27Click(Sender: TObject);
    procedure s1_28Click(Sender: TObject);
    procedure s1_29Click(Sender: TObject);
    procedure s1_31Click(Sender: TObject);
    procedure s1_32Click(Sender: TObject);
    procedure s1_33Click(Sender: TObject);
    procedure s1_34Click(Sender: TObject);
    procedure s1_35Click(Sender: TObject);
    procedure s1_36Click(Sender: TObject);
    procedure s1_37Click(Sender: TObject);
    procedure s1_38Click(Sender: TObject);
    procedure s1_39Click(Sender: TObject);
    procedure s1_40Click(Sender: TObject);
    procedure s1_41Click(Sender: TObject);
    procedure s1_42Click(Sender: TObject);
    procedure s1_43Click(Sender: TObject);
    procedure s1_44Click(Sender: TObject);
    procedure s1_45Click(Sender: TObject);
    procedure n_plKeyPress(Sender: TObject; var Key: Char);
    procedure pul_plastikExit(Sender: TObject);
    procedure pul_plastikKeyPress(Sender: TObject; var Key: Char);
    procedure pul_naqdExit(Sender: TObject);
    procedure pul_naqdKeyPress(Sender: TObject; var Key: Char);
    procedure s3_1Click(Sender: TObject);
    procedure s3_2Click(Sender: TObject);
    procedure s3_3Click(Sender: TObject);
    procedure s3_4Click(Sender: TObject);
    procedure s3_5Click(Sender: TObject);
    procedure s3_6Click(Sender: TObject);
    procedure s3_7Click(Sender: TObject);
    procedure s3_8Click(Sender: TObject);
    procedure s3_9Click(Sender: TObject);
    procedure s3_10Click(Sender: TObject);
    procedure s3_11Click(Sender: TObject);
    procedure s3_12Click(Sender: TObject);
    procedure s3_13Click(Sender: TObject);
    procedure s3_14Click(Sender: TObject);
    procedure s3_15Click(Sender: TObject);
    procedure s3_16Click(Sender: TObject);
    procedure s3_17Click(Sender: TObject);
    procedure s3_18Click(Sender: TObject);
    procedure s3_19Click(Sender: TObject);
    procedure s3_20Click(Sender: TObject);
    procedure s3_21Click(Sender: TObject);
    procedure s3_22Click(Sender: TObject);
    procedure s3_23Click(Sender: TObject);
    procedure s3_24Click(Sender: TObject);
    procedure s3_25Click(Sender: TObject);
    procedure s3_26Click(Sender: TObject);
    procedure s3_27Click(Sender: TObject);
    procedure s3_28Click(Sender: TObject);
    procedure s3_29Click(Sender: TObject);
    procedure s3_30Click(Sender: TObject);
    procedure s3_31Click(Sender: TObject);
    procedure s3_32Click(Sender: TObject);
    procedure s3_33Click(Sender: TObject);
    procedure s3_34Click(Sender: TObject);
    procedure s3_35Click(Sender: TObject);
    procedure s3_36Click(Sender: TObject);
    procedure s3_37Click(Sender: TObject);
    procedure s3_38Click(Sender: TObject);
    procedure s3_39Click(Sender: TObject);
    procedure s3_40Click(Sender: TObject);
    procedure s3_41Click(Sender: TObject);
    procedure s3_42Click(Sender: TObject);
    procedure s3_43Click(Sender: TObject);
    procedure s3_44Click(Sender: TObject);
    procedure s3_45Click(Sender: TObject);
    procedure s2_1Click(Sender: TObject);
    procedure s2_2Click(Sender: TObject);
    procedure s2_3Click(Sender: TObject);
    procedure s2_4Click(Sender: TObject);
    procedure s2_5Click(Sender: TObject);
    procedure s2_6Click(Sender: TObject);
    procedure s2_7Click(Sender: TObject);
    procedure s2_8Click(Sender: TObject);
    procedure s2_9Click(Sender: TObject);
    procedure s2_10Click(Sender: TObject);
    procedure s2_11Click(Sender: TObject);
    procedure s2_12Click(Sender: TObject);
    procedure s2_13Click(Sender: TObject);
    procedure s2_14Click(Sender: TObject);
    procedure s2_15Click(Sender: TObject);
    procedure s2_16Click(Sender: TObject);
    procedure s2_17Click(Sender: TObject);
    procedure s2_18Click(Sender: TObject);
    procedure s2_19Click(Sender: TObject);
    procedure s2_20Click(Sender: TObject);
    procedure s2_21Click(Sender: TObject);
    procedure s2_22Click(Sender: TObject);
    procedure s2_23Click(Sender: TObject);
    procedure s2_24Click(Sender: TObject);
    procedure s2_25Click(Sender: TObject);
    procedure s2_26Click(Sender: TObject);
    procedure s2_27Click(Sender: TObject);
    procedure s2_28Click(Sender: TObject);
    procedure s2_29Click(Sender: TObject);
    procedure s2_30Click(Sender: TObject);
    procedure s2_31Click(Sender: TObject);
    procedure s2_32Click(Sender: TObject);
    procedure s2_33Click(Sender: TObject);
    procedure s2_34Click(Sender: TObject);
    procedure s2_35Click(Sender: TObject);
    procedure s2_36Click(Sender: TObject);
    procedure s2_37Click(Sender: TObject);
    procedure s2_38Click(Sender: TObject);
    procedure s2_39Click(Sender: TObject);
    procedure s2_40Click(Sender: TObject);
    procedure s2_41Click(Sender: TObject);
    procedure s2_42Click(Sender: TObject);
    procedure s2_43Click(Sender: TObject);
    procedure s2_44Click(Sender: TObject);
    procedure s2_45Click(Sender: TObject);
    procedure cheg_plastikExit(Sender: TObject);
    procedure cheg_plastikKeyPress(Sender: TObject; var Key: Char);
    procedure p_xisoblaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure gqoldiqCellClick(Column: TColumnEh);
    procedure Label4DblClick(Sender: TObject);
    procedure DBGridEh13DblClick(Sender: TObject);
    procedure xisobotClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure YopishClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure f3Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure turDblClick(Sender: TObject);
    procedure turChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure RzBitBtn7Click(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure g_asosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzBitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kafe: Tkafe;rec,rec_ml:Integer;

implementation

uses fdms, fs_tovar, fulanish_k,  Math,Registry,Printers, StrUtils,fkassa_izoh_edit, fkassa_h_edit,
  fsetup, fs_haridor, fprl;

{$R *.dfm}
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
function kasayatime(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateTimeToStr(Date);ShortDateFormat := OldFormat;Result := '''' + ResultStr + ''''; end else Result := '';
end;
function RoundLess(Value, Divider: Integer): Integer;
var s:string;
begin
  s:=inttostr(value);
  s:=copy(s,1,length(s)-2)+'00';
  Result:=strtoint(s);
end;
procedure shalonlar;
var F: TSearchRec;mydir, Path: string; IniFile:TIniFile;
begin
  kafe.chekshablon.Items.Clear;kafe.yorliqshablon.Items.Clear;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  kafe.chekshablon.Text := IniFile.ReadString('BAZA','shablonchek','chek58.fr3');
  kafe.yorliqshablon.Text := IniFile.ReadString('BAZA','shablonyorliq','');IniFile.Free;
  MyDir := ExtractFilePath(Application.ExeName);
  if FindFirst(Path + '*.fr3*', faAnyFile, F) = 0 then begin
    repeat
    if (F.Attr <> faDirectory) then begin
      kafe.chekshablon.items.Add(F.Name);kafe.yorliqshablon.items.Add(F.Name);
    end;
    until FindNext(F) <> 0;FindClose(F);
   end;
end;
//возвращает с английской раскладки русскую
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

//возвращает с русской раскладки английскую
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
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then
    begin
      Delete(Result, P, L); // удаляем ее
      Insert(Str2, Result, P); // вставляем новую
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
procedure add_ombor;
var k,k_in:integer;
begin
  DMS.tombor.Append;
  DMS.tombor.FieldByName('id').AsInteger:=dms.link.fieldbyname('id').AsInteger;
  DMS.tombor.FieldByName('tovar_id').AsInteger:=dms.link.fieldbyname('tovar_id').AsInteger;
  DMS.tombor.FieldByName('t_in').AsInteger:=dms.link.fieldbyname('t_in').AsInteger;
  if dms.link.fieldbyname('t_in').AsInteger<1 then DMS.tombor.FieldByName('t_in').AsInteger:=1;
  //DMS.tombor.FieldByName('zavod_nom').AsString:='';
  DMS.tombor.FieldByName('nom').AsString:=dms.link.fieldbyname('nom').AsString;
  DMS.tombor.FieldByName('nom_sh').AsString:=dms.link.fieldbyname('nom_sh').AsString;
  DMS.tombor.FieldByName('kat').AsString:=dms.link.fieldbyname('knom').AsString;
  DMS.tombor.FieldByName('kirim').AsInteger:=dms.link.fieldbyname('sena').AsInteger;
  DMS.tombor.FieldByName('kirim_d').AsInteger:=dms.link.fieldbyname('sena_d').AsInteger;
  if dms.link.fieldbyname('sana').AsVariant=null then
    DMS.tombor.FieldByName('sana').AsVariant:=null
  else
    DMS.tombor.FieldByName('sana').AsDateTime:=dms.link.fieldbyname('sana').AsDateTime;
  DMS.tombor.FieldByName('kir_all').AsInteger:=dms.link.fieldbyname('kol_in').AsInteger+dms.link.fieldbyname('kol').AsInteger*dms.link.fieldbyname('t_in').AsInteger;;
  if (dms.s_clientqoldiq.AsInteger=1) and (dms.s_tovarqoldiq.AsString='Y') then begin
    k:=Trunc(DMS.tombor.FieldByName('kir_all').AsInteger / dms.s_tovarkol_in.AsInteger); // 20
    k_in:=DMS.tombor.FieldByName('kir_all').AsInteger - k*dms.s_tovarkol_in.AsInteger;  // 0
    DMS.tombor.FieldByName('kol').AsInteger:=k;
    DMS.tombor.FieldByName('kol_in').AsInteger:=k_in;
    DMS.tombor.FieldByName('kol_all').AsInteger:=k*dms.s_tovarkol_in.AsInteger+k_in;
    DMS.tombor.FieldByName('qoldiq').AsVariant:=1
  end
  else
  begin
    DMS.tombor.FieldByName('kol').AsInteger:=0;
    DMS.tombor.FieldByName('kol_in').AsInteger:=0;
    DMS.tombor.FieldByName('kol_all').AsInteger:=0;
    DMS.tombor.FieldByName('qoldiq').AsVariant:=2;
  end;
  DMS.tombor.FieldByName('polka').AsString:=dms.link.fieldbyname('polka').AsString;
  DMS.tombor.FieldByName('seriya').AsString:=dms.link.fieldbyname('seriya').AsString;
  if dms.link.fieldbyname('srok').AsVariant=null then
    DMS.tombor.FieldByName('srok').AsVariant:=null
  else
    DMS.tombor.FieldByName('srok').AsDateTime:=dms.link.fieldbyname('srok').AsDateTime;
  DMS.tombor.FieldByName('sotish').AsFloat:=dms.link.fieldbyname('sotish').AsFloat;
  DMS.tombor.FieldByName('sotish_d').AsFloat:=dms.link.fieldbyname('sotish_d').AsFloat;
  DMS.tombor.FieldByName('sotish_in').AsFloat:=dms.link.fieldbyname('sotish_in').AsFloat;
  DMS.tombor.FieldByName('sotish_in_d').AsFloat:=dms.link.fieldbyname('sotish_in_d').AsFloat;
  DMS.tombor.FieldByName('ulg1').AsFloat:=dms.link.fieldbyname('opt1').AsFloat;
  DMS.tombor.FieldByName('ulg1_pl').AsFloat:=dms.link.fieldbyname('opt1_pl').AsFloat;
  DMS.tombor.FieldByName('ulg2').AsFloat:=dms.link.fieldbyname('opt2').AsFloat;
  DMS.tombor.FieldByName('ulg2_pl').AsFloat:=dms.link.fieldbyname('opt2_pl').AsFloat;
  DMS.tombor.FieldByName('schet').AsFloat:=dms.link.fieldbyname('schet').AsFloat;
  DMS.tombor.post;
end;
procedure qoldiq_hisobla;
var k,k_in,sot,limit,kam:integer;
begin
  dms.main_link.Close;dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add('select sum(a.kol) as kol_1,sum(a.kol_in) as kol_in_1 from s_tovar t,asos_slave a,asos ');
  dms.main_link.SQL.Add('WHERE a.del_flag=1 and asos.tur_oper in (2,4) and a.asos_id=asos.id and t.id=a.tovar_id and a.tovar_id='+DMS.s_tovarid.AsString+' group by a.tovar_id order by a.tovar_id');
  dms.main_link.open;
  sot:=dms.main_link.fieldbyname('kol_1').AsInteger*dms.s_tovarkol_in.AsInteger+dms.main_link.fieldbyname('kol_in_1').AsInteger;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select a.*,t.kol_in as t_in,t.nom as nom,t.nom_sh as nom_sh,asos.sana,s_kat.nom as knom from asos_slave a,asos,s_tovar t left JOIN s_kat ON s_kat.id = t.kat ');
  dms.link.SQL.Add('WHERE a.del_flag=1 and asos.tur_oper in (1,3,5) and a.asos_id=asos.id and t.id=a.tovar_id and a.tovar_id='+DMS.s_tovarid.AsString+' order by a.id desc');
  dms.link.open;
  kirim_s:=dms.link.fieldbyname('sena').AsFloat;
  kirim_d:=dms.link.fieldbyname('sena_d').AsFloat;
  sotish:=dms.link.fieldbyname('sotish').AsFloat;
  sotish_d:=dms.link.fieldbyname('sotish_d').AsFloat;
  sotish_in:=dms.link.fieldbyname('sotish_in').AsFloat;
  sotish_in_d:=dms.link.fieldbyname('sotish_in_d').AsFloat;
  ulg1:=dms.link.fieldbyname('opt1').AsFloat;
  ulg1_pl:=dms.link.fieldbyname('opt1_pl').AsFloat;
  ulg2:=dms.link.fieldbyname('opt2').AsFloat;
  ulg2_pl:=dms.link.fieldbyname('opt2_pl').AsFloat;
  schet:=dms.link.fieldbyname('schet').AsFloat;
  limit:=0;
  if (dms.s_clientqoldiq.AsInteger=0) or (dms.s_tovarqoldiq.AsString<>'Y') then begin
    if not dms.tombor.locate('id',dms.link.fieldbyname('id').AsInteger,[loCaseInsensitive]) then add_ombor;
  end
  else
  begin
    if dms.link.RecordCount>0 then begin
      while not dms.link.eof do begin
        limit:=limit+dms.link.fieldbyname('kol').AsInteger*dms.s_tovarkol_in.AsInteger+dms.link.fieldbyname('kol_in').AsInteger;
        dms.link.Next;
      end;
      dms.link.first;
      if (sot>limit) and (DMS.s_tovarqoldiq.AsString='Y') then begin
        ShowMessage('qoldiq no '+inttostr(sot)+'>'+inttostr(limit));
        exit;
      end;
      if (dms.s_tovarqoldiq.AsString<>'Y') then begin
        if not dms.tombor.locate('id',dms.link.fieldbyname('id').AsInteger,[loCaseInsensitive]) then add_ombor;
      end;
      while not dms.link.eof do begin
        if not dms.tombor.locate('id',dms.link.fieldbyname('id').AsInteger,[loCaseInsensitive]) then add_ombor;
        kam:=dms.tombor.fieldbyname('kol_all').AsInteger;
        if sot>kam then begin
          dms.tombor.edit;dms.tombor.fieldbyname('kol').AsInteger:=0;dms.tombor.fieldbyname('kol_in').AsInteger:=0;
          dms.tombor.fieldbyname('kol_all').AsInteger:=0;
          dms.tombor.Post;sot:=sot-kam;
        end
        else
        begin
          sot:=kam-sot;k:=Trunc(sot / dms.s_tovarkol_in.AsInteger);k_in:=sot - k*dms.s_tovarkol_in.AsInteger;
          dms.tombor.edit;dms.tombor.fieldbyname('kol').AsInteger:=k;dms.tombor.fieldbyname('kol_in').AsInteger:=k_in;
          dms.tombor.fieldbyname('kol_all').AsInteger:=sot;dms.tombor.Post;sot:=0;
        end;
        dms.link.Next;
      end; // while
    end; //record >0
  end; // qoldiq=0
end;
procedure yangi;
begin
  dms.asos_slave.Append;
  dms.asos_slavekol.AsFloat:=0;
  dms.asos_slavekol_in.AsFloat:=0;
  if dms.s_user.FieldByName('ustama').AsInteger=1 then
  begin
    dms.asos_slavesotish.AsFloat:=dms.qoldiqsotish.AsFloat+dms.s_tovarustama.AsFloat;
    if dms.s_tovarkol_in.AsFloat>1 then
      dms.asos_slavesotish_in.AsFloat:=dms.qoldiqsotish_in.AsFloat+dms.s_tovarustama.AsFloat/dms.s_tovarkol_in.AsFloat;
  end
  else
  begin
    if dms.s_tovarkol_in.AsFloat>1 then
      dms.asos_slavesotish_in.AsFloat:=dms.qoldiqsotish_in.AsFloat;
    dms.asos_slavesotish.AsFloat:=dms.qoldiqsotish.AsFloat;
  end;

  dms.asos_slavesena.AsFloat:=dms.qoldiqsena.AsFloat;
  dms.asos_slavesena_in.AsFloat:=dms.qoldiqsena_in.AsFloat;
  dms.asos_slavesumma.AsFloat:=dms.asos_slavekol.Value*dms.qoldiqsotish.AsFloat;
  dms.asos_slavesumma_in.AsFloat:=dms.asos_slavekol_in.Value*dms.qoldiqsotish_in.AsFloat;
  dms.asos_slavetovar_id.Value:=dms.qoldiqtovar_id.AsInteger;
  dms.asos_slavetovar_nom.Value:=dms.qoldiqs_tovar.AsString;
  dms.asos_slaveseriya.Value:=dms.qoldiqseriya.AsString;
  dms.asos_slaveturi.Value:=dms.qoldiqturi.AsVariant;
  dms.asos_slaveresept.Value:=dms.qoldiqresept.AsVariant;
  dms.asos_slavesrok.AsDateTime:=dms.qoldiq.fieldbyname('srok').AsDateTime;
  dms.asos_slaveasos_id.Value:=dms.asosid.AsInteger;
  dms.asos_slavekol_ost.AsInteger:=dms.qoldiqid.AsInteger;
  dms.asos_slaveizm_id.AsInteger:=dms.qoldiqizm_id.AsInteger;
  dms.asos_slaveizm1.AsInteger:=dms.qoldiqizm1.AsInteger;
  {if kassa.savdo.Text<>'' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select id from main where qrkod="'+kassa.savdo.Text+'"');
    dms.link.Open;
    kassa.savdo.Text:='';
    dms.asos_slaveqrkod.AsInteger:=dms.link.fieldbyname('id').AsInteger;
  end;}
  dms.asos_slave.Post;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  //dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.asos_slavekol_ost.AsString);
  dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 ');
  dms.qoldiq.open;
end;
procedure yangi_return;
begin
  if dms.k_asos.RecordCount=0 then begin
    DMS.k_asos.Append;
    dms.k_asosmobil.AsInteger:=0;
    DMS.k_asossana.AsDateTime:=Now;
    DMS.k_asostur_oper.AsInteger:=4;
    dms.k_asosclient_id.AsInteger:=dms.s_clientid.AsInteger;
    dms.k_asosuser_id.AsInteger:=dms.s_clientx_id.AsInteger;
    dms.setup.Refresh;
    dms.k_asoschangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
    DMS.k_asos.Post;
  end;
  dms.k_slave.Append;dms.k_slavekol.AsFloat:=1;
  dms.k_slavesotish.AsFloat:=0;dms.k_slavesena.AsFloat:=0;
  dms.k_slavetovar_id.Value:=dms.s_tovarid.AsInteger;
  dms.k_slavetovar_nom.Value:=dms.s_tovarnom.AsString;
  dms.k_slaveasos_id.Value:=dms.k_asosid.AsInteger;
  dms.k_slaveuser_id.Value:=dms.s_clientid.AsInteger;
  dms.k_slave.Post;
end;
procedure plus(k,k_in:integer);
var s,sql:string;kol_input,kol_all,sot:integer;
begin
  if not dms.qoldiq.Locate('tovar_id',dms.asos_slave.fieldbyname('tovar_id').AsInteger,[loCaseInsensitive]) then begin
    kafe.qoldiq.Close;kafe.qoldiq.SQL.Clear;
    if dms.asostur_oper.AsInteger=2 then begin
      kafe.qoldiq.SQL.Add('SELECT *,sum(kol) as kol_ost,sum(kol_in) as kol_in_ost,sum(kol_all) as kol_all_ost from ombor where tovar_id='+dms.s_tovarid.AsString+' order by id');
    end
    else
    begin
      kafe.qoldiq.SQL.Add(' select a.*,a.kol,a.sotish as sot,asos.sana as sana,asos.dollar as dollar a.sotish_in as sot_in from s_tovar t,asos_slave a,asos WHERE ' );
      kafe.qoldiq.SQL.Add(' a.del_flag=1 and asos.tur_oper in (2) and a.asos_id=asos.id and a.tovar_id=t.id  and asos.client_id = '+admin_clid);
    end;
    kafe.qoldiq.SQL.Add(' GROUP by nom order by nom desc limit 30');
    kafe.qoldiq.Open;
    if not kafe.qoldiq.Locate('tovar_id',dms.tombor.fieldbyname('tovar_id').AsInteger,[loCaseInsensitive]) then begin
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('select a.*,t.kol_in as t_in,t.nom as nom,t.nom_sh as nom_sh,asos.sana,s_kat.nom as knom from asos_slave a,asos,s_tovar t left JOIN s_kat ON s_kat.id = t.kat ');
      dms.link.SQL.Add('WHERE a.del_flag=1 and asos.tur_oper in (1,5) and a.asos_id=asos.id and t.id=a.tovar_id and a.tovar_id='+dms.s_tovarid.AsString+' order by a.id desc');
      dms.link.open;
      add_ombor;
    end;
  end;
  sot:=dms.asos_slavekol.AsInteger*dms.s_tovarkol_in.AsInteger+dms.asos_slavekol_in.AsInteger;
  s:='';kol_input:=k*dms.s_tovarkol_in.AsInteger+k_in;kol_all:=kol_input;
  kol_input:=kol_input-sot;
  k:=Trunc(kol_input / dms.s_tovarkol_in.AsInteger); k_in:=kol_input - k*dms.s_tovarkol_in.AsInteger;
  if (dms.s_clientqoldiq.AsInteger=1) and (dms.s_tovarqoldiq.AsString='Y') then begin
    dms.main_link.Close;dms.main_link.sql.Clear;
    dms.main_link.SQL.Add('select * from ombor where kol_all>0 and tovar_id='+dms.asos_slavetovar_id.AsString+' order by id');
    dms.main_link.Open;
    while not dms.main_link.Eof do begin
      if kol_input<1 then begin
        k:=Trunc(kol_all / dms.s_tovarkol_in.AsInteger); // 20
        k_in:=kol_all - k*dms.s_tovarkol_in.AsInteger;
        dms.asos_slave.Edit;
        dms.asos_slavekol_all.AsInteger:=kol_all;
        dms.asos_slavekol.AsInteger:=k;
        dms.asos_slavekol_in.AsInteger:=k_in;
        dms.asos_slavesumma.AsFloat:=k*dms.asos_slavesotish.AsFloat;
        dms.asos_slavesumma_in.AsFloat:=k_in*dms.asos_slavesotish_in.AsFloat;
        dms.asos_slavesumma_all.AsFloat:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;
        dms.asos_slave.post;
        rec:=dms.asos_slaveid.AsInteger;
        exit;
      end;
      if kol_input<dms.main_link.fieldbyname('kol_all').AsInteger then begin //  1050   1000
        k:=Trunc(kol_input / dms.s_tovarkol_in.AsInteger);k_in:=kol_input - k*dms.s_tovarkol_in.AsInteger;
        dms.main_link.Edit;
        dms.main_link.fieldbyname('kol_all').AsInteger:=dms.main_link.fieldbyname('kol_all').AsInteger - kol_input;
        if dms.main_link.fieldbyname('kol_in').AsInteger > k_in then begin
          dms.main_link.fieldbyname('kol').AsInteger:=dms.main_link.fieldbyname('kol').AsInteger - k;
          dms.main_link.fieldbyname('kol_in').AsInteger:=dms.main_link.fieldbyname('kol_in').AsInteger - k_in;
        end
        else
        begin
          //dms.main_link.fieldbyname('kol').AsInteger:=dms.main_link.fieldbyname('kol').AsInteger - k - 1;
          dms.main_link.fieldbyname('kol').AsInteger:=dms.main_link.fieldbyname('kol').AsInteger - k;
          dms.main_link.fieldbyname('kol_in').AsInteger:=dms.main_link.fieldbyname('kol_in').AsInteger + dms.s_tovarkol_in.AsInteger - k_in;
        end;
        dms.main_link.Post;
        kol_input:=0;
      end
      else
      begin
        kol_input:=kol_input-dms.main_link.fieldbyname('kol_all').AsInteger;
        dms.main_link.Edit;
        dms.main_link.fieldbyname('kol').AsInteger:=0;
        dms.main_link.fieldbyname('kol_in').AsInteger:=0;
        dms.main_link.fieldbyname('kol_all').AsInteger:=0;
        dms.main_link.Post;
      end;

      dms.main_link.Next;
    end;
  end;
  dms.asos_slave.Edit;
  k:=Trunc(kol_all / dms.s_tovarkol_in.AsInteger);k_in:=kol_all - k*dms.s_tovarkol_in.AsInteger;
  dms.asos_slavekol_all.AsInteger:=kol_all;
  dms.asos_slavekol.AsInteger:=k;
  dms.asos_slavekol_in.AsInteger:=k_in;
  dms.asos_slavesumma.AsFloat:=k*dms.asos_slavesotish.AsFloat;
  dms.asos_slavesumma_in.AsFloat:=k_in*dms.asos_slavesotish_in.AsFloat;
  dms.asos_slavesumma_all.AsFloat:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;

  dms.asos_slave.post;  rec:=dms.asos_slaveid.AsInteger;
end;
procedure minus(k,k_in:integer);
var s,s3:string;kol_input,kol_all,sot,limit,kam:integer;
begin
  kol_input:=k*dms.s_tovarkol_in.AsInteger+k_in;
  if (dms.s_clientqoldiq.AsInteger=1) and (dms.s_tovarqoldiq.AsString='Y') then begin
  sot:=dms.asos_slavekol.AsInteger*dms.s_tovarkol_in.AsInteger+dms.asos_slavekol_in.AsInteger;
  kam:=sot-kol_input;
  dms.main_link.Close;dms.main_link.sql.Clear;
  dms.main_link.SQL.Add('select * from ombor where tovar_id='+dms.asos_slavetovar_id.AsString+' order by id desc');
  dms.main_link.Open;
  while not dms.main_link.Eof do begin
    if kam=0 then begin
      k:=Trunc(kol_input / dms.s_tovarkol_in.AsInteger);k_in:=kol_input - k*dms.s_tovarkol_in.AsInteger;
      dms.asos_slave.Edit;
      dms.asos_slavekol_all.AsInteger:=kol_input;
      dms.asos_slavekol.AsInteger:=k;dms.asos_slavekol_in.AsInteger:=k_in;
      dms.asos_slavesumma.AsFloat:=k*dms.asos_slavesotish.AsFloat;
      dms.asos_slavesumma_in.AsFloat:=k_in*dms.asos_slavesotish_in.AsFloat;
      dms.asos_slavesumma_all.AsFloat:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;

      dms.asos_slave.post;  rec:=dms.asos_slaveid.AsInteger;
    end;
    limit:=dms.main_link.fieldbyname('kir_all').AsInteger-dms.main_link.fieldbyname('kol_all').AsInteger;
    if limit<kam then begin
      dms.main_link.edit;
      dms.main_link.fieldbyname('kol_all').AsInteger:=dms.main_link.fieldbyname('kir_all').AsInteger;
      k:=Trunc(dms.main_link.fieldbyname('kol_all').AsInteger / dms.s_tovarkol_in.AsInteger); // 20
      k_in:=dms.main_link.fieldbyname('kol_all').AsInteger - k*dms.s_tovarkol_in.AsInteger;
      dms.main_link.fieldbyname('kol').AsInteger:=k;
      dms.main_link.fieldbyname('kol_in').AsInteger:=k_in;

      dms.main_link.Post;
      kam:=kam-limit;
    end
    else
    begin
      dms.main_link.edit;
      dms.main_link.fieldbyname('kol_all').AsInteger:=dms.main_link.fieldbyname('kol_all').AsInteger+kam;
      k:=Trunc(dms.main_link.fieldbyname('kol_all').AsInteger / dms.s_tovarkol_in.AsInteger); // 20
      k_in:=dms.main_link.fieldbyname('kol_all').AsInteger - k*dms.s_tovarkol_in.AsInteger;
      dms.main_link.fieldbyname('kol').AsInteger:=k;
      dms.main_link.fieldbyname('kol_in').AsInteger:=k_in;
      dms.main_link.Post;
      kam:=0;
    end;
    dms.main_link.Next;
  end;
  end;
  k:=Trunc(kol_input / dms.s_tovarkol_in.AsInteger); // 20
  k_in:=kol_input - k*dms.s_tovarkol_in.AsInteger;
  dms.asos_slave.Edit;
  dms.asos_slavekol_all.AsInteger:=kol_input;
  dms.asos_slavekol.AsInteger:=k;
  dms.asos_slavekol_in.AsInteger:=k_in;
  dms.asos_slavesumma.AsFloat:=k*dms.asos_slavesotish.AsFloat;
  dms.asos_slavesumma_in.AsFloat:=k_in*dms.asos_slavesotish_in.AsFloat;
  dms.asos_slavesumma_all.AsFloat:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;

  dms.asos_slave.post;  rec:=dms.asos_slaveid.AsInteger;
  //dms.qoldiq.refresh;
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
procedure Tkafe.s2_11Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',11,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_12Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',12,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_13Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',13,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_14Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',14,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_15Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',15,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_16Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',16,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_17Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',17,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_18Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',18,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_19Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',19,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_20Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',20,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_21Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',21,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_22Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',22,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_23Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',23,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_24Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',24,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_25Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',25,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_26Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',26,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_27Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',27,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_28Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',28,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_29Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',29,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_30Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',30,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_31Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',31,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_32Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',32,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_33Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',33,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_34Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',34,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_35Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',35,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_36Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',36,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_37Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',37,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_38Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',38,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_39Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',39,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_40Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',40,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_41Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',41,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_42Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',42,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_43Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',43,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_44Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',44,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_45Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',45,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;
procedure Tkafe.f5Click(Sender: TObject);
var kol:integer;f:Currency;
begin
  if (dms.asossum_naqd.AsFloat=0) and (dms.asossum_plastik.AsFloat=0) and (dms.asossum_epos.AsFloat=0) and (dms.asossumma.AsFloat>0) then begin
   dms.asos.edit;
   dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;
   dms.asossum_naqd_ch.AsFloat:=dms.asossumma.AsFloat;
   dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat;
   dms.asos.post;
  end;
  if dms.asossumma.AsInteger < dms.asosqarz_summa.AsInteger then begin
    ShowMessage('Qarz summa noto`g`ri');exit;
  end;
  if (dms.asossum_naqd_ch.AsInteger+dms.asoscheg_n.AsInteger) <> dms.asossum_naqd.AsInteger then begin
    ShowMessage('Naqd summa noto`g`ri');
    exit;
  end;
  if (dms.asossum_plast_ch.AsInteger+dms.asoscheg_p.AsInteger) <> dms.asossum_plastik.AsInteger then begin
    ShowMessage('Plastik summa noto`g`ri');exit;
  end;
  if (dms.asossum_epos_ch.AsInteger+dms.asoscheg_e.AsInteger) <> dms.asossum_epos.AsInteger then begin
    ShowMessage('H/r summa noto`g`ri');exit;
  end;
  //if (dms.asossum_naqd.AsInteger+dms.asossum_plastik.AsInteger+dms.asossum_epos.AsInteger) <> (dms.asossumma.AsInteger+dms.asosxizmat.AsInteger) then begin
  if (dms.asossum_naqd.AsInteger+dms.asossum_plastik.AsInteger+dms.asossum_epos.AsInteger) - (dms.asossumma.AsInteger+dms.asosxizmat.AsInteger) > 500 then begin
    ShowMessage('Chek summa noto`g`ri = ' + IntToStr((dms.asossum_naqd.AsInteger+dms.asossum_plastik.AsInteger+dms.asossum_epos.AsInteger) - (dms.asossumma.AsInteger+dms.asosxizmat.AsInteger)));
    //exit;
  end;

  //shortdateformat:='dd.mm.yyyy';
    if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
    try
      if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
        //ShowMessage('sana kiritilmagan');exit;
      end;
    except
    end;
    DMS.asos_slave.First;f:=0;kol:=0;
    while not dms.asos_slave.Eof do begin
      f:=f+DMS.asos_slavekol.AsInteger*DMS.asos_slavesotish.AsFloat+DMS.asos_slavekol_in.AsInteger*DMS.asos_slavesotish_in.AsFloat;
      dms.asos_slave.Next;
    end;
    dms.asos_slave.First;
    while not dms.asos_slave.eof do begin

      if dms.asos_slavezakaz.AsVariant<>null then
      begin
        dms.asos_slave.edit;
        dms.asos_slavezakaz_end.AsVariant:=now();
        dms.asos_slave.post;
      end;

      dms.asos_slave.next;
    end;
    if f<>dms.asossumma.AsFloat then
    begin
      if (f-dms.asossumma.AsFloat>100) then
        ShowMessage(FloatToStr(f-dms.asossumma.AsFloat));
    end;
    dms.asos.Edit;
    if h.value>0 then begin
      if q_sum.Value<1 then
      begin
        ShowMessage('Qarz summasini kiriting');
        q_sum.SetFocus;
        exit;
      end;
      dms.asosh_id.AsInteger:=h.value;
      dms.asosqarz_summa.AsVariant:=q_sum.Value;
      dms.asosqarz_flag.AsVariant:=1;
    end
    else begin
      q_sum.Value:=0;
      dms.asosqarz_flag.AsVariant:=null;
    end;
    dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
    dms.asosprint_flag.AsInteger:=1;

    if ((dms.asosmobil.AsInteger>1) and (dms.asosdiler_id.AsInteger=1)) or (dms.asos.State=dsInsert) or (dms.asosdiler_id.AsInteger=0) or (dms.asosdiler_id.AsInteger=-1) then begin
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
        dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
       dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
    end;
    dms.asos.Post;
    DMS.link.Close;DMS.link.SQL.Clear;
    DMS.link.SQL.Add('SELECT s.id,t.nom as s_tovar,s.sotish,s.sotish_in,s.seriya,s.sena,s.sena_in,srok,SUM(s.summa_all) as summa_all,SUM(s.kol) as kol,SUM(s.kol_in) as kol_in ');
    DMS.link.SQL.Add(' FROM asos_slave s,s_tovar t where t.id=s.tovar_id and s.del_flag=1 and asos_id='+dms.asosid.AsString+' and (s.kol+s.kol_in)>0 group by t.nom');
    DMS.link.Open;

    dms.s_client.Refresh;
    dms.asos_slave.Filter:='kol+kol_in>0';dms.asos_slave.Filtered:=true;

    Memo1.Lines.Add(dms.asos.SQL.Text);
    frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
    frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
    if telefon.Text='' then
      frxsf.Variables['telefon']:=''''+''+''''
    else
      frxsf.Variables['telefon']:='''Mijoz raqami : +998'+telefon.Text+'''';
    frxsf.PrintOptions.Printer := chekPrinters.Text;
    frxsf.SelectPrinter;frxsf.PrepareReport;
    frxsf.PrintOptions.ShowDialog := false;
    frxsf.Print;
    dms.asos_slave.Filter:='';dms.asos_slave.Filtered:=false;
    dms.asos.Close;
    dms.asos.SQL.Clear;
    //dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'" order by id desc');
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
    dms.asos.open;
    //Tovarlar.SumList.RecalcAll;
    if dms.asos.RecordCount=0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;
      Tovarlar.SumList.RecalcAll;
    end;
    h.Value:=0;q_sum.Value:=0;
    tur.ItemIndex:=0;
end;

procedure Tkafe.kolKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tkafe.MenuItem2Click(Sender: TObject);
var k,k_in,i,old,old_in:integer;s:string;
begin
  if dms.asos_slave.RecordCount=0 then exit;
  k:=0;k_in:=0;
  if MessageDlg(dms.asos_slaves_tovar.AsString+' -  tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    if not DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]) then begin ShowMessage(dms.asos_slavetovar_nom.AsString+' topilmadi');exit; end;
    if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
    if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;

      old:=dms.asos_slavekol.OldValue;old_in:=dms.asos_slavekol_in.OldValue;
      //minus(k,k_in);

    if dms.asos_slavezakaz.AsVariant=null then begin
      dms.asos_slave.edit;
      dms.asos_slavedel_flag.AsInteger:=0;
      dms.asos_slave.post;
    end
    else
    begin
      dms.asos_slave.edit;
      dms.asos_slavekol.AsInteger:=0;
      dms.asos_slavekol_in.AsInteger:=0;
      dms.asos_slavekol_all.AsInteger:=0;
      dms.asos_slavesumma.AsFloat:=0;
      dms.asos_slavesumma_in.AsFloat:=0;
      dms.asos_slavesumma_all.AsFloat:=0;
      rec:=dms.asos_slaveid.AsInteger;
      if (old+old_in)<>(DMS.asos_slavekol.AsInteger+DMS.asos_slavekol_in.AsInteger) then begin
        s:=' otkaz ('+IntToStr(old);
        if (old_in>0) then begin
          s:=s+'.'+IntToStr(old_in);
        end;
        s:=s+')';
        DMS.asos_slavetovar_nom.AsString:=s+DMS.asos_slavetovar_nom.AsString;
        DMS.asos_slavezakaz_print.AsVariant:=2;
      end;
      dms.asos_slave.post;
    end;
    //dms.asos_slave.First;
    //dms.asos_slave.refresh;
    k:=0;k_in:=0;
    for i:=1 to 100 do begin
      if (dms.qoldiqkol_in_ost.AsInteger>=i*dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger-i*dms.s_tovarkol_in.AsInteger;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+i;
        dms.qoldiq.post;
      end;
    end;
    DMS.asos_slave.Refresh;
    Tovarlar.SumList.RecalcAll;

    dms.asos.Edit;
    dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
    dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
    dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsInteger/100;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat;
    dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;

    dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsVariant-dms.asossum_naqd_ch.AsFloat),-2);
    dms.asossumma_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat+dms.asossum_plastik.AsFloat;
    //dms.asossumma_ch.AsFloat:=(dms.asosxizmat.AsFloat+dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsInteger/100)-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat+dms.asoscheg_e.AsFloat);
    dms.asossum_naqd_ch.AsFloat:=dms.asossum_naqd.AsFloat-dms.asoscheg_n.AsFloat;
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
    dms.asos.Post;dms.asos.Refresh;dms.main_link.Refresh;Tovarlar.SumList.RecalcAll;
    if DMS.qoldiq.Active then DMS.qoldiq.Refresh;
  end;
end;

procedure Tkafe.MenuItem1Click(Sender: TObject);
begin
  exit;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
  frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  frxsf.DesignReport;
end;

procedure Tkafe.Ekrandakorish2Click(Sender: TObject);
var s:string;
begin
  if dms.asossumma.AsFloat < dms.asosqarz_summa.AsFloat then begin
    ShowMessage('Qarz summa noto`g`ri');exit;
  end;
  if (dms.asossum_naqd_ch.AsFloat+dms.asoscheg_n.AsFloat) <> dms.asossum_naqd.AsFloat then begin
    ShowMessage('Naqd summa noto`g`ri');exit;
  end;
  if (dms.asossum_plast_ch.AsFloat+dms.asoscheg_p.AsFloat) <> dms.asossum_plastik.AsFloat then begin
    ShowMessage('Plastik summa noto`g`ri');exit;
  end;
  if (dms.asossum_epos_ch.AsFloat+dms.asoscheg_e.AsFloat) <> dms.asossum_epos.AsFloat then begin
    ShowMessage('H/r summa noto`g`ri');exit;
  end;
  if (dms.asossum_naqd.AsFloat+dms.asossum_plastik.AsFloat+dms.asossum_epos.AsFloat) <> (dms.asossumma.AsFloat+dms.asosxizmat.AsFloat) then begin
    ShowMessage('Chek summa noto`g`ri');exit;
  end;

  //shortdateformat:='dd.mm.yyyy';
    if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
    try
      if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
        //ShowMessage('sana kiritilmagan');exit;
      end;
    except
    end;
    DMS.link.Close;DMS.link.SQL.Clear;
    DMS.link.SQL.Add('SELECT s.id,t.nom as s_tovar,s.sotish,s.sotish_in,s.seriya,s.sena,s.sena_in,srok,SUM(s.summa_all) as summa_all,SUM(s.kol) as kol,SUM(s.kol_in) as kol_in ');
    DMS.link.SQL.Add(' FROM asos_slave s,s_tovar t where t.id=s.tovar_id and s.del_flag=1 and asos_id='+dms.asosid.AsString+' group by t.nom');
    DMS.link.Open;

  dms.asos_slave.Filter:='kol+kol_in>0';dms.asos_slave.Filtered:=true;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);
  if DMS.asosdiler_id.AsInteger=-1 then s:='Noaniq' else s:=_IntToStr(DMS.asosdiler_id.AsInteger,5);
  frxsf.Variables['nnn']:=''''+s+'''';
  if telefon.Text='' then
    frxsf.Variables['telefon']:=''''+''+''''
  else
    frxsf.Variables['telefon']:='''Mijoz raqami : +998'+telefon.Text+'''';
  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.ShowDialog := false;
  frxsf.ShowReport;
  dms.asos_slave.Filter:='kol+kol_in>0';dms.asos_slave.Filtered:=false;
  dms.asos_slave.Refresh;

end;

procedure Tkafe.FormActivate(Sender: TObject);
begin
  if dms.s_clientgaraj_turi.Value=1 then kafe.varaq.Pages[6].TabVisible:=true else kafe.varaq.Pages[6].TabVisible:=false;
  if dms.s_clientkomputer.Value=1 then kafe.varaq.Pages[7].TabVisible:=true else kafe.varaq.Pages[7].TabVisible:=false;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1');
  dms.s_tovar.open;
  dms.s_kat.open;
  ztovar.Open;
  //ShowMessage(dms.s_kat.SQL.Text);
  dms.asos_slave.Refresh;
  shtrix.SetFocus;
end;

procedure Tkafe.shtrixKeyPress(Sender: TObject; var Key: Char);
var k,k_in,old,old_in:integer;s,s_in,kg,gr:string;
begin
  if Key = #13 then begin
    if shtrix.Text='' then exit;
    old:=dms.asos_slavekol.OldValue;old_in:=dms.asos_slavekol_in.OldValue;
    if shtrix.Text='9999999999994' then begin f5Click(Sender);shtrix.Text:='';exit;end;
    if (pos('N',UpperCase(shtrix.Text))>0) or (pos('N=',UpperCase(shtrix.Text))>0) or (pos('Н',UpperCase(shtrix.Text))>0) or (pos('Н=',UpperCase(shtrix.Text))>0) then
    begin
      s:=copy(shtrix.Text,3,12);if s='' then s:='0';
      s:=StrReplace(s,'.',',');
      if dms.asossum_naqd.AsFloat<StrToFloat(s) then begin shtrix.Text:='';exit;end;
      dms.asos.Edit;
      dms.asoscheg_n.AsFloat:=StrToFloat(s);dms.asoscheg_p.AsFloat:=0;
      dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
      dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
      dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsInteger/100;
      dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat;

      dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
      dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
      //dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
      dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
      dms.asossumma_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat+dms.asossum_plastik.AsFloat;

      {dms.asossum_naqd_ch.AsFloat:=dms.asossum_naqd.AsFloat-dms.asoscheg_n.AsFloat;
      dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100;
      dms.asossumma_ch.AsFloat:=(dms.asossumma.AsFloat+dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100)-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat+dms.asoscheg_e.AsFloat);
      }
      dms.asos.Post;dms.asos.Refresh;shtrix.Text:='';
      exit;
    end;
    if (pos('P',UpperCase(shtrix.Text))>0) or (pos('P=',UpperCase(shtrix.Text))>0) or (pos('П=',UpperCase(shtrix.Text))>0)  or (pos('П',UpperCase(shtrix.Text))>0)then
    begin
      s:=copy(shtrix.Text,3,12);if s='' then s:='0';
      s:=StrReplace(s,'.',',');
      if dms.asossum_plastik.AsFloat<StrToFloat(s) then begin shtrix.Text:='';exit;end;
      dms.asos.Edit;
      dms.asoscheg_p.AsFloat:=StrToFloat(s);
      dms.asossum_plast_ch.AsFloat:=dms.asossum_plastik.AsFloat-dms.asoscheg_p.AsFloat;
      dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100;
      dms.asossumma_ch.AsFloat:=(dms.asossumma.AsFloat+dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100)-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat+dms.asoscheg_e.AsFloat);
      dms.asos.Post;dms.asos.Refresh;shtrix.Text:='';
      exit;
    end;
    if (pos('=',UpperCase(shtrix.Text))>0) then
    begin
      if asos_slave.RecordCount=0 then exit;
      s:=copy(shtrix.Text,2,12);if s='' then s:='0';
      s:=StrReplace(s,'.',',');
      //if dms.asossum_naqd.AsFloat<StrToFloat(s) then begin shtrix.Text:='';exit;end;
      dms.asos_slave.Edit;
      dms.asos_slavesotish.Value:=StrToFloat(s);
      dms.asos_slavesumma.Value:=dms.asos_slavekol.AsInteger*dms.asos_slavesotish.AsFloat;
      dms.asos_slavesumma_all.Value:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;
      dms.asos_slave.post;
      shtrix.Text:='';
      rec:=DMS.asos_slaveid.Value;
      kafe.Tovarlar.SumList.RecalcAll;
      dms.asos.Edit;
      dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
      dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
      dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
      dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100;
      dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
      dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
      dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
      dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
      dms.asossumma_ch.AsFloat:=(dms.asossumma.AsFloat+dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100)-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat);
      dms.asos.Post;dms.asos.Refresh;
      DMS.asos_slave.Locate('id',rec,[loCaseInsensitive]);
      Key:=#0;
      exit;
    end;
    if (not ((pos(',',shtrix.Text)=0) or (pos('.',shtrix.Text)=0))) and (DMS.s_tovarkol_in.AsInteger>0) then
    shtrix.Text:=shtrix.Text+'.0';

    //if dms.asos_slave.RecordCount=0 then begin shtrix.Text:='';exit;end;
    s:='';s_in:='';
    if (pos('/',shtrix.Text)>0) then begin
      s:=copy(shtrix.Text,1,pos('/',shtrix.Text)-1);s_in:=copy(shtrix.Text,pos('/',shtrix.Text)+1,length(shtrix.Text)-pos('/',shtrix.Text));
    end else
    if (pos('\',shtrix.Text)>0) then
    begin
      s:=copy(shtrix.Text,1,pos('\',shtrix.Text)-1);s_in:=copy(shtrix.Text,pos('\',shtrix.Text)+1,length(shtrix.Text)-pos('\',shtrix.Text));
    end else
    if (pos(',',shtrix.Text)>0) then
    begin
      s:=copy(shtrix.Text,1,pos(',',shtrix.Text)-1);s_in:=copy(shtrix.Text,pos(',',shtrix.Text)+1,length(shtrix.Text)-pos(',',shtrix.Text));
    end else
    if (pos('.',shtrix.Text)>0) then begin
      s:=copy(shtrix.Text,1,pos('.',shtrix.Text)-1);s_in:=copy(shtrix.Text,pos('.',shtrix.Text)+1,length(shtrix.Text)-pos('.',shtrix.Text));
    end
    else
      s:=shtrix.Text;DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
    if (s='0') and (s_in='0') then exit;
    if (length(shtrix.text)<8) or (pos('/',shtrix.Text)>0) or (pos('\',shtrix.Text)>0) or (pos(',',shtrix.Text)>0) or (pos('.',shtrix.Text)>0) then
    begin
      if asos_slave.RecordCount=0 then exit;
      if (s='') and (s_in='') then begin shtrix.Text:='';exit;end;
      if (dms.s_tovarkol_in.AsInteger=0) and (s_in<>'') then begin ShowMessage('Spravochnikda ichki tovar soni ko`rsatilmagan.');exit;end;
      if (dms.s_tovarkol_in.AsInteger<>0) then if s_in<>'' then if (StrToInt(s_in)>=dms.s_tovarkol_in.AsInteger) then begin ShowMessage('Kiritilgan ma`lumot tovar ichki sonida katta yoki teng!!!');exit;end;
      if DMS.s_tovarqoldiq.AsString='Y' then begin

      if s<>'' then
      if (dms.asos_slavekol.AsInteger+dms.qoldiqkol_ost.AsInteger)<StrToInt(s) then begin ShowMessage('Tovar qoldiqi etishmaydi!!!');exit;end;

      if (s_in<>'') and (dms.qoldiqkol_ost.AsInteger=0) then
      if (dms.asos_slavekol_in.AsInteger+dms.qoldiqkol_in_ost.AsInteger)<StrToInt(s_in) then begin ShowMessage('Tovar qoldiqi etishmaydi!!!');exit;end;
      end;
      dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
      dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.asos_slavekol_ost.AsString);
      dms.qoldiq.open;
      if ((dms.qoldiqkol_ost.AsInteger>0) or (dms.asos_slavekol.AsInteger>0)) and (s_in<>'') then
      if (dms.qoldiqkol_in_ost.AsInteger<strtoint(s_in)) then begin
        DMS.s_tovar.Locate('id',dms.qoldiqtovar_id.AsInteger,[loCaseInsensitive]);
        dms.qoldiq.Edit;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger-1;
        //Memo1.Lines.Add(dms.s_tovarnom.AsString+' '+dms.s_tovarid.AsString);
        dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger+dms.s_tovarkol_in.AsInteger;
        dms.qoldiq.Post;
      end;
      if (s_in<>'') then
      begin
        k:=0;
        //k:=dms.asos_slavekol.AsInteger;
        k_in:=dms.asos_slavekol_in.AsInteger;minus(k,k_in);
        k_in:=StrToInt(s_in);
        plus(k,k_in);
        if s='' then shtrix.Text:='';
      end;
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      if s<>'' then
      begin
        k_in:=0;k:=dms.asos_slavekol.AsInteger;
        if (k+k_in)>0 then minus(k,k_in);
        k:=StrToInt(s);
        if s_in<>'' then
        k_in:=StrToInt(s_in);
        if (k+k_in)>0 then plus(k,k_in);
        shtrix.Text:='';
        if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
          dms.qoldiq.Edit;
          dms.qoldiqkol_in_ost.AsInteger:=0;
          dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
          dms.qoldiq.post;
        end
      end; // s
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
        dms.qoldiq.post;
      end;
      rec:=DMS.asos_slaveid.Value;
      kafe.Tovarlar.SumList.RecalcAll;
      dms.asos.Edit;
      dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;dms.asoscheg_e.AsFloat:=0;
      dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
      dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
      dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100;
      dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat;dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
      dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
      dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
      dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
      dms.asossumma_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat+dms.asossum_plastik.AsFloat;
      dms.asos.Post;dms.asos.Refresh;
      DMS.asos_slave.Locate('id',rec,[loCaseInsensitive]);
      DMS.asos_slave.Edit;
      if (old+old_in)<>(DMS.asos_slavekol.AsInteger+DMS.asos_slavekol_in.AsInteger) then begin
        s:='('+IntToStr(old);
        if (old_in>0) then begin
          s:=s+'.'+IntToStr(old_in);
        end;
        s:=s+')';
        DMS.asos_slavetovar_nom.AsString:=s+DMS.asos_slavetovar_nom.AsString;
        DMS.asos_slavezakaz_print.AsVariant:=2;
        DMS.asos_slave.post;
      end;
      DMS.main_link.Refresh;
      exit;
    end; // length(shtrix.text)<5
    dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
    kg:='';gr:='';
    s:=StrReplace(shtrix.Text,'http://verum.uz/qr.php?text=','');// http://verum.uz/qr.php?text=hd2lq1d
    dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from s_tovar t,asos_slave a,asos  WHERE a.del_flag=1 and (asos.tur_oper=1 or asos.tur_oper=4 or asos.tur_oper=5) and a.asos_id=asos.id and a.tovar_id=t.id and a.user_id = '+DMS.s_clientid.AsString+' and ' );
    if ((StrToInt(copy(shtrix.Text,1,2))>19)) and ((StrToInt(copy(shtrix.Text,1,2))<30)) then
    begin
      dms.qoldiq.SQL.Add(' (a.kol_ost>0 or a.kol_in_ost>0) and t.shtrix_in ="'+copy(shtrix.Text,3,5)+'" order by t.nom,a.srok');
      //kg:=inttostr(strtoint(copy(shtrix.Text,8,5) ));if kg='0' then kg:='';
      kg:=copy(shtrix.Text,8,2);gr:=copy(shtrix.Text,10,3);
      if copy(shtrix.Text,8,5)='00000' then
      begin
        kg:='01';gr:='000';
      end;
    end
    else
      dms.qoldiq.SQL.Add(' (a.kol_ost>0 or a.kol_in_ost>0) and (t.shtrix ="'+shtrix.Text+'" or t.shtrix1 ="'+shtrix.Text+'" or t.shtrix2 ="'+shtrix.Text+'") order by t.nom,a.srok');
    dms.qoldiq.open;DMS.s_tovar.Locate('id',dms.qoldiqtovar_id.AsInteger,[loCaseInsensitive]);
    if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
      dms.qoldiq.Edit;
      dms.qoldiqkol_in_ost.AsInteger:=0;
      dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
      dms.qoldiq.post;
    end;
    if dms.qoldiq.RecordCount=0 then begin
      shtrix.Text:='';
      exit;
    end;
    if ((dms.qoldiq.fieldbyname('srok').AsVariant-dms.setupvaqt.AsVariant)<90) and (dms.qoldiq.RecordCount>1) then
    begin shtrix.Text:='';if kg<>'' then shtrix.Text:=kg;exit;end;
    if dms.qoldiq.RecordCount>1 then begin
      case tanlash.ItemIndex of
        0:begin shtrix.Text:='';if kg<>'' then shtrix.Text:=kg;exit;end;
        1:begin dms.qoldiq.First;shtrix.Text:='';if kg<>'' then shtrix.Text:=kg;exit;end;
        2:begin dms.qoldiq.Last;shtrix.Text:='';if kg<>'' then shtrix.Text:=kg;exit;end;
      end;
    end;
    if dms.asos.RecordCount=0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;//Tovarlar.SumList.RecalcAll;
    end;
    if dms.asosdiler_id.AsInteger>0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post; //Tovarlar.SumList.RecalcAll;
    end;
    if dms.qoldiqseriya.AsString<>'' then
    begin

      if (dms.asos_slave.Locate('tovar_id',dms.qoldiqtovar_id.AsInteger,[loCaseInsensitive])) then
      begin
        k:=0;k_in:=0;
        if (kg='') and (gr='') then
        begin
          if dms.qoldiqkol_ost.AsInteger>0 then k:=dms.asos_slavekol.AsInteger else
            if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.asos_slavekol_in.AsInteger;
          minus(k,k_in);
          if dms.qoldiqkol_ost.AsInteger>0 then k:=k+1 else
            if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=k_in+dms.qoldiqkol_in_ost.AsInteger;
          plus(k,k_in);
        end
        else
        begin
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger<strtoint(kg)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          k:=dms.asos_slavekol.AsInteger;k_in:=dms.asos_slavekol_in.AsInteger;
          minus(k,k_in);
          if (gr<>'') then if (dms.qoldiqkol_in_ost.AsInteger<k_in+strtoint(gr)) then
          begin
              dms.qoldiq.Edit;
              dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger-1;
              dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger+dms.s_tovarkol_in.AsInteger;
              dms.qoldiq.Post;
          end;
          if kg<>'' then k:=k+strtoint(kg);if gr<>'' then k_in:=k_in+strtoint(gr);
          plus(k,k_in);
        end //(kg='') and (gr='')
      end
      else
      begin
        k:=0;k_in:=0;
        if (kg='') and (gr='') then begin
          if dms.qoldiqkol_ost.AsInteger>0 then k:=1 else
          if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.qoldiqkol_in_ost.AsInteger;
          yangi;plus(k,k_in);
        end
        else
        begin
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger<strtoint(kg)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          yangi;plus(1,0);minus(1,0);
          if ((dms.qoldiqkol_ost.AsInteger>0) or (dms.asos_slavekol.AsInteger>0)) and (gr<>'') then
          if (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin
            dms.qoldiq.Edit;
            dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger-1;
            memo1.Lines.Add(dms.s_tovarid.AsString+''+dms.s_tovarnom.AsString);
            dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger+dms.s_tovarkol_in.AsInteger;
            dms.qoldiq.Post;
          end;
          if (kg<>'') then k:=dms.asos_slavekol.AsInteger+strtoint(kg);
          if (gr<>'') then k_in:=dms.asos_slavekol_in.AsInteger+StrToInt(gr);
          plus(k,k_in);
        end; //kg='') and (gr=''
      end; // locate
    end;  // seriya
    if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then
    begin
      dms.qoldiq.Edit;
      dms.qoldiqkol_in_ost.AsInteger:=0;
      dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
      dms.qoldiq.post;
    end;
    if (dms.asos_slavekol_in.AsInteger>=dms.s_tovarkol_in.AsInteger) and (dms.asos_slavekol_in.AsInteger>0) then
    begin
      dms.asos_slave.Edit;
      dms.asos_slavekol_in.AsInteger:=dms.asos_slavekol_in.AsInteger-dms.s_tovarkol_in.AsInteger;
      dms.asos_slavekol.AsInteger:=dms.asos_slavekol.AsInteger+1;
      dms.asos_slave.post;
    end;
    shtrix.Text:='';
    rec:=DMS.asos_slaveid.Value;
    kafe.Tovarlar.SumList.RecalcAll;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;dms.asoscheg_e.AsFloat:=0;
    dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
    dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
    dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
    dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=(dms.asossumma.AsFloat+dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100)-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat);
    dms.asos.Post;dms.asos.Refresh;
    DMS.asos_slave.Locate('id',rec,[loCaseInsensitive]);
    DMS.main_link.Refresh;
    Key:=#0;
  end;
end;

procedure Tkafe.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if varaq.ActivePageIndex<>0 then exit;
case Key of
    13: shtrix.SetFocus;
    //27:
    45: shtrix.SetFocus;
    46:if (shtrix.Text='') and (shtrix.Focused=true) then MenuItem2Click(Sender);
    116:f5Click(Sender);117:f6Click(Sender);
    118:f7Click(Sender); //119
    119:f8Click(Sender); //120
    120:f9Click(Sender);
    121:f10Click(Sender); 
    else
    if ((Key >95) and (Key<106)) and (telefon.Focused=false) and  (cheg_naqd.Focused=false) and (cheg_plastik.Focused=false) and (pul_naqd.Focused=false) and (pul_plastik.Focused=false) and (shtrix.Focused=false) and (q_sum.Focused=false) then  begin
      shtrix.Text:= shtrix.Text+GetCharFromVirtualKey(Key);
      shtrix.SetFocus; shtrix.SelStart := 2;
    end;
  end;
end;

procedure Tkafe.TovarlarEnter(Sender: TObject);
begin
  if dms.asos_slave.RecordCount=0 then exit;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.asos_slavekol_ost.AsString);
  dms.qoldiq.open;
end;

procedure Tkafe.shtrixKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (not dms.asos_slave.Eof) then
  begin
    dms.asos_slave.Next;
  end
  else if (Key = VK_UP) and (not dms.asos_slave.bof) then
  begin
    dms.asos_slave.Prior;shtrix.SelStart:=length(shtrix.Text)+1;
  end;
end;

procedure Tkafe.shtrixEnter(Sender: TObject);
begin
  //shtrix_p.Transparent:=false;
end;

procedure Tkafe.shtrixExit(Sender: TObject);
begin
  //shtrix_p.Transparent:=true;
end;

procedure Tkafe.f7Click(Sender: TObject);
begin
  f7.Visible:=false;pul_plastik.Visible:=true;pul_plastik.Value:=0;pul_plastik.SetFocus;
end;

procedure Tkafe.f8Click(Sender: TObject);
begin
  f8.Visible:=false;pul_naqd.Visible:=true;pul_naqd.Value:=0;ActiveControl:=pul_naqd;
end;

procedure Tkafe.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;

end;

procedure Tkafe.FormHide(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;

end;

procedure Tkafe.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  cbPrinters.Items.Assign(Printer.Printers);
  cbPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  chekPrinters.Items.Assign(Printer.Printers);
  chekPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  salatPrinters.Items.Assign(Printer.Printers);
  salatPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  baliqPrinters.Items.Assign(Printer.Printers);
  baliqPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  yorliqPrinters.Items.Assign(Printer.Printers);
  yorliqPrinters.Text := Printer.Printers[Printer.PrinterIndex];
  // Update the label to reflect the default printer
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  chekPrinters.Text := IniFile.ReadString('BAZA','printerchek','');
  salatPrinters.Text := IniFile.ReadString('BAZA','printersalat','');
  baliqPrinters.Text := IniFile.ReadString('BAZA','printerbaliq','');

  yorliqPrinters.Text := IniFile.ReadString('BAZA','printeryorliq','');
  chekshablon.Text := IniFile.ReadString('BAZA','chekshablon','chek58.fr3');
  yorliqshablon.Text := IniFile.ReadString('BAZA','yorliqshablon','');IniFile.Free;
  shalonlar;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  if IniFile.SectionExists(name)=False then begin
    IniFile.WriteInteger(name, 'left',Left);IniFile.WriteInteger(name, 'width', Width);
    IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);
  end;
  inifile.Free;

end;

procedure Tkafe.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure Tkafe.varaqClick(Sender: TObject);
var m: TRegistry;l: TstringList;s: string;
begin
  case varaq.ActivePageIndex of
  10:begin // xarajat
    DMS.lbd_pl.close;DMS.lbd_pl.SQL.Clear;
    DMS.lbd_pl.sql.add('SELECT * FROM pl where del_flag=1 and vid in (1,4,7,9,19) order by d_pl desc');
    DMS.lbd_pl.Open;

    if filtr_haridor.value=null then begin
      dms.tpl.Close;dms.tpl.SQL.Clear;
      dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and (bank_id=0 or vid = 19) order by d_pl desc ');
      dms.tpl.open;
    end
    else
    begin
      dms.tpl.Close;dms.tpl.SQL.Clear;
      dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and bank_id=0 and h_id='+inttostr(filtr_haridor.value)+' order by d_pl desc ');
      dms.tpl.open;
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
    //dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and client_id='+admin_clid+'  and xodim_id='+admin_id+'  and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'" order by id desc');
    //if not (dms.asos.State=dsBrowse) then
    //dms.asos.Post;
    tur.ItemIndex:=0;
    dms.asos.Close;
    dms.asos.SQL.Clear;
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and client_id='+admin_clid+'  and xodim_id='+admin_id+'  and  not (pl_id is not Null or plastik_id is not Null) order by id desc');
    dms.asos.open;
    while not dms.asos.Eof do begin
      if (dms.asoskol.AsInteger=0) and (Date()<>dms.asossana.AsDateTime) then begin
        dms.asos.Edit; dms.asossana.AsDateTime:=Date(); dms.asos.post; dms.asos.refresh;
      end;
      dms.asos.Next;
    end;
    DMS.qoldiq.open;
    dms.tpl.Close;dms.tpl.SQL.Clear;
    dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and vid <> 1 order by d_pl desc ');
    dms.tpl.open;
    DMS.s_tovar.Refresh;
    tovarlar.SumList.RecalcAll;
    if (dms.asosh_id.AsVariant=null) then
    begin
      p_haridor.Visible:=false;
    end
    else
    begin
      p_haridor.Visible:=true;
      p_xisoblaClick(Sender);
    end;
    shtrix.SetFocus;
  end;
  1:begin // x - hisobot
      Edit4.Text:='';
      dms.x_otchet.Close;dms.x_otchet.SQL.Clear; // xodimlar bo`yicha
      dms.x_otchet.SQL.Add('select a.sana,x.fio as xodimnom,count(a.id) as qator,sum(a.summa) as jami,sum(a.sum_naqd) as jami_naqd,sum(a.sum_plastik) as jami_plastir,sum(a.cheg_n) as jami_cheg_n,sum(a.cheg_p) as jami_cheg_p ');
      //dms.x_otchet.SQL.Add('from asos a,user x WHERE x.id=a.user_id and a.del_flag=1 and a.tur_oper=2 )' );
      if CheckBox1.Checked=true then
        dms.x_otchet.SQL.Add('from asos a,user x WHERE x.id=a.user_id and a.del_flag=0 and a.tur_oper=2 and a.kol>0 and not (pl_id is not Null or plastik_id is not Null)' )
      else
        dms.x_otchet.SQL.Add('from asos a,user x WHERE x.id=a.user_id and a.del_flag=1 and a.tur_oper=2 and a.kol>0 and not (pl_id is not Null or plastik_id is not Null)' );
      dms.x_otchet.SQL.Add(' group by a.sana,x.fio order by x.fio ');
      dms.x_otchet.open;
      dms.asos.Close;
      dms.asos.SQL.Clear;
      if CheckBox1.Checked=true then
      dms.asos.SQL.Add('select * from asos where del_flag=0 and tur_oper=2  order by id desc')
      else
      dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id>0 and client_id='+admin_clid+' and not (pl_id is not Null or plastik_id is not Null) order by id desc');
      dms.asos.open;

      if CheckBox1.Checked=true then begin
        dms.asos_slave.Close;dms.asos_slave.SQL.Clear;
        dms.asos_slave.SQL.Add('SELECT * FROM asos_slave where asos_id=:id  order by id ');
        dms.asos_slave.open;
      end;
      //memo1.Lines.add(DMS.asos.SQL.Text);
      dms.tpl.Close;dms.tpl.SQL.Clear;
      dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and vid=1 order by d_pl desc ');
      dms.tpl.open;

      //if DMS.tpl.Active=false then DMS.tpl.open else DMS.tpl.refresh;
    end;
  14:begin // kun ochish va yopish
      dms.tzet.Open;
      dms.tpl.Close;dms.tpl.SQL.Clear;
      dms.tpl.SQL.Add('select * from pl WHERE zet_id=:id order by d_pl desc ');
      dms.tpl.open;
    end;
  6:begin  // tovarni qaytarib olish
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where tur_oper in (4) and del_flag=1 and client_id = '+dms.s_clientid.AsString+' order by sana desc');
      DMS.k_asos.Open;
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
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
        DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;
  8:begin // koorporativ
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where h_id>0 and del_flag=1 and client_id = '+dms.s_clientid.AsString+' order by sana desc');
      DMS.k_asos.Open;
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;
  9:begin // buyurtma
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where diler_id<0 and del_flag=1 and client_id = '+admin_clid+' and user_id = '+admin_id+' order by sana desc');
      DMS.k_asos.Open;
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;
  12:begin // mobil
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where changedate is null and diler_id>0 and mobil>0 and tur_oper=2 and del_flag=1 and client_id = '+admin_clid+' and user_id <> '+admin_id+' order by sana desc');
      DMS.k_asos.Open;

      memo1.Lines.Add(dms.k_asos.SQL.Text);
      memo1.Lines.Add(dms.asos_slave.SQL.Text);
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;
    end;
  13:begin // stol
      DMS.k_asos.close;DMS.k_asos.SQL.Clear;
      DMS.k_asos.sql.add('SELECT * FROM asos where changedate is null and diler_id>0 and mobil>0 and tur_oper=2 and del_flag=1 and client_id = '+admin_clid+' and user_id <> '+admin_id+' order by sana desc');
      DMS.k_asos.Open;
      memo1.Lines.Add(dms.k_asos.SQL.Text);
      memo1.Lines.Add(dms.asos_slave.SQL.Text);
      if DMS.s_t_all.Active=false then begin
        DMS.s_t_all.close;DMS.s_t_all.SQL.Clear;
        DMS.s_t_all.sql.add('SELECT * FROM s_tovar where del_flag=1 order by nom');
        DMS.s_t_all.Open;
      end;
      DMS.k_slave.Open;

    DMS.link.close;DMS.link.SQL.Clear;
    DMS.link.sql.add('SELECT a.id,mobil,count(s.id) as soni,user.username FROM user,asos a left join asos_slave s on a.id=s.asos_id where user.id=a.user_id and a.changedate is null and a.mobil>0 and a.print_flag=0 and a.tur_oper=2 and a.del_flag=1 and a.client_id = '+admin_clid+' group by a.id');
    DMS.link.Open;
    dms.s_mobil.Filter:='qavat=1';dms.s_mobil.Filtered:=true;
    dms.s_mobil.Locate('nn','1',[loCaseInsensitive]);
    s1_1.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','2',[loCaseInsensitive]);
    s1_2.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','3',[loCaseInsensitive]);
    s1_3.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','4',[loCaseInsensitive]);
    s1_4.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','5',[loCaseInsensitive]);
    s1_5.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','6',[loCaseInsensitive]);
    s1_6.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','7',[loCaseInsensitive]);
    s1_7.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','8',[loCaseInsensitive]);
    s1_8.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','9',[loCaseInsensitive]);
    s1_9.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','10',[loCaseInsensitive]);
    s1_10.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','11',[loCaseInsensitive]);
    s1_11.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','12',[loCaseInsensitive]);
    s1_12.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','13',[loCaseInsensitive]);
    s1_13.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','14',[loCaseInsensitive]);
    s1_14.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','15',[loCaseInsensitive]);
    s1_15.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','16',[loCaseInsensitive]);
    s1_16.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','17',[loCaseInsensitive]);
    s1_17.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','18',[loCaseInsensitive]);
    s1_18.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','19',[loCaseInsensitive]);
    s1_19.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','20',[loCaseInsensitive]);
    s1_20.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','21',[loCaseInsensitive]);
    s1_21.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','22',[loCaseInsensitive]);
    s1_22.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','23',[loCaseInsensitive]);
    s1_23.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','24',[loCaseInsensitive]);
    s1_24.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','25',[loCaseInsensitive]);
    s1_25.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','26',[loCaseInsensitive]);
    s1_26.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','27',[loCaseInsensitive]);
    s1_27.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','28',[loCaseInsensitive]);
    s1_28.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','29',[loCaseInsensitive]);
    s1_29.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','30',[loCaseInsensitive]);
    s1_30.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','31',[loCaseInsensitive]);
    s1_31.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','32',[loCaseInsensitive]);
    s1_32.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','33',[loCaseInsensitive]);
    s1_33.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','34',[loCaseInsensitive]);
    s1_34.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','35',[loCaseInsensitive]);
    s1_35.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','36',[loCaseInsensitive]);
    s1_36.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','37',[loCaseInsensitive]);
    s1_37.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','38',[loCaseInsensitive]);
    s1_38.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','39',[loCaseInsensitive]);
    s1_39.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','40',[loCaseInsensitive]);
    s1_40.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','41',[loCaseInsensitive]);
    s1_41.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','42',[loCaseInsensitive]);
    s1_42.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','43',[loCaseInsensitive]);
    s1_43.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','44',[loCaseInsensitive]);
    s1_44.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','45',[loCaseInsensitive]);
    s1_45.Caption:=dms.s_mobil.fieldbyname('nom').AsString;

    dms.s_mobil.Filter:='qavat=2';dms.s_mobil.Filtered:=true;
    dms.s_mobil.Locate('nn','1',[loCaseInsensitive]);
    s2_1.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','2',[loCaseInsensitive]);
    s2_2.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','3',[loCaseInsensitive]);
    s2_3.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','4',[loCaseInsensitive]);
    s2_4.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','5',[loCaseInsensitive]);
    s2_5.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','6',[loCaseInsensitive]);
    s2_6.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','7',[loCaseInsensitive]);
    s2_7.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','8',[loCaseInsensitive]);
    s2_8.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','9',[loCaseInsensitive]);
    s2_9.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','10',[loCaseInsensitive]);
    s2_10.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','11',[loCaseInsensitive]);
    s2_11.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','12',[loCaseInsensitive]);
    s2_12.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','13',[loCaseInsensitive]);
    s2_13.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','14',[loCaseInsensitive]);
    s2_14.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','15',[loCaseInsensitive]);
    s2_15.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','16',[loCaseInsensitive]);
    s2_16.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','17',[loCaseInsensitive]);
    s2_17.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','18',[loCaseInsensitive]);
    s2_18.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','19',[loCaseInsensitive]);
    s2_19.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','20',[loCaseInsensitive]);
    s2_20.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','21',[loCaseInsensitive]);
    s2_21.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','22',[loCaseInsensitive]);
    s2_22.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','23',[loCaseInsensitive]);
    s2_23.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','24',[loCaseInsensitive]);
    s2_24.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','25',[loCaseInsensitive]);
    s2_25.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','26',[loCaseInsensitive]);
    s2_26.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','27',[loCaseInsensitive]);
    s2_27.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','28',[loCaseInsensitive]);
    s2_28.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','29',[loCaseInsensitive]);
    s2_29.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','30',[loCaseInsensitive]);
    s2_30.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','31',[loCaseInsensitive]);
    s2_31.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','32',[loCaseInsensitive]);
    s2_32.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','33',[loCaseInsensitive]);
    s2_33.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','34',[loCaseInsensitive]);
    s2_34.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','35',[loCaseInsensitive]);
    s2_35.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','36',[loCaseInsensitive]);
    s2_36.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','37',[loCaseInsensitive]);
    s2_37.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','38',[loCaseInsensitive]);
    s2_38.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','39',[loCaseInsensitive]);
    s2_39.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','40',[loCaseInsensitive]);
    s2_40.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','41',[loCaseInsensitive]);
    s2_41.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','42',[loCaseInsensitive]);
    s2_42.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','43',[loCaseInsensitive]);
    s2_43.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','44',[loCaseInsensitive]);
    s2_44.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','45',[loCaseInsensitive]);
    s2_45.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Filter:='qavat=3';dms.s_mobil.Filtered:=true;

    dms.s_mobil.Locate('nn','1',[loCaseInsensitive]);
    s3_1.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','2',[loCaseInsensitive]);
    s3_2.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','3',[loCaseInsensitive]);
    s3_3.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','4',[loCaseInsensitive]);
    s3_4.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','5',[loCaseInsensitive]);
    s3_5.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','6',[loCaseInsensitive]);
    s3_6.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','7',[loCaseInsensitive]);
    s3_7.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','8',[loCaseInsensitive]);
    s3_8.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','9',[loCaseInsensitive]);
    s3_9.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','10',[loCaseInsensitive]);
    s3_10.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','11',[loCaseInsensitive]);
    s3_11.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','12',[loCaseInsensitive]);
    s3_12.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','13',[loCaseInsensitive]);
    s3_13.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','14',[loCaseInsensitive]);
    s3_14.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','15',[loCaseInsensitive]);
    s3_15.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','16',[loCaseInsensitive]);
    s3_16.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','17',[loCaseInsensitive]);
    s3_17.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','18',[loCaseInsensitive]);
    s3_18.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','19',[loCaseInsensitive]);
    s3_19.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','20',[loCaseInsensitive]);
    s3_20.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','21',[loCaseInsensitive]);
    s3_21.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','22',[loCaseInsensitive]);
    s3_22.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','23',[loCaseInsensitive]);
    s3_23.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','24',[loCaseInsensitive]);
    s3_24.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','25',[loCaseInsensitive]);
    s3_25.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','26',[loCaseInsensitive]);
    s3_26.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','27',[loCaseInsensitive]);
    s3_27.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','28',[loCaseInsensitive]);
    s3_28.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','29',[loCaseInsensitive]);
    s3_29.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','30',[loCaseInsensitive]);
    s3_30.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','31',[loCaseInsensitive]);
    s3_31.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','32',[loCaseInsensitive]);
    s3_32.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','33',[loCaseInsensitive]);
    s3_33.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','34',[loCaseInsensitive]);
    s3_34.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','35',[loCaseInsensitive]);
    s3_35.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','36',[loCaseInsensitive]);
    s3_36.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','37',[loCaseInsensitive]);
    s3_37.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','38',[loCaseInsensitive]);
    s3_38.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','39',[loCaseInsensitive]);
    s3_39.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','40',[loCaseInsensitive]);
    s3_40.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','41',[loCaseInsensitive]);
    s3_41.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','42',[loCaseInsensitive]);
    s3_42.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','43',[loCaseInsensitive]);
    s3_43.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','44',[loCaseInsensitive]);
    s3_44.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Locate('nn','45',[loCaseInsensitive]);
    s3_45.Caption:=dms.s_mobil.fieldbyname('nom').AsString;
    dms.s_mobil.Filter:='';dms.s_mobil.Filtered:=false;
    s1_1.Color:=clSilver;s1_2.Color:=clSilver;s2_3.Color:=clSilver;s1_4.Color:=clSilver;s1_5.Color:=clSilver;
    s1_6.Color:=clSilver;s1_7.Color:=clSilver;s2_8.Color:=clSilver;s1_9.Color:=clSilver;s1_10.Color:=clSilver;
    s1_11.Color:=clSilver;s1_12.Color:=clSilver;s1_13.Color:=clSilver;s1_14.Color:=clSilver;s1_15.Color:=clSilver;
    s1_16.Color:=clSilver;s1_17.Color:=clSilver;s1_18.Color:=clSilver;s1_19.Color:=clSilver;s1_20.Color:=clSilver;
    s1_21.Color:=clSilver;s1_22.Color:=clSilver;s1_23.Color:=clSilver;s1_24.Color:=clSilver;s1_25.Color:=clSilver;
    s1_26.Color:=clSilver;s1_27.Color:=clSilver;s1_28.Color:=clSilver;s1_29.Color:=clSilver;s1_30.Color:=clSilver;
    s1_31.Color:=clSilver;s1_32.Color:=clSilver;s1_33.Color:=clSilver;s1_34.Color:=clSilver;s1_35.Color:=clSilver;
    s1_36.Color:=clSilver;s1_37.Color:=clSilver;s1_38.Color:=clSilver;s1_39.Color:=clSilver;s1_40.Color:=clSilver;
    s1_41.Color:=clSilver;s1_42.Color:=clSilver;s1_43.Color:=clSilver;s1_44.Color:=clSilver;s1_45.Color:=clSilver;
    s2_1.Color:=clSilver;s2_2.Color:=clSilver;s2_3.Color:=clSilver;s2_4.Color:=clSilver;s2_5.Color:=clSilver;
    s2_6.Color:=clSilver;s2_7.Color:=clSilver;s2_8.Color:=clSilver;s2_9.Color:=clSilver;s2_10.Color:=clSilver;
    s2_11.Color:=clSilver;s2_12.Color:=clSilver;s2_13.Color:=clSilver;s2_14.Color:=clSilver;s2_15.Color:=clSilver;
    s2_16.Color:=clSilver;s2_17.Color:=clSilver;s2_18.Color:=clSilver;s2_19.Color:=clSilver;s2_20.Color:=clSilver;
    s2_21.Color:=clSilver;s2_22.Color:=clSilver;s2_23.Color:=clSilver;s2_24.Color:=clSilver;s2_25.Color:=clSilver;
    s2_26.Color:=clSilver;s2_27.Color:=clSilver;s2_28.Color:=clSilver;s2_29.Color:=clSilver;s2_30.Color:=clSilver;
    s2_31.Color:=clSilver;s2_32.Color:=clSilver;s2_33.Color:=clSilver;s2_34.Color:=clSilver;s2_35.Color:=clSilver;
    s2_36.Color:=clSilver;s2_37.Color:=clSilver;s2_38.Color:=clSilver;s2_39.Color:=clSilver;s2_40.Color:=clSilver;
    s2_41.Color:=clSilver;s2_42.Color:=clSilver;s2_43.Color:=clSilver;s2_44.Color:=clSilver;s2_45.Color:=clSilver;
    s3_1.Color:=clSilver;s3_2.Color:=clSilver;s3_3.Color:=clSilver;s3_4.Color:=clSilver;s3_5.Color:=clSilver;
    s3_6.Color:=clSilver;s3_7.Color:=clSilver;s3_8.Color:=clSilver;s3_9.Color:=clSilver;s3_10.Color:=clSilver;
    s3_11.Color:=clSilver;s3_12.Color:=clSilver;s3_13.Color:=clSilver;s3_14.Color:=clSilver;s3_15.Color:=clSilver;
    s3_16.Color:=clSilver;s3_17.Color:=clSilver;s3_18.Color:=clSilver;s3_19.Color:=clSilver;s3_20.Color:=clSilver;
    s3_21.Color:=clSilver;s3_22.Color:=clSilver;s3_23.Color:=clSilver;s3_24.Color:=clSilver;s3_25.Color:=clSilver;
    s3_26.Color:=clSilver;s3_27.Color:=clSilver;s3_28.Color:=clSilver;s3_29.Color:=clSilver;s3_30.Color:=clSilver;
    s3_31.Color:=clSilver;s3_32.Color:=clSilver;s3_33.Color:=clSilver;s3_34.Color:=clSilver;s3_35.Color:=clSilver;
    s3_36.Color:=clSilver;s3_37.Color:=clSilver;s3_38.Color:=clSilver;s3_39.Color:=clSilver;s3_40.Color:=clSilver;
    s3_41.Color:=clSilver;s3_42.Color:=clSilver;s3_43.Color:=clSilver;s3_44.Color:=clSilver;s3_45.Color:=clSilver;
    while not DMS.link.Eof do begin
      case DMS.link.FieldByName('mobil').Value of
      47:begin
          if DMS.link.FieldByName('soni').Value>0 then begin
            //s1_1.Caption:='1'+#13+DMS.link.FieldByName('username').AsString;
            s1_1.Caption:=s1_1.Caption+#13+DMS.link.FieldByName('username').AsString;
            s1_1.Color:=clLime;
          end;
        end;
      48:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_2.Caption:=s1_2.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_2.Color:=clLime;
           end;
        end;
      49:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_3.Caption:=s1_3.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_3.Color:=clLime;
           end;
        end;
      50:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_4.Caption:=s1_4.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_4.Color:=clLime;
           end;
        end;
      51:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_5.Caption:=s1_5.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_5.Color:=clLime;
           end;
        end;
      52:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_6.Caption:=s1_6.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_6.Color:=clLime;
           end;
        end;
      53:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_7.Caption:=s1_7.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_7.Color:=clLime;
           end;
        end;
      54:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_8.Caption:=s1_8.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_8.Color:=clLime;
           end;
        end;
      55:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_9.Caption:=s1_9.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_9.Color:=clLime;
           end;
        end;
      56:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_10.Caption:=s1_10.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_10.Color:=clLime;
           end;
        end;
      57:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_11.Caption:=s1_11.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_11.Color:=clLime;
           end;
        end;
      58:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_12.Caption:=s1_12.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_12.Color:=clLime;
           end;
        end;
      59:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_13.Caption:=s1_13.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_13.Color:=clLime;
           end;
        end;
      60:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_14.Caption:=s1_14.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_14.Color:=clLime;
           end;
        end;
      61:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_15.Caption:=s1_15.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_15.Color:=clLime;
           end;
        end;
      62:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_16.Caption:=s1_16.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_16.Color:=clLime;
           end;
        end;
      63:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_17.Caption:=s1_17.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_17.Color:=clLime;
           end;
        end;
      64:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_18.Caption:=s1_18.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_18.Color:=clLime;
           end;
        end;
      65:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_19.Caption:=s1_19.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_19.Color:=clLime;
           end;
        end;
      66:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_20.Caption:=s1_20.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_20.Color:=clLime;
           end;
        end;
      67:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_21.Caption:=s1_21.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_21.Color:=clLime;
           end;
        end;
      68:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_22.Caption:=s1_22.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_22.Color:=clLime;
           end;
        end;
      69:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_23.Caption:=s1_23.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_23.Color:=clLime;
           end;
        end;
      70:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_24.Caption:=s1_24.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_24.Color:=clLime;
           end;
        end;
      71:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_25.Caption:=s1_25.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_25.Color:=clLime;
           end;
        end;
      72:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_26.Caption:=s1_26.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_26.Color:=clLime;
           end;
        end;
      73:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_27.Caption:=s1_27.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_27.Color:=clLime;
           end;
        end;
      74:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_28.Caption:=s1_28.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_28.Color:=clLime;
           end;
        end;
      75:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_29.Caption:=s1_29.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_29.Color:=clLime;
           end;
        end;
      76:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_30.Caption:=s1_30.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_30.Color:=clLime;
           end;
        end;
      77:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_31.Caption:=s1_31.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_31.Color:=clLime;
           end;
        end;
     78:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_32.Caption:=s1_32.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_32.Color:=clLime;
           end;
        end;
     79:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_33.Caption:=s1_33.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_33.Color:=clLime;
           end;
        end;
     80:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_34.Caption:=s1_34.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_34.Color:=clLime;
           end;
        end;
     81:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_35.Caption:=s1_35.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_35.Color:=clLime;
           end;
        end;
     82:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_36.Caption:=s1_36.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_36.Color:=clLime;
           end;
        end;
     83:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_37.Caption:=s1_37.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_37.Color:=clLime;
           end;
        end;
     84:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_38.Caption:=s1_38.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_38.Color:=clLime;
           end;
        end;
     85:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_39.Caption:=s1_39.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_39.Color:=clLime;
           end;
        end;
     86:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_40.Caption:=s1_40.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_40.Color:=clLime;
           end;
        end;
     87:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_41.Caption:=s1_41.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_41.Color:=clLime;
           end;
        end;
     88:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_42.Caption:=s1_42.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_42.Color:=clLime;
           end;
        end;
     89:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_43.Caption:=s1_43.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_43.Color:=clLime;
           end;
        end;
     90:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_44.Caption:=s1_44.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_44.Color:=clLime;
           end;
        end;
     91:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s1_45.Caption:=s1_45.Caption+#13+DMS.link.FieldByName('username').AsString;
             s1_45.Color:=clLime;
           end;
        end;
      46:begin
          if DMS.link.FieldByName('soni').Value>0 then begin
            s2_1.Caption:=s2_1.Caption+#13+DMS.link.FieldByName('username').AsString;
            s2_1.Color:=clLime;
          end;
        end;
      2:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_2.Caption:=s2_2.Caption+#13+DMS.link.FieldByName('username').AsString;s2_2.Color:=clLime;
           end;
        end;
      3:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_3.Caption:=s2_3.Caption+#13+DMS.link.FieldByName('username').AsString;s2_3.Color:=clLime;
           end;
        end;
      4:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_4.Caption:=s2_4.Caption+#13+DMS.link.FieldByName('username').AsString;s2_4.Color:=clLime;
           end;
        end;
      5:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_5.Caption:=s2_5.Caption+#13+DMS.link.FieldByName('username').AsString;s2_5.Color:=clLime;
           end;
        end;
      6:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_6.Caption:=s2_6.Caption+#13+DMS.link.FieldByName('username').AsString;s2_6.Color:=clLime;
           end;
        end;
      7:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_7.Caption:=s2_7.Caption+#13+DMS.link.FieldByName('username').AsString;s2_7.Color:=clLime;
           end;
        end;
      8:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_8.Caption:=s2_8.Caption+#13+DMS.link.FieldByName('username').AsString;s2_8.Color:=clLime;
           end;
        end;
      9:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_9.Caption:=s2_9.Caption+#13+DMS.link.FieldByName('username').AsString;s2_9.Color:=clLime;
           end;
        end;
      10:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_10.Caption:=s2_10.Caption+#13+DMS.link.FieldByName('username').AsString;s2_10.Color:=clLime;
           end;
        end;
      11:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_11.Caption:=s2_11.Caption+#13+DMS.link.FieldByName('username').AsString;s2_11.Color:=clLime;
           end;
        end;
      12:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_12.Caption:=s2_12.Caption+#13+DMS.link.FieldByName('username').AsString;s2_12.Color:=clLime;
           end;
        end;
      13:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_13.Caption:=s2_13.Caption+#13+DMS.link.FieldByName('username').AsString;s2_13.Color:=clLime;
           end;
        end;
      14:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_14.Caption:=s2_14.Caption+#13+DMS.link.FieldByName('username').AsString;s2_14.Color:=clLime;
           end;
        end;
      15:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_15.Caption:=s2_15.Caption+#13+DMS.link.FieldByName('username').AsString;s2_15.Color:=clLime;
           end;
        end;
      16:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_16.Caption:=s2_16.Caption+#13+DMS.link.FieldByName('username').AsString;s2_16.Color:=clLime;
           end;
        end;
      17:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_17.Caption:=s2_17.Caption+#13+DMS.link.FieldByName('username').AsString;s2_17.Color:=clLime;
           end;
        end;
      18:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_18.Caption:=s2_18.Caption+#13+DMS.link.FieldByName('username').AsString;s2_18.Color:=clLime;
           end;
        end;
      19:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_19.Caption:=s2_19.Caption+#13+DMS.link.FieldByName('username').AsString;s2_19.Color:=clLime;
           end;
        end;
      20:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_20.Caption:=s2_20.Caption+#13+DMS.link.FieldByName('username').AsString;s2_20.Color:=clLime;
           end;
        end;
      21:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_21.Caption:=s2_21.Caption+#13+DMS.link.FieldByName('username').AsString;s2_21.Color:=clLime;
           end;
        end;
      22:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_22.Caption:=s2_22.Caption+#13+DMS.link.FieldByName('username').AsString;s2_22.Color:=clLime;
           end;
        end;
      23:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_23.Caption:=s2_23.Caption+#13+DMS.link.FieldByName('username').AsString;s2_23.Color:=clLime;
           end;
        end;
      24:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_24.Caption:=s2_24.Caption+#13+DMS.link.FieldByName('username').AsString;s2_24.Color:=clLime;
           end;
        end;
      25:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_25.Caption:=s2_25.Caption+#13+DMS.link.FieldByName('username').AsString;s2_25.Color:=clLime;
           end;
        end;
      26:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_26.Caption:=s2_26.Caption+#13+DMS.link.FieldByName('username').AsString;s2_26.Color:=clLime;
           end;
        end;
      27:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_27.Caption:=s2_27.Caption+#13+DMS.link.FieldByName('username').AsString;s2_27.Color:=clLime;
           end;
        end;
      28:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_28.Caption:=s2_28.Caption+#13+DMS.link.FieldByName('username').AsString;s2_28.Color:=clLime;
           end;
        end;
      29:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_29.Caption:=s2_29.Caption+#13+DMS.link.FieldByName('username').AsString;s2_29.Color:=clLime;
           end;
        end;
      30:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_30.Caption:=s2_30.Caption+#13+DMS.link.FieldByName('username').AsString;s2_30.Color:=clLime;
           end;
        end;
      31:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_31.Caption:=s2_31.Caption+#13+DMS.link.FieldByName('username').AsString;s2_31.Color:=clLime;
           end;
        end;
     32:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_32.Caption:=s2_32.Caption+#13+DMS.link.FieldByName('username').AsString;s2_32.Color:=clLime;
           end;
        end;
     33:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_33.Caption:=s2_33.Caption+#13+DMS.link.FieldByName('username').AsString;s2_33.Color:=clLime;
           end;
        end;
     34:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_34.Caption:=s2_34.Caption+#13+DMS.link.FieldByName('username').AsString;s2_34.Color:=clLime;
           end;
        end;
     35:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_35.Caption:=s2_35.Caption+#13+DMS.link.FieldByName('username').AsString;s2_35.Color:=clLime;
           end;
        end;
     36:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_36.Caption:=s2_36.Caption+#13+DMS.link.FieldByName('username').AsString;s2_36.Color:=clLime;
           end;
        end;
     37:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_37.Caption:=s2_37.Caption+#13+DMS.link.FieldByName('username').AsString;s2_37.Color:=clLime;
           end;
        end;
     38:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_38.Caption:=s2_38.Caption+#13+DMS.link.FieldByName('username').AsString;s2_38.Color:=clLime;
           end;
        end;
     39:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_39.Caption:=s2_39.Caption+#13+DMS.link.FieldByName('username').AsString;s2_39.Color:=clLime;
           end;
        end;
     40:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_40.Caption:=s2_40.Caption+#13+DMS.link.FieldByName('username').AsString;s2_40.Color:=clLime;
           end;
        end;
     41:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_41.Caption:=s2_41.Caption+#13+DMS.link.FieldByName('username').AsString;s2_41.Color:=clLime;
           end;
        end;
     42:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_42.Caption:=s2_42.Caption+#13+DMS.link.FieldByName('username').AsString;s2_42.Color:=clLime;
           end;
        end;
     43:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_43.Caption:=s2_43.Caption+#13+DMS.link.FieldByName('username').AsString;s2_43.Color:=clLime;
           end;
        end;
     44:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_44.Caption:=s2_44.Caption+#13+DMS.link.FieldByName('username').AsString;s2_44.Color:=clLime;
           end;
        end;
     45:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s2_45.Caption:=s2_45.Caption+#13+DMS.link.FieldByName('username').AsString;s2_45.Color:=clLime;
           end;
        end;

     92:begin
          if DMS.link.FieldByName('soni').Value>0 then begin
            s3_1.Caption:=s3_1.Caption+#13+DMS.link.FieldByName('username').AsString;
            s3_1.Color:=clLime;
          end;
        end;
      93:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_2.Caption:=s3_2.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_2.Color:=clLime;
           end;
        end;
      94:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_3.Caption:=s3_3.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_3.Color:=clLime;
           end;
        end;
      95:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_4.Caption:=s3_4.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_4.Color:=clLime;
           end;
        end;
      96:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_5.Caption:=s3_5.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_5.Color:=clLime;
           end;
        end;
      97:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_6.Caption:=s3_6.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_6.Color:=clLime;
           end;
        end;
      98:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_7.Caption:=s3_7.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_7.Color:=clLime;
           end;
        end;
      99:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_8.Caption:=s3_8.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_8.Color:=clLime;
           end;
        end;
      100:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_9.Caption:=s3_9.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_9.Color:=clLime;
           end;
        end;
      101:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_10.Caption:=s3_10.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_10.Color:=clLime;
           end;
        end;
      102:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_11.Caption:=s3_11.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_11.Color:=clLime;
           end;
        end;
      103:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_12.Caption:=s3_12.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_12.Color:=clLime;
           end;
        end;
      104:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_13.Caption:=s3_13.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_13.Color:=clLime;
           end;
        end;
      105:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_14.Caption:=s3_14.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_14.Color:=clLime;
           end;
        end;
      106:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_15.Caption:=s3_15.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_15.Color:=clLime;
           end;
        end;
      107:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_16.Caption:=s3_16.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_16.Color:=clLime;
           end;
        end;
      108:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_17.Caption:=s3_17.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_17.Color:=clLime;
           end;
        end;
      109:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_18.Caption:=s3_18.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_18.Color:=clLime;
           end;
        end;
      110:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_19.Caption:=s3_19.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_19.Color:=clLime;
           end;
        end;
      111:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_20.Caption:=s3_20.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_20.Color:=clLime;
           end;
        end;
      112:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_21.Caption:=s3_21.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_21.Color:=clLime;
           end;
        end;
      113:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_22.Caption:=s3_22.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_22.Color:=clLime;
           end;
        end;
      114:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_23.Caption:=s3_23.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_23.Color:=clLime;
           end;
        end;
      115:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_24.Caption:=s3_24.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_24.Color:=clLime;
           end;
        end;
      116:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_25.Caption:=s3_25.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_25.Color:=clLime;
           end;
        end;
      117:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_26.Caption:=s3_26.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_26.Color:=clLime;
           end;
        end;
      118:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_27.Caption:=s3_27.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_27.Color:=clLime;
           end;
        end;
      119:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_28.Caption:=s3_28.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_28.Color:=clLime;
           end;
        end;
      120:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_29.Caption:=s3_29.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_29.Color:=clLime;
           end;
        end;
      121:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_30.Caption:=s3_30.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_30.Color:=clLime;
           end;
        end;
      122:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_31.Caption:=s3_31.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_31.Color:=clLime;
           end;
        end;
     123:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_32.Caption:=s3_32.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_32.Color:=clLime;
           end;
        end;
     124:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_33.Caption:=s3_33.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_33.Color:=clLime;
           end;
        end;
     125:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_34.Caption:=s3_34.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_34.Color:=clLime;
           end;
        end;
     126:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_35.Caption:=s3_35.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_35.Color:=clLime;
           end;
        end;
     127:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_36.Caption:=s3_36.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_36.Color:=clLime;
           end;
        end;
     128:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_37.Caption:=s3_37.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_37.Color:=clLime;
           end;
        end;
     129:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_38.Caption:=s3_38.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_38.Color:=clLime;
           end;
        end;
     130:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_39.Caption:=s3_39.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_39.Color:=clLime;
           end;
        end;
     131:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_40.Caption:=s3_40.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_40.Color:=clLime;
           end;
        end;
     132:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_41.Caption:=s3_41.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_41.Color:=clLime;
           end;
        end;
     133:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_42.Caption:=s3_42.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_42.Color:=clLime;
           end;
        end;
     134:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_43.Caption:=s3_43.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_43.Color:=clLime;
           end;
        end;
     135:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_44.Caption:=s3_44.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_44.Color:=clLime;
           end;
        end;
     136:begin
           if DMS.link.FieldByName('soni').Value>0 then begin
             s3_45.Caption:=s3_45.Caption+#13+DMS.link.FieldByName('username').AsString;
             s3_45.Color:=clLime;
           end;
        end;

      end; // case
      DMS.link.Next;
    end;

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

procedure Tkafe.cbPrintersChange(Sender: TObject);
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

procedure Tkafe.MenuItem3Click(Sender: TObject);
var k,k_in:integer;s:string;IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  s := IniFile.ReadString('BAZA','kafex','2290');
  IniFile.Free;
  if Edit4.Text<>s then exit;  if dms.asos.RecordCount=0 then exit;
  k:=0;k_in:=0;
  if MessageDlg(dms.asosdiler_id.AsString+' -  sonli chekni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    kafe.Caption:=inttostr(dms.asosid.AsInteger);

    dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
      if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
      minus(k,k_in);
      dms.asos_slave.edit;
      dms.asos_slavedel_flag.AsInteger:=0;
      dms.asos_slave.post;
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
        dms.qoldiq.post;
      end;
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger*2) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+2;
        dms.qoldiq.post;
      end;
      dms.asos_slave.Next;
    end;
    kafe.Caption:=kafe.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.edit;
    dms.asosdel_flag.AsInteger:=0;
    dms.asos.post;
    kafe.Caption:=kafe.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.Refresh;
    dms.asos_slave.refresh; dms.main_link.Refresh;

  end;

end;

procedure Tkafe.TovarlarGetFooterParams(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  if (Column.Field.FieldName = 's_tovar') then Text := 'Ro`yhat soni = ' + Text
  else if (Column.Field.FieldName = 'VName') then Text := Text + ' records';
end;

procedure Tkafe.tanlashChange(Sender: TObject);
var IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','strixqidir',inttostr(tanlash.ItemIndex));IniFile.Destroy;
end;

procedure Tkafe.Edit3Enter(Sender: TObject);
begin
  RzPanel1.Transparent:=false;
end;

procedure Tkafe.Edit3Exit(Sender: TObject);
begin
  RzPanel1.Transparent:=true;
end;

procedure Tkafe.Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure Tkafe.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then exit;
  if Edit3.Text='' then exit;
  dms.s_tovar.Close;dms.s_tovar.SQL.Clear;
  dms.s_tovar.SQL.Add('select * from s_tovar WHERE del_flag=1 and shtrix="'+edit3.Text+'"');
  dms.s_tovar.open;
  yangi_return;
  Edit3.Text:='';
  Key:=#0;
end;

procedure Tkafe.xnewClick(Sender: TObject);
begin
  DMS.k_asos.Append;
  dms.k_asosmobil.AsInteger:=0;
  DMS.k_asossana.AsDateTime:=Now;
  DMS.k_asostur_oper.AsInteger:=4;
  dms.k_asosclient_id.AsInteger:=dms.s_clientid.AsInteger;
  dms.k_asosuser_id.AsInteger:=dms.s_clientx_id.AsInteger;
  dms.setup.Refresh;
  dms.k_asoschangedate.AsDateTime:=dms.setupvaqt.AsDateTime;
  DMS.k_asos.Post;
end;

procedure Tkafe.DBGridEh3Exit(Sender: TObject);
begin
  if dms.k_asos.State = dsedit then dms.k_asos.Post;
end;

procedure Tkafe.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if dms.s_tovar.RecordCount=0 then exit;
  if key=#13 then begin
    yangi_return;
  end; // if 13

end;

procedure Tkafe.Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    dms.s_tovar.SQL.Add('select * from s_tovar t WHERE del_flag=1 and ' );
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
      dms.s_tovar.SQL.Add('select * from s_tovar t WHERE del_flag=1 and ' );
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

procedure Tkafe.DBGridEh2DblClick(Sender: TObject);
begin
  yangi_return;
end;

procedure Tkafe.DBGridEh2KeyPress(Sender: TObject; var Key: Char);
begin
    if key<>#13 then exit;
    yangi_return;
end;

procedure Tkafe.DBGridEh6Exit(Sender: TObject);
begin
  if dms.k_slave.State = dsedit then dms.k_slave.Post;
end;

procedure Tkafe.xdelClick(Sender: TObject);
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

procedure Tkafe.MenuItem4Click(Sender: TObject);
begin
  //if dms.k_asos.State=dsInactive then dms.k_asos.Open;
  //if dms.k_slave.State=dsInactive then dms.k_slave.Open;
  //exit;
  if (admin_type='2') and (dms.k_asosprint_flag.Value=1) then begin
    ShowMessage('Qatorni o`chirish mumkin emas');
  end;
  if dms.k_slave.RecordCount=0 then exit;
  if MessageDlg(dms.k_slaves_tovar.AsString+' tovarni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    dms.k_slave.edit;dms.k_slavedel_flag.Value:=0;dms.k_slave.Post;dms.k_slave.Refresh;
  end;
end;

procedure Tkafe.DBGridEh5DblClick(Sender: TObject);
begin
  exit;

  //if dms.tpl.AsInteger>1 then begin ShowMessage('O`zgartirishga ruhsat yoq');exit;end;
  if dms.tpl.RecordCount=0 then begin ShowMessage('X-to`lovnomani tanlang');exit;end;


  DMS.k_asos.Edit;


end;

procedure Tkafe.g_asosDblClick(Sender: TObject);
begin
  //prl.ShowModal;
  if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
  try
    if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
      //ShowMessage('sana kiritilmagan');exit;
    end;
  except
  end;
  dms.asos.Edit;
  if h.value>0 then begin
    dms.asosh_id.AsInteger:=h.value;dms.asosqarz_flag.AsVariant:=1;
  end;
  kassa_h_edit.showmodal;
end;

procedure Tkafe.sEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  h.Value:=0;
end;

procedure Tkafe.DBGridEh7DblClick(Sender: TObject);
begin
  //if dms.k_asosqarz_flag.AsInteger>1 then begin ShowMessage('O`zgartirishga ruhsat yoq');exit;end;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
  DMS.qoldiq.open;
  DMS.x_otchet.open;
  //dms.tpl.Close;dms.tpl.SQL.Clear;
  //dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and h_id='+inttostr(filtr_haridor.value)+' order by d_pl desc ');
  //dms.tpl.open;
  DMS.asos.Edit;
  kassa_h_edit.showmodal;
end;

procedure Tkafe.yorliqPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printeryorliq',yorliqPrinters.Text);IniFile.Destroy;
end;

procedure Tkafe.chekPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printerchek',chekPrinters.Text);IniFile.Destroy;
  {n:=ListBox1.ItemIndex;lblPrinter.Caption:=ListBox1.Items[n];
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printer',lblPrinter.Caption);IniFile.Destroy;}
end;

procedure Tkafe.chekshablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablonchek',chekshablon.Text);IniFile.Destroy;
  {n:=file_chek.ItemIndex;lblchek.Caption:=file_chek.Items[n];
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','chek',lblchek.Caption);IniFile.Destroy;}
end;

procedure Tkafe.yorliqshablonChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','shablonyorliq',yorliqshablon.Text);IniFile.Destroy;
end;

procedure Tkafe.TovarlarDblClick(Sender: TObject);
begin
  if dms.asos_slave.RecordCount=0 then exit;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.asos_slavekol_ost.AsString);
  dms.qoldiq.open;
end;

procedure Tkafe.TovarlarCellClick(Column: TColumnEh);
begin
  if dms.asos_slave.RecordCount=0 then exit;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.asos_slavekol_ost.AsString);
  dms.qoldiq.open;
  dms.main_link.locate('tovar_id',DMS.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
end;

procedure Tkafe.gqoldiqDblClick(Sender: TObject);
var k,k_in:integer;
begin
  if dms.asos.RecordCount=0 then begin
    dms.asos.Append;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;Tovarlar.SumList.RecalcAll;
  end;
  if dms.asosdiler_id.AsInteger>0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;//Tovarlar.SumList.RecalcAll;
    end;

    rec:=0;
    DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
    if dms.asos_slave.Locate('kol_ost,tovar_id,seriya',VarArrayOf([dms.qoldiqid.AsInteger,dms.qoldiqtovar_id.AsInteger, dms.qoldiqseriya.AsString]),[loCaseInsensitive]) then
    begin
      k:=0;k_in:=0;
      if dms.qoldiqkol_ost.AsInteger>0 then k:=dms.asos_slavekol.AsInteger else
        if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.asos_slavekol_in.AsInteger;
      minus(k,k_in);
      if dms.qoldiqkol_ost.AsInteger>0 then k:=k+1 else
        if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=k_in+dms.qoldiqkol_in_ost.AsInteger;
      plus(k,k_in);
    end
    else begin
      k:=0;k_in:=0;
      if dms.qoldiqkol_ost.AsInteger>0 then k:=1 else
        if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.qoldiqkol_in_ost.AsInteger;
      yangi;
      plus(k,k_in);
    end;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
    dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;

    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
    dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat+dms.asoscheg_e.AsFloat);
    dms.asos.Post;dms.asos.Refresh;

    DMS.asos_slave.Locate('id',rec,[loCaseInsensitive]);


end;

procedure Tkafe.f6Click(Sender: TObject);
begin
    if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
    try
      if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
        //ShowMessage('sana kiritilmagan');exit;
      end;
    except
    end;
    dms.asos.Edit;
    dms.asosdiler_id.AsInteger:=-1;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;
    dms.asos_slave.First;
    while not dms.asos_slave.eof do begin

      if dms.asos_slavezakaz.AsVariant=null then
      begin
        dms.asos_slave.edit;
        dms.asos_slavezakaz.AsVariant:=now();
        dms.asos_slavezakaz_print.AsVariant:=1;
        dms.asos_slave.post;
      end;
      dms.asos_slave.next;
    end;
    dms.asos_slave.Close;dms.asos_slave.SQL.Clear;
    dms.asos_slave.SQL.add('SELECT * FROM asos_slave,s_tovar where s_tovar.id = asos_slave.tovar_id and asos_slave.del_flag=1 and s_tovar.brend = 62 and asos_id=:id order by id');
    dms.asos_slave.Open;
    if dms.asos_slave.RecordCount>0 then begin
        frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'zakaz58.fr3');
        frxsf.PrintOptions.Printer := baliqPrinters.Text;
        frxsf.SelectPrinter;frxsf.PrepareReport;
        frxsf.PrintOptions.ShowDialog := false;
        frxsf.Print;
    end;
    dms.asos_slave.Close;dms.asos_slave.SQL.Clear;
    dms.asos_slave.SQL.add('SELECT * FROM asos_slave,s_tovar where s_tovar.id = asos_slave.tovar_id and asos_slave.del_flag=1 and s_tovar.brend = 60 and asos_id=:id order by id');
    dms.asos_slave.Open;
    if dms.asos_slave.RecordCount>0 then begin
        frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'zakaz58.fr3');
        frxsf.PrintOptions.Printer := salatPrinters.Text;
        frxsf.SelectPrinter;frxsf.PrepareReport;
        frxsf.PrintOptions.ShowDialog := false;
        //frxsf.ShowReport;
        frxsf.Print;
    end;
  
    dms.asos.Close;dms.asos.SQL.Clear;
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
    dms.asos.open;
    dms.asos_slave.Close;dms.asos_slave.SQL.Clear;
    dms.asos_slave.SQL.add('SELECT * FROM asos_slave where del_flag=1 and asos_id=:id order by id');
    dms.asos_slave.Open;
    Tovarlar.SumList.RecalcAll;
    h.Value:=0;q_sum.Value:=0;
    if dms.asos.RecordCount=0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;Tovarlar.SumList.RecalcAll;
    end;




end;

procedure Tkafe.PechatClick(Sender: TObject);
begin
  //shortdateformat:='dd.mm.yyyy';
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
  DMS.qoldiq.open;
  if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
  try
    if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
      //ShowMessage('sana kiritilmagan');exit;
  end;
    except
  end;
  dms.asos.Edit;
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
  dms.s_client.Refresh;//dms.asos.Refresh;dms.asos_slave.Refresh;


  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+chekshablon.Text);

  if DMS.asosdiler_id.AsInteger=-1 then
    frxsf.Variables['nnn']:=''''+'Noaniq'+''''
  else
    frxsf.Variables['nnn']:=''''+_IntToStr(DMS.asosdiler_id.AsInteger,5)+'''';
  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;
  frxsf.PrepareReport;
  frxsf.PrintOptions.ShowDialog := false;varaq.ActivePageIndex:=0;
  frxsf.Print;
    dms.asos.Close;dms.asos.SQL.Clear;
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
    dms.asos.open;
    if dms.asos.RecordCount=0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;
    end;

end;

procedure Tkafe.EkranClick(Sender: TObject);
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

procedure Tkafe.DBGridEh9DblClick(Sender: TObject);
begin
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
  DMS.qoldiq.open;
  tovarlar.SumList.RecalcAll;
  varaq.ActivePageIndex:=0;
  shtrix.SetFocus;
end;

procedure Tkafe.f11Click(Sender: TObject);
begin
  MenuItem2Click(Sender);
end;

procedure Tkafe.f12Click(Sender: TObject);
var k,k_in,i,old,old_in:integer;s:string;
begin
  if dms.asos_slave.RecordCount=0 then exit;
  if MessageDlg('Diqqat, joriy chekdagi '+IntToStr(dms.asos_slave.RecordCount)+' ta tovarni u`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNO then exit;
  dms.asos_slave.First;
  while not dms.asos_slave.Eof do begin
    k:=0;k_in:=0;
    DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
    if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
    if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
    minus(k,k_in);
    if dms.asos_slavezakaz.AsVariant=null then begin
      dms.asos_slave.edit;
      dms.asos_slavedel_flag.AsInteger:=0;
      dms.asos_slave.post;
    end
    else
    begin
      old:=dms.asos_slavekol.OldValue;old_in:=dms.asos_slavekol_in.OldValue;
      dms.asos_slave.edit;
      dms.asos_slavekol.AsInteger:=0;
      dms.asos_slavekol_in.AsInteger:=0;
      dms.asos_slavesumma.AsInteger:=0;
      dms.asos_slavesumma_in.AsInteger:=0;
      dms.asos_slavesumma_all.AsInteger:=0;
      if (old+old_in)<>(DMS.asos_slavekol.AsInteger+DMS.asos_slavekol_in.AsInteger) then begin
        s:='('+IntToStr(old);
        if (old_in>0) then begin
          s:=s+'.'+IntToStr(old_in);
        end;
        s:=s+')';
        DMS.asos_slavetovar_nom.AsString:=s+DMS.asos_slavetovar_nom.AsString;
        DMS.asos_slavezakaz_print.AsVariant:=2;
      end;
      dms.asos_slave.post;
    end;
    dms.asos_slave.Next;
    for i:=1 to 100 do begin
      if (dms.qoldiqkol_in_ost.AsInteger=i*dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+i;
        dms.qoldiq.post;
      end;
    end;
  end;
  kafe.Tovarlar.SumList.RecalcAll;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asoskol.AsInteger:=0;
    dms.asossumma.AsFloat:=0;
    dms.asossum_naqd.AsFloat:=0;dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
    dms.asossum_naqd_ch.AsFloat:=0;dms.asoscheg_n.AsFloat:=0;
    dms.asossum_plast_ch.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asossum_epos_ch.AsFloat:=0;dms.asoscheg_e.AsFloat:=0;
    dms.asosh_id.AsVariant:=null;
    dms.asos.Post;dms.asos.Refresh;dms.main_link.Refresh;
    dms.asos_slave.refresh;


  if DMS.qoldiq.Active then DMS.qoldiq.Refresh;
end;

procedure Tkafe.cheknitahrirlash1Click(Sender: TObject);
var s:string;IniFile:TIniFile;
begin
  //dms.asos.Edit;dms.asosdiler_id.AsVariant:=null;dms.asos.post;
  //prl.ShowModal;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  s := IniFile.ReadString('BAZA','kafex','2290');
  IniFile.Free;
  if Edit4.Text<>s then exit;
  rec:=DMS.asosid.Value;
  kafe.Tovarlar.SumList.RecalcAll;
  DMS.asos.Locate('id',rec,[loCaseInsensitive]);
  varaq.ActivePageIndex:=0;shtrix.SetFocus;
end;

procedure Tkafe.f9Click(Sender: TObject);
begin
  f9.Visible:=false;cheg_plastik.Visible:=true;cheg_plastik.Value:=0;
  cheg_plastik.SetFocus;
end;

procedure Tkafe.f10Click(Sender: TObject);
begin
  f10.Visible:=false;cheg_naqd.Visible:=true;cheg_naqd.Value:=0;ActiveControl:=cheg_naqd;
end;

procedure Tkafe.cheg_naqdExit(Sender: TObject);
begin
  f10.Visible:=true;cheg_naqd.Visible:=false;
end;

procedure Tkafe.cheg_naqdKeyPress(Sender: TObject; var Key: Char);
var f:Currency;
begin
  if key=#27 then
  begin
    f10.Visible:=true;cheg_naqd.Visible:=false;
    Key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;
  if key=#13 then begin

    f10.Visible:=true;cheg_naqd.Visible:=false;
    if (cheg_naqd.value=null) or (cheg_naqd.value=0) then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);exit;end;
    if dms.asossum_naqd.AsFloat<cheg_naqd.Value then begin cheg_naqd.Value:=0;exit;end;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=cheg_naqd.Value;
    dms.asossum_naqd_ch.AsFloat:=dms.asossum_naqd.AsFloat-dms.asoscheg_n.AsFloat;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat);
    dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100;
    dms.asossumma_ch.AsFloat:=dms.asossumma_ch.AsFloat+dms.asosxizmat.AsFloat;

    dms.asos.Post;
    Key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure Tkafe.Kassadanpulniexhish1Click(Sender: TObject);
var f,p:Currency; i:integer;s:string;ff,pp:integer;
begin
  exit;
  dms.asos.First;f:=0;p:=0;ff:=0;pp:=0;
  for i:=0 to dms.asos.RecordCount-1 do begin
    if ((dms.asossum_naqd_ch.AsFloat>0) or (dms.asossum_plast_ch.AsFloat>0)) and (dms.asospl_id.AsInteger=0) and (dms.asosdiler_id.AsInteger>0) then begin
      f:=f+dms.asossum_naqd_ch.AsFloat-dms.asosqarz_summa.AsFloat;
      p:=p+dms.asossum_plast_ch.AsFloat;
    end;
    dms.asos.Next;
  end;
  if (f+p=0) then begin
    ShowMessage('Summa 0 ga teng');
    exit;
  end;
  if f>0 then begin
    s:= floattostr(f)+' summalik X - naqd pul to`lovnomani kassa orqali';
  end;
  if p>0 then begin
    s:=iif(f=0,'',s+#13+' va ')+ floattostr(p)+' summalik plastik to`lovnomani bank orqali ';
  end;
  if MessageDlg(s+' yaratasizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;


  if f>0 then begin
    dms.tpl.Append;
    dms.link.Close;dms.link.sql.Clear;
    DMS.s_client.Refresh;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
    begin
      dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString);
      dms.tpln_pl.AsInteger:=1;
    end
    else
    begin
      dms.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
      dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;

    //dms.tpl.FieldByName('n_pl').AsInteger:=1;
    dms.tpl.FieldByName('d_pl').AsDateTime:=now();
    dms.tpl.FieldByName('vid').AsInteger:=1;dms.tpl.FieldByName('bank_id').AsInteger:=0;
    dms.tpl.FieldByName('sena_pl').AsFloat:=f;
    dms.tpl.FieldByName('ost_pl').AsFloat:=f;
    dms.tpl.Post;ff:=dms.tpl.FieldByName('id').AsInteger;
  end;
  if p>0 then begin
    dms.tpl.Append;
    dms.link.Close;dms.link.sql.Clear;
    DMS.s_client.Refresh;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
    begin
      dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString);
      dms.tpln_pl.AsInteger:=1;
    end
    else
    begin
      dms.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
      dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;
    //dms.tpl.FieldByName('n_pl').AsInteger:=1;
    dms.tpl.FieldByName('d_pl').AsDateTime:=now();
    dms.tpl.FieldByName('vid').AsInteger:=19;dms.tpl.FieldByName('bank_id').AsInteger:=1;
    dms.tpl.FieldByName('sena_pl').AsFloat:=p;
    dms.tpl.FieldByName('ost_pl').AsFloat:=p;
    dms.tpl.Post;pp:=dms.tpl.FieldByName('id').AsInteger;
  end;
  dms.asos.First;
  for i:=0 to dms.asos.RecordCount do begin
    if ((dms.asossum_naqd_ch.AsFloat>0) or (dms.asossum_plast_ch.AsFloat>0)) and (dms.asospl_id.AsInteger=0)  and (dms.asosdiler_id.AsInteger>0) then begin
      dms.asos.Edit;
      if ff>0 then dms.asospl_id.AsInteger:=ff;
      if pp>0 then dms.asosplastik_id.AsInteger:=pp;
      dms.asos.Post;
    end;
    dms.asos.Next;
  end;
  dms.tpl.Refresh;
  dms.asos.First;
end;

procedure Tkafe.DBGridEh1DblClick(Sender: TObject);
var f:Currency;
begin
end;

procedure Tkafe.newplClick(Sender: TObject);
begin
  if dms.tpl.State=dsBrowse then
  begin
    Gredit.Enabled:=true;
    dms.tpl.Append;
    DMS.s_client.Refresh;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
      dms.tpln_pl.AsInteger:=1
    else
      dms.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
    dms.tpl.FieldByName('d_pl').AsDateTime:=date();
    dms.tpl.FieldByName('vid').AsInteger:=2;
    vidExit(Sender);
    n_pl.SetFocus;
  end
  else
  begin
    if dms.tpl.FieldByName('sena_pl').AsInteger=0 then
    begin
       ShowMessage('Summani kiriting');ActiveControl:=sena_pl;Exit;
    end;
    if (dms.tpl.State=dsInsert) and (dms.tpln_pl.AsInteger=DMS.s_clientlast_pl_k.AsInteger) then begin
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then begin
        dms.tpln_pl.AsInteger:=1;
        dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        dms.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
        dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
    end;
    dms.tpl.Post;
    hisoblaClick(Sender);
  end;
  end;

procedure Tkafe.delplClick(Sender: TObject);
begin
  if dms.tpl.State=dsBrowse then
  begin
    if MessageDlg('Qatorni o`chrasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      dms.tpl.Edit;
      dms.tpl.FieldByName('del_flag').AsInteger:=0;
      dms.tpl.Post;
      dms.tpl.Refresh;
    end;
  end
  else
  begin
    dms.tpl.Cancel;
  end;
end;

procedure Tkafe.hisoblaClick(Sender: TObject);
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
  while (not dms.lbd_pl.Eof) and (dms.tpl.fieldbyname('sena_pl').AsFloat>echish) do begin
    if dms.lbd_pl.FieldByName('ost_pl').Value>0 then begin
      if dms.tpl.FieldByName('sena_pl').AsFloat-echish>=dms.lbd_pl.FieldByName('ost_pl').AsFloat then
        begin
          qoldiq:=dms.lbd_pl.FieldByName('ost_pl').AsFloat;
          qpl:=0;
        end
      else begin
        qoldiq:=dms.tpl.FieldByName('sena_pl').AsFloat-echish;
        qpl:=dms.lbd_pl.FieldByName('ost_pl').AsFloat-qoldiq;
      end;
      dms.oraliqpl.Insert;dms.oraliqpl.FieldByName('asos_id').AsInteger:=dms.tpl.fieldbyname('id').AsInteger;
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

procedure Tkafe.tozaClick(Sender: TObject);
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

procedure Tkafe.vidExit(Sender: TObject);
begin
  //dms.tplAfterScroll(DMS.tpl);
end;

procedure Tkafe.sena_plEnter(Sender: TObject);
var s:string;echish:Currency;
begin


  if dms.tpl.Active=false then exit;
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
  if sena_pl.Value>0 then
  saldo.Value:=tulov.value-sena_pl.Value
  else
  saldo.Value:=tulov.value;
end;

procedure Tkafe.gplExit(Sender: TObject);
begin
  kafe.sena_plEnter(Sender);
end;

procedure Tkafe.newsfmClick(Sender: TObject);
begin
  dms.tpl.Edit;
  dms.tplpot1.Value:=0;
  dms.tplost_pl.Value:=dms.tplsena_pl.Value;
  dms.tpl.Post;
  dms.tpl.Refresh;

end;

procedure Tkafe.DBLookupComboboxEh2EditButtons0Click(Sender: TObject;var Handled: Boolean);
begin
  if filtr_haridor.value=null then exit;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and client_id='+admin_clid+' and user_id='+admin_id+' and h_id='+inttostr(filtr_haridor.value)+' order by id desc');
  dms.asos.open;
  DMS.qoldiq.open;DMS.x_otchet.open;
  dms.tpl.Close;dms.tpl.SQL.Clear;
  dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and h_id='+inttostr(filtr_haridor.value)+' order by d_pl desc ');
  dms.tpl.open;

end;

procedure Tkafe.DBLookupComboboxEh2EditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  filtr_haridor.value:=null;
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and client_id='+admin_clid+' and user_id='+admin_id+' and not (pl_id is not Null or plastik_id is not Null) order by id desc');
  dms.asos.open;
  DMS.qoldiq.open;DMS.x_otchet.open;
  dms.tpl.Close;dms.tpl.SQL.Clear;
  dms.tpl.SQL.Add('select * from pl WHERE del_flag=1 and vid <> 1 order by d_pl desc ');
  dms.tpl.open;

end;

procedure Tkafe.facturaClick(Sender: TObject);
var i:integer;
begin
    if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
    try
      if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
        //ShowMessage('sana kiritilmagan');exit;
      end;
    except
    end;
    dms.asos.Edit;

    dms.asossum_epos.AsFloat:=dms.asossum_naqd.AsFloat;
    dms.asossum_epos_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat;
    dms.asoscheg_e.AsFloat:=dms.asoscheg_n.AsFloat;
    dms.asossum_naqd.AsFloat:=0;dms.asossum_naqd_ch.AsFloat:=0;dms.asoscheg_n.AsFloat:=0;
    if h.value>0 then begin
      dms.asosh_id.AsInteger:=h.value;dms.asosqarz_flag.AsVariant:=1;
    end;
  dms.asos.Edit;
  kassa_h_edit.showmodal;
end;

procedure Tkafe.RzBitBtn4Click(Sender: TObject);
var s:string;
begin
  s:=dms.main_link.SQL.Text;
  s_haridor.showmodal;
  dms.main_link.Close;
  dms.main_link.SQL.Clear;
  dms.main_link.SQL.Add(s);
  dms.main_link.Open;
end;

procedure Tkafe.Memo1DblClick(Sender: TObject);
var k,k_in:integer;s,s_in,kg,gr:string;
begin

    memo1.Lines.add(dms.asos.SQL.Text);
    memo1.Lines.add('asos.id='+dms.asosid.AsString);
    memo1.Lines.add(dms.qoldiq.SQL.Text);
    exit;
    if (s='0') and (s_in='0') then exit;
      if s<>'' then
        if (dms.asos_slavekol.AsInteger+dms.qoldiqkol_ost.AsInteger)<StrToInt(s) then begin ShowMessage('Tovar qoldiqi etishmaydi!!!');exit;end;
      if (s_in<>'') and (dms.qoldiqkol_ost.AsInteger=0) then
      if (dms.asos_slavekol_in.AsInteger+dms.qoldiqkol_in_ost.AsInteger)<StrToInt(s_in) then begin ShowMessage('Tovar qoldiqi etishmaydi!!!');exit;end;
      dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
      dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from asos_slave a WHERE a.del_flag=1 and a.id = '+DMS.asos_slavekol_ost.AsString);
      dms.qoldiq.open;
      if ((dms.qoldiqkol_ost.AsInteger>0) or (dms.asos_slavekol.AsInteger>0)) and (s_in<>'') then
      if (dms.qoldiqkol_in_ost.AsInteger<strtoint(s_in)) then begin  // коробкани очиш
        DMS.s_tovar.Locate('id',dms.qoldiqtovar_id.AsInteger,[loCaseInsensitive]);
        dms.qoldiq.Edit;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger-1;
        //Memo1.Lines.Add(dms.s_tovarnom.AsString+' '+dms.s_tovarid.AsString);
        dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger+dms.s_tovarkol_in.AsInteger;
       dms.qoldiq.Post;
      end;
      if (s_in<>'') then
      begin
        k:=0;k_in:=dms.asos_slavekol_in.AsInteger;minus(k,k_in);
        k_in:=StrToInt(s_in);plus(k,k_in);
        if s='' then shtrix.Text:='';
      end;
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      if s<>'' then
      begin
        k_in:=0;k:=dms.asos_slavekol.AsInteger;
        minus(k,k_in);
        k:=StrToInt(s);if (k+k_in)>0 then plus(k,k_in);
        shtrix.Text:='';
        if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
          dms.qoldiq.Edit;
          dms.qoldiqkol_in_ost.AsInteger:=0;
          dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
          dms.qoldiq.post;
        end
      end; // s
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
        dms.qoldiq.post;
      end;
      rec:=DMS.asos_slaveid.Value;
      kafe.Tovarlar.SumList.RecalcAll;

      dms.asos.Edit;
      dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;dms.asoscheg_e.AsFloat:=0;
      dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
      dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
      dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
      dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
      dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
      dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
      dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat);
      dms.asos.Post;dms.asos.Refresh;
      DMS.asos_slave.Locate('id',rec,[loCaseInsensitive]);
      exit;

    dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
    kg:='';gr:='';
    s:=StrReplace(shtrix.Text,'http://verum.uz/qr.php?text=','');// http://verum.uz/qr.php?text=hd2lq1d
    dms.qoldiq.SQL.Add('select a.*,a.opt1 as sot,a.opt1_in as sot_in   from s_tovar t,asos_slave a,asos  WHERE a.del_flag=1 and (asos.tur_oper=1 or asos.tur_oper=4 or asos.tur_oper=5) and a.asos_id=asos.id and a.tovar_id=t.id and a.user_id = '+DMS.s_clientid.AsString+' and ' );
    if ((StrToInt(copy(shtrix.Text,1,2))>19)) and ((StrToInt(copy(shtrix.Text,1,2))<30)) then
    begin
      dms.qoldiq.SQL.Add(' (a.kol_ost>0 or a.kol_in_ost>0) and t.shtrix_in ="'+copy(shtrix.Text,3,5)+'" order by t.nom,a.srok');
      //kg:=inttostr(strtoint(copy(shtrix.Text,8,5) ));if kg='0' then kg:='';
      kg:=copy(shtrix.Text,8,2);gr:=copy(shtrix.Text,10,3);
      if copy(shtrix.Text,8,5)='00000' then
      begin
        kg:='01';gr:='000';
      end;
    end
    else
      dms.qoldiq.SQL.Add(' (a.kol_ost>0 or a.kol_in_ost>0) and (t.shtrix ="'+shtrix.Text+'" or t.shtrix1 ="'+shtrix.Text+'" or t.shtrix2 ="'+shtrix.Text+'") order by t.nom,a.srok');
    dms.qoldiq.open;DMS.s_tovar.Locate('id',dms.qoldiqtovar_id.AsInteger,[loCaseInsensitive]);
    if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
      dms.qoldiq.Edit;
      dms.qoldiqkol_in_ost.AsInteger:=0;
      dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
      dms.qoldiq.post;
    end;
    if dms.qoldiq.RecordCount=0 then begin
      shtrix.Text:='';
      exit;
    end;
    if ((dms.qoldiq.fieldbyname('srok').AsVariant-dms.setupvaqt.AsVariant)<90) and (dms.qoldiq.RecordCount>1) then
    begin shtrix.Text:='';if kg<>'' then shtrix.Text:=kg;exit;end;
    if dms.qoldiq.RecordCount>1 then begin
      case tanlash.ItemIndex of
        0:begin shtrix.Text:='';if kg<>'' then shtrix.Text:=kg;exit;end;
        1:begin dms.qoldiq.First;shtrix.Text:='';if kg<>'' then shtrix.Text:=kg;exit;end;
        2:begin dms.qoldiq.Last;shtrix.Text:='';if kg<>'' then shtrix.Text:=kg;exit;end;
      end;
    end;
    if dms.asos.RecordCount=0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;//Tovarlar.SumList.RecalcAll;
    end;
    if dms.asosdiler_id.AsInteger>0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post; //Tovarlar.SumList.RecalcAll;
    end;
    if dms.qoldiqseriya.AsString<>'' then
    begin
      if (dms.asos_slave.Locate('tovar_id',dms.qoldiqtovar_id.AsInteger,[loCaseInsensitive])) and (dms.asos_slave.Locate('seriya',dms.qoldiqseriya.AsString,[loCaseInsensitive])) then
      begin
        k:=0;k_in:=0;
        if (kg='') and (gr='') then
        begin
          if dms.qoldiqkol_ost.AsInteger>0 then k:=dms.asos_slavekol.AsInteger else
            if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.asos_slavekol_in.AsInteger;
          minus(k,k_in);
          if dms.qoldiqkol_ost.AsInteger>0 then k:=k+1 else
            if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=k_in+dms.qoldiqkol_in_ost.AsInteger;
          plus(k,k_in);
        end
        else
        begin
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger<strtoint(kg)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          k:=dms.asos_slavekol.AsInteger;k_in:=dms.asos_slavekol_in.AsInteger;
          minus(k,k_in);
          if (gr<>'') then if (dms.qoldiqkol_in_ost.AsInteger<k_in+strtoint(gr)) then
          begin
              dms.qoldiq.Edit;
              dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger-1;
              dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger+dms.s_tovarkol_in.AsInteger;
              dms.qoldiq.Post;
          end;
          if kg<>'' then k:=k+strtoint(kg);if gr<>'' then k_in:=k_in+strtoint(gr);
          plus(k,k_in);
        end //(kg='') and (gr='')
      end
      else
      begin
        k:=0;k_in:=0;
        if (kg='') and (gr='') then begin
          if dms.qoldiqkol_ost.AsInteger>0 then k:=1 else
          if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.qoldiqkol_in_ost.AsInteger;
          yangi;plus(k,k_in);
        end
        else
        begin
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger<strtoint(kg)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          yangi;plus(1,0);minus(1,0);
          if ((dms.qoldiqkol_ost.AsInteger>0) or (dms.asos_slavekol.AsInteger>0)) and (gr<>'') then
          if (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin
            dms.qoldiq.Edit;
            dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger-1;
            memo1.Lines.Add(dms.s_tovarid.AsString+''+dms.s_tovarnom.AsString);
            dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger+dms.s_tovarkol_in.AsInteger;
            dms.qoldiq.Post;
          end;
          if (kg<>'') then k:=dms.asos_slavekol.AsInteger+strtoint(kg);
          if (gr<>'') then k_in:=dms.asos_slavekol_in.AsInteger+StrToInt(gr);
          plus(k,k_in);
        end; //kg='') and (gr=''
      end; // locate

    end
    else
    begin
      if (dms.asos_slave.Locate('tovar_id',dms.qoldiqtovar_id.AsInteger,[loCaseInsensitive])) then
      begin
        k:=0;k_in:=0;
        if (kg='') and (gr='') then
        begin
          if dms.qoldiqkol_ost.AsInteger>0 then k:=dms.asos_slavekol.AsInteger else
            if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.asos_slavekol_in.AsInteger;
          minus(k,k_in);
          if dms.qoldiqkol_ost.AsInteger>0 then k:=k+1 else
            if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=k_in+dms.qoldiqkol_in_ost.AsInteger;
          plus(k,k_in);
        end
        else
        begin
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger<strtoint(kg)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          k:=dms.asos_slavekol.AsInteger;k_in:=dms.asos_slavekol_in.AsInteger;
          minus(k,k_in);
          if (gr<>'') then if (dms.qoldiqkol_in_ost.AsInteger<k_in+strtoint(gr)) then
          begin
              dms.qoldiq.Edit;
              dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger-1;
              dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger+dms.s_tovarkol_in.AsInteger;
              dms.qoldiq.Post;
          end;
          if kg<>'' then k:=k+strtoint(kg);if gr<>'' then k_in:=k_in+strtoint(gr);
          plus(k,k_in);
        end //(kg='') and (gr='')
      end
      else
      begin
        k:=0;k_in:=0;
        if (kg='') and (gr='') then begin
          if dms.qoldiqkol_ost.AsInteger>0 then k:=1 else
          if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.qoldiqkol_in_ost.AsInteger;
          yangi;plus(k,k_in);
        end
        else
        begin
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger=strtoint(kg)) and  (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          if (dms.qoldiqkol_ost.AsInteger<strtoint(kg)) then
          begin ShowMessage('Tovar qoldiqi etishmaydi!!!');shtrix.Text:='';exit;end;
          yangi;plus(1,0);minus(1,0);
          if ((dms.qoldiqkol_ost.AsInteger>0) or (dms.asos_slavekol.AsInteger>0)) and (gr<>'') then
          if (dms.qoldiqkol_in_ost.AsInteger<strtoint(gr)) then
          begin
            dms.qoldiq.Edit;
            dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger-1;
            memo1.Lines.Add(dms.s_tovarid.AsString+''+dms.s_tovarnom.AsString);
            dms.qoldiqkol_in_ost.AsInteger:=dms.qoldiqkol_in_ost.AsInteger+dms.s_tovarkol_in.AsInteger;
            dms.qoldiq.Post;
          end;
          if (kg<>'') then k:=dms.asos_slavekol.AsInteger+strtoint(kg);
          if (gr<>'') then k_in:=dms.asos_slavekol_in.AsInteger+StrToInt(gr);
          plus(k,k_in);
        end; //kg='') and (gr=''
      end; // locate
    end;  // seriya
    if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then
    begin
      dms.qoldiq.Edit;
      dms.qoldiqkol_in_ost.AsInteger:=0;
      dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
      dms.qoldiq.post;
    end;
    if (dms.asos_slavekol_in.AsInteger>=dms.s_tovarkol_in.AsInteger) and (dms.asos_slavekol_in.AsInteger>0) then
    begin
      dms.asos_slave.Edit;
      dms.asos_slavekol_in.AsInteger:=dms.asos_slavekol_in.AsInteger-dms.s_tovarkol_in.AsInteger;
      dms.asos_slavekol.AsInteger:=dms.asos_slavekol.AsInteger+1;
      dms.asos_slave.post;
    end;
    shtrix.Text:='';
    rec:=DMS.asos_slaveid.Value;
    kafe.Tovarlar.SumList.RecalcAll;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;dms.asoscheg_e.AsFloat:=0;
    dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
    dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
    dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat);
    dms.asos.Post;dms.asos.Refresh;
    DMS.asos_slave.Locate('id',rec,[loCaseInsensitive]);

end;

procedure Tkafe.mobil01Click(Sender: TObject);
begin
  exit;
  dms.k_asos.Edit;
  dms.k_asosmobil.Value:=0;
  dms.k_asos.post;
  dms.k_asos.Refresh;
end;

procedure Tkafe.Chekniochirish2Click(Sender: TObject);
var k,k_in:integer;
begin
  Memo1.Lines.Add(dms.asos.sql.Text);
  if dms.k_asos.RecordCount=0 then exit;

  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  DMS.asos.open;
  k:=0;k_in:=0;
  if MessageDlg(dms.asosdiler_id.AsString+' -  sonli chekni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    kafe.Caption:=inttostr(dms.asosid.AsInteger);
    dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
      if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
      minus(k,k_in);
      dms.asos_slave.edit;
      dms.asos_slavedel_flag.AsInteger:=0;
      dms.asos_slave.post;
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
        dms.qoldiq.post;
      end;
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger*2) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+2;
        dms.qoldiq.post;
      end;
      dms.asos_slave.Next;
    end;
    dms.asos.edit;
    dms.asosdel_flag.AsInteger:=0;
    dms.asos.post;
    dms.k_asos.Refresh;
    dms.asos_slave.refresh; dms.main_link.Refresh;
    if DMS.qoldiq.Active then DMS.qoldiq.Refresh;
  end;
end;

procedure Tkafe.Chekniochirish1Click(Sender: TObject);
var k,k_in:integer;
begin
  if dms.asos.RecordCount=0 then exit;
  k:=0;k_in:=0;
  if MessageDlg(dms.asosdiler_id.AsString+' -  sonli chekni o`chirasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    kafe.Caption:=inttostr(dms.asosid.AsInteger);

    dms.asos_slave.First;
    while not dms.asos_slave.Eof do begin
      DMS.s_tovar.Locate('id',dms.asos_slavetovar_id.AsInteger,[loCaseInsensitive]);
      if dms.asos_slavekol.AsInteger>0 then k:=dms.asos_slavekol.AsInteger;
      if dms.asos_slavekol_in.AsInteger>0 then k_in:=dms.asos_slavekol_in.AsInteger;
      minus(k,k_in);
      dms.asos_slave.edit;
      dms.asos_slavedel_flag.AsInteger:=0;
      dms.asos_slave.post;
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+1;
        dms.qoldiq.post;
      end;
      if (dms.qoldiqkol_in_ost.AsInteger=dms.s_tovarkol_in.AsInteger*2) and (dms.qoldiqkol_in_ost.AsInteger>0) then begin
        dms.qoldiq.Edit;
        dms.qoldiqkol_in_ost.AsInteger:=0;
        dms.qoldiqkol_ost.AsInteger:=dms.qoldiqkol_ost.AsInteger+2;
        dms.qoldiq.post;
      end;
      dms.asos_slave.Next;
    end;
    kafe.Caption:=kafe.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.edit;
    dms.asosdel_flag.AsInteger:=0;
    dms.asos.post;
    kafe.Caption:=kafe.Caption+'  '+inttostr(dms.asosid.AsInteger);
    dms.asos.Refresh;

    dms.asos_slave.refresh;dms.main_link.Refresh;
    if DMS.qoldiq.Active then DMS.qoldiq.Refresh;
  end;
end;

procedure Tkafe.tovarDblClick(Sender: TObject);
var k,k_in:integer;
begin
  rec_ml:=dms.main_link.fieldbyname('id').AsInteger;
  if dms.asos.RecordCount=0 then begin
    dms.asos.Append;
    dms.asostur_oper.AsInteger:=2;
    dms.asos.Post;Tovarlar.SumList.RecalcAll;
  end;
  dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
  dms.qoldiq.SQL.Add('select *,sotish as sot,sotish_in as sot_in from asos_slave WHERE del_flag=1 and id = '+dms.main_link.fieldbyname('id').AsString);
  dms.qoldiq.open;

    DMS.s_tovar.Locate('id',dms.main_link.fieldbyname('tovar_id').AsInteger,[loCaseInsensitive]);
    if dms.asos_slave.Locate('kol_ost,tovar_id,seriya',VarArrayOf([dms.qoldiqid.AsInteger,dms.qoldiqtovar_id.AsInteger, dms.qoldiqseriya.AsString]),[loCaseInsensitive]) then
    begin
      k:=0;k_in:=0;
      if dms.qoldiqkol_ost.AsInteger>0 then k:=dms.asos_slavekol.AsInteger else
        if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.asos_slavekol_in.AsInteger;
      minus(k,k_in);
      if dms.qoldiqkol_ost.AsInteger>0 then k:=k+1 else
        if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=k_in+dms.qoldiqkol_in_ost.AsInteger;
      plus(k,k_in);
    end
    else begin
      k:=0;k_in:=0;
      if dms.qoldiqkol_ost.AsInteger>0 then k:=1 else
        if (dms.qoldiqkol_in_ost.AsInteger>0) then k_in:=dms.qoldiqkol_in_ost.AsInteger;
      yangi;
      plus(k,k_in);
    end;
    DMS.asos_slave.Edit;
    DMS.asos_slavezakaz_print.AsVariant:=2;
    DMS.asos_slave.post;
    Tovarlar.SumList.RecalcAll;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
    dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
    dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsInteger/100;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat;

    dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
    dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat+dms.asossum_plastik.AsFloat;
    dms.asos.Post;dms.asos.Refresh;
    dms.main_link.Refresh;Tovarlar.SumList.RecalcAll;
    DMS.asos_slave.Locate('kol_ost',rec_ml,[loCaseInsensitive]);
    DMS.main_link.Locate('id',rec_ml,[loCaseInsensitive]);
end;

procedure Tkafe.xizmat_foizChange(Sender: TObject);
begin
    if rec_asos_t=0 then exit;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
    dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;
    dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*xizmat_foiz.Value/100;
    dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
    dms.asossum_naqd.AsVariant:=dms.asossum_naqd.AsVariant+dms.asosxizmat.AsVariant;

    dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat+dms.asossum_plastik.AsFloat;
    dms.asos.Post;
    dms.asos.Refresh;
    Tovarlar.SetFocus;
end;

procedure Tkafe.xizmat_foizExit(Sender: TObject);
begin
  rec_asos_t:=0;
end;

procedure Tkafe.xizmat_foizEnter(Sender: TObject);
begin
 rec_asos_t:=1;
end;

procedure Tkafe.taomlarClick(Sender: TObject);
begin
  DMS.main_link.Locate('kat',7,[loCaseInsensitive]);tovar.SetFocus;
end;

procedure Tkafe.SalatlarClick(Sender: TObject);
begin
  DMS.main_link.Locate('kat',11,[loCaseInsensitive]);tovar.SetFocus;
end;

procedure Tkafe.ShirinliklarClick(Sender: TObject);
begin
  DMS.main_link.Locate('kat',9,[loCaseInsensitive]);tovar.SetFocus;
end;

procedure Tkafe.IchimliklarClick(Sender: TObject);
begin
  DMS.main_link.Locate('kat',8,[loCaseInsensitive]);tovar.SetFocus;
end;

procedure Tkafe.OfisantChange(Sender: TObject);
begin
  if rec_asos_t=1 then begin
    dms.asos.Post;
    Tovarlar.SetFocus;
  end;
end;

procedure Tkafe.kabinalarChange(Sender: TObject);
begin
  if rec_asos_t=1 then
  begin
    dms.asos.Post;
    Tovarlar.SetFocus;
  end;
end;

procedure Tkafe.hChange(Sender: TObject);
begin
  exit;
  dms.asos.Edit;
  dms.asosh_id.AsVariant:=h.Value;
  dms.asos.post;
  q_sum.SetFocus;
end;

procedure Tkafe.hEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  h.Value:=null;
  dms.asos.Edit;
  dms.asosh_id.AsVariant:=null;
  dms.asos.post;
  q_sum.Value:=0;
end;

procedure Tkafe.gr_mobilDblClick(Sender: TObject);
var n:Currency;
begin
  dms.k_slave.First;n:=0;
  while not dms.k_slave.Eof do begin
    n:=n+dms.k_slavesumma_all.AsFloat;
    dms.k_slave.Next;
  end;
  dms.k_asos.Edit;
  //dms.k_asosxodim_id.Value:=StrToInt(admin_id);
  dms.k_asossumma.Value:=n;
  //if (dms.k_asossum_naqd.AsFloat=0) and (dms.k_asossum_plastik.AsFloat=0) and (dms.k_asossum_epos.AsFloat=0) and (dms.k_asossumma.AsFloat>0) then begin

    dms.k_asossum_naqd.AsFloat:=dms.k_asossumma.AsFloat;
    dms.k_asossum_naqd_ch.AsFloat:=RoundLess(dms.k_asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.k_asossumma_ch.AsFloat:=dms.k_asossumma.AsFloat;
    dms.k_asoscheg_n.AsFloat:=RoundTo((dms.k_asossum_naqd.AsFloat-dms.k_asossum_naqd_ch.AsFloat),-2);
    dms.k_asossumma_ch.AsFloat:=dms.k_asossumma.AsFloat-dms.k_asoscheg_n.AsFloat;
  //end;


  dms.k_asos.post;

  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where id='+dms.k_asosid.AsString);
  dms.asos.open;
    tovarlar.SumList.RecalcAll;
    dms.asos.Edit;

    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
    dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
    dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsInteger/100;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat;

    dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
    dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat+dms.asossum_plastik.AsFloat;
    dms.asos.Post;dms.asos.Refresh;
  DMS.qoldiq.open;
  tovarlar.SumList.RecalcAll;
  varaq.ActivePageIndex:=0;
  shtrix.SetFocus;
end;

procedure Tkafe.salatPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printersalat',salatPrinters.Text);IniFile.Destroy;
end;

procedure Tkafe.baliqPrintersChange(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','printerbaliq',baliqPrinters.Text);IniFile.Destroy;
end;

procedure Tkafe.s1_1Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',47,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s1_2Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',48,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_3Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',49,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_4Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',50,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_5Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',51,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);
end;

procedure Tkafe.s1_6Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',52,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s1_7Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',53,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_8Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',54,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_9Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',55,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_10Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',56,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_11Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',57,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_12Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',58,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_13Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',59,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_14Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',60,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_15Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',61,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_16Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',62,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_17Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',63,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_18Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',64,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_19Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',65,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_20Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',66,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_21Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',67,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_22Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',68,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_30Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',76,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_25Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',71,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_23Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',69,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_24Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',70,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_26Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',72,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_27Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',73,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_28Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',74,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_29Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',75,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_31Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',77,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_32Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',78,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_33Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',79,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_34Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',80,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_35Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',81,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_36Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',82,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_37Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',83,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_38Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',84,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_39Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',85,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_40Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',86,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_41Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',87,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_42Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',88,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_43Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',89,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_44Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',90,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s1_45Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',91,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.n_plKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;
end;

procedure Tkafe.pul_plastikExit(Sender: TObject);
begin
  f7.Visible:=true;pul_plastik.Visible:=false;

end;

procedure Tkafe.pul_plastikKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  begin
    f7.Visible:=true;pul_plastik.Visible:=false;
    Key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;
  if key=#13 then
  begin
    f8.Visible:=true;pul_plastik.Visible:=false;
    if (pul_plastik.value=null) or (pul_plastik.value=0) then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);exit;end;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat;
    dms.asossum_plastik.AsFloat:=pul_plastik.value;dms.asossum_plast_ch.AsFloat:=pul_plastik.value;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat-pul_plastik.value;
    dms.asossum_naqd_ch.AsFloat:=dms.asossum_naqd.AsFloat;
    dms.asos.post;
    Key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure Tkafe.pul_naqdExit(Sender: TObject);
begin
  f8.Visible:=true;pul_naqd.Visible:=false;
end;

procedure Tkafe.pul_naqdKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  begin
    f8.Visible:=true;pul_naqd.Visible:=false;
    Key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;
  if key=#13 then
  begin
    f8.Visible:=true;pul_naqd.Visible:=false;
    if (pul_naqd.value=null) or (pul_naqd.value=0) then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);exit;end;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat;
    dms.asossum_naqd.AsFloat:=pul_naqd.value;dms.asossum_naqd_ch.AsFloat:=pul_naqd.value;
    dms.asossum_plastik.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat-pul_naqd.value;
    dms.asossum_plast_ch.AsFloat:=dms.asossum_plastik.AsFloat;
    dms.asos.post;
    Key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure Tkafe.s3_1Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',92,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s3_2Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',93,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_3Click(Sender: TObject);
begin
       if DMS.k_asos.Locate('mobil',94,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_4Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',95,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_5Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',96,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_6Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',97,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_7Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',98,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_8Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',99,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_9Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',100,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_10Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',101,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_11Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',102,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_12Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',103,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_13Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',104,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_14Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',105,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_15Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',106,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_16Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',107,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_17Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',108,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_18Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',109,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_19Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',110,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_20Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',111,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_21Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',112,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_22Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',113,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_23Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',114,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_24Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',115,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_25Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',116,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_26Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',117,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_27Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',118,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_28Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',119,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_29Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',120,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_30Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',121,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_31Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',122,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_32Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',123,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_33Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',124,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_34Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',125,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_35Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',126,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_36Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',127,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_37Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',128,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_38Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',129,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_39Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',130,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_40Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',131,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_41Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',133,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_42Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',134,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_43Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',135,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_44Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',136,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s3_45Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',137,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_1Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',46,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_2Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',2,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_3Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',3,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_4Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',4,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_5Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',5,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_6Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',6,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_7Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',7,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_8Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',8,[loCaseInsensitive]) then gr_mobilDblClick(Sender);
end;

procedure Tkafe.s2_9Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',9,[loCaseInsensitive]) then gr_mobilDblClick(Sender);

end;

procedure Tkafe.s2_10Click(Sender: TObject);
begin
  if DMS.k_asos.Locate('mobil',10,[loCaseInsensitive]) then
  gr_mobilDblClick(Sender);
end;

procedure Tkafe.cheg_plastikExit(Sender: TObject);
begin
  f9.Visible:=true;cheg_plastik.Visible:=false;
end;

procedure Tkafe.cheg_plastikKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  begin
    f9.Visible:=true;cheg_plastik.Visible:=false;
    Key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;
  if key=#13 then
  begin
    f10.Visible:=true;pul_plastik.Visible:=false;
    if (cheg_plastik.value=null) or (cheg_plastik.value=0) then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);exit;end;

    if dms.asossum_plastik.AsFloat<cheg_plastik.value then begin cheg_plastik.value:=0;exit;end;
    dms.asos.Edit;
    dms.asoscheg_p.AsFloat:=cheg_plastik.value;
    dms.asossum_plast_ch.AsFloat:=dms.asossum_plastik.AsFloat-dms.asoscheg_p.AsFloat;
    dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat);
    dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsFloat/100;
    dms.asossumma_ch.AsFloat:=dms.asossumma_ch.AsFloat+dms.asosxizmat.AsFloat;
    dms.asos.Post;
    Key:=#0;Perform(WM_NEXTDLGCTL,0,0);
  end;


end;

procedure Tkafe.p_xisoblaClick(Sender: TObject);
var danq,kirim,chiqim:Currency;
begin
    // Дастлабки санадан кичик булган харидорнинг карзи,  (tur_oper=2 - сотиш) ("summa" - накд карзи, "epos" - перечисление)
  if dms.s_haridor.RecordCount=0 then exit;
  if dms.s_haridor.State in [dsedit,dsinsert] then exit;
  //memo1.Lines.Clear;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select sum(if(sana < '+kasaya(now)+',qarz_summa,0)) as b_summa,sum(if(sana < '+kasaya(now)+',sum_epos_ch,0)) as b_epos');
  dms.link.SQL.Add(',sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',qarz_summa,0)) as o_summa,sum(if(sana between '+kasaya(now)+' and '+kasaya(now)+',sum_epos_ch,0)) as o_epos');
  dms.link.SQL.Add('  from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString+' order by id');
  dms.link.open;
  danq:=dms.link.fieldbyname('b_summa').AsFloat+dms.link.fieldbyname('b_epos').AsFloat;
  chiqim:=dms.link.fieldbyname('o_summa').AsFloat+dms.link.fieldbyname('o_epos').AsFloat;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('SELECT sum(if(vid in (7,17,20) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_kirim,sum(if(vid in (8,18) and d_pl < '+kasaya(now)+',sena_pl,0)) as b_chiqim');
  dms.link.SQL.Add(',sum(if(vid in (7,17,20) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_kirim,sum(if(vid in (8,18) and d_pl between '+kasaya(now)+' and '+kasaya(now)+',sena_pl,0)) as o_chiqim');
  dms.link.SQL.Add(' from pl WHERE del_flag=1 and h_id='+dms.s_haridorid.AsString);
  dms.link.SQL.Add(' order by id');
  dms.link.open;
  danq:=danq+dms.link.fieldbyname('b_chiqim').AsFloat-dms.link.fieldbyname('b_kirim').AsFloat;
  kirim:=dms.link.fieldbyname('o_kirim').AsFloat;
  chiqim:=chiqim+dms.link.fieldbyname('o_chiqim').AsFloat;
  gachaq.Value:=danq+(chiqim-kirim);
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select count("id") as b_soni from asos where del_flag=1 and tur_oper=2 and h_id='+dms.s_haridorid.AsString);
  dms.link.open;
  b_soni.Value:=dms.link.fieldbyname('b_soni').AsInteger;


end;

procedure Tkafe.DBGrid1CellClick(Column: TColumn);
begin
  //DMS.main_link.First;
  //DMS.main_link.refresh;
  //DMS.main_link.Locate('kat',dms.s_katid.AsInteger,[loCaseInsensitive]);tovar.SetFocus;
  //+ #39 + '%'
  DMS.main_link.Filter:='kat='+dms.s_katid.AsString;
  DMS.main_link.Filtered:=true;
  Tovar.SetFocus;
end;

procedure Tkafe.gqoldiqCellClick(Column: TColumnEh);
begin
  Memo1.Lines.Add(dms.asos.SQL.Text);
end;

procedure Tkafe.Label4DblClick(Sender: TObject);
begin
  if DBGridEh40.Visible=true then
  DBGridEh40.Visible:=false else
  DBGridEh40.Visible:=true;
end;

procedure Tkafe.DBGridEh13DblClick(Sender: TObject);
var f,p,xizmat:Currency; i:integer;s:string;ff,pp:integer;
begin
  if not dms.tzet.Locate('active',1,[loCaseInsensitive]) then begin
    ShowMessage('Kun aktivlashmagan');exit;
  end;
  if DMS.x_otchet.RecordCount=0 then exit;
  dms.asos.First;f:=0;p:=0;ff:=0;pp:=0;xizmat:=0;
  for i:=0 to dms.asos.RecordCount-1 do begin
    if (DMS.x_otchetsana.AsDateTime=dms.asossana.AsDateTime) and ((dms.asossum_naqd_ch.AsFloat>0) or (dms.asossum_plast_ch.AsFloat>0)) and (dms.asospl_id.AsInteger=0) and (dms.asosdiler_id.AsInteger>0) then begin
      f:=f+dms.asossum_naqd_ch.AsFloat-dms.asosqarz_summa.AsFloat;
      xizmat:=xizmat+dms.asosxizmat.AsFloat;
      p:=p+dms.asossum_plast_ch.AsFloat;
    end;
    dms.asos.Next;
  end;
  if (f+p=0) then begin
    ShowMessage('Summa 0 ga teng');
    exit;
  end;
  if f>0 then begin
    s:= floattostr(f)+' summalik X - naqd pul to`lovnomani kassa orqali';
  end;
  if p>0 then begin
    s:=iif(f=0,'',s+#13+' va ')+ floattostr(p)+' summalik plastik to`lovnomani bank orqali ';
  end;
  if MessageDlg(s+' yaratasizmi ?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;


  if f>0 then begin
    dms.tpl.Append;
    dms.link.Close;dms.link.sql.Clear;
    DMS.s_client.Refresh;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
    begin
      dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString);
      dms.tpln_pl.AsInteger:=1;
    end
    else
    begin
      dms.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
      dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;
    dms.tpl.FieldByName('d_pl').AsDateTime:=DMS.x_otchet.FieldByName('sana').AsDateTime;
    dms.tpl.FieldByName('vid').AsInteger:=1;dms.tpl.FieldByName('bank_id').AsInteger:=0;
    dms.tpl.FieldByName('sena_pl').AsFloat:=f;
    dms.tpl.FieldByName('ost_pl').AsFloat:=f;
    dms.tpl.FieldByName('sena_d').AsFloat:=xizmat;
    //dms.tpl.FieldByName('ost_d').AsFloat:=jam;
    dms.tpl.FieldByName('zet_id').Asinteger:=dms.tzet.FieldByName('id').AsInteger;
    dms.tpl.Post;ff:=dms.tpl.FieldByName('id').AsInteger;
  end;
  if p>0 then begin
    dms.tpl.Append;
    dms.link.Close;dms.link.sql.Clear;
    DMS.s_client.Refresh;
    if (DMS.s_clientlast_pl_k.AsInteger=0) or (DMS.s_clientlast_pl_k.AsVariant=null) then
    begin
      dms.link.sql.Add('update s_client set last_pl_k=1 where id='+dms.s_clientid.AsString);
      dms.tpln_pl.AsInteger:=1;
    end
    else
    begin
      dms.tpln_pl.AsInteger:=DMS.s_clientlast_pl_k.AsInteger;
      dms.link.sql.Add('update s_client set last_pl_k=last_pl_k+1 where id='+dms.s_clientid.AsString);
    end;
    dms.link.ExecSQL;
    //dms.tpl.FieldByName('n_pl').AsInteger:=1;
    dms.tpl.FieldByName('d_pl').AsDateTime:=DMS.x_otchet.FieldByName('sana').AsDateTime;
    dms.tpl.FieldByName('vid').AsInteger:=19;dms.tpl.FieldByName('bank_id').AsInteger:=1;
    dms.tpl.FieldByName('sena_pl').AsFloat:=p;
    dms.tpl.FieldByName('zet_id').Asinteger:=dms.tzet.FieldByName('id').AsInteger;
    dms.tpl.FieldByName('sena_d').AsFloat:=xizmat;
    //dms.tpl.FieldByName('ost_d').AsFloat:=jam;
    dms.tpl.FieldByName('ost_pl').AsFloat:=p;
    dms.tpl.Post;pp:=dms.tpl.FieldByName('id').AsInteger;
  end;
  dms.asos.First;
  for i:=0 to dms.asos.RecordCount do begin
    if (DMS.x_otchetsana.AsDateTime=dms.asossana.AsDateTime) and ((dms.asossum_naqd_ch.AsFloat>0) or (dms.asossum_plast_ch.AsFloat>0)) and (dms.asospl_id.AsInteger=0)  and (dms.asosdiler_id.AsInteger>0) then begin
      dms.asos.Edit;
      if ff>0 then dms.asospl_id.AsInteger:=ff;
      if pp>0 then dms.asosplastik_id.AsInteger:=pp;
      dms.asos.FieldByName('zet_id').Asinteger:=dms.tzet.FieldByName('id').AsInteger;
      dms.asos.Post;
    end;
    dms.asos.Next;
  end;
  dms.asos.Refresh;
  DMS.x_otchet.Refresh;
  dms.asos.First;
end;

procedure Tkafe.xisobotClick(Sender: TObject);
begin
  ztovar.Open;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'z_otchet80_kafe.fr3');
  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.ShowDialog := false;
  frxsf.ShowReport;
end;

procedure Tkafe.RzBitBtn1Click(Sender: TObject);
begin
  if dms.tzet.Locate('active',1,[loCaseInsensitive]) then begin
    ShowMessage('Oldingi kunni yoping');exit;
  end;
  if MessageDlg(' Joriy kunni ochasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  dms.tzet.Append;
  dms.tzet.FieldByName('day1').AsDateTime:=Now();
  dms.tzet.FieldByName('active').AsInteger:=1;
  dms.tzet.FieldByName('user_id').AsInteger:=StrToInt(admin_id);
  dms.tzet.FieldByName('kassir_id').AsInteger:=StrToInt(admin_id);
  dms.tzet.Post;
end;

procedure Tkafe.YopishClick(Sender: TObject);
begin
  if MessageDlg(' Joriy kunni yopasizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  dms.tzet.Edit;
  dms.tzet.FieldByName('summa').AsFloat:=0;
  dms.tzet.Post;
  dms.tpl.First;
  while not dms.tpl.eof do begin
    dms.tzet.Edit;
    dms.tzet.FieldByName('summa').AsFloat:=dms.tzet.FieldByName('summa').AsFloat+dms.tplsena_pl.AsFloat;
    dms.tzet.FieldByName('xizmat').AsFloat:=dms.tzet.FieldByName('xizmat').AsFloat+dms.tplsena_d.AsFloat;
    dms.tzet.Post;
    dms.tpl.next;
  end;
  dms.tzet.Edit;
  dms.tzet.FieldByName('day2').AsDateTime:=Now();
  dms.tzet.FieldByName('active').AsInteger:=2;
  dms.tzet.Post;
end;

procedure Tkafe.RzBitBtn2Click(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add(' update asos_slave set zakaz='+kasayatime(now)+' ,zakaz_print=null where del_flag=1 and zakaz_print=2 and asos_id='+dms.asosid.AsString);
  dms.link.ExecSQL;
end;

procedure Tkafe.f3Click(Sender: TObject);
var kol:integer;f:Currency;
begin
  if (dms.asossum_naqd.AsFloat=0) and (dms.asossum_plastik.AsFloat=0) and (dms.asossum_epos.AsFloat=0) and (dms.asossumma.AsFloat>0) then begin
   dms.asos.edit;
   dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;
   dms.asossum_naqd_ch.AsFloat:=dms.asossumma.AsFloat;
   dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat;
   dms.asos.post;
  end;
  if dms.asossumma.AsFloat < dms.asosqarz_summa.AsFloat then begin
    ShowMessage('Qarz summa noto`g`ri');exit;
  end;
  if (dms.asossum_naqd_ch.AsFloat+dms.asoscheg_n.AsFloat) <> dms.asossum_naqd.AsFloat then begin
    ShowMessage('Naqd summa noto`g`ri');exit;
  end;
  if (dms.asossum_plast_ch.AsFloat+dms.asoscheg_p.AsFloat) <> dms.asossum_plastik.AsFloat then begin
    ShowMessage('Plastik summa noto`g`ri');exit;
  end;
  if (dms.asossum_epos_ch.AsFloat+dms.asoscheg_e.AsFloat) <> dms.asossum_epos.AsFloat then begin
    ShowMessage('H/r summa noto`g`ri');exit;
  end;
  if (dms.asossum_naqd.AsFloat+dms.asossum_plastik.AsFloat+dms.asossum_epos.AsFloat) <> (dms.asossumma.AsFloat+dms.asosxizmat.AsFloat) then begin
    ShowMessage('Chek summa noto`g`ri');exit;
  end;

  //shortdateformat:='dd.mm.yyyy';
    if dms.asos_slave.RecordCount=0 then begin ShowMessage('Chek chiqarich uchun tovar kiritilmagan');exit;end;
    try
      if dms.asossana.AsDateTime>StrToDate('01.04.2020') then begin
        //ShowMessage('sana kiritilmagan');exit;
      end;
    except
    end;
    DMS.asos_slave.First;f:=0;kol:=0;
    while not dms.asos_slave.Eof do begin
      f:=f+DMS.asos_slavekol.AsInteger*DMS.asos_slavesotish.AsFloat+DMS.asos_slavekol_in.AsInteger*DMS.asos_slavesotish_in.AsFloat;
      dms.asos_slave.Next;
    end;
    dms.asos_slave.First;
    while not dms.asos_slave.eof do begin

      if dms.asos_slavezakaz.AsVariant<>null then
      begin
        dms.asos_slave.edit;
        dms.asos_slavezakaz_end.AsVariant:=now();
        dms.asos_slave.post;
      end;

      dms.asos_slave.next;
    end;
    if f<>dms.asossumma.AsFloat then
    begin
    if f-dms.asossumma.AsFloat>100 then
        ShowMessage(FloatToStr(f-dms.asossumma.AsFloat));
    end;
    dms.asos.Edit;
    if h.value>0 then begin
      if q_sum.Value<1 then
      begin
        ShowMessage('Qarz summasini kiriting');
        q_sum.SetFocus;
        exit;
      end;
      dms.asosh_id.AsInteger:=h.value;
      dms.asosqarz_summa.AsVariant:=q_sum.Value;
      dms.asosqarz_flag.AsVariant:=1;
    end
    else begin
      q_sum.Value:=0;
      dms.asosqarz_flag.AsVariant:=null;
    end;
    dms.asoschangedate.AsDateTime:=DMS.setupvaqt.AsDateTime;
    dms.asosprint_flag.AsInteger:=1;

    if ((dms.asosmobil.AsInteger>1) and (dms.asosdiler_id.AsInteger=1)) or (dms.asos.State=dsInsert) or (dms.asosdiler_id.AsInteger=0) or (dms.asosdiler_id.AsInteger=-1) then begin
      dms.link.Close;dms.link.sql.Clear;
      if (DMS.s_clientgaraj.AsInteger=0) or (DMS.s_clientgaraj.AsVariant=null) then begin
        dms.link.sql.Add('update s_client set garaj=1 where id='+dms.s_clientid.AsString)
      end
      else begin
        dms.link.sql.Add('update s_client set garaj=garaj+1 where id='+dms.s_clientid.AsString);
      end;
      dms.link.ExecSQL;
       dms.asosdiler_id.AsInteger:=DMS.s_clientgaraj.AsInteger;
    end;
    dms.asos.Post;
    dms.s_client.Refresh;
    dms.asos_slave.Filter:='kol+kol_in>0';dms.asos_slave.Filtered:=true;

    dms.asos_slave.Filter:='';dms.asos_slave.Filtered:=false;
    dms.asos.Close;
    dms.asos.SQL.Clear;
    //dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'" order by id desc');
    dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and diler_id=0 and mobil=0 and client_id='+admin_clid+'  and user_id='+admin_id+'  and not (pl_id is not Null or plastik_id is not Null) order by id desc');
    dms.asos.open;
    //Tovarlar.SumList.RecalcAll;
    if dms.asos.RecordCount=0 then begin
      dms.asos.Append;
      dms.asostur_oper.AsInteger:=2;
      dms.asos.Post;
      Tovarlar.SumList.RecalcAll;
    end;
    h.Value:=0;q_sum.Value:=0;
    tur.ItemIndex:=0;
end;

procedure Tkafe.RzBitBtn3Click(Sender: TObject);
begin
  ztovar.Open;
  frxsf.LoadFromFile(ExtractFilePath(Application.ExeName)+'z_otchet80_kafe_o.fr3');
  frxsf.PrintOptions.Printer := chekPrinters.Text;
  frxsf.SelectPrinter;frxsf.PrepareReport;
  frxsf.PrintOptions.ShowDialog := false;
  frxsf.ShowReport;
end;

procedure Tkafe.turDblClick(Sender: TObject);
begin
  exit;
  if dms.asostur_oper.AsInteger=3 then exit;
  if not kafe.Showing then exit;
  //if DMS.asos_slave.RecordCount>0 then begin
  //  if MessageDlg('Diqqat, qayta hisoblaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNO then exit;
  //end;
  rec:=dms.asos_slaveid.AsInteger;
  DMS.asos_slave.First;
  while  not DMS.asos_slave.Eof do begin
    //ShowMessage(IntToStr(tur.ItemIndex));
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select * from ombor WHERE tovar_id = '+DMS.asos_slavetovar_id.AsString+' order by id');
    dms.link.open;
    //Clipboard.AsText:=qoldiq.SQL.Text;
    DMS.asos_slave.edit;
    case tur.ItemIndex of
    0:begin
        DMS.asos_slavesotish.AsFloat:=dms.link.fieldbyname('sotish').AsFloat;
        if dms.link.fieldbyname('t_in').AsInteger>1 then
          DMS.asos_slavesotish_in.AsFloat:=dms.link.fieldbyname('sotish_in').AsFloat;
      end;
    1:begin
        DMS.asos_slavesotish.AsFloat:=dms.link.fieldbyname('ulg1').AsFloat;
        if dms.link.fieldbyname('t_in').AsInteger>1 then
          DMS.asos_slavesotish_in.AsFloat:=DMS.asos_slavesotish.AsFloat/dms.link.fieldbyname('t_in').AsInteger;
      end;
    end;
    dms.asos_slavesumma.AsFloat:=dms.asos_slavekol.AsInteger*dms.asos_slavesotish.AsFloat;
    dms.asos_slavesumma_in.AsFloat:=dms.asos_slavekol_in.AsInteger*dms.asos_slavesotish_in.AsFloat;
    dms.asos_slavesumma_all.AsFloat:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;
    DMS.asos_slave.post;
    DMS.asos_slave.Next;
  end;
  kafe.Tovarlar.SumList.RecalcAll;
  dms.asos.Edit;
  dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
  dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
  dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
  dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat;dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
  dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
  dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
  dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
  dms.asossumma_ch.AsFloat:=dms.asossumma.AsFloat-(dms.asoscheg_n.AsFloat+dms.asoscheg_p.AsFloat+dms.asoscheg_e.AsFloat);
  dms.asossotuv_turi.AsInteger:=tur.ItemIndex+1;
  dms.asos.Post;
  dms.asos.Refresh;
  DMS.asos_slave.Locate('id',rec,[loCaseInsensitive]);

end;

procedure Tkafe.turChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  if dms.asostur_oper.AsInteger=3 then exit;
  if not kafe.Showing then exit;
  //if DMS.asos_slave.RecordCount>0 then begin
  //  if MessageDlg('Diqqat, qayta hisoblaysizmi ?',mtConfirmation, [mbYes, mbNo], 0) = mrNO then exit;
  //end;
  rec:=dms.asos_slaveid.AsInteger;
  DMS.asos_slave.First;
  while  not DMS.asos_slave.Eof do begin
    //ShowMessage(IntToStr(tur.ItemIndex));
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('select * from ombor WHERE tovar_id = '+DMS.asos_slavetovar_id.AsString+' order by id');
    dms.link.open;
    //Clipboard.AsText:=qoldiq.SQL.Text;
    DMS.asos_slave.edit;
    case tur.ItemIndex of
    1:begin
        DMS.asos_slavesotish.AsFloat:=dms.link.fieldbyname('sotish').AsFloat;
        if dms.link.fieldbyname('t_in').AsInteger>1 then
          DMS.asos_slavesotish_in.AsFloat:=dms.link.fieldbyname('sotish_in').AsFloat;
      end;
    0:begin
        DMS.asos_slavesotish.AsFloat:=dms.link.fieldbyname('ulg1').AsFloat;
        if dms.link.fieldbyname('t_in').AsInteger>1 then
          DMS.asos_slavesotish_in.AsFloat:=DMS.asos_slavesotish.AsFloat/dms.link.fieldbyname('t_in').AsInteger;
      end;
    end;
    dms.asos_slavesumma.AsFloat:=dms.asos_slavekol.AsInteger*dms.asos_slavesotish.AsFloat;
    dms.asos_slavesumma_in.AsFloat:=dms.asos_slavekol_in.AsInteger*dms.asos_slavesotish_in.AsFloat;
    dms.asos_slavesumma_all.AsFloat:=dms.asos_slavesumma.AsFloat+dms.asos_slavesumma_in.AsFloat;
    DMS.asos_slave.post;
    DMS.asos_slave.Next;
  end;
  kafe.Tovarlar.SumList.RecalcAll;
    dms.asos.Edit;
    dms.asoscheg_n.AsFloat:=0;dms.asoscheg_p.AsFloat:=0;
    dms.asoskol.AsInteger:=Tovarlar.Columns.Items[4].Footer.SumValue+Tovarlar.Columns.Items[8].Footer.SumValue;
    dms.asossumma.AsFloat:=Tovarlar.Columns.Items[11].Footer.SumValue;
    dms.asosxizmat.AsFloat:=dms.asossumma.AsFloat*dms.asosxizmat_foiz.AsInteger/100;
    dms.asossum_naqd.AsFloat:=dms.asossumma.AsFloat+dms.asosxizmat.AsFloat;

    dms.asossum_plastik.AsFloat:=0;dms.asossum_epos.AsFloat:=0;
    dms.asossum_naqd_ch.AsFloat:=RoundLess(dms.asossum_naqd.AsVariant,dms.s_clientchegirma.AsInteger);
    dms.asoscheg_n.AsFloat:=RoundTo((dms.asossum_naqd.AsFloat-dms.asossum_naqd_ch.AsFloat),-2);
    dms.asossum_plast_ch.AsFloat:=0;dms.asossum_epos_ch.AsFloat:=0;
    dms.asossumma_ch.AsFloat:=dms.asossum_naqd_ch.AsFloat+dms.asossum_plastik.AsFloat;
    dms.asos.Post;dms.asos.Refresh;
    dms.main_link.Refresh;Tovarlar.SumList.RecalcAll;
    DMS.asos_slave.Locate('kol_ost',rec_ml,[loCaseInsensitive]);
    DMS.main_link.Locate('id',rec_ml,[loCaseInsensitive]);
end;

procedure Tkafe.RzBitBtn7Click(Sender: TObject);
begin
  dms.main_link.Last;

end;

procedure Tkafe.RzBitBtn6Click(Sender: TObject);
begin
  dms.main_link.First;

end;

procedure Tkafe.g_asosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
  17:
    if Panel3.Visible=true then
      Panel3.Visible:=false
    else
      Panel3.Visible:=true;
end;
end;

procedure Tkafe.RzBitBtn5Click(Sender: TObject);
var s:string;
begin
  if (filtr_haridor.Value=0) or  sana1.Value=0  then exit;
  if filtr_haridor.Value>0 then
    s:=s+' h_id = '+IntToStr(filtr_haridor.Value);
  if sana1.Value>0 then
    s:=s+iif(s='','',' and ')+' sana between '+kasaya(sana1.Value)+' and '+kasaya(sana2.Value);
  if s='' then s:=' diler_id="'+Edit5.Text+'"';
  dms.asos.Close;dms.asos.SQL.Clear;
  dms.asos.SQL.Add('select * from asos where '+s+' and changedate is not null and del_flag=1 and tur_oper in (2,3) and diler_id>0 and client_id='+admin_clid+' order by diler_id desc');
  dms.asos.open;

end;

end.
