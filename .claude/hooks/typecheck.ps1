# Hook de Type Check - Executa verificação TypeScript após editar arquivos
# Uso: Configurado em .claude/settings.json no hook "post-tool-use"

param(
    [Parameter(Mandatory=$false)]
    [string]$FilePath = ""
)

Write-Host ""
Write-Host "🔍 Executando type check..." -ForegroundColor Yellow

# Verificar se o projeto usa TypeScript
if (Test-Path "tsconfig.json") {
    # Executar tsc --noEmit para verificar tipos sem gerar arquivos
    $result = & npx tsc --noEmit 2>&1

    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Type check passou!" -ForegroundColor Green
        exit 0
    } else {
        Write-Host "❌ Erros de tipo encontrados:" -ForegroundColor Red
        Write-Host $result -ForegroundColor Red

        # Exit code 2 = bloqueio (previne a operação)
        # Exit code 1 = aviso (permite a operação mas mostra erro)
        # Exit code 0 = sucesso

        # Usar exit 1 para mostrar aviso mas não bloquear
        exit 1
    }
} else {
    Write-Host "⚠️  tsconfig.json não encontrado, pulando type check" -ForegroundColor Yellow
    exit 0
}
