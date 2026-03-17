$p = "docs/brand/manual/Guia-de-marca-e-identidade.typ"
$t = Get-Content -Raw -LiteralPath $p

function Rep([string]$s, [string]$a, [string]$b) {
  return $s.Replace($a, $b)
}

# Se tiver dupla-encoding (ÃƒÂx), primeiro reduz para Ãx
$t = Rep $t "ÃƒÂ" "Ã"

# Acentos (minúsculos)
$t = Rep $t "Ã¡" ([string][char]0x00E1)
$t = Rep $t "Ã¢" ([string][char]0x00E2)
$t = Rep $t "Ã£" ([string][char]0x00E3)
$t = Rep $t "Ã©" ([string][char]0x00E9)
$t = Rep $t "Ãª" ([string][char]0x00EA)
$t = Rep $t "Ã­" ([string][char]0x00ED)
$t = Rep $t "Ã³" ([string][char]0x00F3)
$t = Rep $t "Ã´" ([string][char]0x00F4)
$t = Rep $t "Ãµ" ([string][char]0x00F5)
$t = Rep $t "Ãº" ([string][char]0x00FA)
$t = Rep $t "Ã§" ([string][char]0x00E7)

# Pontuação (travessões)
$t = Rep $t "â€”" ([string][char]0x2014)
$t = Rep $t "â€“" ([string][char]0x2013)

# remove BOM “visível” se existir no começo
if ($t.StartsWith("ï»¿")) { $t = $t.Substring(3) }

Set-Content -NoNewline -Encoding utf8 -LiteralPath $p -Value $t