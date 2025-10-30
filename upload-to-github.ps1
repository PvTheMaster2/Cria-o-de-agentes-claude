# Script PowerShell para Upload Automático para GitHub
# Uso: .\upload-to-github.ps1

Write-Host "🚀 Iniciando workflow de upload para GitHub..." -ForegroundColor Cyan
Write-Host ""

# Verificar se Git está instalado
$gitInstalled = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitInstalled) {
    Write-Host "❌ ERRO: Git não está instalado!" -ForegroundColor Red
    Write-Host "   Instale Git: https://git-scm.com/downloads" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Git encontrado: $(git --version)" -ForegroundColor Green
Write-Host ""

# Verificar se já é um repositório Git
if (Test-Path .git) {
    Write-Host "⚠️  Repositório Git já inicializado" -ForegroundColor Yellow
    Write-Host "   Continuando com workflow..." -ForegroundColor Gray
    Write-Host ""
} else {
    Write-Host "📦 Inicializando repositório Git..." -ForegroundColor Cyan
    git init
    Write-Host "✅ Repositório inicializado" -ForegroundColor Green
    Write-Host ""
}

# Verificar .gitignore
if (-not (Test-Path .gitignore)) {
    Write-Host "⚠️  .gitignore não encontrado. Criando básico..." -ForegroundColor Yellow
    @"
# Environment files
.env
.env.local
.env.*.local

# Node modules
node_modules/

# OS files
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
"@ | Out-File -FilePath .gitignore -Encoding UTF8
    Write-Host "✅ .gitignore criado" -ForegroundColor Green
    Write-Host ""
}

# Mostrar status atual
Write-Host "📊 Status atual do repositório:" -ForegroundColor Cyan
git status --short
Write-Host ""

# Perguntar sobre repositórios aninhados
Write-Host "⚠️  ATENÇÃO: Você tem repositórios Git clonados dentro do projeto:" -ForegroundColor Yellow
Write-Host "   - agents/" -ForegroundColor Gray
Write-Host "   - awesome-claude-code-subagents/" -ForegroundColor Gray
Write-Host "   - claude-code-subagents/" -ForegroundColor Gray
Write-Host ""
Write-Host "Escolha como tratar esses repositórios:" -ForegroundColor Cyan
Write-Host "   1) Manter como submódulos Git (recomendado - mantém atualizações)" -ForegroundColor Green
Write-Host "   2) Remover .git e versionar arquivos diretamente (mais simples)" -ForegroundColor Yellow
Write-Host "   3) Não fazer nada (manter como estão)" -ForegroundColor Gray
Write-Host ""
$choice = Read-Host "Escolha (1/2/3)"

if ($choice -eq "2") {
    Write-Host ""
    Write-Host "🗑️  Removendo diretórios .git dos repositórios clonados..." -ForegroundColor Yellow
    
    $repos = @("agents", "awesome-claude-code-subagents", "claude-code-subagents")
    foreach ($repo in $repos) {
        if (Test-Path "$repo\.git") {
            Remove-Item -Recurse -Force "$repo\.git" -ErrorAction SilentlyContinue
            Write-Host "   ✅ Removido: $repo\.git" -ForegroundColor Green
        }
    }
    Write-Host ""
}

# Adicionar arquivos ao staging
Write-Host "📝 Adicionando arquivos ao staging..." -ForegroundColor Cyan
git add .
Write-Host "✅ Arquivos adicionados" -ForegroundColor Green
Write-Host ""

# Ver o que será commitado
Write-Host "📋 Arquivos que serão commitados:" -ForegroundColor Cyan
$stagedFiles = git diff --cached --name-only
$fileCount = ($stagedFiles | Measure-Object).Count
Write-Host "   Total: $fileCount arquivos" -ForegroundColor Gray

if ($fileCount -gt 100) {
    Write-Host ""
    $show = Read-Host "Deseja ver a lista completa? (S/N)"
    if ($show -eq "S" -or $show -eq "s") {
        $stagedFiles | ForEach-Object { Write-Host "   $_" -ForegroundColor Gray }
    }
}
Write-Host ""

# Solicitar mensagem de commit
Write-Host "💬 Mensagem de commit:" -ForegroundColor Cyan
$defaultMessage = "Initial commit: Claude Code agents and best practices setup

- Added 100+ specialized agents from agents-claude-code
- Added awesome-claude-code-subagents repository
- Added claude-code-subagents repository
- Configured .claude/ settings and MCP servers
- Added documentation and implementation guides"
Write-Host "   Padrão: $defaultMessage" -ForegroundColor Gray
Write-Host ""
$customMessage = Read-Host "Usar mensagem padrão? (S/N)"

if ($customMessage -eq "S" -or $customMessage -eq "s" -or $customMessage -eq "") {
    $commitMessage = $defaultMessage
} else {
    $commitMessage = Read-Host "Digite sua mensagem de commit"
}

# Fazer commit
Write-Host ""
Write-Host "💾 Fazendo commit..." -ForegroundColor Cyan
git commit -m $commitMessage

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro ao fazer commit. Verifique se há arquivos para commitar." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Commit realizado com sucesso!" -ForegroundColor Green
Write-Host ""

# Verificar se remote já existe
$remoteExists = git remote | Select-String "origin" -Quiet

if ($remoteExists) {
    Write-Host "🔗 Remote 'origin' já configurado:" -ForegroundColor Cyan
    git remote -v
    Write-Host ""
    
    $pushNow = Read-Host "Deseja fazer push agora? (S/N)"
    if ($pushNow -eq "S" -or $pushNow -eq "s") {
        Write-Host ""
        Write-Host "📤 Fazendo push para GitHub..." -ForegroundColor Cyan
        
        # Verificar branch
        $branch = git branch --show-current
        if (-not $branch) {
            git branch -M main
            $branch = "main"
        }
        
        Write-Host "   Branch: $branch" -ForegroundColor Gray
        git push -u origin $branch
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "✅ Upload concluído com sucesso!" -ForegroundColor Green
            Write-Host ""
            Write-Host "🌐 Próximos passos:" -ForegroundColor Cyan
            Write-Host "   1. Acesse seu repositório no GitHub" -ForegroundColor Gray
            Write-Host "   2. Configure README.md se desejar" -ForegroundColor Gray
            Write-Host "   3. Verifique se todos os arquivos foram enviados corretamente" -ForegroundColor Gray
        } else {
            Write-Host ""
            Write-Host "⚠️  Erro ao fazer push. Possíveis causas:" -ForegroundColor Yellow
            Write-Host "   - Repositório não existe no GitHub ainda" -ForegroundColor Gray
            Write-Host "   - Problemas de autenticação" -ForegroundColor Gray
            Write-Host "   - Branch não configurada corretamente" -ForegroundColor Gray
            Write-Host ""
            Write-Host "💡 Use GitHub Push Pull Extension no VS Code/Cursor:" -ForegroundColor Cyan
            Write-Host "   1. Pressione Ctrl+Shift+P" -ForegroundColor Gray
            Write-Host "   2. Digite: Git: Publish to GitHub" -ForegroundColor Gray
            Write-Host "   3. Siga as instruções na tela" -ForegroundColor Gray
        }
    }
} else {
    Write-Host ""
    Write-Host "🌐 Configuração do GitHub:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   Opção 1 - GitHub Push Pull Extension (Recomendado):" -ForegroundColor Green
    Write-Host "   1. Pressione Ctrl+Shift+P no VS Code/Cursor" -ForegroundColor Gray
    Write-Host "   2. Digite: Git: Publish to GitHub" -ForegroundColor Gray
    Write-Host "   3. Escolha visibilidade e nome do repositório" -ForegroundColor Gray
    Write-Host "   4. Confirme - a extensão cria o repo e faz push automaticamente" -ForegroundColor Gray
    Write-Host ""
    Write-Host "   Opção 2 - Manual via GitHub Web:" -ForegroundColor Yellow
    Write-Host "   1. Acesse: https://github.com/new" -ForegroundColor Gray
    Write-Host "   2. Crie um repositório (NÃO adicione README, .gitignore, license)" -ForegroundColor Gray
    Write-Host "   3. Depois execute:" -ForegroundColor Gray
    Write-Host "      git remote add origin https://github.com/SEU_USUARIO/NOME_DO_REPO.git" -ForegroundColor White
    Write-Host "      git push -u origin main" -ForegroundColor White
    Write-Host ""
}

Write-Host ""
Write-Host "✅ Workflow local concluído!" -ForegroundColor Green
Write-Host "   Repositório Git inicializado e commit criado." -ForegroundColor Gray
Write-Host "   Pronto para fazer upload para GitHub." -ForegroundColor Gray
Write-Host ""

