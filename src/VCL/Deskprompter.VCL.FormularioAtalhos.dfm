object FormularioAtalhos: TFormularioAtalhos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Atalhos de teclado'
  ClientHeight = 556
  ClientWidth = 700
  Color = 2302755
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormularioCreate
  OnShow = FormularioShow
  DesignSize = (
    700
    556)
  TextHeight = 15
  object RotuloTitulo: TLabel
    Left = 16
    Top = 16
    Width = 177
    Height = 28
    Caption = 'Atalhos de teclado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RotuloInstrucao: TLabel
    Left = 291
    Top = 27
    Width = 393
    Height = 15
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = 
      'Selecione Principal ou Secund'#225'rio e pressione a combina'#231#227'o. Dele' +
      'te limpa.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object GradeAtalhos: TStringGrid
    Left = 16
    Top = 56
    Width = 668
    Height = 431
    ColCount = 3
    DefaultColWidth = 155
    DefaultRowHeight = 25
    FixedCols = 0
    RowCount = 16
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goTabs]
    TabOrder = 0
    OnKeyDown = GradeAtalhosKeyDown
    OnSelectCell = GradeAtalhosSelectCell
  end
  object PainelInferior: TPanel
    Left = 0
    Top = 500
    Width = 700
    Height = 56
    Align = alBottom
    BevelOuter = bvNone
    Color = 2105376
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 499
    object BotaoRestaurar: TButton
      Left = 412
      Top = 7
      Width = 140
      Height = 32
      Caption = 'Restaurar padroes'
      TabOrder = 0
      OnClick = BotaoRestaurarClick
    end
    object BotaoFechar: TButton
      Left = 558
      Top = 7
      Width = 126
      Height = 32
      Cancel = True
      Caption = 'Fechar'
      ModalResult = 1
      TabOrder = 1
    end
  end
end
