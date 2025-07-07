object frmDesconto: TfrmDesconto
  Left = 0
  Top = 0
  Caption = 'DESCONTO'
  ClientHeight = 74
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object btnConfirmar: TStyledGraphicButton
    Left = 125
    Top = 21
    Width = 125
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    OnClick = btnConfirmarClick
    ParentFont = False
    StyleElements = [seFont, seBorder]
    Caption = 'Confirmar'
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
  object edtDesconto: TEdit
    Left = 6
    Top = 24
    Width = 111
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    OnChange = edtDescontoChange
    OnKeyDown = FormKeyDown
    OnKeyPress = edtDescontoKeyPress
  end
  object dlgWarning: TStyledTaskDialog
    Buttons = <>
    CommonButtons = [tcbOk]
    MainIcon = 1
    RadioButtons = <>
    DialogButtonsFamily = 'SVG-Colors'
    HideSystemCloseButton = True
    Left = 206
    Top = 10
  end
  object dlgError: TStyledTaskDialog
    Buttons = <>
    CommonButtons = [tcbOk]
    MainIcon = 2
    RadioButtons = <>
    DialogButtonsFamily = 'SVG-Colors'
    HideSystemCloseButton = True
    Left = 134
    Top = 10
  end
end
