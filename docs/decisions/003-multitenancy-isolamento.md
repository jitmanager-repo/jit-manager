# ADR-003: Multi-tenancy com isolamento fisico por cliente

- **Data:** 2025-03-24
- **Status:** Aceito

## Contexto

O JIT Manager atende multiplos clientes que precisam de ambientes com dados isolados. Precisamos definir o modelo de multi-tenancy: banco compartilhado com schema por tenant, ou isolamento fisico com containers separados.

## Decisao

Isolamento fisico por cliente usando containers Docker separados com redes e volumes independentes.

Modelo:
- Cada cliente recebe stack propria (docker-compose via `client-template`)
- Banco de dados PostgreSQL dedicado por cliente
- Rede Docker isolada (`{cliente}-network`)
- Volumes nomeados independentes (`{cliente}-postgres-data`)
- Subdominio unico (`{cnpj}.jitmanager.com.br`)

## Consequencia

- Seguranca reforçada — dados nunca se misturam
- Compliance facilitado (LGPD)
- Maior consumo de recursos (cada cliente = containers proprios)
- Escalavel horizontalmente: clientes grandes podem migrar para VPS dedicada
- Backup e restore independente por cliente
- Documentado em `docs/infra/arquitetura-evolutiva-multitenancy.md`
