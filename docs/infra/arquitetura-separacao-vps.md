---

## Critérios de decisão Go/No-Go — Separação de VPS

Bloco para uso rápido em reuniões executivas e revisões de infraestrutura:

| Critério prático                          | Go (Separar) | No-Go (Manter junto) |
|-------------------------------------------|:------------:|:--------------------:|
| CPU/RAM > 70% de uso consistente          |      ✅      |         ⛔          |
| Serviço pode travar sem afetar o core     |      ✅      |         ⛔          |
| Função crítica para operação              |      ⛔      |         ✅          |
| Volume de dados ou I/O crescente          |      ✅      |         ⛔          |
| Precisa de atualização frequente          |      ✅      |         ⛔          |
| Ambiente de experimentação/prototipagem   |      ✅      |         ⛔          |
| Risco de segurança/isolamento             |      ✅      |         ⛔          |

**Decisão rápida:**
- Se 2 ou mais critérios Go forem atendidos, priorize a separação.
- Se for função core e não há gargalo, mantenha junto até o próximo ciclo de revisão.

_Este bloco pode ser copiado para atas, reuniões ou checklists de expansão._
# Arquitetura Recomendada — Separação de Serviços em Múltiplas VPS

## Princípio Geral
> Separe funções críticas que podem impactar a operação inteira se falharem ou consumirem muitos recursos.

---

## Serviços que DEVEM estar em VPS Separadas

### 1. VPS Principal (Core Operations)
**Função:** Gestão do negócio e operações críticas
- Coolify Master (orquestração)
- Odoo CRM/ERP (gestão central)
- N8N Workflows (integrações automatizadas)
- Chatwoot (atendimento ao cliente)
- PostgreSQL Principal (dados de negócio)
- Traefik Reverse Proxy (roteamento)

**Justificativa:** Estes são os serviços core que não podem falhar. Mantê-los juntos facilita a gestão e monitoramento.

---

### 2. VPS Secundária - LLM e IA
**Função:** Processamento intensivo de IA/local
- Ollama (LLM local)
- Modelos de linguagem (Llama, Mistral, etc.)
- Processamento de áudio/imagem (se necessário)
- Vector Database (Chroma, Pinecone - self-hosted)

**Justificativa:**
- Consumo alto de CPU/RAM
- Pode travar sem afetar operações críticas
- Escalável independentemente

---

### 3. VPS Terceira - Banco de Dados
**Função:** Performance e segurança de dados
- PostgreSQL Dedicado (se volume crescer)
- Redis Cluster (cache distribuído)
- Backup Server (restic, borg, etc.)
- Monitoring Stack (Prometheus + Grafana)

**Justificativa:**
- Isola I/O pesado
- Permite backup independente
- Escala recursos de storage separadamente

---

### 4. VPS Quarta - Serviços Auxiliares
**Função:** Funcionalidades complementares
- Supabase (se usar como alternativa)
- Servidor de E-mails (Postal, Mailcatcher)
- File Storage (MinIO, S3 compatível)
- CI/CD Runner (GitLab, GitHub Actions self-hosted)

**Justificativa:**
- Serviços experimentais que podem ser descontinuados
- Evita impacto em operações principais
- Facilita testes de novas tecnologias

---

## Critérios para Separação

| Critério                        | Separação Recomendada |
|---------------------------------|----------------------|
| Consumo de CPU/RAM elevado      | ✅ VPS dedicada      |
| Risco de crash do sistema       | ✅ VPS dedicada      |
| Função crítica para negócio     | ❌ Manter na principal |
| Volume de dados grande          | ✅ VPS dedicada      |
| Atualizações frequentes         | ✅ VPS separada      |
| Experimentação/prototipagem     | ✅ VPS separada      |

---

## Arquitetura Proposta

```
VPS 1 - CORE (ContaBO principal)
├── Coolify Master
├── Odoo CRM/ERP
├── N8N Workflows
├── Chatwoot
├── PostgreSQL Principal
└── Traefik + Cloudflare

VPS 2 - IA/LLM (ContaBO ou outra)
├── Ollama
├── Modelos de linguagem
└── Vector DB

VPS 3 - DATABASE (ContaBO ou Cloud)
├── PostgreSQL Dedicado
├── Redis Cluster
├── Backup Server
└── Monitoring (Prometheus/Grafana)

VPS 4 - AUXILIAR (Low-cost provider)
├── Supabase
├── Servidor de e-mails
├── File Storage
└── CI/CD Runner
```

---

## Estratégia de Custos

### Fase Inicial (MVP)
- 1 VPS Principal (ContaBO) - Todas as funções principais
- Serviços auxiliares em containers na mesma VPS

### Fase 2 (Validação)
- Separar LLM/IA para VPS dedicada
- Mover banco de dados se volume crescer

### Fase 3 (Escala)
- 4 VPS distintas conforme proposto
- Load balancing entre instâncias
- High availability para serviços críticos

---

## Benefícios da Separação

1. Fault Isolation - Falha em um serviço não derruba tudo
2. Scalability - Escalar recursos por função
3. Security - Isolar dados sensíveis
4. Maintenance - Updates sem downtime geral
5. Cost Control - Pagar só pelo que precisa em cada função
6. Testing - Ambientes isolados para experimentação

---

## Checklist de Implementação

| Etapa | Ação                                         | Prioridade |
|-------|----------------------------------------------|------------|
| 1     | Configurar VPS principal com Coolify + core  | 🚨 Alta    |
| 2     | Testar performance e consumo de recursos     | 🚨 Alta    |
| 3     | Identificar serviços candidatos à separação  | 🟡 Média   |
| 4     | Provisionar VPS para LLM/IA                  | 🟡 Média   |
| 5     | Migrar serviços não críticos gradualmente    | 🟢 Baixa   |
| 6     | Configurar monitoramento cross-VPS           | 🟡 Média   |
| 7     | Documentar arquitetura e dependências        | 🟢 Baixa   |

---

## Recomendações Práticas

1. Comece com 1 VPS para validar o modelo de negócio
2. Monitore recursos constantemente (htop, docker stats)
3. Planeje separação quando CPU/RAM > 70% consistentemente
4. Use Docker networks para comunicação segura entre VPS
5. Implemente health checks para failover automático
6. Mantenha secrets management centralizado (Vault ou Coolify secrets)

Esta abordagem permite crescimento orgânico da infraestrutura conforme as necessidades do JIT Manager evoluem, sem comprometer a estabilidade operacional.
