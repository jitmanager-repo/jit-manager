# ADR-002: Coolify como orquestrador de containers

- **Data:** 2025-03-24
- **Status:** Aceito

## Contexto

Precisamos de um orquestrador self-hosted para gerenciar containers Docker na VPS. Avaliamos Portainer, Coolify, Dokku, CapRover e Yacht (documentado em `docs/infra/avaliacao-gerenciador-containers.md`).

## Decisao

Coolify foi escolhido como orquestrador principal.

Motivos:
- Interface moderna e intuitiva
- Deploy via git push nativo
- Suporte a docker-compose
- SSL automatico com Let's Encrypt
- Gerenciamento de secrets integrado
- Comunidade ativa e documentacao boa

## Consequencia

- Toda a orquestracao de servicos passa pelo Coolify
- Estrutura de Projects no Coolify segue padrao `jit-manager-core` + `client-{nome}`
- Mark 1 do setup de infra e dedicado a instalacao e configuracao do Coolify
- Coolify Master fica na VPS principal (Core Operations)
