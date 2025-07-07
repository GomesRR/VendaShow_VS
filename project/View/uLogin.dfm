object frmlogin: Tfrmlogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'LOGIN'
  ClientHeight = 215
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object lblCodvendedor: TLabel
    Left = 112
    Top = 16
    Width = 171
    Height = 21
    Caption = 'Login (C'#243'd. Vendedor)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5987163
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSenha: TLabel
    Left = 112
    Top = 81
    Width = 47
    Height = 21
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5987163
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnEntrar: TStyledGraphicButton
    AlignWithMargins = True
    Left = 112
    Top = 144
    Width = 171
    Height = 44
    Margins.Top = 9
    Margins.Bottom = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    OnClick = btnEntrarClick
    ParentFont = False
    StyleElements = [seFont, seBorder]
    Caption = 'ENTRAR'
    Flat = True
    StyleRadius = 15
    StyleClass = 'Calypso'
    ButtonStyleNormal.BorderColor = 5679945
    ButtonStyleNormal.ButtonColor = 5679945
    ButtonStylePressed.BorderColor = 13090483
    ButtonStylePressed.FontColor = clWhite
    ButtonStylePressed.ButtonColor = 5131854
    ButtonStyleSelected.BorderColor = 14735050
    ButtonStyleSelected.ButtonColor = 5131854
    ButtonStyleHot.BorderColor = 16379616
    ButtonStyleHot.FontColor = clWhite
    ButtonStyleHot.ButtonColor = 5131854
    ButtonStyleDisabled.BorderColor = 16711422
    ButtonStyleDisabled.FontColor = clGray
    ButtonStyleDisabled.ButtonColor = clSilver
  end
  object edtlogin: TEdit
    Left = 112
    Top = 43
    Width = 171
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 112
    Top = 108
    Width = 171
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edtSenhaKeyPress
  end
  object dlgWarning: TStyledTaskDialog
    Buttons = <>
    CommonButtons = [tcbOk]
    MainIcon = 1
    RadioButtons = <>
    DialogButtonsFamily = 'SVG-Colors'
    HideSystemCloseButton = True
    Left = 30
    Top = 35
  end
  object dlgError: TStyledTaskDialog
    Buttons = <>
    CommonButtons = [tcbOk]
    MainIcon = 2
    RadioButtons = <>
    DialogButtonsFamily = 'SVG-Colors'
    HideSystemCloseButton = True
    Left = 30
    Top = 99
  end
end
