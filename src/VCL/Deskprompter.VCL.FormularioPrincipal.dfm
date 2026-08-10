object FormularioPrincipal: TFormularioPrincipal
  Left = 0
  Top = 0
  Caption = 'Deskprompter'
  ClientHeight = 760
  ClientWidth = 1280
  Color = 1579032
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCloseQuery = FormularioCloseQuery
  OnCreate = FormularioCreate
  OnDestroy = FormularioDestroy
  OnKeyDown = FormularioKeyDown
  OnResize = FormularioResize
  TextHeight = 15
  object Divisor: TSplitter
    Left = 300
    Top = 0
    Width = 2
    Height = 726
    Color = 3158064
    ParentColor = False
  end
  object PainelArvore: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 726
    Align = alLeft
    BevelOuter = bvNone
    Color = 2302755
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      300
      726)
    object RotuloArvore: TLabel
      AlignWithMargins = True
      Left = 63
      Top = 16
      Width = 220
      Height = 28
      Margins.Left = 64
      Margins.Top = 16
      Margins.Right = 16
      Margins.Bottom = 8
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Grupos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PainelAcoesBiblioteca: TPanel
      Left = 0
      Top = 0
      Width = 50
      Height = 726
      Align = alLeft
      BevelOuter = bvNone
      Color = 1973790
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        50
        726)
      object BotaoNovoGrupo: TSpeedButton
        Left = 12
        Top = 11
        Width = 32
        Height = 32
        Hint = 'Criar novo grupo'
        ImageIndex = 14
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoNovoGrupoClick
      end
      object BotaoNovoTexto: TSpeedButton
        Left = 9
        Top = 49
        Width = 32
        Height = 32
        Hint = 'Criar novo texto'
        ImageIndex = 15
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoNovoTextoClick
      end
      object BotaoRenomear: TSpeedButton
        Left = 9
        Top = 89
        Width = 32
        Height = 32
        Hint = 'Renomear grupo ou texto selecionado'
        ImageIndex = 19
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoRenomearClick
      end
      object BotaoExcluir: TSpeedButton
        Left = 9
        Top = 129
        Width = 32
        Height = 32
        Hint = 'Excluir grupo ou texto selecionado'
        ImageIndex = 9
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoExcluirClick
      end
      object BotaoCima: TSpeedButton
        Left = 9
        Top = 169
        Width = 32
        Height = 32
        Hint = 'Mover item selecionado para cima'
        ImageIndex = 13
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoCimaClick
      end
      object BotaoBaixo: TSpeedButton
        Left = 9
        Top = 209
        Width = 32
        Height = 32
        Hint = 'Mover item selecionado para baixo'
        ImageIndex = 12
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoBaixoClick
      end
      object BotaoAtalhos: TSpeedButton
        Left = 9
        Top = 646
        Width = 32
        Height = 32
        Hint = 'Configura os atalhos de teclado'
        Anchors = [akLeft, akBottom]
        ImageIndex = 1
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoAtalhosClick
      end
      object BotaoOcultarOpcoes: TSpeedButton
        Left = 9
        Top = 686
        Width = 32
        Height = 32
        Hint = 'Ocultar paineis e deixar somente o texto'
        Anchors = [akLeft, akBottom]
        ImageIndex = 0
        Images = IconesBotoes
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoOcultarOpcoesClick
      end
    end
    object LinhaDivisoriaAcoesBiblioteca: TPanel
      Left = 50
      Top = 0
      Width = 1
      Height = 726
      Align = alLeft
      BevelOuter = bvNone
      Color = 3158064
      ParentBackground = False
      TabOrder = 2
    end
    object ArvoreConteudo: TTreeView
      AlignWithMargins = True
      Left = 63
      Top = 56
      Width = 225
      Height = 658
      Margins.Left = 12
      Margins.Top = 56
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alClient
      BorderStyle = bsNone
      Color = 2302755
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      HideSelection = False
      Indent = 22
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnChange = ArvoreConteudoChange
      OnChanging = ArvoreConteudoChanging
      OnCustomDrawItem = ArvoreConteudoCustomDrawItem
      OnDragDrop = ArvoreConteudoDragDrop
      OnDragOver = ArvoreConteudoDragOver
    end
  end
  object BarraEstado: TPanel
    Left = 0
    Top = 726
    Width = 1280
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    Color = 2105376
    ParentBackground = False
    TabOrder = 1
    object RotuloEstadoCaptura: TLabel
      AlignWithMargins = True
      Left = 62
      Top = 9
      Width = 180
      Height = 21
      Margins.Left = 4
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 4
      Align = alLeft
      AutoSize = False
      Caption = 'Protecao de captura ativa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6878097
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object RotuloSempreNoTopo: TLabel
      AlignWithMargins = True
      Left = 312
      Top = 9
      Width = 180
      Height = 21
      Margins.Left = 4
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 4
      Align = alLeft
      AutoSize = False
      Caption = 'Sempre no topo inativo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210943
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 351
    end
    object RotuloOcultarIconeBarraTarefas: TLabel
      AlignWithMargins = True
      Left = 562
      Top = 9
      Width = 210
      Height = 21
      Margins.Left = 4
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 4
      Align = alLeft
      AutoSize = False
      Caption = 'Ocultar '#237'cone da barra de tarefas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210943
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object RotuloSalvamento: TLabel
      AlignWithMargins = True
      Left = 1056
      Top = 9
      Width = 208
      Height = 21
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 16
      Margins.Bottom = 4
      Align = alRight
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Salvo localmente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 751
      ExplicitTop = 8
      ExplicitHeight = 22
    end
    object LinhaDivisoriaEstado: TPanel
      Left = 0
      Top = 0
      Width = 1280
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      Color = 3158064
      ParentBackground = False
      TabOrder = 1
    end
    object ChaveProtecaoCaptura: TToggleSwitch
      AlignWithMargins = True
      Left = 4
      Top = 7
      Width = 50
      Height = 21
      Margins.Left = 4
      Margins.Top = 6
      Margins.Right = 4
      Margins.Bottom = 6
      Align = alLeft
      ShowStateCaption = False
      State = tssOn
      TabOrder = 0
      OnClick = ChaveProtecaoCapturaClick
      ExplicitHeight = 20
    end
    object ChaveSempreNoTopo: TToggleSwitch
      AlignWithMargins = True
      Left = 254
      Top = 7
      Width = 50
      Height = 21
      Margins.Left = 4
      Margins.Top = 6
      Margins.Right = 4
      Margins.Bottom = 6
      Align = alLeft
      ShowStateCaption = False
      TabOrder = 2
      OnClick = ChaveSempreNoTopoClick
      ExplicitHeight = 20
    end
    object ChaveOcultarIconeBarraTarefas: TToggleSwitch
      AlignWithMargins = True
      Left = 504
      Top = 7
      Width = 50
      Height = 21
      Margins.Left = 4
      Margins.Top = 6
      Margins.Right = 4
      Margins.Bottom = 6
      Align = alLeft
      ShowStateCaption = False
      TabOrder = 3
      OnClick = ChaveOcultarIconeBarraTarefasClick
      ExplicitHeight = 20
    end
  end
  object PanelTextos: TPanel
    Left = 302
    Top = 0
    Width = 978
    Height = 726
    Align = alClient
    BevelOuter = bvNone
    Color = 1381653
    ParentBackground = False
    TabOrder = 2
    object RotuloSemTexto: TLabel
      Left = 259
      Top = 496
      Width = 244
      Height = 56
      Alignment = taCenter
      Caption = 'Nenhum texto criado'#13#10'Crie um texto para come'#231'ar.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
    end
    object EditorTexto: TRichEdit
      Left = 232
      Top = 248
      Width = 305
      Height = 214
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 1381653
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -37
      Font.Name = 'Segoe UI'
      Font.Style = []
      HideSelection = False
      ParentFont = False
      PlainText = True
      ScrollBars = ssVertical
      TabOrder = 0
      Visible = False
      OnChange = EditorTextoChange
    end
    object PainelEspelho: TPanel
      Left = 252
      Top = 272
      Width = 269
      Height = 170
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 1
      Visible = False
      object DesenhoEspelho: TPaintBox
        Left = 16
        Top = 16
        Width = 233
        Height = 137
        OnMouseDown = DesenhoEspelhoMouseDown
        OnPaint = DesenhoEspelhoPaint
      end
      object BarraRolagemEspelho: TScrollBar
        Left = 248
        Top = 0
        Width = 17
        Height = 166
        Align = alRight
        Kind = sbVertical
        LargeChange = 120
        Max = 0
        PageSize = 0
        SmallChange = 30
        TabOrder = 0
        OnChange = BarraRolagemEspelhoChange
      end
    end
    object PainelGrupoTexto: TPanel
      Left = 0
      Top = 0
      Width = 978
      Height = 58
      Align = alTop
      BevelOuter = bvNone
      Color = 2105376
      Enabled = False
      ParentBackground = False
      TabOrder = 2
      object RotuloGrupoTexto: TLabel
        AlignWithMargins = True
        Left = 20
        Top = 16
        Width = 486
        Height = 29
        Margins.Left = 20
        Margins.Top = 16
        Margins.Right = 12
        Margins.Bottom = 12
        Align = alClient
        AutoSize = False
        Caption = 'Grupo - Texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 946
      end
      object PainelAvisoEspelhamento: TPanel
        AlignWithMargins = True
        Left = 526
        Top = 12
        Width = 440
        Height = 33
        Margins.Left = 8
        Margins.Top = 12
        Margins.Right = 12
        Margins.Bottom = 12
        Align = alRight
        BevelOuter = bvNone
        Color = 3158064
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object RotuloAvisoEspelhamento: TLabel
          Left = 0
          Top = 0
          Width = 440
          Height = 33
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 
            'Edi'#231#227'o bloqueada: texto espelhado. Remova o espelhamento para ed' +
            'itar.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4695551
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
        end
      end
      object LinhaDivisoriaControles: TPanel
        Left = 0
        Top = 57
        Width = 978
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = 3158064
        ParentBackground = False
        TabOrder = 0
      end
    end
    object PainelAcoes: TPanel
      Left = 0
      Top = 148
      Width = 50
      Height = 578
      Align = alLeft
      BevelOuter = bvNone
      Color = 1973790
      ParentBackground = False
      TabOrder = 3
      object BotaoReproduzir: TSpeedButton
        Left = 9
        Top = 9
        Width = 32
        Height = 32
        Hint = 'Reproduzir rolagem'
        ImageIndex = 20
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoReproduzirClick
      end
      object BotaoInicio: TSpeedButton
        Left = 9
        Top = 49
        Width = 32
        Height = 32
        Hint = 'Ir ao inicio do texto'
        ImageIndex = 10
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoInicioClick
      end
      object BotaoRecuar: TSpeedButton
        Left = 9
        Top = 89
        Width = 32
        Height = 32
        Hint = 'Recuar a rolagem'
        ImageIndex = 18
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoRecuarClick
      end
      object BotaoAvancar: TSpeedButton
        Left = 9
        Top = 129
        Width = 32
        Height = 32
        Hint = 'Avancar a rolagem'
        ImageIndex = 2
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoAvancarClick
      end
      object BotaoTextoAnterior: TSpeedButton
        Left = 9
        Top = 218
        Width = 32
        Height = 32
        Hint = 'Abrir o texto anterior do grupo'
        ImageIndex = 24
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoTextoAnteriorClick
      end
      object BotaoProximoTexto: TSpeedButton
        Left = 9
        Top = 178
        Width = 32
        Height = 32
        Hint = 'Abrir o proximo texto do grupo'
        ImageIndex = 17
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoProximoTextoClick
      end
      object LinhaGrupoRolagem: TPanel
        Left = 6
        Top = 169
        Width = 38
        Height = 1
        BevelOuter = bvNone
        Color = 3158064
        ParentBackground = False
        TabOrder = 0
      end
      object PainelMostrarOpcoes: TPanel
        Left = 0
        Top = 528
        Width = 50
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        Color = 1973790
        ParentBackground = False
        TabOrder = 1
        object BotaoMostrarOpcoes: TSpeedButton
          Left = 9
          Top = 9
          Width = 32
          Height = 32
          Hint = 'Mostrar novamente os paineis'
          ImageIndex = 11
          Images = IconesBotoes
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = BotaoMostrarOpcoesClick
        end
        object LinhaDivisoriaMostrarOpcoes: TPanel
          Left = 6
          Top = 1
          Width = 38
          Height = 1
          BevelOuter = bvNone
          Color = 3158064
          ParentBackground = False
          TabOrder = 0
        end
      end
      object PainelAcoesTela: TPanel
        Left = 0
        Top = 399
        Width = 50
        Height = 129
        Align = alBottom
        BevelOuter = bvNone
        Color = 1973790
        ParentBackground = False
        TabOrder = 2
        object BotaoEspelhoHorizontal: TSpeedButton
          Left = 9
          Top = 47
          Width = 32
          Height = 32
          Hint = 'Ativar espelhamento horizontal'
          HelpContext = 32
          ImageIndex = 5
          Images = IconesBotoes
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = BotaoEspelhoHorizontalClick
        end
        object BotaoEspelhoVertical: TSpeedButton
          Left = 9
          Top = 9
          Width = 32
          Height = 32
          Hint = 'Ativar espelhamento vertical'
          ImageIndex = 7
          Images = IconesBotoes
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = BotaoEspelhoVerticalClick
        end
        object BotaoTelaCheia: TSpeedButton
          Left = 9
          Top = 89
          Width = 32
          Height = 32
          Hint = 'Entrar em tela cheia'
          ImageIndex = 23
          Images = IconesBotoes
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = BotaoTelaCheiaClick
        end
      end
    end
    object LinhaDivisoriaAcoes: TPanel
      Left = 50
      Top = 148
      Width = 1
      Height = 578
      Align = alLeft
      BevelOuter = bvNone
      Color = 3158064
      ParentBackground = False
      TabOrder = 4
    end
    object PainelControles: TPanel
      Left = 0
      Top = 58
      Width = 978
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      Color = 2105376
      Enabled = False
      ParentBackground = False
      TabOrder = 5
      object RotuloVelocidade: TLabel
        Left = 400
        Top = 20
        Width = 100
        Height = 15
        Caption = 'Velocidade: 60 px/s'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RotuloTransparencia: TLabel
        Left = 558
        Top = 20
        Width = 91
        Height = 15
        Caption = 'Opacidade: 100%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RotuloMargem: TLabel
        Left = 716
        Top = 20
        Width = 78
        Height = 15
        Caption = 'Margem: 40 px'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RotuloFonte: TLabel
        Left = 20
        Top = 20
        Width = 30
        Height = 15
        Caption = 'Fonte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RotuloTamanhoFonte: TLabel
        Left = 252
        Top = 20
        Width = 68
        Height = 15
        Caption = 'Tamanho: 28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object BotaoCorFonte: TSpeedButton
        Left = 205
        Top = 34
        Width = 36
        Height = 36
        Hint = 'Escolher a cor da fonte'
        ImageIndex = 3
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoCorFonteClick
      end
      object BotaoCorFundo: TSpeedButton
        Left = 874
        Top = 36
        Width = 36
        Height = 36
        Hint = 'Escolher a cor do fundo'
        ImageIndex = 4
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoCorFundoClick
      end
      object BotaoRestaurarAparencia: TSpeedButton
        Left = 918
        Top = 36
        Width = 36
        Height = 36
        Hint = 'Restaurar a aparencia padrao'
        ImageIndex = 21
        Images = IconesBotoes
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BotaoRestaurarAparenciaClick
      end
      object LinhaDivisoriaPainelControles: TPanel
        Left = 0
        Top = 89
        Width = 978
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = 3158064
        ParentBackground = False
        TabOrder = 5
      end
      object PainelVelocidade: TPanel
        Left = 400
        Top = 39
        Width = 140
        Height = 30
        BevelOuter = bvNone
        Color = 4210752
        ParentBackground = False
        TabOrder = 2
        object Velocidade: TTrackBar
          Left = 0
          Top = 0
          Width = 140
          Height = 30
          Align = alClient
          Max = 300
          Min = 10
          Frequency = 20
          Position = 60
          TabOrder = 0
          OnChange = ValoresChange
        end
      end
      object PainelTransparencia: TPanel
        Left = 558
        Top = 39
        Width = 140
        Height = 30
        BevelOuter = bvNone
        Color = 4210752
        ParentBackground = False
        TabOrder = 3
        object Transparencia: TTrackBar
          Left = 0
          Top = 0
          Width = 140
          Height = 30
          Align = alClient
          Max = 100
          Min = 20
          Frequency = 10
          Position = 100
          TabOrder = 0
          OnChange = ValoresChange
        end
      end
      object PainelMargem: TPanel
        Left = 716
        Top = 39
        Width = 140
        Height = 30
        BevelOuter = bvNone
        Color = 4210752
        ParentBackground = False
        TabOrder = 4
        object MargemTexto: TTrackBar
          Left = 0
          Top = 0
          Width = 140
          Height = 30
          Align = alClient
          Max = 200
          Frequency = 20
          Position = 40
          TabOrder = 0
          OnChange = AparenciaChange
        end
      end
      object ListaFontes: TComboBox
        Left = 20
        Top = 39
        Width = 176
        Height = 25
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = ListaFontesChange
      end
      object PainelTamanhoFonte: TPanel
        Left = 252
        Top = 39
        Width = 130
        Height = 30
        BevelOuter = bvNone
        Color = 4210752
        ParentBackground = False
        TabOrder = 1
        object TamanhoFonte: TTrackBar
          Left = 0
          Top = 0
          Width = 130
          Height = 30
          Align = alClient
          Max = 96
          Min = 12
          Frequency = 6
          Position = 28
          TabOrder = 0
          OnChange = AparenciaChange
        end
      end
    end
  end
  object TemporizadorAvisoEspelhamento: TTimer
    Enabled = False
    Interval = 140
    OnTimer = TemporizadorAvisoEspelhamentoTimer
    Left = 1024
    Top = 400
  end
  object TemporizadorRolagem: TTimer
    Interval = 16
    OnTimer = TemporizadorRolagemTimer
    Left = 1024
    Top = 208
  end
  object TemporizadorSalvamento: TTimer
    Enabled = False
    Interval = 600
    OnTimer = TemporizadorSalvamentoTimer
    Left = 1024
    Top = 272
  end
  object TemporizadorPreferencias: TTimer
    Enabled = False
    Interval = 800
    OnTimer = TemporizadorPreferenciasTimer
    Left = 1024
    Top = 336
  end
  object DialogoCorFonte: TColorDialog
    Options = [cdFullOpen]
    Left = 1168
    Top = 208
  end
  object DialogoCorFundo: TColorDialog
    Options = [cdFullOpen]
    Left = 1168
    Top = 272
  end
  object IconesBotoes: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Masked = False
    Width = 24
    Left = 1168
    Top = 336
    Bitmap = {
      494C010119002800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000A8000000010020000000000000FC
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000100C0C0C400C0C0C400C0C
      0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400303
      0320000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0C8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF5F5F
      5FB0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0838383CF0C0C0C3F0C0C
      0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F838383CF7171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3F9026262670717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004E4E4EA0C8C8C8FF32323280717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004E4E4EA0C8C8C8FF4D4D4D9F00000000717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3F90C8C8C8FFC8C8C8FF717171C0717171C0B1B1B1F0B1B1B1F0717171C02626
      2670000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003232
      3280C8C8C8FFC8C8C8FF707070BF707070BFAFAFAFEFAFAFAFEF707070BF2626
      2670000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004E4E4EA0C8C8C8FF4E4E4EA000000000717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004E4E4EA0C8C8C8FF32323280717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3F9026262670717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000000000100C0C0C400C0C0C400C0C0C40858585D07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF7171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C0838383CF2525256FC8C8C8FFAFAFAFEF0707
      0730000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C09A9A9AE0B1B1B1F0AFAFAFEF070707300000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0858585D00C0C0C400C0C
      0C400C0C0C400C0C0C40858585D0C8C8C8FFAFAFAFEF07070730000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5FB0C8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFAFAFAFEF0707073000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000100C0C0C3F0C0C0C3F0C0C
      0C3F0C0C0C3F0C0C0C3F0C0C0C3F030303200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C0C0C400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C0C0C405F5F5FB0B1B1B1F0C8C8
      C8FF858585D05F5F5FB00C0C0C40000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002626267026262670000000000000
      0000000000000000000026262670262626700000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000026262670717171C0717171C0717171C0717171C026262670000000000000
      0000000000000000000026262670717171C0717171C0717171C0717171C02626
      2670000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF717171C003030320000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40717171C0C8C8C8FF999999DF3E3E3E8F3131
      317F5E5E5EAF999999DFC8C8C8FF717171C00000001000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0AFAFAFEF707070BF707070BF707070BF26262670000000000000
      000000000000000000001C1C1C60707070BF707070BF707070BFAFAFAFEF7171
      71C0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FFC8C8C8FFC8C8C8FF323232800000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000007070730B1B1B1F0AFAFAFEF1B1B1B5F00000000000000000000
      000000000000000000001C1C1C60AFAFAFEF858585D000000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF131313504D4D4D9FC8C8C8FF9A9A
      9AE00C0C0C400000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000858585D0999999DF000000100000000000000000000000000000
      000000000000000000000000000007070730AFAFAFEF858585D0000000100000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C40000000000C0C0C409999
      99DFC8C8C8FF5F5F5FB000000010000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3F90C8C8C8FF0C0C0C40000000000000000000000000000000000000
      0000000000000000000000000000000000001C1C1C60C8C8C8FF1C1C1C600000
      0000000000000000000000000000000000000000000000000000000000000000
      000026262670717171C0717171C0717171C0B1B1B1F0717171C0000000000000
      00000000000000000000717171C0B1B1B1F0717171C0717171C0717171C02626
      2670000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C4000000000000000000000
      000032323280AFAFAFEFB1B1B1F0262626700000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000323232803232328000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009A9A9AE04E4E4EA00000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C60707070BF707070BF707070BF707070BF26262670000000000000
      000000000000000000001C1C1C60707070BF707070BF707070BF707070BF2626
      2670000000000000000000000000000000000000000000000000000000000000
      00001C1C1C602626267000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1C1C602626
      2670000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C4000000000000000000000
      00000000000003030320707070BFC8C8C8FF858585D007070730000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3F90B1B1B1F00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C4000000000000000000000
      000000000000000000000000000013131350AFAFAFEFC8C8C8FF323232800000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000026262670C8C8C8FF0000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C4000000000000000000000
      000000000000000000000000000013131350B1B1B1F0C8C8C8FF262626700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000032323280C8C8C8FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C4000000000000000000000
      00000000000003030320717171C0C8C8C8FF838383CF07070730000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004E4E4EA0838383CF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C4000000000000000000000
      000032323280B1B1B1F0AFAFAFEF2525256F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C0C0C4000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000010B1B1B1F05F5F5FB00000
      0000000000000000000000000000000000000000000000000000000000000000
      000026262670717171C0717171C0717171C0717171C026262670000000000000
      0000000000000000000026262670717171C0717171C0717171C0717171C02626
      2670000000000000000000000000000000000000000000000000000000000000
      0000262626702626267000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000262626702626
      2670000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C40000000000C0C0C409A9A
      9AE0C8C8C8FF5E5E5EAF03030320000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000026262670C8C8C8FF858585D0717171C0717171C026262670000000000000
      000000000000000000000000000000000000717171C0AFAFAFEF030303200000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C60707070BF707070BF707070BFAFAFAFEF717171C0000000000000
      00000000000000000000717171C0AFAFAFEF707070BF707070BF707070BF2626
      2670000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF131313504E4E4EA0C8C8C8FF9999
      99DF0C0C0C400000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0C8C8C8FFC8C8C8FFAFAFAFEF707070BF26262670000000000000
      00000000000000000000000000104E4E4EA0C8C8C8FF1C1C1C60000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FFC8C8C8FFC8C8C8FF3131317F0000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C04E4E4EA0C8C8C8FF858585D026262670000000100000
      000007070730131313509A9A9AE0C8C8C8FF3E3E3E8F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000007070730C8C8C8FF707070BF07070730000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C00000000026262670838383CFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FF999999DF0C0C0C400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0B1B1B1F0717171C0717171C0717171C026262670000000000000
      0000000000000000000026262670717171C0717171C0717171C0B1B1B1F07171
      71C0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000070707300000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C0000000000000000000000000030303202525256F3131
      317F1B1B1B5F0707073000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001C1C1C6026262670000000000000
      000000000000000000001C1C1C60262626700000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C60707070BF707070BF707070BF707070BF26262670000000000000
      000000000000000000001C1C1C60707070BF707070BF707070BF707070BF2626
      2670000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C602626267000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000100C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C
      0C400C0C0C400C0C0C400C0C0C40030303200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C0C0C401313135000000000000000000000
      00000000000000000000000000000C0C0C401313135000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FF5F5F5FB00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002626
      2670262626700000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000323232804E4E4EA01C1C1C60030303200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFB1B1B1F000000000000000000000
      0000000000000000000000000000C8C8C8FFB1B1B1F000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0838383CF0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C
      0C3F0C0C0C3F0C0C0C3F838383CF717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004E4E4EA0C8C8C8FFC8C8C8FFC8C8C8FF909090D9686868B8000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C0262626703F3F3F90000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C60C8C8C8FF1C1C1C603A3A3A8AC0C0C0FAC8C8C8FF4E4E4EA00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C032323280C8C8C8FF4E4E4EA00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000003030320C8C8C8FF3B3B3B8BB1B1B1F0838383CF2222226AC8C8C8FF4E4E
      4EA0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C0000000004E4E4EA0C8C8C8FF4E4E
      4EA0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000909090D9C1C1C1FB838383CF00000010000000001C1C1C60C8C8
      C8FF4E4E4EA00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      000026262670717171C0B1B1B1F0B1B1B1F0717171C0717171C0C8C8C8FFC8C8
      C8FF323232800000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000686868B8C8C8C8FF2222226A0000000000000000000000001C1C
      1C60C8C8C8FF4E4E4EA000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      00001C1C1C60707070BFAFAFAFEFAFAFAFEF707070BF707070BFC8C8C8FFC8C8
      C8FF323232800000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004E4E4EA0C8C8C8FF1C1C1C6000000000000000000000
      00001C1C1C60C8C8C8FF4E4E4EA0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C0000000004E4E4EA0C8C8C8FF4D4D
      4D9F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004E4E4EA0C8C8C8FF1C1C1C60000000000000
      0000000000001C1C1C60C8C8C8FF4E4E4EA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C032323280C8C8C8FF4D4D4D9F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000262626703F3F3F90000000000000000000000000000000007171
      71C0717171C0000000000000000000000000000000003F3F3F90262626700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E4E4EA0C8C8C8FF1C1C1C600000
      000000000000000000001C1C1C60C8C8C8FF4E4E4EA000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C0262626703E3E3E8F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000032323280C8C8C8FF4E4E4EA00000000000000000000000007171
      71C0717171C00000000000000000000000004E4E4EA0C8C8C8FF323232800000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004E4E4EA0C8C8C8FF1C1C
      1C600000000000000000000000001C1C1C60C8C8C8FF4E4E4EA0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000000000100C0C
      0C400C0C0C400C0C0C40858585D0717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004E4E4EA0C8C8C8FF4E4E4EA000000000000000007171
      71C0717171C000000000000000004E4E4EA0C8C8C8FF4D4D4D9F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4EA0C8C8
      C8FF1C1C1C600000000000000000000000002222226AC8C8C8FF7D7D7DCA0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000717171C0C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FF717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004E4E4EA0C8C8C8FF4E4E4EA0000000007171
      71C0717171C0000000004E4E4EA0C8C8C8FF4D4D4D9F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004E4E
      4EA0C8C8C8FF1C1C1C600000000000000010858585D0B7B7B7F5C8C8C8FF3F3F
      3F90000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000717171C08383
      83CF2525256FC8C8C8FFAFAFAFEF070707300000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E4E4EA0C8C8C8FF4E4E4EA07171
      71C0717171C04E4E4EA0C8C8C8FF4D4D4D9F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004E4E4EA0C8C8C8FF2222226A858585D0AFAFAFEF0707073032323280C8C8
      C8FF030303200000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000C8C8C8FFC8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0717171C000000000000000000000000000000000717171C09A9A
      9AE0B1B1B1F0AFAFAFEF07070730000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004E4E4EA0C8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FF4D4D4D9F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004E4E4EA0C8C8C8FFB7B7B7F507070730000000005F5F5FB0AFAF
      AFEF000000100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FFAFAFAFEF00000000000000000000
      0000000000000000000000000000C8C8C8FFAFAFAFEF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171C0858585D00C0C0C400C0C0C400C0C0C400C0C0C40858585D0C8C8
      C8FFAFAFAFEF0707073000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4EA0C8C8
      C8FFC8C8C8FF4D4D4D9F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007D7D7DCAC8C8C8FF323232804E4E4EA0C8C8C8FF1C1C
      1C60000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C0C0C401313135000000000000000000000
      00000000000000000000000000000C0C0C401313135000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005F5F5FB0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFAFAF
      AFEF070707300000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3F903E3E3E8F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004E4E4EA0C8C8C8FFC8C8C8FF1C1C1C600000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000100C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0303
      0320000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000707073003030320000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002626
      2670262626700000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004E4E4EA0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF4E4E4EA00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3F903F3F3F900000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004E4E
      4EA0B1B1B1F0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FF3F3F3F900000000000000000000000000000000000000000000000000000
      000000000000717171C0999999DF3131317F3131317F3131317F3131317F3131
      317F3131317F3131317F3131317F3131317F3131317F999999DF717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4EA0C8C8
      C8FFC8C8C8FF4E4E4EA000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1C1C60C8C8
      C8FF707070BF3131317F3131317F3131317F3131317F3131317F3131317F3131
      317F3131317F3131317F3131317F3131317F3131317F3131317F3131317F5E5E
      5EAFC8C8C8FF1313135000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      00000000000000000000000000000000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004E4E4EA0C8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FF4E4E4EA0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0010C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      00000000000026262670262626700000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E4E4EA0C8C8C8FF4D4D4D9F7171
      71C0717171C04E4E4EA0C8C8C8FF4E4E4EA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001C1C1C609A9A9AE000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      000000000000717171C0717171C00000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004E4E4EA0C8C8C8FF4D4D4D9F000000007171
      71C0717171C0000000004E4E4EA0C8C8C8FF4E4E4EA000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000032323280C8C8C8FF00000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000707
      07300C0C0C40858585D0858585D00C0C0C400C0C0C40717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004E4E4EA0C8C8C8FF4D4D4D9F00000000000000007171
      71C0717171C000000000000000004E4E4EA0C8C8C8FF4E4E4EA0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      0000000000001C1C1C6032323280717171C0C8C8C8FF32323280323232800303
      0320C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000717171C0717171C000000000000000000000000007070730C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF7A7A7AC8717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000003030320C8C8C8FF4D4D4D9F0000000000000000000000007171
      71C0717171C00000000000000000000000004E4E4EA0C8C8C8FF030303200000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      000000000000858585D0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF1C1C
      1C60C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000707
      07300C0C0C3F838383CF838383CF0C0C0C3F0C0C0C3F717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40000000000000000000000000000000007171
      71C0717171C0000000000000000000000000000000000C0C0C40000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000032323280C8C8C8FF00000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      000000000000717171C0717171C00000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40000000000000000000000000000000007171
      71C0717171C0000000000000000000000000000000000C0C0C40000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000032323280C8C8C8FF00000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      0000000000001C1C1C60262626700000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000003030320C8C8C8FF4E4E4EA00000000000000000000000007171
      71C0717171C00000000000000000000000004E4E4EA0C8C8C8FF030303200000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000101C1C1C6000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      00000000000000000000000000000000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004E4E4EA0C8C8C8FF4E4E4EA000000000000000007171
      71C0717171C000000000000000004E4E4EA0C8C8C8FF4D4D4D9F000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0010C8C8C8FF2626267000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      00000C0C0C40323232803232328032323280323232809A9A9AE0848484D00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004E4E4EA0C8C8C8FF4E4E4EA0000000007171
      71C0717171C0000000004E4E4EA0C8C8C8FF4D4D4D9F00000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000103232
      3280323232803232328032323280323232803232328032323280323232805F5F
      5FB0C8C8C8FF0303032000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      0000717171C0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF9C9C9CE20000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E4E4EA0C8C8C8FF4E4E4EA07171
      71C0717171C04E4E4EA0C8C8C8FF4D4D4D9F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000010858585D0C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF8383
      83CF2525256F0000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      0000717171C0717171C0000000001C1C1C60C8C8C8FF838383CF000000100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004E4E4EA0C8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FF4D4D4D9F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000026262670C8C8
      C8FF323232800C0C0C400C0C0C400C0C0C400C0C0C40858585D0C8C8C8FF1C1C
      1C60000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      0000717171C0717171C01C1C1C60C8C8C8FF838383CF00000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4EA0C8C8
      C8FFC8C8C8FF4D4D4D9F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000109999
      99DFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF1C1C1C600000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000000000
      0000717171C08E8E8ED8C8C8C8FF838383CF0000001000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3F903E3E3E8F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000C0C0C400C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F07070730000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000717171C09A9A9AE0323232803232328032323280323232803232
      32809F9F9FE4C8C8C8FF838383CF000000100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C1C
      1C60262626700000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3F90C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFACACACED00000010000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000311C0A7090531EC090531EC090531EC090531EC090531EC09053
      1EC090531EC090531EC090531EC090531EC090531EC090531EC0311C0A700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000030303200C0C0C400C0C0C400C0C0C400C0C
      0C400C0C0C400C0C0C400C0C0C400C0C0C400303032000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00101C1C1C603232328032323280323232803232328032323280323232803232
      328032323280323232804E4E4EA04E4E4EA03232328032323280323232802626
      2670030303200000000000000000000000000000000000000000000000000000
      00000000000090531EC0E0812FEF8F521EBF8F521EBFBC6C28DBCA752AE38F52
      1EBF8F521EBFCA752AE3BC6C28DB8F521EBF8F521EBFE0812FEF90531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005F5F5FB0C8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF5F5F5FB000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002626
      2670262626700000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000003030320C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FF0000001000000000000000000000000000000000000000000000
      00000000000090531EC090531EC0000000000000000040250D80FF9436FF643A
      15A0643A15A0FF9436FF40250D80000000000000000090531EC090531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000717171C0838383CF0C0C0C3F0C0C0C3F0C0C
      0C3F0C0C0C3F0C0C0C3F0C0C0C3F838383CF717171C000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000026262670C8C8
      C8FF030303200000000000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C00000000000000000000000000303
      0320C8C8C8FF1C1C1C6000000000000000000000000000000000000000000000
      00000000000090531EC090531EC0000000000000000000000000643A15A0FF94
      36FFFF9436FF6339159F00000000000000000000000090531EC090531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B1B1B1F03F3F3F9000000010030303200000
      00000000000000000010030303203F3F3F90B1B1B1F000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      00000000000090531EC090531EC000000000000000000000000000000000512E
      1190502E108F0000000000000000000000000000000090531EC090531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FF32323280717171C05F5F5FB00000
      000000000000717171C05F5F5FB032323280C8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      00000000000090531EC0E1832FF090531EC090531EC090531EC090531EC09053
      1EC090531EC090531EC090531EC090531EC090531EC0E1832FF090531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C8C8C8FF32323280717171C0717171C00000
      000000000000717171C0717171C032323280C8C8C8FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF0000000000000000000000004E4E4EA01C1C1C6000000000000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000241507608F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F52
      1EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBF311C0A700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000010C8C8C8FF26262670717171C0717171C00000
      000000000000717171C0717171C026262670C8C8C8FF00000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF0000000000000000000000005F5F5FB0C8C8C8FF3F3F3F90000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C40717171C0717171C00000
      000000000000717171C0717171C00C0C0C40C8C8C8FF0C0C0C40000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000262626703F3F3F900000000000000000000000007171
      71C0717171C00000000000000000000000003F3F3F9026262670000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000003F3F3F90C8C8C8FF717171C00000
      00100000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000090531EC090531EC090531EC090531EC090531EC090531EC090531EC09053
      1EC090531EC090531EC090531EC090531EC090531EC090531EC090531EC09053
      1EC0000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C40717171C0717171C00000
      000000000000717171C0717171C00C0C0C40C8C8C8FF0C0C0C40000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000032323280C8C8C8FF4E4E4EA000000000000000007171
      71C0717171C000000000000000004E4E4EA0C8C8C8FF32323280000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000000000001C1C1C60AFAFAFEF9A9A
      9AE00000001000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000090531EC08F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F52
      1EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F52
      1EBF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C40C8C8C8FF0C0C0C40717171C0717171C00000
      000000000000717171C0717171C00C0C0C40C8C8C8FF0C0C0C40000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004E4E4EA0C8C8C8FF4E4E4EA0000000007171
      71C0717171C0000000004E4E4EA0C8C8C8FF4D4D4D9F00000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000000000001C1C1C60B1B1B1F09999
      99DF0000001000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000026262670C8C8C8FF000000105F5F5FB05F5F5FB00000
      0000000000005F5F5FB05F5F5FB000000010C8C8C8FF26262670000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E4E4EA0C8C8C8FF4E4E4EA07171
      71C0717171C04E4E4EA0C8C8C8FF4D4D4D9F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000003F3F3F90C8C8C8FF707070BF0000
      00100000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000311C0A7090531EC090531EC090531EC090531EC090531EC09053
      1EC090531EC090531EC090531EC090531EC090531EC090531EC0311C0A700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000032323280C8C8C8FF0000000000000010030303200000
      000000000000000000100303032000000000C8C8C8FF32323280000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004E4E4EA0C8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FF4D4D4D9F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF0000000000000000000000005F5F5FB0C8C8C8FF3E3E3E8F000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      00000000000090531EC0E0812FEF8F521EBF8F521EBF8F521EBF8F521EBF8F52
      1EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBFE0812FEF90531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C404D4D4D9F0000000000000000000000000000
      0000000000000000000000000000000000005F5F5FB00C0C0C40000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4EA0C8C8
      C8FFC8C8C8FF4D4D4D9F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF0000000000000000000000004E4E4EA01C1C1C6000000000000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      00000000000090531EC090531EC000000000000000000000000000000000512E
      1190512E11900000000000000000000000000000000090531EC090531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000100C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C
      0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C400303
      0320000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3F903E3E3E8F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      00000000000090531EC090531EC0000000000000000000000000643A15A0FF94
      36FFFF9436FF643A15A000000000000000000000000090531EC090531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      00005F5F5FB0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF4E4E
      4EA0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C00000000000000000000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      00000000000090531EC090531EC0000000000000000040250D80FF9436FF6339
      159F643A15A0FF9436FF40250D80000000000000000090531EC090531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000100C0C0C3F0C0C0C3F0C0C0C3F838383CF838383CF0C0C0C3F0C0C
      0C3F0C0C0C3F0C0C0C3F838383CF838383CF0C0C0C3F0C0C0C3F0C0C0C3F0303
      0320000000000000000000000000000000000000000000000000000000000000
      000026262670717171C0717171C0717171C0717171C0717171C0717171C07171
      71C0717171C0717171C0717171C0717171C0717171C0717171C0717171C02626
      267000000000000000000000000000000000000000000000000026262670C8C8
      C8FF070707300000000000000000000000000000000000000000000000000000
      00000000000000000000717171C0717171C00000000000000000000000000303
      0320C8C8C8FF1C1C1C6000000000000000000000000000000000000000000000
      00000000000090531EC0E1832FF090531EC090531EC0BD6D28DCCA752AE39053
      1EC090531EC0CB752AE4BD6D28DC90531EC090531EC0E1832FF090531EC00000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171C0C8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FF717171C00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C60707070BF707070BF707070BF707070BF707070BF707070BF7070
      70BF707070BF707070BF707070BF707070BF707070BF707070BF707070BF2626
      267000000000000000000000000000000000000000000000000003030320C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FF0000001000000000000000000000000000000000000000000000
      000000000000241507608F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F52
      1EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBF8F521EBF311C0A700000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000070707303131317F3131317F3131
      317F3131317F3131317F3131317F0C0C0C400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00101B1B1B5F3131317F3131317F3131317F3131317F3131317F3131317F3131
      317F3131317F3131317F464646974D4D4D9F3131317F3131317F3131317F2525
      256F030303200000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026262670717171C0717171C0717171C0717171C0717171C07171
      71C0717171C0717171C0717171C0717171C0717171C0717171C0262626700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000030303200C0C0C4003030320000000000000
      000000000000000000000000000000000000000000000C0C0C405F5F5FB07171
      71C01C1C1C600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009053
      1EC090531EC00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000717171C0AFAFAFEF707070BF707070BF939393DB9E9E9EE37070
      70BF707070BF9E9E9EE3939393DB707070BF707070BFAFAFAFEF717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000007070730858585D0C8C8C8FFC8C8C8FFC8C8C8FF3F3F3F900000
      0000000000000000000000000000000000000C0C0C40C8C8C8FFAFAFAFEF9999
      99DFC8C8C8FF1C1C1C6000000000000000000000000000000000000000002626
      2670717171C0717171C0717171C0717171C0717171C026262670000000007171
      71C0717171C00000000026262670717171C0717171C0717171C0717171C07171
      71C026262670000000000000000000000000000000000000000000000000311C
      0A7090531EC090531EC090531EC090531EC090531EC0311C0A70000000009053
      1EC090531EC000000000311C0A7090531EC090531EC090531EC090531EC09053
      1EC0311C0A700000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000032323280C8C8C8FF4E4E
      4EA04E4E4EA0C8C8C8FF323232800000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      000007070730B1B1B1F0999999DF0C0C0C40000000104D4D4D9FC8C8C8FF4E4E
      4EA0000000000000000000000000000000005F5F5FB0999999DF000000000000
      0000B1B1B1F05F5F5FB000000000000000000000000000000000000000007171
      71C0AFAFAFEF707070BF707070BF707070BFAFAFAFEF717171C0000000007171
      71C0717171C000000000717171C0AFAFAFEF707070BF707070BF707070BFAFAF
      AFEF717171C00000000000000000000000000000000000000000000000009053
      1EC0E0812FEF8F521EBF8F521EBF8F521EBFE0812FEF90531EC0000000009053
      1EC090531EC00000000090531EC0E0812FEF8F521EBF8F521EBF8F521EBFE081
      2FEF90531EC00000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C00000000000000000000000004E4E4EA0C8C8
      C8FFC8C8C8FF4D4D4D9F000000000000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000858585D0AFAFAFEF000000100000000000000000000000004E4E4EA0C8C8
      C8FF4E4E4EA00000000000000000000000003F3F3F90B1B1B1F0000000100000
      0010B1B1B1F03F3F3F9000000000000000000000000000000000000000007171
      71C0717171C0000000000000000000000000717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C00000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000009053
      1EC090531EC000000000000000000000000090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC00000000000000000000000009053
      1EC090531EC00000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000003F3F
      3F903E3E3E8F00000000000000000000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0C40C8C8C8FF2626267000000000000000000000000000000000000000004E4E
      4EA0C8C8C8FF4E4E4EA0000000000000000007070730C8C8C8FF4E4E4EA04E4E
      4EA0C8C8C8FF0303032000000000000000000000000000000000000000007171
      71C0717171C0000000000000000000000000717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C00000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000009053
      1EC090531EC000000000000000000000000090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC00000000000000000000000009053
      1EC090531EC00000000000000000000000000000000000000000000000000000
      000000000000717171C0B1B1B1F0717171C0717171C0717171C0717171C07171
      71C0717171C0717171C0717171C0717171C0717171C0B1B1B1F0717171C00000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0C40C8C8C8FF3232328000000000000000000000000000000000000000000000
      00004E4E4EA0C8C8C8FF4E4E4EA000000000000000001C1C1C60C8C8C8FFC8C8
      C8FF1C1C1C600000000000000000000000000000000000000000000000007171
      71C0949494DC3F3F3F900000000000000000717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C000000000000000003F3F3F909494
      94DC717171C00000000000000000000000000000000000000000000000009053
      1EC0BD6D28DC512E1190000000000000000090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC00000000000000000512E1190BD6D
      28DC90531EC00000000000000000000000000000000000000000000000000000
      0000000000001C1C1C60707070BF707070BF707070BF707070BF707070BF7070
      70BF707070BF707070BF707070BF707070BF707070BF707070BF262626700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000858585D0B1B1B1F007070730000000000000000000000000000000000000
      0000000000004E4E4EA0C8C8C8FF4E4E4EA00000000000000000323232803232
      3280000000000000000000000000000000000000000000000000000000007171
      71C09A9A9AE0C8C8C8FF4E4E4EA000000000717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C0000000004E4E4EA0C8C8C8FF9A9A
      9AE0717171C00000000000000000000000000000000000000000000000009053
      1EC0C47129E0FF9436FF643A15A00000000090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC000000000643A15A0FF9436FFC471
      29E090531EC00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000010838383CFB1B1B1F0070707300000000000000000000000000000
      000000000000000000004E4E4EA0C8C8C8FF3232328000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C04E4E4EA0C8C8C8FF32323280717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C032323280C8C8C8FF4D4D4D9F7171
      71C0717171C00000000000000000000000000000000000000000000000009053
      1EC090531EC0643A15A0FF9436FF40250D8090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC040250D80FF9436FF6339159F9053
      1EC090531EC00000000000000000000000000000000000000000000000000000
      0000717171C0717171C0717171C0717171C0717171C0717171C0717171C07171
      71C0717171C0717171C0717171C0717171C0717171C0717171C0717171C07171
      71C0000000000000000000000000000000000000000000000000000000000000
      00000000000000000010838383CFB1B1B1F00707073000000000000000000000
      000000000000000000004E4E4EA0C8C8C8FF3232328000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C04E4E4EA0C8C8C8FF32323280717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C032323280C8C8C8FF4E4E4EA07171
      71C0717171C00000000000000000000000000000000000000000000000009053
      1EC090531EC0643A15A0FF9436FF40250D8090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC040250D80FF9436FF643A15A09053
      1EC090531EC00000000000000000000000000000000000000000000000000000
      0000717171C0707070BF707070BF707070BF707070BF707070BF707070BF7070
      70BF707070BF707070BF707070BF707070BF707070BF707070BF707070BF7070
      70BF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000010838383CFB1B1B1F007070730000000000000
      0000000000004E4E4EA0C8C8C8FF4D4D4D9F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C09A9A9AE0C8C8C8FF4D4D4D9F00000000717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C0000000004E4E4EA0C8C8C8FF9A9A
      9AE0717171C00000000000000000000000000000000000000000000000009053
      1EC0C47129E0FF9436FF6339159F0000000090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC000000000643A15A0FF9436FFC471
      29E090531EC00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000010838383CFB1B1B1F0070707300000
      00004E4E4EA0C8C8C8FF4D4D4D9F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0949494DC3E3E3E8F0000000000000000717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C000000000000000003F3F3F909494
      94DC717171C00000000000000000000000000000000000000000000000009053
      1EC0BD6D28DC502E108F000000000000000090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC00000000000000000512E1190BD6D
      28DC90531EC00000000000000000000000000000000000000000000000000000
      00000000000026262670717171C0717171C0717171C0717171C0717171C07171
      71C0717171C0717171C0717171C0717171C0717171C0717171C0262626700000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000010838383CFB1B1B1F05F5F
      5FB0C8C8C8FF4D4D4D9F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C0000000000000000000000000717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C00000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000009053
      1EC090531EC000000000000000000000000090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC00000000000000000000000009053
      1EC090531EC00000000000000000000000000000000000000000000000000000
      000000000000717171C0AFAFAFEF707070BF707070BF707070BF707070BF7070
      70BF707070BF707070BF707070BF707070BF707070BFAFAFAFEF717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000010AFAFAFEFC8C8
      C8FF4D4D4D9F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C0000000000000000000000000717171C0717171C0000000007171
      71C0717171C000000000717171C0717171C00000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000009053
      1EC090531EC000000000000000000000000090531EC090531EC0000000009053
      1EC090531EC00000000090531EC090531EC00000000000000000000000009053
      1EC090531EC00000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000000000000000000003F3F
      3F903F3F3F9000000000000000000000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3F90C8C8C8FF4D4D
      4D9F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0B1B1B1F0717171C0717171C0717171C0B1B1B1F0717171C0000000007171
      71C0717171C000000000717171C0B1B1B1F0717171C0717171C0717171C0B1B1
      B1F0717171C00000000000000000000000000000000000000000000000009053
      1EC0E1832FF090531EC090531EC090531EC0E1832FF090531EC0000000009053
      1EC090531EC00000000090531EC0E1832FF090531EC090531EC090531EC0E183
      2FF090531EC00000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C00000000000000000000000004E4E4EA0C8C8
      C8FFC8C8C8FF4E4E4EA0000000000000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1B1B1F04D4D4D9F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C1C
      1C60707070BF707070BF707070BF707070BF707070BF26262670000000007171
      71C0717171C0000000001C1C1C60707070BF707070BF707070BF707070BF7070
      70BF262626700000000000000000000000000000000000000000000000002415
      07608F521EBF8F521EBF8F521EBF8F521EBF8F521EBF311C0A70000000009053
      1EC090531EC000000000241507608F521EBF8F521EBF8F521EBF8F521EBF8F52
      1EBF311C0A700000000000000000000000000000000000000000000000000000
      000000000000717171C0717171C0000000000000000032323280C8C8C8FF4D4D
      4D9F4E4E4EA0C8C8C8FF323232800000000000000000717171C0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009053
      1EC090531EC00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000717171C0B1B1B1F0717171C0717171C0949494DC9E9E9EE37171
      71C0717171C09F9F9FE4949494DC717171C0717171C0B1B1B1F0717171C00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C1C1C60707070BF707070BF707070BF707070BF707070BF7070
      70BF707070BF707070BF707070BF707070BF707070BF707070BF262626700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00101C1C1C603232328032323280323232804E4E4EA04E4E4EA0323232803232
      3280323232803232328032323280323232803232328032323280323232802626
      2670030303200000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000026262670717171C0717171C0717171C0717171C0717171C0717171C07171
      71C0717171C0717171C0717171C0717171C0717171C0717171C0717171C02626
      267000000000000000000000000000000000000000000000000003030320C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FF0000001000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3F903F3F3F900000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1C1C60707070BF707070BF707070BF707070BF707070BF707070BF7070
      70BF707070BF707070BF707070BF707070BF707070BF707070BF707070BF2626
      267000000000000000000000000000000000000000000000000026262670C8C8
      C8FF03030320000000000000000000000000717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0320C8C8C8FF1C1C1C6000000000000000000000000000000000000000000303
      0320262626703232328032323280323232803232328032323280323232803232
      3280323232803232328032323280323232803232328032323280323232803232
      3280030303200000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4EA0C8C8
      C8FFC8C8C8FF4E4E4EA000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000003030320C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFB1B1B1F00303032000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004E4E4EA0C8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FF4E4E4EA0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002626267032323280000000000000000000000000000000000000
      0000000000000000000000000000000000000000000032323280262626700000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF0C0C0C4000000000000000100C0C0C400C0C0C400C0C0C400C0C0C400C0C
      0C400C0C0C400C0C0C400C0C0C400C0C0C400C0C0C4003030320000000000C0C
      0C40C8C8C8FF2626267000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E4E4EA0C8C8C8FF4D4D4D9F7171
      71C0717171C04E4E4EA0C8C8C8FF4E4E4EA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004E4E4EA0B1B1B1F0000000100000000000000000000000000000
      00000000000000000000000000000000000000000010B1B1B1F04E4E4EA00000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000000000001C1C1C604E4E4EA000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF00000000000000005F5F5FB0C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF4E4E4EA0000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      00000000000000000000000000004E4E4EA0C8C8C8FF4D4D4D9F000000007171
      71C0717171C0000000004E4E4EA0C8C8C8FF4E4E4EA000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000007070730C8C8C8FF262626700000000000000000000000000000
      00000000000000000000000000000000000026262670C8C8C8FF070707300000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      000000000000000000003F3F3F90C8C8C8FF5E5E5EAF00000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF0000000000000000000000100C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C
      0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F0C0C0C3F03030320000000000000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000000000004E4E4EA0C8C8C8FF4D4D4D9F00000000000000007171
      71C0717171C000000000000000004E4E4EA0C8C8C8FF4E4E4EA0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000717171C09A9A9AE00000000000000000000000000000
      0000000000000000000000000000000000009A9A9AE0707070BF000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      000000000010717171C0C8C8C8FF3E3E3E8F0000000000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF0000000000000000070707300C0C0C4000000000000000100C0C0C400303
      032000000000070707300C0C0C4000000000000000100C0C0C40030303200000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      00000000000032323280C8C8C8FF4D4D4D9F0000000000000000000000007171
      71C0717171C00000000000000000000000004E4E4EA0C8C8C8FF323232800000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001C1C1C60C8C8C8FF717171C0717171C0717171C07171
      71C0717171C0717171C0717171C0717171C0C8C8C8FF1C1C1C60000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      00109A9A9AE0AFAFAFEF1C1C1C60000000000000000000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF0000000007070730C8C8C8FFC8C8C8FF030303205F5F5FB0C8C8C8FF4E4E
      4EA007070730C8C8C8FFC8C8C8FF030303205F5F5FB0C8C8C8FF4E4E4EA00000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      000000000000262626703E3E3E8F000000000000000000000000000000007171
      71C0717171C0000000000000000000000000000000003F3F3F90262626700000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B1B1B1F0AFAFAFEF707070BF707070BF7070
      70BF707070BF707070BF707070BFAFAFAFEFAFAFAFEF00000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      0010999999DFB1B1B1F01C1C1C60000000000000000000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF0000000000000000070707300C0C0C3F00000000000000100C0C0C3F0303
      032000000000070707300C0C0C3F00000000000000100C0C0C3F030303200000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000032323280C8C8C8FF03030320000000000000
      0000000000000000000003030320C8C8C8FF3232328000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      000000000010707070BFC8C8C8FF3F3F3F900000000000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF0000000000000000070707300C0C0C4000000000000000100C0C0C400303
      032000000000070707300C0C0C4000000000000000100C0C0C40030303200000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003030320C8C8C8FF32323280000000000000
      0000000000000000000032323280C8C8C8FF0303032000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      000000000000000000003F3F3F90C8C8C8FF5F5F5FB000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF0000000007070730C8C8C8FFC8C8C8FF030303205F5F5FB0C8C8C8FF4E4E
      4EA007070730C8C8C8FFC8C8C8FF030303205F5F5FB0C8C8C8FF4E4E4EA00000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5FB0B1B1B1F0000000000000
      00000000000000000000B1B1B1F05F5F5FB00000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      00000000000000000000000000001C1C1C604D4D4D9F00000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000032323280C8C8
      C8FF0000000000000000070707300C0C0C3F00000000000000100C0C0C3F0303
      032000000000070707300C0C0C3F00000000000000100C0C0C3F030303200000
      0000C8C8C8FF3232328000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C0C0C40C8C8C8FF1C1C1C600000
      0000000000001C1C1C60C8C8C8FF0C0C0C400000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000026262670C8C8
      C8FF0C0C0C400000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0C40C8C8C8FF1313135000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009A9A9AE0717171C00000
      000000000000717171C0999999DF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323280C8C8
      C8FF00000000000000000000000000000000717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8C8C8FF323232800000000000000000000000000000000003030320C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFAFAFAFEF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000026262670C8C8C8FF0707
      073007070730C8C8C8FF26262670000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000026262670C8C8
      C8FF07070730000000000000000000000000717171C0717171C0000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0320C8C8C8FF1C1C1C6000000000000000000000000000000000000000000303
      03202525256F3131317F3131317F3131317F3131317F3131317F3131317F3131
      317F3131317F3131317F3131317F3131317F3131317F3131317F3131317F1313
      134F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71C0717171C00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000010AFAFAFEF9A9A
      9AE09A9A9AE0AFAFAFEF00000010000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000003030320C8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
      C8FFC8C8C8FF0000001000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C1C
      1C60262626700000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000323232807070
      70BF707070BF2626267000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00101B1B1B5F3131317F3131317F3131317F464646974D4D4D9F3131317F3131
      317F3131317F3131317F3131317F3131317F3131317F3131317F3131317F2525
      256F030303200000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000A80000000100010000000000E00700000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
