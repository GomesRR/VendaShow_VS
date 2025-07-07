program vendaShow;

uses
  Vcl.Forms,
  uPrincipal in 'view\uPrincipal.pas' {frmPrincipal},
  uProdutos in 'view\uProdutos.pas' {frmProdutos},
  uDmDados in 'Model\uDmDados.pas' {dmDados: TDataModule},
  uCadProduto in 'View\uCadProduto.pas' {frmCadProdutos},
  uVendedores in 'View\uVendedores.pas' {frmVendedores},
  uCadVendedor in 'View\uCadVendedor.pas' {frmCadVendedores},
  uFuncoes in 'Functions\uFuncoes.pas',
  uVendas in 'View\uVendas.pas' {frmVendas},
  uQtItemVenda in 'View\uQtItemVenda.pas' {frmQtItemVenda},
  uDesconto in 'View\uDesconto.pas' {frmDesconto},
  uConsultaVendas in 'View\uConsultaVendas.pas' {frmConsultaVendas},
  uCadCliente in 'View\uCadCliente.pas' {frmCadClientes},
  uClientes in 'View\uClientes.pas' {frmClientes},
  uLogin in 'View\uLogin.pas' {frmlogin},
  uVendedorModel in 'Model\uVendedorModel.pas',
  uVendedorController in 'Controller\uVendedorController.pas',
  uRelVendas in 'View\uRelVendas.pas' {frmRelVendas},
  uProdutoModel in 'Model\uProdutoModel.pas',
  uProdutoController in 'Controller\uProdutoController.pas',
  uClienteModel in 'Model\uClienteModel.pas',
  uClienteController in 'Controller\uClienteController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelVendas, frmRelVendas);
  Application.Run;
end.
