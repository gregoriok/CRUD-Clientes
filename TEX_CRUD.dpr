program TEX_CRUD;

uses
  Vcl.Forms,
  uFrmPrincipal in 'View\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadastroCliente in 'View\uFrmCadastroCliente.pas' {FrmCadastroCliente},
  uClienteModel in 'Model\uClienteModel.pas',
  uClienteController in 'Controller\uClienteController.pas',
  uDmConexao in 'DAO\uDmConexao.pas' {DmConexao: TDataModule},
  uDmCliente in 'DAO\uDmCliente.pas' {DataModule1: TDataModule},
  uBuscaCEP in 'API\uBuscaCEP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
