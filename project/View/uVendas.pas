unit uVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, System.Math, Vcl.ButtonStylesAttributes,
  Vcl.StyledTaskDialog, DateUtils, uProdutoController, frxSmartMemo, frxClass,
   uVendaController, frxPDFViewer, frxDBSet, frCoreClasses, frxTableObject,
  Vcl.StyledButton;

type
  TfrmVendas = class(TForm)
    Panel1: TPanel;
    lbltxtVendedor: TLabel;
    lblVendedor: TLabel;
    Timer1: TTimer;
    lblDataHora: TLabel;
    dbgItensVenda: TDBGrid;
    GroupBox1: TGroupBox;
    rdgFormaPagamento: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblAcrescimo: TLabel;
    lblSubTotal: TLabel;
    lblDesconto: TLabel;
    lblTotal: TLabel;
    btnEncerrarVenda: TSpeedButton;
    btnConcederDesconto: TSpeedButton;
    btnAdicionarItem: TSpeedButton;
    btnExcluirItem: TSpeedButton;
    btnControle: TButton;
    btnConsultarVendas: TSpeedButton;
    dlgQuestion: TStyledTaskDialog;
    dlgError: TStyledTaskDialog;
    dlgWarning: TStyledTaskDialog;
    dlgOK: TStyledTaskDialog;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    btnIdentificarCliente: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblIDCLIENTE: TLabel;
    lblNMCliente: TLabel;
    lblCEP: TLabel;
    lblENDERECO: TLabel;
    lblNUMERO: TLabel;
    lblBAIRRO: TLabel;
    lblCOMPLEMENTO: TLabel;
    lblCIDADE: TLabel;
    lblUF: TLabel;
    lblTxtNumVenda: TLabel;
    lblNumVenda: TLabel;
    lblTxtDtVenda: TLabel;
    lblDtvenda: TLabel;
    dbImprimeVenda: TfrxDBDataset;
    dbImprimetensVenda: TfrxDBDataset;
    frxImprimirVenda: TfrxReport;
    btnImprimir: TStyledGraphicButton;
    procedure Timer1Timer(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure CalculaSubtotal(VL: Currency);
    procedure CalculaDesconto(VL: Currency);
    procedure CalculaAcrescimo(VL: Currency);
    procedure CalculaTotal;
    procedure rdgFormaPagamentoClick(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure btnConcederDescontoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEncerrarVendaClick(Sender: TObject);
    procedure ResetVenda;
    procedure btnConsultarVendasClick(Sender: TObject);
    procedure btnIdentificarClienteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ImprimirVenda(ID_Venda: Integer; Report: TFrxReport);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TP_Forma_Pagamento: string;
    ID_Vendedor: Integer;
    ID_Cliente: Integer;
    ID_Venda_Imp: integer;
    PE_Desconto, PE_Acrescimo: Float32;
    VL_Desconto, VL_Acrescimo, VL_Sub_Total, VL_Total: Currency;
    ST_Venda: String; //V = Vendendo , C = Consultando venda
    procedure DesativaControles;
    procedure IdentificarCliente(ID_Cliente_Ident: Integer);
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

uses uProdutos, uDmDados, uDesconto, uConsultaVendas, uClientes, uPrincipal;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.qryCadastroClientes.Close;
  dmDados.qryCadastroProdutos.Close;
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  dmDados.fdmItensVenda.Close;
  dmDados.fdmItensVenda.CreateDataSet;

  TP_Forma_Pagamento := 'D';

  rdgFormaPagamento.Enabled := False;

  btnExcluirItem.Enabled := False;
  btnConcederDesconto.Enabled := False;
  btnEncerrarVenda.Enabled := False;

  lblTxtNumVenda.Visible := False;
  lblNumVenda.Visible := False;

  lblTxtDTVenda.Visible := False;
  lblDTVenda.Visible := False;

  btnImprimir.Visible := False;

  lblIDCLIENTE.Caption   := 'Aguardando Identificação...';
  lblNMCLIENTE.Caption   := '...';
  lblCEP.Caption         := '...';
  lblENDERECO.Caption    := '...';
  lblNUMERO.Caption      := '...';
  lblBAIRRO.Caption      := '...';
  lblCOMPLEMENTO.Caption := '...';
  lblCIDADE.Caption      := '...';
  lblUF.Caption          := '...';
end;

procedure TfrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    Close;
  end;

  if (Key = VK_F1 ) then
  begin
    btnIdentificarCliente.Click;
  end;

  if (Key = VK_F2 ) then
  begin
    btnConsultarVendas.Click;
  end;

  if (Key = VK_F3 ) then
  begin
    btnAdicionarItem.Click;
  end;

  if (Key = VK_F4 ) then
  begin
    btnExcluirItem.Click;
  end;

  if (Key = VK_F5 ) then
  begin
    btnConcederDesconto.Click;
  end;

  if (Key = VK_F6 ) then
  begin
    btnEncerrarVenda.Click;
  end;

   if (Key = VK_F7 ) then
  begin
    btnImprimir.Click;
  end;
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
  if (ST_Venda = 'V') then
  begin
    lblVendedor.Caption := IntToStr(frmPrincipal.ID_Vendedor) + ' - ' + frmPrincipal.NM_Vendedor;
  end;
end;

procedure TfrmVendas.Panel1DblClick(Sender: TObject);
begin
  Showmessage(Floattostr(PE_Desconto));
end;

procedure TfrmVendas.rdgFormaPagamentoClick(Sender: TObject);
begin
  case rdgFormaPagamento.ItemIndex of
    0 : TP_Forma_Pagamento := 'D';
    1 : TP_Forma_Pagamento := 'C';
  end;

  if (TP_Forma_Pagamento = 'D') then
  begin
    PE_Acrescimo := 0;
  end
  else if (TP_Forma_Pagamento = 'C') then
  begin
    PE_Acrescimo := 10;
  end;

  if (ST_Venda = 'V') then
  begin
    CalculaAcrescimo(((PE_Acrescimo / 100) * (VL_Sub_Total - VL_Desconto )));
  end;
end;

procedure TfrmVendas.btnAdicionarItemClick(Sender: TObject);
begin
  Application.CreateForm(TfrmProdutos, frmProdutos);
  try
    frmProdutos.ST_Produto := 'A';
    frmProdutos.ShowModal;
  finally
    frmProdutos.Free;
  end;
end;

procedure TfrmVendas.btnConcederDescontoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmDesconto, frmDesconto);
  try
    frmDesconto.edtDesconto.Text := FormatFloat('#,##0.00',VL_Desconto);
    frmDesconto.ShowModal;
  finally
    frmDesconto.Free;
  end;
end;

procedure TfrmVendas.btnConsultarVendasClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaVendas, frmConsultaVendas);
  try
    frmConsultaVendas.ShowModal;
  finally
    frmConsultaVendas.Free;
  end;
end;

procedure TfrmVendas.btnEncerrarVendaClick(Sender: TObject);
var
  ID_VENDA: Integer;
  ID_Produto: Integer;
  QT_ITEM: Integer;
  VL_UNITARIO: Currency;
  VL_TOTAL_ITEM: Currency;
  Produto: TProdutoController;
begin
  try
    if (ID_Cliente <= 0) then
    begin
      try
        dlgWarning.Text := 'Cliente não identificado. Favor fazer a identificação antes de prosseguir!';
        dlgWarning.Execute;
      Finally
        btnIdentificarCliente.Click;
      End;
    end;

    try
      dmdados.stpGravaVendas.Params.ParamByName('ID_VENDEDOR').Value          := frmPrincipal.ID_Vendedor;
      dmdados.stpGravaVendas.Params.ParamByName('VL_SUB_TOTAL').Value         := VL_Sub_Total;
      dmdados.stpGravaVendas.Params.ParamByName('VL_DESCONTO').Value          := VL_Desconto;
      dmdados.stpGravaVendas.Params.ParamByName('VL_ACRESCIMO').Value         := VL_Acrescimo;
      dmdados.stpGravaVendas.Params.ParamByName('VL_TOTAL').Value             := VL_Total;
      dmdados.stpGravaVendas.Params.ParamByName('PE_DESCONTO').Value          := PE_Desconto;
      dmdados.stpGravaVendas.Params.ParamByName('PE_ACRESCIMO').Value         := PE_Acrescimo;
      dmdados.stpGravaVendas.Params.ParamByName('ID_CLIENTE').Value           := ID_Cliente;
      dmdados.stpGravaVendas.Params.ParamByName('TP_FORMA_PAGAMENTO').Value   := TP_Forma_Pagamento;
      dmdados.stpGravaVendas.Execproc;
    finally
      try
        ID_Venda := dmdados.stpGravaVendas.Params.ParamByName('ID_VENDA_OUT').Value;
        ID_Venda_Imp := ID_Venda;

        dmDados.fdmItensVenda.First;
        While not dmDados.fdmItensVenda.Eof do
        begin
          ID_Produto    := dmDados.fdmItensVenda.FieldByName('ID_Produto').AsInteger;
          QT_ITEM       := dmDados.fdmItensVenda.FieldByName('QT_Item_Venda').AsInteger;
          VL_UNITARIO   := dmDados.fdmItensVenda.FieldByName('VL_venda').AsCurrency;
          VL_TOTAL_ITEM := dmDados.fdmItensVenda.FieldByName('VL_Total_Item').AsCurrency;

          try
            dmdados.stpGravaitensVenda.Params.ParamByName('ID_VENDA').Value      := ID_Venda;
            dmdados.stpGravaitensVenda.Params.ParamByName('ID_PRODUTO').Value    := ID_Produto;
            dmdados.stpGravaitensVenda.Params.ParamByName('QT_ITEM').Value       := QT_ITEM;
            dmdados.stpGravaitensVenda.Params.ParamByName('VL_UNITARIO').Value   := VL_UNITARIO;
            dmdados.stpGravaitensVenda.Params.ParamByName('VL_TOTAL_ITEM').Value := VL_TOTAL_ITEM;
            dmDados.stpGravaItensVenda.ExecProc;
          finally
            Produto := TProdutoController.Create;
            try
              Produto.BaixarEstoque(ID_Produto, QT_Item);
            finally
              Produto.Free;
            end;
          end;
          dmDados.fdmItensVenda.Next;
        end;
      finally
        dlgOK.Text := 'Venda Gravada com sucesso!';
        dlgOK.Execute;

        if (dlgOK.ModalResult = mrOK) then
        begin
          ImprimirVenda(ID_Venda, frxImprimirvenda);
        end;

        dlgQuestion.Text := 'Deseja continuar Realizando Vendas?';
        dlgQuestion.Execute;

        if (dlgQuestion.ModalResult = mrOK) then
        begin
          ResetVenda;
        end
        else if (dlgQuestion.ModalResult = mrCancel) then
        begin
          Close;
        end;
      end;
    end;

  except on E: Exception do
    begin
      dlgError.Text := 'Erro na gravação da venda. Confira os dados fornecidos!';
      dlgError.Execute;
    end;
  end;
end;

procedure TfrmVendas.btnExcluirItemClick(Sender: TObject);
begin
  try
    if (dmDados.fdmItensvenda.RecNo > 0) then
    begin
      if not (dmDados.fdmItensvenda.IsEmpty) then
      begin
        dmDados.fdmItensvenda.Delete;
      end;
    end;
  finally
    btnControle.Click;
    dbgItensVenda.SetFocus;
  end;
end;

procedure TfrmVendas.btnIdentificarClienteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmClientes, frmClientes);
  try
    frmClientes.ST_Cliente := 'A';
    frmClientes.ShowModal;
  finally
    frmClientes.Free;
  end;
end;

procedure TfrmVendas.btnImprimirClick(Sender: TObject);
begin
  ImprimirVenda(ID_Venda_Imp, frxImprimirVenda);
end;

procedure TfrmVendas.Timer1Timer(Sender: TObject);
begin
  lblDataHora.Caption := FormatDateTime('hh:mm:ss',Now);
end;

procedure TfrmVendas.CalculaSubtotal(VL: Currency);
begin
  VL_Sub_Total := VL_Sub_Total + VL;
  lblSubtotal.Caption := FormatCurr('R$ #,##0.00', VL_Sub_Total);
  CalculaTotal;
end;

procedure TfrmVendas.CalculaDesconto(VL: Currency);
begin
  VL_Desconto := VL;
  lblDesconto.Caption := FormatCurr('R$ #,##0.00', VL_Desconto);

  PE_Desconto := RoundTo((VL_Desconto / VL_Sub_Total) * 100, -4);

  CalculaTotal;
end;

procedure TfrmVendas.CalculaAcrescimo(VL: Currency);
begin
  VL_Acrescimo := VL;
  lblAcrescimo.Caption := FormatCurr('R$ #,##0.00', VL_Acrescimo);
  CalculaTotal;
end;

procedure TfrmVendas.CalculaTotal;
begin
  VL_Total := (VL_Sub_Total - VL_Desconto) + VL_Acrescimo;
  lblTotal.Caption := FormatCurr('R$ #,##0.00', VL_Total);
end;

procedure TfrmVendas.ResetVenda;
begin
  dmDados.fdmItensVenda.EmptyDataSet;
  VL_Sub_Total := 0;
  VL_Desconto := 0;
  VL_Acrescimo := 0;
  VL_Total := 0;

  rdgFormaPagamento.ItemIndex := 0;
  rdgFormaPagamento.Enabled := False;

  lblSubTotal.Caption := 'R$ 0,00';
  lblAcrescimo.Caption:= 'R$ 0,00';
  lblDesconto.Caption := 'R$ 0,00';
  lblTotal.Caption := 'R$ 0,00';

  btnExcluirItem.Enabled := False;
  btnConcederDesconto.Enabled := False;
  btnEncerrarvenda.Enabled := False;
end;

procedure TfrmVendas.DesativaControles;
begin
  dbgItensVenda.Enabled := False;
  rdgFormaPagamento.Enabled := False;
  btnIdentificarCliente.Enabled := False;
  btnConsultarVendas.Enabled := False;
  btnAdicionaritem.Enabled := False;
  btnExcluirItem.Enabled := False;
  btnConcederDesconto.Enabled := False;
  btnEncerrarvenda.Enabled := False;
end;

procedure Tfrmvendas.IdentificarCliente(ID_Cliente_Ident: Integer);
var
  NM_Cliente, CEP, Endereco, Bairro, Complemento, Cidade, UF: String;
  Numero: Integer;
begin
  if not (dmDados.qryCadastroClientes.Active) then
  begin
    dmDados.qryCadastroClientes.Open;
    dmDados.ClientDataSetCadastroClientes.Open;
  end;

  dmDados.qryCadastroClientes.Locate('ID_CLIENTE', ID_Cliente_Ident, []);

  NM_Cliente  := dmDados.dsoCadastroClientes.DataSet.FieldByName('NM_CLIENTE').AsString;
  CEP         := dmDados.dsoCadastroClientes.DataSet.FieldByName('CEP').AsString;
  Endereco    := dmDados.dsoCadastroClientes.DataSet.FieldByName('ENDERECO').AsString;
  Numero      := dmDados.dsoCadastroClientes.DataSet.FieldByName('NUMERO').AsInteger;
  Bairro      := dmDados.dsoCadastroClientes.DataSet.FieldByName('BAIRRO').AsString;
  Complemento := dmDados.dsoCadastroClientes.DataSet.FieldByName('COMPLEMENTO').AsString;
  Cidade      := dmDados.dsoCadastroClientes.DataSet.FieldByName('CIDADE').AsString;
  UF          := dmDados.dsoCadastroClientes.DataSet.FieldByName('UF').AsString;

  frmVendas.lblIDCLIENTE.Caption   := IntToStr(ID_Cliente_Ident);
  frmVendas.lblNMCLIENTE.Caption   := NM_Cliente;
  frmVendas.lblCEP.Caption         := CEP;
  frmVendas.lblENDERECO.Caption    := Endereco;
  frmVendas.lblNUMERO.Caption      := IntToStr(Numero);
  frmVendas.lblBAIRRO.Caption      := Bairro;
  frmVendas.lblCOMPLEMENTO.Caption := Complemento;
  frmVendas.lblCIDADE.Caption      := Cidade;
  frmVendas.lblUF.Caption          := UF;
end;

procedure TFrmVendas.ImprimirVenda(ID_Venda: Integer; Report: TFrxReport);
var
  Venda : TVendaController;
begin
  Venda := TVendaController.Create;
  Try
    Try
      Venda.ImprimirVenda(ID_Venda, Report);
    except on E: Exception do
      begin
        dlgError.Text := 'Erro na impresso da venda. ~Contactar o Suporte!';
        dlgError.Execute;
      end;
    end;
  Finally
    Venda.Free;
  End;
end;

end.
