unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, FireDAC.Phys.PGDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, Data.DbxSqlite, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Datasnap.DBClient, Datasnap.Provider;

type
  TDmConexao = class(TDataModule)
    ConexaoSQL: TFDConnection;
    QueryPesquisar: TFDQuery;
    DataSource1: TDataSource;
    QueryPesquisarID: TFDAutoIncField;
    QueryPesquisarNome: TWideStringField;
    QueryPesquisarDocumento: TWideStringField;
    QueryPesquisarEmail: TWideStringField;
    QueryPesquisarCEP: TWideStringField;
    QueryPesquisarUF: TWideStringField;
    QueryPesquisarBairro: TWideStringField;
    QueryPesquisarCidade: TWideStringField;
    QueryPesquisarLogradouro: TWideStringField;
    QueryInsert: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    FDQuery2: TFDQuery;
    FDAutoIncField2: TFDAutoIncField;
    WideStringField9: TWideStringField;
    WideStringField10: TWideStringField;
    WideStringField11: TWideStringField;
    WideStringField12: TWideStringField;
    WideStringField13: TWideStringField;
    WideStringField14: TWideStringField;
    WideStringField15: TWideStringField;
    WideStringField16: TWideStringField;
    FDQuery3: TFDQuery;
    FDAutoIncField3: TFDAutoIncField;
    WideStringField17: TWideStringField;
    WideStringField18: TWideStringField;
    WideStringField19: TWideStringField;
    WideStringField20: TWideStringField;
    WideStringField21: TWideStringField;
    WideStringField22: TWideStringField;
    WideStringField23: TWideStringField;
    WideStringField24: TWideStringField;
    FDQuery4: TFDQuery;
    FDAutoIncField4: TFDAutoIncField;
    WideStringField25: TWideStringField;
    WideStringField26: TWideStringField;
    WideStringField27: TWideStringField;
    WideStringField28: TWideStringField;
    WideStringField29: TWideStringField;
    WideStringField30: TWideStringField;
    WideStringField31: TWideStringField;
    WideStringField32: TWideStringField;
  private
    { Private declarations }
  public
    function Pesquisar(sNome : String):Boolean;
  end;

var
  DmConexao: TDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmConexao }

function TDmConexao.Pesquisar(sNome: String): Boolean;
begin


  //  if CDSPesquisar.Active then
//    CDSPesquisar.Close;
//  CDSPesquisar.ParamByName('nome').AsString:='%'+sNome+'%';
//  CDSPesquisar.Open;
//  CDSPesquisar.First;
end;

end.
