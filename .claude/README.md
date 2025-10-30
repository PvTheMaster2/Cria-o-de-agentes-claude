# 📁 Diretório .claude/

Este diretório contém configurações locais do Claude Code para este projeto.

## 📂 Estrutura

```
.claude/
├── settings.json          # Configurações principais do projeto
├── agents/                # Subagentes especializados do projeto
├── commands/              # Comandos customizados (slash commands)
│   ├── analyze.md         # /analyze - Análise profunda de código
│   ├── test-gen.md        # /test-gen - Gerador de testes
│   └── review-pr.md       # /review-pr - Revisor de Pull Requests
├── hooks/                 # Scripts de automação
│   ├── notify.ps1         # Notificação ao completar tarefas
│   ├── typecheck.ps1      # Verificação TypeScript automática
│   └── security-check.ps1 # Verificação de segurança
└── README.md              # Este arquivo
```

## ⚙️ settings.json

Configurações principais do projeto:

- **model**: `claude-sonnet-4` (modelo padrão, rápido e econômico)
- **diffView**: `auto` (visualização de diffs automática)
- **autoUpdate**: `false` (evita surpresas com versões instáveis)
- **hooks**: Automações configuradas
  - `on-stop`: Notificação sonora ao completar tarefa

### Ativar Hooks Adicionais

Para ativar hooks adicionais, edite `settings.json`:

#### Type Check Automático (TypeScript)
```json
{
  "hooks": {
    "post-tool-use": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "powershell -File .claude/hooks/typecheck.ps1"
          }
        ]
      }
    ]
  }
}
```

#### Security Check Automático
```json
{
  "hooks": {
    "post-tool-use": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "powershell -File .claude/hooks/security-check.ps1"
          }
        ]
      }
    ]
  }
}
```

## 🛠️ Comandos Customizados

### /analyze
Executa análise profunda do arquivo atual:
- Análise de complexidade
- Qualidade de código
- Problemas de performance
- Vulnerabilidades de segurança
- Melhores práticas

**Uso:**
```
/analyze
```

### /test-gen
Gera testes unitários abrangentes para o arquivo atual:
- Testes para todas as funções públicas
- Cobertura de edge cases
- Mocks de dependências externas
- Padrão AAA (Arrange, Act, Assert)

**Uso:**
```
/test-gen
```

### /review-pr
Processo completo de revisão de Pull Request:
- Análise de código
- Testes manuais
- Verificação de segurança
- Relatório estruturado

**Uso:**
```
/review-pr [NÚMERO_DO_PR]
```

## 🔔 Hooks

### notify.ps1
Emite notificação sonora e visual ao completar tarefas.
- **Trigger**: `on-stop` (quando tarefa é concluída)
- **Status**: ✅ ATIVO (configurado em settings.json)

### typecheck.ps1
Executa verificação TypeScript após editar arquivos.
- **Trigger**: `post-tool-use` (após Write/Edit)
- **Status**: ⏸️ DESATIVADO (ativar manualmente se necessário)
- **Requisito**: Projeto com `tsconfig.json`

### security-check.ps1
Verifica secrets hardcoded e vulnerabilidades básicas.
- **Trigger**: `post-tool-use` (após Write/Edit)
- **Status**: ⏸️ DESATIVADO (ativar manualmente se necessário)
- **Verifica**:
  - API keys hardcoded
  - Passwords em código
  - Tokens expostos
  - .env no .gitignore

## 📝 Agentes (Subagentes)

Pasta para subagentes especializados do projeto.

**Como criar um novo subagente:**
1. No Claude Code, executar: `/agents new`
2. Escolher "Project Agent"
3. Preencher informações
4. Arquivo será criado em `.claude/agents/`

**Exemplo de uso:**
```
@NomeDoAgente implementar feature X
```

## 🎯 Próximos Passos

### Configuração Inicial
1. ✅ Estrutura criada
2. ✅ Comandos básicos configurados
3. ✅ Hook de notificação ativo
4. 📝 **Pendente**: Personalizar `agents.md` na raiz com detalhes do projeto
5. 📝 **Pendente**: Ativar hooks adicionais conforme necessidade

### Uso Diário
1. Iniciar Claude Code: `claude`
2. Executar: `/init` (primeira vez)
3. Usar comandos: `/analyze`, `/test-gen`, `/review-pr`
4. Criar subagentes conforme necessário

### Customização
- Editar comandos em `.claude/commands/` para adaptar ao workflow
- Criar novos hooks em `.claude/hooks/`
- Adicionar subagentes em `.claude/agents/`

## 📚 Recursos

- [Documentação Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview)
- [Padrão agents.md](https://agents.md.def)
- [Guia completo](../2.md) - Guia definitivo com todas as práticas

## ⚠️ Importante

- **NÃO** commitar secrets ou API keys
- **SEMPRE** testar após refatorações
- **USAR** Plan Mode para features complexas (`Shift + Tab` no Cursor)
- **EXECUTAR** `/init` ao abrir projeto pela primeira vez
