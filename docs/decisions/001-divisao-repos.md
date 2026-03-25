# ADR-001: Divisao em 4 repositorios

- **Data:** 2025-03-24
- **Status:** Aceito

## Contexto

O projeto JIT Manager comecou em um unico repositorio. Com o crescimento, misturar documentacao estrategica, scripts de automacao, configuracoes de infra e templates de cliente no mesmo local dificultava manutencao, code review e separacao de responsabilidades.

## Decisao

Dividir em 4 repositorios na mesma organizacao (`jitmanager-repo`):

| Repositorio | Escopo | Visibilidade |
|---|---|---|
| `jit-manager` | Governanca, marca, docs estrategicos, roadmap | Publico |
| `jit-infra` | Setup de VPS, Coolify, Docker, monitoramento | Privado |
| `jit-scripts` | Onboarding, backup, manutencao, automacao | Privado |
| `client-template` | Template docker-compose para ambientes de cliente | Privado |

## Consequencia

- Cada repo tem escopo claro e nao mistura assuntos
- Exige disciplina de cross-reference entre repos (READMEs linkados)
- Workflows de GitHub Projects replicados nos 4 repos para manter gestao unificada
- Secrets (`GH_PROJECT_URL`, `ADD_TO_PROJECT_PAT`) devem ser configurados em cada repo
