object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro'
  ClientHeight = 595
  ClientWidth = 950
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 950
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 22
      Width = 277
      Height = 33
      Caption = 'Cadastro de Contato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 432
      Top = 40
      Width = 63
      Height = 16
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPesquisar: TEdit
      Left = 501
      Top = 35
      Width = 420
      Height = 21
      TabOrder = 0
      OnChange = edtPesquisarChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 950
    Height = 506
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 948
      Height = 504
      ActivePage = Pesquisa
      Align = alClient
      TabOrder = 0
      object Cadastro: TTabSheet
        Caption = 'Cadastro'
        object Label2: TLabel
          Left = 16
          Top = 32
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object Label3: TLabel
          Left = 143
          Top = 32
          Width = 29
          Height = 13
          Caption = 'NOME'
        end
        object Label4: TLabel
          Left = 430
          Top = 32
          Width = 50
          Height = 13
          Caption = 'TELEFONE'
        end
        object Label5: TLabel
          Left = 599
          Top = 32
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object Label6: TLabel
          Left = 16
          Top = 80
          Width = 38
          Height = 13
          Caption = 'CIDADE'
        end
        object Label7: TLabel
          Left = 215
          Top = 80
          Width = 39
          Height = 13
          Caption = 'BAIRRO'
        end
        object Label8: TLabel
          Left = 430
          Top = 80
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object edtId: TEdit
          Left = 16
          Top = 51
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object edtNome: TEdit
          Left = 143
          Top = 51
          Width = 281
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 1
        end
        object edtUf: TEdit
          Left = 599
          Top = 51
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 3
        end
        object edtCidade: TEdit
          Left = 16
          Top = 99
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 4
        end
        object edtBairro: TEdit
          Left = 215
          Top = 99
          Width = 209
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 5
        end
        object Panel3: TPanel
          Left = 0
          Top = 392
          Width = 940
          Height = 84
          Align = alBottom
          TabOrder = 7
          object btnNovo: TButton
            Left = 307
            Top = 40
            Width = 75
            Height = 25
            Caption = 'Novo'
            TabOrder = 0
            OnClick = btnNovoClick
          end
          object btnSalvar: TButton
            Left = 427
            Top = 40
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 1
            OnClick = btnSalvarClick
          end
          object btnCancelar: TButton
            Left = 537
            Top = 40
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 2
            OnClick = btnCancelarClick
          end
        end
        object maskTelefone: TMaskEdit
          Left = 430
          Top = 51
          Width = 161
          Height = 21
          EditMask = '(##)#####-####;1;_'
          MaxLength = 14
          TabOrder = 2
          Text = '(  )     -    '
        end
        object maskCep: TMaskEdit
          Left = 430
          Top = 99
          Width = 160
          Height = 21
          EditMask = '#####-###;1;_'
          MaxLength = 9
          TabOrder = 6
          Text = '     -   '
        end
      end
      object Pesquisa: TTabSheet
        Caption = 'Pesquisa'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 3
          Top = 3
          Width = 921
          Height = 361
          DataSource = DM.dsAgenda
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object btnEditar: TButton
          Left = 363
          Top = 432
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btnEditarClick
        end
        object Button1: TButton
          Left = 472
          Top = 432
          Width = 75
          Height = 25
          Caption = 'Deletar'
          TabOrder = 2
          OnClick = Button1Click
        end
      end
    end
  end
end
