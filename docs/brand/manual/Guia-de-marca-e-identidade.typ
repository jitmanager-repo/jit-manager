// Guia de marca e identidade — JIT Manager
// Typst 0.14.x compatible version (no page(background: color), no text(leading: ...))

#set page(paper: "a4", margin: (top: 18mm, bottom: 18mm, left: 18mm, right: 18mm))

#let brand = (
  name: "JIT Manager",
  tagline: "O operacional no automático. Você no estratégico.",
)

#let colors = (
  primary: rgb("#0095DA"),
  secondary: rgb("#00AEEF"),
  light1: rgb("#9CDCFA"),
  light2: rgb("#3FC8F4"),
  accent: rgb("#EE1551"),
  accent_hover: rgb("#BE1244"),
  text: rgb("#0F172A"),
  border: rgb("#E5E7EB"),
  white: rgb("#FFFFFF"),
)

// Tipografia (Issue #6): Rubik + Inter
// Fallback para Arial se não estiverem instaladas
#let font_title = ("Rubik", "Arial")
#let font_body = ("Inter", "Arial")

#set text(font: font_body, size: 10.5pt, fill: colors.text)
#set heading(numbering: none)
#set par(leading: 1.35em)

#let fullpage(color, body) = [
  // z-order: rect primeiro, conteúdo por cima
  #place(top + left)[
    #rect(width: 210mm, height: 297mm, fill: color, stroke: none)
  ]
  #block(width: 100%, height: 100%, inset: (top: 32mm, left: 26mm, right: 26mm, bottom: 26mm))[
    #body
  ]
  #pagebreak()
]

// ===== Capa =====
#fullpage(colors.primary, [
  #set text(font: font_title, fill: colors.white)

  #set text(size: 64pt, weight: 700)
  Guia de marca
  e identidade

  #v(14mm)
  #set text(font: font_body, size: 14pt, weight: 400)
  Marca: *#(brand.name)* \
  Tagline: #(brand.tagline)
])

// ===== Abertura: Identidade visual =====
#fullpage(colors.primary, [
  #set text(font: font_title, fill: colors.white)

  #set text(size: 72pt, weight: 700)
  Identidade
  visual

  #v(12mm)
  #set text(font: font_body, size: 12pt, weight: 400, fill: colors.white)
  O objetivo deste guia é padronizar o uso da marca #(brand.name) e garantir consistência
  em aplicações digitais e materiais de comunicação. Seguindo as instruções, preservamos
  a identidade e a clareza da comunicação.
])

// ===== Conteúdo =====
= Símbolo e assinatura

Prefira usar a versão principal do logo. Use variações apenas quando houver restrição de fundo,
tamanho, ou contexto (ex.: favicon, uso monocromático, impressão).

#grid(columns: (1fr, 1fr), gutter: 10mm)[
  #block[
    #image("../assets/logo/svg/logo-jit-manager.web.svg", width: 70mm)
    #v(2mm)
    #text(size: 9pt)[*Principal (SVG web-friendly)*]
  ]
  #block[
    #rect(width: 70mm, height: 35mm, fill: colors.border, stroke: none)
    #v(2mm)
    #text(size: 9pt)[*Variação (placeholder — V2)*]
  ]
]

#v(5mm)
Arquivos oficiais:
- `docs/brand/assets/logo/svg/`
- `docs/brand/assets/logo/png/`
- `docs/brand/assets/logo/favicon/`

= Paleta de cores (v1)

== Cores da marca (tela — HEX)
- Azul 1 (primária): `#0095DA`
- Azul 2 (secundária): `#00AEEF`
- Azul claro 1 (fundo/realce): `#9CDCFA`
- Azul claro 2 (apoio): `#3FC8F4`
- Magenta (accent/CTA): `#EE1551`
- Magenta hover/active (CTA): `#BE1244`

== Neutros
- Texto principal: `#0F172A`
- Fundo: `#FFFFFF`
- Bordas/divisórias: `#E5E7EB`

== Uso recomendado (site/redes)
- CTA / destaque: `#EE1551`
- Links e ícones: `#0095DA`
- Hover / detalhes: `#00AEEF`
- Fundos leves: `#9CDCFA` ou `#3FC8F4` (com bastante branco)
- Texto sempre escuro (`#0F172A`) para contraste

= Tipografia (v1)

== Fonte escolhida
- Títulos / Marca: *Rubik* (600/700)
- Texto / UI: *Inter* (400/500/600)

== Regras simples
- Títulos sempre em Rubik (600/700).
- Parágrafos e UI em Inter (400/500; 600 só para ênfase).
- Evitar caixa alta em textos longos.
- Priorizar legibilidade: texto em `#0F172A` sobre fundo claro.

== Exemplo de sizing (referência)
- H1: 40–56px / 700
- H2: 28–34px / 700
- H3: 20–24px / 600
- Body: 16–18px / 400
- Botões/CTA: 16px / 600