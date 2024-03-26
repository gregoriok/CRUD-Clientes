unit uUsuarioController;

interface

uses uUsuarioModel,  System.SysUtils, uDmConexao,
Data.DB, Data.SqlExpr, FireDAC.Phys.PGDef,
FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Stan.Option,
FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
FireDAC.Phys.SQLite,
FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
FireDAC.Phys.SQLiteWrapper.Stat, Data.DbxSqlite, FireDAC.Stan.Param,
FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
Datasnap.DBClient, Datasnap.Provider;

type
  TUsuarioController = class
  private
   ConexaoSQL: TFDConnection;
  public
   function Logar(usuario, senha : string):Boolean;

  end;


implementation

{ TUsuarioController }

function TUsuarioController.Logar(usuario, senha: string): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try

    // Preparar a query SQL
    Query.Connection := uDmConexao.DmConexao.ConexaoSQL;
    Query.SQL.Text := 'SELECT COUNT(*) AS Contagem FROM Usuario WHERE Username = :Usuario AND Senha = :Senha';
    Query.ParamByName('Usuario').AsString := usuario;
    Query.ParamByName('Senha').AsString := senha;

    // Executar a query
    Query.Open;
    try

      if (not Query.IsEmpty) and (Query.FieldByName('Contagem').AsInteger > 0) then
        Result := True;
    finally
      Query.Close;
    end;
  finally
    Query.Free;
  end;
end;


end.
