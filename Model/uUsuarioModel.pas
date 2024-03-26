unit uUsuarioModel;

interface


type TUsuario = class
     private
       FSenha: String;
       FID: Integer;
       FUsername: String;
     public
      property Username: String read FUsername write FUsername;
      property Senha: String read FSenha write FSenha;
      property ID: Integer read FID write FID;
     end;
implementation

end.
