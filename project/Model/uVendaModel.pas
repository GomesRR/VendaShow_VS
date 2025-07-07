unit uVendaModel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls ,
  Vcl.ComCtrls, frxClass;


type TVendaModel = class
  private
    FID_Venda: Integer;
  public
    procedure ImprimirVenda(ID_Venda: Integer; Report: TFrxReport);
    property ID_Venda: Integer read FID_Venda write FID_Venda;
  end;

implementation

uses uDmDados;

procedure TVendaModel.ImprimirVenda(ID_Venda: Integer; Report: TFrxReport);
begin
  try
    dmDados.qryImprimeVendas.Close;
    dmDados.qryImprimeVendas.SQL.Clear;
    dmDados.qryImprimeVendas.SQL.Add('SELECT ID_VENDA, DT_VENDA, VL_TOTAL, '+
                                      'VENDEDORES.NM_VENDEDOR, VENDAS.ID_VENDEDOR, VENDAS.ID_CLIENTE, '+
                                      'VENDAS.VL_SUB_TOTAL, VENDAS.VL_ACRESCIMO, VENDAS.VL_DESCONTO, '+
                                      'VENDAS.TP_FORMA_PAGAMENTO '+
                              'FROM VENDAS '+
                                   'LEFT JOIN VENDEDORES '+
                                   'ON VENDEDORES.ID_VENDEDOR = VENDAS.ID_VENDEDOR '+
                              'WHERE ID_Venda = :ID_Venda');
    dmDados.qryImprimeVendas.Params.ParamByName('ID_Venda').Value := ID_Venda;
    dmDados.qryImprimeVendas.Open;

    dmDados.qryimprimeItemVendas.Close;
    dmDados.qryimprimeItemVendas.Params.ParamByName('ID_Venda').Value := ID_Venda;
    dmDados.qryimprimeItemVendas.Open;
  finally
    if not (dmDados.qryImprimeVendas.IsEmpty) then
    begin
      With Report do
      begin
        Variables['customVariables.DT_Inicio'] := QuotedStr(FormatDateTime('dd/mm/yyyy', Now));
        Variables['customVariables.DT_Fim'] := QuotedStr(FormatDateTime('dd/mm/yyyy',Now));
        Variables['customVariables.DT_Atual'] := QuotedStr(FormatDateTime('dd/mm/yyyy',Now));

        PrepareReport;
        ShowReport();
      end;
    end;
  end;
end;

end.
