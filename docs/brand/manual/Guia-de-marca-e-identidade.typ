// Guia de marca e identidade — JIT Manager
// Fonte do documento (Typst). Para gerar PDF, veja docs/brand/manual/README.md.

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

// Tipografia (Issue #6)
// - Títulos / marca: Rubik (600/700)
// - Texto / UI: Inter (400/500/600)
#let font_title = "Rubik"
#let font_body = "Inter"

#set text(font: font_body, size: 10.5pt, fill: colors.text, leading: 1.35em)
#set heading(numbering: none)

#let cover(title, subtitle: none) = [
  #set page(margin: (top: 0mm, bottom: 0mm, left: 0mm, right: 0mm), background: colors.primary)

  #block(width: 100%, height: 100%, inset: (top: 32mm, left: 26mm, right: 26mm, bottom: 26mm))[
    #set text(font: font_title, fill: colors.white)

    #set text(size: 64pt, weight: 700, leading: 0.95em)
    #title

    #v(14mm)

    #if subtitle != none {
      #set text(size: 14pt, weight: 400, leading: 1.25em)
      #subtitle
    }
  ]

  #pagebreak()

  // restore
  #set page(paper: "a4", margin: (top: 18mm, bottom: 18mm, left: 18mm, right: 18mm), background: none)
]

// === Documento ===

#cover(
  [Guia de marca\ne identidade],
  subtitle: [
    Marca: *#(brand.name)* \
    Tagline: #(brand.tagline)
  ],
)

// Abertura de seção (estilo do exemplo)
#set page(background: colors.primary, margin: (top: 0mm, bottom: 0mm, left: 0mm, right: 0mm))
#block(width: 100%, height: 100%, inset: (top: 32mm, left: 26mm, right: 26mm, bottom: 26mm))[
  #set text(font: font_title, fill: colors.white)
  #set text(size: 72pt, weight: 700, leading: 0.95em)
  Identidade\nvisual

  #v(12mm)
  #set text(font: font_body, size: 12pt, weight: 400, leading: 1.35em, fill: colors.white)
  O objetivo deste guia é padronizar o uso da marca #(brand.name) e garantir consistência
  em aplicações digitais e materiais de comunicação. Seguindo as instruções, preservamos
  a identidade e a clareza da comunicação.
]
#pagebreak()

#set page(background: none, margin: (top: 18mm, bottom: 18mm, left: 18mm, right: 18mm))

= Símbolo e assinatura

Prefira usar a versão principal do logo. Use variações apenas quando houver restrição de fundo,
tamanho, ou contexto (ex.: favicon, uso monocromático, impressão).

#grid(columns: (1fr, 1fr), gutter: 10mm)[
  #block[
    #image("../assets/logo/../assets/logo/svg/../../assets/logo/svg/logo-jit-manager.web.svg", width: 70mm)
    #v(2mm)
    #text(size: 9pt, fill: colors.text)[*Principal (SVG web-friendly)*]
  ]
  #block[
    #rect(width: 70mm, height: 35mm, fill: colors.border, stroke: none)
    #v(2mm)
    #text(size: 9pt, fill: colors.text)[*Variação (placeholder — V2)*]
  ]
]

#v(5mm)
Os arquivos oficiais estão em:
- `docs/brand/assets/logo/svg/`
- `docs/brand/assets/logo/png/`
- `docs/brand/assets/logo/favicon/`

= Paleta de cores (v1)

## Cores da marca (tela — HEX)
- Azul 1 (primária): `#0095DA`
- Azul 2 (secundária): `#00AEEF`
- Azul claro 1 (fundo/realce): `#9CDCFA`
- Azul claro 2 (apoio): `#3FC8F4`
- Magenta (accent/CTA): `#EE1551`
- Magenta hover/active (CTA): `#BE1244`

## Neutros
- Texto principal: `#0F172A`
- Fundo: `#FFFFFF`
- Bordas/divisórias: `#E5E7EB`

## Uso recomendado (site/redes)
- CTA / destaque: `#EE1551`
- Links e ícones: `#0095DA`
- Hover / detalhes: `#00AEEF`
- Fundos leves: `#9CDCFA` ou `#3FC8F4` (sempre com bastante branco)
- Texto sempre escuro (`#0F172A`) para contraste

= Tipografia (v1)

## Fonte escolhida
- Títulos / Marca: **Rubik**
- Texto / UI: **Inter**

## Pesos (weights)
- Rubik (títulos): 600 e 700
- Inter (texto): 400, 500 e 600

## Exemplo de sizing (referência)
- H1: 40–56px / 700
- H2: 28–34px / 700
- H3: 20–24px / 600
- Body: 16–18px / 400
- Botões/CTA: 16px / 600
