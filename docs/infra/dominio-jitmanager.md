# Registro do domínio jitmanager.com.br

## Dados de registro

| Campo | Valor |
|---|---|
| Domínio | jitmanager.com.br |
| Registrador | Hostinger |
| Data de registro | 2025-07-22 |
| Data de expiração | 2026-07-22 |
| Responsável | JIT Manager |

## Estado atual dos nameservers

| Nameserver | Situação |
|---|---|
| elmo.ns.cloudflare.com | Ativo (Cloudflare DNS) |
| paloma.ns.cloudflare.com | Ativo (Cloudflare DNS) |

> Estado atualizado: nameservers já migrados para Cloudflare e resolução pública ativa.

## Próxima ação necessária (fase 0.2)

Validar conclusão operacional da configuração DNS/TLS e manter monitoramento dos subdomínios de serviço:

- manter SSL/TLS do Cloudflare em modo Completo (estrito);
- manter certificado de origem válido para `jitmanager.com.br` e `*.jitmanager.com.br`;
- seguir checklist de exposição segura em `docs/infra/plano-dominios-subdominios-cloudflare.md`.

Referência de execução: docs/infra/plano-dominios-subdominios-cloudflare.md
