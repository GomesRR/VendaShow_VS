unit uProdutoController;

interface

uses
  uProdutoModel, System.Classes, System.JSON, Vcl.StdCtrls, Vcl.StyledButton, System.SysUtils;

type
  TProdutoController = class
  private

  public
    procedure BaixarEstoque(ID_Produto, QT_Baixa: Integer);
    function ExcluirProduto(ID_Produto: Integer): TArray<String>;
  end;

implementation

procedure TProdutoController.BaixarEstoque(ID_Produto, QT_Baixa: Integer);
var
  Produto: TProdutoModel;
begin
  Produto := TProdutoModel.Create;
  try
    Produto.ID_Produto := ID_Produto;
    Produto.QT_Baixa := QT_Baixa;

    Produto.BaixarEstoque;
  finally
    Produto.Free;
  end;
end;

function TProdutoController.ExcluirProduto(ID_Produto: Integer): TArray<String>;
var
  Produto: TProdutoModel;
begin
  Produto := TProdutoModel.Create;
  try
    Produto.ID_Produto := ID_Produto;

    Result := Produto.ExcluirProduto;
  finally
    Produto.Free;
  end;
end;

end.
