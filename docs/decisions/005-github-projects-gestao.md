# ADR-005: GitHub Projects como gestao centralizada

- **Data:** 2025-03-24
- **Status:** Aceito

## Contexto

Com 4 repositorios separados, precisamos de um unico board para visualizar todas as tarefas, independente de onde a issue foi criada.

## Decisao

Usar GitHub Projects (V2) como board centralizado, com workflows automatizados em cada repositorio para:
1. Auto-adicionar toda issue criada ao Project
2. Sincronizar status (assigned → Em andamento, closed → Concluido)

## Consequencia

- Toda issue em qualquer repo aparece automaticamente no board unico
- Exige 2 secrets configurados em cada repo: `GH_PROJECT_URL` e `ADD_TO_PROJECT_PAT`
- Documentado em `docs/process/projects.md`
- Script de validacao em `jit-scripts/maintenance/test-project-workflows.ps1`
- Sem os secrets, a automacao silenciosamente nao funciona
