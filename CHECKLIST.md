# JIT Manager — Checklist mestre
_Início: 2026-03-13_



## Fase 0 — Setup e Estruturação Inicial (em andamento)
- Status: foco ativo em 0.1 (Issue #15 em andamento); 0.2 na sequência
- 0.1 Documentação e Identidade Visual
	- Status: Em andamento (Issue #15)
	- [X] Setup do repositório
	- [X] Identidade da marca (tagline, tom, fontes, paleta)
	- [X] Manual de marca v1
- 0.2 Infraestrutura e Integrações
	- Status: Planejamento operacional documentado e pronto para execução
	- [X] Registro e documentação do domínio jitmanager.com.br (Hostinger, expira 2026-07-22, DNS autoritativo ativo na Cloudflare; detalhes em docs/infra/dominio-jitmanager.md)
	- [X] Planejamento de hospedagem e subdomínios (Chatwoot, N8N, Postgres) com decisão operacional e checklist de execução em docs/infra/plano-dominios-subdominios-cloudflare.md
	- [X] Avaliação e escolha do gerenciador de containers (Coolify, Docker, Easypanel) - decisão: Coolify, por menor custo operacional e maior velocidade no cenário atual (base: docs/infra/avaliacao-gerenciador-containers.md)
	- [ ] Avaliação do Odoo como base de gestão e integrações (base de decisão: docs/infra/integracao-jitmanager-odoo.md)
	- [X] Avaliação da Cloudflare para gestão de domínios/subdomínios e segurança (decisão: adotar agora; modo SSL/TLS Completo (estrito); evidências em docs/infra/plano-dominios-subdominios-cloudflare.md)
	- [ ] **Implementação da arquitetura de separação de serviços em múltiplas VPS** (ver docs/infra/arquitetura-separacao-vps.md)
		- Checklist de implementação e recomendações práticas por fase
		- Revisar critérios de separação e benefícios antes de expandir infraestrutura

## Fase 1 — Direcionamento da empresa (1 semana)
- Status: Concluída (Issue #14)
- [X] Definição oficial: o que é a JIT Manager
- [X] Definição de fronteira: o que não é a JIT Manager
- [X] Oferta principal inicial (produto-serviço de entrada)
- [X] ICP principal (segmento, porte, canal, maturidade)
- [X] Dores priorizadas (top 3) e ganhos esperados
- [X] Proposta de valor em 1 frase e pitch de 30s revisado
- [X] Modelo operacional inicial (entrega, suporte, acompanhamento)

## Fase 2 — Institucional e site (1 semana)
- [ ] Arquitetura do site institucional (seções e objetivos)
- [ ] Copy institucional final (home, sobre, solução, contato, FAQ)
- [ ] CTA principal e secundário definidos
- [ ] Página legal mínima (privacidade + termos iniciais)
- [ ] Publicar site institucional
- [ ] Analytics e eventos de conversão

## Fase 3 — MVP de validação (2 a 4 semanas)
- [ ] Definir escopo do MVP (funcionalidades mínimas)
- [ ] Definir hipótese de valor e critérios de sucesso
- [ ] Implementar piloto operacional com 1 a 3 clientes
- [ ] Medir métricas de validação (interesse, ativação, retenção)
- [ ] Medir viabilidade financeira inicial (receita, custo, margem)
- [ ] Decisão formal: abrir CNPJ agora, adiar ou pivotar

## Critério de avanço
- Avançar para a fase seguinte apenas com critérios de pronto documentados e evidências mínimas.
