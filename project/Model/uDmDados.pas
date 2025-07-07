unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  Data.DBXFirebird, Data.SqlExpr, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Stan.StorageBin, vcl.Dialogs;

type
  TdmDados = class(TDataModule)
    SQLConnection1: TSQLConnection;
    dsoCadastroProdutos: TDataSource;
    qryCadastroProdutos: TSQLQuery;
    qryCadastroProdutosID_PRODUTO: TIntegerField;
    qryCadastroProdutosNM_PRODUTO: TWideStringField;
    qryCadastroProdutosDESCRICAO: TWideStringField;
    qryCadastroProdutosVL_VENDA: TFMTBCDField;
    qryCadastroProdutosVL_COMPRA: TFMTBCDField;
    qryCadastroProdutosQT_ESTOQUE: TIntegerField;
    qryCadastroProdutosSN_ATIVO: TWideStringField;
    DataSetProviderCadastroProdutos: TDataSetProvider;
    ClientDataSetCadastroProdutos: TClientDataSet;
    ClientDataSetCadastroProdutosID_PRODUTO: TIntegerField;
    ClientDataSetCadastroProdutosNM_PRODUTO: TWideStringField;
    ClientDataSetCadastroProdutosDESCRICAO: TWideStringField;
    ClientDataSetCadastroProdutosVL_VENDA: TFMTBCDField;
    ClientDataSetCadastroProdutosVL_COMPRA: TFMTBCDField;
    ClientDataSetCadastroProdutosQT_ESTOQUE: TIntegerField;
    ClientDataSetCadastroProdutosSN_ATIVO: TWideStringField;
    qryValidaExistenciaVenda: TSQLQuery;
    dsoCadastroVendedores: TDataSource;
    qryCadastroVendedores: TSQLQuery;
    DataSetProviderCadastroVendedores: TDataSetProvider;
    ClientDataSetCadastroVendedores: TClientDataSet;
    qryCadastroVendedoresID_VENDEDOR: TIntegerField;
    qryCadastroVendedoresNM_VENDEDOR: TWideStringField;
    qryCadastroVendedoresCEP: TWideStringField;
    qryCadastroVendedoresENDERECO: TWideStringField;
    qryCadastroVendedoresBAIRRO: TWideStringField;
    qryCadastroVendedoresCOMPLEMENTO: TWideStringField;
    qryCadastroVendedoresCIDADE: TWideStringField;
    qryCadastroVendedoresUF: TWideStringField;
    qryCadastroVendedoresSENHA: TWideStringField;
    qryCadastroVendedoresNUMERO: TIntegerField;
    ClientDataSetCadastroVendedoresID_VENDEDOR: TIntegerField;
    ClientDataSetCadastroVendedoresNM_VENDEDOR: TWideStringField;
    ClientDataSetCadastroVendedoresCEP: TWideStringField;
    ClientDataSetCadastroVendedoresENDERECO: TWideStringField;
    ClientDataSetCadastroVendedoresBAIRRO: TWideStringField;
    ClientDataSetCadastroVendedoresCOMPLEMENTO: TWideStringField;
    ClientDataSetCadastroVendedoresCIDADE: TWideStringField;
    ClientDataSetCadastroVendedoresUF: TWideStringField;
    ClientDataSetCadastroVendedoresSENHA: TWideStringField;
    ClientDataSetCadastroVendedoresNUMERO: TIntegerField;
    fdmItensVenda: TFDMemTable;
    dsoItensVenda: TDataSource;
    fdmItensVendaID_Item: TIntegerField;
    fdmItensVendaID_Produto: TIntegerField;
    fdmItensVendaQT_Item_Venda: TIntegerField;
    fdmItensVendaDescricao: TStringField;
    fdmItensVendaVL_Venda: TFloatField;
    fdmItensVendaVL_Total_Item: TFloatField;
    stpGravaVendas: TSQLStoredProc;
    stpGravaItensVenda: TSQLStoredProc;
    qryVendas: TSQLQuery;
    dsoVendas: TDataSource;
    DataSetProviderVendas: TDataSetProvider;
    ClientDataSetVendas: TClientDataSet;
    qryVendasID_VENDA: TIntegerField;
    qryVendasVL_TOTAL: TFMTBCDField;
    ClientDataSetVendasID_VENDA: TIntegerField;
    ClientDataSetVendasVL_TOTAL: TFMTBCDField;
    qryVendasDT_VENDA: TSQLTimeStampField;
    ClientDataSetVendasDT_VENDA: TSQLTimeStampField;
    qryVendasNM_VENDEDOR: TWideStringField;
    ClientDataSetVendasNM_VENDEDOR: TWideStringField;
    dsoCadastroClientes: TDataSource;
    qryCadastroClientes: TSQLQuery;
    DataSetProviderCadastroClientes: TDataSetProvider;
    ClientDataSetCadastroClientes: TClientDataSet;
    qryCadastroClientesNM_CLIENTE: TWideStringField;
    qryCadastroClientesCEP: TWideStringField;
    qryCadastroClientesENDERECO: TWideStringField;
    qryCadastroClientesNUMERO: TIntegerField;
    qryCadastroClientesBAIRRO: TWideStringField;
    qryCadastroClientesCOMPLEMENTO: TWideStringField;
    qryCadastroClientesCIDADE: TWideStringField;
    qryCadastroClientesUF: TWideStringField;
    ClientDataSetCadastroClientesID_CLIENTE: TIntegerField;
    ClientDataSetCadastroClientesNM_CLIENTE: TWideStringField;
    ClientDataSetCadastroClientesCEP: TWideStringField;
    ClientDataSetCadastroClientesENDERECO: TWideStringField;
    ClientDataSetCadastroClientesNUMERO: TIntegerField;
    ClientDataSetCadastroClientesBAIRRO: TWideStringField;
    ClientDataSetCadastroClientesCOMPLEMENTO: TWideStringField;
    ClientDataSetCadastroClientesCIDADE: TWideStringField;
    ClientDataSetCadastroClientesUF: TWideStringField;
    qryCadastroClientesID_CLIENTE: TIntegerField;
    qryVendasID_VENDEDOR: TIntegerField;
    ClientDataSetVendasID_VENDEDOR: TIntegerField;
    qryVendasID_CLIENTE: TIntegerField;
    ClientDataSetVendasID_CLIENTE: TIntegerField;
    qryVendasVL_SUB_TOTAL: TFMTBCDField;
    qryVendasVL_ACRESCIMO: TFMTBCDField;
    qryVendasVL_DESCONTO: TFMTBCDField;
    ClientDataSetVendasVL_SUB_TOTAL: TFMTBCDField;
    ClientDataSetVendasVL_ACRESCIMO: TFMTBCDField;
    ClientDataSetVendasVL_DESCONTO: TFMTBCDField;
    qryVendasTP_FORMA_PAGAMENTO: TWideStringField;
    ClientDataSetVendasTP_FORMA_PAGAMENTO: TWideStringField;
    qryItensVenda: TSQLQuery;
    qryItensVendaID_ITEM_VENDA: TIntegerField;
    qryItensVendaID_VENDA: TIntegerField;
    qryItensVendaQT_ITEM: TIntegerField;
    qryItensVendaVL_UNITARIO: TFMTBCDField;
    qryItensVendaVL_TOTAL_ITEM: TFMTBCDField;
    qryItensVendaID_PRODUTO: TIntegerField;
    qryItensVendaDESCRICAO: TWideStringField;
    qryLogin: TSQLQuery;
    qryLoginID_VENDEDOR: TIntegerField;
    qryLoginNM_VENDEDOR: TWideStringField;
    qryLoginCEP: TWideStringField;
    qryLoginENDERECO: TWideStringField;
    qryLoginBAIRRO: TWideStringField;
    qryLoginCOMPLEMENTO: TWideStringField;
    qryLoginCIDADE: TWideStringField;
    qryLoginUF: TWideStringField;
    qryLoginSENHA: TWideStringField;
    qryLoginNUMERO: TIntegerField;
    qryBaixaEstoque: TSQLQuery;
    qryExcluirCadastro: TSQLQuery;
    qryInativaCadastro: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure ClientDataSetCadastroProdutosAfterPost(DataSet: TDataSet);
    procedure dsoCadastroProdutosStateChange(Sender: TObject);
    procedure ClientDataSetCadastroVendedoresAfterPost(DataSet: TDataSet);
    procedure dsoCadastroVendedoresStateChange(Sender: TObject);
    procedure fdmItensVendaAfterPost(DataSet: TDataSet);
    procedure fdmItensVendaBeforeDelete(DataSet: TDataSet);
    procedure fdmItensVendaAfterDelete(DataSet: TDataSet);
    procedure ClientDataSetCadastroClientesAfterPost(DataSet: TDataSet);
    procedure dsoCadastroClientesStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uCadProduto, uCadVendedor, uVendas, uCadCliente;

{$R *.dfm}

procedure TdmDados.ClientDataSetCadastroClientesAfterPost(DataSet: TDataSet);
Var
  NovoCliente: String;
begin
  ClientDataSetCadastroClientes.ApplyUpdates(0);

  if (Assigned(frmCadClientes)) then
  begin
    frmCadClientes.btnGravar.Enabled  := ((dsoCadastroClientes.State in [dsEdit, dsInsert])and (frmCadClientes.btnGravar.Visible));
    frmCadClientes.btnExcluir.Enabled := ((dsoCadastroClientes.State in [dsBrowse]) and (frmCadClientes.btnExcluir.Visible));
  end;

  qryCadastroClientes.Close;
  qryCadastroClientes.Open;
  NovoCliente := frmCadClientes.edtNMCliente.Text;
  ClientDataSetCadastroClientes.Refresh;
  ClientDataSetCadastroClientes.Locate('NM_CLIENTE', NovoCliente, []);
end;

procedure TdmDados.ClientDataSetCadastroProdutosAfterPost(DataSet: TDataSet);
Var
  NovoProduto: String;
begin
  ClientDataSetCadastroProdutos.ApplyUpdates(0);

  if (Assigned(frmCadProdutos)) then
  begin
    frmCadProdutos.btnGravar.Enabled  := ((dsoCadastroProdutos.State in [dsEdit, dsInsert])and (frmCadProdutos.btnGravar.Visible));
    frmCadProdutos.btnExcluir.Enabled := ((dsoCadastroProdutos.State in [dsBrowse]) and (frmCadProdutos.btnExcluir.Visible));
  end;

  qryCadastroProdutos.Close;
  qryCadastroProdutos.Open;
  NovoProduto := frmCadProdutos.edtDescricao.Text;
  ClientDataSetCadastroProdutos.Refresh;
  ClientDataSetCadastroProdutos.Locate('DESCRICAO', NovoProduto, []);;
end;

procedure TdmDados.ClientDataSetCadastroVendedoresAfterPost(DataSet: TDataSet);
Var
  NovoVendedor: String;
begin
  ClientDataSetCadastroVendedores.ApplyUpdates(0);

  if (Assigned(frmCadVendedores)) then
  begin
    frmCadVendedores.btnGravar.Enabled  := ((dsoCadastroVendedores.State in [dsEdit, dsInsert])and (frmCadVendedores.btnGravar.Visible));
    frmCadVendedores.btnExcluir.Enabled := ((dsoCadastroVendedores.State in [dsBrowse]) and (frmCadVendedores.btnExcluir.Visible));
  end;

  qryCadastroVendedores.Close;
  qryCadastroVendedores.Open;
  NovoVendedor := frmCadVendedores.edtNMVendedor.Text;
  ClientDataSetCadastroVendedores.Refresh;
  ClientDataSetCadastroVendedores.Locate('NM_VENDEDOR', NovoVendedor, []);
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  SQLConnection1.Connected := False;
  SQLConnection1.DriverName := 'Firebird';
  SQLConnection1.LoginPrompt := False;

  SQLConnection1.Params.Values['Database'] := GetCurrentDir()+'\database\database.fdb';
  SQLConnection1.Params.Values['User_Name'] := 'sysdba';
  SQLConnection1.Params.Values['Password'] := 'masterkey';
  SQLConnection1.Params.Values['ServerCharSet'] := 'UTF8';

  SQLConnection1.Connected := True;

  qryCadastroProdutos.Close;
  ClientDataSetCadastroProdutos.Close;

  qryCadastroVendedores.Close;
  ClientDataSetCadastroVendedores.Close;

  qryCadastroClientes.Close;
  ClientDataSetCadastroClientes.Close;
end;

procedure TdmDados.dsoCadastroClientesStateChange(Sender: TObject);
begin
  if (frmCadClientes <> nil) then
  begin
    frmCadClientes.btnGravar.Enabled  := ((dsoCadastroClientes.State in [dsEdit, dsInsert])and (frmCadClientes.btnGravar.Visible));
    frmCadClientes.btnExcluir.Enabled := ((dsoCadastroClientes.State in [dsBrowse]) and (frmCadClientes.btnExcluir.Visible));
    frmCadClientes.dbNavCadastro.Enabled := (dsoCadastroClientes.State in [dsBrowse]);
  end;
end;

procedure TdmDados.dsoCadastroProdutosStateChange(Sender: TObject);
begin
  if (frmCadProdutos <> nil) then
  begin
    frmCadProdutos.btnGravar.Enabled  := ((dsoCadastroProdutos.State in [dsEdit, dsInsert])and (frmCadProdutos.btnGravar.Visible));
    frmCadProdutos.btnExcluir.Enabled := ((dsoCadastroProdutos.State in [dsBrowse]) and (frmCadProdutos.btnExcluir.Visible));
    frmCadProdutos.dbNavCadastro.Enabled := (dsoCadastroProdutos.State in [dsBrowse]);
  end;
end;

procedure TdmDados.dsoCadastroVendedoresStateChange(Sender: TObject);
begin
  if (frmCadVendedores <> nil) then
  begin
    frmCadVendedores.btnGravar.Enabled  := ((dsoCadastrovendedores.State in [dsEdit, dsInsert])and (frmCadVendedores.btnGravar.Visible));
    frmCadVendedores.btnExcluir.Enabled := ((dsoCadastrovendedores.State in [dsBrowse]) and (frmCadVendedores.btnExcluir.Visible));
    frmCadVendedores.dbNavCadastro.Enabled := (dsoCadastrovendedores.State in [dsBrowse]);
  end;
end;

procedure TdmDados.fdmItensVendaAfterDelete(DataSet: TDataSet);
begin
  if (fdmItensVenda.IsEmpty) then
  begin
    frmVendas.btnExcluirItem.Enabled := False;
    frmVendas.rdgFormaPagamento.Enabled := False;
    frmVendas.btnConcederDesconto.Enabled := False;
    frmVendas.btnEncerrarVenda.Enabled := False;

    frmVendas.VL_Desconto := 0;
    frmVendas.PE_Desconto := 0;
    frmVendas.VL_Acrescimo := 0;
    frmVendas.PE_Desconto := 0;

    frmVendas.CalculaDesconto(frmVendas.VL_Desconto);
    frmVendas.CalculaTotal;
  end;
end;

procedure TdmDados.fdmItensVendaAfterPost(DataSet: TDataSet);
begin
    frmVendas.btnExcluirItem.Enabled := True;
    frmVendas.rdgFormaPagamento.Enabled := True;
    frmVendas.btnConcederDesconto.Enabled := True;
    frmVendas.btnEncerrarVenda.Enabled := True;

    if (frmvendas.ST_Venda = 'V') then
    begin
      frmVendas.CalculaSubtotal(fdmItensVenda.FieldByName('VL_Total_Item').AsCurrency);

      frmVendas.CalculaDesconto(frmVendas.VL_Desconto);

      frmVendas.CalculaAcrescimo(((frmVendas.PE_Acrescimo / 100) * (frmVendas.VL_Sub_Total - frmVendas.VL_Desconto )));
    end;
end;

procedure TdmDados.fdmItensVendaBeforeDelete(DataSet: TDataSet);
begin
  if (((frmVendas.VL_Total - fdmItensVenda.FieldByName('VL_Total_Item').AsInteger) < frmVendas.VL_Desconto) and (fdmItensVenda.RecordCount > 1)) then
  begin
    Showmessage('Não é possível excluir este item com o desconto aplicado. Remova/Ajuste o desconto!');
    Abort;
  end;

  frmVendas.CalculaSubtotal(fdmItensVenda.FieldByName('VL_Total_Item').AsCurrency * -1);
  frmVendas.CalculaDesconto(frmVendas.VL_Desconto);
  frmVendas.CalculaAcrescimo(((frmVendas.PE_Acrescimo / 100) * (frmVendas.VL_Sub_Total - frmVendas.VL_Desconto )));
end;

end.
