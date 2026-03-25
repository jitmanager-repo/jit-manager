# ADR-004: Cloudflare como DNS e CDN

- **Data:** 2025-03-24
- **Status:** Aceito

## Contexto

O dominio `jitmanager.com.br` precisa de gerenciamento de DNS com suporte a subdominios dinamicos por cliente, protecao DDoS e SSL. Avaliamos Cloudflare, Route53 e GoDaddy DNS.

## Decisao

Cloudflare como DNS e CDN para todos os dominios e subdominios do JIT Manager.

## Consequencia

- DNS gerenciado via Cloudflare Dashboard
- SSL via Cloudflare (proxy mode) + Let's Encrypt no Coolify (origin)
- Cada cliente recebe registro A/CNAME apontando para IP da VPS
- Padrao de subdominios documentado em `docs/infra/plano-dominios-subdominios-cloudflare.md`
- Protecao DDoS e WAF basico inclusos no plano free
