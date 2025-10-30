# Script para Copiar Setup do Claude Code para Novo Projeto
# Uso: .\copy-to-new-project.ps1 -TargetPath "C:\caminho\do\novo\projeto"

param(
    [Parameter(Mandatory=$true)]
    [string]$TargetPath,

    [Parameter(Mandatory=$false)]
    [string]$ProjectName = "Novo Projeto",

    [Parameter(Mandatory=$false)]
    [string]$TechStack = "Adicione sua tech stack aqui"
)

Write-Host "════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  📦 Claude Code - Setup para Novo Projeto" -ForegroundColor Green
Write-Host "════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Verificar se diretório alvo existe
if (-not (Test-Path $TargetPath)) {
    Write-Host "❌ Diretório não encontrado: $TargetPath" -ForegroundColor Red
    Write-Host "   Criando diretório..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Force -Path $TargetPath | Out-Null
}

# Diretório template (este projeto)
$TemplatePath = $PSScriptRoot

Write-Host "📁 Origem: $TemplatePath" -ForegroundColor Gray
Write-Host "📁 Destino: $TargetPath" -ForegroundColor Gray
Write-Host ""

# Copiar estrutura .claude/
Write-Host "📋 Copiando estrutura .claude/..." -ForegroundColor Yellow
if (Test-Path "$TemplatePath\.claude") {
    Copy-Item -Path "$TemplatePath\.claude" -Destination $TargetPath -Recurse -Force
    Write-Host "   ✅ .claude/ copiado" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  .claude/ não encontrado no template" -ForegroundColor Yellow
}

# Copiar .claudeignore
Write-Host "📋 Copiando .claudeignore..." -ForegroundColor Yellow
if (Test-Path "$TemplatePath\.claudeignore") {
    Copy-Item -Path "$TemplatePath\.claudeignore" -Destination $TargetPath -Force
    Write-Host "   ✅ .claudeignore copiado" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  .claudeignore não encontrado no template" -ForegroundColor Yellow
}

# Copiar e personalizar agents.md
Write-Host "📋 Criando agents.md personalizado..." -ForegroundColor Yellow
$agentsMdContent = @"
# Project Overview
$ProjectName - [Adicione descrição detalhada do projeto aqui]

## Tech Stack
$TechStack

## Environment Setup
1. Install dependencies: ``npm install`` (ou yarn/pnpm)
2. Copy environment: ``cp .env.example .env``
3. Run development server: ``npm run dev``

## Build & Test Commands
``````bash
# Build
npm run build

# Test - ALWAYS run after making changes
npm test

# Lint
npm run lint
``````

## Development Workflow
IMPORTANT: Before implementing ANY new feature:
1. Create a detailed plan in Plan Mode (Shift + Tab)
2. Get approval from user
3. Implement in phases
4. Test each phase before proceeding

## Code Style Guidelines
- Use TypeScript strict mode
- Follow project's ESLint rules
- Max line length: 100 characters
- Document complex functions
- Keep functions small and focused (< 50 lines)

## CRITICAL CONSTRAINTS
You MUST ONLY modify files in:
- /src
- /components
- /lib
- [Adicione outros diretórios relevantes]

You MUST NEVER modify:
- /node_modules
- /.git
- /build
- /dist

## SECURITY RULES - CRITICAL
❌ NEVER commit:
- API keys
- Database passwords
- JWT secrets
- OAuth tokens
- Private keys

✅ ALWAYS use:
- Environment variables (.env)
- Secret management services
- .gitignore for sensitive files

## Commit Message Format
Follow Conventional Commits:
- ``feat:`` new feature
- ``fix:`` bug fix
- ``docs:`` documentation
- ``refactor:`` code restructure
- ``test:`` adding tests

## Notes
- Model: Claude Sonnet 4 (default - fast and economical)
- Use /init on first run
- Use /compact when context gets large
- Use Plan Mode for complex features
"@

$agentsMdContent | Out-File -FilePath "$TargetPath\agents.md" -Encoding UTF8 -Force
Write-Host "   ✅ agents.md criado e personalizado" -ForegroundColor Green

Write-Host ""
Write-Host "════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  ✅ Setup Concluído!" -ForegroundColor Green
Write-Host "════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "📝 PRÓXIMOS PASSOS:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Navegue até o projeto:" -ForegroundColor White
Write-Host "   cd `"$TargetPath`"" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Edite agents.md com informações específicas:" -ForegroundColor White
Write-Host "   notepad agents.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. Inicie Claude Code:" -ForegroundColor White
Write-Host "   claude" -ForegroundColor Cyan
Write-Host ""
Write-Host "4. Execute /init dentro do Claude Code" -ForegroundColor White
Write-Host ""
Write-Host "════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "✅ Arquivos copiados para: $TargetPath" -ForegroundColor Green
Write-Host ""
