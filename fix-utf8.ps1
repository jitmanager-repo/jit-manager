$in  = "docs/brand/manual/Guia-de-marca-e-identidade.typ"
$out = "docs/brand/manual/Guia-de-marca-e-identidade.fixed.typ"

$s = Get-Content -Raw -LiteralPath $in

# Remove BOM visível, se existir
if ($s.StartsWith("ï»¿")) { $s = $s.Substring(3) }

# "Desmojibake": cp1252 bytes -> UTF-8 string
$bytes = [System.Text.Encoding]::GetEncoding(1252).GetBytes($s)
$fixed = [System.Text.Encoding]::UTF8.GetString($bytes)

Set-Content -NoNewline -Encoding utf8 -LiteralPath $out -Value $fixed

Write-Host "Wrote: $out"