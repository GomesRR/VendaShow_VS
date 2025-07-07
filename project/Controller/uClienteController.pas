unit uClienteController;

interface

uses
  uClienteModel, System.Classes, System.JSON, Vcl.StdCtrls, Vcl.StyledButton, System.SysUtils;

type
  TClienteController = class
  private

  public
    function ExcluirCliente(ID_Cliente: Integer): TArray<String>;
  end;

implementation

function TClienteController.ExcluirCliente(ID_Cliente: Integer): TArray<String>;
var
  Cliente: TClienteModel;
begin
  Cliente := TClienteModel.Create;
  try
    Cliente.ID_Cliente := ID_Cliente;

    Result := Cliente.ExcluirCliente;
  finally
    Cliente.Free;
  end;
end;

end.
