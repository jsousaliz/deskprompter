Add-Type -AssemblyName System.Drawing

$diretorioIcones = Split-Path -Parent $MyInvocation.MyCommand.Path
$corTransparente = [System.Drawing.Color]::FromArgb(255, 255, 0, 255)
$corFundoBotoes = [System.Drawing.Color]::FromArgb(255, 32, 32, 32)

Get-ChildItem -LiteralPath $diretorioIcones -Filter '*.png' |
  ForEach-Object {
    $imagemPng = [System.Drawing.Bitmap]::FromFile($_.FullName)
    $imagemBmp = [System.Drawing.Bitmap]::new(
      $imagemPng.Width,
      $imagemPng.Height,
      [System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
    try {
      for ($y = 0; $y -lt $imagemPng.Height; $y++) {
        for ($x = 0; $x -lt $imagemPng.Width; $x++) {
          $pixel = $imagemPng.GetPixel($x, $y)
          if ($pixel.A -gt 0) {
            $opacidade = $pixel.A / 255.0
            $vermelho = [Math]::Round(
              ($pixel.R * $opacidade) +
              ($corFundoBotoes.R * (1.0 - $opacidade)))
            $verde = [Math]::Round(
              ($pixel.G * $opacidade) +
              ($corFundoBotoes.G * (1.0 - $opacidade)))
            $azul = [Math]::Round(
              ($pixel.B * $opacidade) +
              ($corFundoBotoes.B * (1.0 - $opacidade)))
            $imagemBmp.SetPixel(
              $x,
              $y,
              [System.Drawing.Color]::FromArgb(
                255,
                $vermelho,
                $verde,
                $azul))
          }
          else {
            $imagemBmp.SetPixel($x, $y, $corTransparente)
          }
        }
      }

      $caminhoBmp = Join-Path $diretorioIcones ($_.BaseName + '.bmp')
      $imagemBmp.Save($caminhoBmp, [System.Drawing.Imaging.ImageFormat]::Bmp)
    }
    finally {
      $imagemBmp.Dispose()
      $imagemPng.Dispose()
    }
  }
