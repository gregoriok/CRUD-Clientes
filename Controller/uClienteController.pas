unit uClienteController;

interface

uses
uClienteModel, System.SysUtils, uBuscaCEP, uDmConexao,
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
  TClienteController = class
  private
   ConexaoSQL: TFDConnection;
  public
    procedure Pesquisar(sNome: String);
    procedure CarregarCliente(oCliente: TCliente; iCodigo: Integer);
    function InserirCliente(oCliente: TCliente; sErro: String): Boolean;
    function ExcluirCliente(iCodigo: Integer; sErro: String): Boolean;
    function AlterarCliente(oCliente: TCliente; sErro: String): Boolean;
  end;

implementation

procedure TClienteController.CarregarCliente(oCliente: TCliente; iCodigo: Integer);
var
  qrySelect : TFDQuery;
  tx :  TFDTransaction;
begin
  qrySelect := TFDQuery.Create(nil);
  qrySelect.Connection:= uDmConexao.DmConexao.ConexaoSQL;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('Select * from Cliente where ID = :iCodigo');
  qrySelect.ParamByName('iCodigo').AsInteger := iCodigo;
  tx := TFDTransaction.Create(nil);
    try
      tx.Connection := qrySelect.Connection;
      tx.StartTransaction; // Iniciar a transação
      tx := TFDTransaction.Create(nil);
      try
          tx.Connection := qrySelect.Connection;
          tx.StartTransaction; // Iniciar a transação

          try
            qrySelect.Open; // Abrir a consulta SQL
            if not qrySelect.IsEmpty then
              begin
                oCliente.ID := qrySelect.FieldByName('ID').AsInteger;
                oCliente.Nome := qrySelect.FieldByName('Nome').AsString;
                oCliente.Documento := qrySelect.FieldByName('Documento').AsString;
                oCliente.Email:= qrySelect.FieldByName('Email').AsString;
                oCliente.CEP:= qrySelect.FieldByName('CEP').AsString;
                oCliente.UF:= qrySelect.FieldByName('UF').AsString;
                oCliente.Cidade:= qrySelect.FieldByName('Cidade').AsString;
                oCliente.Logradouro:= qrySelect.FieldByName('Logradouro').AsString;
                oCliente.Bairro:= qrySelect.FieldByName('Bairro').AsString;
                oCliente.Numero:= qrySelect.FieldByName('Numero').AsString;
              end;
              tx.Commit; // Commitar a transação
            except
              on E: Exception do
              begin
                tx.Rollback; // Reverter a transação em caso de erro
              end;
          end;
        finally
          tx.Free; // Liberar a transação
      end;
    finally
    end;
end;

function TClienteController.InserirCliente(oCliente: TCliente;sErro: String): Boolean;
  var
  qryInsert : TFDQuery;
  tx :  TFDTransaction;
begin
  try
    Result := True;
    qryInsert := TFDQuery.Create(nil);
    qryInsert.Connection:= uDmConexao.DmConexao.ConexaoSQL;
    qryInsert.SQL.Clear;
    qryInsert.SQL.Add('INSERT INTO Cliente (Nome,Documento,Email,CEP,UF,Bairro,Cidade,Logradouro,Numero)');
    qryInsert.SQL.Add('VALUES(:Nome,:Documento,:Email,:CEP,:UF,:Bairro,:Cidade,:Logradouro,:Numero);');
    qryInsert.ParamByName('Nome').AsString := oCliente.Nome;
    qryInsert.ParamByName('Documento').AsString :=  oCliente.Documento;
    qryInsert.ParamByName('Email').AsString :=  oCliente.Email;
    qryInsert.ParamByName('CEP').AsString :=  oCliente.CEP;
    qryInsert.ParamByName('UF').AsString :=  oCliente.UF;
    qryInsert.ParamByName('Cidade').AsString :=  oCliente.Cidade;
    qryInsert.ParamByName('Logradouro').AsString :=  oCliente.Logradouro;
    qryInsert.ParamByName('Bairro').AsString :=  oCliente.Bairro;
    qryInsert.ParamByName('Numero').AsString :=  oCliente.Numero;
    tx := TFDTransaction.Create(nil);
    try
      tx.Connection := qryInsert.Connection;
      tx.StartTransaction; // Iniciar a transação
      try
        qryInsert.ExecSQL; // Executar a query
        tx.Commit; // Commitar a transação
        Result := True; // Se chegou até aqui sem exceção, operação foi bem sucedida
      except
        on E: Exception do
        begin
          sErro := E.Message; // Capturar mensagem de erro
          tx.Rollback; // Reverter a transação em caso de erro
        end;
      end;
    finally
      tx.Free; // Liberar a transação
    end;
  finally
    FreeAndNil(qryInsert)
  end;

end;


procedure TClienteController.Pesquisar(sNome: String);
begin
//   FDataModuleCliente.Pesquisar(sNome);
end;

function TClienteController.ExcluirCliente(iCodigo: Integer;sErro: String): Boolean;
 var
  qryInsert : TFDQuery;
  tx :  TFDTransaction;
begin
   try
    Result := True;
    qryInsert := TFDQuery.Create(nil);
    qryInsert.Connection:= uDmConexao.DmConexao.ConexaoSQL;
    qryInsert.SQL.Clear;
    qryInsert.SQL.Add('DELETE From Cliente Where ID = :iCodigo');
    qryInsert.ParamByName('iCodigo').AsInteger := iCodigo;
    tx := TFDTransaction.Create(nil);
    try
      tx.Connection := qryInsert.Connection;
      tx.StartTransaction; // Iniciar a transação
      try
        qryInsert.ExecSQL; // Executar a query
        tx.Commit; // Commitar a transação
        Result := True; // Se chegou até aqui sem exceção, operação foi bem sucedida
      except
        on E: Exception do
        begin
          sErro := E.Message; // Capturar mensagem de erro
          tx.Rollback; // Reverter a transação em caso de erro
        end;
      end;
    finally
      tx.Free; // Liberar a transação
    end;
  finally
    FreeAndNil(qryInsert)
  end;
end;

function TClienteController.AlterarCliente(oCliente: TCliente;sErro: String): Boolean;
var
  qryAlterar : TFDQuery;
  tx :  TFDTransaction;
begin
  try
    Result := True;
    qryAlterar := TFDQuery.Create(nil);
    qryAlterar.Connection:= uDmConexao.DmConexao.ConexaoSQL;
    qryAlterar.SQL.Clear;
    qryAlterar.SQL.Add('UPDATE Cliente SET Nome = :Nome,Documento = :Documento,Email = :Email,CEP = :CEP,UF = :UF,Bairro = :Bairro,Cidade = :Cidade,Logradouro = :Logradouro,Numero = :Numero');
    qryAlterar.SQL.Add(' WHERE ID = :ID');
    qryAlterar.ParamByName('Nome').AsString := oCliente.Nome;
    qryAlterar.ParamByName('Documento').AsString :=  oCliente.Documento;
    qryAlterar.ParamByName('Email').AsString :=  oCliente.Email;
    qryAlterar.ParamByName('CEP').AsString :=  oCliente.CEP;
    qryAlterar.ParamByName('UF').AsString :=  oCliente.UF;
    qryAlterar.ParamByName('Cidade').AsString :=  oCliente.Cidade;
    qryAlterar.ParamByName('Logradouro').AsString :=  oCliente.Logradouro;
    qryAlterar.ParamByName('Bairro').AsString :=  oCliente.Bairro;
    qryAlterar.ParamByName('Numero').AsString :=  oCliente.Numero;
    qryAlterar.ParamByName('ID').AsInteger :=  oCliente.ID;
    tx := TFDTransaction.Create(nil);
    try
      tx.Connection := qryAlterar.Connection;
      tx.StartTransaction; // Iniciar a transação
      try
        qryAlterar.ExecSQL; // Executar a query
        tx.Commit; // Commitar a transação
        Result := True; // Se chegou até aqui sem exceção, operação foi bem sucedida
      except
        on E: Exception do
        begin
          sErro := E.Message; // Capturar mensagem de erro
          tx.Rollback; // Reverter a transação em caso de erro
        end;
      end;
    finally
      tx.Free; // Liberar a transação
    end;
  finally
    FreeAndNil(qryAlterar)
  end;

end;
end.

