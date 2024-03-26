unit uBuscaCEP;

interface

  uses
  System.Net.HttpClient, System.Net.URLClient, System.JSON, REST.Json , IdComponent, SysUtils, IdHTTP, IdSSLOpenSSL, Classes, RESTRequest4D;
type
  TBuscaCEP = class
  private
    Fcep: String;
    Flogradouro: String;
    Fcomplemento: String;
    Fbairro: String;
    Flocalidade: String;
    Fuf: String;
    Fibge: Integer;
    Fgia: Integer;
    Fddd: String;
    Fsiafi: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function EncontrarCep(cep: String): TBuscaCEP;
    property cep: String read Fcep write Fcep;
    property logradouro: String read Flogradouro write Flogradouro;
    property complemento: String read Fcomplemento write Fcomplemento;
    property bairro: String read Fbairro write Fbairro;
    property localidade: String read Flocalidade write Flocalidade;
    property uf: String read Fuf write Fuf;
    property ibge: Integer read Fibge write Fibge;
    property gia: Integer read Fgia write Fgia;
    property ddd: String read Fddd write Fddd;
    property siafi: Integer read Fsiafi write Fsiafi;
  end;

implementation

constructor TBuscaCEP.Create;
begin
end;
destructor TBuscaCEP.Destroy;
begin
  inherited;
end;
function TBuscaCEP.EncontrarCep(cep: String): TBuscaCEP;
var
 JSonValue : TJSONValue;
 LResponse: IResponse;
 url : String;
 RootJSON: TJSONObject;
begin
 Result := Self; // Para retornar a instância atual
  LResponse := TRequest.New
    .BaseURL('https://viacep.com.br/ws/' + cep + '/json/')
    .Accept('application/json')
    .Get;
  if LResponse.StatusCode = 200 then
    begin
      RootJSON := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
        try
          Fcep := RootJSON.GetValue<String>('cep');
          Flogradouro := RootJSON.GetValue<String>('logradouro');
          Fcomplemento := RootJSON.GetValue<String>('complemento');
          Fbairro := RootJSON.GetValue<String>('bairro');
          Flocalidade := RootJSON.GetValue<String>('localidade');
          Fuf := RootJSON.GetValue<String>('uf');
          Fibge := StrToIntDef(RootJSON.GetValue<String>('ibge'), 0);
          Fgia := StrToIntDef(RootJSON.GetValue<String>('gia'), 0);
          Fddd := RootJSON.GetValue<String>('ddd');
          Fsiafi := StrToIntDef(RootJSON.GetValue<String>('siafi'), 0);
        finally
          RootJSON.Free;
      end;
  end;
end;

end.
