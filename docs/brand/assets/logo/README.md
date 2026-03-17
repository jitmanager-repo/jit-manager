# Logos — JIT Manager

Este diretório contém as versões oficiais do símbolo do JIT Manager.

## Estrutura de pastas

- `svg/` — arquivos vetoriais (SVG)
- `png/` — exportações PNG com transparência (tamanhos padrão)
- `favicon/` — ícones para navegador e dispositivos (favicon/app icons)

## Arquivos (SVG)

### `svg/logo-jit-manager.source.svg`
- **Origem:** export do CorelDRAW (arquivo “fonte”).
- **Uso recomendado:** edição/ajustes finos e reexportações.
- **Observação:** manter como referência principal da arte.

### `svg/logo-jit-manager.svg`
- **Tipo:** versão padrão do logo em SVG (cópia/alias do source).
- **Uso recomendado:** uso geral quando não há exigência específica de “web-friendly”.

### `svg/logo-jit-manager.web.svg`
- **Tipo:** SVG “web-friendly” (sem `<!DOCTYPE>` e com `fill` inline).
- **Uso recomendado:** aplicações web (site/app/landing pages), import em projetos (React/Next/Vite etc.).

### `svg/logo-jit-manager.web.min.svg`
- **Tipo:** SVG minificado (mesmo visual do `logo-jit-manager.web.svg`, porém menor).
- **Uso recomendado:** embed direto em HTML, performance, ou quando quiser reduzir tamanho de payload.

## Arquivos (PNG)

### `png/logo-jit-manager_1024.png`
### `png/logo-jit-manager_512.png`
### `png/logo-jit-manager_48.png`
- **Uso recomendado:** materiais onde SVG não é suportado (docs, apresentações, alguns sistemas, thumbnails).
- **Observação:** manter transparência; evitar recompressão que crie “halo”/serrilhado.

## Favicon / App icons

Arquivos em `favicon/`:
- `favicon-16x16.png`
- `favicon-32x32.png`
- `apple-touch-icon.png`
- `android-chrome-192x192.png`
- `android-chrome-512x512.png`

## Regras rápidas (v1)

- **Opção B (adotada):** o símbolo não tem fundo externo, mas mantém as divisões internas **brancas**.
- Para validar, teste o SVG sobre um fundo escuro: o exterior deve ficar transparente, e as divisões internas devem permanecer brancas.
- Evitar alterar pontos/ângulos dos polígonos e evitar adicionar *outline/stroke* sem necessidade (pode mudar o visual).

## Dica de teste rápido

Abra um HTML com fundo escuro e insira o SVG como `<img>` ou inline para conferir transparência e contraste.
