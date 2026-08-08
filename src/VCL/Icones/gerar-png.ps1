Add-Type -AssemblyName System.Drawing

$diretorioIcones = Split-Path -Parent $MyInvocation.MyCommand.Path

function Nova-Caneta([string] $cor) {
  $caneta = [System.Drawing.Pen]::new(
    [System.Drawing.ColorTranslator]::FromHtml($cor), 1.5)
  $caneta.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
  $caneta.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
  $caneta.LineJoin = [System.Drawing.Drawing2D.LineJoin]::Round
  return $caneta
}

function Salvar-Icone(
  [string] $nome,
  [scriptblock] $desenhar,
  [string] $cor = '#C8C8C8') {
  $bitmap = [System.Drawing.Bitmap]::new(
    24, 24, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $grafico = [System.Drawing.Graphics]::FromImage($bitmap)
  $caneta = Nova-Caneta $cor
  try {
    $grafico.Clear([System.Drawing.Color]::Transparent)
    $grafico.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $grafico.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    & $desenhar $grafico $caneta
    $bitmap.Save(
      (Join-Path $diretorioIcones ($nome + '.png')),
      [System.Drawing.Imaging.ImageFormat]::Png)
  }
  finally {
    $caneta.Dispose()
    $grafico.Dispose()
    $bitmap.Dispose()
  }
}

Salvar-Icone 'inicio' {
  param($g, $p)
  $g.DrawLine($p, 5, 5, 19, 5); $g.DrawLine($p, 12, 19, 12, 8)
  $g.DrawLine($p, 7, 13, 12, 8); $g.DrawLine($p, 12, 8, 17, 13)
}
Salvar-Icone 'recuar' {
  param($g, $p)
  $g.DrawLine($p, 12, 19, 12, 5); $g.DrawLine($p, 6, 11, 12, 5)
  $g.DrawLine($p, 12, 5, 18, 11)
}
Salvar-Icone 'reproduzir' {
  param($g, $p)
  $pontos = [System.Drawing.PointF[]]@(
    [System.Drawing.PointF]::new(7.5, 5.5),
    [System.Drawing.PointF]::new(18, 12),
    [System.Drawing.PointF]::new(7.5, 18.5))
  $g.DrawPolygon($p, $pontos)
}
Salvar-Icone 'pausar' {
  param($g, $p)
  $p.Width = 2; $g.DrawLine($p, 8, 5.5, 8, 18.5)
  $g.DrawLine($p, 16, 5.5, 16, 18.5)
}
Salvar-Icone 'avancar' {
  param($g, $p)
  $g.DrawLine($p, 12, 5, 12, 19); $g.DrawLine($p, 6, 13, 12, 19)
  $g.DrawLine($p, 12, 19, 18, 13)
}
Salvar-Icone 'texto-anterior' {
  param($g, $p)
  $g.DrawLine($p, 9, 4.5, 15, 4.5); $g.DrawLine($p, 9, 4.5, 9, 19.5)
  $g.DrawLine($p, 9, 19.5, 19, 19.5); $g.DrawLine($p, 19, 19.5, 19, 8.5)
  $g.DrawLine($p, 15, 4.5, 19, 8.5); $g.DrawLine($p, 15, 4.5, 15, 8.5)
  $g.DrawLine($p, 15, 8.5, 19, 8.5); $g.DrawLine($p, 11, 14, 4, 14)
  $g.DrawLine($p, 7, 11, 4, 14); $g.DrawLine($p, 4, 14, 7, 17)
}
Salvar-Icone 'proximo-texto' {
  param($g, $p)
  $g.DrawLine($p, 5, 4.5, 11, 4.5); $g.DrawLine($p, 5, 4.5, 5, 19.5)
  $g.DrawLine($p, 5, 19.5, 15, 19.5); $g.DrawLine($p, 15, 19.5, 15, 8.5)
  $g.DrawLine($p, 11, 4.5, 15, 8.5); $g.DrawLine($p, 11, 4.5, 11, 8.5)
  $g.DrawLine($p, 11, 8.5, 15, 8.5); $g.DrawLine($p, 13, 14, 20, 14)
  $g.DrawLine($p, 17, 11, 20, 14); $g.DrawLine($p, 20, 14, 17, 17)
}

function Desenhar-EspelhoHorizontal($g, $p) {
  $g.DrawLine($p, 12, 4, 12, 20); $g.DrawRectangle($p, 4, 6, 5, 12)
  $g.DrawRectangle($p, 15, 6, 5, 12); $g.DrawLine($p, 7, 12, 5, 10)
  $g.DrawLine($p, 7, 12, 5, 14); $g.DrawLine($p, 17, 12, 19, 10)
  $g.DrawLine($p, 17, 12, 19, 14)
}
Salvar-Icone 'espelho-horizontal' ${function:Desenhar-EspelhoHorizontal}
Salvar-Icone 'espelho-horizontal-ativo' ${function:Desenhar-EspelhoHorizontal} '#3794FF'

function Desenhar-EspelhoVertical($g, $p) {
  $g.DrawLine($p, 4, 12, 20, 12); $g.DrawRectangle($p, 6, 4, 12, 5)
  $g.DrawRectangle($p, 6, 15, 12, 5); $g.DrawLine($p, 12, 7, 10, 5)
  $g.DrawLine($p, 12, 7, 14, 5); $g.DrawLine($p, 12, 17, 10, 19)
  $g.DrawLine($p, 12, 17, 14, 19)
}
Salvar-Icone 'espelho-vertical' ${function:Desenhar-EspelhoVertical}
Salvar-Icone 'espelho-vertical-ativo' ${function:Desenhar-EspelhoVertical} '#3794FF'

Salvar-Icone 'tela-cheia' {
  param($g, $p)
  $g.DrawLine($p, 9, 5, 5, 5); $g.DrawLine($p, 5, 5, 5, 9)
  $g.DrawLine($p, 15, 5, 19, 5); $g.DrawLine($p, 19, 5, 19, 9)
  $g.DrawLine($p, 9, 19, 5, 19); $g.DrawLine($p, 5, 19, 5, 15)
  $g.DrawLine($p, 15, 19, 19, 19); $g.DrawLine($p, 19, 19, 19, 15)
}
Salvar-Icone 'sair-tela-cheia' {
  param($g, $p)
  $g.DrawLine($p, 9, 5, 9, 9); $g.DrawLine($p, 9, 9, 5, 9)
  $g.DrawLine($p, 15, 5, 15, 9); $g.DrawLine($p, 15, 9, 19, 9)
  $g.DrawLine($p, 9, 19, 9, 15); $g.DrawLine($p, 9, 15, 5, 15)
  $g.DrawLine($p, 15, 19, 15, 15); $g.DrawLine($p, 15, 15, 19, 15)
}
Salvar-Icone 'cor-fonte' {
  param($g, $p)
  $g.DrawLine($p, 6, 17, 11, 5); $g.DrawLine($p, 11, 5, 13, 5)
  $g.DrawLine($p, 13, 5, 18, 17); $g.DrawLine($p, 8, 13, 16, 13)
  $g.DrawLine($p, 5, 20, 19, 20)
}
Salvar-Icone 'cor-fundo' {
  param($g, $p)
  $g.DrawLine($p, 8, 4, 16, 12); $g.DrawLine($p, 16, 12, 10, 18)
  $g.DrawLine($p, 10, 18, 6, 18); $g.DrawLine($p, 6, 18, 4.5, 16.5)
  $g.DrawLine($p, 4.5, 16.5, 4.5, 14); $g.DrawLine($p, 4.5, 14, 12, 6.5)
  $g.DrawLine($p, 5, 12, 19, 12); $g.DrawEllipse($p, 17, 15, 4, 4)
}
Salvar-Icone 'restaurar-aparencia' {
  param($g, $p)
  $g.DrawArc($p, 5, 5, 14, 14, -130, 300)
  $g.DrawLine($p, 5, 8, 5, 4); $g.DrawLine($p, 5, 8, 9, 8)
}
