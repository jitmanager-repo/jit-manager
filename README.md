# JIT Manager

Repositório mestre de direcionamento estratégico, posicionamento institucional e validação de viabilidade do MVP da JIT Manager.

## Objetivo deste repositório
Transformar a base de marca já criada em uma operação validável:
- Definir com clareza o que a JIT Manager é e o que não é
- Estabelecer foco comercial inicial (ICP + oferta + escopo)
- Consolidar documentação institucional para site e materiais
- Planejar e executar MVP para validar viabilidade real do negócio

## Estrutura atual
- Checklist mestre: `CHECKLIST.md`
- Roadmap executivo: `docs/roadmap.md`
- Direcionamento estratégico: `docs/company/`
- Marca e identidade: `docs/brand/`
	- Infraestrutura e integrações: `docs/infra/`
	- Decisão de containers: `docs/infra/avaliacao-gerenciador-containers.md`
	- Domínios e Cloudflare: `docs/infra/plano-dominios-subdominios-cloudflare.md`
	- Base de decisão Odoo: `docs/infra/integracao-jitmanager-odoo.md`
	- **Arquitetura de separação de serviços em múltiplas VPS:** `docs/infra/arquitetura-separacao-vps.md` (recomendações práticas para expansão, escalabilidade e checklist de implementação)
	- **Arquitetura evolutiva multi-tenancy e isolamento por cliente:** `docs/infra/arquitetura-evolutiva-multitenancy.md` (modelo prático para SaaS, onboarding e crescimento seguro)
- Conteúdo institucional/site: `docs/site/`
- Base legal inicial: `docs/legal/`

## Princípios de execução
- Clareza antes de complexidade
- Validar com clientes antes de escalar tecnologia
- Priorizar ganhos operacionais mensuráveis
- Registrar decisões no repositório para evitar retrabalho

## Estrutura multi-repositório

Este é o repositório de **documentação estratégica**. Os repositórios operacionais (privados) são:

| Repositório | Finalidade |
|---|---|
| [jit-infra](https://github.com/jitmanager-repo/jit-infra) | Scripts de setup VPS, configurações Docker/Coolify, templates por serviço |
| [jit-scripts](https://github.com/jitmanager-repo/jit-scripts) | Scripts de automação, onboarding de clientes, backup e manutenção |
| [client-template](https://github.com/jitmanager-repo/client-template) | Template base docker-compose para ambientes isolados por cliente |

> Neste repositório **não devem constar** IPs, credenciais, segredos ou configurações operacionais de produção.

## Fluxo de Issues
- Toda issue deve entrar automaticamente no Projects oficial do repositório.
- Toda issue em execução deve estar na coluna `Em andamento` do board `JIT Manager - Roadmap`.
- Configuração e validação (via repository secrets): `docs/process/projects.md`

## Macrofases
- Fase 0 - Base estratégica e infraestrutura inicial (em andamento, com Mark 0 e Mark 1 concluídos e Mark 2 ativo)
- Fase 1 - Direcionamento da empresa (concluída)
- Fase 2 - Institucional e site (pendente)
- Fase 3 - MVP e validação de viabilidade (pendente, inclui decisão de CNPJ)

### Marks operacionais da Fase 0
- Mark 0 - Preparação e endurecimento da VPS (concluído)
- Mark 1 - Coolify, backup e operação inicial (concluído)
- Mark 2 - Estrutura de projetos e padronização operacional (ativo)

Referência operacional: `jit-infra/setup/`

## Decisão de CNPJ
A abertura de CNPJ é tratada como marco de decisão de negócio, não como etapa inicial. A decisão será baseada em evidências da Fase 3 (interesse, conversão, operação mínima e previsibilidade de receita).

# Arquivos migrados para outros repositórios

Os arquivos abaixo foram movidos para seus respectivos repositórios. Consulte os repositórios indicados para acessar o conteúdo atualizado.

## Arquivos migrados para `jit-infra`
- `docs/setup/mark-0.md`
- `docs/setup/mark-0-execution-log.md`

## Arquivos migrados para `jit-scripts`
- Scripts de automação e manutenção (detalhes nos changelogs e decisões).

## Arquivos migrados para `client-template`
- Templates Docker Compose para ambientes isolados por cliente.

---

Para mais informações, consulte o plano de migração em `docs/migration-plan.md`.
