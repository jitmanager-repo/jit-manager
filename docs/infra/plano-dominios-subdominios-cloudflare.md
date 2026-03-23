# Plano de configuração de domínios, subdomínios e decisão sobre Cloudflare

## Objetivo
Preparar a execução da fase 0.2 com um plano claro para:
- configuração de domínio e subdomínios dos serviços;
- definição de segurança e SSL;
- decisão técnica sobre adoção da Cloudflare.

## Premissas do cenário
- Projeto em fase embrionária.
- Operação enxuta e sem equipe de desenvolvimento dedicada.
- Gerenciador de containers escolhido: Coolify.

## Escopo inicial de subdomínios
Sugestão base para o domínio jitmanager.com.br:

| Serviço | Subdomínio sugerido | Tipo | Observação |
|---|---|---|---|
| Painel do Coolify | coolify.jitmanager.com.br | A/AAAA ou CNAME | Restrição por IP e autenticação forte. |
| Chatwoot | chat.jitmanager.com.br | A/AAAA ou CNAME | Atendimento e comunicação com clientes. |
| N8N | n8n.jitmanager.com.br | A/AAAA ou CNAME | Automações e integrações. |
| Postgres (admin) | dbadmin.jitmanager.com.br | A/AAAA ou CNAME | Não expor acesso direto ao banco público. |

Importante:
- Evitar exposição pública da porta do Postgres.
- Acesso administrativo deve ocorrer por VPN, túnel seguro ou allowlist de IP.

## Sequência de execução recomendada
1. Confirmar DNS autoritativo atual do domínio.
2. Definir estratégia de apontamento:
   - A/AAAA para IP fixo do servidor; ou
   - CNAME para hostname gerenciado.
3. Criar subdomínios do escopo inicial.
4. Configurar proxy reverso e SSL automático no Coolify.
5. Aplicar controles de acesso nos subdomínios administrativos.
6. Validar disponibilidade externa e certificados.
7. Documentar em operação padrão (runbook).

## Critérios para decisão sobre Cloudflare
Adotar Cloudflare se pelo menos 3 condições abaixo forem verdadeiras:
- Necessidade de WAF gerenciado e proteção anti-DDoS na borda.
- Necessidade de proxy e ocultação de IP de origem.
- Necessidade de gestão DNS com alto nível de controle e auditoria.
- Necessidade de regras de cache e performance no edge.
- Necessidade de TLS gerenciado com políticas mais rígidas.

Não adotar Cloudflare neste momento se:
- o ambiente ainda estiver em validação interna;
- o ganho imediato de segurança/performance for baixo;
- a equipe ainda não conseguir sustentar a camada adicional sem aumentar risco operacional.

## Matriz de decisão rápida (Cloudflare)

| Critério | Peso | Sem Cloudflare | Com Cloudflare |
|---|---:|---:|---:|
| Simplicidade operacional | 30% | 5 | 3 |
| Segurança de borda | 30% | 2 | 5 |
| Custo e previsibilidade | 20% | 4 | 4 |
| Escalabilidade futura | 20% | 3 | 5 |

Leitura prática:
- Se a prioridade for simplicidade imediata, iniciar sem Cloudflare pode ser melhor.
- Se a prioridade for proteção de borda desde o início, Cloudflare tende a ser a melhor decisão.

## Recomendação para a JIT Manager (agora)
- Etapa 1: operar com DNS funcional e SSL via stack atual no Coolify.
- Etapa 2: após estabilidade inicial (7 a 14 dias), executar avaliação objetiva com a matriz acima.
- Etapa 3: decidir por entrada da Cloudflare antes da abertura mais ampla do ambiente.

## Critério de pronto da preparação
A preparação para a fase de domínios/subdomínios e Cloudflare estará pronta quando:
- subdomínios planejados estiverem definidos e documentados;
- riscos de exposição de serviços administrativos estiverem mitigados;
- matriz de decisão Cloudflare estiver preenchida e validada;
- decisão final (adotar ou não adotar Cloudflare) estiver registrada.
