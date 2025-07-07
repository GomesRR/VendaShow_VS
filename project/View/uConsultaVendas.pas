unit uConsultaVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes, Data.DB,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StyledButton, frxSmartMemo, frxClass, frxDBSet, frCoreClasses, DateUtils;

type
  TfrmConsultaVendas = class(TForm)
    pnlFiltro: TPanel;
    Label7: TLabel;
    btnLocalizar: TStyledGraphicButton;
    btnImprimirConsulta: TStyledGraphicButton;
    Panel6: TPanel;
    Shape2: TShape;
    dbgVendas: TDBGrid;
    GroupBox1: TGroupBox;
    dtInicio: TDateTimePicker;
    Label1: TLabel;
    dtFim: TDateTimePicker;
    dbIprimirConsulta: TfrxDBDataset;
    frxImprimirConsulta: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnImprimirConsultaClick(Sender: TObject);
    procedure dbgVendasDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgVendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVendas: TfrmConsultaVendas;

implementation

{$R *.dfm}

uses uDmDados, uVendas;

procedure TfrmConsultaVendas.btnImprimirConsultaClick(Sender: TObject);
begin
  if not (dmDados.qryVendas.IsEmpty) then
  begin
    With frxImprimirConsulta do
    begin
      Variables['customVariables.DT_Inicio'] := QuotedStr(FormatDateTime('dd/mm/yyyy',dtInicio.Date));
      Variables['customVariables.DT_Fim'] := QuotedStr(FormatDateTime('dd/mm/yyyy',dtFim.Date));
       Variables['customVariables.DT_Atual'] := QuotedStr(FormatDateTime('dd/mm/yyyy',Now));

      PrepareReport;
      ShowReport();
    end;
  end;
end;

procedure TfrmConsultaVendas.btnLocalizarClick(Sender: TObject);
var
  SQL: String;
  DT_inicial, DT_Final: String;
begin
  DT_inicial := FormatDateTime('yyyy-mm-dd',dtInicio.Date);
  DT_Final :=  FormatDateTime('yyyy-mm-dd',dtFim.Date);

  SQL := 'SELECT ID_VENDA, DT_VENDA, VL_TOTAL, '+
         'VENDEDORES.NM_VENDEDOR, VENDAS.ID_VENDEDOR, VENDAS.ID_CLIENTE, '+
         'VENDAS.VL_SUB_TOTAL, VENDAS.VL_ACRESCIMO, VENDAS.VL_DESCONTO, '+
         'VENDAS.TP_FORMA_PAGAMENTO '+
         'FROM VENDAS '+
              'LEFT JOIN VENDEDORES '+
              'ON VENDEDORES.ID_VENDEDOR = VENDAS.ID_VENDEDOR '+
         'WHERE VENDAS.DT_VENDA BETWEEN '+QuotedStr(DT_inicial)+' AND '+QuotedStr(DT_Final);

  dmDados.qryVendas.Close;
  dmDados.qryVendas.SQL.Clear;
  dmDados.qryVendas.SQL.Add(SQL);
  dmDados.qryVendas.Open;
  dmDados.ClientDataSetVendas.Close;
  dmDados.ClientDataSetVendas.Open;
end;

procedure TfrmConsultaVendas.dbgVendasDblClick(Sender: TObject);
begin
  if (frmvendas = nil) then
  begin
    Application.CreateForm(TfrmVendas, frmVendas);
    try
      frmVendas.ST_Venda := 'C';
      frmvendas.ResetVenda;

      dmDados.qryVendas.Locate('ID_VENDA', dbgVendas.DataSource.DataSet.FieldByName('ID_VENDA').AsInteger, []);

      frmVendas.lblNumVenda.Caption := dmDados.qryVendas.FieldByName('ID_VENDA').AsString;
      frmvendas.lblDtvenda.Caption := FormatDateTime('dd/mm/yyyy',dmDados.qryVendas.FieldByName('DT_Venda').AsDateTime);
      frmvendas.lblvendedor.Caption := dmDados.qryVendas.FieldByName('ID_VENDEDOR').AsString+
                                       ' - '+
                                       Copy(dmDados.qryVendas.FieldByName('NM_VENDEDOR').AsString, 1 , Pos(' ',dmDados.qryVendas.FieldByName('NM_VENDEDOR').AsString) - 1);
      frmvendas.IdentificarCliente(dmDados.qryVendas.FieldByName('ID_CLIENTE').AsInteger);
      frmvendas.lblSubTotal.Caption := FormatCurr('R$ #,##0.00', dmDados.qryVendas.FieldByName('VL_SUB_TOTAL').AsCurrency);
      frmvendas.lblAcrescimo.Caption := FormatCurr('R$ #,##0.00', dmDados.qryVendas.FieldByName('VL_ACRESCIMO').AsCurrency);
      frmvendas.lblDesconto.Caption := FormatCurr('R$ #,##0.00', dmDados.qryVendas.FieldByName('VL_DESCONTO').AsCurrency);
      frmvendas.lblTotal.Caption := FormatCurr('R$ #,##0.00', dmDados.qryVendas.FieldByName('VL_TOTAL').AsCurrency);

      if (Trim(dmDados.qryVendas.FieldByName('TP_FORMA_PAGAMENTO').AsString) = 'D') then
      begin
        frmvendas.rdgFormaPagamento.ItemIndex := 0;
      end
      else if (Trim(dmDados.qryVendas.FieldByName('TP_FORMA_PAGAMENTO').AsString) = 'C') then
      begin
        frmvendas.rdgFormaPagamento.ItemIndex := 1
      end;

      dmDados.qryItensVenda.Close;
      dmDados.qryItensVenda.Params.ParamByName('ID_Venda').Value := dmDados.qryVendas.FieldByName('ID_VENDA').AsInteger;
      dmDados.qryItensVenda.Open;

      dmDados.qryItensVenda.First;
      while not (dmDados.qryItensVenda.eof) do
      begin
        dmDados.fdmItensVenda.AppendRecord([dmDados.qryItensVenda.FieldByName('ID_ITEM_VENDA').AsInteger,
                                            dmDados.qryItensVenda.FieldByName('ID_PRODUTO').AsInteger,
                                            dmDados.qryItensVenda.FieldByName('QT_ITEM').AsInteger,
                                            dmDados.qryItensVenda.FieldByName('VL_UNITARIO').AsCurrency,
                                            dmDados.qryItensVenda.FieldByName('VL_TOTAL_ITEM').AsCurrency,
                                            dmDados.qryItensVenda.FieldByName('DESCRICAO').AsString]);

        dmDados.qryItensVenda.Next;
      end;


      frmvendas.lblDataHora.Visible := False;
      frmvendas.lblTxtNumVenda.Visible := True;
      frmvendas.lblNumVenda.Visible := True;
      frmvendas.lblTxtDTVenda.Visible := True;
      frmvendas.lblDTVenda.Visible := True;
      frmVendas.DesativaControles;
      frmVendas.ShowModal;
    finally
      frmVendas.Free;
    end;

  end;
end;

procedure TfrmConsultaVendas.dbgVendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    // Definir a cor de fundo e a cor da fonte para a linha selecionada
    dbgVendas.Canvas.Brush.Color := clGray;
    dbgVendas.Canvas.Font.Color := clWhite;
    dbgVendas.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    // Cor padrão para linhas não selecionadas
    dbgVendas.Canvas.Brush.Color := clWhite;
    dbgVendas.Canvas.Font.Color := clBlack;
    dbgVendas.Canvas.Font.Style := []
  end;

  // Desenha a célula
  dbgVendas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsultaVendas.FormCreate(Sender: TObject);
begin
  dtInicio.Date := StartOfTheMonth(Now);
  dtFim.Date   := EndOfTheMonth(Now);

  dmDados.qryVendas.Close;
  dmDados.ClientDatasetVendas.Close;
end;

procedure TfrmConsultaVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    Close;
  end;

  if (Key = VK_F5 ) then
  begin
    btnImprimirConsulta.Click;
  end;
end;

end.
