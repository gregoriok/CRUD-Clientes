unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmConexao;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
   procedure AbrirCliente;
   procedure CriarConexaoComBanco;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrmCadastroCliente;

procedure TfrmPrincipal.AbrirCliente;
begin
  FrmCadastroCliente := TFrmCadastroCliente.Create(nil);
  try
    FrmCadastroCliente.ShowModal;
  finally
    FreeAndNil(FrmCadastroCliente);
  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  AbrirCliente;
end;


procedure TfrmPrincipal.CriarConexaoComBanco;

//  dtmConnection:  Connection;
begin
//  try
//  dtmConnection := TDmConexao.Create(Self);
//  dtmConnection.FDConnection1.DriverName := 'SQLite';
//  dtmConnection.FDConnection1.Params.Add('Database=' + 'C:\Users\Gregorio kessler\Desktop\SQLite\db\TEX.db');
//  dtmConnection.FDConnection1.Connected := True;
//  ShowMessage('Conexao efetuada')
//  except
//    on E: Exception do
//      ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
//  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CriarConexaoComBanco;
end;

end.
