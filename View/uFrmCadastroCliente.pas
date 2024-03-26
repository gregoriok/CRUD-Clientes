
unit uFrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uClienteController,
  uBuscaCEP, Data.Win.ADODB, uDmConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  Data.SqlExpr, System.RegularExpressions, System.ImageList, Vcl.ImgList;

type
  TOperacao = (opNovo,opAlterar,opNavegar);

  TFrmCadastroCliente = class(TForm)
    PnlRodape: TPanel;
    BtnFechar: TButton;
    PgcPrincipal: TPageControl;
    tbPesq: TTabSheet;
    TbDados: TTabSheet;
    PnlFiltro: TPanel;
    EdtPesquisar: TLabeledEdit;
    BtnPesquisar: TButton;
    PnlBtnPesq: TPanel;
    BtnNovo: TButton;
    BtnDetalhar: TButton;
    BtnExcluir: TButton;
    DBGrid1: TDBGrid;
    EdtNome: TLabeledEdit;
    EdtEmail: TLabeledEdit;
    EdtDocumento: TLabeledEdit;
    PnlDadosPessoa: TPanel;
    PnlDadosEndereco: TPanel;
    EdtCEP: TLabeledEdit;
    EdtCidade: TLabeledEdit;
    EdtUF: TLabeledEdit;
    EdtLogradouro: TLabeledEdit;
    EdtBairro: TLabeledEdit;
    EdtNumero: TLabeledEdit;
    BtnPesqCEP: TButton;
    PnlBtnsCadastro: TPanel;
    BtnVoltar: TButton;
    BtnAlterar: TButton;
    BtnSalvar: TButton;
    ImageList1: TImageList;
    EdtCodigo: TLabeledEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnDetalharClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnPesqCEPClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure EdtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FOperacao : TOperacao;
    procedure Cadastrar;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarCliente;
    procedure Voltar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao: TOperacao);
    procedure LimparCampos;
    procedure RecarregarGrid;
    function ValidaCampos():Boolean;
    function ValidaCEP():Boolean;
    function ValidaEmail():Boolean;
    function ValidaNome():Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

{$R *.dfm}

uses uClienteModel;

procedure TFrmCadastroCliente.Alterar;
var
  oCliente: TCliente;
  oClienteController: TClienteController;
  sErro: string;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
  try
   with oCliente do
   begin
     ID := StrToIntDef(EdtCodigo.Text, 0);
     Nome := EdtNome.Text;
     Documento := EdtDocumento.Text;
     Email := EdtEmail.Text;
     CEP := EdtCEP.Text;
     UF := EdtUF.Text;
     Cidade := EdtCidade.Text;
     Logradouro := EdtLogradouro.Text;
     Bairro := EdtBairro.Text;
     Numero := EdtNumero.Text;
   end;
   if oClienteController.AlterarCliente(oCliente,sErro) = False then
    raise Exception.Create(sErro);
  finally
   FreeAndNil(oCliente);
   FreeAndNil(oClienteController);
  end;
end;

procedure TFrmCadastroCliente.BtnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TFrmCadastroCliente.BtnDetalharClick(Sender: TObject);
begin
  Detalhar;
  HabilitarControles(opNavegar);
end;

procedure TFrmCadastroCliente.BtnExcluirClick(Sender: TObject);
begin
  Excluir;
  RecarregarGrid;
end;


procedure TFrmCadastroCliente.BtnFecharClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFrmCadastroCliente.BtnNovoClick(Sender: TObject);
begin
 FOperacao:= opNovo;
 PgcPrincipal.ActivePage := tbDados;
 HabilitarControles(opNovo);
end;

procedure TFrmCadastroCliente.BtnPesqCEPClick(Sender: TObject);
begin
  inherited;
  var buscaCep := TBuscaCEP.Create;
  var dadosCep := buscaCep.EncontrarCep(EdtCEP.Text);
  EdtLogradouro.Text := dadosCep.logradouro;
  EdtCidade.Text := dadosCep.localidade;
  EdtBairro.Text :=dadosCep.bairro;
  EdtUF.Text := dadosCep.uf;
end;


procedure TFrmCadastroCliente.BtnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFrmCadastroCliente.BtnSalvarClick(Sender: TObject);
begin
  if ValidaCampos then
  begin
    Gravar;
    HabilitarControles(opNavegar);
    pgcPrincipal.ActivePage:= tbPesq;
    RecarregarGrid;
  end;
end;

procedure TFrmCadastroCliente.BtnVoltarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
  PgcPrincipal.ActivePage := tbPesq;
  LimparCampos();
end;

procedure TFrmCadastroCliente.Cadastrar;
begin
  FOperacao := opNovo;
  pgcPrincipal.ActivePage:= TbDados;

end;

procedure TFrmCadastroCliente.CarregarCliente;
var
  oCliente: TCliente;
  oClienteController: TClienteController;
begin
    oCliente := TCliente.Create;
    oClienteController := TClienteController.Create;
    try
       oClienteController.CarregarCliente(oCliente,DBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger);
       with oCliente do
       begin
         EdtCodigo.Text := ID.ToString;
         EdtNome.Text := Nome;
         EdtDocumento.Text := Documento;
         EdtEmail.Text := Email;
         EdtCEP.Text := CEP;
         EdtUF.Text := UF;
         EdtCidade.Text := Cidade;
         EdtLogradouro.Text := Logradouro;
         EdtBairro.Text := Bairro;
         EdtNumero.Text := Numero;
       end;
    finally
      FreeAndNil(oCliente);
      FreeAndNil(oClienteController);
    end;
end;

procedure TFrmCadastroCliente.Configuracoes;
begin
  tbPesq.TabVisible := False;
  TbDados.TabVisible := False;
  PgcPrincipal.ActivePage := tbPesq;
end;

procedure TFrmCadastroCliente.Detalhar;
begin
  FOperacao:= opNavegar;
  CarregarCliente;
  PgcPrincipal.ActivePage := tbDados;
end;

procedure TFrmCadastroCliente.EdtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    begin
      // Se não for um número, evita que seja inserido no campo
      Key := #0;
      MessageDlg('No campo Número são apenas aceitos números', mtInformation, [mbOK], 0);
    end;
end;

procedure TFrmCadastroCliente.Excluir;
var
 oClienteController : TClienteController;
 sErro: string;
begin
   oClienteController := TClienteController.Create;
   if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
    Abort;

   if oClienteController.ExcluirCliente(DBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger,sErro) = False then
     raise Exception.Create(sErro);


   FreeAndNil(oClienteController);
end;

procedure TFrmCadastroCliente.FormCreate(Sender: TObject);
var i: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
    begin
      if DBGrid1.Columns[i].Width > 150 then
        DBGrid1.Columns[i].Width := 85;
    end;
end;

procedure TFrmCadastroCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key= #13 then
   begin
     Key:= #0;
     Perform(WM_NEXTDLGCTL,0,0);
   end;

end;

procedure TFrmCadastroCliente.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TFrmCadastroCliente.Gravar;
 var
   DBConexao: TDmConexao;
begin
   DBConexao := TDmConexao.Create(nil);
  try
    case FOperacao of
      opNovo:
        begin
          Inserir;
        end;
      opAlterar:
        begin
          Alterar;
        end;
    end;
  finally
  end;
end;

procedure TFrmCadastroCliente.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of
    opNovo , opAlterar:
    begin
      EdtNome.Enabled := True;
      EdtDocumento.Enabled := True;
      EdtEmail.Enabled := True;
      EdtCEP.Enabled := True;
      EdtUF.Enabled := True;
      EdtCidade.Enabled := True;
      EdtLogradouro.Enabled := True;
      EdtBairro.Enabled := True;
      EdtNumero.Enabled := True;
      BtnFechar.Enabled := False;
      BtnVoltar.Enabled := True;
      BtnAlterar.Enabled := False;
      BtnSalvar.Enabled := True;
      BtnPesqCEP.Enabled := True;
    end;
    opNavegar:
    begin
      EdtNome.Enabled := False;
      EdtDocumento.Enabled := False;
      EdtEmail.Enabled := False;
      EdtCEP.Enabled := False;
      EdtUF.Enabled := False;
      EdtCidade.Enabled := False;
      EdtLogradouro.Enabled := False;
      EdtBairro.Enabled := False;
      EdtNumero.Enabled := False;
      BtnFechar.Enabled := True;
      BtnVoltar.Enabled := True;
      BtnAlterar.Enabled := True;
      BtnSalvar.Enabled := False;
       BtnPesqCEP.Enabled := False;
    end;
  end;
end;

procedure TFrmCadastroCliente.Inserir;
var
  oCliente : TCliente;
  oClienteController : TClienteController;
  sErro: string;
begin
  oCliente := TCliente.Create;
  try
    with oCliente do
    begin
     Nome := EdtNome.Text;
     Documento := EdtDocumento.Text;
     Email := EdtEmail.Text;
     CEP := EdtCEP.Text;
     UF := EdtUF.Text;
     Logradouro := EdtLogradouro.Text;
     Bairro := EdtBairro.Text;
     Numero := EdtNumero.Text;
    end;
    oClienteController.InserirCliente(oCliente,sErro);
  finally
    FreeAndNil(oClienteController);
    FreeAndNil(oCliente);
  end;
end;

procedure TFrmCadastroCliente.LimparCampos;
begin
  EdtNome.Text := EmptyStr;
  EdtDocumento.Text := EmptyStr;
  EdtEmail.Text := EmptyStr;
  EdtCEP.Text := EmptyStr;
  EdtUF.Text := EmptyStr;
  EdtLogradouro.Text := EmptyStr;
  EdtBairro.Text := EmptyStr;
  EdtNumero.Text := EmptyStr;
  EdtCidade.Text := EmptyStr;
end;

procedure TFrmCadastroCliente.Pesquisar;
var
  oClienteController : TClienteController;
begin

end;

procedure TFrmCadastroCliente.RecarregarGrid;
begin
  DBGrid1.DataSource.DataSet.Close;
  DBGrid1.DataSource.DataSet.Open;
end;

function TFrmCadastroCliente.ValidaCampos: Boolean;
begin
  Result := False;

  if not ValidaNome then
    begin
       ShowMessage('Nome inválido');
       Exit;
    end;
  if not ValidaEmail then
    begin
      ShowMessage('E-mail inválido');
      Exit;
    end;

  // Valida o CEP
  if not ValidaCEP then
  begin
    ShowMessage('CEP inválido');
    Exit;
  end;

  Result := True;
end;

function TFrmCadastroCliente.ValidaCEP: Boolean;
begin

end;

function TFrmCadastroCliente.ValidaEmail: Boolean;
const
  EmailRegex = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
begin
  Result := TRegEx.IsMatch(EdtEmail.Text, EmailRegex);
end;


function TFrmCadastroCliente.ValidaNome: Boolean;
begin
  if EdtNome.Text = EmptyStr then
      Result := False;
end;

procedure TFrmCadastroCliente.Voltar;
begin
   PgcPrincipal.ActivePage := tbPesq;
end;

end.
