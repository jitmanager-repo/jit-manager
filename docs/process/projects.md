# Padrão de Projects (obrigatório)

Neste repositório, toda issue deve entrar automaticamente no Projects.

## Objetivo
Garantir que, ao criar issue em qualquer lugar (web, mobile ou API), ela apareça no board oficial sem ação manual.

## Como funciona
O workflow `.github/workflows/auto-add-issues-to-project.yml` roda quando a issue é:
- aberta
- reaberta

E adiciona a issue no Projects configurado.

## Configuração obrigatória
### 1) Repository Secret (URL do Project)
Criar em `Settings > Secrets and variables > Actions > Secrets`:
- `GH_PROJECT_URL` = URL do Projects (ex.: `https://github.com/orgs/<org>/projects/<id>`)

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

## Regra operacional
Sem os dois secrets configurados, a automação não funciona.
