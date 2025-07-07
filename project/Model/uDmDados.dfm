object dmDados: TdmDados
  OnCreate = DataModuleCreate
  Height = 787
  Width = 847
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver290.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver290.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=database.fdb'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet=UTF8'
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False'
      
        'ConnectionString=DriverName=Firebird,Database=E:\Projetos_GIT\Te' +
        'ste_Tecnico_Viasoft\database\database.fdb,RoleName=RoleName,User' +
        '_Name=sysdba,Password=masterkey,ServerCharSet=UTF8,SQLDialect=3,' +
        'ErrorResourceFile=,LocaleCode=0000,BlobSize=-1,CommitRetain=Fals' +
        'e,WaitOnLocks=True,IsolationLevel=ReadCommitted,Trim Char=False')
    Left = 64
    Top = 40
  end
  object dsoCadastroProdutos: TDataSource
    DataSet = ClientDataSetCadastroProdutos
    OnStateChange = dsoCadastroProdutosStateChange
    Left = 560
    Top = 112
  end
  object qryCadastroProdutos: TSQLQuery
    DataSource = dsoCadastroProdutos
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ID_PRODUTO'
      '      ,NM_PRODUTO'
      '      ,DESCRICAO'
      '      ,VL_VENDA'
      '      ,VL_COMPRA'
      '      ,QT_ESTOQUE'
      '      ,SN_ATIVO'
      'FROM PRODUTOS'
      'WHERE PRODUTOS.SN_Ativo = '#39'S'#39)
    SQLConnection = SQLConnection1
    Left = 64
    Top = 112
    object qryCadastroProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object qryCadastroProdutosNM_PRODUTO: TWideStringField
      FieldName = 'NM_PRODUTO'
      Size = 400
    end
    object qryCadastroProdutosDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 400
    end
    object qryCadastroProdutosVL_VENDA: TFMTBCDField
      FieldName = 'VL_VENDA'
      Precision = 18
      Size = 2
    end
    object qryCadastroProdutosVL_COMPRA: TFMTBCDField
      FieldName = 'VL_COMPRA'
      Precision = 18
      Size = 2
    end
    object qryCadastroProdutosQT_ESTOQUE: TIntegerField
      FieldName = 'QT_ESTOQUE'
    end
    object qryCadastroProdutosSN_ATIVO: TWideStringField
      FieldName = 'SN_ATIVO'
      FixedChar = True
      Size = 8
    end
  end
  object DataSetProviderCadastroProdutos: TDataSetProvider
    DataSet = qryCadastroProdutos
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 224
    Top = 112
  end
  object ClientDataSetCadastroProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCadastroProdutos'
    AfterPost = ClientDataSetCadastroProdutosAfterPost
    Left = 408
    Top = 112
    object ClientDataSetCadastroProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object ClientDataSetCadastroProdutosNM_PRODUTO: TWideStringField
      FieldName = 'NM_PRODUTO'
      Size = 400
    end
    object ClientDataSetCadastroProdutosDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 400
    end
    object ClientDataSetCadastroProdutosVL_VENDA: TFMTBCDField
      FieldName = 'VL_VENDA'
      Precision = 18
      Size = 2
    end
    object ClientDataSetCadastroProdutosVL_COMPRA: TFMTBCDField
      FieldName = 'VL_COMPRA'
      Precision = 18
      Size = 2
    end
    object ClientDataSetCadastroProdutosQT_ESTOQUE: TIntegerField
      FieldName = 'QT_ESTOQUE'
    end
    object ClientDataSetCadastroProdutosSN_ATIVO: TWideStringField
      FieldName = 'SN_ATIVO'
      FixedChar = True
      Size = 8
    end
  end
  object qryValidaExistenciaVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 400
    Top = 568
  end
  object dsoCadastroVendedores: TDataSource
    DataSet = ClientDataSetCadastroVendedores
    OnStateChange = dsoCadastroVendedoresStateChange
    Left = 560
    Top = 176
  end
  object qryCadastroVendedores: TSQLQuery
    DataSource = dsoCadastroVendedores
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ID_VENDEDOR'
      '      ,NM_VENDEDOR'
      '      ,CEP'
      '      ,ENDERECO'
      '      ,NUMERO'
      '      ,BAIRRO'
      '      ,COMPLEMENTO'
      '      ,CIDADE'
      '      ,UF'
      '      ,SENHA'
      'FROM VENDEDORES'
      'WHERE VENDEDORES.SN_Ativo = '#39'S'#39
      '')
    SQLConnection = SQLConnection1
    Left = 64
    Top = 176
    object qryCadastroVendedoresID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object qryCadastroVendedoresNM_VENDEDOR: TWideStringField
      FieldName = 'NM_VENDEDOR'
      Size = 400
    end
    object qryCadastroVendedoresCEP: TWideStringField
      FieldName = 'CEP'
      Size = 40
    end
    object qryCadastroVendedoresENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 400
    end
    object qryCadastroVendedoresBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 200
    end
    object qryCadastroVendedoresCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object qryCadastroVendedoresCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object qryCadastroVendedoresUF: TWideStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 8
    end
    object qryCadastroVendedoresSENHA: TWideStringField
      FieldName = 'SENHA'
      Size = 40
    end
    object qryCadastroVendedoresNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
  end
  object DataSetProviderCadastroVendedores: TDataSetProvider
    DataSet = qryCadastroVendedores
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 224
    Top = 176
  end
  object ClientDataSetCadastroVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCadastroVendedores'
    AfterPost = ClientDataSetCadastroVendedoresAfterPost
    Left = 408
    Top = 176
    object ClientDataSetCadastroVendedoresID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object ClientDataSetCadastroVendedoresNM_VENDEDOR: TWideStringField
      FieldName = 'NM_VENDEDOR'
      Size = 400
    end
    object ClientDataSetCadastroVendedoresCEP: TWideStringField
      FieldName = 'CEP'
      Size = 40
    end
    object ClientDataSetCadastroVendedoresENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 400
    end
    object ClientDataSetCadastroVendedoresBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 200
    end
    object ClientDataSetCadastroVendedoresCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object ClientDataSetCadastroVendedoresCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object ClientDataSetCadastroVendedoresUF: TWideStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 8
    end
    object ClientDataSetCadastroVendedoresSENHA: TWideStringField
      FieldName = 'SENHA'
      Size = 40
    end
    object ClientDataSetCadastroVendedoresNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
  end
  object fdmItensVenda: TFDMemTable
    AfterPost = fdmItensVendaAfterPost
    BeforeDelete = fdmItensVendaBeforeDelete
    AfterDelete = fdmItensVendaAfterDelete
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 48
    Top = 312
    object fdmItensVendaID_Item: TIntegerField
      FieldName = 'ID_Item'
    end
    object fdmItensVendaID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object fdmItensVendaQT_Item_Venda: TIntegerField
      FieldName = 'QT_Item_Venda'
    end
    object fdmItensVendaVL_Venda: TFloatField
      FieldName = 'VL_Venda'
      DisplayFormat = 'R$ ,0.00'
    end
    object fdmItensVendaVL_Total_Item: TFloatField
      FieldName = 'VL_Total_Item'
      DisplayFormat = 'R$ ,0.00'
    end
    object fdmItensVendaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
  end
  object dsoItensVenda: TDataSource
    DataSet = fdmItensVenda
    Left = 152
    Top = 312
  end
  object stpGravaVendas: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 8
        NumericScale = 2
        Name = 'VL_SUB_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 8
        NumericScale = 2
        Name = 'VL_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 8
        NumericScale = 2
        Name = 'VL_ACRESCIMO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'VL_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 8
        NumericScale = 4
        Name = 'PE_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 8
        NumericScale = 4
        Name = 'PE_ACRESCIMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_FORMA_PAGAMENTO'
        ParamType = ptInput
        Size = 1
      end
      item
        DataType = ftInteger
        Name = 'ID_VENDA_OUT'
        ParamType = ptOutput
      end>
    SQLConnection = SQLConnection1
    StoredProcName = 'ST_GRAVAVENDAS'
    Left = 40
    Top = 376
  end
  object stpGravaItensVenda: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_VENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'QT_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 8
        NumericScale = 2
        Name = 'VL_UNITARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Precision = 8
        NumericScale = 2
        Name = 'VL_TOTAL_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    StoredProcName = 'ST_GRAVAITENSVENDA'
    Left = 152
    Top = 376
  end
  object qryVendas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT VENDAS.ID_VENDA'
      '            ,VENDAS.DT_VENDA'
      '            ,VENDAS.VL_TOTAL'
      '           ,VENDEDORES.NM_VENDEDOR'
      '           ,VENDAS.ID_VENDEDOR'
      '           ,VENDAS.ID_CLIENTE'
      '           ,VENDAS.VL_SUB_TOTAL'
      '           ,VENDAS.VL_ACRESCIMO'
      '           ,VENDAS.VL_DESCONTO'
      '           ,VENDAS.TP_FORMA_PAGAMENTO'
      'FROM VENDAS'
      '            INNER JOIN VENDEDORES'
      '            ON VENDEDORES.ID_VENDEDOR = VENDAS.ID_VENDEDOR')
    SQLConnection = SQLConnection1
    Left = 40
    Top = 440
    object qryVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object qryVendasVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryVendasDT_VENDA: TSQLTimeStampField
      FieldName = 'DT_VENDA'
    end
    object qryVendasNM_VENDEDOR: TWideStringField
      FieldName = 'NM_VENDEDOR'
      Size = 400
    end
    object qryVendasID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object qryVendasID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object qryVendasVL_SUB_TOTAL: TFMTBCDField
      FieldName = 'VL_SUB_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryVendasVL_ACRESCIMO: TFMTBCDField
      FieldName = 'VL_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryVendasVL_DESCONTO: TFMTBCDField
      FieldName = 'VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryVendasTP_FORMA_PAGAMENTO: TWideStringField
      FieldName = 'TP_FORMA_PAGAMENTO'
      FixedChar = True
      Size = 4
    end
  end
  object dsoVendas: TDataSource
    AutoEdit = False
    DataSet = ClientDataSetVendas
    Left = 384
    Top = 440
  end
  object DataSetProviderVendas: TDataSetProvider
    DataSet = qryVendas
    Left = 152
    Top = 440
  end
  object ClientDataSetVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderVendas'
    Left = 288
    Top = 440
    object ClientDataSetVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object ClientDataSetVendasVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
      Size = 2
    end
    object ClientDataSetVendasDT_VENDA: TSQLTimeStampField
      FieldName = 'DT_VENDA'
    end
    object ClientDataSetVendasNM_VENDEDOR: TWideStringField
      FieldName = 'NM_VENDEDOR'
      Size = 400
    end
    object ClientDataSetVendasID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object ClientDataSetVendasID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object ClientDataSetVendasVL_SUB_TOTAL: TFMTBCDField
      FieldName = 'VL_SUB_TOTAL'
      Precision = 18
      Size = 2
    end
    object ClientDataSetVendasVL_ACRESCIMO: TFMTBCDField
      FieldName = 'VL_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object ClientDataSetVendasVL_DESCONTO: TFMTBCDField
      FieldName = 'VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object ClientDataSetVendasTP_FORMA_PAGAMENTO: TWideStringField
      FieldName = 'TP_FORMA_PAGAMENTO'
      FixedChar = True
      Size = 4
    end
  end
  object dsoCadastroClientes: TDataSource
    DataSet = ClientDataSetCadastroClientes
    OnStateChange = dsoCadastroClientesStateChange
    Left = 560
    Top = 248
  end
  object qryCadastroClientes: TSQLQuery
    DataSource = dsoCadastroClientes
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ID_CLIENTE'
      '      ,NM_CLIENTE'
      '      ,CEP'
      '      ,ENDERECO'
      '      ,NUMERO'
      '      ,BAIRRO'
      '      ,COMPLEMENTO'
      '      ,CIDADE'
      '      ,UF'
      'FROM CLIENTES'
      'WHERE CLIENTES.SN_Ativo = '#39'S'#39)
    SQLConnection = SQLConnection1
    Left = 64
    Top = 248
    object qryCadastroClientesNM_CLIENTE: TWideStringField
      FieldName = 'NM_CLIENTE'
      Size = 400
    end
    object qryCadastroClientesCEP: TWideStringField
      FieldName = 'CEP'
      Size = 40
    end
    object qryCadastroClientesENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 400
    end
    object qryCadastroClientesNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object qryCadastroClientesBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 200
    end
    object qryCadastroClientesCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object qryCadastroClientesCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object qryCadastroClientesUF: TWideStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 8
    end
    object qryCadastroClientesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
  end
  object DataSetProviderCadastroClientes: TDataSetProvider
    DataSet = qryCadastroClientes
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 224
    Top = 248
  end
  object ClientDataSetCadastroClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderCadastroClientes'
    AfterPost = ClientDataSetCadastroClientesAfterPost
    Left = 408
    Top = 248
    object ClientDataSetCadastroClientesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object ClientDataSetCadastroClientesNM_CLIENTE: TWideStringField
      FieldName = 'NM_CLIENTE'
      Size = 400
    end
    object ClientDataSetCadastroClientesCEP: TWideStringField
      FieldName = 'CEP'
      Size = 40
    end
    object ClientDataSetCadastroClientesENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 400
    end
    object ClientDataSetCadastroClientesNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object ClientDataSetCadastroClientesBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 200
    end
    object ClientDataSetCadastroClientesCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object ClientDataSetCadastroClientesCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object ClientDataSetCadastroClientesUF: TWideStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 8
    end
  end
  object qryItensVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_Venda'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID_ITEM_VENDA,'
      '       ID_VENDA,'
      '       QT_ITEM,'
      '       VL_UNITARIO,'
      '       VL_TOTAL_ITEM,'
      '       ITEMVENDAS.ID_PRODUTO,'
      '       PRODUTOS.DESCRICAO'
      'FROM ITEMVENDAS'
      '     LEFT JOIN PRODUTOS'
      '     ON PRODUTOS.ID_PRODUTO = ITEMVENDAS.ID_PRODUTO'
      'WHERE ID_VENDA = :ID_Venda'
      'ORDER BY ID_ITEM_VENDA;')
    SQLConnection = SQLConnection1
    Left = 40
    Top = 504
    object qryItensVendaID_ITEM_VENDA: TIntegerField
      FieldName = 'ID_ITEM_VENDA'
      Required = True
    end
    object qryItensVendaID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
    end
    object qryItensVendaQT_ITEM: TIntegerField
      FieldName = 'QT_ITEM'
    end
    object qryItensVendaVL_UNITARIO: TFMTBCDField
      FieldName = 'VL_UNITARIO'
      Precision = 18
      Size = 2
    end
    object qryItensVendaVL_TOTAL_ITEM: TFMTBCDField
      FieldName = 'VL_TOTAL_ITEM'
      Precision = 18
      Size = 2
    end
    object qryItensVendaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object qryItensVendaDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 400
    end
  end
  object qryLogin: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_Vendedor'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'Senha'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID_VENDEDOR,'
      '       NM_VENDEDOR,'
      '       CEP,'
      '       ENDERECO,'
      '       BAIRRO,'
      '       COMPLEMENTO,'
      '       CIDADE,'
      '       UF,'
      '       SENHA,'
      '       NUMERO'
      'FROM VENDEDORES'
      'WHERE ID_VENDEDOR = :ID_Vendedor'
      '  AND SENHA  = :Senha'
      '  AND SN_Ativo = '#39'S'#39';')
    SQLConnection = SQLConnection1
    Left = 152
    Top = 504
    object qryLoginID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
      Required = True
    end
    object qryLoginNM_VENDEDOR: TWideStringField
      FieldName = 'NM_VENDEDOR'
      Size = 400
    end
    object qryLoginCEP: TWideStringField
      FieldName = 'CEP'
      Size = 40
    end
    object qryLoginENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 400
    end
    object qryLoginBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 200
    end
    object qryLoginCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object qryLoginCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object qryLoginUF: TWideStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 8
    end
    object qryLoginSENHA: TWideStringField
      FieldName = 'SENHA'
      Size = 40
    end
    object qryLoginNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
  end
  object qryBaixaEstoque: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'QT_BAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE PRODUTOS'
      'SET QT_ESTOQUE = QT_Estoque - :QT_BAIXA'
      'WHERE ID_PRODUTO = :ID_PRODUTO')
    SQLConnection = SQLConnection1
    Left = 40
    Top = 568
  end
  object qryExcluirCadastro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 152
    Top = 568
  end
  object qryInativaCadastro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 264
    Top = 568
  end
end
