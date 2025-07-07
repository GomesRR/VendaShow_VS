unit uDesconto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes,
  Vcl.StyledTaskDialog, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.StyledButton, System.Math, uFuncoes;

type
  TfrmDesconto = class(TForm)
    btnConfirmar: TStyledGraphicButton;
    dlgWarning: TStyledTaskDialog;
    dlgError: TStyledTaskDialog;
    edtDesconto: TEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesconto: TfrmDesconto;
  Funcoes : TFuncoes;

implementation

{$R *.dfm}

uses uVendas;

procedure TfrmDesconto.btnConfirmarClick(Sender: TObject);
var
  VL_Desconto: String;
begin
  Try
    Try
      VL_Desconto := StringReplace(edtDesconto.Text, '.', '', [rfReplaceAll]);
      VL_Desconto := StringReplace(VL_Desconto, 'R$ ', '', [rfReplaceAll]);

      frmVendas.VL_Desconto := StrToCurr(VL_Desconto);

      frmVendas.CalculaDesconto(frmVendas.VL_Desconto);
    Finally
      Close;
    End;
  except on E: Exception do
  begin
    dlgError.Text := 'Erro ao aplicar o desconto: ' + E.Message;
    dlgError.Execute;
  end;
  end
end;

procedure TfrmDesconto.edtDescontoChange(Sender: TObject);
begin
  edtDesconto.SelStart := Length(edtDesconto.Text);
  edtDesconto.MaxLength := 0;

  edtDesconto.Text := Funcoes.MascaraValor(edtDesconto.Text);
end;

procedure TfrmDesconto.edtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    btnConfirmar.Click;
  end;
end;

procedure TfrmDesconto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    Close;
  end;
end;

end.
