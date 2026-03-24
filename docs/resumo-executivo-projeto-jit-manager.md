# Resumo Executivo do Projeto — JIT Manager

## 1) Visão geral
A JIT Manager é uma iniciativa em fase de estruturação para validar uma operação de serviços com base em processos, tecnologia e foco comercial bem definido. O projeto prioriza clareza estratégica, execução enxuta e validação real com mercado antes de escalar investimento.

Este repositório concentra a documentação de direção da empresa, identidade de marca, plano de infraestrutura, conteúdo institucional e critérios de viabilidade do MVP.

## 2) Objetivo do projeto
Consolidar posicionamento, preparar presença institucional e validar um MVP com evidências de demanda, operação e viabilidade econômica, para apoiar decisões empresariais (incluindo o momento correto de formalização e expansão).

- Direcionamento estratégico da empresa.
- Estrutura de marca e documentação de identidade.
- Planejamento e decisões de infraestrutura inicial.
- Planejamento de site institucional e governança documental.
- Preparação de ciclo de validação de MVP.
- **Arquitetura de separação de serviços em múltiplas VPS** (docs/infra/arquitetura-separacao-vps.md)
- **Arquitetura evolutiva multi-tenancy e isolamento por cliente** (docs/infra/arquitetura-evolutiva-multitenancy.md)
 - **Setup operacional Mark 0: preparação da VPS** (docs/setup/mark-0.md)

## 4) Status executivo por fase

### Fase 0 — Setup e Estruturação Inicial (em andamento)
- 0.1 Documentação e Identidade Visual: principal estrutura concluída, com consolidação documental em andamento.
- 0.2 Infraestrutura e Integrações: decisões críticas já registradas.

Principais avanços da 0.2:
- Domínio registrado e documentado.
- Nameservers autoritativos ativos na Cloudflare.
- Gerenciador de containers definido: Coolify.
- Plano de subdomínios e política de exposição por serviço documentados.
- Decisão técnica sobre Cloudflare concluída (adoção confirmada).
- Validação de TLS de borda e origem concluída.
- Validação de e-mail concluída (SPF, DKIM e DMARC).
- Rotação de certificado de origem já executada como medida de higiene de segurança.

### Fase 1 — Direcionamento da empresa (concluída)
Entregas de posicionamento, foco inicial, proposta de valor e modelo operacional estão concluídas e registradas.

### Fase 2 — Institucional e site (pendente)
Definição de arquitetura do site, copy final, páginas legais, publicação e analytics ainda pendentes.

### Fase 3 — MVP de validação (pendente)
Escopo de MVP, piloto com clientes, métricas e relatório de viabilidade ainda pendentes.

## 5) Decisões estratégicas e técnicas já tomadas
- Estratégia de execução: validar com operação real antes de escalar complexidade.
- Infraestrutura inicial: Coolify sobre base Docker/Compose para rapidez operacional e portabilidade.
- Segurança de borda e DNS: Cloudflare adotada como camada ativa.
- E-mail corporativo: autenticações essenciais validadas (SPF, DKIM, DMARC).
- Governança: decisões e evidências mantidas no repositório para rastreabilidade.
- **Critérios Go/No-Go para separação de VPS** formalizados para decisões rápidas de expansão.
- **Modelo prático de multi-tenancy** documentado para onboarding seguro e escalável de clientes.

## 6) Riscos controlados e mitigação
- Exposição indevida de dados sensíveis: política de não compartilhamento e rotação de credenciais/certificados quando necessário.
- Complexidade operacional precoce: adoção de stack enxuta e checklist de execução por etapas.
- Divergência documental: atualização centralizada em checklist, roadmap e documentos de infraestrutura.

## 7) Próximos passos propostos

### Curto prazo (1 a 2 semanas)
- Definir tipo de apontamento DNS por subdomínio (A/AAAA ou CNAME).
- Publicar subdomínio público principal com TLS ativo.
- Publicar subdomínios administrativos com restrição de acesso.
- Garantir que subdomínio administrativo de banco permaneça sem exposição pública.
- Avançar avaliação do Odoo para escopo de gestão e integrações, usando como base `docs/infra/integracao-jitmanager-odoo.md`.
- **Revisar e aplicar arquitetura de separação de VPS conforme critérios Go/No-Go.**
- **Estruturar diretórios e projetos no Coolify conforme modelo multi-tenancy.**
- **Automatizar script de onboarding de cliente (criação de projeto, banco, rede e subdomínio).**
- **Documentar e validar estratégia de backup por cliente e core.**

### Médio prazo (2 a 4 semanas)
- Finalizar arquitetura e copy do site institucional.
- Publicar presença institucional mínima com páginas legais e analytics.
- Fechar escopo do MVP e preparar piloto com clientes.
- **Monitorar recursos e planejar expansão horizontal conforme crescimento.**

### Marco de decisão
- A evolução para a próxima fase deve ocorrer com evidências mínimas documentadas, mantendo o critério de avanço já definido no projeto.
## 10) Sugestões para início do setup

- Seguir checklist e scripts do Mark 0 (docs/setup/mark-0.md) para preparar a VPS
- Registrar toda execução e decisões em docs/setup/mark-0-execution-log.md
- Validar acesso e configuração do Coolify na VPS principal
- Criar estrutura de diretórios Projects/ conforme modelo sugerido
- Garantir template docker-compose reutilizável para clientes
- Definir padrão de subdomínio para clientes (ex: {cnpj}.jitmanager.com.br)
- Implementar script inicial de onboarding de cliente
- Documentar política de backup e retenção diferenciada
- Validar isolamento de rede Docker por cliente
- Garantir checklist de segurança mínima (TLS, firewall, segredos)
- Registrar decisões e evidências em cada etapa

## 8) Critério de sucesso do ciclo atual
Considera-se o ciclo atual bem-sucedido quando:
- A base estratégica e infra inicial estiverem estáveis e documentadas.
- O institucional estiver publicado com mensagem consistente.
- O MVP estiver em validação com métricas objetivas de adesão e viabilidade.

## 9) Documento para compartilhamento externo
Este resumo foi preparado para comunicação executiva com stakeholders, parceiros e apoiadores, sem exposição de dados sensíveis (credenciais, chaves privadas, segredos de infraestrutura ou informações pessoais).
