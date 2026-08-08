# Ícone do aplicativo

- `Deskprompter.svg` é a fonte vetorial editável.
- `Deskprompter.ico` contém as resoluções 16, 24, 32, 48, 64, 128 e 256 px.
- `png/` contém versões individuais para inspeção e uso em outras plataformas.
- `gerar-icones.ps1` recria os PNGs e o ICO a partir do SVG.

Para regenerar os arquivos:

```powershell
./gerar-icones.ps1
```

O script utiliza o Microsoft Edge ou o Google Chrome em modo headless para
renderizar o SVG e o `System.Drawing` para gerar as diferentes resoluções.
