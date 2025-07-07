unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.StyledButton;

type
  TfrmClientes = class(TForm)
    pnlFiltro: TPanel;
    Label7: TLabel;
    btnLocalizar: TStyledGraphicButton;
    btnCadastrarCliente: TStyledGraphicButton;
    pnlEdtProduto: TPanel;
    Shape3: TShape;
    edtNomeCliente: TEdit;
    Panel6: TPanel;
    Shape2: TShape;
    dbgClientes: TDBGrid;
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure dbgClientesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgClientesKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    ST_Cliente: String;  //A - Adicionando à Venda , C - Consultando Cliente
    ID_Cliente: integer;
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses uCadCliente, uDmDados, uVendas;

procedure TfrmClientes.btnCadastrarClienteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadClientes, frmCadClientes);
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
    frmCadClientes.ShowModal;
  finally
    FreeAndNil(frmCadClientes);
  end;
end;

procedure TfrmClientes.btnLocalizarClick(Sender: TObject);
var
  SQL: String;
begin
  SQL := 'SELECT ID_CLIENTE ,NM_CLIENTE ,CEP ,ENDERECO ,NUMERO ,BAIRRO ,COMPLEMENTO ,CIDADE ,UF '+
         'FROM CLIENTES '+
         'WHERE CLIENTES.SN_Ativo = ''S'' '+
         'AND (CLIENTES.NM_CLIENTE LIKE '+QuotedStr('%'+edtNomeCliente.Text+'%')+') ';

  dmDados.qryCadastroClientes.Close;
  dmDados.qryCadastroClientes.SQL.Clear;
  dmDados.qryCadastroClientes.SQL.Add(SQL);
  dmDados.qryCadastroClientes.Open;
  dmDados.ClientDataSetCadastroClientes.Close;
  dmDados.ClientDataSetCadastroClientes.Open;
end;

procedure TfrmClientes.dbgClientesDblClick(Sender: TObject);
begin
  if (ST_Cliente  = 'C') then
  begin
    Application.CreateForm(TfrmCadClientes, frmCadClientes);
    try
      frmCadClientes.ShowModal;
    finally
      FreeAndNil(frmCadClientes);
    end;
  end
  else
  begin
    dmDados.qryCadastroClientes.Locate('ID_CLIENTE', dbgClientes.DataSource.DataSet.FieldByName('ID_CLIENTE').AsInteger, []);
    ID_Cliente  := dmDados.dsoCadastroClientes.DataSet.FieldByName('ID_CLIENTE').AsInteger;
    frmVendas.ID_Cliente := ID_cliente;

    frmvendas.IdentificarCliente(ID_Cliente);

    Close;
  end;
end;

procedure TfrmClientes.dbgClientesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    // Definir a cor de fundo e a cor da fonte para a linha selecionada
    dbgClientes.Canvas.Brush.Color := clGray;
    dbgClientes.Canvas.Font.Color := clWhite;
    dbgClientes.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    // Cor padrão para linhas não selecionadas
    dbgClientes.Canvas.Brush.Color := clWhite;
    dbgClientes.Canvas.Font.Color := clBlack;
    dbgClientes.Canvas.Font.Style := []
  end;

  // Desenha a célula
  dbgClientes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmClientes.dbgClientesKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    dbgClientes.OnDblClick(Self);
  end;
end;

procedure TfrmClientes.edtNomeClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    btnLocalizar.Click;
  end;
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.ClientDataSetCadastroClientes.Close;
  dmDados.qryCadastroClientes.Close;
end;

procedure TfrmClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    Close;
  end;

  if (Key = VK_F5 ) then
  begin
    btnCadastrarCliente.Click;
  end;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  edtNomeCliente.SetFocus;
end;

end.
