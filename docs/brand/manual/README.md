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

Observação: as versões atuais de Inter/Rubik baixadas do Google Fonts podem ser *variable fonts* e o Typst pode emitir warnings sobre suporte limitado a variable fonts. O PDF ainda é gerado; valide visualmente se os pesos/itálicos ficaram corretos.

## Estrutura
- `docs/brand/manual/Guia-de-marca-e-identidade.typ` — fonte do manual
- `docs/brand/manual/assets/` — imagens auxiliares (clear space, reduções, “não fazer” etc.)
- Logos oficiais: `docs/brand/assets/logo/`
