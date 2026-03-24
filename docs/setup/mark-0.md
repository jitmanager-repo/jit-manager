# Setup Mark 0 — Preparação da VPS Existente

## 🚨 SETUP ZERO - VPS Mark 0

### 1. Acesso e Segurança SSH
- [ ] Validar acesso atual à VPS (credenciais atuais)
- [ ] Backup das configurações atuais (se houver algo valioso)
- [ ] Criar usuário administrativo específico (não usar root)
- [ ] Configurar chave SSH ed25519 (sem senha)
- [ ] Configurar ~/.ssh/config com alias para VPS
- [ ] Testar acesso via chave (sem senha)
- [ ] Instalar e configurar fail2ban
- [ ] Desabilitar PasswordAuthentication (após testes)
- [ ] Desabilitar PermitRootLogin
- [ ] Considerar porta SSH não padrão (opcional)

### 2. Hardening Básico
- [ ] Atualizar sistema operacional
- [ ] Configurar firewall básico (ufw/firewalld)
- [ ] Configurar timezone e locale corretos
- [ ] Instalar ferramentas essenciais (docker, git, curl, vim, htop)
- [ ] Configurar swap se necessário
- [ ] Configurar limits e sysctl para performance

### 3. Preparação para Docker/Coolify
- [ ] Instalar Docker e Docker Compose
- [ ] Adicionar usuário ao grupo docker
- [ ] Configurar Docker daemon (logs, storage driver)
- [ ] Validar funcionamento docker hello-world
- [ ] Criar diretórios de trabalho (/opt/jit, /var/lib/docker, etc.)

### 4. Setup de Monitoramento Mínimo
- [ ] Instalar ferramentas de monitoramento (htop, iotop, iftop)
- [ ] Configurar logs básicos (journald, rsyslog)
- [ ] Validar espaço em disco e memória
- [ ] Configurar alertas básicos (disk space, memory)


### 5. Documentação do Estado Atual
- [ ] Documentar especificações da VPS (CPU, RAM, disco)
- [ ] Documentar sistema operacional e versão
- [ ] Documentar IPs e configurações de rede
- [ ] Documentar usuários e permissões atuais
- [ ] Criar snapshot de baseline (se possível)

---

## Registro prático da execução

> Preencha as seções abaixo em tempo real durante o setup. Use como checklist e diário de bordo.

### Problemas Encontrados
- [ ] Nenhum
- [ ] ...

### Configurações Aplicadas
- [ ] ...

### Próximos Passos
- [ ] ...

---

## 🛡️ Script de Configuração Mark 0

```bash
#!/bin/bash
# setup-mark-0.sh - Configuração inicial da VPS

echo "🚀 Iniciando Setup Mark 0 da VPS..."

# 1. Atualização do sistema
echo "🔄 Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

# 2. Instalação de ferramentas essenciais
echo "🔧 Instalando ferramentas essenciais..."
sudo apt install -y \
  curl wget git vim htop iotop iftop \
  ufw fail2ban \
  ca-certificates gnupg lsb-release

# 3. Configuração de usuário administrativo
echo "👤 Criando usuário administrativo..."
sudo adduser jitadmin
sudo usermod -aG sudo jitadmin
sudo usermod -aG docker jitadmin 2>/dev/null || echo "Docker não instalado ainda"

# 4. Configuração SSH básica
echo "🔐 Configurando SSH..."
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# 5. Configuração de firewall básico
echo "🛡️ Configurando firewall..."
sudo ufw allow OpenSSH
sudo ufw --force enable

# 6. Instalação do Docker
echo "🐳 Instalando Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo usermod -aG docker jitadmin

# 7. Instalação do Docker Compose
echo "🚢 Instalando Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 8. Criação de diretórios de trabalho
echo "📂 Criando estrutura de diretórios..."
sudo mkdir -p /opt/jit/{projects,backups,logs}
sudo chown -R $USER:$USER /opt/jit

echo "✅ Setup Mark 0 concluído!"
echo "💡 Próximos passos:"
echo "1. Configurar chave SSH para acesso sem senha"
echo "2. Testar acesso com novo usuário jitadmin"
echo "3. Instalar Coolify"
```

---

## 🔑 Configuração de Acesso SSH Seguro (Automatizado)

```bash
#!/bin/bash
# setup-ssh-access.sh - Configuração completa de acesso SSH

echo "🔐 Configurando acesso SSH seguro..."

# Gerar chave SSH se não existir
if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "🔑 Gerando chave SSH ed25519..."
  ssh-keygen -t ed25519 -C "jitmanager@$(hostname)" -f ~/.ssh/id_ed25519 -N ""
fi

# Configurar ~/.ssh/config
cat > ~/.ssh/config << 'EOF'
Host jit-vps
    HostName SEU_IP_DA_VPS
    User jitadmin
    IdentityFile ~/.ssh/id_ed25519
    Port 22
EOF

# Copiar chave para o servidor (primeiro acesso com senha)
echo "📋 Copiando chave para o servidor (pode pedir senha)..."
ssh-copy-id -i ~/.ssh/id_ed25519.pub jitadmin@SEU_IP_DA_VPS

echo "✅ Configuração SSH concluída!"
echo "💡 Use 'ssh jit-vps' para acessar"
```

---

## 📋 Checklist Completo de Setup

### 🚨 MARK 0 - VPS Setup Inicial
- [ ] Validar acesso à VPS existente
- [ ] Criar snapshot de baseline (se possível)
- [ ] Executar script setup-mark-0.sh
- [ ] Configurar acesso SSH seguro
- [ ] Testar acesso sem senha
- [ ] Documentar estado atual da VPS

### 🏗️ MARK 1 - Coolify Setup
- [ ] Instalar Coolify na VPS
- [ ] Configurar domínio coolify.jitmanager.com.br
- [ ] Validar acesso ao dashboard
- [ ] Configurar backup do Coolify
- [ ] Documentar credenciais e acesso

### 📁 MARK 2 - Estrutura de Projetos
- [ ] Criar estrutura Projects/ no Coolify
- [ ] Configurar template docker-compose base
- [ ] Definir padrão de subdomínios
- [ ] Criar projeto JIT Core Services

### 🤖 MARK 3 - Automação
- [ ] Criar script de onboarding de cliente
- [ ] Configurar webhooks de integração
- [ ] Testar processo completo de setup
- [ ] Documentar automações

### 🧪 MARK 4 - Primeiro Cliente
- [ ] Onboardar cliente teste
- [ ] Validar isolamento de dados
- [ ] Testar backup e recuperação
- [ ] Documentar lições aprendidas

---

## 🎯 Próximos Passos Imediatos

### Hoje:
1. ✅ Validar acesso atual à VPS
2. ✅ Executar backup das configurações atuais
3. ✅ Executar script `setup-mark-0.sh`
4. ✅ Configurar acesso SSH seguro

### Amanhã:
1. ✅ Testar acesso com novo usuário
2. ✅ Validar instalação do Docker
3. ✅ Começar instalação do Coolify
4. ✅ Documentar estado atual

### Esta Semana:
1. ✅ Ter Coolify operacional
2. ✅ Primeira estrutura de projetos
3. ✅ Script básico de onboarding
4. ✅ Primeiro cliente teste

---

## 💡 Importante: Documentação em Tempo Real

Crie um documento chamado `docs/setup/mark-0-execution-log.md` e registre:

```markdown
# Execução Setup Mark 0 - VPS

## Data: YYYY-MM-DD HH:MM

## Estado Inicial da VPS
- Sistema: [Ubuntu 22.04 LTS]
- CPU: [8 vCPU]
- RAM: [24GB]
- Disco: [200GB NVMe]

## Comandos Executados
```bash
# Comandos e outputs
```

## Problemas Encontrados
- [Nenhum/Lista de problemas]

## Configurações Aplicadas
- [Lista de configurações]

## Próximos Passos
- [Lista de próximos passos]
```

---

## 🚀 Conclusão

Agora temos um plano completo e executável que começa do zero com a VPS existente. O approach é:

1. **Mark 0**: Preparar a VPS como base sólida
2. **Mark 1**: Instalar e configurar Coolify
3. **Mark 2**: Criar estrutura de projetos
4. **Mark 3**: Automatizar processos
5. **Mark 4**: Validar com primeiro cliente

Tudo documentado e com checklists claros para execução! 🎯
