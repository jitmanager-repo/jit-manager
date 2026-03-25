# Checklist Operacional de Alinhamento do Projeto

Use este checklist como rotina de operacao para manter board, issues e fase do projeto sempre coerentes.

## Frequencias
- A cada alteracao de fase (Mark)
- A cada dia
- A cada semana
- A cada mes

---

## 1) A cada alteracao de fase

Objetivo: alinhar rapidamente todas as issues com a fase nova.

- [ ] Definir a nova fase ativa (`Mark 0`, `Mark 1`, `Mark 2`, `Mark 3`, `Mark 4`)
- [ ] Executar dry-run de sincronizacao por fase:

```powershell
cd ../jit-scripts
.\maintenance\sync-project-phase.ps1 -CurrentPhase "Mark X"
```

- [ ] Revisar o relatorio gerado em `maintenance/reports/`
- [ ] Validar se itens que devem ir para backlog estao corretamente classificados
- [ ] Aplicar sincronizacao real no board:

```powershell
cd ../jit-scripts
.\maintenance\sync-project-phase.ps1 -CurrentPhase "Mark X" -Apply
```

- [ ] Revisar issues abertas nos repositorios `jit-manager`, `jit-infra` e `jit-scripts`
- [ ] Sincronizar corpo das issues estrategicas abertas (resumo executivo e checklist real):

```powershell
cd ../jit-scripts
.\maintenance\sync-strategic-issue-bodies.ps1 -Apply
```

- [ ] Fechar, reescrever ou mover para `Backlog estrategico` as issues fora de contexto
- [ ] Registrar resumo da transicao de fase no repositório apropriado

---

## 2) A cada dia

Objetivo: iniciar o dia com visao real do board e do trabalho em andamento.

- [ ] Conferir se houve falha no workflow agendado `sync-project-phase` (dry-run)
- [ ] Abrir o artifact do dry-run mais recente e verificar desvios
- [ ] Se houver desvio relevante, rodar dry-run local para confirmar:

```powershell
cd ../jit-scripts
.\maintenance\sync-project-phase.ps1 -CurrentPhase "Mark X"
```

- [ ] Garantir que issues em execucao estejam em `Status = Em andamento`
- [ ] Garantir que issues abertas tenham `Fase` coerente com o momento atual
- [ ] Se necessario, sincronizar tambem o corpo das issues estrategicas:

```powershell
cd ../jit-scripts
.\maintenance\sync-strategic-issue-bodies.ps1
```

- [ ] Ajustar rapidamente itens bloqueados (`Status = Bloqueado`) com proximo passo claro

---

## 3) A cada semana

Objetivo: fazer manutencao preventiva da consistencia do sistema de issues.

- [ ] Rodar teste de saude dos workflows de Projects:

```powershell
cd ../jit-scripts
.\maintenance\test-project-workflows.ps1
```

- [ ] Confirmar execucao dos workflows:
  - `auto-add-issues-to-project.yml`
  - `sync-issue-status-in-project.yml`
  - `sync-project-phase.yml` (dry-run)
- [ ] Revisar issues duplicadas, obsoletas ou sem dono
- [ ] Revisar distribuicao por `Repositorio` e `Fase`
- [ ] Executar apply manual se o dry-run semanal indicar desvio material:

```powershell
cd ../jit-scripts
.\maintenance\sync-project-phase.ps1 -CurrentPhase "Mark X" -Apply
```

---

## 4) A cada mes

Objetivo: manter governanca e qualidade operacional do processo.

- [ ] Auditar se os secrets continuam validos em todos os repositorios:
  - `GH_PROJECT_URL`
  - `ADD_TO_PROJECT_PAT`
- [ ] Validar se o token usado na operacao local tem escopos adequados:
  - `read:project` para dry-run
  - `project` para apply
- [ ] Revisar se as opcoes dos campos do Project continuam corretas:
  - `Status`
  - `Fase`
  - `Repositorio`
- [ ] Revisar se a fase padrao do workflow agendado precisa mudar (`PROJECT_CURRENT_PHASE`)
- [ ] Revisar e atualizar a documentacao de processo se houve mudanca recorrente no fluxo

---

## Comando rapido para iniciar o dia

```powershell
cd ../jit-scripts
.\maintenance\sync-project-phase.ps1 -CurrentPhase "Mark X"
```

Se o relatorio mostrar divergencias reais, executar depois o mesmo comando com `-Apply`.