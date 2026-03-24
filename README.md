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
- Fase 0 - Setup de repositório e marca (concluída)
- Fase 1 - Direcionamento da empresa
- Fase 2 - Institucional e site
- Fase 3 - MVP e validação de viabilidade (inclui decisão de CNPJ)

## Decisão de CNPJ
A abertura de CNPJ é tratada como marco de decisão de negócio, não como etapa inicial. A decisão será baseada em evidências da Fase 3 (interesse, conversão, operação mínima e previsibilidade de receita).
