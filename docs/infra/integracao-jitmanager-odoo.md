# Integracao JIT Manager <-> Odoo

## Objetivo
Este documento consolida a proposta de integracao entre JIT Manager e Odoo para apoiar decisao tecnica e planejamento da fase 0.2.

Escopo principal:
- alimentar o CRM do Odoo com eventos de workflows (feedback, validacoes, resultado de testes);
- importar leads do Chatwoot para o CRM do Odoo;
- manter uma arquitetura open-source aderente ao stack atual (Coolify, Docker, n8n e Chatwoot).

## Conclusao executiva
A integracao e viavel com Odoo Community usando APIs nativas (XML-RPC e JSON-RPC), webhooks do Chatwoot e orquestracao no n8n.

## Requisitos de negocio atendidos
- Centralizacao de leads e oportunidades no Odoo (`crm.lead`).
- Vinculo de validacoes e operacao em projetos e tarefas (`project.project` e `project.task`).
- Registro de feedback por survey ou modelo customizado.
- Automacao de entrada de dados sem dependencia de processos manuais.

## Arquitetura de referencia
Fluxo sugerido:
1. Chatwoot envia webhook de evento de lead/conversa.
2. n8n recebe, transforma dados e aplica regras.
3. n8n chama API do Odoo para criar/atualizar lead.
4. Eventos de feedback de testes podem criar tarefas e registros de resultado no Odoo.

Pilha recomendada:
- Odoo Community em container Docker (gerenciado por Coolify).
- Postgres para persistencia do Odoo.
- n8n como camada de integracao e retries.
- Chatwoot como ponto de captura de relacionamento.

## Modelagem funcional inicial
- Lead: `crm.lead`.
- Projeto e tarefas: `project.project` e `project.task`.
- Feedback estruturado:
  - opcao A: modulo `survey` do Odoo;
  - opcao B: modelo customizado `test.result` com campos de cliente, contexto, status e comentario.

## Boas praticas de integracao
- Criar campo externo unico para deduplicacao (ex.: `x_chatwoot_id`).
- Sempre tentar `search` antes de `create` no Odoo.
- Guardar credenciais em secret store (sem senha em codigo).
- Configurar retry e fila no n8n para falhas transitorias.
- Versionar payloads e mapeamentos no repositorio.

## Riscos e mitigacao
- Duplicidade de lead: usar chave externa unica e upsert.
- Latencia e limite de API: usar processamento assincorno e batch quando aplicavel.
- Exposicao de credenciais: usar variaveis de ambiente e controles de acesso.
- Divergencia de versao: fixar imagem do Odoo por tag e validar upgrade em ambiente de teste.

## Plano de implementacao (10 dias uteis)
1. Deploy do Odoo no stack atual com banco dedicado.
2. Criacao de usuario tecnico de integracao com permissoes minimas necessarias.
3. Teste de API criando lead de exemplo.
4. Configuracao do fluxo n8n Chatwoot -> Odoo.
5. Teste de ponta a ponta com criacao de lead e atualizacao de pipeline.
6. Documentacao operacional e checklist de suporte.

## Criterio de pronto desta integracao
A base de decisao e implementacao e considerada pronta quando:
- fluxo Chatwoot -> Odoo estiver funcional em ambiente de validacao;
- deduplicacao de lead estiver ativa;
- credenciais estiverem protegidas em secret store;
- logs e retries estiverem habilitados no n8n;
- documentacao de operacao e rollback estiver publicada.

## Decisao recomendada para o projeto
Adotar Odoo Community como base de CRM e operacao integrada, com n8n como camada de orquestracao.

Essa abordagem e aderente ao momento atual do projeto por equilibrar:
- baixo custo;
- velocidade de implementacao;
- flexibilidade para evolucao futura.
