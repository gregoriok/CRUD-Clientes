object DmConexao: TDmConexao
  Height = 254
  Width = 355
  object ConexaoSQL: TFDConnection
    ConnectionName = 'TEX'
    Params.Strings = (
      'Database=C:\Users\Gregorio kessler\Desktop\SQLite\db\TEX.db'
      'LockingMode=Normal'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object QueryPesquisar: TFDQuery
    Active = True
    Connection = ConexaoSQL
    SQL.Strings = (
      'select * from Cliente')
    Left = 24
    Top = 96
    object QueryPesquisarID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryPesquisarNome: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 255
    end
    object QueryPesquisarDocumento: TWideStringField
      FieldName = 'Documento'
      Origin = 'Documento'
      Size = 255
    end
    object QueryPesquisarEmail: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 255
    end
    object QueryPesquisarCEP: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object QueryPesquisarUF: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QueryPesquisarBairro: TWideStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 30
    end
    object QueryPesquisarCidade: TWideStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 255
    end
    object QueryPesquisarLogradouro: TWideStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = QueryPesquisar
    Left = 16
    Top = 176
  end
  object QueryInsert: TFDQuery
    SQL.Strings = (
      'INSERT INTO Cliente ('
      'Nome,'
      'Documento,'
      'Email,'
      'CEP,'
      'UF,'
      'Bairro,'
      'Cidade,'
      'Logradouro'
      ')'
      'VALUES'
      '('
      ':Nome,'
      ':Documento,'
      ':Email,'
      ':CEP,'
      ':UF,'
      ':Bairro,'
      ':Cidade,'
      ':Logradouro'
      ');')
    Left = 96
    Top = 96
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 255
    end
    object WideStringField2: TWideStringField
      FieldName = 'Documento'
      Origin = 'Documento'
      Size = 255
    end
    object WideStringField3: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 255
    end
    object WideStringField4: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object WideStringField5: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object WideStringField6: TWideStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 30
    end
    object WideStringField7: TWideStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 255
    end
    object WideStringField8: TWideStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Size = 255
    end
  end
  object FDQuery2: TFDQuery
    SQL.Strings = (
      'select * from Cliente')
    Left = 168
    Top = 96
    object FDAutoIncField2: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideStringField9: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 255
    end
    object WideStringField10: TWideStringField
      FieldName = 'Documento'
      Origin = 'Documento'
      Size = 255
    end
    object WideStringField11: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 255
    end
    object WideStringField12: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object WideStringField13: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object WideStringField14: TWideStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 30
    end
    object WideStringField15: TWideStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 255
    end
    object WideStringField16: TWideStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Size = 255
    end
  end
  object FDQuery3: TFDQuery
    SQL.Strings = (
      'select * from Cliente')
    Left = 232
    Top = 96
    object FDAutoIncField3: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideStringField17: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 255
    end
    object WideStringField18: TWideStringField
      FieldName = 'Documento'
      Origin = 'Documento'
      Size = 255
    end
    object WideStringField19: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 255
    end
    object WideStringField20: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object WideStringField21: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object WideStringField22: TWideStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 30
    end
    object WideStringField23: TWideStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 255
    end
    object WideStringField24: TWideStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Size = 255
    end
  end
  object FDQuery4: TFDQuery
    SQL.Strings = (
      'select * from Cliente')
    Left = 304
    Top = 96
    object FDAutoIncField4: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideStringField25: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 255
    end
    object WideStringField26: TWideStringField
      FieldName = 'Documento'
      Origin = 'Documento'
      Size = 255
    end
    object WideStringField27: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 255
    end
    object WideStringField28: TWideStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object WideStringField29: TWideStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object WideStringField30: TWideStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 30
    end
    object WideStringField31: TWideStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 255
    end
    object WideStringField32: TWideStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Size = 255
    end
  end
end
