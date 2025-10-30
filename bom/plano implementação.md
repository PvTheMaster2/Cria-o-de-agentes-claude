 📋 PLANO DE IMPLEMENTAÇÃO: CLAUDE CODE 2025

  ---
  SEÇÃO A: SETUP GLOBAL (Uma Vez no PC Windows)

  🎯 FASE 1: Instalação e Autenticação

  Passo 1: Verificar se já está instalado

  # Verificar instalação existente
  claude --version

  Passo 2: Instalar/Atualizar Claude Code

  # Instalar globalmente via npm
  npm install -g @anthropic-ai/claude-code

  # OU atualizar se já estiver instalado
  npm update -g @anthropic-ai/claude-code

  Passo 3: Configurar Autenticação

  # Opção 1: Login via navegador (Recomendado)
  claude  # Abrirá navegador para autenticação

  # Opção 2: API Key (Persistente no PowerShell
  Profile)
  # Abrir perfil do PowerShell
  notepad $PROFILE

  # Adicionar no arquivo (substitua pela sua chave):     
  $env:ANTHROPIC_API_KEY="sk-ant-..."

  Passo 4: Verificar Funcionamento

  # Testar comando básico
  claude

  # Dentro do Claude, executar:
  # /help

  ---
  🎯 FASE 2: Estrutura de Diretórios Global

  Passo 5: Criar estrutura global

  # Criar diretório principal de configuração
  New-Item -ItemType Directory -Force -Path
  "$HOME\.claude"
  New-Item -ItemType Directory -Force -Path
  "$HOME\.claude\agents"
  New-Item -ItemType Directory -Force -Path
  "$HOME\.claude\commands"
  New-Item -ItemType Directory -Force -Path
  "$HOME\.claude\hooks"

  # Verificar criação
  Get-ChildItem "$HOME\.claude"

  ---
  🎯 FASE 3: Configurações Globais Recomendadas

  Passo 6: Criar settings.json global

  # Criar arquivo de configurações globais
  $settingsContent = @"
  {
    "diffView": "auto",
    "autoUpdate": false,
    "model": "claude-sonnet-4",
    "hooks": {},
    "customCommands": {}
  }
  "@

  $settingsContent | Out-File -FilePath
  "$HOME\.claude\settings.json" -Encoding UTF8

  Passo 7: Criar .claudeignore global (template)

  $claudeignoreContent = @"
  # Dependencies
  node_modules/
  vendor/

  # Build outputs
  dist/
  build/
  .next/
  out/

  # Logs
  *.log
  logs/

  # Lock files
  package-lock.json
  yarn.lock
  pnpm-lock.yaml

  # OS files
  .DS_Store
  Thumbs.db

  # IDE
  .vscode/
  .idea/

  # Large assets
  *.mp4
  *.mov
  *.zip
  *.tar.gz
  "@

  $claudeignoreContent | Out-File -FilePath
  "$HOME\.claude\.claudeignore.template" -Encoding       
  UTF8

  ---
  🎯 FASE 4: Personal Agents (Agentes Globais)

  Passo 8: Criar Personal Agent - Code Analyzer

  $codeAnalyzerAgent = @"
  # Agent Name
  Code Analyzer

  # Description
  Expert in analyzing code quality, complexity, and      
  potential issues.
  Automatically invoked when user asks for code
  analysis or review.

  # System Prompt
  You are a code analysis specialist. Your role:
  1. Analyze code complexity (cyclomatic complexity,     
  nesting depth)
  2. Identify code smells and anti-patterns
  3. Suggest refactoring opportunities
  4. Check for security vulnerabilities
  5. Evaluate performance concerns

  ## Workflow
  1. Read the specified files
  2. Analyze complexity metrics
  3. Identify issues by category (Quality, Security,     
  Performance)
  4. Provide actionable recommendations with examples    
  5. Prioritize issues (Critical → Low)

  ## Constraints
  - NEVER modify code, only analyze
  - Always provide specific line numbers
  - Include code examples in recommendations

  # Tools Allowed
  [x] readFile
  [ ] writeFile
  [x] runCommand (for metrics tools)
  [ ] deleteFile
  "@

  $codeAnalyzerAgent | Out-File -FilePath
  "$HOME\.claude\agents\code-analyzer.md" -Encoding      
  UTF8

  Passo 9: Criar Personal Agent - Test Writer

  $testWriterAgent = @"
  # Agent Name
  Test Writer

  # Description
  Specialized in creating comprehensive unit and
  integration tests.
  Automatically invoked when user asks to generate       
  tests.

  # System Prompt
  You are a test generation specialist. Your role:       
  1. Create comprehensive unit tests
  2. Follow AAA pattern (Arrange, Act, Assert)
  3. Cover edge cases and error scenarios
  4. Use Jest/Vitest framework conventions
  5. Mock external dependencies properly

  ## Workflow
  1. Read source file to understand functionality        
  2. Identify all public functions/methods
  3. Create test file with appropriate naming
  4. Generate tests covering happy path, edge cases,     
  and errors
  5. Ensure tests are isolated and don't share state     

  ## Test Quality Standards
  - Descriptive test names (describe what is being       
  tested)
  - 100% coverage of public API
  - Edge cases: null, undefined, empty, boundary
  values
  - Proper mocking of external dependencies
  - No testing of implementation details

  # Tools Allowed
  [x] readFile
  [x] writeFile
  [x] runCommand (to run tests)
  [ ] deleteFile
  "@

  $testWriterAgent | Out-File -FilePath
  "$HOME\.claude\agents\test-writer.md" -Encoding        
  UTF8

  ---
  🎯 FASE 5: Ferramentas Complementares (Opcional)       

  Passo 10: Instalar cc-undo (Versionamento/Undo)        

  # Instalar ferramenta de undo
  npm install -g cc-undo

  # Verificar instalação
  cc-undo --version

  ---
  SEÇÃO B: SETUP POR PROJETO (Repetir em Cada 
  Projeto)

  🎯 FASE 1: Configuração Inicial do Projeto

  ✅ Passo 1: Navegar até o projeto e inicializar        

  # Navegar até o diretório do projeto
  cd "C:\caminho\do\seu\projeto"

  # Iniciar Claude Code
  claude

  # Dentro do Claude, executar:
  /init

  O que o /init faz:
  - ✅ Analisa estrutura do projeto
  - ✅ Identifica dependências e tech stack
  - ✅ Cria contexto inicial

  ---
  ✅ Passo 2: Criar agents.md (Novo padrão da 
  indústria)

  IMPORTANTE: Escolha entre agents.md (novo padrão)      
  ou .claude.md (legado)
  - Recomendado: agents.md (universal, suportado por     
  múltiplas ferramentas)
  - Alternativa: .claude.md (específico do Claude        
  Code)

  # Criar agents.md na raiz do projeto
  $agentsMdContent = @"
  # Project Overview
  [Descreva brevemente o que este projeto faz e suas     
  principais tecnologias]

  ## Tech Stack
  - Frontend: [ex: React 18, Next.js 14]
  - Backend: [ex: Node.js, Express]
  - Database: [ex: PostgreSQL 14]
  - Testing: [ex: Jest, Playwright]

  ## Environment Setup
  1. Install Node.js v18+
  2. Run: ``npm install``
  3. Copy ``.env.example`` to ``.env``
  4. Run: ``npm run dev``

  ## Build & Test Commands

  ### Build
  ``````bash
  npm run build

  Run Tests

  # Run all tests - ALWAYS run after making changes      
  npm test

  # Run specific test suite
  npm test -- path/to/test

  Code Style Guidelines

  - Use TypeScript strict mode
  - Follow ESLint rules in .eslintrc.js
  - Max line length: 100 characters
  - Prefer functional components over class
  components

  Security Considerations

  - Never commit secrets or API keys
  - Sanitize all user inputs
  - Use parameterized queries for database operations    
  - Validate environment variables on startup

  Development Workflow

  IMPORTANT: Before implementing ANY new feature:        
  1. Create a detailed plan in Plan Mode
  2. Get approval from user
  3. Implement in phases
  4. Test each phase before proceeding

  Commit Message Format

  Follow Conventional Commits:
  - feat: new feature
  - fix: bug fix
  - docs: documentation only
  - refactor: code restructure without behavior
  change
  - test: adding tests

  CRITICAL CONSTRAINTS

  You MUST ONLY modify files in:
  - /src
  - /components
  - /lib
  - /pages (if applicable)

  You MUST NEVER modify:
  - /node_modules
  - /.git
  - /build
  - /dist
  - Any test fixtures in /mocks

  SECURITY RULES - CRITICAL

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
  "@

  $agentsMdContent | Out-File -FilePath ".\agents.md"    
   -Encoding UTF8

  ---

  #### ✅ Passo 3: Criar .claudeignore
  ```powershell
  # Copiar template global ou criar novo
  $claudeignoreContent = @"
  # Dependencies
  node_modules/
  vendor/

  # Build outputs
  dist/
  build/
  .next/
  out/

  # Logs
  *.log
  logs/

  # Lock files
  package-lock.json
  yarn.lock
  pnpm-lock.yaml

  # OS files
  .DS_Store
  Thumbs.db

  # IDE
  .vscode/
  .idea/

  # Large assets
  *.mp4
  *.mov
  *.zip
  *.tar.gz

  # Environment files
  .env.local
  .env.development
  .env.production
  "@

  $claudeignoreContent | Out-File -FilePath
  ".\.claudeignore" -Encoding UTF8

  ---
  🎯 FASE 2: Estrutura de Diretórios do Projeto

  ✅ Passo 4: Criar estrutura .claude/

  # Criar diretórios de configuração do projeto
  New-Item -ItemType Directory -Force -Path
  ".\.claude"
  New-Item -ItemType Directory -Force -Path
  ".\.claude\agents"
  New-Item -ItemType Directory -Force -Path
  ".\.claude\commands"
  New-Item -ItemType Directory -Force -Path
  ".\.claude\hooks"

  # Verificar criação
  Get-ChildItem ".\.claude"

  ---
  🎯 FASE 3: Hooks Essenciais (Prioridade Alta)

  ✅ Passo 5: Hook 1 - Notificação Sonora (Windows)      

  # Criar script de notificação sonora
  $beepScript = @"
  # Notificação sonora ao completar tarefa
  [console]::beep(800, 300)
  Write-Host "✅ Tarefa concluída!" -ForegroundColor     
  Green
  "@

  $beepScript | Out-File -FilePath
  ".\.claude\hooks\notify.ps1" -Encoding UTF8

  # Configurar hook no settings.json
  $settingsPath = ".\.claude\settings.json"
  if (Test-Path $settingsPath) {
      $settings = Get-Content $settingsPath |
  ConvertFrom-Json
  } else {
      $settings = @{
          diffView = "auto"
          autoUpdate = $false
          model = "claude-sonnet-4"
          hooks = @{}
          customCommands = @{}
      }
  }

  $settings.hooks = @{
      "on-stop" = @(
          @{
              matcher = "*"
              hooks = @(
                  @{
                      type = "command"
                      command = "powershell -File        
  .\.claude\hooks\notify.ps1"
                  }
              )
          }
      )
  }

  $settings | ConvertTo-Json -Depth 10 | Out-File        
  -FilePath $settingsPath -Encoding UTF8

  ✅ Passo 6: Hook 2 - Auto-formatter (Recomendado       
  para TypeScript/JavaScript)

  # Adicionar hook de formatação automática
  # Assumindo que o projeto tem npm run format
  configurado

  $settings = Get-Content ".\.claude\settings.json" |    
   ConvertFrom-Json

  if (-not $settings.hooks."post-tool-use") {
      $settings.hooks."post-tool-use" = @()
  }

  $settings.hooks."post-tool-use" += @{
      matcher = "Write|Edit"
      hooks = @(
          @{
              type = "command"
              command = "npm run format"
          }
      )
  }

  $settings | ConvertTo-Json -Depth 10 | Out-File        
  -FilePath ".\.claude\settings.json" -Encoding UTF8     

  ---
  🎯 FASE 4: Comandos Customizados Essenciais

  ✅ Passo 7: Comando /analyze - Análise de Código       

  $analyzeCommand = @"
  Execute a deep code analysis of the current file:      

  1. **Complexity Analysis**:
     - Identify functions with cyclomatic complexity     
  > 10
     - Flag deeply nested code (> 4 levels)
     - Detect long functions (> 50 lines)

  2. **Code Quality**:
     - Check for code duplication
     - Identify magic numbers and hard-coded values      
     - Look for missing error handling

  3. **Performance Concerns**:
     - Spot potential performance bottlenecks
     - Identify inefficient algorithms
     - Check for unnecessary re-renders (React)

  4. **Security Issues**:
     - Look for SQL injection vulnerabilities
     - Check for XSS vulnerabilities
     - Identify exposed secrets or API keys

  Provide actionable recommendations with code
  examples.
  "@

  $analyzeCommand | Out-File -FilePath
  ".\.claude\commands\analyze.md" -Encoding UTF8

  ✅ Passo 8: Comando /test-gen - Gerador de Testes      

  $testGenCommand = @"
  Generate comprehensive unit tests for the current      
  file:

  1. **Test Structure**:
     - Use Jest/Vitest framework
     - Follow AAA pattern (Arrange, Act, Assert)
     - One test file per source file

  2. **Coverage Goals**:
     - Test all public functions
     - Include edge cases (empty input, null,
  undefined)
     - Test error scenarios
     - Mock external dependencies

  3. **Test Quality**:
     - Use descriptive test names
     - Keep tests isolated (no shared state)
     - Avoid testing implementation details

  4. **Output**:
     - Create test file with ``.test.ts`` or
  ``.spec.ts`` extension
     - Place in ``__tests__`` directory or alongside     
  source file
  "@

  $testGenCommand | Out-File -FilePath
  ".\.claude\commands\test-gen.md" -Encoding UTF8        

  ✅ Passo 9: Comando /review-pr - Revisão de Pull       
  Request

  $reviewPrCommand = @"
  # PR Review Process

  This PR: #[NUMBER]

  ## Stage 1: Understanding (5 min)
  Execute:
  ``````bash
  gh pr view [NUMBER]
  gh pr diff [NUMBER]

  Questions:
  1. What is the main purpose of this PR?
  2. Which parts of the system are affected?
  3. Are there any breaking changes?

  Stage 2: Checkout & Build (5 min)

  gh pr checkout [NUMBER]
  npm install
  npm run build

  Verify:
  - Build succeeds without errors
  - No new warnings

  Stage 3: Manual Testing (10 min)

  1. Start application
  2. Test new functionality
  3. Test existing functionality (regression)
  4. Check edge cases

  Document findings:
  - What works as expected?
  - What doesn't work?
  - Any unexpected behavior?

  Stage 4: Code Analysis (15 min)

  For EACH changed file:

  Code Quality

  - Is code readable and maintainable?
  - Are there complex functions that should be split?    
  - Is there code duplication?

  Logic & Correctness

  - Does the logic make sense?
  - Are there edge cases not handled?
  - Could this fail in production?

  Performance

  - Are there inefficient operations?
  - Could this cause memory leaks?
  - Are database queries optimized?

  Security

  - Is user input sanitized?
  - Are there SQL injection risks?
  - Are secrets properly managed?

  Testing

  - Are there unit tests?
  - Do tests cover edge cases?
  - Are integration tests needed?

  Final Report

  Summary

  [Brief description of changes]

  Strengths

  - [What was done well]

  Concerns

  1. [Critical issues to fix]
  2. [Important issues to consider]
  3. [Nice-to-have improvements]

  Recommendation

  [ ] ✅ Approve
  [ ] 🔄 Request Changes
  [ ] 💬 Needs Discussion

  Next Steps

  [What should happen next]
  "@

  $reviewPrCommand | Out-File -FilePath
  ".claude\commands\review-pr.md" -Encoding UTF8

  ---

  ### 🎯 FASE 5: Subagentes do Projeto (Opcional, mas    
   Recomendado)

  #### ✅ Passo 10: Criar subagente especializado        
  (Exemplo: ShadCN UI Builder)
  ```powershell
  $shadcnAgent = @"
  # Agent Name
  ShadCN UI Builder

  # Description
  Expert in building modern React UIs using ShadCN       
  components and Next.js.
  Automatically invoked when user asks for UI
  implementation with ShadCN.

  # System Prompt
  You are a specialized UI development agent. Your       
  role:
  1. Build React components using ShadCN UI library      
  2. Follow Next.js 14 app router conventions
  3. Use Tailwind CSS for styling
  4. Ensure accessibility (ARIA labels, keyboard
  navigation)
  5. Create responsive designs (mobile-first)

  ## Workflow
  1. Read design specs from provided file
  2. Install necessary ShadCN components
  3. Create component structure
  4. Implement functionality
  5. Add proper TypeScript types
  6. Write brief usage documentation

  ## Constraints
  - NEVER modify files outside /components or /app       
  directories
  - ALWAYS use TypeScript strict mode
  - MUST include responsive breakpoints

  # Tools Allowed
  [x] readFile
  [x] writeFile
  [x] runCommand
  [ ] webSearch
  [ ] deleteFile
  "@

  $shadcnAgent | Out-File -FilePath
  ".\.claude\agents\shadcn-ui-builder.md" -Encoding      
  UTF8

  ---
  🎯 FASE 6: Verificação Final

  ✅ Passo 11: Checklist de Verificação

  Write-Host "=== CHECKLIST DE VERIFICAÇÃO ==="
  -ForegroundColor Cyan
  Write-Host ""
  Write-Host "Verificando arquivos criados..."
  -ForegroundColor Yellow
  Write-Host ""

  $files = @(
      ".\agents.md",
      ".\.claudeignore",
      ".\.claude\settings.json",
      ".\.claude\commands\analyze.md",
      ".\.claude\commands\test-gen.md",
      ".\.claude\commands\review-pr.md"
  )

  foreach ($file in $files) {
      if (Test-Path $file) {
          Write-Host "✅ $file" -ForegroundColor
  Green
      } else {
          Write-Host "❌ $file (FALTANDO)"
  -ForegroundColor Red
      }
  }

  Write-Host ""
  Write-Host "=== PRÓXIMOS PASSOS ==="
  -ForegroundColor Cyan
  Write-Host "1. Abra o agents.md e personalize com      
  informações do seu projeto"
  Write-Host "2. Execute 'claude' no terminal para       
  iniciar"
  Write-Host "3. Execute '/init' dentro do Claude        
  Code"
  Write-Host "4. Comece a desenvolver!"

  ---
  📊 RESUMO DE PRIORIDADES

  ✅ OBRIGATÓRIO (Setup Mínimo)

  1. Instalar Claude Code
  2. Autenticar
  3. Criar agents.md
  4. Criar .claudeignore
  5. Executar /init

  ⭐ ALTAMENTE RECOMENDADO

  6. Hook de notificação sonora
  7. Comando /analyze
  8. Comando /test-gen
  9. Personal Agent: Code Analyzer
  10. Personal Agent: Test Writer

  🎯 OPCIONAL (Avançado)

  11. Hook de auto-formatter
  12. Comando /review-pr
  13. Subagentes especializados do projeto
  14. Ferramenta cc-undo
  15. Integração com MCPs

  ---
  🚀 SCRIPT DE AUTOMAÇÃO COMPLETO

  Para facilitar, aqui está um script PowerShell         
  completo que executa todos os passos de setup de       
  projeto:

  # Script de Setup Completo do Claude Code
  # Salvar como: setup-claude-project.ps1
  # Executar: .\setup-claude-project.ps1

  param(
      [string]$ProjectName = "Meu Projeto",
      [string]$TechStack = "React, Node.js,
  TypeScript"
  )

  Write-Host "=== SETUP CLAUDE CODE ==="
  -ForegroundColor Cyan
  Write-Host "Projeto: $ProjectName" -ForegroundColor    
   Yellow
  Write-Host "Tech Stack: $TechStack"
  -ForegroundColor Yellow
  Write-Host ""

  # Criar estrutura de diretórios
  Write-Host "📁 Criando estrutura de diretórios..."     
  -ForegroundColor Green
  New-Item -ItemType Directory -Force -Path
  ".\.claude" | Out-Null
  New-Item -ItemType Directory -Force -Path
  ".\.claude\agents" | Out-Null
  New-Item -ItemType Directory -Force -Path
  ".\.claude\commands" | Out-Null
  New-Item -ItemType Directory -Force -Path
  ".\.claude\hooks" | Out-Null

  # Criar agents.md
  Write-Host "📝 Criando agents.md..."
  -ForegroundColor Green
  $agentsMd = @"
  # Project Overview
  $ProjectName - [Adicione descrição detalhada aqui]     

  ## Tech Stack
  $TechStack

  ## Environment Setup
  1. Install dependencies: ``npm install``
  2. Copy environment: ``cp .env.example .env``
  3. Run development server: ``npm run dev``

  ## Build & Test Commands
  ``````bash
  # Build
  npm run build

  # Test - ALWAYS run after making changes
  npm test

  Development Workflow

  IMPORTANT: Before implementing ANY new feature:        
  1. Create a detailed plan in Plan Mode
  2. Get approval from user
  3. Implement in phases
  4. Test each phase before proceeding

  CRITICAL CONSTRAINTS

  You MUST ONLY modify files in:
  - /src
  - /components
  - /lib

  You MUST NEVER modify:
  - /node_modules
  - /.git
  - /build
  - /dist

  SECURITY RULES - CRITICAL

  ❌ NEVER commit API keys, passwords, or secrets        
  ✅ ALWAYS use environment variables (.env)
  "@
  $agentsMd | Out-File -FilePath ".\agents.md"
  -Encoding UTF8

  Criar .claudeignore

  Write-Host "🚫 Criando .claudeignore..."
  -ForegroundColor Green
  @"
  node_modules/
  dist/
  build/
  .next/
  *.log
  package-lock.json
  yarn.lock
  "@ | Out-File -FilePath ".claudeignore" -Encoding      
  UTF8

  Criar settings.json

  Write-Host "⚙️ Criando settings.json..."
  -ForegroundColor Green
  @"
  {
    "diffView": "auto",
    "autoUpdate": false,
    "model": "claude-sonnet-4",
    "hooks": {
      "on-stop": [
        {
          "matcher": "*",
          "hooks": [
            {
              "type": "command",
              "command": "powershell -Command
  [console]::beep(800,300)"
            }
          ]
        }
      ]
    },
    "customCommands": {}
  }
  "@ | Out-File -FilePath ".claude\settings.json"        
  -Encoding UTF8

  Criar comandos

  Write-Host "🛠️ Criando comandos customizados..."       
  -ForegroundColor Green

  Comando analyze

  @"
  Execute a deep code analysis:
  1. Identify complexity issues
  2. Check for security vulnerabilities
  3. Suggest performance improvements
  4. Provide actionable recommendations
  "@ | Out-File -FilePath
  ".claude\commands\analyze.md" -Encoding UTF8

  Comando test-gen

  @"
  Generate comprehensive unit tests:
  1. Use Jest/Vitest framework
  2. Follow AAA pattern
  3. Cover edge cases and errors
  4. Mock external dependencies
  "@ | Out-File -FilePath
  ".claude\commands\test-gen.md" -Encoding UTF8

  Write-Host ""
  Write-Host "✅ Setup concluído com sucesso!"
  -ForegroundColor Green
  Write-Host ""
  Write-Host "=== PRÓXIMOS PASSOS ==="
  -ForegroundColor Cyan
  Write-Host "1. Personalize o agents.md com detalhes    
   do seu projeto"
  Write-Host "2. Execute: claude"
  Write-Host "3. Execute: /init"
  Write-Host "4. Comece a desenvolver!"
  Write-Host ""

  ---

  Quer que eu execute algum desses scripts para você     
  agora, ou tem alguma dúvida sobre algum passo
  específico?