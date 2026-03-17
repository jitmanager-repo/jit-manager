# Guia de marca e identidade — JIT Manager

Este manual é gerado a partir de um arquivo fonte Typst.

## Requisitos
- Typst instalado
- (Opcional, recomendado) Fontes instaladas no Windows:
  - Rubik
  - Inter

## Como gerar o PDF (Windows)
Na raiz do repositório:

```powershell
.\docs\brand\manual\build.ps1
```

### Fontes
Este repositório inclui as fontes em `docs/brand/assets/fonts/`.

> Nota: o pacote estático do Inter (Google Fonts) expõe famílias como `Inter 18pt/24pt/28pt`. Para evitar que o Typst pegue uma versão *variable* instalada no sistema (e para evitar warnings), o arquivo `.typ` referencia explicitamente `Inter 18pt` em vez de `Inter`.

Observação: as versões atuais de Inter/Rubik baixadas do Google Fonts podem ser *variable fonts* e o Typst pode emitir warnings sobre suporte limitado a variable fonts. O PDF ainda é gerado; valide visualmente se os pesos/itálicos ficaram corretos.

## Estrutura
- `docs/brand/manual/Guia-de-marca-e-identidade.typ` — fonte do manual
- `docs/brand/manual/assets/` — imagens auxiliares (clear space, reduções, “não fazer” etc.)
- Logos oficiais: `docs/brand/assets/logo/`
