# Logos — JIT Manager

Este diretório contém as versões oficiais do símbolo do JIT Manager.

## Arquivos

### `logo-jit-manager.svg`
- **Origem:** export do CorelDRAW (arquivo “fonte”).
- **Uso recomendado:** edição no Corel, ajustes finos e reexportações.
- **Observação:** manter como referência principal da arte.

### `logo-jit-manager.web.svg`
- **Tipo:** SVG “web-friendly” (sem `<!DOCTYPE>` e sem `<style>`/classes; `fill` inline).
- **Uso recomendado:** aplicações web (site, app, landing pages), import em projetos (React/Next/Vite etc.).

### `logo-jit-manager.web.min.svg`
- **Tipo:** SVG minificado (mesmo visual do `logo-jit-manager.web.svg`, porém em uma linha e menor).
- **Uso recomendado:** embed direto em HTML, performance, ou quando quiser reduzir tamanho de payload.

## Regras rápidas (v1)

- **Opção B (adotada):** o símbolo não tem fundo externo, mas mantém as divisões internas **brancas**.
- Para validar, teste o SVG sobre um fundo escuro: o exterior deve ficar transparente, e as divisões internas devem permanecer brancas.
- Evitar alterar pontos/ângulos dos polígonos e evitar adicionar *outline/stroke* sem necessidade (pode mudar o visual).

## Dica de teste rápido
Abra um HTML com fundo escuro e insira o SVG como `<img>` ou inline para conferir transparência e contraste.
