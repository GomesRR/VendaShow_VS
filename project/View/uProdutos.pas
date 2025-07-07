unit uProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.StyledButton, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmProdutos = class(TForm)
    pnlFiltro: TPanel;
    Label7: TLabel;
    btnLocalizar: TStyledGraphicButton;
    btnCadastrarProduto: TStyledGraphicButton;
    pnlEdtProduto: TPanel;
    Shape3: TShape;
    edtNomeProduto: TEdit;
    Panel6: TPanel;
    Shape2: TShape;
    dbgProdutos: TDBGrid;
    procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCadastrarProdutoClick(Sender: TObject);
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  Var
    ST_Produto: String;  //A - Adicionando à Venda , C - Consultando Produto
    QT_Item_Venda: Integer;
  end;

var
  frmProdutos: TfrmProdutos;


implementation

{$R *.dfm}

uses uDmDados, uCadProduto, uQtItemVenda;

procedure TfrmProdutos.btnCadastrarProdutoClick(Sender: TObject);
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

procedure TfrmProdutos.btnLocalizarClick(Sender: TObject);
var
  SQL: String;
begin
  SQL := 'SELECT ID_PRODUTO ,NM_PRODUTO ,DESCRICAO ,VL_VENDA ,VL_COMPRA ,QT_ESTOQUE ,SN_ATIVO '+
         'FROM PRODUTOS '+
         'WHERE PRODUTOS.SN_Ativo = ''S'' '+
         'AND (PRODUTOS.NM_PRODUTO LIKE '+QuotedStr('%'+edtNomeProduto.Text+'%')+') ';

  dmDados.qryCadastroProdutos.Close;
  dmDados.qryCadastroProdutos.SQL.Clear;
  dmDados.qryCadastroProdutos.SQL.Add(SQL);
  dmDados.qryCadastroProdutos.Open;
  dmDados.ClientDataSetCadastroProdutos.Close;
  dmDados.ClientDataSetCadastroProdutos.Open;

  if (dmDados.qryCadastroprodutos.RecordCount > 0) then
  begin
    dbgProdutos.SetFocus;
  end;
end;

procedure TfrmProdutos.dbgProdutosDblClick(Sender: TObject);
var
  ID_Produto : Integer;
  VL_Venda : Currency;
  Descricao : String;
  VL_Total_Item : Currency;
begin
  if (ST_Produto = 'C') then
  begin
    Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
    try
      frmCadProdutos.ShowModal;
    finally
      FreeAndNil(frmCadProdutos);
    end;
  end
  else
  begin
    dmDados.qryCadastroProdutos.Locate('ID_PRODUTO', dbgProdutos.DataSource.DataSet.FieldByName('ID_PRODUTO').AsInteger, []);

    Application.CreateForm(TfrmQtItemVenda, frmQtItemVenda);
    try
      frmQtItemVenda.ShowModal;
    finally
      FreeAndNil(frmQtItemVenda);
    end;

    ID_Produto := dmDados.dsoCadastroProdutos.DataSet.FieldByName('ID_PRODUTO').AsInteger;
    VL_Venda := dmDados.dsoCadastroProdutos.DataSet.FieldByName('VL_VENDA').AsCurrency;
    Descricao := dmDados.dsoCadastroProdutos.DataSet.FieldByName('DESCRICAO').AsString;

    VL_Total_Item := VL_Venda *  QT_Item_Venda;

    dmDados.fdmItensVenda.AppendRecord([0,
                                       ID_Produto,
                                       QT_Item_Venda,
                                       VL_Venda,
                                       VL_Total_Item,
                                       Descricao]);

    Close;
  end;
end;

procedure TfrmProdutos.dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    // Definir a cor de fundo e a cor da fonte para a linha selecionada
    dbgProdutos.Canvas.Brush.Color := clGray;
    dbgProdutos.Canvas.Font.Color := clWhite;
    dbgProdutos.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    // Cor padrão para linhas não selecionadas
    dbgProdutos.Canvas.Brush.Color := clWhite;
    dbgProdutos.Canvas.Font.Color := clBlack;
    dbgProdutos.Canvas.Font.Style := []
  end;

  // Desenha a célula
  dbgProdutos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmProdutos.dbgProdutosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    dbgProdutos.OnDblClick(Self);
  end;
end;

procedure TfrmProdutos.edtNomeProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    btnLocalizar.Click;
  end;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.ClientDataSetCadastroProdutos.Close;
  dmDados.qryCadastroProdutos.Close;
end;

procedure TfrmProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    Close;
  end;

  if (Key = VK_F5 ) then
  begin
    btnCadastrarProduto.Click;
  end;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  edtNomeProduto.SetFocus;
end;

end.
