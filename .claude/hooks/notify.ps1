# Hook de Notificação - Executa ao completar tarefas
# Uso: Configurado em .claude/settings.json no hook "on-stop"

# Emitir beep sonoro (800Hz por 300ms)
[console]::beep(800, 300)

# Mensagem visual
Write-Host ""
Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  ✅ Tarefa Claude Code Concluída!  " -ForegroundColor Green
Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Opcional: Mostrar timestamp
$timestamp = Get-Date -Format "HH:mm:ss"
Write-Host "  Finalizado em: $timestamp" -ForegroundColor Gray
Write-Host ""

# Exit com código 0 (sucesso)
exit 0
