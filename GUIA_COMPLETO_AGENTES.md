# 🗺️ Guia Completo: Mapeamento de Todos os Agentes Claude Code

> **Versão:** 1.0 | **Data:** Janeiro 2025  
> Guia completo para navegar e encontrar os melhores agentes especializados em suas necessidades.

---

## 📊 Visão Geral dos Repositórios

Este projeto contém **3 repositórios de agentes** clonados, totalizando **~355 agentes** (com duplicatas entre repositórios):

| Repositório | Localização | Total de Agentes | Descrição |
|------------|-------------|------------------|-----------|
| **Elite Claude Agents** | `agents/` | ~100 agentes | Coleção focada em especialização profunda |
| **Awesome Claude Code Subagents** | `awesome-claude-code-subagents/categories/` | ~116 agentes | Organizado em 10 categorias temáticas |
| **Claude Code Subagents** | `claude-code-subagents/agents/` | 138 agentes | Coleção técnica extensa de tecnologias |

---

## 🗂️ Estrutura dos Repositórios

### 1️⃣ Repositório: Elite Claude Agents (`agents/`)

**Fonte:** `lodetomasi/agents-claude-code`  
**Total:** ~100 agentes  
**Organização:** Todos na raiz, flat structure  
**Formato:** YAML frontmatter com `name`, `description`, `model`

#### Estrutura:
```
agents/
├── README.md                    # Documentação completa do repositório
├── LICENSE                      # MIT License
├── accessibility-guardian.md
├── angular-authority.md
├── aws-architect.md
├── react-wizard.md
├── ... (97 mais agentes)
└── workflow-automator.md
```

#### Características:
- ✅ **Formatos consistentes:** Todos seguem mesmo padrão YAML
- ✅ **Modelos otimizados:** Cada agente usa Opus/Sonnet/Haiku apropriado
- ✅ **Descrições claras:** Cada agente tem descrição específica
- ✅ **Foco em especialização:** Cada agente é hiper-especializado

---

### 2️⃣ Repositório: Awesome Claude Code Subagents (`awesome-claude-code-subagents/`)

**Fonte:** `VoltAgent/awesome-claude-code-subagents`  
**Total:** ~116 agentes organizados em **10 categorias**  
**Organização:** Hierárquica por categoria temática  
**Formato:** YAML frontmatter + seções estruturadas + integração MCP

#### Estrutura por Categoria:

```
awesome-claude-code-subagents/
├── README.md                           # Visão geral completa
├── CONTRIBUTING.md                     # Guia de contribuição
├── LICENSE                             # MIT License
└── categories/
    ├── 01-core-development/            # 12 agentes
    │   ├── README.md
    │   ├── api-designer.md
    │   ├── backend-developer.md
    │   ├── electron-pro.md
    │   ├── frontend-developer.md
    │   ├── fullstack-developer.md
    │   ├── graphql-architect.md
    │   ├── microservices-architect.md
    │   ├── mobile-developer.md
    │   ├── ui-designer.md
    │   ├── websocket-engineer.md
    │   └── wordpress-master.md
    │
    ├── 02-language-specialists/        # 24 agentes
    │   ├── README.md
    │   ├── angular-architect.md
    │   ├── cpp-pro.md
    │   ├── csharp-developer.md
    │   ├── django-developer.md
    │   ├── dotnet-core-expert.md
    │   ├── dotnet-framework-4.8-expert.md
    │   ├── flutter-expert.md
    │   ├── golang-pro.md
    │   ├── java-architect.md
    │   ├── javascript-pro.md
    │   ├── kotlin-specialist.md
    │   ├── laravel-specialist.md
    │   ├── nextjs-developer.md
    │   ├── php-pro.md
    │   ├── python-pro.md
    │   ├── rails-expert.md
    │   ├── react-specialist.md
    │   ├── rust-engineer.md
    │   ├── spring-boot-engineer.md
    │   ├── sql-pro.md
    │   ├── swift-expert.md
    │   ├── typescript-pro.md
    │   └── vue-expert.md
    │
    ├── 03-infrastructure/              # 13 agentes
    │   ├── README.md
    │   ├── cloud-architect.md
    │   ├── database-administrator.md
    │   ├── deployment-engineer.md
    │   ├── devops-engineer.md
    │   ├── devops-incident-responder.md
    │   ├── incident-responder.md
    │   ├── kubernetes-specialist.md
    │   ├── network-engineer.md
    │   ├── platform-engineer.md
    │   ├── security-engineer.md
    │   ├── sre-engineer.md
    │   └── terraform-engineer.md
    │
    ├── 04-quality-security/            # 13 agentes
    │   ├── README.md
    │   ├── accessibility-tester.md
    │   ├── architect-reviewer.md
    │   ├── chaos-engineer.md
    │   ├── code-reviewer.md
    |   ├── compliance-auditor.md
    │   ├── debugger.md
    │   ├── error-detective.md
    │   ├── penetration-tester.md
    │   ├── performance-engineer.md
    │   ├── qa-expert.md
    │   ├── security-auditor.md
    │   └── test-automator.md
    │
    ├── 05-data-ai/                     # 13 agentes
    │   ├── README.md
    │   ├── ai-engineer.md
    │   ├── data-analyst.md
    │   ├── data-engineer.md
    │   ├── data-scientist.md
    │   ├── database-optimizer.md
    │   ├── llm-architect.md
    │   ├── machine-learning-engineer.md
    │   ├── ml-engineer.md
    │   ├── mlops-engineer.md
    │   ├── nlp-engineer.md
    │   ├── postgres-pro.md
    │   └── prompt-engineer.md
    │
    ├── 06-developer-experience/        # 11 agentes
    │   ├── README.md
    │   ├── build-engineer.md
    │   ├── cli-developer.md
    │   ├── dependency-manager.md
    │   ├── documentation-engineer.md
    │   ├── dx-optimizer.md
    │   ├── git-workflow-manager.md
    │   ├── legacy-modernizer.md
    │   ├── mcp-developer.md
    │   ├── refactoring-specialist.md
    │   └── tooling-engineer.md
    │
    ├── 07-specialized-domains/          # 12 agentes
    │   ├── README.md
    │   ├── api-documenter.md
    │   ├── blockchain-developer.md
    │   ├── embedded-systems.md
    │   ├── fintech-engineer.md
    │   ├── game-developer.md
    │   ├── iot-engineer.md
    │   ├── mobile-app-developer.md
    │   ├── payment-integration.md
    │   ├── quant-analyst.md
    │   ├── risk-manager.md
    │   └── seo-specialist.md
    │
    ├── 08-business-product/             # 12 agentes
    │   ├── README.md
    │   ├── business-analyst.md
    │   ├── content-marketer.md
    │   ├── customer-success-manager.md
    │   ├── legal-advisor.md
    │   ├── product-manager.md
    │   ├── project-manager.md
    │   ├── sales-engineer.md
    │   ├── scrum-master.md
    │   ├── technical-writer.md
    │   ├── ux-researcher.md
    │   └── wordpress-master.md
    │
    ├── 09-meta-orchestration/           # 9 agentes
    │   ├── README.md
    │   ├── agent-organizer.md
    │   ├── context-manager.md
    │   ├── error-coordinator.md
    │   ├── knowledge-synthesizer.md
    │   ├── multi-agent-coordinator.md
    │   ├── performance-monitor.md
    │   ├── task-distributor.md
    │   └── workflow-orchestrator.md
    │
    └── 10-research-analysis/             # 7 agentes
        ├── README.md
        ├── competitive-analyst.md
        ├── data-researcher.md
        ├── market-researcher.md
        ├── research-analyst.md
        ├── search-specialist.md
        └── trend-analyst.md
```

#### Características:
- ✅ **Organização temática:** 10 categorias claramente definidas
- ✅ **README por categoria:** Cada pasta tem seu próprio README explicativo
- ✅ **Integração MCP:** Muitos agentes especificam ferramentas MCP
- ✅ **Protocolos de comunicação:** Alguns agentes têm protocolos inter-agentes
- ✅ **Workflows estruturados:** Muitos têm workflows passo a passo

---

### 3️⃣ Repositório: Claude Code Subagents (`claude-code-subagents/`)

**Fonte:** `0xfurai/claude-code-subagents`  
**Total:** 138 agentes  
**Organização:** Todos na pasta `agents/`, estrutura flat  
**Formato:** YAML frontmatter simples

#### Estrutura:
```
claude-code-subagents/
├── README.md                    # Documentação completa
├── LICENSE                      # MIT License
└── agents/
    ├── actix-expert.md
    ├── android-expert.md
    ├── angular-expert.md
    ├── ansible-expert.md
    ├── ... (135 mais agentes)
    └── websocket-expert.md
```

#### Características:
- ✅ **Cobertura técnica extensa:** Cobre tecnologias muito específicas
- ✅ **Nomenclatura simples:** Nomes diretos (tech-expert.md)
- ✅ **Foco em linguagens/frameworks:** Muitos especialistas de tecnologias específicas

---

## 🔍 Índice por Tecnologia/Função

### 📱 Frontend Development

#### React
- **`agents/react-wizard.md`** - React mastery (hooks, performance, state management)
- **`awesome-claude-code-subagents/categories/02-language-specialists/react-specialist.md`** - React 18+ modern patterns
- **`claude-code-subagents/agents/react-expert.md`** - React development with hooks

#### Vue.js
- **`agents/vue-virtuoso.md`** - Vue.js expert (Composition API, performance)
- **`awesome-claude-code-subagents/categories/02-language-specialists/vue-expert.md`** - Vue 3 Composition API expert
- **`claude-code-subagents/agents/vue-expert.md`** - Vue.js development

#### Angular
- **`agents/angular-authority.md`** - Enterprise Angular (RxJS, NgRx)
- **`awesome-claude-code-subagents/categories/02-language-specialists/angular-architect.md`** - Angular 15+ enterprise patterns
- **`claude-code-subagents/agents/angular-expert.md`** - Angular development

#### Next.js
- **`agents/nextjs-architect.md`** - Next.js mastery (SSR/SSG, App Router)
- **`awesome-claude-code-subagents/categories/02-language-specialists/nextjs-developer.md`** - Next.js 14+ full-stack specialist
- **`claude-code-subagents/agents/nextjs-expert.md`** - Next.js development

#### Svelte
- **`agents/svelte-sorcerer.md`** - Svelte expert (compile-time magic)
- **`claude-code-subagents/agents/svelte-expert.md`** - Svelte development

#### Mobile
- **`agents/flutter-expert.md`** - Flutter cross-platform expert
- **`agents/mobile-architect.md`** - Mobile apps specialist (iOS/Android)
- **`awesome-claude-code-subagents/categories/01-core-development/mobile-developer.md`** - Cross-platform mobile specialist
- **`awesome-claude-code-subagents/categories/02-language-specialists/flutter-expert.md`** - Flutter 3+ cross-platform expert
- **`claude-code-subagents/agents/flutter-expert.md`** - Flutter development
- **`claude-code-subagents/agents/react-native-expert.md`** - React Native expert

---

### ⚙️ Backend Development

#### Node.js / Express
- **`agents/nodejs-ninja.md`** - Node.js mastery (async, streams, performance)
- **`agents/express-engineer.md`** - Express.js expert (middleware, REST APIs)
- **`claude-code-subagents/agents/nodejs-expert.md`** - Node.js development
- **`claude-code-subagents/agents/express-expert.md`** - Express.js development

#### Python Backend
- **`agents/python-alchemist.md`** - Python ecosystem master
- **`agents/django-master.md`** - Django expert (ORM, security)
- **`agents/fastapi-expert.md`** - FastAPI expert (async, OpenAPI)
- **`agents/flask-artisan.md`** - Flask expert (microservices)
- **`awesome-claude-code-subagents/categories/02-language-specialists/python-pro.md`** - Python ecosystem master
- **`awesome-claude-code-subagents/categories/02-language-specialists/django-developer.md`** - Django 4+ expert
- **`claude-code-subagents/agents/python-expert.md`** - Python development
- **`claude-code-subagents/agents/django-expert.md`** - Django development
- **`claude-code-subagents/agents/fastapi-expert.md`** - FastAPI development
- **`claude-code-subagents/agents/flask-expert.md`** - Flask development

#### Java Backend
- **`agents/java-architect.md`** - Enterprise Java (Spring, JVM)
- **`agents/spring-boot-guru.md`** - Spring Boot expert (microservices)
- **`awesome-claude-code-subagents/categories/02-language-specialists/java-architect.md`** - Enterprise Java expert
- **`awesome-claude-code-subagents/categories/02-language-specialists/spring-boot-engineer.md`** - Spring Boot 3+ expert
- **`claude-code-subagents/agents/java-expert.md`** - Java development
- **`claude-code-subagents/agents/spring-boot-expert.md`** - Spring Boot development

#### .NET Backend
- **`agents/dotnet-expert.md`** - .NET expert (ASP.NET Core, Blazor)
- **`awesome-claude-code-subagents/categories/02-language-specialists/csharp-developer.md`** - .NET ecosystem specialist
- **`awesome-claude-code-subagents/categories/02-language-specialists/dotnet-core-expert.md`** - .NET 8 cross-platform
- **`awesome-claude-code-subagents/categories/02-language-specialists/dotnet-framework-4.8-expert.md`** - .NET Framework legacy
- **`claude-code-subagents/agents/csharp-expert.md`** - C# development
- **`claude-code-subagents/agents/aspnet-core-expert.md`** - ASP.NET Core development

#### Go Backend
- **`agents/golang-guru.md`** - Go concurrency specialist
- **`awesome-claude-code-subagents/categories/02-language-specialists/golang-pro.md`** - Go concurrency specialist
- **`claude-code-subagents/agents/go-expert.md`** - Go development
- **`claude-code-subagents/agents/gin-expert.md`** - Gin framework
- **`claude-code-subagents/agents/fiber-expert.md`** - Fiber framework

#### PHP Backend
- **`agents/php-professional.md`** - Modern PHP expert
- **`agents/laravel-wizard.md`** - Laravel expert (Eloquent, queues)
- **`awesome-claude-code-subagents/categories/02-language-specialists/php-pro.md`** - PHP web development
- **`awesome-claude-code-subagents/categories/02-language-specialists/laravel-specialist.md`** - Laravel 10+ expert
- **`claude-code-subagents/agents/php-expert.md`** - PHP development
- **`claude-code-subagents/agents/laravel-expert.md`** - Laravel development

#### Ruby / Rails
- **`agents/rails-architect.md`** - Rails expert (ActiveRecord, Hotwire)
- **`awesome-claude-code-subagents/categories/02-language-specialists/rails-expert.md`** - Rails 7+ expert
- **`claude-code-subagents/agents/rails-expert.md`** - Rails development
- **`claude-code-subagents/agents/ruby-expert.md`** - Ruby development

---

### 🗄️ Databases

#### PostgreSQL
- **`agents/postgresql-guru.md`** - PostgreSQL expert (advanced features, optimization)
- **`awesome-claude-code-subagents/categories/05-data-ai/postgres-pro.md`** - PostgreSQL database expert
- **`claude-code-subagents/agents/postgres-expert.md`** - PostgreSQL development

#### MongoDB
- **`agents/mongodb-master.md`** - MongoDB expert (NoSQL, aggregation)
- **`claude-code-subagents/agents/mongodb-expert.md`** - MongoDB development
- **`claude-code-subagents/agents/mongoose-expert.md`** - Mongoose ODM

#### Redis
- **`agents/redis-specialist.md`** - Redis expert (caching, pub/sub)
- **`claude-code-subagents/agents/redis-expert.md`** - Redis development

#### SQL Geral
- **`agents/database-wizard.md`** - Database master (SQL/NoSQL)
- **`awesome-claude-code-subagents/categories/02-language-specialists/sql-pro.md`** - Database query expert
- **`claude-code-subagents/agents/sql-expert.md`** - SQL development
- **`claude-code-subagents/agents/mysql-expert.md`** - MySQL development
- **`claude-code-subagents/agents/sqlite-expert.md`** - SQLite development

---

### ☁️ Cloud & Infrastructure

#### AWS
- **`agents/aws-architect.md`** - AWS solutions architect (serverless, scaling)
- **`awesome-claude-code-subagents/categories/03-infrastructure/cloud-architect.md`** - AWS/GCP/Azure specialist

#### Kubernetes
- **`agents/kubernetes-pilot.md`** - Kubernetes expert (orchestration, scaling)
- **`awesome-claude-code-subagents/categories/03-infrastructure/kubernetes-specialist.md`** - Container orchestration master
- **`claude-code-subagents/agents/kubernetes-expert.md`** - Kubernetes development

#### Docker
- **`agents/docker-captain.md`** - Docker expert (containerization)
- **`claude-code-subagents/agents/docker-expert.md`** - Docker development

#### Terraform
- **`agents/terraform-master.md`** - Infrastructure as Code expert
- **`awesome-claude-code-subagents/categories/03-infrastructure/terraform-engineer.md`** - IaC expert
- **`claude-code-subagents/agents/terraform-expert.md`** - Terraform development

#### DevOps
- **`agents/devops-maestro.md`** - DevOps expert (CI/CD, automation)
- **`agents/github-actions-pro.md`** - GitHub Actions expert
- **`agents/jenkins-expert.md`** - Jenkins CI/CD expert
- **`agents/gitlab-specialist.md`** - GitLab expert
- **`awesome-claude-code-subagents/categories/03-infrastructure/devops-engineer.md`** - CI/CD and automation expert
- **`claude-code-subagents/agents/github-actions-expert.md`** - GitHub Actions development
- **`claude-code-subagents/agents/jenkins-expert.md`** - Jenkins development
- **`claude-code-subagents/agents/gitlab-ci-expert.md`** - GitLab CI development

---

### 🧪 Testing

#### E2E Testing
- **`agents/cypress-champion.md`** - Cypress E2E testing expert
- **`agents/playwright-pro.md`** - Playwright browser automation expert
- **`awesome-claude-code-subagents/categories/04-quality-security/test-automator.md`** - Test automation framework expert
- **`claude-code-subagents/agents/cypress-expert.md`** - Cypress development
- **`claude-code-subagents/agents/playwright-expert.md`** - Playwright development
- **`claude-code-subagents/agents/selenium-expert.md`** - Selenium development

#### Unit Testing
- **`agents/jest-ninja.md`** - Jest JavaScript testing expert
- **`agents/pytest-master.md`** - Pytest Python testing expert
- **`agents/vitest-virtuoso.md`** - Vitest fast testing expert
- **`claude-code-subagents/agents/jest-expert.md`** - Jest development
- **`claude-code-subagents/agents/vitest-expert.md`** - Vitest development
- **`claude-code-subagents/agents/mocha-expert.md`** - Mocha development

---

### 🔒 Security & Quality

#### Security
- **`agents/threat-modeler.md`** - Security threat modeling expert
- **`agents/privacy-architect.md`** - Privacy engineering expert
- **`agents/chaos-engineer.md`** - Chaos engineering expert
- **`awesome-claude-code-subagents/categories/04-quality-security/security-auditor.md`** - Security vulnerability expert
- **`awesome-claude-code-subagents/categories/04-quality-security/penetration-tester.md`** - Ethical hacking specialist
- **`awesome-claude-code-subagents/categories/03-infrastructure/security-engineer.md`** - Infrastructure security specialist
- **`claude-code-subagents/agents/owasp-top10-expert.md`** - OWASP Top 10 expert

#### Code Quality
- **`agents/tech-debt-surgeon.md`** - Technical debt elimination expert
- **`awesome-claude-code-subagents/categories/04-quality-security/code-reviewer.md`** - Code quality guardian
- **`awesome-claude-code-subagents/categories/06-developer-experience/refactoring-specialist.md`** - Code refactoring expert

---

### 🤖 AI & Machine Learning

#### ML/AI
- **`agents/ml-ops-architect.md`** - MLOps production expert
- **`agents/data-detective.md`** - Data investigation expert
- **`awesome-claude-code-subagents/categories/05-data-ai/ai-engineer.md`** - AI system design expert
- **`awesome-claude-code-subagents/categories/05-data-ai/machine-learning-engineer.md`** - ML systems expert
- **`awesome-claude-code-subagents/categories/05-data-ai/mlops-engineer.md`** - MLOps expert
- **`awesome-claude-code-subagents/categories/05-data-ai/prompt-engineer.md`** - Prompt optimization specialist
- **`claude-code-subagents/agents/langchain-expert.md`** - LangChain LLM applications
- **`claude-code-subagents/agents/tensorflow-expert.md`** - TensorFlow development
- **`claude-code-subagents/agents/pytorch-expert.md`** - PyTorch development

---

### 🔗 APIs & Integration

#### GraphQL
- **`agents/graphql-wizard.md`** - GraphQL expert (schema design, federation)
- **`awesome-claude-code-subagents/categories/01-core-development/graphql-architect.md`** - GraphQL schema expert
- **`claude-code-subagents/agents/graphql-expert.md`** - GraphQL development

#### REST APIs
- **`agents/api-archaeologist.md`** - API reverse engineering expert
- **`awesome-claude-code-subagents/categories/01-core-development/api-designer.md`** - REST and GraphQL API architect
- **`claude-code-subagents/agents/rest-expert.md`** - REST API development
- **`claude-code-subagents/agents/openapi-expert.md`** - OpenAPI development

#### WebSockets
- **`agents/websocket-engineer.md`** - WebSocket real-time expert (se estiver no awesome)
- **`awesome-claude-code-subagents/categories/01-core-development/websocket-engineer.md`** - Real-time communication specialist
- **`claude-code-subagents/agents/websocket-expert.md`** - WebSocket development

---

### 📊 Data & Analytics

#### Data Engineering
- **`agents/data-storyteller.md`** - Data visualization expert
- **`awesome-claude-code-subagents/categories/05-data-ai/data-engineer.md`** - Data pipeline architect
- **`awesome-claude-code-subagents/categories/05-data-ai/data-scientist.md`** - Analytics expert
- **`claude-code-subagents/agents/pandas-expert.md`** - Pandas data manipulation
- **`claude-code-subagents/agents/numpy-expert.md`** - NumPy numerical computing

---

## 🔄 Análise de Duplicatas

### Agentes que aparecem em MÚLTIPLOS repositórios:

#### React (3 versões):
1. **`agents/react-wizard.md`** - Versão detalhada com hooks, performance
2. **`awesome-claude-code-subagents/categories/02-language-specialists/react-specialist.md`** - React 18+ modern patterns
3. **`claude-code-subagents/agents/react-expert.md`** - Versão técnica

#### Vue (3 versões):
1. **`agents/vue-virtuoso.md`** - Vue expert
2. **`awesome-claude-code-subagents/categories/02-language-specialists/vue-expert.md`** - Vue 3 Composition API
3. **`claude-code-subagents/agents/vue-expert.md`** - Vue development

#### Python (2 versões):
1. **`agents/python-alchemist.md`** - Python ecosystem master
2. **`awesome-claude-code-subagents/categories/02-language-specialists/python-pro.md`** - Python ecosystem master
3. **`claude-code-subagents/agents/python-expert.md`** - Python development

#### TypeScript (3 versões):
1. **`agents/typescript-sage.md`** - TypeScript type system master
2. **`awesome-claude-code-subagents/categories/02-language-specialists/typescript-pro.md`** - TypeScript specialist
3. **`claude-code-subagents/agents/typescript-expert.md`** - TypeScript development

#### Kubernetes (3 versões):
1. **`agents/kubernetes-pilot.md`** - Kubernetes expert
2. **`awesome-claude-code-subagents/categories/03-infrastructure/kubernetes-specialist.md`** - Container orchestration master
3. **`claude-code-subagents/agents/kubernetes-expert.md`** - Kubernetes development

#### Docker (2 versões):
1. **`agents/docker-captain.md`** - Docker containerization expert
2. **`claude-code-subagents/agents/docker-expert.md`** - Docker development

#### PostgreSQL (3 versões):
1. **`agents/postgresql-guru.md`** - PostgreSQL expert
2. **`awesome-claude-code-subagents/categories/05-data-ai/postgres-pro.md`** - PostgreSQL database expert
3. **`claude-code-subagents/agents/postgres-expert.md`** - PostgreSQL development

---

## 🎯 Como Escolher a Melhor Versão

### Para Desenvolvimento Frontend:
**Recomendação:** Use `awesome-claude-code-subagents` (categoria 01 ou 02)
- ✅ Mais detalhados com workflows estruturados
- ✅ Integração MCP especificada
- ✅ Protocolos de comunicação inter-agentes

### Para Tecnologias Específicas:
**Recomendação:** Use `claude-code-subagents/agents/`
- ✅ Cobertura técnica mais extensa
- ✅ Agentes muito específicos (ex: `knex-expert`, `bullmq-expert`)
- ✅ Focos técnicos diretos

### Para Especialização Profunda:
**Recomendação:** Use `agents/` (Elite Claude Agents)
- ✅ Especialização hiper-focada
- ✅ Modelos otimizados (Opus/Sonnet/Haiku)
- ✅ Descriptions muito específicas

---

## 📍 Índice Rápido por Necessidade

### Preciso construir uma aplicação web completa:
→ **`awesome-claude-code-subagents/categories/01-core-development/fullstack-developer.md`**

### Preciso otimizar performance:
→ **`agents/performance-optimizer.md`** OU  
→ **`awesome-claude-code-subagents/categories/04-quality-security/performance-engineer.md`**

### Preciso de segurança:
→ **`agents/threat-modeler.md`** OU  
→ **`awesome-claude-code-subagents/categories/04-quality-security/security-auditor.md`**

### Preciso de testes:
→ **`agents/jest-ninja.md`** (JavaScript) OU  
→ **`agents/pytest-master.md`** (Python) OU  
→ **`awesome-claude-code-subagents/categories/04-quality-security/test-automator.md`**

### Preciso de infraestrutura cloud:
→ **`agents/aws-architect.md`** (AWS específico) OU  
→ **`awesome-claude-code-subagents/categories/03-infrastructure/cloud-architect.md`** (Multi-cloud)

### Preciso de automação/orquestração:
→ **`awesome-claude-code-subagents/categories/09-meta-orchestration/workflow-orchestrator.md`**

---

## 🚀 Como Usar Cada Repositório

### Opção 1: Copiar para `.claude/agents/` (Recomendado)

**Para agentes específicos do projeto:**
```powershell
# Copiar agentes selecionados para seu projeto
Copy-Item "agents/react-wizard.md" ".claude/agents/"
Copy-Item "awesome-claude-code-subagents/categories/01-core-development/backend-developer.md" ".claude/agents/"
```

**Para todos os agentes globalmente:**
```powershell
# Windows PowerShell
Copy-Item "agents/*.md" "$env:USERPROFILE\.claude\agents\" -Exclude "README.md"
```

### Opção 2: Manter como Submódulos

Já configurado como submódulos Git no repositório atual. Para atualizar:

```powershell
git submodule update --remote
```

### Opção 3: Usar Links Simbólicos (Windows)

```powershell
# Criar link simbólico para manter atualizado
New-Item -ItemType SymbolicLink -Path ".claude/agents/elite-agents" -Target "agents"
```

---

## 📝 Padrões de Nomenclatura

### Elite Claude Agents (`agents/`):
- Formato: `[tecnologia]-[especialista].md`
- Exemplos: `react-wizard.md`, `aws-architect.md`, `kubernetes-pilot.md`

### Awesome Claude Code Subagents:
- Formato: `[tecnologia]-[especialidade].md` ou `[função]-[role].md`
- Exemplos: `backend-developer.md`, `react-specialist.md`, `devops-engineer.md`

### Claude Code Subagents (`claude-code-subagents/`):
- Formato: `[tecnologia]-expert.md`
- Exemplos: `react-expert.md`, `kubernetes-expert.md`, `python-expert.md`

---

## 🔗 Links Úteis

### Repositórios Originais:
- **Elite Claude Agents:** https://github.com/lodetomasi/agents-claude-code
- **Awesome Claude Code Subagents:** https://github.com/VoltAgent/awesome-claude-code-subagents
- **Claude Code Subagents:** https://github.com/0xfurai/claude-code-subagents

### Documentação Claude Code:
- **Oficial:** https://docs.anthropic.com/en/docs/claude-code
- **Subagents Guide:** https://docs.anthropic.com/en/docs/claude-code/sub-agents

---

## 💡 Recomendações Práticas

### Para Projetos Novos:
1. Use **Awesome Claude Code Subagents** para estruturação
2. Use **Elite Claude Agents** para especialização profunda
3. Use **Claude Code Subagents** para tecnologias muito específicas

### Para Projetos Existentes:
1. Identifique gaps de conhecimento
2. Busque agente específico na categoria correspondente
3. Copie para `.claude/agents/` do projeto

### Para Times:
1. Padronize agentes em `.claude/agents/` compartilhado
2. Documente quais agentes o time usa
3. Mantenha versões atualizadas via Git submodules

## 🔎 Busca Rápida por Palavra-chave

Use `Ctrl+F` para buscar rapidamente:

| Palavra-chave | Agentes Encontrados | Localização Principal |
|--------------|---------------------|----------------------|
| React | react-wizard, react-specialist, react-expert | 3 versões em diferentes repos |
| Vue | vue-virtuoso, vue-expert | 3 versões |
| Angular | angular-authority, angular-architect, angular-expert | 3 versões |
| Next.js | nextjs-architect, nextjs-developer, nextjs-expert | 3 versões |
| TypeScript | typescript-sage, typescript-pro, typescript-expert | 3 versões |
| Python | python-alchemist, python-pro, python-expert | 3 versões |
| Node.js | nodejs-ninja, nodejs-expert | 2 versões |
| Kubernetes | kubernetes-pilot, kubernetes-specialist, kubernetes-expert | 3 versões |
| Docker | docker-captain, docker-expert | 2 versões |
| PostgreSQL | postgresql-guru, postgres-pro, postgres-expert | 3 versões |
| MongoDB | mongodb-master, mongodb-expert | 2 versões |
| Testing | jest-ninja, cypress-champion, playwright-pro, pytest-master | 4+ agentes |
| Security | threat-modeler, security-auditor, penetration-tester | 3+ agentes |
| DevOps | devops-maestro, devops-engineer | 2 versões |
| AWS | aws-architect, cloud-architect | 2 versões |
| GraphQL | graphql-wizard, graphql-architect, graphql-expert | 3 versões |
| FastAPI | fastapi-expert | 2 versões |
| Django | django-master, django-developer, django-expert | 3 versões |
| Flask | flask-artisan, flask-expert | 2 versões |
| Laravel | laravel-wizard, laravel-specialist, laravel-expert | 3 versões |
| Rails | rails-architect, rails-expert, ruby-expert | 3 versões |
| Spring Boot | spring-boot-guru, spring-boot-engineer, spring-boot-expert | 3 versões |
| Go | golang-guru, golang-pro, go-expert | 3 versões |
| Rust | rust-evangelist, rust-engineer, rust-expert | 3 versões |
| Java | java-architect, java-expert | 2 versões |
| PHP | php-professional, php-pro, php-expert | 3 versões |

---

## 📊 Estatísticas dos Repositórios

### Por Tamanho:
1. **Claude Code Subagents:** 138 agentes (maior coleção técnica)
2. **Awesome Claude Code Subagents:** 116 agentes (mais organizados)
3. **Elite Claude Agents:** ~100 agentes (mais especializados)

### Por Categoria (Awesome Subagents):
- **02-language-specialists:** 24 agentes (maior categoria)
- **01-core-development:** 12 agentes
- **04-quality-security:** 13 agentes
- **05-data-ai:** 13 agentes
- **09-meta-orchestration:** 9 agentes (mais único)
- **10-research-analysis:** 7 agentes (mais específico)

---

## 🛠️ Scripts Úteis

### PowerShell: Listar todos os agentes únicos
```powershell
Get-ChildItem -Recurse -Path "agents","awesome-claude-code-subagents\categories","claude-code-subagents\agents" -Filter "*.md" | 
    Where-Object { $_.Name -ne "README.md" } | 
    Select-Object Name, Directory | 
    Sort-Object Name | 
    Format-Table -AutoSize
```

### PowerShell: Encontrar duplicatas
```powershell
$agents = Get-ChildItem -Recurse -Path "agents","awesome-claude-code-subagents\categories","claude-code-subagents\agents" -Filter "*.md" | 
    Where-Object { $_.Name -ne "README.md" } | 
    Select-Object Name, Directory

$agents | Group-Object { $_.Name -replace '-', '' -replace '_', '' -replace '\.md', '' } | 
    Where-Object { $_.Count -gt 1 } | 
    Select-Object Name, Count, @{N='Files';E={$_.Group | Select-Object -ExpandProperty FullName}}
```

### PowerShell: Copiar agentes por tecnologia
```powershell
# Copiar todos os agentes React
$reactAgents = Get-ChildItem -Recurse -Path "agents","awesome-claude-code-subagents","claude-code-subagents" -Filter "*react*.md"
$reactAgents | Copy-Item -Destination ".claude/agents/"
```

---

## 📚 Documentação de Referência

### Estrutura de um Agente:
Cada arquivo `.md` contém:

```yaml
---
name: nome-do-agente
description: Descrição do que o agente faz
model: sonnet  # ou opus, haiku
tools: Read, Write, Bash  # (alguns especificam ferramentas MCP)
---

# Conteúdo do agente
Role definition...
Expertise areas...
Workflow patterns...
```

### Formato Awesome Subagents:
Inclui adicionalmente:
- **Communication Protocol:** Como agentes se comunicam
- **MCP Tool Integration:** Ferramentas Model Context Protocol
- **Implementation Workflow:** Fases estruturadas

---

## ⚠️ Notas Importantes

1. **Conflitos de Nome:** Se o mesmo nome de agente existir em múltiplos repositórios na mesma pasta `.claude/agents/`, o Claude Code pode usar apenas um. Recomendação: renomeie ou escolha a melhor versão.

2. **Atualização:** Os repositórios são Git submodules. Para atualizar:
   ```powershell
   git submodule update --remote
   ```

3. **Performance:** Ter muitos agentes não impacta performance - Claude Code carrega sob demanda baseado em contexto.

4. **Customização:** Todos os agentes podem ser customizados copiando e editando em `.claude/agents/` do seu projeto.

---

**Versão:** 1.0  
**Última atualização:** Janeiro 2025  
**Manutenção:** Este guia deve ser atualizado quando novos agentes forem adicionados aos repositórios

---

*Criado para facilitar a navegação e escolha dos melhores agentes para cada necessidade de desenvolvimento.*

