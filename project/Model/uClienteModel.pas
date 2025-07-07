unit uClienteModel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls ,
  Vcl.ComCtrls;


type TClienteModel = class
  private
    FID_Cliente: Integer;
  public
    Function ExcluirCliente: TArray<String>;
    property ID_Cliente: Integer read FID_Cliente write FID_Cliente;
  end;

implementation

uses uDmDados;

function TClienteModel.ExcluirCliente: TArray<String>;
begin
  try
    dmDados.qryValidaExistenciaVenda.Close;
    dmDados.qryValidaExistenciaVenda.SQL.Clear;
    dmDados.qryValidaExistenciaVenda.SQL.Add('SELECT ID_Venda FROM VENDAS WHERE ID_Cliente = :ID');
    dmDados.qryValidaExistenciaVenda.Params.ParamByName('ID').Value := ID_Cliente;
    dmDados.qryValidaExistenciaVenda.Open;

    if not (dmDados.qryValidaExistenciaVenda.IsEmpty) then
    begin
      Result := TArray<string>.Create('RESTRITO',
                                      'Exclusão negada: O cliente não pode ser excluido por estar relacionado em venda(s).'+#13+
                                      'O cadastro do mesmo será inativado!');

      dmDados.qryInativaCadastro.Close;
      dmDados.qryInativaCadastro.SQL.Clear;
      dmDados.qryInativaCadastro.SQL.Add('UPDATE CLIENTES SET SN_Ativo = ''N'' WHERE ID_Cliente = :ID');
      dmDados.qryInativaCadastro.Params.ParamByName('ID').Value := ID_Cliente;
      dmDados.qryInativaCadastro.ExecSQL;
    end
    else
    begin
      dmDados.qryExcluirCadastro.Close;
      dmDados.qryExcluirCadastro.SQL.Clear;
      dmDados.qryExcluirCadastro.SQL.Add('DELETE FROM CLIENTES WHERE ID_Cliente = :ID');
      dmDados.qryExcluirCadastro.Params.ParamByName('ID').Value := ID_Cliente;
      dmDados.qryExcluirCadastro.ExecSQL;

      Result := TArray<string>.Create('OK',
                                      'Cliente excluído com sucesso.');
    end;
  finally
    if (dmDados.qryCadastroClientes.Active) then
    begin
      dmDados.qryCadastroClientes.Refresh;
    end;

    if (dmDados.ClientDataSetCadastroClientes.Active) then
    begin
      dmDados.ClientDataSetCadastroClientes.Refresh;
    end;
  end;
end;

end.
