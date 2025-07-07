unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.StyledDbNavigator, Vcl.StyledButton,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.StyledTaskDialog, uProdutoController;

type
  TfrmCadProdutos = class(TForm)
    pnlTopbar: TPanel;
    dbNavCadastro: TStyledDbNavigator;
    pnlDados: TPanel;
    pnlBotoes: TPanel;
    btnCancelar: TStyledGraphicButton;
    DBText1: TDBText;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNMProduto: TDBEdit;
    edtDescricao: TDBEdit;
    edtVLCusto: TDBEdit;
    edtVLVenda: TDBEdit;
    edtQTEstoque: TDBEdit;
    btnExcluir: TStyledGraphicButton;
    btnGravar: TStyledGraphicButton;
    dlgQuestion: TStyledTaskDialog;
    dlgWarning: TStyledTaskDialog;
    dlgOK: TStyledTaskDialog;
    dlgError: TStyledTaskDialog;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CloseForm;
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

uses uDmDados, uProdutos;

procedure TfrmCadProdutos.btnCancelarClick(Sender: TObject);
begin
  CloseForm;
end;

procedure TfrmCadProdutos.btnExcluirClick(Sender: TObject);
var
  Produto : TProdutoController;
  RetornoExclusaoProduto : TArray<String>;
begin
  Produto := TProdutoController.Create;
  Try
    try
      RetornoExclusaoProduto := Produto.ExcluirProduto(dmDados.ClientDataSetCadastroProdutos.FieldByName('ID_Produto').AsInteger)
    finally
      if (RetornoExclusaoproduto[0] = 'RESTRITO') then
      begin
        dlgWarning.Text := RetornoExclusaoProduto[1];
        dlgWarning.Execute;
      end
      else if (RetornoExclusaoproduto[0] = 'OK') then
      begin
        dlgOK.Text := RetornoExclusaoProduto[1];
        dlgOK.Execute;
      end;
    end;
  except on E: Exception do
    begin
      dlgError.Text := 'Erro na Exclusão do produto. Contactar Suporte Técnico!';
      dlgError.Execute;
    end;
  End;
end;

procedure TfrmCadProdutos.btnGravarClick(Sender: TObject);
begin
  dmDados.ClientDataSetCadastroProdutos.Post;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseForm;
end;

procedure TfrmCadProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    CloseForm;
  end;
end;

procedure TfrmCadProdutos.CloseForm;
begin
  if (dmDados.dsoCadastroProdutos.State in [dsInsert]) then
  begin
    dlgQuestion.Text := 'Deseja sair e cancelar o cadastro em andamento?';
    dlgQuestion.Execute;

    if dlgQuestion.ModalResult = mrOk then
    begin
      dmDados.ClientDataSetCadastroProdutos.Cancel;
      if (frmProdutos = nil) then
      begin
        dmDados.ClientDataSetCadastroProdutos.Close;
        dmDados.qryCadastroProdutos.Close;
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
    if (frmProdutos = nil) then
    begin
      dmDados.ClientDataSetCadastroProdutos.Close;
      dmDados.qryCadastroProdutos.Close;
    end;
    Close;
  end;
end;

end.
