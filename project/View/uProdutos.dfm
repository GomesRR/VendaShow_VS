object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'PRODUTOS'
  ClientHeight = 402
  ClientWidth = 974
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pnlFiltro: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 968
    Height = 51
    Margins.Top = 10
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 5
      Top = -4
      Width = 50
      Height = 17
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnLocalizar: TStyledGraphicButton
      AlignWithMargins = True
      Left = 656
      Top = 12
      Width = 125
      Height = 36
      Margins.Top = 9
      Margins.Bottom = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      OnClick = btnLocalizarClick
      ParentFont = False
      StyleElements = [seFont, seBorder]
      Caption = '&Localizar'
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
    object btnCadastrarProduto: TStyledGraphicButton
      AlignWithMargins = True
      Left = 787
      Top = 12
      Width = 177
      Height = 36
      Margins.Top = 15
      Margins.Bottom = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      OnClick = btnCadastrarProdutoClick
      ParentFont = False
      StyleElements = [seFont, seBorder]
      Caption = '(F5) &Cadastrar Produto'
      Flat = True
      StyleRadius = 15
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
    end
    object pnlEdtProduto: TPanel
      Left = 5
      Top = 16
      Width = 620
      Height = 28
      Margins.Left = 5
      Margins.Top = 13
      Margins.Bottom = 0
      BevelOuter = bvNone
      TabOrder = 0
      object Shape3: TShape
        Left = 0
        Top = 0
        Width = 620
        Height = 28
        Align = alClient
        Pen.Color = clSilver
        ExplicitTop = -1
        ExplicitWidth = 153
        ExplicitHeight = 89
      end
      object edtNomeProduto: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 5
        Width = 597
        Height = 20
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Font.Charset = ARABIC_CHARSET
        Font.Color = 9671571
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TextHint = 'DIGITE O NOME DO PRODUITO...'
        OnKeyDown = FormKeyDown
        OnKeyPress = edtNomeProdutoKeyPress
      end
    end
  end
  object Panel6: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 67
    Width = 966
    Height = 332
    Margins.Left = 4
    Margins.Right = 4
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Shape2: TShape
      Left = 0
      Top = 0
      Width = 966
      Height = 332
      Align = alClient
      Pen.Color = 15066597
      ExplicitLeft = 24
      ExplicitWidth = 65
      ExplicitHeight = 65
    end
    object dbgProdutos: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 960
      Height = 326
      Align = alClient
      BorderStyle = bsNone
      DataSource = dmDados.dsoCadastroProdutos
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = dbgProdutosDrawColumnCell
      OnDblClick = dbgProdutosDblClick
      OnKeyDown = FormKeyDown
      OnKeyPress = dbgProdutosKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_PRODUTO'
          Title.Caption = 'Nome'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 337
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VL_COMPRA'
          Title.Alignment = taCenter
          Title.Caption = 'Vl. Compra'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VL_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'Vl. Venda'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QT_ESTOQUE'
          Title.Alignment = taCenter
          Title.Caption = 'Estoque'
          Visible = True
        end>
    end
  end
end
