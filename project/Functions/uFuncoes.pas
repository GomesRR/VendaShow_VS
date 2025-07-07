unit uFuncoes;

interface

uses System.MaskUtils, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, System.JSON, RESTRequest4D,
  Vcl.ComCtrls;

type
  TFuncoes = class

  private
  { Private declarations }
  public
  { Public declarations }
    function MensagemAlerta(campo: string): string;
    function RemoverNaoNumericos(const Texto: string): string;
    function MascaraValor (Texto: String): String;
  end;

implementation

uses
  uPrincipal;

function TFuncoes.MensagemAlerta(campo: string): string;
begin
    Result := Format('O campo "%s" é inválido ou não foi preenchido. Verifique e tente novamente.', [campo]);
end;

function TFuncoes.RemoverNaoNumericos(const Texto: string): string;
var
  I: Integer;
begin
  Result := ''; // Inicializa o resultado como uma string vazia
  for I := 1 to Length(Texto) do
  begin
    if Texto[I] in ['0'..'9'] then
      Result := Result + Texto[I]; // Adiciona apenas caracteres numéricos
  end;
end;

function TFuncoes.MascaraValor(Texto: String): String;
var
  sAux: String;
  i, iPos: Integer;
  ValorNumerico: Double;
  FS: TFormatSettings;
begin
  // Configura separadores para ambiente brasileiro
  FS := TFormatSettings.Create;
  FS.DecimalSeparator := ',';
  FS.ThousandSeparator := '.';

  // Remove tudo que não for número ou separador decimal
  sAux := '';
  for i := 1 to Length(Texto) do
  begin
    if Texto[i] in ['0'..'9', ',', '.'] then
      sAux := sAux + Texto[i];
  end;

  // Remove todos os caracteres não numéricos
  for i := Length(Texto) downto 1 do
  begin
    if not (Texto[i] in ['0'..'9']) then
      Delete(Texto, i, 1);
  end;

  // Preenche com zeros à esquerda para 11 posições
  sAux := StringOfChar('0', 11 - Length(Texto)) + Texto;

  // Aplica máscara monetária brasileira
  sAux := FormatMaskText('000.000.000,00;0', sAux);

  // Remove zeros à esquerda mantendo separador
  iPos := 1;
  for i := 1 to Length(sAux) do
  begin
    if sAux[i] = ',' then
    begin
      iPos := i - 1;
      Break;
    end;
    if not (sAux[i] in ['0', '.']) then
    begin
      iPos := i;
      Break;
    end;
  end;

  Result := 'R$ ' + Copy(sAux, iPos, Length(sAux));
end;

end.
