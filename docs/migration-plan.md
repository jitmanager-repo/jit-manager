# Plano de Migração de Arquivos

> Documento de contexto legado.
> Mantido para rastreabilidade da reorganização dos arquivos entre repositórios e acompanhamento do andamento do projeto.
> Não é fonte canônica operacional atual.

## Objetivo
Garantir a migração correta de arquivos para os repositórios correspondentes, conforme definido em ADR-001.

---

## Arquivos e Destinos

### Repositório: `jit-infra`
- **Arquivo**: `docs/setup/mark-0-execution-log.md`
  - **Motivo**: Registros de execução e templates relacionados ao setup de VPS devem ser mantidos em repositório privado.

### Repositório: `jit-scripts`
- **Arquivo**: `maintenance/test-project-workflows.ps1` (referenciado em `docs/changelog/2025-W13.md` e `docs/decisions/005-github-projects-gestao.md`)
  - **Motivo**: Scripts de automação e manutenção pertencem ao escopo deste repositório.

### Repositório: `client-template`
- **Arquivo**: Templates Docker Compose (referenciados em `docs/decisions/003-multitenancy-isolamento.md`)
  - **Motivo**: Templates para ambientes isolados por cliente devem ser centralizados neste repositório.

---

## Passos para Migração

1. **Preparação**:
   - Validar que os repositórios de destino estão configurados corretamente.
   - Garantir que os arquivos estão atualizados antes da migração.

2. **Migração**:
   - Transferir os arquivos listados para os repositórios correspondentes.
   - Atualizar os links e referências nos arquivos restantes no repositório `jit-manager`.

3. **Validação**:
   - Verificar se os arquivos foram migrados corretamente.
   - Testar os scripts e templates nos novos repositórios.

4. **Documentação**:
   - Atualizar a documentação em todos os repositórios para refletir as mudanças.

---

## Arquivos migrados para outros repositórios

Os arquivos abaixo foram movidos para seus respectivos repositórios. Consulte os repositórios indicados para acessar o conteúdo atualizado.

### Arquivos migrados para `jit-infra`
- `docs/setup/mark-0.md`
- `docs/setup/mark-0-execution-log.md`

### Arquivos migrados para `jit-scripts`
- Scripts de automação e manutenção (detalhes nos changelogs e decisões).

### Arquivos migrados para `client-template`
- Templates Docker Compose para ambientes isolados por cliente.

---

## Observações
- A migração deve ser feita com cuidado para evitar perda de informações.
- Após a migração, revisar os repositórios para garantir consistência.

---

## Checklist
- [ ] Validar repositórios de destino.
- [ ] Migrar arquivos para `jit-infra`.
- [ ] Migrar arquivos para `jit-scripts`.
- [ ] Migrar arquivos para `client-template`.
- [ ] Atualizar links e referências.
- [ ] Testar e validar os arquivos migrados.
- [ ] Atualizar documentação.