# 🚀 Prompt para Implementação Completa do Claude Code

> **Instruções:** Copie e cole este prompt no terminal após executar `claude`

---

## 📋 PROMPT PRINCIPAL

```
Leia o arquivo 2.md completamente e com atenção. Este arquivo contém um guia completo sobre melhores práticas do Claude Code em 2025.

Após ler, me forneça:

## PARTE 1: IMPLEMENTAÇÃO GLOBAL (Setup no PC)

Crie um passo a passo detalhado e executável para configurar o Claude Code no meu computador Windows. O plano deve incluir:

1. **Instalação e Autenticação:**
   - Como verificar se já está instalado
   - Como instalar/atualizar se necessário
   - Como configurar autenticação
   - Como verificar se está funcionando

2. **Configurações Globais Recomendadas:**
   - Configurar arquivos globais em ~/.claude/
   - Configurar settings.json global
   - Configurar subagentes pessoais (Personal Agents)
   - Configurações de segurança global

3. **Instalação de Ferramentas Complementares:**
   - cc-undo (se recomendado)
   - Outras ferramentas úteis mencionadas no guia

4. **Estrutura de Diretórios Global:**
   - Onde criar arquivos de configuração global
   - Estrutura recomendada para múltiplos projetos

## PARTE 2: IMPLEMENTAÇÃO POR PROJETO

Depois, me forneça um checklist executável do que implementar em CADA projeto novo ou existente, incluindo:

1. **Configuração Inicial do Projeto:**
   - Passos com comandos exatos a executar
   - Arquivos a criar (agents.md, .claude.md, etc.)
   - Como escolher entre agents.md e .claude.md

2. **Estrutura de Arquivos Recomendada:**
   - Onde colocar cada tipo de arquivo
   - Estrutura de pastas (.claude/, .cloud/, etc.)
   - Exemplos de conteúdo para cada arquivo

3. **Hooks e Automação:**
   - Quais hooks configurar primeiro (prioridade)
   - Scripts prontos para copiar
   - Como configurar step-by-step

4. **Comandos Customizados:**
   - Quais comandos criar primeiro
   - Exemplos completos prontos para usar

5. **Subagentes do Projeto:**
   - Quais subagentes criar primeiro
   - Exemplos de configuração

6. **Integrações (MCPs):**
   - Quais integrações são mais úteis
   - Como configurar

## FORMATO DE SAÍDA

Organize a resposta em duas seções claras:

### SEÇÃO A: Setup Global (Uma Vez no PC)
- [ ] Passo 1: [comando exato]
- [ ] Passo 2: [comando exato]
- [ ] ...

### SEÇÃO B: Setup por Projeto (Repetir em Cada Projeto)
- [ ] Passo 1: [comando exato + arquivo a criar]
- [ ] Passo 2: [conteúdo do arquivo]
- [ ] ...

Importante:
- Use comandos específicos para Windows PowerShell
- Forneça código completo pronto para copiar
- Indique claramente o que é opcional vs obrigatório
- Priorize as práticas mais importantes primeiro

Responda de forma estruturada e executável.
```

---

## 🎯 COMO USAR

### Passo 1: Abrir Claude Code no Terminal

```powershell
# No PowerShell, navegue até o diretório onde está o arquivo 2.md
cd "C:\Users\pedro\OneDrive\Área de Trabalho\Claude Code"

# Inicie o Claude Code
claude
```

### Passo 2: Copiar e Colar o Prompt

Após o Claude Code iniciar, cole o prompt acima completo.

### Passo 3: Seguir o Plano

O Claude Code vai:
1. Ler o arquivo `2.md`
2. Gerar um plano de implementação global
3. Gerar um checklist para cada projeto
4. Fornecer código pronto para usar

---

## 📝 VERSÃO ALTERNATIVA (Mais Direta)

Se preferir uma versão mais curta:

```
Leia o arquivo 2.md. 

Depois, crie dois planos de implementação:

1. **Setup Global (PC Windows):** Passo a passo com comandos PowerShell para configurar Claude Code uma vez no meu computador.

2. **Setup por Projeto:** Checklist executável do que configurar em cada projeto (agents.md, hooks, comandos, etc.) com código pronto para copiar.

Use comandos específicos para Windows e forneça código completo executável.
```

---

## 💡 DICAS

- Se o Claude Code não encontrar o arquivo `2.md`, use o caminho completo: `@C:\Users\pedro\OneDrive\Área de Trabalho\Claude Code\2.md`
- Pode usar o modo Plan Mode (`Shift + Tab`) para gerar o plano primeiro antes de executar
- Salve o resultado em um arquivo para referência futura

---

**Versão:** 1.0  
**Data:** Janeiro 2025

