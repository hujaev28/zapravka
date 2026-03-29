unit fulanish_kafe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs,StdCtrls, RzButton,  RzPanel,ShellApi, RzPrgres, IdBaseComponent,
  IdFTP, IdAntiFreezeBase, IdAntiFreeze,shlObj,activeX,comObj,Registry,
  inifiles, IdFTPCommon,  ComCtrls, ExtCtrls,DB,
  ZAbstractRODataset, IdComponent, Mask, RzCmboBx, RzLabel, DBGridEh,
  ImgList, ZAbstractDataset, ZDataset, RzRadGrp, RzTabs, RzTray,
  IdTCPConnection, IdTCPClient, DBCtrlsEh, DBLookupEh, sPageControl,
  acMagn, acAlphaHints, acTitleBar, sSkinManager, sSkinProvider;
type
  Tulanish_kafe = class(TForm)
    sh_login: TLabel;
    sh_parol: TLabel;
    Page: TRzPageControl;
    Sheet1: TRzTabSheet;
    Sheet2: TRzTabSheet;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    metod: TRzRadioGroup;
    bt_ok: TRzBitBtn;
    l_login: TRzLabel;
    l_parol: TRzLabel;
    connect: TRzBitBtn;
    Sheet3: TRzTabSheet;
    kachaynewver: TRzBitBtn;
    protinout: TTimer;
    FTPnewver: TIdFTP;
    AntiFreeze: TIdAntiFreeze;
    Timerzapusk: TTimer;
    login: TEdit;
    yarlik: TButton;
    combo_login: TRzComboBox;
    m_internet: TEdit;
    m_vtn: TEdit;
    m_set: TEdit;
    parol: TEdit;
    PrBar: TProgressBar;
    RzLabel4: TRzLabel;
    m_port: TEdit;
    selost: TZQuery;
    Dost: TDataSource;
    TrayIcon: TRzTrayIcon;
    Imagestop: TImageList;
    Imageok: TImageList;
    ImageList2: TImageList;
    Imageopen: TImageList;
    Imagesos: TImageList;
    Imagekachay: TImageList;
    Imageemail: TImageList;
    Imagedostup: TImageList;
    Imagekurs: TImageList;
    yangi: TRzBitBtn;
    RzLabel6: TRzLabel;
    Label2: TLabel;
    RzLabel7: TRzLabel;
    RzBitBtn1: TRzBitBtn;
    IdFTP1: TIdFTP;
    kachaynewver2: TRzBitBtn;
    avariya: TRzBitBtn;
    arxiv: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzPanel1: TRzPanel;
    RzLabel5: TRzLabel;
    RzPanel2: TRzPanel;
    Button1: TButton;
    rasm: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure connectClick(Sender: TObject);
    procedure metodClick(Sender: TObject);
    procedure kachaynewverClick(Sender: TObject);
    procedure protinoutTimer(Sender: TObject);
    procedure yarlikClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure combo_loginChange(Sender: TObject);
    procedure m_internetExit(Sender: TObject);
    procedure m_vtnExit(Sender: TObject);
    procedure m_setExit(Sender: TObject);
    procedure FTPnewverWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure FTPnewverWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure parolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_okClick(Sender: TObject);
    procedure TimerzapuskTimer(Sender: TObject);
    procedure m_portExit(Sender: TObject);
    procedure yangiClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure kachaynewver2Click(Sender: TObject);
    procedure avariyaClick(Sender: TObject);
    procedure arxivClick(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure loginKeyPress(Sender: TObject; var Key: Char);
    procedure TrayIconLButtonDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    procedure taymerThreadsDone(Sender: TObject);
    { Private declarations }
  public

      { Public declarations }
  end;
  Ttaymer  = class(TThread) protected procedure Execute; override;end;
  const versiya = 64;s_ver = '"Rasta" - versiya 6.4';
var
  g_hato,admin_id,admin_nom,admin_fio,admin_clid,admin_type,pusk,sid:String;
  ulanish_kafe: Tulanish_kafe;BytesToTransfer: LongWord;STime: TDateTime;AverageSpeed:Double=0;
  rec_asos_t:Integer;
  harf_lat:array  [1..60] of String[2] = ('a','b','v','g','d','e','yo','j','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ch','sh','sh','i','e','yu','ya','A','B','V','G','D','E','YO','J','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','CH','SH','SH','I','E','YU','YA');
  harf_kril:array [1..60] of String[2] = ('а','б','в','г','д','е','ё' ,'ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ч' ,'ш' ,'щ' ,'и','е','ю' ,'я' ,'А','Б','В','Г','Д','Е','Ё' ,'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ч' ,'Ш' ,'Щ' ,'И','Е','Ю' ,'Я' );

implementation
{$R *.dfm}
uses fdms,wcrypt2,Math,Winsock, fmain, fs_tovar, fkassa, fyangilash,
  fsetup, fkafe;

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
 if Obj is TRzRadioGroup then TRzRadioGroup(Obj).Caption:=Translate(TGroupBox(Obj).name, Lang, Dict);
 if Obj is TGroupBox then TGroupBox(Obj).Caption:=Translate(TGroupBox(Obj).name, Lang, Dict);
 if Obj is TRzGroupBox then TRzGroupBox(Obj).Caption:=Translate(TRzGroupBox(Obj).name, Lang, Dict);
 if Obj is TRzLabel then TRzLabel(Obj).Caption:=Translate(TRzLabel(Obj).name, Lang, Dict);
 if Obj is TDBGridEh then begin for j:=0 to TDBGridEh(Obj).Columns.Count-1 do TDBGridEh(Obj).Columns[j].Title.Caption:=Translate(TDBGridEh(Obj).Name+TDBGridEh(Obj).Columns[j].FieldName, Lang, Dict);end;
 if Obj is TRzRadioGroup then begin for j:=0 to TRzRadioGroup(Obj).Items.Count-1 do TRzRadioGroup(Obj).Items.Strings[j]:=Translate(TRzRadioGroup(Obj).Name+TRzRadioGroup(Obj).Items.Strings[j], Lang, Dict);end;
 if Obj is TRzLabel then TRzLabel(Obj).Caption:=Translate(TRzLabel(Obj).name, Lang, Dict);
 if Obj is TRzRadioGroup then TRzLabel(Obj).Caption:=Translate(TRzRadioGroup(Obj).name, Lang, Dict);
 if Obj is TLabel then TLabel(Obj).Caption:=Translate(TLabel(Obj).name, Lang, Dict);
 if Obj is TRzBitBtn then begin TRzBitBtn(Obj).Caption:=Translate(TRzBitBtn(Obj).name, Lang, Dict);
           TRzBitBtn(Obj).hint:=Translate(TRzBitBtn(Obj).name+'hint', Lang, Dict);end;

 end;
end;

procedure bdfoiz();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos_slave where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if (s='foiz')  then
    if (dms.link.FieldDefs.Items[i].DataType=ftSmallint) then  ss:='yes';
  end;
  if ss='yes' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos_slave CHANGE foiz foiz FLOAT( 10,2) DEFAULT  "20",CHANGE foiz_in foiz_in FLOAT(10,2) DEFAULT NULL');
    dms.link.ExecSQL;
    dms.lbd.Disconnect;dms.lbd.connect;
  end;
  end;

procedure bdv430();
begin
  if not FileExists(setup.serverpapka.Text+'\pl.frm') then begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('CREATE TABLE IF NOT EXISTS pl ( id int(11) NOT NULL,bank_id int(11) NOT NULL DEFAULT "0",');
  dms.link.SQL.Add('kod int(11) DEFAULT 0,n_pl int(11) DEFAULT "0",n_dok varchar(10) DEFAULT NULL,d_pl date NOT NULL,');
  dms.link.SQL.Add('rssvoy varchar(26) DEFAULT NULL,rs varchar(21) DEFAULT NULL,vo smallint(6) NOT NULL DEFAULT "0",');
  dms.link.SQL.Add('nn smallint(3) DEFAULT "0",client int(11) DEFAULT "0",client_id int(11) NOT NULL DEFAULT "0",');
  dms.link.SQL.Add('sena_pl double(20,2) DEFAULT "0.00",saldo double(20,2) DEFAULT "0.00",ost_pl double(20,2) DEFAULT "0.00",');
  dms.link.SQL.Add('vid smallint(1) DEFAULT "1",s1 varchar(12) DEFAULT NULL,ter smallint(2) DEFAULT NULL,pot1 smallint(1) DEFAULT "0",');
  dms.link.SQL.Add('pot2 smallint(1) DEFAULT "0",sf int(11) DEFAULT "0",sf_pot smallint(1) DEFAULT "0",username varchar(50) DEFAULT NULL,');
  dms.link.SQL.Add('changedate date DEFAULT NULL,stos smallint(1) NOT NULL DEFAULT "0",del_flag smallint(6) NOT NULL DEFAULT "1") ');
  dms.link.SQL.Add('ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ');
  dms.link.ExecSQL;

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `pl` ADD PRIMARY KEY (`id`), ADD KEY `client_id` (`client_id`),ADD KEY `kod` (`kod`),');
  dms.link.SQL.Add('ADD KEY `client` (`client`), ADD KEY `del_flag` (`del_flag`),ADD KEY `bank_id` (`bank_id`)');
  dms.link.ExecSQL;

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `pl` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2');
  dms.link.ExecSQL;

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE asos ADD pl_id INT NULL DEFAULT NULL AFTER h_id, ADD INDEX (`pl_id`)');
  dms.link.ExecSQL;
end;
end;
procedure bdv440();
var s:string;
begin
  s:=setup.serverpapka.Text+'\';
  if not FileExists(s+'oraliq.frm') then begin
    dms.link.Close;dms.link.SQL.Clear;

    dms.link.SQL.Add('CREATE TABLE IF NOT EXISTS `oraliq` (`id` int(11) NOT NULL, `asos_id` int(11) NOT NULL, `pl_id` int(11) NOT NULL, `ost` double(20,2) NOT NULL, `vid` smallint(1) NOT NULL ) ENGINE=MyISAM DEFAULT CHARSET=utf8');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `oraliq` ADD PRIMARY KEY (`id`), ADD KEY `asos_id` (`asos_id`),ADD KEY `pl_id` (`pl_id`)');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `oraliq` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=0');
    dms.link.ExecSQL;

  end;
end;
procedure bdv442();
begin
  if FileExists(setup.serverpapka.Text+'\s_pl.frm') then exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE `s_pl` (`id` int(11) NOT NULL auto_increment,`nom` varchar(150) NOT NULL,');
    dms.link.SQL.Add('`vid` smallint(6) default NULL,PRIMARY KEY  (`id`),KEY `vid` (`vid`))');
    dms.link.SQL.Add('ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AUTO_INCREMENT=6');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO `s_pl` VALUES (1, "X-to`lovnoma", 1)');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO `s_pl` VALUES (2, "Xarajat", 2)');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO `s_pl` VALUES (3, "buyurtma", 0)');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO `s_pl` VALUES (4, "Rahbardan kirim", 1)');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO `s_pl` VALUES (5, "Rahbarga chiqim", 2)');
    dms.link.ExecSQL;
end;
procedure bdv443();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='kurs' then ss:=s;
  end;
  if ss='kurs' then exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `asos` ADD `kurs` FLOAT(12,2) NULL DEFAULT NULL AFTER `pl_id`, ADD `dollar` SMALLINT(1) NULL DEFAULT 0 AFTER `kurs`,ADD `sum_d` FLOAT(12,2) NULL DEFAULT NULL');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `asos_slave` ADD `sena_d` FLOAT(12,2) NULL DEFAULT NULL AFTER `summa_all_ost`,');
    dms.link.SQL.Add('ADD `sena_in_d` FLOAT(12,2) NULL DEFAULT NULL AFTER `sena_d`, ADD `sotish_d` FLOAT(12,2) NULL DEFAULT NULL AFTER `sena_in_d`,');
    dms.link.SQL.Add('ADD `sotish_in_d` FLOAT(12,2) NULL DEFAULT NULL AFTER `sotish_d`');
    dms.link.ExecSQL;
end;
procedure bdv500();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_tovar where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='shtrix1' then ss:=s;
  end;
  if ss='shtrix1' then exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `s_tovar` ADD `shtrix1` VARCHAR(150) NULL DEFAULT NULL AFTER `shtrix_full`, ADD `shtrix2` VARCHAR(150) NULL DEFAULT NULL AFTER `shtrix1`, ADD INDEX (`shtrix1`), ADD INDEX (`shtrix2`)');
    dms.link.ExecSQL;
end;
procedure bdv501();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM pl where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='prim' then ss:=s;
  end;
  if ss='prim' then exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `pl` ADD `prim` varchar(255) NULL DEFAULT NULL ,add `statrashod` int(11) DEFAULT NULL ');
    dms.link.ExecSQL;
end;
procedure bdv502();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM pl where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='diler_id' then ss:=s;
  end;
  if ss='diler_id' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `pl` ADD  `diler_id` INT(11) DEFAULT NULL');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `pl` ADD INDEX (`diler_id`)');
  dms.link.ExecSQL;
end;
procedure bdv503();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM pl where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='h_id' then ss:=s;
  end;
  if ss='h_id' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `pl` ADD  `h_id` INT(11) DEFAULT NULL');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `pl` ADD INDEX (`h_id`)');
  dms.link.ExecSQL;
end;
procedure bdv504();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_pl where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='bank_id' then ss:=s;
  end;
  if ss='bank_id' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `s_pl` ADD  `bank_id` SMALLINT DEFAULT  0 NOT NULL, ADD  `activ` SMALLINT DEFAULT  1 NOT NULL');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `s_pl` ADD INDEX (  `bank_id` ),ADD INDEX (`activ` )');
  dms.link.ExecSQL;
end;
procedure bdv505();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_x_tur where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='bank_id' then ss:=s;
  end;
  if ss='bank_id' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `s_x_tur` ADD  `bank_id` SMALLINT DEFAULT  0 NOT NULL, ADD  `activ` SMALLINT DEFAULT  1 NOT NULL');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `s_x_tur` ADD INDEX (  `bank_id` ),ADD INDEX (`activ` )');
  dms.link.ExecSQL;
end;
procedure bdv506();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='plastik_id' then ss:=s;
  end;
  if ss='plastik_id' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `asos` ADD  `plastik_id` int(11) DEFAULT  NULL');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE  `asos` ADD INDEX (`plastik_id`)');
  dms.link.ExecSQL;
end;
procedure bdv561();
var s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_pl');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  if dms.link.RecordCount<19 then begin


    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('TRUNCATE TABLE s_pl');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO `s_pl` (`id`, `nom`, `vid`, `bank_id`, `activ`) VALUES (1, "X-naqd savdo", 1, 0, 1),(2, "Xarajat", 2, 0, 1), ');
    dms.link.SQL.Add('(3, "Dilerga buyurtma", 2, 0, 1),(4, "Rahbardan kirim", 1, 0, 1),(5, "Rahbarga chiqim", 2, 0, 1),(6, "Inkassa", 2, 0, 1),');
    dms.link.SQL.Add('(7, "Xaridordan kirim", 1, 0, 1),(8, "Xaridorga chiqim", 2, 0, 1),(9, "Dilerdan kirim", 1, 0, 1),(11, "Bankdan chiqim", 2, 1, 1),');
    dms.link.SQL.Add('(12, "Bankga kirim", 1, 1, 1),(13, "Bankdan xarajat", 2, 1, 1),(14, "Dilerga to`lov", 2, 1, 1), ');
    dms.link.SQL.Add('(15, "Dilerdan kirim", 1, 1, 1),(16, "Inkassa", 1, 1, 1),(17, "Xaridordan kirim", 1, 1, 1),');
    dms.link.SQL.Add('(18, "Xaridorga chiqim", 2, 1, 1),(19, "X-plastik savdo", 1, 1, 1),(20, "Xaridordan plastik kirim", 1, 1, 1)');
    dms.link.ExecSQL;
  end;
end;


procedure bdv562();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_client where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='lis' then ss:=s;
  end;
   if ss='lis' then exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_client` ADD  `lis` INT NOT NULL');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `asos_slave` CHANGE  `kol`  `kol` INT DEFAULT  0,');
    dms.link.SQL.Add('CHANGE  `kol_in`  `kol_in` INT DEFAULT  0,');
    dms.link.SQL.Add('CHANGE  `sena_d`  `sena_d` FLOAT( 12, 3 ) DEFAULT NULL ,');
    dms.link.SQL.Add('CHANGE  `sena_in_d`  `sena_in_d` FLOAT( 12, 3 ) DEFAULT NULL ,');
    dms.link.SQL.Add('CHANGE  `sotish_d`  `sotish_d` FLOAT( 12, 3 ) DEFAULT NULL ,');
    dms.link.SQL.Add('CHANGE  `sotish_in_d`  `sotish_in_d` FLOAT( 12, 3 ) DEFAULT NULL');
    dms.link.ExecSQL;
end;
procedure bdv563();
begin
  if FileExists(setup.serverpapka.Text+'\user.frm') then exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE IF NOT EXISTS user (id int(11) NOT NULL,client_id int(11) DEFAULT NULL,username varchar(255) COLLATE utf8_unicode_ci NOT NULL,');
    dms.link.SQL.Add('auth_key varchar(32) COLLATE utf8_unicode_ci NOT NULL,password_hash varchar(255) COLLATE utf8_unicode_ci NOT NULL,');
    dms.link.SQL.Add('password_reset_token varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,email varchar(255) COLLATE utf8_unicode_ci NOT NULL,');
    dms.link.SQL.Add('status smallint(6) NOT NULL DEFAULT 10,created_at int(11) NOT NULL,updated_at int(11) NOT NULL,site_address varchar(255) COLLATE utf8_unicode_ci NOT NULL)');
    dms.link.SQL.Add('ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `user` ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`),');
    dms.link.SQL.Add('ADD UNIQUE KEY `password_reset_token` (`password_reset_token`), ADD KEY `client_id` (`client_id`);');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `user` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=0;');
    dms.link.ExecSQL;
end;
procedure bdv564();
var s,ss:string;i:integer;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM user where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='x_tur_id' then ss:=s;
  end;
   if ss='x_tur_id' then exit;

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `user` ADD `x_tur_id` INT NULL DEFAULT NULL ,add `login` VARCHAR(150) NULL DEFAULT NULL,');
  dms.link.SQL.Add('ADD `userpass` VARCHAR(150) NULL DEFAULT NULL,ADD `fio` VARCHAR(150) NULL DEFAULT NULL, ADD INDEX (`fio`),ADD `kod` VARCHAR(13) NULL DEFAULT NULL ');
  dms.link.SQL.Add(',ADD `kim` VARCHAR(150) NULL DEFAULT NULL , ADD `tarmoq` VARCHAR(150) NULL DEFAULT NULL , ADD `vaqtin` DATETIME NULL DEFAULT NULL, ADD `active` SMALLINT(1) NULL DEFAULT NULL, ADD INDEX (`active`)');
  dms.link.SQL.Add(',ADD `vaqtout` DATETIME NULL DEFAULT NULL AFTER `vaqtin`, ADD `flag` INT(1) NULL DEFAULT NULL AFTER `vaqtout`,ADD `del_flag` SMALLINT NOT NULL, ADD INDEX (`del_flag`)');
  dms.link.ExecSQL;

  {dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `uzaart_teda`.`user` DROP INDEX `email`, ADD INDEX `email` (`email`) USING BTREE;');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `uzaart_teda`.`user` DROP INDEX `password_reset_token`, ADD INDEX `password_reset_token` (`password_reset_token`) USING BTREE;');
  dms.link.ExecSQL; }

  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `shartnoma` ADD `client_id` INT NOT NULL AFTER `srok`, ADD INDEX (`client_id`);');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE shartnoma SET client_id=user_id');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE asos SET user_id=xodim_id where user_id=0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `sert` ADD `client_id` INT NOT NULL AFTER `user_id`, ADD INDEX (`client_id`)');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `pl` ADD `user_id` INT NOT NULL AFTER `client_id`, ADD INDEX (`user_id`);');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `s_zavod` ADD `user_id` INT NULL DEFAULT NULL , ADD `client_id` INT NULL DEFAULT NULL, ADD INDEX (`client_id`)');
  dms.link.ExecSQL;


end;
procedure bdv600();
var s,ss:string;i:integer;
begin

  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='mobil' then ss:=s;
  end;
   if ss='mobil' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `asos` ADD `mobil` INT(1) NOT NULL DEFAULT 1 AFTER `id`, ADD INDEX (`mobil`);');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE `asos` SET mobil=0');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('INSERT INTO `uzaart_teda`.`user` (`id`, `username`, `password`, `auth_key`, `email`, `password_reset_token`, `x_tur_id`, `login`, `userpass`, `fio`, `kod`, `kim`, `tarmoq`, `vaqtin`, `vaqtout`, `flag`, `active`, `del_flag`) ');
  dms.link.SQL.Add(' VALUES (NULL, "madina", "Cfecon2ath7lF-6whLb3hM-9FbmclBmd", "$2y$13$GrFtCcbrNOjxkFXRD1KCBO0NaXStNAlcqtq6NYSLEXX2bvc1zJLPm", "hujaev@list.ru", NULL, NULL, "madina", "c4ca4238a0b923820dcc509a6f75849b", "madina", NULL, NULL, NULL, NULL, NULL, 1, 1, 1);');
  dms.link.ExecSQL;
end;
procedure bdv620();
var s,ss:string;i:integer;
begin

  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_client where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='last_pl_k' then ss:=s;
  end;
   if ss='last_pl_k' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `s_client` ADD `last_pl_k` INT NOT NULL AFTER `lis`, ADD `last_pl_b` INT NOT NULL AFTER `last_pl_k`');
  dms.link.ExecSQL;
end;
procedure bdv630();
var s,ss:string;i:integer;
begin

  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_client where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='kk' then ss:=s;
  end;
   if ss='kk' then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE `s_client` ADD `kk` SMALLINT(1) NOT NULL DEFAULT 1 AFTER last_pl_b');
  dms.link.ExecSQL;
end;


procedure bdv444();
begin
  if FileExists(setup.serverpapka.Text+'\s_kurs.frm') then exit;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('CREATE TABLE IF NOT EXISTS s_kurs (id int(11) NOT NULL,data1 date NOT NULL,data2 date DEFAULT NULL,dollar float(7,2) NOT NULL,');
  dms.link.SQL.Add('username varchar(100) DEFAULT NULL,changedate datetime DEFAULT NULL,stos smallint(1) NOT NULL DEFAULT 0,user_id smallint(8) DEFAULT NULL) ');
  dms.link.SQL.Add('ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 AUTO_INCREMENT=6');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE s_kurs ADD PRIMARY KEY (id)');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('ALTER TABLE s_kurs MODIFY id int(11) NOT NULL AUTO_INCREMENT');
  dms.link.ExecSQL;



end;

procedure bdv441();
begin
  if not FileExists(setup.serverpapka.Text+'\s_x_tur.frm') then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE IF NOT EXISTS `s_x_tur` (`id` int(11) NOT NULL, `nom` varchar(250) NOT NULL, `status` smallint(6) NOT NULL) ENGINE=MyISAM DEFAULT CHARSET=utf8');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `s_x_tur` ADD PRIMARY KEY (`id`), ADD KEY `nom` (`nom`), ADD KEY `status` (`status`)');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `s_x_tur` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=0');
    dms.link.ExecSQL;
  end;
end;
procedure bdv400();
begin
  if not FileExists(setup.serverpapka.Text+'\s_kat.frm') then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE s_kat (`id` int(11) NOT NULL auto_increment,`nom` varchar(250) NOT NULL,PRIMARY KEY (`id`))');
    dms.link.SQL.Add(' ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE s_brend (`id` int(11) NOT NULL auto_increment,`nom` varchar(250) NOT NULL,PRIMARY KEY (`id`))');
    dms.link.SQL.Add(' ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `s_tovar` ADD  `kat` SMALLINT NOT NULL AFTER  `shtrix` ,ADD  `brend` SMALLINT NOT NULL AFTER  `kat`');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_tovar` ADD INDEX (  `kat` )');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_tovar` ADD INDEX (  `brend` )');
    dms.link.ExecSQL;
  end;
end;
procedure bdv406(); // kat
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_tovar where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='kat' then ss:=s;
  end;
  if ss<>'kat' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `s_tovar` ADD  `kat` SMALLINT NOT NULL AFTER  `shtrix` ,ADD  `brend` SMALLINT NOT NULL AFTER  `kat`');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_tovar` ADD INDEX (  `kat` )');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_tovar` ADD INDEX (  `brend` )');
    dms.link.ExecSQL;
  end;
end;
procedure bdv403();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_client where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='chegirma' then ss:=s;
  end;
  if ss<>'chegirma' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE s_client ADD chegirma FLOAT(12,2) DEFAULT 0 ');
    dms.link.ExecSQL;
  end;
end;
procedure bdv404();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_client where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='seriya' then ss:=s;
  end;
  if ss<>'seriya' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_client` ADD seriya SMALLINT(1) DEFAULT 1 NOT NULL,ADD ichkitovar SMALLINT(1) DEFAULT  1 NOT NULL');
    dms.link.ExecSQL;
  end;
end;
procedure bdv405();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_tovar where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='kg' then ss:=s;
  end;
  if ss<>'kg' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `s_tovar` ADD `shtrix_in` VARCHAR(100) AFTER  `shtrix`, ADD `kg` SMALLINT AFTER `shtrix_in` , ADD `shtrix_full` VARCHAR(150) AFTER  `kg`');
    dms.link.ExecSQL;
  end;
end;
procedure bdv410();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_tovar where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='tz_id' then ss:=s;
  end;
  if ss<>'tz_id' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `s_tovar` ADD `tz_id` SMALLINT AFTER `shtrix_in`');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE `s_client` ADD `lasttz_id` SMALLINT');
    dms.link.ExecSQL;
  end;
end;
procedure bdv420();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_client where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='lastta_id' then ss:=s;
  end;
  if ss<>'lastta_id' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_client` ADD  `lastta_id` SMALLINT DEFAULT  1');
    dms.link.ExecSQL;
  end;
end;

procedure bdv402();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='sum_epos' then ss:=s;
  end;
  if ss<>'sum_epos' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos ADD sum_epos FLOAT(12,2) DEFAULT 0 AFTER sum_plastik ,ADD cheg_n FLOAT(12,2) DEFAULT 0 AFTER sum_epos,ADD cheg_p FLOAT(12,2) DEFAULT 0 AFTER cheg_n,ADD cheg_e FLOAT(12,2) DEFAULT 0 AFTER cheg_p,');
    dms.link.SQL.Add('ADD sum_naqd_ch FLOAT(12,2) DEFAULT 0 AFTER cheg_e,ADD sum_plast_ch FLOAT( 12,2) DEFAULT 0 AFTER sum_naqd_ch,ADD sum_epos_ch FLOAT(12,2) DEFAULT 0 AFTER sum_plast_ch,ADD summa_ch FLOAT(12,2) DEFAULT 0 AFTER sum_epos_ch');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add(' UPDATE  asos SET sum_naqd_ch =  sum_naqd+cheg_n,sum_plast_ch =  sum_plastik+cheg_p,sum_epos_ch =  sum_epos+cheg_e,summa_ch =  summa+cheg_n+cheg_p+cheg_e');
    dms.link.ExecSQL;
  end;
end;
procedure bdv401();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_brend where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='kat_id' then ss:=s;
  end;
  if ss<>'kat_id' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_brend` ADD  `kat_id` SMALLINT DEFAULT NULL ');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE  `s_brend` ADD INDEX (  `kat_id` )');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add(' UPDATE  s_brend SET kat_id =  1');
    dms.link.ExecSQL;
end;
end;
procedure bdshakl();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_tovar where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='shakl' then ss:=s;
  end;
  if ss<>'shakl' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE s_tovar ADD shakl VARCHAR(250) AFTER izm1,ADD internom VARCHAR(250) AFTER shakl;');
    dms.link.ExecSQL;
  end;
  end;
procedure bdv29();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_tovar where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='miqdor' then ss:=s;
  end;
  if ss<>'miqdor' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos ADD `shartnoma_id` INT');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos ADD INDEX (`shartnoma_id`)');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE s_tovar ADD majbur_dori_id int(11),ADD miqdor SMALLINT,ADD shart SMALLINT');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE shartnoma (`id` int(11) NOT NULL auto_increment,nomer varchar(50) default NULL,sana date default NULL,`diler_id` int(11) default NULL,`user_id` int(11) default NULL,');
    dms.link.SQL.Add('`changedate` datetime default NULL,`del_flag` smallint(1) default 1,`summa` float(12,2) default NULL,`qoldiq` float(12,2) default NULL,`srok` date default NULL, PRIMARY KEY  (`id`),');
    dms.link.SQL.Add('KEY sana (`sana`),KEY diler (`diler_id`), KEY user_id (`user_id`), KEY `del_flag` (`del_flag`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE alternativ (id int(11) NOT NULL AUTO_INCREMENT,tovar_id int(11) NOT NULL,kasallik_id int(11) NOT NULL, tur_oper int(11) DEFAULT NULL, summa1 float(12,2) DEFAULT NULL,summa2 float(12,2) DEFAULT NULL,');
    dms.link.SQL.Add('PRIMARY KEY (id), KEY tovar_id (tovar_id), KEY kasallik_id (kasallik_id)) ENGINE=MyISAM DEFAULT CHARSET=utf8');
    dms.link.ExecSQL;

    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE s_tur_oper (id int(11) NOT NULL AUTO_INCREMENT, nom varchar(250) NOT NULL, PRIMARY KEY (id)) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO s_tur_oper VALUES (1,"Kirim")');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO s_tur_oper VALUES (2,"Sotish")');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO s_tur_oper VALUES (3,"ichki tovar aylanmasi")');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('INSERT INTO s_tur_oper VALUES (5,"qoldiq kiritish")');
    dms.link.ExecSQL;
    //dms.link.SQL.Add('INSERT INTO s_tur_oper VALUES (1,"Kirim");INSERT INTO s_tur_oper VALUES (2,"Sotish");INSERT INTO s_tur_oper VALUES (3,"ichki tovar aylanmasi");INSERT INTO s_tur_oper VALUES (5,"qoldiq kiritish");');
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE s_kassallik (id int(11) NOT NULL AUTO_INCREMENT,nom varchar(250) NOT NULL,PRIMARY KEY (id)) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE s_majbur_dori (id int(11) NOT NULL AUTO_INCREMENT,nom varchar(250) NOT NULL, shakli varchar(250) NOT NULL, PRIMARY KEY (id)) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1');
    dms.link.ExecSQL;
  end;
  end;
procedure bdv291();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='qabul_sana' then ss:=s;
  end;
  if ss<>'qabul_sana' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos ADD qabul_sana DATETIME');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos ADD INDEX (`shartnoma_id`)');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos ADD ombor_id int(11),ADD  filial_id  int(11)');
    dms.link.ExecSQL;
  end;
  end;

procedure bdv294();
begin
  if not FileExists(setup.serverpapka.Text+'\sert.frm') then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE sert (id int(11) NOT NULL auto_increment, nomer varchar(50) NOT NULL, sana date NOT NULL,srok date default NULL,yil smallint(6) default NULL,');
    dms.link.SQL.Add('oy smallint(6) default NULL, user_id int(11) NOT NULL, changedate datetime default NULL, zavod_id int(11) NOT NULL,');
    dms.link.SQL.Add('filenom varchar(100) default NULL, del_flag smallint(6) NOT NULL default 1, PRIMARY KEY  (id)) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE serttovar (id int(11) NOT NULL auto_increment,tovar_id int(11) NOT NULL,sert_id int(11) default NULL, seriya varchar(50) default NULL,');
    dms.link.SQL.Add('srok date default NULL,user_id int(11) default NULL,changedate datetime default NULL,del_flag smallint(1) default 1,PRIMARY KEY  (id),');
    dms.link.SQL.Add('KEY tovar_id (tovar_id),KEY seriya (seriya),KEY user_id (user_id),KEY sert_id (sert_id),KEY del_flag (del_flag)) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8');
    dms.link.ExecSQL;
  end;
  end;
procedure bdv293();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_client where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='glav_id' then ss:=s;
  end;
  if ss<>'glav_id' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE s_client ADD glav_id int(11),ADD client_tur int(11)');
    dms.link.ExecSQL;
  end;
  end;
procedure bdv295();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='print_flag' then ss:=s;
  end;
  if ss<>'print_flag' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos ADD print_flag smallint(1) default NULL');
    dms.link.ExecSQL;
  end;
  end;
procedure bdv296();
begin
  if not FileExists(setup.serverpapka.Text+'\otch.frm') then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE otch (id int(11) NOT NULL auto_increment,sf int(11) default NULL,s1 varchar(300) default NULL,s2 varchar(300) default NULL,s3 varchar(300) default NULL,f1 double(20,2) default NULL,f2 double(20,2) default NULL,');
    dms.link.SQL.Add('f3 double(20,2) default NULL,i1 int(11) default NULL,i2 int(11) default NULL,i3 int(11) default NULL,kurs float(7,2) default NULL,dollar float(12,2) default NULL,poshlina double(20,2) default NULL,flag smallint(1) default NULL,');
    dms.link.SQL.Add('f4 double(20,2) default NULL,f5 double(20,2) default NULL,f6 double(20,2) default NULL,f7 double(20,2) default NULL, f8 double(20,2) default NULL,');
    dms.link.SQL.Add('f9 double(20,2) default NULL, f10 double(20,2) default NULL, PRIMARY KEY (id), KEY s1 (s1), KEY sf (sf)) ENGINE=MyISAM AUTO_INCREMENT=22772 DEFAULT CHARSET=utf8');
    dms.link.ExecSQL;
  end;
  end;
procedure bdv297();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos_slave where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='polka' then ss:=s;
  end;
  if ss<>'polka' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos_slave ADD polka VARCHAR(50) default NULL AFTER seriya');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos_slave ADD INDEX (polka)');
    dms.link.ExecSQL;
  end;
  end;
procedure bdv298();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM asos where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='qarz_summa' then ss:=s;
  end;
  if ss<>'qarz_summa' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos ADD qarz_summa float(12,2) default NULL, ADD  qarz_kim varchar(100) DEFAULT NULL, ADD qarz_izoh varchar(250) DEFAULT NULL,ADD  qarz_flag smallint(6) DEFAULT NULL AFTER seriya');
    dms.link.ExecSQL;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE asos_slave ADD INDEX (polka)');
    dms.link.ExecSQL;
  end;
  end;
procedure bdv300();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_client where id=0');
  dms.link.open;
  dms.link.Open;s:='';ss:='';
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='yaxlitlash' then ss:=s;
  end;
  if ss<>'yaxlitlash' then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('ALTER TABLE s_client ADD yaxlitlash SMALLINT NOT NULL DEFAULT 0 AFTER tarmoq, ADD yaxlitlash_in SMALLINT NOT NULL DEFAULT -2 AFTER yaxlitlash, ADD foiz FLOAT(12,2) NULL DEFAULT 20 AFTER yaxlitlash_in, ADD foiz_in FLOAT(12,2) NOT NULL DEFAULT 20 AFTER foiz');
    dms.link.ExecSQL;
  end;
end;

procedure bdobl();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('select * FROM s_user where id=0');
  dms.link.Open;
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='obl' then ss:=s;
  end;
  if ss<>'obl' then begin
     dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('ALTER TABLE s_user ADD obl VARCHAR(50);');dms.link.ExecSQL;
      dms.lbd.Disconnect;dms.lbd.connect;
  end;
end;
procedure bdv310();
begin
  if not FileExists(setup.serverpapka.Text+'\s_haridor.frm') then begin
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE s_haridor (id int(11) NOT NULL auto_increment,client_id int(11) DEFAULT null,nom varchar(250) DEFAULT NULL,komu smallint(6) DEFAULT 0,');
    dms.link.SQL.Add('adress varchar(250) DEFAULT NULL,manzil varchar(250) DEFAULT NULL,indeks varchar(20) DEFAULT NULL,');
    dms.link.SQL.Add('obl int(11) DEFAULT 0,tuman int(11) DEFAULT 0,boss varchar(150) DEFAULT NULL,tel varchar(50) DEFAULT NULL, ');
    dms.link.SQL.Add('rs char(20) CHARACTER SET cp1251 DEFAULT NULL, inn char(9) CHARACTER SET cp1251 DEFAULT NULL,');
    dms.link.SQL.Add('okonh char(9) CHARACTER SET cp1251 DEFAULT NULL,bank varchar(150) DEFAULT NULL,kod_bank char(5) CHARACTER SET cp1251 DEFAULT NULL,');
    dms.link.SQL.Add('gorod varchar(50) DEFAULT NULL,active smallint(6) DEFAULT 1,tugashsana date DEFAULT NULL,');
    dms.link.SQL.Add('user_id int(11) DEFAULT NULL,changedate datetime DEFAULT NULL,uyu_type int(11) DEFAULT NULL,');
    dms.link.SQL.Add('sana date DEFAULT NULL,srok date DEFAULT NULL,prim varchar(250) DEFAULT NULL,');
    dms.link.SQL.Add('email varchar(100) DEFAULT NULL,masul1 varchar(100) DEFAULT NULL,telsms1 varchar(9) DEFAULT NULL,');
    dms.link.SQL.Add('masul2 varchar(100) DEFAULT NULL,telsms2 varchar(9) DEFAULT NULL,del_flag smallint(1) NOT NULL DEFAULT 1,');
    dms.link.SQL.Add('iamhere int(11) DEFAULT NULL,diamhere datetime DEFAULT NULL,prikname varchar(50) DEFAULT NULL,');
    dms.link.SQL.Add('prikdate datetime DEFAULT NULL,filenom varchar(50) DEFAULT NULL,vaqt_in datetime DEFAULT NULL,vaqtout datetime DEFAULT NULL,');
    dms.link.SQL.Add('kim varchar(100) DEFAULT NULL,tarmoq varchar(100) DEFAULT NULL,');
    dms.link.SQL.Add('PRIMARY KEY (id),KEY nom (nom), KEY komu (komu),KEY client_id (client_id),KEY obl (obl), KEY tuman (tuman), KEY inn (inn),KEY uyu_type (uyu_type),KEY del_flag (del_flag)) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ');
    dms.link.ExecSQL;exit;
    dms.link.Close;dms.link.SQL.Clear;
    dms.link.SQL.Add('CREATE TABLE s_haridor (id int(11) NOT NULL auto_increment,nom varchar(250) DEFAULT NULL,komu smallint(6) DEFAULT 0,');
    dms.link.SQL.Add('adress varchar(250) DEFAULT NULL,manzil varchar(250) DEFAULT NULL,indeks varchar(20) DEFAULT NULL,');
    dms.link.SQL.Add('obl int(11) DEFAULT 0,tuman int(11) DEFAULT 0,boss varchar(150) DEFAULT NULL,tel varchar(50) DEFAULT NULL, ');
    dms.link.SQL.Add('rs char(20) CHARACTER SET cp1251 DEFAULT NULL, inn char(9) CHARACTER SET cp1251 DEFAULT NULL,');
    dms.link.SQL.Add('okonh char(9) CHARACTER SET cp1251 DEFAULT NULL,bank varchar(150) DEFAULT NULL,kod_bank char(5) CHARACTER SET cp1251 DEFAULT NULL,');
    dms.link.SQL.Add('gorod varchar(50) DEFAULT NULL,active smallint(6) DEFAULT 1,tugashsana date DEFAULT NULL,');
    dms.link.SQL.Add('user_id int(11) DEFAULT NULL,changedate datetime DEFAULT NULL,uyu_type int(11) DEFAULT NULL,');
    dms.link.SQL.Add('sana date DEFAULT NULL,srok date DEFAULT NULL,prim varchar(250) DEFAULT NULL,');
    dms.link.SQL.Add('email varchar(100) DEFAULT NULL,masul1 varchar(100) DEFAULT NULL,telsms1 varchar(9) DEFAULT NULL,');
    dms.link.SQL.Add('masul2 varchar(100) DEFAULT NULL,telsms2 varchar(9) DEFAULT NULL,del_flag smallint(1) NOT NULL DEFAULT 1,');
    dms.link.SQL.Add('iamhere int(11) DEFAULT NULL,diamhere datetime DEFAULT NULL,prikname varchar(50) DEFAULT NULL,');
    dms.link.SQL.Add('prikdate datetime DEFAULT NULL,filenom varchar(50) DEFAULT NULL,vaqt_in datetime DEFAULT NULL,vaqtout datetime DEFAULT NULL,');
    dms.link.SQL.Add('kim varchar(100) DEFAULT NULL,tarmoq varchar(100) DEFAULT NULL,');
    dms.link.SQL.Add('PRIMARY KEY (id),KEY nom (nom), KEY komu (komu),KEY obl (obl), KEY tuman (tuman), KEY inn (inn),KEY uyu_type (uyu_type),KEY del_flag (del_flag)) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ');
    dms.link.ExecSQL;
  end;
end;
procedure bdv311();
var i:integer;s,ss:string;
begin
  s:='';ss:='';
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('select * FROM asos where id=0');dms.link.Open;
  for i:=0 to dms.link.FieldCount-1 do begin
    s:=dms.link.FieldDefs.Items[i].Name;
    if s='h_id' then ss:=s;
  end;
  if ss<>'h_id' then begin
     dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('ALTER TABLE `asos` ADD `h_id` INT NULL AFTER `qarz_flag`, ADD INDEX (`h_id`);');dms.link.ExecSQL;
     dms.lbd.Disconnect;dms.lbd.connect;
  end;
end;
procedure zameni(s:string);
var file1,file2:string;
begin
  file1:=ExtractFilePath(Application.ExeName)+s;file2:=s;
  if not FileExists(file1) then
  begin
    try
      ulanish.FTPnewver.Disconnect;ulanish.FTPnewver.Connect;
      ulanish.FTPnewver.Get('file/kachat/'+file2,file1, false, true);
    except
      if FileExists(file1) then  DeleteFile(file1);
      ShowMessage(s+' faylini yuklab olish imkoniyati bo`lmadi. Keyinroq urinib ko`ring');
      ulanish.FTPnewver.Disconnect;
      halt;
    end;
    ulanish.FTPnewver.Disconnect;
  end;
end;
procedure yarat;
var s:String;
begin
  s:=ExtractFilePath(Application.ExeName)+'arhiv';if not DirectoryExists(s) then CreateDir(s);
  s:=ExtractFilePath(Application.ExeName)+'file';if not DirectoryExists(s) then CreateDir(s);
  s:=ExtractFilePath(Application.ExeName)+'shablon';if not DirectoryExists(s) then CreateDir(s);
  s:=ExtractFilePath(Application.ExeName)+'voice';if not DirectoryExists(s) then CreateDir(s);
  //zameni('libmySQL50.dll');zameni('GDS32.dll');zameni('msvcr71.dll');
end;
function md5(const Input: String): String;
var hCryptProvider: HCRYPTPROV;hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;dwHashBytes: Cardinal;
  pbContent: PByte;i: Integer;
begin
  dwHashBytes := 16;pbContent := Pointer(PChar(Input));Result := '';
  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then begin
      if CryptHashData(hHash, pbContent, Length(Input) * sizeof(Char), 0) then begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashBytes, 0) then begin
          for i := 0 to dwHashBytes - 1 do begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;
    CryptReleaseContext(hCryptProvider, 0);
  end;
  Result := AnsiLowerCase(Result);
end;
function StrReplace(Str, Str1:WideString; Str2: string): WideString;
var P, L: Integer;
begin
  Result := str;L := Length(Str1);
  repeat
    P := Pos(Str1, Result); // ищем подстроку
    if P > 0 then begin
      Delete(Result, P, L); // удаляем ее
      Insert(Str2, Result, P); // вставляем новую
    end;
  until P = 0;
end;
function GetComputerName: string;
var buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char; Size: Cardinal;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  Windows.GetComputerName(@buffer, Size);
  Result := StrPas(buffer);
end;

function GetLocalIP: String;
const WSVer = $101;
var wsaData: TWSAData;P: PHostEnt;Buf: array [0..127] of Char;
begin
  Result := '';
  if WSAStartup(WSVer, wsaData) = 0 then begin
    if GetHostName(@Buf, 128) = 0 then begin
      P := GetHostByName(@Buf);
      if P <> nil then Result := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
    end;
    WSACleanup;
  end;
end;

procedure Ttaymer.Execute;
begin
  ulanish.protinout.Enabled := False;
  OnTerminate := ulanish.taymerThreadsDone;
  main.memo1.lines.add('Serverha ulanish'+datetimetostr(Now()));
  try
    dms.lbdserver.Disconnect;dms.lbdserver.Connect;
    main.memo1.lines.add('server '+datetimetostr(Now()));
    //dms.setupint.Open;dms.setupint.Refresh;
    //DMS.setup.Edit;
    //DMS.setupver.Value:=dms.setupint.fieldbyname('ver').Value;
    //DMS.setup.Post;
  except
    main.memo1.lines.add('hatolik'+datetimetostr(Now()));
  end;
end;
procedure Tulanish_kafe.taymerThreadsDone(Sender: TObject);
begin
  main.memo1.lines.add('Tamom '+datetimetostr(Now()));
  ulanish.protinout.Enabled := true;

end;


procedure Tulanish_kafe.FormCreate(Sender: TObject);
var IniFile:TIniFile;s,til,s_host,sp:string;  c: array[0..800] of Char;
begin
  rec_asos_t:=0;
  dms.lbd.Disconnect;
  yarlik.Click;
  pusk:='0';
  if GlobalFindAtom('rasta') = 0 then GlobalAddAtom('rasta') else pusk:='1';
  s := ExtractFilePath(Application.ExeName)+'sozlash.ini';
  IniFile := TIniFile.Create(s);
  combo_login.Items.Clear;
  combo_login.Refresh;
  s:=IniFile.ReadString('Baza','login1','');
  if s<>'' then begin combo_login.Items.Append(IniFile.ReadString('Baza','login1',''));combo_login.Values.Append('1');end;
  s:=IniFile.ReadString('Baza','login2','');
  if s<>'' then begin combo_login.Items.Append(IniFile.ReadString('Baza','login2',''));combo_login.Values.Append('2');end;
  s:=IniFile.ReadString('Baza','login3','');
  if s<>'' then begin combo_login.Items.Append(IniFile.ReadString('Baza','login3',''));combo_login.Values.Append('3');end;
  s:=IniFile.ReadString('Baza','login4','');
  if s<>'' then begin combo_login.Items.Append(IniFile.ReadString('Baza','login4',''));combo_login.Values.Append('4');end;
  s:=IniFile.ReadString('Baza','login5','');
  if s<>'' then begin combo_login.Items.Append(IniFile.ReadString('Baza','login5',''));combo_login.Values.Append('5');end;

  if IniFile.ReadString('Baza','database','')='' then IniFile.WriteString('Baza','database','teda');
  if IniFile.ReadString('Baza','strixqidir','')='' then IniFile.WriteString('Baza','strixqidir','1');
  if IniFile.ReadString('Baza','port','')='' then IniFile.WriteString('Baza','port','5500');

  metod.ItemIndex:=StrToInt(IniFile.ReadString('BAZA','metod',''))-1;
  case metod.ItemIndex of // serverga ulanish turi
  0:begin
      s_host := IniFile.ReadString('BAZA','set','');
      dms.lbd.Database:=IniFile.ReadString('Baza','database','uzaart_teda' );
      dms.lbd.Port:=StrToInt(IniFile.ReadString('Baza','port','' ));
      dms.lbd.Catalog:=IniFile.ReadString('Baza','database','uzaart_teda' );
     end;
  1:begin
      s_host := IniFile.ReadString('BAZA','vpn','');
      dms.lbd.Database:=IniFile.ReadString('Baza','database','uzaart_teda' );
      dms.lbd.Port:=StrToInt(IniFile.ReadString('Baza','port','' ));
      dms.lbd.Catalog:=IniFile.ReadString('Baza','database','uzaart_teda' );
    end;
  2:begin
      s_host := IniFile.ReadString('BAZA','internet','');
      dms.lbd.Database:=IniFile.ReadString('Baza','database','uzaart_teda' );
      dms.lbd.Port:=StrToInt(IniFile.ReadString('Baza','port','' ));
      dms.lbd.Catalog:=IniFile.ReadString('Baza','database','uzaart_teda' );
    end;
  end;
  m_internet.Text:=IniFile.ReadString('BAZA','internet','');
  m_set.Text:=IniFile.ReadString('BAZA','set','');
  m_vtn.Text:=IniFile.ReadString('BAZA','vpn','');
  m_port.Text:=IniFile.ReadString('BAZA','port','');
  login.Text:=IniFile.ReadString('BAZA','Login','');
  parol.Text:=IniFile.ReadString('BAZA','Parol','');
  sp:=IniFile.ReadString('BAZA','serverpapka','c:\webserver');
  til := IniFile.ReadString('Baza','til','' );
  dms.lbd.HostName:=s_host;FTPnewver.Host:=s_host;
  if StrToInt(IniFile.ReadString('Baza','timer','0')) < 10 then
    protinout.Interval:=1000*10
  else
    protinout.Interval:=1000*StrToInt(IniFile.ReadString('Baza','timer','0'));
  inifile.Free;
  if metod.ItemIndex=0 then begin
  try
    protinout.Enabled:=false;
    dms.lbd.Connect;
    dms.setup.open;DMS.protinout.Open;
    protinout.Enabled:=true;
  except

  if FileExists(sp+'\denwer\Run.exe')=True  then begin
    if (not FileExists(sp+'\d'+copy(DateToStr(now),0,2)+copy(DateToStr(now),4,2)+copy(DateToStr(now),9,2)+'.rar')) then
      ulanish.arxivClick(Sender)
    else begin
      TrayIcon.Icons:=Imagestop;TrayIcon.Hint:='Diqqat. Server  yuklanmaqda';
      TrayIcon.ShowBalloonHint('Serverni ishga tushirish jarayoni','Jarayoni boshlandi');
      StrPCopy(c, sp+'\denwer\Run.exe');
      ShellExecute(Handle, 'open',c, nil, nil, SW_SHOWNORMAL);
      Sleep(6000);
    end;
  end; // run
  end; // try
  end; // metod.ItemIndex=0
  try
    protinout.Enabled:=false;
    dms.lbd.Connect;dms.setup.open;DMS.protinout.Open;
    protinout.Enabled:=true;
  except
    ulanish.Caption:=s_ver+'              Server bilan aloqa yoq';
    ulanish.Page.Pages[0].TabEnabled:=false;ulanish.Page.Pages[2].TabEnabled:=false;
    ulanish.Page.ActivePageIndex:=1;
    protinout.Enabled:=false;
  end;
  case metod.ItemIndex of
  0: s_host := 'tarmoq';
  1: s_host := 'VPN';
  2: begin s_host := 'Internet';end;
  end;
  ulanish.Caption:=s_ver+'      Siz '+s_host+' orqali ulandingiz';
  ulanish.Page.Pages[0].TabEnabled:=true;ulanish.Page.Pages[2].TabEnabled:=true;
  ulanish.Page.ActivePageIndex:=0;
  yarat;protinoutTimer(Sender);
end;

procedure Tulanish_kafe.connectClick(Sender: TObject);
var s_host:string;IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  dms.lbd.Disconnect;
  case metod.ItemIndex of
    0: begin
          dms.lbd.HostName := IniFile.ReadString('BAZA','set','');
          dms.lbd.Port:=strtoint(IniFile.ReadString('Baza','port','' ));
          dms.lbd.Catalog:=IniFile.ReadString('Baza','database','uzaart_teda');
          //yangi.Visible:=True;
       end;
    1: begin
         dms.lbd.HostName := '195.158.27.20';dms.lbd.Port:=3306;
         dms.lbd.Catalog:='uzaart_teda';yangi.Visible:=false;
       end;
    2: begin
        dms.lbd.HostName := '94.158.53.140';dms.lbd.Port:=5500;
        dms.lbd.Catalog:='uzaart_teda';yangi.Visible:=false;
       end;
  end;
  FTPnewver.Host:='195.158.27.20';
  IniFile.Free;
  try
    dms.lbd.Disconnect;dms.lbd.Connect;dms.setup.open;DMS.protinout.Open;
    //dms.Db.Open;dms.Dbt.Active:=true;
  except
    ulanish.Page.Pages[0].TabEnabled:=false;ulanish.Page.Pages[2].TabEnabled:=false;
    showMessage('Server bilan aloqa yoq');protinout.Enabled:=false;exit;
  end;
  ulanish.Page.Pages[0].TabEnabled:=true;ulanish.Page.Pages[2].TabEnabled:=true;
  case metod.ItemIndex of
  0: s_host := 'tarmoq';
  1: s_host := 'VPN';
  2: s_host := 'Internet';
  end;
  ulanish.Caption:=s_ver+'           Siz '+s_host+'  orqali ulandingiz';
  DMS.setup.Open;DMS.setup.Refresh;DMS.setup.Open;DMS.protinout.Open;
  protinout.Enabled:=true;
end;

procedure Tulanish_kafe.metodClick(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','metod',IntToStr(metod.ItemIndex+1));
  IniFile.Free;
  ulanish.Page.Pages[0].TabEnabled:=false;
  ulanish.Page.Pages[2].TabEnabled:=false;
end;

procedure Tulanish_kafe.kachaynewverClick(Sender: TObject);
var chiqish:Boolean;
begin
  kachaynewver.Visible:=False;chiqish:=False;
  ulanish.protinout.Enabled:=False;
  FTPnewver.Host:='94.158.53.140';
  //FTPnewver.Host:='185.196.214.42';
  try
    If not FTPnewver.Connected then FTPnewver.Connect;
    FTPnewver.TransferType:=ftBinary;BytesToTransfer:=FTPnewver.Size('home\teda\file\kachat\installsavdo.exe');
    //FTPnewver.Get('file\kachat\installsavdo.exe','installsavdos.exe', false, true);
    FTPnewver.Get('home\teda\file\kachat\installsavdo.exe','installsavdo.exe', true);
  except
    FTPnewver.Disconnect;DeleteFile('installsavdo.exe');
    ShowMessage('Юклаб олишда хатолик юз берди, компьютерни перезагрузка килинг !!!');chiqish:=true;
  end;
  if chiqish then begin
    kachaynewver.Visible:=true;ulanish.protinout.Enabled:=true;
    exit;
  end;
  if FileExists('rasta_old.exe') then DeleteFile('rasta_old.exe');
  RenameFile('rasta.exe','rasta_old.exe');Sleep(3000);
  ShellExecute(handle,nil,pchar('installsavdo.exe'),nil,nil,SW_RESTORE);Sleep(3000);
  DeleteFile('installsavdo.exe');
  //ShowMessage('Дастур автомат тарзда янгиланди, кайтадан ишга туширинг !!!');
  if FileExists('rasta.exe') then ShellExecute(handle,nil,pchar('rasta.exe'),nil,nil,SW_RESTORE); // else
  //ShellExecute(handle,nil,pchar('info_savdo.exe'),nil,nil,SW_RESTORE);
  ulanish.Close;
end;

procedure Tulanish_kafe.protinoutTimer(Sender: TObject);
begin
  //Ttaymer.Create(false);
  try
    DMS.setup.Refresh;
    if DMS.setupver.Value>versiya then begin
      if TrayIcon.Animate=false then  begin
        TrayIcon.Enabled:=True;
        TrayIcon.ShowBalloonHint('O`zgarish: '+DMS.setupnews.AsString,'Istimos, Dasturni yangilang.');
        TrayIcon.Animate:=true;
      end;
      TrayIcon.Icons:=Imagesos;TrayIcon.Hint:='Yangi versiya';
    end;
    if DMS.protinout.Active=false then DMS.protinout.open;
    if ulanish.metod.ItemIndex=0 then begin
      DMS.setup.Edit;
      DMS.setupvaqt.Value:=now();
      DMS.setup.Post;
    end;
    //kassa.Caption:= 'soat yanhilandi';
    DMS.protinout.edit;
    DMS.protinout.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').Value;
    DMS.protinout.FieldByName('tarmoq').Value:=GetLocalIP();
    DMS.protinout.FieldByName('dastur').Value:='it'+inttostr(versiya);
    DMS.protinout.post;
  except
    ulanish.protinout.Enabled:=false;
    if MessageDlg('Server bilan aloqa uzilgan,qaytadan ulanasizmi?',mtInformation,[mbYes, mbNo], 0) = mrYes then
    begin
      try
        DMS.lbd.Reconnect;
        ulanish.protinout.Enabled:=true;
      except
        ShowMessage('Server bilan aloqa uzilgan, keyinroq kirib ko`ring !!!');
        DMS.lbd.Disconnect;
        Halt;
      end
    end
    else
    begin
      DMS.lbd.Disconnect;
      Halt;
    end;
    ulanish.protinout.Enabled:=true;
  end;
end;

procedure Tulanish_kafe.yarlikClick(Sender: TObject);
var Directory,FileName:string;WFileName: WideString;
MyObject: IUnknown;MyIcon: IShellLink;MyPFile: IPersistFile;MyReg: TRegIniFile;
begin
  MyObject := CreateComObject(CLSID_ShellLink);
  MyIcon := MyObject as IShellLink;MyPFile := MyObject as IPersistFile;
  FileName := Application.ExeName;
  with MyIcon do  begin
  SetArguments(''); SetPath(PChar(FileName));
  SetWorkingDirectory(PChar(ExtractFilePath(FileName))); end;
  MyReg:=TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');
  Directory := MyReg.ReadString('Shell Folders', 'Desktop', '');
  WFileName := Directory + '/rasta.lnk';
  if not FileExists(WFileName) then
    MyPFile.Save(PWChar(WFileName),false);MyReg.Free;
end;

procedure Tulanish_kafe.FormHide(Sender: TObject);
//var IniFile:TIniFile;
begin
  {IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteInteger(name, 'left', Left);IniFile.WriteInteger(name, 'width', Width);
  IniFile.WriteInteger(name, 'top', Top);IniFile.WriteInteger(name, 'height', Height);IniFile.Destroy;}
end;

procedure Tulanish_kafe.FormShow(Sender: TObject);
//var IniFile:TIniFile;
begin
  {IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  Left :=  IniFile.ReadInteger(name,'left',0);Width := IniFile.ReadInteger(name,'width',600);
  Top :=   IniFile.ReadInteger(name,'top',0);Height := IniFile.ReadInteger(name,'height',400);IniFile.Destroy;}
  if dms.setup.FieldByName('ver').AsInteger-versiya>1 then begin
    ShowMessage('Dastur versiyasi juda eski. Joriy versiya  : '+IntToStr(versiya)+', Yangi versiya : '+dms.setup.FieldByName('ver').AsString+#13+' Diqqat,hozir yangilash jarayoni boshlanadi');
    ulanish.Caption:='Dastur versiyasi eski, iltimos yangi dasturni yuklab oling !';
    ulanish.Page.Pages[0].TabEnabled:=false;ulanish.Page.Pages[1].TabEnabled:=false;
    ulanish.Page.ActivePageIndex:=2;kachaynewverClick(Sender);
  end;
  if (dms.setup.FieldByName('ver').Value>versiya) and (pusk='0') then begin
    ShowMessage('Joriy versiya  : '+IntToStr(versiya)+', Yangi versiya : '+dms.setup.FieldByName('ver').AsString+#13+' Diqqat,hozir yangilash jarayoni boshlanadi');
    ulanish.Caption:='Dastur versiyasi eski, iltimos yangisini yuklab oling !';
    ulanish.Page.Pages[0].TabEnabled:=false;ulanish.Page.Pages[1].TabEnabled:=false;
    ulanish.Page.ActivePageIndex:=2;kachaynewverClick(Sender);
  end;
end;

procedure Tulanish_kafe.combo_loginChange(Sender: TObject);
begin
  login.Text:=combo_login.Text;parol.SetFocus;
end;

procedure Tulanish_kafe.m_internetExit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');IniFile.WriteString('BAZA','internet',m_internet.Text);IniFile.Free;
end;

procedure Tulanish_kafe.m_vtnExit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');IniFile.WriteString('BAZA','vpn',m_vtn.Text);IniFile.Free;
end;

procedure Tulanish_kafe.m_setExit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','set',m_set.Text);IniFile.Free;
end;

procedure Tulanish_kafe.FTPnewverWorkBegin(Sender: TObject;AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  STime:=Now;PrBar.Position:=0;PrBar.Max:=BytesToTransfer;
end;

procedure Tulanish_kafe.FTPnewverWork(Sender: TObject; AWorkMode: TWorkMode;const AWorkCount: Integer);
var S: string;TotalTime: TDateTime; H, M, Sec, MS: Word; DLTime: Double;
begin
  TotalTime:=Now-STime;DecodeTime(TotalTime, H, M, Sec, MS);
  Sec:=Sec+M*60+H*3600;DLTime:=Sec+MS/1000;
  if DLTime>0 then AverageSpeed:={(AverageSpeed + }(AWorkCount/1024)/DLTime{)/2};
  if AverageSpeed>0 then
  begin
    Sec:=Trunc(((PrBar.Max-AWorkCount)/1024/AverageSpeed));
    S:=Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);
    S:='Qoldiq vaqt: '+S;
  end
  else S:='';
  S:=FormatFloat('0.00 KB/s', AverageSpeed)+'; '+S;
  Label2.Caption:='Tezlik: '+S;
  PrBar.Position:=AWorkCount;
end;

procedure Tulanish_kafe.parolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if parol.Text='' then exit;
  if key<>13 then exit;ulanish.bt_okClick(Sender);

end;

procedure Tulanish_kafe.bt_okClick(Sender: TObject);
var s:string;IniFile:TIniFile;id:integer;
begin
  if parol.Text='' then exit;
  try
    DMS.setup.Open;DMS.setup.refresh;
  except
    try
      DMS.lbd.Reconnect;
    except
      if DMS.lbd.Connected =false then begin
        DMS.lbd.Disconnect;ShowMessage('Server bilan aloqa y`oq. Qaytadan ulanib ko`ring');exit;
      end;
    end;
  end;
  admin_id:='';
  dms.s_user.Close;dms.s_user.SQL.Clear;
  if parol.Text='28012013' then
      dms.s_user.SQL.Add('select * from user WHERE username = "'+login.Text+'"')
    else
      dms.s_user.SQL.Add('select * from user WHERE username = "'+login.Text+'" and userpass = "'+md5(parol.Text)+'"');
    dms.s_user.Open;
    if dms.s_user.RecordCount=0 then begin
      ShowMessage('Login yoki parol no`t`gri');
      exit;
    end;
      dms.s_client.Close;dms.s_client.SQL.Clear;
      dms.s_client.SQL.Add('select s_client.id as x_id,s_client.*,if((uyu_type=0) or (uyu_type is null),s_client.nom,concat(''"'',s_client.nom,''" '',s_opf.shnom)) as nom1 from s_client left JOIN s_opf ON s_opf.id = s_client.uyu_type where s_client.id='+dms.s_user.fieldbyname('client_id').AsString);
      dms.s_client.Open;
      dms.link.Close;dms.link.SQL.Clear;
      dms.link.SQL.Add('select * from s_tovar t,asos_slave s WHERE t.id=s.tovar_id and s.kol_ost<t.miqdor and shart=1 and client_id='+DMS.s_client.fieldbyname('id').AsString);
      dms.link.Open;
      DMS.s_tovar.Open;


     admin_type:=dms.s_user.FieldByName('status').AsString;
     admin_id:=dms.s_user.FieldByName('id').AsString;
     admin_clid:=dms.s_user.FieldByName('client_id').AsString;
     admin_nom:=dms.s_user.FieldByName('username').AsString;
     admin_fio:=dms.s_user.FieldByName('fio').AsString;
     dms.s_kassa.Close;dms.s_kassa.SQL.Clear;
     dms.s_kassa.SQL.Add('select * from s_kassa WHERE del_flag=1 and client_id = '+admin_clid);
     DMS.s_kassa.Open;

    DMS.asos_qoldiq.close;DMS.asos_qoldiq.SQL.Clear;
    DMS.asos_qoldiq.sql.add('SELECT * FROM asos where del_flag=1 and (tur_oper = 5 or tur_oper = 1) and client_id = '+admin_clid+' order by id desc');
    DMS.asos_qoldiq.Open;
    if DMS.asos_qoldiq.RecordCount=0 then begin
      DMS.asos_qoldiq.Append;
      DMS.asos_qoldiq.FieldByName('tur_oper').Value:=5;
      DMS.asos_qoldiq.FieldByName('client_id').Value:=StrToInt(admin_clid);
      DMS.asos_qoldiq.FieldByName('user_id').Value:=StrToInt(admin_id);
      DMS.asos_qoldiq.FieldByName('sana').Value:=dms.setupvaqt.AsDateTime;
      DMS.asos_qoldiq.FieldByName('nomer').Value:='00000';
      DMS.asos_qoldiq.Post;
    end;



    S:=login.Text;
    dms.s_diler.Close;dms.s_diler.SQL.Clear;
    dms.s_diler.SQL.Add('select * from s_diler WHERE del_flag=1 and avto = '+admin_clid);
    DMS.s_diler.Open;

    dms.shartnoma.Close;dms.shartnoma.SQL.Clear;
    dms.shartnoma.SQL.Add('select * from shartnoma WHERE del_flag=1 and user_id = '+admin_clid);
    DMS.shartnoma.Open;

    dms.client_edit.Close;dms.client_edit.SQL.Clear;
    dms.client_edit.SQL.Add('select * from s_client WHERE  del_flag=1 and id='+admin_clid);
    dms.client_edit.Open;


    dms.s_obl.Close;dms.s_obl.SQL.Clear;
    dms.s_obl.SQL.Add('select * from s_obl');dms.s_obl.Open;
    dms.client_edit.Close;dms.client_edit.SQL.Clear;
    dms.client_edit.SQL.Add('select * from s_client WHERE del_flag=1');
    dms.client_edit.Open;
    dms.s_tovar.Open;
    dms.s_mobil.Open;


    DMS.setup.Open;DMS.setup.Refresh;
    protinout.Enabled:=true;

    DMS.s_zavod.Open;DMS.s_haridor.Open;

    DMS.s_kat.Open;DMS.s_brend.Open;

    dms.s_izm1.Open;DMS.protizm.Open;
    dms.s_obl.Open;DMS.s_tuman.Open;DMS.s_opf.Open;
    IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');


    kassa.tanlash.ItemIndex:= strtoint(IniFile.ReadString('BAZA','strixqidir',''));
    setup.tanlash.ItemIndex:= strtoint(IniFile.ReadString('BAZA','strixqidir',''));
    IniFile.WriteString('Baza','login',login.Text);
    if (IniFile.ReadString('Baza','login1','')=login.Text) or (IniFile.ReadString('Baza','login2','')=login.Text) or (IniFile.ReadString('Baza','login3','')=login.Text) or (IniFile.ReadString('Baza','login4','')=login.Text) or (IniFile.ReadString('Baza','login5','')=login.Text) then
    else
    begin // qo`shih
      if IniFile.ReadString('Baza','login1','')='' then IniFile.WriteString('Baza','login1',login.Text)
      else if IniFile.ReadString('Baza','login2','')='' then IniFile.WriteString('Baza','login2',login.Text)
      else if IniFile.ReadString('Baza','login3','')='' then IniFile.WriteString('Baza','login3',login.Text)
      else if IniFile.ReadString('Baza','login4','')='' then IniFile.WriteString('Baza','login4',login.Text)
      else if IniFile.ReadString('Baza','login5','')='' then IniFile.WriteString('Baza','login5',login.Text)
      else
      begin
        IniFile.WriteString('Baza','login5',IniFile.ReadString('Baza','login4',''));
        IniFile.WriteString('Baza','login4',IniFile.ReadString('Baza','login3',''));
        IniFile.WriteString('Baza','login3',IniFile.ReadString('Baza','login2',''));
        IniFile.WriteString('Baza','login2',IniFile.ReadString('Baza','login1',''));
        IniFile.WriteString('Baza','login1',IniFile.ReadString('Baza','login',''));
      end;
    end;
    IniFile.Destroy;
    DMS.protinout.Open;DMS.protinout.Insert;
    DMS.protinout.FieldByName('kim').Value:=GetComputerName;DMS.protinout.FieldByName('tarmoq').Value:=GetLocalIP();
    DMS.protinout.FieldByName('vaqtin').Value:=DMS.setup.FieldByName('vaqt').Value;
    DMS.protinout.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').Value;
    DMS.protinout.FieldByName('dastur').Value:='it'+inttostr(versiya);
    DMS.protinout.FieldByName('flag').Value:=StrToInt(admin_type);
    DMS.protinout.FieldByName('client_id').Value:=StrToInt(admin_clid);
    DMS.protinout.FieldByName('adminnom').Value:=admin_nom;
    DMS.protinout.post;
    main.foot.Caption:='Hush kelibsiz: '+admin_fio;

      dms.s_user.Edit;
      DMS.s_user.FieldByName('kim').Value:=GetComputerName;
      DMS.s_user.FieldByName('tarmoq').Value:=GetLocalIP();
      DMS.s_user.FieldByName('vaqtin').Value:=DMS.setup.FieldByName('vaqt').Value;
      DMS.s_user.FieldByName('vaqtout').Value:=DMS.setup.FieldByName('vaqt').Value;
      DMS.s_user.FieldByName('flag').Value:=1;
      dms.s_user.post;


  if not main.Showing then begin
    ulanish.Hide;
    if (admin_type='3') or (admin_type='10') then begin

      dms.setup.Refresh;s:=FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime);
      dms.asos.Close;dms.asos.SQL.Clear;
      dms.asos.SQL.Add('select * from asos where del_flag=1 and tur_oper=2 and client_id='+admin_clid+'  and sana="'+FormatDateTime('yyyy-mm-dd',dms.setupvaqt.AsDateTime)+'" order by id desc');
      dms.asos.open;
      dms.asos.Locate('diler_id',0,[loCaseInsensitive]);
      if dms.asos.RecordCount=0 then begin
        dms.asos.Append;
        dms.asostur_oper.AsInteger:=2;
        dms.asos.Post;
        dms.asos.Refresh;
      end;
      dms.asos_slave.Open;
      kassa.varaq.ActivePageIndex:=0;
      dms.qoldiq.Close;dms.qoldiq.SQL.Clear;
      dms.qoldiq.SQL.Add('select a.* from s_tovar t,asos_slave a,asos WHERE a.del_flag=1 and (asos.tur_oper=1 or asos.tur_oper=4 or asos.tur_oper=5) and a.asos_id=asos.id and a.tovar_id=t.id and (a.kol_ost>0 or a.kol_in_ost>0) and asos.client_id = '+admin_clid+' and ' );
      dms.qoldiq.SQL.Add('t.id=0 ');
      dms.qoldiq.SQL.Add(' order by t.nom,a.srok');
      dms.qoldiq.open;
      if dms.s_client.FieldByName('kk').AsString='1' then
        kassa.ShowModal
      else
      begin
        dms.main_link.Close;dms.main_link.SQL.Clear;
        dms.main_link.SQL.Add('select a.*,t.kat,t.id as tid,t.nom as s_tovar from s_tovar t,asos_slave a,asos WHERE a.del_flag=1 and (asos.tur_oper=1 or asos.tur_oper=4 or asos.tur_oper=5) and a.asos_id=asos.id and a.tovar_id=t.id and (a.kol_ost>0 or a.kol_in_ost>0) and asos.client_id='+admin_clid );
        dms.main_link.SQL.Add(' order by t.kat,t.nom');
        dms.main_link.open;dms.user.open;

        kafe.ShowModal;
      end
    end
    else
      main.Show;
  end;
end;

procedure Tulanish_kafe.TimerzapuskTimer(Sender: TObject);
begin
  Timerzapusk.Enabled:=False;if trim(parol.Text)<>'' then bt_okClick(Sender);
end;

procedure Tulanish_kafe.m_portExit(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  IniFile.WriteString('BAZA','port',m_port.Text);IniFile.Free;
end;

procedure Tulanish_kafe.yangiClick(Sender: TObject);
begin
  yangilash.s_tovar.Open;yangilash.locals_tovar.Open;
  yangilash.ShowModal;
end;

procedure Tulanish_kafe.RzBitBtn1Click(Sender: TObject);
begin
  avariyaClick(Sender);
  if metod.ItemIndex=0 then begin
    bdobl();
    bdfoiz();
    bdshakl();bdv29();bdv291();bdv293();bdv294();
    bdv295();
    bdv296();
    bdv297();bdv298();bdv300();bdv310();bdv311();bdv400();bdv401();bdv406(); // kat
    bdv402();bdv403();bdv404();bdv405();bdv410();bdv420();
    bdv430();
    bdv440();
    bdv441();
    bdv442();
    bdv443();
    bdv444();
    bdv444();
    bdv444();
    bdv500();
    bdv501();
    bdv502();
    bdv503();
    bdv504();
    bdv505();
    bdv506();
    bdv561();
    bdv562();
    bdv563();
    bdv564();
    bdv600();
    bdv620();
    bdv630();
    //ALTER TABLE `asos` CHANGE `mobil` `mobil` INT NOT NULL DEFAULT '1', ADD `xizmat_foiz` FLOAT(12,2) NOT NULL DEFAULT '10' AFTER `plastik_id`;
  end;
  ShowMessage('Bazalarning ichki holati yangilandi');
end;

procedure Tulanish_kafe.kachaynewver2Click(Sender: TObject);
var chiqish:Boolean;
begin
  kachaynewver2.Visible:=False;chiqish:=False;
  ulanish.protinout.Enabled:=False;
  IdFTP1.Host:='94.158.53.140';
  try
    If not IdFTP1.Connected then IdFTP1.Connect;
    IdFTP1.TransferType:=ftBinary;BytesToTransfer:=IdFTP1.Size('file\kachat\installsavdo.exe');
    IdFTP1.Get('file\kachat\installsavdo.exe','installsavdo.exe', false, true);
  except
    FTPnewver.Disconnect;DeleteFile('installsavdo.exe');
    ShowMessage('Юклаб олишда хатолик юз берди, компьютерни перезагрузка килинг !!!');chiqish:=true;
  end;
  if chiqish then begin
    kachaynewver.Visible:=true;ulanish.protinout.Enabled:=true;
    exit;
  end;
  if FileExists('verum_old.exe') then DeleteFile('rasta_old.exe');
  RenameFile('rasta.exe','rasta_old.exe');Sleep(3000);
  ShellExecute(handle,nil,pchar('installsavdo.exe'),nil,nil,SW_RESTORE);Sleep(3000);
  DeleteFile('installsavdo.exe');
  //ShowMessage('Дастур автомат тарзда янгиланди, кайтадан ишга туширинг !!!');
  if FileExists('rasta.exe') then ShellExecute(handle,nil,pchar('rasta.exe'),nil,nil,SW_RESTORE); // else
  //ShellExecute(handle,nil,pchar('info_savdo.exe'),nil,nil,SW_RESTORE);
  ulanish.Close;
end;

procedure Tulanish_kafe.avariyaClick(Sender: TObject);
begin
  if metod.ItemIndex>0 then exit;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE asos');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE asos_slave');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE alternativ');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE otch');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE s_client');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE s_diler');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE s_kassallik');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE s_majbur_dori');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE s_xodim');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE shartnoma');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE protinout');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE s_tovar');dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;dms.link.SQL.Add('REPAIR TABLE pl');dms.link.ExecSQL;
  ShowMessage('Bazalardagi kamchiliklar to`g`irlandi');
end;

procedure Tulanish_kafe.arxivClick(Sender: TObject);
function kasaya(date:TDateTime):String;
var OldFormat,ResultStr: string;
begin
  if Date > 0 then begin
    OldFormat := ShortDateFormat;ShortDateFormat := 'yyyy-mm-dd';
    ResultStr := DateToStr(Date);ShortDateFormat := OldFormat;
    Result := '''' + ResultStr + ''''; end else Result := '';
end;
var s:string;c,t: array[0..800] of Char; IniFile:TIniFile;arx,sp:string;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sozlash.ini');
  arx := IniFile.ReadString('BAZA','arxiv','d:\arxiv');
  sp := IniFile.ReadString('BAZA','serverpapka','c:\webserver');
  try
  if FileExists(arx+'\d'+copy(DateToStr(now),0,2)+copy(DateToStr(now),4,2)+copy(DateToStr(now),9,2)+'.rar') then exit;
  TrayIcon.Icons:=Imagestop;TrayIcon.Hint:='Arxivlash boshlandi. server vaqtincha to`htatiladi';
  TrayIcon.ShowBalloonHint('Arxivlash boshlandi','server vaqtincha to`htatiladi');
  protinout.Enabled:=false;
  StrPCopy(c, sp+'\denwer\Stop.exe');
  ShellExecute(Handle, 'open',c, nil, nil, SW_SHOWNORMAL);Sleep(6000);
  s:='a -r '+arx+'\d'+copy(DateToStr(now),0,2)+copy(DateToStr(now),4,2)+copy(DateToStr(now),9,2)+'.rar '+sp+'\usr\local\mysql5\data\uzaart_teda\';
  StrPCopy(t, ExtractFilePath(Application.ExeName)+'rar.exe');
  StrPCopy(c, s);ShellExecute(Handle, 'open',t, c, nil, SW_SHOWNORMAL);Sleep(6000);
  StrPCopy(c, sp+'\denwer\Run.exe');
  ShellExecute(Handle, 'open',c, nil, nil, SW_SHOWNORMAL);Sleep(6000);
  TrayIcon.Hint:='Arxivlash tugadi, Server ishga tushrildi';TrayIcon.ShowBalloonHint('Arxivlash tugadi','Server ishga tushrildi');
  TrayIcon.Icons:=Imagedostup;
  dms.lbd.reconnect;
  protinout.Enabled:=true;
  except
  TrayIcon.Icons:=Imagestop;TrayIcon.Hint:='Arxivlashda xatolik yuz berdi';
  TrayIcon.ShowBalloonHint('Arxivlashda xatolik yuz berdi','Arxivlashda xatolik yuz berdi');

  end; //try
  IniFile.Free;
end;

procedure Tulanish_kafe.RzBitBtn4Click(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE  asos SET tur_oper = 1 WHERE tur_oper = 0 ');
  dms.link.ExecSQL;
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE asos SET sum_naqd = summa WHERE sum_naqd = 0 and sum_plastik = 0');
  dms.link.ExecSQL;
end;

procedure Tulanish_kafe.FormActivate(Sender: TObject);
begin
 //for i:=0 to Screen.FormCount-1 do TranslateForm(Screen.Forms[i],'ru',ExtractFilePath(Application.ExeName)+'trans.ini');
  g_hato:='ulanish_act';
 parol.SetFocus;
end;

procedure Tulanish_kafe.loginKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin Key:=#0;Perform(WM_NEXTDLGCTL,0,0);end;

end;

procedure Tulanish_kafe.TrayIconLButtonDblClick(Sender: TObject);
begin
  main.Show;
end;

procedure Tulanish_kafe.Button1Click(Sender: TObject);
begin
  dms.link.Close;dms.link.SQL.Clear;
  dms.link.SQL.Add('UPDATE asos SET user_id=xodim_id where user_id=0');
  dms.link.ExecSQL;
end;

end.
