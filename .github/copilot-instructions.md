# Instruções para o Agente — jit-manager

Este arquivo é lido automaticamente pelo GitHub Copilot ao iniciar cada conversa neste workspace.

## Estado atual obrigatório
- Fase ativa do projeto: Mark 3A (liberado por GO condicionado no Mark 2.1).
- Mark 3B bloqueado até `task-runners` do `n8n-jit` ficar healthy.
- Referências de Mark 3 no board: `jit-manager#20` (3A), `jit-manager#21` (3B), `jit-manager#22` (3C).

## Regras de governança (obrigatórias)
- Toda mudança de fase exige revisão das issues abertas em `jit-manager`, `jit-infra` e `jit-scripts`.
- Toda issue aberta deve ter `Status` e `Fase` coerentes.
- Issue fora de fase deve ser reclassificada, fechada ou movida para `Backlog estrategico`.

## Rotina automática na retomada de sessão
Executar no `jit-scripts`, nesta ordem:

```powershell
cd D:\jitmamager-repo\jit-scripts
.\maintenance\sync-project-operations.ps1 -CurrentPhase "Mark 3"
```

Se houver desvio validado e autorizado para aplicação:

```powershell
cd D:\jitmamager-repo\jit-scripts
.\maintenance\sync-project-operations.ps1 -CurrentPhase "Mark 3" -Apply
```

## Fontes canônicas
- Governança de board/issues: [docs/process/projects.md](../docs/process/projects.md)
- Rotina operacional por frequência: [docs/process/project-operations-checklist.md](../docs/process/project-operations-checklist.md)
- Revisão por fase: [docs/process/project-phase-review-checklist.md](../docs/process/project-phase-review-checklist.md)
