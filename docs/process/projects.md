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
