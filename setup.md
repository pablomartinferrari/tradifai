You are an expert software architect and project bootstrapper.
Create a new GitHub repository called **tradifai** and initialize it as a hexagonal + DDD .NET 8 + Next.js monorepo following this specification:

---

### 🧱 Project Overview

**Name:** Tradifai
**Mission:** Learn, simulate, and trade smarter — a risk-aware options strategy platform blending education, analytics, and paper trading.

---

### 📁 Folder Structure

```
tradifai/
├── apps/
│   ├── api/                  # .NET 8 API (hex core + adapters)
│   └── web/                  # Next.js frontend
├── libs/
│   ├── domain/
│   │   ├── marketdata/
│   │   ├── options-analytics/
│   │   ├── paper-broker/
│   │   ├── recommendation/
│   │   ├── education/
│   │   └── identity/
│   ├── application/          # Use cases, MediatR handlers
│   ├── infrastructure/       # EF Core, ServiceBus, Redis, provider adapters
│   └── contracts/            # DTOs, domain events, shared messages
├── tests/
│   ├── unit/
│   └── integration/
└── docs/
    ├── ADRs/
    └── architecture.md
```

Initialize each folder with a placeholder `README.md` explaining its responsibility.

---

### ⚙️ Core Setup

* Use **.NET 8 minimal APIs** for backend.
* Use **MediatR**, **FluentValidation**, **EF Core**, and **Dapper**.
* Use **Next.js (App Router)** + **TypeScript** for frontend.
* Add `docker-compose.yml` for API + Postgres (execution & reporting) + Redis + ServiceBus emulator.
* Add **GitHub Actions CI** that:

  * Builds backend and frontend.
  * Runs unit tests.
  * Publishes coverage report.
  * Runs `dotnet format` / lint.

---

### 🧩 Initialize PBIs as GitHub Issues

Create the following issues in the repo (title + description + acceptance criteria):

#### 🧱 PBI-001: Hexagonal Skeleton

**Goal:** Create solution and folder structure per DDD layout.
**AC:**

1. Repo has `/apps`, `/libs`, `/tests` folders as shown.
2. Domain libs scaffolded for each bounded context.
3. Unit tests run in CI; sample aggregate emits a DomainEvent.
4. Containerized API boots and responds on `/health`.

---

#### 📊 PBI-010: Market Data Port + Fake/Provider Adapter

**Goal:** Implement `IMarketDataFeed` with fake and real adapters.
**AC:**

1. `IMarketDataFeed` interface with `GetOptionChainAsync` and `StreamQuotesAsync`.
2. Fake adapter returns deterministic snapshots.
3. Real provider stub behind feature flag.
4. `ChainUpdated` event published.

---

#### ⚙️ PBI-020: Options Analytics Service

**Goal:** Implement payoff & IV rank computations.
**AC:**

1. `IAnalytics.PricePayoff` supports 1–4 legs.
2. `ComputeIVRank` uses rolling percentiles.
3. Unit tests validate butterflies, condors, verticals.

---

#### 💼 PBI-030: Paper Broker Aggregates

**Goal:** Implement portfolio & order lifecycle.
**AC:**

1. Portfolio root enforces guardrails.
2. Order state machine (New → Working → Filled/Canceled).
3. Fake `IPaperExecutionVenue` simulates fills.
4. Emits `OrderFilled`, updates P/L.

---

#### 🧠 PBI-040: Recommendation Engine (Rule-Based v1)

**Goal:** Suggest spreads based on IV & bias.
**AC:**

1. `IRecommendationEngine.Suggest` returns candidates with rationale.
2. Rules for neutral/high IV, bullish/moderate IV.
3. Respects `GuardrailPolicy`; emits `SpreadSuggested`.

---

#### 🪞 PBI-050: Read Models & API Endpoints

**Goal:** Project domain events into read models and expose APIs.
**AC:**

1. Projections for ChainView, PositionsGrid, ExplainWhy.
2. Endpoints: `/options`, `/advice/spread`, `/orders`, `/positions`.
3. OpenAPI docs generated.

---

#### 🎓 PBI-060: Education Library

**Goal:** CRUD for strategy templates, lessons, quizzes.
**AC:**

1. `StrategyTemplate`, `Tutorial`, `Quiz` aggregates implemented.
2. Lesson progress & badge events recorded.
3. Simple frontend embeds lessons inline.

---

#### 🛡️ PBI-070: Guardianship & Guardrails

**Goal:** Implement parental/teen guardrails.
**AC:**

1. Parent/Teen roles; policies per teen.
2. Policy pipeline validates orders pre-trade.
3. Emits `GuardrailViolated` for audit.

---

#### ⚡ PBI-080: Event Compression

**Goal:** Compress bursty market data events.
**AC:**

1. `ChainUpdated` events compressed (500–1000 ms window).
2. Property tests validate correct last-in-window behavior.

---

#### 📈 PBI-090: Frontend MVP (Ticker + Payoff Builder)

**Goal:** Implement minimal web UI to test backend features.
**AC:**

1. Ticker page with candles + IV rank + chain table.
2. Interactive payoff builder using backend analytics.
3. Inline guardrail warnings and order simulation.

---

### 📜 Additional Files

* Root `README.md` with project summary, architecture diagram, and getting-started guide.
* `.gitignore`, `.editorconfig`, and `.gitattributes`.
* LICENSE (MIT).
* ADR template under `/docs/ADRs/`.

---

### 🧩 Output

When finished:

1. Create all folders and seed them with `README.md` placeholders.
2. Add a root solution file `tradifai.sln`.
3. Create GitHub issues with titles & descriptions from PBIs above.
4. Commit and push initial code to main branch.
