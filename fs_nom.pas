unit fs_nom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Ts_nom = class(TForm)
    s_nom: TZQuery;
    Ds_nom: TDataSource;
    asos_slave: TZQuery;
    asos_slaveid: TIntegerField;
    asos_slavetovar_id: TIntegerField;
    asos_slavetovar_nom: TStringField;
    asos_slavetulov_id: TIntegerField;
    asos_slavesrok: TDateField;
    asos_slavekol: TSmallintField;
    asos_slavesubkod: TSmallintField;
    asos_slaveuser_id: TIntegerField;
    asos_slaves_user: TStringField;
    asos_slavechangedate: TDateTimeField;
    asos_slaveasos_id: TIntegerField;
    asos_slavedel_flag: TSmallintField;
    asos_slavesena: TFloatField;
    asos_slavesumma: TFloatField;
    asos_slaveizm_id: TSmallintField;
    asos_slavekol_in: TSmallintField;
    asos_slavesotish: TFloatField;
    asos_slaveturi: TSmallintField;
    asos_slaveresept: TSmallintField;
    asos_slaveqrkod: TSmallintField;
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
    asos_slaves_tovar: TStringField;
    asos_slavefoiz: TFloatField;
    asos_slavefoiz_in: TFloatField;
    Dasos_slave: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s_nom: Ts_nom;

implementation

{$R *.dfm}
uses fdms;
end.
