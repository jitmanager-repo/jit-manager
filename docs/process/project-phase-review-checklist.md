# Checklist de Revisao por Fase do Project

Use este checklist sempre que o projeto mudar de Mark ou quando o board parecer defasado em relacao ao estado real da operacao.

## Objetivo
- Garantir coerencia entre planejamento, issues abertas e fase atual do projeto.
- Evitar backlog antigo contaminando a leitura do board oficial.
- Verificar se a automacao continua funcionando nos repositorios principais.

## Escopo minimo
- `jit-manager`
- `jit-infra`
- `jit-scripts`

## Passo 1 - Validar automacao basica
- [ ] Rodar `maintenance/test-project-workflows.ps1` no `jit-scripts`
- [ ] Confirmar sucesso de `auto-add-issues-to-project.yml`
- [ ] Confirmar sucesso de `sync-issue-status-in-project.yml`
- [ ] Registrar falhas de secrets, permissoes ou workflows antes de revisar o board

## Passo 2 - Revisar issues abertas por repositorio
- [ ] Listar issues abertas em `jit-manager`
- [ ] Listar issues abertas em `jit-infra`
- [ ] Listar issues abertas em `jit-scripts`
- [ ] Identificar issues sem aderencia a fase atual
- [ ] Identificar issues duplicadas ou obsoletas

## Passo 3 - Reclassificar board
- [ ] Atualizar campo `Fase` de todas as issues relevantes
- [ ] Garantir que `Status` reflita o trabalho real
- [ ] Mover itens fora de momento para `Backlog estrategico`
- [ ] Fechar issues que perderam sentido operacional

## Passo 4 - Preparar a nova fase
- [ ] Criar issues novas exigidas pela fase ativa
- [ ] Vincular issues tecnicas a documentos canonicos da fase
- [ ] Verificar se existem dependencias bloqueando execucao
- [ ] Confirmar dono e proximo passo de cada item em andamento

## Passo 5 - Encerramento da revisao
- [ ] Registrar resumo da revisao no repositório apropriado
- [ ] Atualizar documentacao de processo se houver nova regra recorrente
- [ ] Validar se o board ficou coerente com a fase atual do projeto

## Criterios de saida
- Nenhuma issue aberta sem `Status` coerente
- Nenhuma issue aberta sem `Fase` coerente
- Nenhuma issue antiga mascarando a leitura da fase atual
- Automacao de entrada e sync de status validada nos tres repositorios principais