unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    QryAgenda: TFDQuery;
    dsAgenda: TDataSource;
    QryAgendaid: TFDAutoIncField;
    QryAgendanome: TStringField;
    QryAgendatelefone: TStringField;
    QryAgendauf: TStringField;
    QryAgendacidade: TStringField;
    QryAgendabairro: TStringField;
    QryAgendacep: TStringField;
    QryDelete: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unitPrincipal;

{$R *.dfm}

end.
