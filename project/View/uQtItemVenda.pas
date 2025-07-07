unit uQtItemVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonStylesAttributes,
  Vcl.StdCtrls, Vcl.StyledTaskDialog, Vcl.StyledButton;

type
  TfrmQtItemVenda = class(TForm)
    btnConfirmar: TStyledGraphicButton;
    dlgWarning: TStyledTaskDialog;
    dlgError: TStyledTaskDialog;
    edtQuantidade: TEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQtItemVenda: TfrmQtItemVenda;

implementation

{$R *.dfm}

uses uProdutos;

procedure TfrmQtItemVenda.btnConfirmarClick(Sender: TObject);
begin
  try
    if ((StrToInt(edtQuantidade.Text) <= 0) or (edtQuantidade.Text = '')) then
    begin
      dlgWarning.Text := 'Insira uma quantidade válida!';
      dlgWarning.Execute;
      edtQuantidade.SetFocus;
      Abort
    end;

    frmProdutos.QT_Item_Venda := StrToInt(edtQuantidade.Text);
  finally
    Close;
  end;
end;

procedure TfrmQtItemVenda.edtQuantidadeChange(Sender: TObject);
begin
  if (edtQuantidade.Text <> '') then
  begin
    btnConfirmar.Enabled := True;
  end
  else
  begin
    btnConfirmar.Enabled := False;
  end;
end;

procedure TfrmQtItemVenda.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (btnCOnfirmar.Enabled) then
    begin
      btnConfirmar.Click;
    end;
  end;
end;

procedure TfrmQtItemVenda.FormCreate(Sender: TObject);
begin
  btnConfirmar.Enabled := False;
end;

procedure TfrmQtItemVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE ) then
  begin
    Close;
  end;
end;

end.
