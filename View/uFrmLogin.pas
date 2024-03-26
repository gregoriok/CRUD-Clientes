unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uUsuarioController, uFrmCadastroCliente, System.ImageList, Vcl.ImgList;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    BtnEntrar: TButton;
    EdtUsuario: TEdit;
    Label1: TLabel;
    EdtSenha: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    BtnSenha: TButton;
    ImageList1: TImageList;
    procedure BtnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSenhaClick(Sender: TObject);
  private
    fechar: Boolean;
    procedure RealizarLogin;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

{ TFrmLogin }

procedure TFrmLogin.BtnEntrarClick(Sender: TObject);
begin
  RealizarLogin;
end;

procedure TFrmLogin.BtnSenhaClick(Sender: TObject);
begin
   if EdtSenha.PasswordChar = '*' then
    EdtSenha.PasswordChar := #0
  else
    EdtSenha.PasswordChar := '*';
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  EdtUsuario.BorderStyle := bsNone;
  EdtUsuario.Color :=   clBtnFace;
  EdtUsuario.Font.Color := rgb(0,0,0);
  EdtSenha.Font.Color := rgb(0,0,0);
  EdtSenha.Color := clBtnFace;
  EdtSenha.BorderStyle := bsNone;
  Label3.Font.Color:= rgb(195, 201, 212);
  Panel1.Color := rgb(53, 59, 80);;
  BtnEntrar.Font.Color :=rgb(161, 56, 84)
end;

procedure TFrmLogin.RealizarLogin;
var
   uUsuarioController : TUsuarioController;
begin
  uUsuarioController := TUsuarioController.Create;

  if uUsuarioController.Logar(EdtUsuario.Text, EdtSenha.Text) then
  begin
    FrmCadastroCliente := TFrmCadastroCliente.Create(nil);
    try
      FrmCadastroCliente.ShowModal;
    finally
      FreeAndNil(FrmCadastroCliente);
    end;
  end
  else
  begin
    MessageDlg('Usuário Inválido', mtInformation, [mbOK], 0);
  end;

  FreeAndNil(uUsuarioController);
end;

end.

