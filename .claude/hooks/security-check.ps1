# Hook de Segurança - Verifica secrets e vulnerabilidades
# Uso: Configurado em .claude/settings.json no hook "post-tool-use"

Write-Host ""
Write-Host "🔒 Executando security check..." -ForegroundColor Yellow

$foundIssues = $false

# Padrões perigosos para procurar
$dangerousPatterns = @(
    @{Pattern = 'API_KEY\s*=\s*[''"](?!.*\$\{)[\w-]+[''"]'; Name = 'Hardcoded API Key'},
    @{Pattern = 'PASSWORD\s*=\s*[''"](?!.*\$\{)[\w-]+[''"]'; Name = 'Hardcoded Password'},
    @{Pattern = 'SECRET\s*=\s*[''"](?!.*\$\{)[\w-]+[''"]'; Name = 'Hardcoded Secret'},
    @{Pattern = 'sk-[a-zA-Z0-9]{32,}'; Name = 'OpenAI/Anthropic API Key'},
    @{Pattern = 'ghp_[a-zA-Z0-9]{36,}'; Name = 'GitHub Personal Access Token'},
    @{Pattern = 'Bearer [a-zA-Z0-9\-_\.]{20,}'; Name = 'Bearer Token'}
)

# Procurar em arquivos comuns (ignorar node_modules, dist, etc)
$filesToCheck = Get-ChildItem -Path . -Recurse -File -Include *.ts,*.js,*.tsx,*.jsx,*.env.example,*.config.js,*.json |
    Where-Object { $_.FullName -notmatch 'node_modules|dist|build|\.git|\.next' } |
    Select-Object -First 100  # Limitar para performance

foreach ($file in $filesToCheck) {
    $content = Get-Content -Path $file.FullName -Raw -ErrorAction SilentlyContinue

    if ($content) {
        foreach ($pattern in $dangerousPatterns) {
            if ($content -match $pattern.Pattern) {
                Write-Host "❌ AVISO: $($pattern.Name) encontrado em:" -ForegroundColor Red
                Write-Host "   $($file.FullName)" -ForegroundColor Yellow
                $foundIssues = $true
            }
        }
    }
}

# Verificar se arquivo .env está no .gitignore
if (Test-Path ".gitignore") {
    $gitignore = Get-Content ".gitignore" -Raw
    if ($gitignore -notmatch '\.env') {
        Write-Host "⚠️  AVISO: .env não está no .gitignore" -ForegroundColor Yellow
        $foundIssues = $true
    }
}

if ($foundIssues) {
    Write-Host ""
    Write-Host "🔒 Security check encontrou possíveis problemas!" -ForegroundColor Red
    Write-Host "   Revise os avisos acima antes de commitar." -ForegroundColor Yellow

    # Exit 1 = warning (não bloqueia, mas alerta)
    exit 1
} else {
    Write-Host "✅ Security check passou!" -ForegroundColor Green
    exit 0
}
