# Ícones da interface VCL

- O arquivo `.svg` é a fonte vetorial editável de cada ícone.
- O arquivo `.png` é a versão 24 x 24 com transparência usada como referência.
- O arquivo `.bmp` é carregado manualmente no `Glyph` ou no `TImageList` e
  incorporado diretamente no DFM.
- Os ícones usam traço de 1,5 px, cantos arredondados e a cor `#C8C8C8`.
- Estados ativos usam a cor de destaque `#3794FF`.
- `gerar-png.ps1` recria os PNGs 24 x 24 a partir das definições vetoriais.
- `converter-png-para-bmp.ps1` cria versões BMP para inclusão manual no
  `Glyph` dos botões pelo Object Inspector. Os BMPs usam magenta no canto
  inferior esquerdo como cor-chave de transparência da VCL. As bordas
  semitransparentes são combinadas com o fundo `#202020` dos painéis para
  preservar a suavização visual sem produzir halos magenta.

Ao adicionar ou alterar um ícone, regenere o PNG e o BMP antes de carregá-lo
novamente no DFM:

```powershell
./gerar-png.ps1
./converter-png-para-bmp.ps1
```
