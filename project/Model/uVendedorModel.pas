unit uVendedorModel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls ,
  Vcl.ComCtrls;


type TVendedorModel = class
  private
    FID_Vendedor: Integer;
    FLogin:       Integer;
    FSenha:       string;
    FNM_VENDEDOR: string;
    FCEP:         string;
    FENDERECO:    string;
    FBAIRRO:      string;
    FCOMPLEMENTO: string;
    FCIDADE:      string;
    FUF:          string;
    FNUMERO:      Integer;
  public
    function Logar: TArray<String>;
    Function ExcluirVendedor: TArray<String>;
    property ID_Vendedor: Integer read FID_Vendedor write FID_Vendedor;
    property Login: Integer read FLogin write FLogin;
    property Senha: String read FSenha write FSenha;
    property NM_VENDEDOR: String read FNM_VENDEDOR write FNM_VENDEDOR;
    property CEP: String read FCEP write FCEP;
    property ENDERECO: String read FENDERECO write FENDERECO;
    property BAIRRO: String read FBAIRRO write FBAIRRO;
    property COMPLEMENTO: String read FCOMPLEMENTO write FCOMPLEMENTO;
    property CIDADE: String read FCIDADE write FCIDADE;
    property UF: String read FUF write FUF;
    property NUMERO: Integer read FNUMERO write FNUMERO;
  end;

implementation

uses uDmDados;

function TVendedorModel.Logar: TArray<String>;
begin
  try
    dmDados.qrylogin.Close;
    dmDados.qrylogin.Params.ParamByName('ID_Vendedor').Value := Login;
    dmDados.qrylogin.Params.ParamByName('Senha').Value       := Senha;
    dmDados.qrylogin.Open;
  finally
    if not(dmDados.qryLogin.IsEmpty) then
    begin
      ID_VENDEDOR := dmDados.qrylogin.FieldByName('ID_VENDEDOR').AsInteger;
      NM_VENDEDOR := dmDados.qrylogin.FieldByName('NM_VENDEDOR').AsString;
      CEP := dmDados.qrylogin.FieldByName('NM_VENDEDOR').AsString;
      ENDERECO := dmDados.qrylogin.FieldByName('ENDERECO').AsString;
      BAIRRO := dmDados.qrylogin.FieldByName('BAIRRO').AsString;
      COMPLEMENTO := dmDados.qrylogin.FieldByName('COMPLEMENTO').AsString;
      CIDADE := dmDados.qrylogin.FieldByName('CIDADE').AsString;
      UF := dmDados.qrylogin.FieldByName('UF').AsString;
      NUMERO :=   dmDados.qrylogin.FieldByName('NUMERO').Asinteger;

      Result := TArray<string>.Create('OK',
                                      'Login Efetuado com sucesso.',
                                      IntToStr(ID_Vendedor),
                                      NM_Vendedor);
    end
    else
    begin
      Result := TArray<string>.Create('ERRO',
                                      'Dados de login inválidos. Verifique e tente novamente.',
                                      IntToStr(ID_Vendedor),
                                      NM_Vendedor);
    end;
  end;
end;

function TVendedorModel.ExcluirVendedor: TArray<String>;
begin
  try
    dmDados.qryValidaExistenciaVenda.Close;
    dmDados.qryValidaExistenciaVenda.SQL.Clear;
    dmDados.qryValidaExistenciaVenda.SQL.Add('SELECT ID_Venda FROM VENDAS WHERE ID_Vendedor = :ID');
    dmDados.qryValidaExistenciaVenda.Params.ParamByName('ID').Value := ID_Vendedor;
    dmDados.qryValidaExistenciaVenda.Open;

    if not (dmDados.qryValidaExistenciaVenda.IsEmpty) then
    begin
      Result := TArray<string>.Create('RESTRITO',
                                      'Exclusão negada: O Vendedor não pode ser excluido por estar relacionado em venda(s).'+#13+
                                      'O cadastro do mesmo será inativado!');

      dmDados.qryInativaCadastro.Close;
      dmDados.qryInativaCadastro.SQL.Clear;
      dmDados.qryInativaCadastro.SQL.Add('UPDATE VENDEDORES SET SN_Ativo = ''N'' WHERE ID_VENDEDOR = :ID');
      dmDados.qryInativaCadastro.Params.ParamByName('ID').Value := ID_Vendedor;
      dmDados.qryInativaCadastro.ExecSQL;
    end
    else
    begin
      dmDados.qryExcluirCadastro.Close;
      dmDados.qryExcluirCadastro.SQL.Clear;
      dmDados.qryExcluirCadastro.SQL.Add('DELETE FROM VENDEDORES WHERE ID_VENDEDOR = :ID');
      dmDados.qryExcluirCadastro.Params.ParamByName('ID').Value := ID_Vendedor;
      dmDados.qryExcluirCadastro.ExecSQL;

      Result := TArray<string>.Create('OK',
                                      'Vendedor excluído com sucesso.');
    end;
  finally
    if (dmDados.qryCadastroVendedores.Active) then
    begin
      dmDados.qryCadastroVendedores.Refresh;
    end;

    if (dmDados.ClientDataSetCadastroVendedores.Active) then
    begin
      dmDados.ClientDataSetCadastroVendedores.Refresh;
    end;
  end;
end;

end.
