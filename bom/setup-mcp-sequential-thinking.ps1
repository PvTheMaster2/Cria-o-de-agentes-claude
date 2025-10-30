# Script de Setup: MCP + Sequential Thinking
# Uso: .\setup-mcp-sequential-thinking.ps1

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  🔌 Setup MCP + Sequential Thinking para Claude Code" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Verificar se está no diretório correto
$currentDir = Get-Location
Write-Host "📁 Diretório atual: $currentDir" -ForegroundColor Gray
Write-Host ""

# Perguntar sobre tokens
Write-Host "🔑 CONFIGURAÇÃO DE TOKENS" -ForegroundColor Yellow
Write-Host ""
Write-Host "Este script configurará 3 MCPs essenciais:" -ForegroundColor White
Write-Host "  1. Sequential Thinking (não precisa token)" -ForegroundColor Gray
Write-Host "  2. GitHub (precisa token)" -ForegroundColor Gray
Write-Host "  3. Brave Search (precisa API key)" -ForegroundColor Gray
Write-Host ""

$setupGitHub = Read-Host "Configurar GitHub MCP? (s/n)"
$setupBrave = Read-Host "Configurar Brave Search MCP? (s/n)"

Write-Host ""

# Tokens
$githubToken = ""
$braveApiKey = ""

if ($setupGitHub -eq "s") {
    Write-Host "GitHub Token:" -ForegroundColor Yellow
    Write-Host "  1. Acesse: https://github.com/settings/tokens" -ForegroundColor Gray
    Write-Host "  2. Clique 'Generate new token (classic)'" -ForegroundColor Gray
    Write-Host "  3. Selecione scopes: repo, workflow" -ForegroundColor Gray
    Write-Host "  4. Gere e copie o token" -ForegroundColor Gray
    Write-Host ""
    $githubToken = Read-Host "Cole seu GitHub token (ghp_...)"
}

if ($setupBrave -eq "s") {
    Write-Host ""
    Write-Host "Brave Search API Key:" -ForegroundColor Yellow
    Write-Host "  1. Acesse: https://brave.com/search/api/" -ForegroundColor Gray
    Write-Host "  2. Crie conta e obtenha API key gratuita" -ForegroundColor Gray
    Write-Host "  3. Copie a chave" -ForegroundColor Gray
    Write-Host ""
    $braveApiKey = Read-Host "Cole sua Brave API key (BSA...)"
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  📦 INSTALANDO MCPs..." -ForegroundColor Yellow
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Instalar MCPs
Write-Host "1️⃣ Instalando Sequential Thinking MCP..." -ForegroundColor Yellow
npm install -g @modelcontextprotocol/server-sequential-thinking
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Sequential Thinking instalado" -ForegroundColor Green
} else {
    Write-Host "   ❌ Erro ao instalar Sequential Thinking" -ForegroundColor Red
}

if ($setupGitHub -eq "s") {
    Write-Host ""
    Write-Host "2️⃣ Instalando GitHub MCP..." -ForegroundColor Yellow
    npm install -g @modelcontextprotocol/server-github
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ GitHub MCP instalado" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Erro ao instalar GitHub MCP" -ForegroundColor Red
    }
}

if ($setupBrave -eq "s") {
    Write-Host ""
    Write-Host "3️⃣ Instalando Brave Search MCP..." -ForegroundColor Yellow
    npm install -g @modelcontextprotocol/server-brave-search
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Brave Search MCP instalado" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Erro ao instalar Brave Search MCP" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  ⚙️ CRIANDO ARQUIVOS DE CONFIGURAÇÃO..." -ForegroundColor Yellow
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Criar estrutura se não existir
if (-not (Test-Path ".claude")) {
    New-Item -ItemType Directory -Force -Path ".claude" | Out-Null
}

# Criar mcp.json
$mcpConfig = @{
    mcpServers = @{}
}

# Sequential Thinking (sempre incluído)
$mcpConfig.mcpServers["sequential-thinking"] = @{
    command = "npx"
    args = @("-y", "@modelcontextprotocol/server-sequential-thinking")
}

# GitHub (se configurado)
if ($setupGitHub -eq "s" -and $githubToken -ne "") {
    $mcpConfig.mcpServers["github"] = @{
        command = "npx"
        args = @("-y", "@modelcontextprotocol/server-github")
        env = @{
            GITHUB_PERSONAL_ACCESS_TOKEN = $githubToken
        }
    }
}

# Brave Search (se configurado)
if ($setupBrave -eq "s" -and $braveApiKey -ne "") {
    $mcpConfig.mcpServers["brave-search"] = @{
        command = "npx"
        args = @("-y", "@modelcontextprotocol/server-brave-search")
        env = @{
            BRAVE_API_KEY = $braveApiKey
        }
    }
}

# Salvar mcp.json
$mcpJson = $mcpConfig | ConvertTo-Json -Depth 10
$mcpJson | Out-File -FilePath ".claude/mcp.json" -Encoding UTF8

Write-Host "✅ Arquivo criado: .claude/mcp.json" -ForegroundColor Green

# Criar .env.mcp para referência
$envMcpContent = @"
# MCP Environment Variables
# ATENÇÃO: Adicione este arquivo ao .gitignore!

"@

if ($setupGitHub -eq "s") {
    $envMcpContent += @"

# GitHub
GITHUB_PERSONAL_ACCESS_TOKEN=$githubToken
"@
}

if ($setupBrave -eq "s") {
    $envMcpContent += @"

# Brave Search
BRAVE_API_KEY=$braveApiKey
"@
}

$envMcpContent | Out-File -FilePath ".env.mcp" -Encoding UTF8
Write-Host "✅ Arquivo criado: .env.mcp (backup dos tokens)" -ForegroundColor Green

# Atualizar .gitignore
if (Test-Path ".gitignore") {
    $gitignore = Get-Content ".gitignore" -Raw
    if ($gitignore -notmatch "\.env\.mcp") {
        Add-Content -Path ".gitignore" -Value "`n# MCP secrets`n.env.mcp"
        Write-Host "✅ .gitignore atualizado" -ForegroundColor Green
    }
} else {
    @"
# MCP secrets
.env.mcp
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8
    Write-Host "✅ .gitignore criado" -ForegroundColor Green
}

# Atualizar agents.md
if (Test-Path "agents.md") {
    Write-Host ""
    Write-Host "📝 Atualizando agents.md..." -ForegroundColor Yellow

    $mcpSection = @"


## 🔌 MCPs Ativos

### Sequential Thinking
- **Status**: ✅ Ativo
- **Uso**: Raciocínio passo a passo em problemas complexos
- **Comando**: Use prompts como "Use pensamento sequencial para..."

"@

    if ($setupGitHub -eq "s") {
        $mcpSection += @"

### GitHub
- **Status**: ✅ Ativo
- **Uso**: Gerenciar repos, PRs, issues
- **Exemplos**:
  - "Liste PRs abertos"
  - "Crie issue para bug X"
  - "Mostre últimos commits"

"@
    }

    if ($setupBrave -eq "s") {
        $mcpSection += @"

### Brave Search
- **Status**: ✅ Ativo
- **Uso**: Buscar informações atualizadas na web
- **Exemplos**:
  - "Busque últimas notícias sobre React 19"
  - "Procure documentação do Next.js 15"

"@
    }

    Add-Content -Path "agents.md" -Value $mcpSection
    Write-Host "   ✅ agents.md atualizado com info dos MCPs" -ForegroundColor Green
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  ✅ SETUP CONCLUÍDO COM SUCESSO!" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

Write-Host "📋 ARQUIVOS CRIADOS:" -ForegroundColor Yellow
Write-Host "   ✅ .claude/mcp.json (configuração dos MCPs)" -ForegroundColor Green
Write-Host "   ✅ .env.mcp (backup dos tokens - NÃO commitar!)" -ForegroundColor Green
Write-Host "   ✅ .gitignore (atualizado)" -ForegroundColor Green
if (Test-Path "agents.md") {
    Write-Host "   ✅ agents.md (atualizado com MCPs)" -ForegroundColor Green
}

Write-Host ""
Write-Host "🔌 MCPs INSTALADOS:" -ForegroundColor Yellow
Write-Host "   ✅ Sequential Thinking" -ForegroundColor Green
if ($setupGitHub -eq "s") {
    Write-Host "   ✅ GitHub" -ForegroundColor Green
}
if ($setupBrave -eq "s") {
    Write-Host "   ✅ Brave Search" -ForegroundColor Green
}

Write-Host ""
Write-Host "🚀 PRÓXIMOS PASSOS:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Inicie Claude Code:" -ForegroundColor White
Write-Host "   claude" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Teste Sequential Thinking:" -ForegroundColor White
Write-Host '   > Use pensamento sequencial para resolver:' -ForegroundColor Cyan
Write-Host '     Como otimizar função complexa X?' -ForegroundColor Cyan
Write-Host ""

if ($setupGitHub -eq "s") {
    Write-Host "3. Teste GitHub MCP:" -ForegroundColor White
    Write-Host "   > Liste os PRs abertos do repositório" -ForegroundColor Cyan
    Write-Host ""
}

if ($setupBrave -eq "s") {
    Write-Host "4. Teste Brave Search:" -ForegroundColor White
    Write-Host "   > Busque as últimas novidades sobre TypeScript 5.3" -ForegroundColor Cyan
    Write-Host ""
}

Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

Write-Host "📚 DOCUMENTAÇÃO COMPLETA:" -ForegroundColor Gray
Write-Host "   MCP_GUIDE.md - Guia completo de MCPs" -ForegroundColor Gray
Write-Host "   CURSOR_VS_CLAUDE_CODE.md - Comparação e melhores práticas" -ForegroundColor Gray
Write-Host ""

Write-Host "⚠️ SEGURANÇA:" -ForegroundColor Red
Write-Host "   NUNCA commite .env.mcp ou tokens no Git!" -ForegroundColor Red
Write-Host "   Verifique se .env.mcp está no .gitignore" -ForegroundColor Red
Write-Host ""
