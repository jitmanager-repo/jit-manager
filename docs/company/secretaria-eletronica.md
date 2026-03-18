# Secretaria Eletronica — Ativo de automacao da JIT Manager

## Definicao do ativo
A Secretaria Eletronica e um ativo operacional da JIT Manager para automatizar atendimento, agendamento, follow-up e cobranca, com escalonamento para humano quando necessario.

Nao e apenas um chatbot. E uma camada de operacao assistida para front office.

## Escopo funcional (v1)
- Atendimento de entrada por texto e voz
- Memoria de contexto por sessao/contato
- Consulta de disponibilidade real em agenda
- Criacao, atualizacao e cancelamento de agendamento
- Lembretes de agendamento
- Recuperacao de leads sem resposta
- Integracao de cobranca (Asaas)
- Escalonamento para humano com alerta estruturado
- Envio de arquivos e mensagens em blocos para melhor experiencia

## Stack operacional observada
- Chatwoot (conversa, etiquetas, contato e inbox)
- Google Calendar (janelas, eventos, lembretes)
- Asaas (cliente e cobranca)
- Retell/LLM (voz e conducão de chamada)
- Postgres (estado de atendimento e controle de follow-up)
- n8n (orquestracao de workflows)

## Dores que resolve
1. Conversas perdidas e falta de continuidade de atendimento
2. Follow-up inconsistente
3. Agendamento manual com risco de erro e conflito de horario
4. Falta de padrao no atendimento
5. Cobranca desconectada do processo de agendamento
6. Falta de lembretes e aumento de no-show
7. Dependencia de humano para tarefas repetitivas
8. Falta de criterio claro de handoff para humano

## Ganhos esperados
1. Reducao do tempo de resposta
2. Menor perda de oportunidades por falta de follow-up
3. Maior previsibilidade operacional
4. Menos erros de agenda e duplicidades
5. Melhor experiencia de atendimento (mais claro e continuo)
6. Melhor conversao de atendimento em agendamento
7. Menor retrabalho da equipe
8. Capacidade de operar volume maior sem crescimento linear de time

## Limites e premissas
- Exige configuracao correta de credenciais, agendas e rotas de webhook
- Exige definicao de politicas de escalonamento humano
- Exige supervisao inicial para calibrar prompts, cadencias e excecoes
- Nao substitui decisao clinica, juridica, financeira ou comercial sensivel

## Como este ativo se encaixa no escopo da JIT Manager
A JIT Manager e uma empresa de automacao empresarial. Portanto, uma solucao de Secretaria Eletronica para empreendedor se encaixa diretamente no escopo de reduzir caos operacional, padronizar rotina e melhorar previsibilidade.

## Status de repositorio
Ativo mapeado e validado documentalmente na Fase 1.
A decisao de versionar os JSONs tecnicos no repositorio deve ser tratada separadamente.
