unit uCadVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StyledDbNavigator, uFuncoes, ACBrBase, ACBrSocket, ACBrCEP,
  Vcl.StyledTaskDialog, Data.DB, uVendedorController;

type
  TfrmCadVendedores = class(TForm)
    pnlTopbar: TPanel;
    dbNavCadastro: TStyledDbNavigator;
    pnlDados: TPanel;
    DBText1: TDBText;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNMVendedor: TDBEdit;
    edtCEP: TDBEdit;
    edtCidade: TDBEdit;
    edtUF: TDBEdit;
    pnlBotoes: TPanel;
    btnCancelar: TStyledGraphicButton;
    btnExcluir: TStyledGraphicButton;
    btnGravar: TStyledGraphicButton;
    Label7: TLabel;
    Label8: TLabel;
    edtEndereco: TDBEdit;
    edtNumero: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtBairro: TDBEdit;
    edtComplemento: TDBEdit;
    Label11: TLabel;
    edtSenha: TDBEdit;
    ACBrCEP: TACBrCEP;
    msgError: TStyledTaskDialog;
    dlgQuestion: TStyledTaskDialog;
    dlgOK: TStyledTaskDialog;
    dlgWarning: TStyledTaskDialog;
    dlgError: TStyledTaskDialog;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCEPExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CloseForm;
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    var
      SenhaAntiga: String;
  public
    { Public declarations }
  end;

var
  frmCadVendedores: TfrmCadVendedores;
  Funcoes: TFuncoes;

implementation

{$R *.dfm}

uses uDmDados, uVendedores;

procedure TfrmCadVendedores.btnCancelarClick(Sender: TObject);
begin
  CloseForm;
end;

procedure TfrmCadVendedores.btnExcluirClick(Sender: TObject);
var
  Vendedor : TVendedorController;
  RetornoExclusaoVendedor : TArray<String>;
begin
  Vendedor := TVendedorController.Create;
  Try
    try
      RetornoExclusaoVendedor := Vendedor.ExcluirVendedor(dmDados.ClientDataSetCadastroVendedores.FieldByName('ID_Vendedor').AsInteger)
    finally
      if (RetornoExclusaoVendedor[0] = 'RESTRITO') then
      begin
        dlgWarning.Text := RetornoExclusaoVendedor[1];
        dlgWarning.Execute;
      end
      else if (RetornoExclusaoVendedor[0] = 'OK') then
      begin
        dlgOK.Text := RetornoExclusaoVendedor[1];
        dlgOK.Execute;
      end;
    end;
  except on E: Exception do
    begin
      dlgError.Text := 'Erro na Exclusão do Vendedor. Contactar Suporte Técnico!';
      dlgError.Execute;
    end;
  End;
end;

procedure TfrmCadVendedores.btnGravarClick(Sender: TObject);
begin
  if (edtSenha.Text = '') then
  begin
    Showmessage(Funcoes.MensagemAlerta('SENHA'));
    edtSenha.SetFocus;
    Abort;
  end;

  dmDados.ClientDataSetCadastroVendedores.Post;
end;

procedure TfrmCadVendedores.edtCEPExit(Sender: TObject);
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

procedure TfrmCadVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseForm;
end;

procedure TfrmCadVendedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    CloseForm;
  end;
end;

procedure TfrmCadVendedores.CloseForm;
begin
  if (dmDados.dsoCadastroVendedores.State in [dsInsert]) then
  begin
    dlgQuestion.Text := 'Deseja sair e cancelar o cadastro em andamento?';
    dlgQuestion.Execute;

    if dlgQuestion.ModalResult = mrOk then
    begin
      dmDados.ClientDataSetCadastroVendedores.Cancel;
      if (frmVendedores = nil) then
      begin
        dmDados.ClientDataSetCadastroVendedores.Close;
        dmDados.qryCadastroVendedores.Close;
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
    if (frmVendedores = nil) then
    begin
      dmDados.ClientDataSetCadastroVendedores.Close;
      dmDados.qryCadastroVendedores.Close;
    end;
    Close;
  end;
end;

end.
