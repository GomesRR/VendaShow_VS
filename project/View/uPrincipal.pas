unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    pnlContainer: TPanel;
    MenuPrincipal: TMainMenu;
    mnCadastro: TMenuItem;
    mnRelatorios: TMenuItem;
    mnVenda: TMenuItem;
    statusSystem: TStatusBar;
    Timer1: TTimer;
    mnClientes: TMenuItem;
    mnVendedores: TMenuItem;
    Produtos1: TMenuItem;
    mnRelatorioVenda: TMenuItem;
    mnNovaVenda: TMenuItem;
    mnConsultaVenda: TMenuItem;
    mnCadClientes: TMenuItem;
    mnConsultaClientes: TMenuItem;
    mnCadastroVendedores: TMenuItem;
    mnConsultaVendedores: TMenuItem;
    mnCadastroProdutos: TMenuItem;
    mnConsultaProdutos: TMenuItem;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mnConsultaVendedoresClick(Sender: TObject);
    procedure mnConsultaProdutosClick(Sender: TObject);
    procedure mnNovaVendaClick(Sender: TObject);
    procedure mnCadClientesClick(Sender: TObject);
    procedure mnCadastroVendedoresClick(Sender: TObject);
    procedure mnCadastroProdutosClick(Sender: TObject);
    procedure mnConsultaClientesClick(Sender: TObject);
    procedure mnConsultaVendaClick(Sender: TObject);
    procedure mnRelatorioVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Vendedor: Integer;
    NM_Vendedor: String;
  end;

var
  frmPrincipal: TfrmPrincipal;

const
  ReleaseSystem: String = '1.0.0';
implementation

{$R *.dfm}

uses uDmDados, uCadProduto, uProdutos, uVendedores, uVendas, uCadCliente,
  uCadVendedor, uClientes, uConsultaVendas, uLogin, uRelVendas;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TfrmLogin, frmLogin);
  try
    frmLogin.ShowModal;
  finally
    if (frmLogin.ModalResult = mrOK) then
    begin
      frmLogin.Free;
      frmPrincipal.Show;
    end
    else
    begin
      frmLogin.Free;
      Application.Terminate;
    end;
  end;

  statusSystem.Panels[0].Text := ReleaseSystem;
  statusSystem.Panels[2].Text := 'VENDEDOR LOGADO:  '+IntToStr(ID_Vendedor)+' - '+NM_Vendedor;;
end;

procedure TfrmPrincipal.mnCadastroProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  try
    if (dmDados.ClientDataSetCadastroProdutos.Active) then
    begin
      dmDados.ClientDataSetCadastroProdutos.Insert;
    end
    else
    begin
      dmDados.ClientDataSetCadastroProdutos.Open;
      dmDados.ClientDataSetCadastroProdutos.Insert;
    end;
    frmCadProdutos.ShowModal;
  finally
    FreeAndNil(frmCadProdutos);
  end;
end;

procedure TfrmPrincipal.mnCadastroVendedoresClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadVendedores, frmCadVendedores);
  try
    if (dmDados.ClientDataSetCadastroVendedores.Active) then
    begin
      dmDados.ClientDataSetCadastroVendedores.Insert;
    end
    else
    begin
      dmDados.ClientDataSetCadastroVendedores.Open;
      dmDados.ClientDataSetCadastroVendedores.Insert;
    end;
    frmCadVendedores.ShowModal;
  finally
    FreeAndNil(frmCadVendedores);
  end;
end;

procedure TfrmPrincipal.mnCadClientesClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadclientes, frmCadclientes);
  try
    if (dmDados.ClientDataSetCadastroClientes.Active) then
    begin
      dmDados.ClientDataSetCadastroClientes.Insert;
    end
    else
    begin
      dmDados.ClientDataSetCadastroClientes.Open;
      dmDados.ClientDataSetCadastroClientes.Insert;
    end;
    frmCadclientes.ShowModal;
  finally
    frmCadclientes.Free;
  end;
end;

procedure TfrmPrincipal.mnConsultaClientesClick(Sender: TObject);
begin
  Application.CreateForm(TfrmClientes, frmClientes);
  try
    frmClientes.ST_Cliente := 'C';
    frmClientes.ShowModal;
  finally
    frmClientes.Free;
  end;
end;

procedure TfrmPrincipal.mnConsultaProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TfrmProdutos, frmProdutos);
  try
    frmProdutos.ST_Produto := 'C';
    frmProdutos.ShowModal;
  finally
    frmProdutos.Free;
  end;
end;

procedure TfrmPrincipal.mnConsultaVendaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaVendas, frmConsultaVendas);
  try
    frmConsultaVendas.ShowModal;
  finally
    frmConsultaVendas.Free;
  end;
end;

procedure TfrmPrincipal.mnConsultaVendedoresClick(Sender: TObject);
begin
  Application.CreateForm(TfrmVendedores, frmVendedores);
  try
    frmVendedores.ShowModal;
  finally
    frmVendedores.Free;
  end;
end;

procedure TfrmPrincipal.mnNovaVendaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmVendas, frmVendas);
  try
    frmvendas.ST_Venda := 'V';
    frmVendas.ShowModal;
  finally
    frmVendas.Free;
  end;
end;

procedure TfrmPrincipal.mnRelatorioVendaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRelVendas, frmRelVendas);
  try
    frmRelVendas.ShowModal;
  finally
    frmRelVendas.Free;
  end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  statusSystem.Panels[1].Text := FormatdateTime('dd/mm/yyyy hh:mm:ss' ,now)
end;

end.
