unit uProdutoModel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls ,
  Vcl.ComCtrls;


type TProdutoModel = class
  private
    FID_Produto: Integer;
    FQT_Baixa:       Integer;
  public
    procedure BaixarEstoque;
    Function ExcluirProduto: TArray<String>;
    property ID_Produto: Integer read FID_Produto write FID_Produto;
    property QT_Baixa: Integer read FQT_Baixa write FQT_Baixa;
  end;

implementation

uses uDmDados;

procedure TProdutoModel.BaixarEstoque;
begin
  try
    dmDados.qryBaixaEstoque.Close;
    dmDados.qryBaixaEstoque.Params.ParamByName('ID_Produto').Value := ID_Produto;
    dmDados.qryBaixaEstoque.Params.ParamByName('QT_Baixa').Value   := QT_Baixa;
    dmDados.qryBaixaEstoque.ExecSQL;
  finally
  end;
end;

function TProdutoModel.ExcluirProduto: TArray<String>;
begin
  try
    dmDados.qryValidaExistenciaVenda.Close;
    dmDados.qryValidaExistenciaVenda.SQL.Clear;
    dmDados.qryValidaExistenciaVenda.SQL.Add('SELECT ID_Venda FROM ITEMVENDAS WHERE ID_Produto = :ID');
    dmDados.qryValidaExistenciaVenda.Params.ParamByName('ID').Value := ID_Produto;
    dmDados.qryValidaExistenciaVenda.Open;

    if not (dmDados.qryValidaExistenciaVenda.IsEmpty) then
    begin
      Result := TArray<string>.Create('RESTRITO',
                                      'Exclusão negada: O produto não pode ser excluido por estar relacionado em venda(s).'+#13+
                                      'O cadastro do mesmo será inativado!');

      dmDados.qryInativaCadastro.Close;
      dmDados.qryInativaCadastro.SQL.Clear;
      dmDados.qryInativaCadastro.SQL.Add('UPDATE PRODUTOS SET SN_Ativo = ''N'' WHERE ID_PRODUTO = :ID');
      dmDados.qryInativaCadastro.Params.ParamByName('ID').Value := ID_Produto;
      dmDados.qryInativaCadastro.ExecSQL;
    end
    else
    begin
      dmDados.qryExcluirCadastro.Close;
      dmDados.qryExcluirCadastro.SQL.Clear;
      dmDados.qryExcluirCadastro.SQL.Add('DELETE FROM PRODUTOS WHERE ID_PRODUTO = :ID');
      dmDados.qryExcluirCadastro.Params.ParamByName('ID').Value := ID_Produto;
      dmDados.qryExcluirCadastro.ExecSQL;

      Result := TArray<string>.Create('OK',
                                      'Produto excluído com sucesso.');
    end;
  finally
    if (dmDados.qryCadastroProdutos.Active) then
    begin
      dmDados.qryCadastroProdutos.Refresh;
    end;

    if (dmDados.ClientDataSetCadastroProdutos.Active) then
    begin
      dmDados.ClientDataSetCadastroProdutos.Refresh;
    end;
  end;
end;

end.
