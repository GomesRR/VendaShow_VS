unit uVendaController;

interface

uses
  uVendaModel, System.Classes, System.JSON, Vcl.StdCtrls, Vcl.StyledButton, System.SysUtils, frxClass;

type
  TVendaController = class
  private

  public
    procedure ImprimirVenda(ID_Venda: Integer; Report: TFrxReport);
  end;

implementation

procedure TVendaController.ImprimirVenda(ID_Venda: Integer; Report: TFrxReport);
var
  Venda: TVendaModel;
begin
  Venda := TVendaModel.Create;
  try
    Venda.ID_Venda := ID_Venda;

    Venda.ImprimirVenda(ID_Venda, Report);
  finally
    Venda.Free;
  end;
end;

end.
