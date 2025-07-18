object frmCadClientes: TfrmCadClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 339
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object pnlDados: TPanel
    Left = 0
    Top = 46
    Width = 492
    Height = 248
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object DBText1: TDBText
      Left = 67
      Top = 8
      Width = 64
      Height = 17
      DataField = 'ID_VENDEDOR'
      DataSource = dmDados.dsoCadastroVendedores
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 28
      Width = 40
      Height = 16
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 13
      Top = 6
      Width = 48
      Height = 16
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 75
      Width = 28
      Height = 16
      Caption = 'CEP:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 13
      Top = 177
      Width = 48
      Height = 16
      Caption = 'Cidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 267
      Top = 177
      Width = 19
      Height = 16
      Caption = 'UF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 107
      Top = 75
      Width = 65
      Height = 16
      Caption = 'Endere'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 411
      Top = 77
      Width = 49
      Height = 16
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 13
      Top = 126
      Width = 44
      Height = 16
      Caption = 'Bairro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 286
      Top = 126
      Width = 92
      Height = 16
      Caption = 'Complemento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNMCliente: TDBEdit
      Left = 13
      Top = 45
      Width = 462
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NM_CLIENTE'
      DataSource = dmDados.dsoCadastroClientes
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
    object edtCEP: TDBEdit
      Left = 13
      Top = 96
      Width = 88
      Height = 23
      CharCase = ecUpperCase
      DataField = 'CEP'
      DataSource = dmDados.dsoCadastroClientes
      TabOrder = 1
      OnExit = edtCEPExit
      OnKeyDown = FormKeyDown
    end
    object edtCidade: TDBEdit
      Left = 13
      Top = 199
      Width = 248
      Height = 23
      DataField = 'CIDADE'
      DataSource = dmDados.dsoCadastroClientes
      TabOrder = 6
      OnKeyDown = FormKeyDown
    end
    object edtUF: TDBEdit
      Left = 267
      Top = 198
      Width = 28
      Height = 23
      DataField = 'UF'
      DataSource = dmDados.dsoCadastroClientes
      MaxLength = 2
      TabOrder = 7
      OnKeyDown = FormKeyDown
    end
    object edtEndereco: TDBEdit
      Left = 107
      Top = 97
      Width = 298
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = dmDados.dsoCadastroClientes
      TabOrder = 2
      OnKeyDown = FormKeyDown
    end
    object edtNumero: TDBEdit
      Left = 411
      Top = 96
      Width = 64
      Height = 23
      DataField = 'NUMERO'
      DataSource = dmDados.dsoCadastroClientes
      TabOrder = 3
      OnKeyDown = FormKeyDown
    end
    object edtBairro: TDBEdit
      Left = 13
      Top = 147
      Width = 267
      Height = 23
      CharCase = ecUpperCase
      DataField = 'BAIRRO'
      DataSource = dmDados.dsoCadastroClientes
      TabOrder = 4
      OnKeyDown = FormKeyDown
    end
    object edtComplemento: TDBEdit
      Left = 286
      Top = 147
      Width = 189
      Height = 23
      CharCase = ecUpperCase
      DataField = 'COMPLEMENTO'
      DataSource = dmDados.dsoCadastroClientes
      TabOrder = 5
      OnKeyDown = FormKeyDown
    end
  end
  object pnlTopbar: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object dbNavCadastro: TStyledDbNavigator
      Left = 13
      Top = 13
      Width = 462
      Height = 28
      Margins.Top = 10
      Margins.Bottom = 10
      DataSource = dmDados.dsoCadastroClientes
      TabOrder = 0
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbRefresh]
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 283
    Width = 492
    Height = 56
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object btnCancelar: TStyledGraphicButton
      AlignWithMargins = True
      Left = 389
      Top = 15
      Width = 100
      Height = 36
      Margins.Top = 15
      Margins.Bottom = 5
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      OnClick = btnCancelarClick
      ParentFont = False
      StyleElements = [seFont, seBorder]
      Caption = '&Cancelar'
      Flat = True
      StyleRadius = 10
      StyleClass = 'Calypso'
      ButtonStyleNormal.BorderColor = 3417288
      ButtonStyleNormal.FontColor = clGrayText
      ButtonStyleNormal.ButtonColor = clSilver
      ButtonStylePressed.BorderColor = 13090483
      ButtonStylePressed.FontColor = clWhite
      ButtonStylePressed.ButtonColor = 5131854
      ButtonStyleSelected.BorderColor = 14735050
      ButtonStyleSelected.ButtonColor = 5131854
      ButtonStyleHot.BorderColor = 16379616
      ButtonStyleHot.FontColor = clWhite
      ButtonStyleHot.ButtonColor = 5131854
      ButtonStyleDisabled.BorderColor = 16711422
      ButtonStyleDisabled.FontColor = clWhite
      ButtonStyleDisabled.ButtonColor = 14408667
      ExplicitLeft = 426
      ExplicitTop = 22
    end
    object btnExcluir: TStyledGraphicButton
      AlignWithMargins = True
      Left = 177
      Top = 15
      Width = 100
      Height = 36
      Margins.Top = 15
      Margins.Bottom = 5
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      OnClick = btnExcluirClick
      ParentFont = False
      StyleElements = [seFont, seBorder]
      Caption = '&Excluir'
      Flat = True
      StyleRadius = 10
      StyleClass = 'Calypso'
      ButtonStyleNormal.BorderColor = 3417288
      ButtonStyleNormal.FontColor = clGrayText
      ButtonStyleNormal.ButtonColor = clSilver
      ButtonStylePressed.BorderColor = 13090483
      ButtonStylePressed.FontColor = clWhite
      ButtonStylePressed.ButtonColor = 5131854
      ButtonStyleSelected.BorderColor = 14735050
      ButtonStyleSelected.ButtonColor = 5131854
      ButtonStyleHot.BorderColor = 16379616
      ButtonStyleHot.FontColor = clWhite
      ButtonStyleHot.ButtonColor = 221
      ButtonStyleDisabled.BorderColor = 16711422
      ButtonStyleDisabled.FontColor = clWhite
      ButtonStyleDisabled.ButtonColor = 14408667
      ExplicitLeft = 418
      ExplicitTop = 12
    end
    object btnGravar: TStyledGraphicButton
      AlignWithMargins = True
      Left = 283
      Top = 15
      Width = 100
      Height = 36
      Margins.Top = 15
      Margins.Bottom = 5
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      OnClick = btnGravarClick
      ParentFont = False
      StyleElements = [seFont, seBorder]
      Caption = '&Gravar'
      Flat = True
      StyleRadius = 10
      StyleClass = 'Calypso'
      ButtonStyleNormal.BorderColor = 3417288
      ButtonStyleNormal.FontColor = clGrayText
      ButtonStyleNormal.ButtonColor = clSilver
      ButtonStylePressed.BorderColor = 13090483
      ButtonStylePressed.FontColor = clWhite
      ButtonStylePressed.ButtonColor = 5131854
      ButtonStyleSelected.BorderColor = 14735050
      ButtonStyleSelected.ButtonColor = 5131854
      ButtonStyleHot.BorderColor = 16379616
      ButtonStyleHot.FontColor = clWhite
      ButtonStyleHot.ButtonColor = 5131854
      ButtonStyleDisabled.BorderColor = 16711422
      ButtonStyleDisabled.FontColor = clWhite
      ButtonStyleDisabled.ButtonColor = 14408667
      ExplicitLeft = 382
      ExplicitTop = 22
    end
  end
  object msgError: TStyledTaskDialog
    Buttons = <>
    CommonButtons = [tcbOk]
    Flags = [tfPositionRelativeToWindow]
    MainIcon = 2
    RadioButtons = <>
    DialogButtonsFamily = 'Bootstrap'
    Left = 104
    Top = 278
  end
  object ACBrCEP: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    WebService = wsViaCep
    PesquisarIBGE = True
    Left = 384
    Top = 238
  end
  object dlgQuestion: TStyledTaskDialog
    Buttons = <>
    MainIcon = 5
    RadioButtons = <>
    DialogButtonsFamily = 'SVG-Colors'
    HideSystemCloseButton = True
    Left = 310
    Top = 58
  end
  object dlgError: TStyledTaskDialog
    Buttons = <>
    CommonButtons = [tcbOk]
    MainIcon = 2
    RadioButtons = <>
    DialogButtonsFamily = 'SVG-Colors'
    HideSystemCloseButton = True
    Left = 174
    Top = 64
  end
  object dlgWarning: TStyledTaskDialog
    Buttons = <>
    CommonButtons = [tcbOk]
    MainIcon = 1
    RadioButtons = <>
    DialogButtonsFamily = 'SVG-Colors'
    HideSystemCloseButton = True
    Left = 110
    Top = 64
  end
  object dlgOK: TStyledTaskDialog
    Buttons = <>
    CommonButtons = [tcbOk]
    MainIcon = 0
    RadioButtons = <>
    DialogButtonsFamily = 'SVG-Colors'
    HideSystemCloseButton = True
    Left = 38
    Top = 64
  end
end
