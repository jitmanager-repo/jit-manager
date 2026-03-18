# Provador Virtual — Ativo de automacao da JIT Manager

## Definicao do ativo
O Provador Virtual e um ativo operacional da JIT Manager para automatizar criacao de imagens comerciais combinando fotos de cliente e produto, com pipeline de coleta, organizacao e geracao assistida por IA.

## Escopo funcional (v1)
- Coleta de imagens por scraping de perfil/post do Instagram
- Organizacao de fotos em base estruturada (Airtable)
- Separacao de imagens de cliente e produto
- Combinacao automatizada de imagens com modelo multimodal
- Salvamento de imagens geradas no fluxo operacional
- Agente assistente para conduzir o operador no processo

## Stack operacional observada
- n8n (orquestracao de workflows)
- Apify (scraping de Instagram)
- Airtable (base de operacao e selecao)
- Gemini (geracao de imagem)

## Dores que resolve
1. Criacao manual de criativos e lenta
2. Alto custo operacional para gerar variacoes visuais
3. Falta de pipeline para transformar fotos em material comercial
4. Dificuldade de escalar personalizacao de imagem
5. Retrabalho para buscar e organizar referencias de cliente/produto

## Ganhos esperados
1. Reducao do tempo de producao de criativos
2. Aumento da escala de variacoes de imagem por oferta
3. Maior velocidade para testes comerciais e campanhas
4. Reducao de dependencia de edicao manual em tarefas repetitivas
5. Base visual estruturada para reaproveitamento e melhoria continua

## Limites e premissas
- Exige qualidade minima das imagens de entrada
- Exige curadoria humana para selecao de pares cliente/produto
- Exige validacao de uso de imagem e conformidade juridica
- Exige calibracao de prompts para consistencia visual

## Como este ativo se encaixa no escopo da JIT Manager
A JIT Manager e uma empresa de automacao empresarial. O Provador Virtual se encaixa como automacao de front comercial e marketing operacional, reduzindo esforço manual e aumentando capacidade de criacao com previsibilidade.

## Status de repositorio
Ativo mapeado e em avaliacao estrategica.
A decisao de versionar workflows tecnicos deve ocorrer apos validacao de viabilidade comercial.
