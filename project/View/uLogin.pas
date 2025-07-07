unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, uVendedorController,
  Vcl.StyledTaskDialog;

type
  Tfrmlogin = class(TForm)
    lblCodvendedor: TLabel;
    lblSenha: TLabel;
    edtlogin: TEdit;
    edtSenha: TEdit;
    btnEntrar: TStyledGraphicButton;
    dlgWarning: TStyledTaskDialog;
    dlgError: TStyledTaskDialog;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlogin: Tfrmlogin;

implementation

{$R *.dfm}

uses uVendas, uPrincipal;


procedure Tfrmlogin.btnEntrarClick(Sender: TObject);
var
  Vendedor: TVendedorController;
  RetornoLogin: TArray<String>;
begin
  Vendedor := TVendedorController.Create;
  try
    try
      RetornoLogin := Vendedor.Logar(StrToInt(edtLogin.Text), edtSenha.Text);
    finally
      if (Retornologin[0] = 'OK') then
      begin
        edtLogin.Text := '';
        edtSenha.Text := '';
        frmPrincipal.ID_Vendedor := StrToInt(RetornoLogin[2]);
        frmPrincipal.NM_Vendedor := RetornoLogin[3];
        ModalResult := mrOK;
      end
      else if (Retornologin[0] = 'ERRO') then
      begin
        dlgWarning.text := RetornoLogin[1];
        dlgWarning.Execute;
        edtLogin.SetFocus;
      end;
    end;
  except on E: Exception do
    begin
      dlgError.Text := 'Erro no processo de Login. Tente Novamente!';
      dlgError.Execute;
      Application.Terminate;
    end;
  end;


end;

procedure Tfrmlogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    btnEntrar.Click;
  end;
end;

procedure Tfrmlogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    edtSenha.SetFocus;
  end;
end;

end.
