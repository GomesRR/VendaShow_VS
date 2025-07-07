unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes, ACBrBase,
  ACBrSocket, ACBrCEP, Vcl.StyledTaskDialog, Vcl.StyledButton,
  Vcl.StyledDbNavigator, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, uClienteController;

type
  TfrmCadClientes = class(TForm)
    pnlDados: TPanel;
    DBText1: TDBText;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtNMCliente: TDBEdit;
    edtCEP: TDBEdit;
    edtCidade: TDBEdit;
    edtUF: TDBEdit;
    edtEndereco: TDBEdit;
    edtNumero: TDBEdit;
    edtBairro: TDBEdit;
    edtComplemento: TDBEdit;
    pnlTopbar: TPanel;
    dbNavCadastro: TStyledDbNavigator;
    pnlBotoes: TPanel;
    btnCancelar: TStyledGraphicButton;
    btnExcluir: TStyledGraphicButton;
    btnGravar: TStyledGraphicButton;
    msgError: TStyledTaskDialog;
    ACBrCEP: TACBrCEP;
    dlgQuestion: TStyledTaskDialog;
    dlgError: TStyledTaskDialog;
    dlgWarning: TStyledTaskDialog;
    dlgOK: TStyledTaskDialog;
    procedure edtCEPExit(Sender: TObject);
    procedure CloseForm;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

uses uDmDados, uClientes;

procedure TfrmCadClientes.edtCEPExit(Sender: TObject);
begin
  if (Trim(edtCEP.Text) <> '') then
  begin
    ACBrCEP.BuscarPorCEP(edtCEP.Text);

    if (ACBrCEP.Enderecos.Count > 0) then
    begin
      edtEndereco.Text := ACBrCEP.Enderecos[0].Logradouro;
      edtbairro.Text := ACBrCEP.Enderecos[0].Bairro;
      edtCidade.Text := ACBrCEP.Enderecos[0].Municipio;
      edtUF.Text := ACBrCEP.Enderecos[0].UF;

      edtNumero.SetFocus;
    end
    else
    begin
      msgError.Text := 'O CEP informado é inválido. Verifique e tente novamente!';
      edtCEP.SetFocus;
      edtCEp.SelectAll;
      Exit;
    end;
  end;
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseForm;
end;

procedure TfrmCadClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    CloseForm;
  end;
end;

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin
  CloseForm;
end;

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
var
  Cliente : TClienteController;
  RetornoExclusaoCliente : TArray<String>;
begin
  Cliente := TClienteController.Create;
  Try
    try
      RetornoExclusaoCliente := Cliente.ExcluirCliente(dmDados.ClientDataSetCadastroClientes.FieldByName('ID_Cliente').AsInteger)
    finally
      if (RetornoExclusaoCliente[0] = 'RESTRITO') then
      begin
        dlgWarning.Text := RetornoExclusaoCliente[1];
        dlgWarning.Execute;
      end
      else if (RetornoExclusaoCliente[0] = 'OK') then
      begin
        dlgOK.Text := RetornoExclusaoCliente[1];
        dlgOK.Execute;
      end;
    end;
  except on E: Exception do
    begin
      dlgError.Text := 'Erro na Exclusão do Cliente. Contactar Suporte Técnico!';
      dlgError.Execute;
    end;
  End;

end;

procedure TfrmCadClientes.btnGravarClick(Sender: TObject);
begin
  if (dmDados.dsoCadastroClientes.State in [dsInsert, dsEdit]) then
  begin
    dmDados.ClientDataSetCadastroClientes.Post;
  end;
end;

procedure TfrmCadClientes.CloseForm;
begin
  if (dmDados.dsoCadastroClientes.State in [dsInsert]) then
  begin
    dlgQuestion.Text := 'Deseja sair e cancelar o cadastro em andamento?';
    dlgQuestion.Execute;

    if dlgQuestion.ModalResult = mrOk then
    begin
      dmDados.ClientDataSetCadastroClientes.Cancel;
      if (frmClientes = nil) then
      begin
        dmDados.ClientDataSetCadastroClientes.Close;
        dmDados.qryCadastroClientes.Close;
      end;
      Close;
    end
    else if (dlgQuestion.ModalResult = mrCancel) then
    begin
      Abort;
    end;
  end
  else
  begin
    if (frmClientes = nil) then
    begin
      dmDados.ClientDataSetCadastroClientes.Close;
      dmDados.qryCadastroClientes.Close;
    end;
    Close;
  end;
end;

end.
