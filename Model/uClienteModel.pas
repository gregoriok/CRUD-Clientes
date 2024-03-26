unit uClienteModel;

interface

uses
  System.SysUtils;

type
  TCliente = class
  private
    FDocumento: String;
    FID: Integer;
    FNome: String;
    FEmail: String;
    FCEP: String;
    FUF: String;
    FBairro: String;
    FCidade: String;
    FLogradouro: String;
    FNumero: String;
    procedure SetNome(const Value: String);
    procedure ValidaCEP(const Value: String);
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write SetNome;
    property Documento: String read FDocumento write FDocumento;
    property Email: String read FEmail write FEmail;
    property Logradouro: String read FLogradouro write FLogradouro;
    property Cidade: String read FCidade write FCidade;
    property Bairro: String read FBairro write FBairro;
    property UF: String read FUF write FUF;
    property CEP: String read FCEP write FCEP;
    property Numero: String read FNumero write FNumero;
  end;

implementation

{ TCliente }

procedure TCliente.SetNome(const Value: String);
begin
  if Value.Trim = EmptyStr then
     raise EArgumentException.Create('Nome precisa ser preenchido');
  FNome := Value;
end;

procedure TCliente.ValidaCEP(const Value: String);
begin

end;

end.

