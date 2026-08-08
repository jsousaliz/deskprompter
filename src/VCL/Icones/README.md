# Ícones da interface VCL

- Cada arquivo `.svg` é a fonte utilizada diretamente pelo `TImageList`.
- Os ícones possuem dimensão lógica de 24 × 24 pixels.
- Os ícones usam, em geral, traço de 1,5 px, cantos arredondados e a cor
  `#C8C8C8`.
- Estados ativos usam a cor de destaque `#3794FF`.
- Não é necessário gerar PNG ou BMP intermediário.

## Configuração do TImageList

Para preservar a transparência e o antialiasing dos SVGs:

```text
ColorDepth   = cd32Bit
DrawingStyle = dsTransparent
Masked       = False
BkColor      = clNone
BlendColor   = clNone
Height       = 24
Width        = 24
Scaled       = False
```

Os arquivos devem ser adicionados diretamente pelo editor do `TImageList`. A
ordem utilizada no editor precisa corresponder exatamente à ordem declarada no
enumerado de ícones do projeto.
