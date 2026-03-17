// Guia de marca e identidade â€” JIT Manager
// Typst 0.14.x compatible version (no page(background: color), no text(leading: ...))

#set page(paper: "a4", margin: (top: 18mm, bottom: 18mm, left: 18mm, right: 18mm))

#let brand = (
  name: "JIT Manager",
  tagline: "O operacional no automÃ¡tico. VocÃª no estratÃ©gico.",
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

// Tipografia (Issue #6): Rubik + Inter (fontes versionadas no repo)
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
  O objetivo deste guia Ã© padronizar o uso da marca #(brand.name) e garantir consistÃªncia
  em aplicaÃ§Ãµes digitais e materiais de comunicaÃ§Ã£o. Seguindo as instruÃ§Ãµes, preservamos
  a identidade e a clareza da comunicaÃ§Ã£o.
])

// ===== ConteÃºdo =====
= SÃ­mbolo e assinatura

Prefira usar a versÃ£o principal do logo. Use variaÃ§Ãµes apenas quando houver restriÃ§Ã£o de fundo,
tamanho, ou contexto (ex.: favicon, uso monocromÃ¡tico, impressÃ£o).

#grid(columns: (1fr, 1fr), gutter: 10mm)[
  #block[
    #image("../assets/logo/svg/logo-jit-manager.web.svg", width: 70mm)
    #v(2mm)
    #text(size: 9pt)[*Principal (SVG web-friendly)*]
  ]
  #block[
    #rect(width: 70mm, height: 35mm, fill: colors.border, stroke: none)
    #v(2mm)
    #text(size: 9pt)[*VariaÃ§Ã£o (placeholder â€” V2)*]
  ]
]

#v(5mm)
Arquivos oficiais:
- `docs/brand/assets/logo/svg/`
- `docs/brand/assets/logo/png/`
- `docs/brand/assets/logo/favicon/`

= Paleta de cores (v1)

== Cores da marca (tela â€” HEX)
- Azul 1 (primÃ¡ria): `#0095DA`
- Azul 2 (secundÃ¡ria): `#00AEEF`
- Azul claro 1 (fundo/realce): `#9CDCFA`
- Azul claro 2 (apoio): `#3FC8F4`
- Magenta (accent/CTA): `#EE1551`
- Magenta hover/active (CTA): `#BE1244`

== Neutros
- Texto principal: `#0F172A`
- Fundo: `#FFFFFF`
- Bordas/divisÃ³rias: `#E5E7EB`

== Uso recomendado (site/redes)
- CTA / destaque: `#EE1551`
- Links e Ã­cones: `#0095DA`
- Hover / detalhes: `#00AEEF`
- Fundos leves: `#9CDCFA` ou `#3FC8F4` (com bastante branco)
- Texto sempre escuro (`#0F172A`) para contraste

= Tipografia (v1)

== Fonte escolhida
- TÃ­tulos / Marca: *Rubik* (600/700)
- Texto / UI: *Inter* (400/500/600)

== Regras simples
- TÃ­tulos sempre em Rubik (600/700).
- ParÃ¡grafos e UI em Inter (400/500; 600 sÃ³ para Ãªnfase).
- Evitar caixa alta em textos longos.
- Priorizar legibilidade: texto em `#0F172A` sobre fundo claro.

== Exemplo de sizing (referÃªncia)
- H1: 40â€“56px / 700
- H2: 28â€“34px / 700
- H3: 20â€“24px / 600
- Body: 16â€“18px / 400
- BotÃµes/CTA: 16px / 600
