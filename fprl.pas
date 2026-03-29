unit fprl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles,DBGridEh, DBCtrlsEh, RzCmboBx, RzDBCmbo, DBLookupEh, StdCtrls, DBCtrls,
  Mask, Dialogs, RzButton, RzEdit, RzDBEdit, GridsEh, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RzLabel;

type
  Tprl = class(TForm)
    gform: TGroupBox;
    Label14: TLabel;
    nomer: TDBEdit;
    save: TRzBitBtn;
    cancel: TRzBitBtn;
    l_parol: TRzLabel;
    parol: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  prl: Tprl;

implementation

{$R *.dfm}
uses fulanish_k, fkassa;


end.







