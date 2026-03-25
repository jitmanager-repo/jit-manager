# Padrão de Projects (obrigatório)

Neste repositório, toda issue deve entrar automaticamente no Projects.

## Objetivo
Garantir que, ao criar issue em qualquer lugar (web, mobile ou API), ela apareça no board oficial sem ação manual.

## Como funciona
O workflow `.github/workflows/auto-add-issues-to-project.yml` roda quando a issue é:
- aberta
- reaberta

E adiciona a issue no Projects configurado.

O workflow `.github/workflows/sync-issue-status-in-project.yml` sincroniza o status no board:
- `assigned` ou `reopened` -> `Em andamento`
- `closed` -> `Concluído`

## Configuração obrigatória
### 1) Repository Secret (URL do Project)
Criar em `Settings > Secrets and variables > Actions > Secrets`:
- `GH_PROJECT_URL` = URL do Projects no padrão de usuário (ex.: `https://github.com/users/<usuario>/projects/<id>`)

### 2) Repository Secret (token)
Criar em `Settings > Secrets and variables > Actions > Secrets`:
- `ADD_TO_PROJECT_PAT` = token com permissão para editar Projects

## Permissões recomendadas do token
- `project`
- `repo` (ou equivalente mínimo para issues no contexto do repositório)

## Pre-requisito para operacao local com gh
- Para consultar o board via `gh api graphql`, o token local precisa de `read:project`.
- Para aplicar mudancas no board via script, o token local precisa de `project`.

## Validação rápida
1. Criar uma issue de teste.
2. Conferir a aba Actions para ver execução do workflow.
3. Verificar se a issue entrou no Projects.
4. Atribuir a issue para alguém e verificar se foi para `Em andamento`.
5. Fechar a issue e verificar se foi para `Concluído`.

## Exemplo prático (padrão atual)
- `GH_PROJECT_URL`: `https://github.com/users/jitmanager-repo/projects/1`
- `ADD_TO_PROJECT_PAT`: token com escopos `repo` e `project`

## Regra operacional
Sem os dois secrets configurados, a automação não funciona.

## Auditoria atual
- Os workflows de Projects existem em `jit-manager`, `jit-infra` e `jit-scripts`.
- O script de validacao operacional existe em `jit-scripts/maintenance/test-project-workflows.ps1`.
- O script operador do board por fase existe em `jit-scripts/maintenance/sync-project-phase.ps1`.
- A validacao automatizada precisa cobrir sempre os tres repositorios principais do projeto.

## Regra complementar de governanca por fase
Adicionar ao GitHub Projects um campo de fase, separado do campo `Status`.

### Estrutura minima recomendada do board
- `Status`: `Backlog`, `Em andamento`, `Bloqueado`, `Concluido`
- `Fase`: `Mark 0`, `Mark 1`, `Mark 2`, `Mark 3`, `Mark 4`, `Backlog estrategico`
- `Repositorio`: `jit-manager`, `jit-infra`, `jit-scripts`, `client-template`

### Campo recomendado
- `Fase`: `Mark 0`, `Mark 1`, `Mark 2`, `Mark 3`, `Mark 4`, `Backlog estrategico`

### Regras obrigatorias
1. Toda mudanca de fase ativa do projeto exige revisao das issues abertas nos tres repositorios principais.
2. Toda issue aberta deve ter `Status` e `Fase` coerentes com o momento atual do projeto.
3. Issue fora de fase deve ser reclassificada, fechada ou movida para backlog explicito.
4. Nao usar apenas o fechamento da issue como sinal suficiente de alinhamento do board.

### Ritual minimo de manutencao
1. Rodar `maintenance/test-project-workflows.ps1` no `jit-scripts`.
2. Revisar as issues abertas de `jit-manager`, `jit-infra` e `jit-scripts`.
3. Atualizar campo `Fase` no board oficial.
4. Fechar ou reescrever issues defasadas antes de iniciar um novo Mark.
5. Seguir o checklist operacional em `docs/process/project-phase-review-checklist.md`.
6. Usar `maintenance/sync-project-phase.ps1` primeiro em `dry-run` e depois com `-Apply` quando a revisao estiver validada.

### Limite atual da automacao
Os workflows atuais sincronizam entrada no Project e ciclo basico de `Status`, mas nao inferem a fase real do projeto. A aderencia por fase continua sendo uma responsabilidade de governanca operacional.
