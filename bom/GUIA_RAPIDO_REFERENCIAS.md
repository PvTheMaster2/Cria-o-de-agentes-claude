# 🎯 Guia Rápido: Como Referenciar Documentos no Claude Code

## 📋 TL;DR - Resposta Rápida

**Para copiar para outros projetos:**
```powershell
# Use o script automatizado
.\copy-to-new-project.ps1 -TargetPath "C:\caminho\do\projeto" -ProjectName "Meu App"
```

**Para referenciar documentos:**
```
> Leia agents.md
> Analise src/App.tsx
> @package.json mostre as dependências
```

---

## 1️⃣ O QUE COPIAR PARA NOVOS PROJETOS

### 📦 Checklist de Cópia

- [x] `.claude/` (pasta completa)
- [x] `agents.md` (arquivo raiz)
- [x] `.claudeignore` (arquivo raiz)
- [ ] Personalizar `agents.md` com info do projeto
- [ ] Criar subagentes específicos em `.claude/agents/`

### 🚀 Método Rápido

```powershell
# Opção 1: Usar script automatizado (RECOMENDADO)
.\copy-to-new-project.ps1 -TargetPath "C:\meus-projetos\novo-app"

# Opção 2: Cópia manual
cd "C:\meus-projetos\novo-app"
Copy-Item "C:\Users\pedro\OneDrive\Área de Trabalho\Claude Code\.claude" -Recurse -Destination "."
Copy-Item "C:\Users\pedro\OneDrive\Área de Trabalho\Claude Code\agents.md" -Destination "."
Copy-Item "C:\Users\pedro\OneDrive\Área de Trabalho\Claude Code\.claudeignore" -Destination "."
```

---

## 2️⃣ ARQUIVOS QUE O CLAUDE CODE LÊ AUTOMATICAMENTE

### 🔄 Lidos no Início da Sessão

| Arquivo | Quando é Lido | Obrigatório? |
|---------|---------------|--------------|
| `agents.md` | Sempre ao iniciar ou executar `/init` | ⭐ SIM |
| `.claude.md` | Se `agents.md` não existir | Alternativa |
| `.claude/settings.json` | Sempre ao iniciar | Recomendado |
| `.claudeignore` | Em todas as operações de arquivo | Recomendado |

### 📖 Como Funciona

```
1. Você inicia: claude
2. Claude Code automaticamente lê:
   ✅ agents.md (contexto do projeto)
   ✅ .claude/settings.json (configurações)
   ✅ .claudeignore (arquivos a ignorar)
3. Contexto pronto para uso!
```

---

## 3️⃣ COMO REFERENCIAR DOCUMENTOS

### 📌 5 Métodos Principais

#### Método 1: Menção Direta (Mais Natural)
```
> Leia o arquivo package.json

> Analise src/components/Header.tsx

> Mostre o conteúdo de README.md

> O que tem no arquivo de configuração?
```
**Quando usar**: Sempre que possível (mais natural)

---

#### Método 2: Símbolo @ (Referência Explícita)
```
> @package.json liste as dependências

> @src/App.tsx explique este componente

> @tsconfig.json mostre as configurações
```
**Quando usar**: Quando quer ser muito explícito sobre qual arquivo

---

#### Método 3: Caminho Relativo
```
> Leia ./src/utils/helpers.ts

> Analise ./tests/unit/auth.test.ts

> Revise ./config/database.js
```
**Quando usar**: Quando há arquivos com nomes similares em pastas diferentes

---

#### Método 4: Caminho Absoluto
```
> Leia C:\Users\pedro\projeto\src\index.ts

> Analise C:\workspace\app\config.json
```
**Quando usar**: Para arquivos fora do projeto ou quando quer máxima precisão

---

#### Método 5: Padrões Glob (Múltiplos Arquivos)
```
> Analise todos os arquivos em src/components/*.tsx

> Revise os testes em **/*.test.ts

> Liste arquivos TypeScript em src/**/*.ts
```
**Quando usar**: Para trabalhar com múltiplos arquivos de uma vez

---

## 4️⃣ EXEMPLOS PRÁTICOS POR CENÁRIO

### 🔍 Cenário 1: Analisar Estrutura do Projeto

```
> Liste todos os arquivos principais do projeto

> Qual é a estrutura de pastas em src/?

> Mostre todos os componentes React
```

**Claude Code irá:**
- Ler estrutura de diretórios
- Listar arquivos relevantes
- Mostrar organização

---

### 🔍 Cenário 2: Entender Código Existente

```
> Como funciona a autenticação neste projeto?

> Explique o fluxo de dados no componente Dashboard

> Onde está definida a conexão com banco de dados?
```

**Claude Code irá:**
- Buscar arquivos relacionados (auth.ts, login.tsx, etc.)
- Ler e analisar o código
- Explicar o funcionamento

---

### 🔍 Cenário 3: Trabalhar com Arquivo Específico

```
> Leia src/services/UserService.ts e crie testes para ele

> Analise src/App.tsx e sugira melhorias

> Refatore src/utils/validation.ts
```

**Claude Code irá:**
- Ler o arquivo específico
- Executar a tarefa solicitada
- Criar/modificar arquivos conforme necessário

---

### 🔍 Cenário 4: Trabalhar com Múltiplos Arquivos

```
> Revise todos os arquivos em src/components/

> Crie testes para todos os serviços em src/services/

> Analise complexidade de todos os arquivos TypeScript
```

**Claude Code irá:**
- Processar múltiplos arquivos
- Gerar relatório consolidado
- Aplicar ação em todos

---

### 🔍 Cenário 5: Documentação e Configuração

```
> Leia package.json e me diga quais dependências estão desatualizadas

> Analise tsconfig.json e sugira melhorias

> Revise README.md e atualize com novas features
```

**Claude Code irá:**
- Ler arquivos de configuração
- Analisar conteúdo
- Sugerir ou fazer modificações

---

## 5️⃣ COMANDOS ESPECIAIS DE CONTEXTO

### 📂 Comandos de Navegação

```bash
/init           # Reindexar projeto e ler agents.md
/compact        # Compactar histórico (liberar contexto)
/clear          # Limpar contexto (manter agents.md)
/resume <id>    # Retomar sessão anterior
/history        # Ver histórico de sessões
```

### 🎯 Quando Usar Cada Comando

| Comando | Quando Usar |
|---------|-------------|
| `/init` | Primeira vez no projeto ou após mudanças grandes |
| `/compact` | Conversa longa, contexto ficando cheio |
| `/clear` | Recomeçar do zero mas manter contexto do projeto |
| `/resume` | Continuar trabalho de sessão anterior |

---

## 6️⃣ O QUE O CLAUDE CODE "VÊ"

### ✅ Tem Acesso A:

- ✅ Todos os arquivos no diretório do projeto
- ✅ Subdiretórios (recursivamente)
- ✅ Arquivos de configuração (.json, .yaml, .toml)
- ✅ Código-fonte (.ts, .js, .tsx, .py, etc.)
- ✅ Documentação (.md, .txt)
- ✅ Arquivos ocultos (começando com .)

### ❌ NÃO Tem Acesso A:

- ❌ Arquivos fora do diretório do projeto
- ❌ Arquivos listados em `.claudeignore`
- ❌ Arquivos binários grandes (são ignorados por padrão)
- ❌ Sistema de arquivos do usuário (por segurança)

### 🔍 Como Saber o Que Está Sendo Ignorado

```
> Mostre o conteúdo de .claudeignore

> O que está sendo ignorado neste projeto?
```

---

## 7️⃣ TROUBLESHOOTING

### ❓ "Claude Code não encontrou o arquivo X"

**Possíveis Causas e Soluções:**

1. **Arquivo está no .claudeignore**
   ```
   > Mostre .claudeignore
   # Remova o padrão que está bloqueando
   ```

2. **Caminho incorreto**
   ```
   # Use caminho relativo à raiz do projeto
   > Leia ./src/App.tsx

   # Ou caminho absoluto
   > Leia C:\projeto\src\App.tsx
   ```

3. **Arquivo realmente não existe**
   ```
   > Liste arquivos em src/
   # Confirmar que arquivo existe
   ```

4. **Projeto não foi indexado**
   ```
   /init
   # Reindexar projeto
   ```

---

### ❓ "Claude Code está lendo arquivos errados"

**Solução:**
```
> Leia especificamente ./src/components/Header.tsx
# Seja mais específico no caminho

> @src/components/Header.tsx analise este arquivo
# Use @ para referência explícita
```

---

### ❓ "Contexto ficou muito grande"

**Solução:**
```bash
/compact        # Compactar histórico
/clear          # Limpar e recomeçar
```

---

## 8️⃣ MELHORES PRÁTICAS

### ✅ DO's (Faça)

```
✅ Seja específico nos caminhos
   > Leia src/services/UserService.ts

✅ Use /init ao começar
   /init

✅ Mantenha .claudeignore atualizado
   # Adicione pastas grandes ao .claudeignore

✅ Use agents.md para contexto permanente
   # Documente decisões importantes lá

✅ Use comandos customizados para tarefas repetitivas
   /analyze
   /test-gen
```

### ❌ DON'Ts (Evite)

```
❌ Referenciar arquivos ambiguamente
   > Leia o arquivo de config
   # Qual? Há vários!

❌ Ignorar .claudeignore
   # Isso deixa o contexto poluído

❌ Não usar /init em projetos novos
   # Claude Code não terá contexto adequado

❌ Manter histórico muito grande
   # Use /compact regularmente
```

---

## 9️⃣ SCRIPTS ÚTEIS

### 📝 Script: Copiar Setup para Novo Projeto

**Criado**: `copy-to-new-project.ps1`

**Uso:**
```powershell
# Básico
.\copy-to-new-project.ps1 -TargetPath "C:\projetos\novo-app"

# Com personalização
.\copy-to-new-project.ps1 `
  -TargetPath "C:\projetos\novo-app" `
  -ProjectName "Meu Super App" `
  -TechStack "React 18, Next.js 14, TypeScript"
```

**O que faz:**
1. ✅ Copia `.claude/` completo
2. ✅ Copia `.claudeignore`
3. ✅ Cria `agents.md` personalizado
4. ✅ Mostra próximos passos

---

## 🎓 RESUMO FINAL

### Para Novos Projetos:
```powershell
# 1. Copiar estrutura
.\copy-to-new-project.ps1 -TargetPath "C:\projeto"

# 2. Navegar até projeto
cd "C:\projeto"

# 3. Personalizar agents.md
notepad agents.md

# 4. Iniciar Claude Code
claude

# 5. Indexar projeto
/init
```

### Para Referenciar Documentos:
```
# Método simples (use sempre que possível)
> Leia package.json
> Analise src/App.tsx

# Método explícito (quando houver ambiguidade)
> @src/components/Header.tsx analise este arquivo

# Múltiplos arquivos
> Revise todos os arquivos em src/components/
```

### Comandos Essenciais:
```bash
/init          # Inicializar/reindexar
/compact       # Compactar contexto
/analyze       # Analisar código
/test-gen      # Gerar testes
/review-pr     # Revisar PR
```

---

## 📚 Referências

- **Setup Completo**: `SETUP_REPORT.md`
- **Documentação Estrutura**: `.claude/README.md`
- **Contexto Projeto**: `agents.md`
- **Guia Completo**: `2.md`

---

**Última Atualização**: 2025-01-29
**Versão**: 1.0
