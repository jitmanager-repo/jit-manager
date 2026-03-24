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

## Diretriz de arquitetura para a fase 0.2
Para reduzir risco operacional neste início:
- usar Coolify como camada de operação, com Docker/Compose como fonte de verdade;
- evitar lock-in de interface, mantendo versionados os arquivos de infraestrutura;
- separar subdomínios por classe de exposição (público, restrito, interno).

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

## Decisão operacional de domínios e subdomínios (fase 0.2)

| Subdomínio | Classe de exposição | Publicação inicial | Regra de acesso |
|---|---|---|---|
| chat.jitmanager.com.br | Público | Sim | HTTPS obrigatório e autenticação da aplicação. |
| n8n.jitmanager.com.br | Restrito | Sim | Acesso apenas por allowlist de IP ou VPN, sem indexação pública. |
| coolify.jitmanager.com.br | Restrito | Sim | Acesso administrativo com IP allowlist e credenciais fortes. |
| dbadmin.jitmanager.com.br | Interno | Não expor inicialmente | Liberar somente em túnel seguro, VPN ou rede privada. |

Regra de ouro:
- serviço administrativo não deve ficar aberto de forma irrestrita na internet;
- todo endpoint publicado deve ter TLS válido e controle de acesso ativo.

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

Decisão de trabalho para início da 0.2:
- iniciar sem Cloudflare na borda durante a validação inicial;
- reavaliar entre 7 e 14 dias usando a matriz deste documento;
- antecipar adoção se houver tentativa de acesso indevido recorrente, exigência de WAF ou necessidade clara de ocultar IP de origem.

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

## Resultado da decisão (2026-03-24)
Decisão final: adotar Cloudflare agora.

Evidências registradas:
- nameservers ativos em Cloudflare (`elmo.ns.cloudflare.com` e `paloma.ns.cloudflare.com`);
- modo SSL/TLS configurado em Completo (estrito);
- certificado de origem Cloudflare válido para `jitmanager.com.br` e `*.jitmanager.com.br`;
- respostas externas com `Server: cloudflare` para raiz, `www` e subdomínio de teste.

Pendência operacional fora da decisão de borda:
- nenhuma pendência crítica de borda.

Validação complementar de e-mail (concluída em 2026-03-24):
- `spf=pass` e `Received-SPF: pass` para `dev@jitmanager.com.br`;
- `dkim=pass` com seletor `hostingermail-a`;
- `dmarc=pass` com política `p=none`.

Higiene de segurança aplicada:
- certificado de origem anterior revogado e novo certificado emitido;
- manter rotação de certificado de origem quando houver exposição acidental de chave.

## Checklist de execução da decisão (0.2)
- [X] Confirmar DNS autoritativo do domínio jitmanager.com.br.
- [ ] Definir tipo de apontamento por subdomínio (A/AAAA ou CNAME).
- [ ] Publicar chat.jitmanager.com.br com TLS válido.
- [ ] Publicar n8n.jitmanager.com.br e coolify.jitmanager.com.br com restrição de acesso.
- [ ] Manter dbadmin.jitmanager.com.br sem exposição pública.
- [X] Registrar resultado da matriz Cloudflare com decisão final (adotar agora ou adiar).

## Critério de pronto da preparação
A preparação para a fase de domínios/subdomínios e Cloudflare estará pronta quando:
- subdomínios planejados estiverem definidos e documentados;
- riscos de exposição de serviços administrativos estiverem mitigados;
- matriz de decisão Cloudflare estiver preenchida e validada;
- decisão final (adotar ou não adotar Cloudflare) estiver registrada.
