unit uVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.StyledButton;

type
  TfrmVendedores = class(TForm)
    pnlFiltro: TPanel;
    Label7: TLabel;
    btnLocalizar: TStyledGraphicButton;
    btnCadastrarVendedor: TStyledGraphicButton;
    pnlEdtProduto: TPanel;
    Shape3: TShape;
    edtNomeVendedor: TEdit;
    Panel6: TPanel;
    Shape2: TShape;
    dbgVendedores: TDBGrid;
    procedure btnLocalizarClick(Sender: TObject);
    procedure dbgVendedoresDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarVendedorClick(Sender: TObject);
    procedure dbgVendedoresDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendedores: TfrmVendedores;

implementation

{$R *.dfm}

uses uDmDados, uCadVendedor;

procedure TfrmVendedores.btnCadastrarVendedorClick(Sender: TObject);
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

procedure TfrmVendedores.btnLocalizarClick(Sender: TObject);
var
  SQL: String;
begin
  SQL := 'SELECT ID_VENDEDOR ,NM_VENDEDOR ,CEP ,ENDERECO ,NUMERO ,BAIRRO ,COMPLEMENTO ,CIDADE ,UF ,SENHA '+
         'FROM VENDEDORES '+
         'WHERE VENDEDORES.SN_Ativo = ''S'' '+
         'AND (VENDEDORES.NM_VENDEDOR LIKE '+QuotedStr('%'+edtNomeVendedor.Text+'%')+') ';

  dmDados.qryCadastroVendedores.Close;
  dmDados.qryCadastroVendedores.SQL.Clear;
  dmDados.qryCadastroVendedores.SQL.Add(SQL);
  dmDados.qryCadastroVendedores.Open;
  dmDados.ClientDataSetCadastroVendedores.Close;
  dmDados.ClientDataSetCadastroVendedores.Open;
end;

procedure TfrmVendedores.dbgVendedoresDblClick(Sender: TObject);
begin
   Application.CreateForm(TfrmCadVendedores, frmCadVendedores);
  try
    frmCadVendedores.ShowModal;
  finally
    FreeAndNil(frmCadVendedores);
  end;
end;

procedure TfrmVendedores.dbgVendedoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    // Definir a cor de fundo e a cor da fonte para a linha selecionada
    dbgVendedores.Canvas.Brush.Color := clGray;
    dbgVendedores.Canvas.Font.Color := clWhite;
    dbgVendedores.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    // Cor padrão para linhas não selecionadas
    dbgVendedores.Canvas.Brush.Color := clWhite;
    dbgVendedores.Canvas.Font.Color := clBlack;
    dbgVendedores.Canvas.Font.Style := []
  end;

  // Desenha a célula
  dbgVendedores.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmVendedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.ClientDataSetCadastroVendedores.Close;
  dmDados.qryCadastroVendedores.Close;
end;

procedure TfrmVendedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    Close;
  end;

  if (Key = VK_F5 ) then
  begin
    btnCadastrarVendedor.Click;
  end;
end;

procedure TfrmVendedores.FormShow(Sender: TObject);
begin
  edtNomeVendedor.SetFocus;
end;

end.
