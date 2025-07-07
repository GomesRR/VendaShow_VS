unit uRelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.StyledTaskDialog, frxSmartMemo, frxClass, frxDBSet, frCoreClasses, DateUtils;

type
  TfrmRelVendas = class(TForm)
    pnlFiltro: TPanel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    btnGerarRelatorio: TStyledGraphicButton;
    dlgError: TStyledTaskDialog;
    frxImprimirConsulta: TfrxReport;
    dbIprimirConsulta: TfrxDBDataset;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtInicioKeyPress(Sender: TObject; var Key: Char);
    procedure dtFimKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

{$R *.dfm}

uses uDmDados;

procedure TfrmRelVendas.btnGerarRelatorioClick(Sender: TObject);
var
  SQL: String;
  DT_inicial, DT_Final: String;
begin
  try
    try
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
    finally
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
  except on E: Exception do
    begin
      dlgError.Text := 'Erro no processo de Login. Tente Novamente!';
      dlgError.Execute;
      Application.Terminate;
    end;

  end;

end;

procedure TfrmRelVendas.dtFimKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) then
  begin
    btnGerarRelatorio.Click;
  end;
end;

procedure TfrmRelVendas.dtInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    dtFim.SetFocus;
  end;
end;

procedure TfrmRelVendas.FormCreate(Sender: TObject);
begin
  dtInicio.Date := StartOfTheMonth(Now);
  dtFim.Date   := EndOfTheMonth(Now);
end;

end.
