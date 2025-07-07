unit uVendedorController;

interface

uses
  uVendedorModel, System.Classes, System.JSON, Vcl.StdCtrls, Vcl.StyledButton, System.SysUtils;

type
  TVendedorController = class
  private

  public
    function Logar(Login: Integer; Senha: String): TArray<String>;
    function ExcluirVendedor(ID_Vendedor: Integer): TArray<String>;
  end;

implementation

function TVendedorController.Logar(Login: Integer; Senha: string): TArray<String>;
var
  Vendedor: TVendedorModel;
begin
  Vendedor := TVendedorModel.Create;
  try
    Vendedor.Login := Login;
    Vendedor.Senha := Senha;

    Result := Vendedor.Logar;
  finally
    Vendedor.Free;
  end;
end;

function TVendedorController.ExcluirVendedor(ID_Vendedor: Integer): TArray<String>;
var
  Vendedor: TVendedorModel;
begin
  Vendedor := TVendedorModel.Create;
  try
    Vendedor.ID_Vendedor := ID_Vendedor;

    Result := Vendedor.ExcluirVendedor;
  finally
    Vendedor.Free;
  end;
end;

end.
