unit uDmCliente;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.FMTBcd,
  Data.DB,
  Data.SqlExpr,
  Datasnap.DBClient,
  Datasnap.Provider, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, uDmConexao, uClienteModel;

type
  TDataModule1 = class(TDataModule)
  private
    { Private declarations }
  public
    procedure Pesquisar(sNome: String);
    procedure CarregarCliente(oCliente: TCliente ; iCodigo : Integer);
    function Inserir(oCliente: TCliente; out sErro: string):Boolean;
    function Alterar(oCliente: TCliente; out sErro: string):Boolean;
    function Excluir(iCodigo: Integer; out sErro: string):Boolean;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TDataModule1.Alterar(oCliente: TCliente; out sErro: string): Boolean;
begin
//  Result := False;
//  with SQLInserir, oCliente do
//  begin
//   Params[0].AsInteger:= ID;
//   Params[1].AsString := Nome;
//   Params[2].AsString := Documento;
//   Params[3].AsString := Email;
//   Params[4].AsString := CEP;
//   Params[5].AsString := UF;
//   Params[6].AsString := Bairro;
//   Params[7].AsString := Cidade;
//   Params[8].AsString := Logradouro;
//   Params[9].AsString := Numero;
//   try
//     ExecSQL();
//     Result := True;
//   except on E: Exception do
//      sErro := 'Ocorreu um erro ao alterar o cliente : ' + sLineBreak + E.Message;
//   end;
//  end;
end;

procedure TDataModule1.CarregarCliente(oCliente: TCliente; iCodigo: Integer);
//var
//  sqlClient: TSQLDataSet;
begin
//   sqlClient := TSQLDataSet.Create(nil);
//   try
//    with sqlClient do
//    begin
//      sqlClient.FDConnection1 := DmConexao.FDConnection1;
//      CommandText := 'select * from cliente where (id = '+ IntToStr(iCodigo) + ')';
//      Open;
//      with oCliente do
//      begin
//          Nome := FieldByName('Nome').AsString;
//          Documento := FieldByName('Documento').AsString;
//          Email := FieldByName('Email').AsString;
//          CEP:= FieldByName('CEP').AsString;
//          UF := FieldByName('UF').AsString;
//          Bairro:= FieldByName('Bairro').AsString;
//          Cidade:= FieldByName('Cidade').AsString;
//          Logradouro:= FieldByName('Logradouro').AsString;
//          Numero := FieldByName('Numero').AsString;
//      end;
//    end;
//
//
//   finally
//      FreeAndNil(sqlClient);
//   end;
end;

function TDataModule1.Excluir(iCodigo: Integer; out sErro: string): Boolean;
begin
//Result := False;
//  with SQLDelete do
//  begin
//    Params[0].AsInteger := iCodigo;
//    try
//      ExecSQL();
//      Result := True;
//    except on E: Exception do
//      sErro := 'Ocorreu um erro ao deletar o cliente : ' + sLineBreak + E.Message;
//   end;
//  end;
end;

function TDataModule1.Inserir(oCliente: TCliente; out sErro: string): Boolean;
begin
//  Result := False;
//  with SQLInserir, oCliente do
//  begin
//   Params[0].AsString := Nome;
//   Params[1].AsString := Documento;
//   Params[2].AsString := Email;
//   Params[3].AsString := CEP;
//   Params[4].AsString := UF;
//   Params[5].AsString := Bairro;
//   Params[6].AsString := Cidade;
//   Params[7].AsString := Logradouro;
//   Params[8].AsString := Numero;
//   try
//     ExecSQL();
//     Result := True;
//   except on E: Exception do
//      sErro := 'Ocorreu um erro ao inserir cliente : ' + sLineBreak + E.Message;
//   end;
//  end;
end;

procedure TDataModule1.Pesquisar(sNome: String);
begin
//  if CDSPesquisar.Active then
//    CDSPesquisar.Close;
//  CDSPesquisar.ParamByName('nome').AsString:='%'+sNome+'%';
//  CDSPesquisar.Open;
//  CDSPesquisar.First;
end;

end.
