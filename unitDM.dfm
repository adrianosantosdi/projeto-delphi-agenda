object DM: TDM
  OldCreateOrder = False
  Height = 541
  Width = 738
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=dbagenda'
      'User_Name=root'
      'Password=p@ssw0rd'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 64
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Adriano Santos\Documents\Projetos Delphi\Agenda B'#225'sica\' +
      'libmySQL.dll'
    Left = 632
    Top = 40
  end
  object QryAgenda: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'select * from agenda')
    Left = 48
    Top = 128
    object QryAgendaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryAgendanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 60
    end
    object QryAgendatelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 14
    end
    object QryAgendauf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QryAgendacidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 60
    end
    object QryAgendabairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 60
    end
    object QryAgendacep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Required = True
      Size = 9
    end
  end
  object dsAgenda: TDataSource
    DataSet = QryAgenda
    Left = 112
    Top = 144
  end
  object QryDelete: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      '')
    Left = 48
    Top = 200
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 14
    end
    object StringField3: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
    object StringField4: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 60
    end
    object StringField5: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Required = True
      Size = 9
    end
  end
end
