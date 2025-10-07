# Architecture Overview

## System Context

Tradifai is an educational options trading platform that combines real-time market data, sophisticated analytics, and risk-controlled paper trading to create a comprehensive learning environment for options strategies.

## Architecture Principles

### Hexagonal Architecture (Ports and Adapters)

The system follows hexagonal architecture principles to maintain clean separation between business logic and external concerns:

- **Domain Core**: Pure business logic without external dependencies
- **Application Layer**: Use cases and orchestration of domain operations
- **Adapters**: Implementation of external interfaces (web, database, messaging)
- **Ports**: Interfaces defining contracts between layers

### Domain-Driven Design (DDD)

The system is organized around bounded contexts that model distinct business domains:

```
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Market Data   │  │ Options Analytics│  │  Paper Broker   │
│                 │  │                 │  │                 │
│ • Chains        │  │ • Payoff Calc   │  │ • Portfolio     │
│ • Quotes        │  │ • Greeks        │  │ • Orders        │
│ • Snapshots     │  │ • IV Analysis   │  │ • Execution     │
└─────────────────┘  └─────────────────┘  └─────────────────┘

┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│ Recommendation  │  │   Education     │  │    Identity     │
│                 │  │                 │  │                 │
│ • Strategy Eng  │  │ • Tutorials     │  │ • Users         │
│ • Rules Engine  │  │ • Progress      │  │ • Guardrails    │
│ • Market Regime │  │ • Achievements  │  │ • Permissions   │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

## System Architecture

### High-Level Components

```
┌─────────────────────────────────────────────────────────────┐
│                        Frontend (Next.js)                   │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │   Trading   │ │ Education   │ │   Admin     │          │
│  │     UI      │ │     UI      │ │     UI      │          │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
└─────────────────────────────────────────────────────────────┘
                               │
                               │ HTTPS/WebSocket
                               │
┌─────────────────────────────────────────────────────────────┐
│                      API Gateway (.NET 8)                   │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │    Web      │ │   SignalR   │ │    Auth     │          │
│  │    APIs     │ │     Hub     │ │  Middleware │          │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
└─────────────────────────────────────────────────────────────┘
                               │
                               │ Internal APIs
                               │
┌─────────────────────────────────────────────────────────────┐
│                   Application Services                       │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │   Command   │ │    Query    │ │   Event     │          │
│  │  Handlers   │ │  Handlers   │ │  Handlers   │          │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
└─────────────────────────────────────────────────────────────┘
                               │
                               │ Domain Operations
                               │
┌─────────────────────────────────────────────────────────────┐
│                      Domain Layer                            │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │ Aggregates  │ │   Domain    │ │   Domain    │          │
│  │    &        │ │  Services   │ │   Events    │          │
│  │ Entities    │ │             │ │             │          │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
└─────────────────────────────────────────────────────────────┘
                               │
                               │ Persistence & External APIs
                               │
┌─────────────────────────────────────────────────────────────┐
│                  Infrastructure Layer                        │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │ PostgreSQL  │ │    Redis    │ │  RabbitMQ   │          │
│  │ Repository  │ │   Cache     │ │   Events    │          │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
│                                                             │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │   Market    │ │  Logging    │ │ Monitoring  │          │
│  │ Data Feed   │ │  (Serilog)  │ │ (Metrics)   │          │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
└─────────────────────────────────────────────────────────────┘
```

## Data Flow Patterns

### Command Pattern (Write Operations)

```
Web Client
    │
    │ HTTP POST/PUT/DELETE
    │
    ▼
API Controller
    │
    │ MediatR Command
    │
    ▼
Command Handler
    │
    │ Domain Operations
    │
    ▼
Domain Aggregate
    │
    │ Domain Events
    │
    ▼
Event Handlers ──────────────► Message Bus
    │                              │
    │ Save Changes                 │
    │                              ▼
    ▼                         Subscribers
Repository ──────────────► Database
```

### Query Pattern (Read Operations)

```
Web Client
    │
    │ HTTP GET
    │
    ▼
API Controller
    │
    │ MediatR Query
    │
    ▼
Query Handler
    │
    │ Direct Database Access
    │
    ▼
Read Model ──────────────► Cache (Redis)
    │                         │
    │                         │ Cache Hit
    ▼                         │
Database ◄────────────────────┘
(PostgreSQL)
```

### Event-Driven Updates

```
Domain Event ──────────────► Message Bus (RabbitMQ)
                                    │
                ┌───────────────────┼───────────────────┐
                │                   │                   │
                ▼                   ▼                   ▼
        Read Model          Cache Update        External Service
         Projection         (Redis Clear)         Notification
                │                   │                   │
                ▼                   ▼                   ▼
          PostgreSQL              Redis            Email/SMS
         (Projections)                              Service
```

## Technology Stack Rationale

### Backend Technology Choices

| Technology | Purpose | Rationale |
|------------|---------|-----------|
| .NET 8 | Application Framework | High performance, cross-platform, excellent tooling |
| Minimal APIs | Web Layer | Lightweight, fast startup, reduced ceremony |
| MediatR | CQRS Implementation | Clean separation of concerns, testability |
| EF Core | Data Access | Strong typing, migrations, LINQ support |
| Dapper | Performance Queries | Raw SQL performance for complex read operations |
| FluentValidation | Input Validation | Declarative, testable validation rules |
| SignalR | Real-time Updates | Built-in WebSocket management, scaling support |

### Frontend Technology Choices

| Technology | Purpose | Rationale |
|------------|---------|-----------|
| Next.js 14+ | React Framework | App Router, SSR/SSG, built-in optimizations |
| TypeScript | Language | Type safety, better developer experience |
| Tailwind CSS | Styling | Utility-first, consistent design system |
| React Query | State Management | Server state caching, optimistic updates |
| Recharts | Data Visualization | React-native charting for financial data |

### Infrastructure Choices

| Technology | Purpose | Rationale |
|------------|---------|-----------|
| PostgreSQL | Primary Database | ACID compliance, JSON support, performance |
| Redis | Caching & Sessions | In-memory speed, pub/sub capabilities |
| RabbitMQ | Message Broker | Reliable message delivery, routing flexibility |
| Docker | Containerization | Consistent environments, easy deployment |
| GitHub Actions | CI/CD | Integrated with repository, flexible workflows |

## Security Architecture

### Authentication & Authorization

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Client    │    │   API       │    │  Identity   │
│             │    │  Gateway    │    │  Provider   │
│             │    │             │    │             │
├─────────────┤    ├─────────────┤    ├─────────────┤
│ JWT Token   │◄──►│ Middleware  │◄──►│ Validation  │
│ Refresh     │    │ Validation  │    │ Service     │
│ Token       │    │             │    │             │
└─────────────┘    └─────────────┘    └─────────────┘
       │                   │                   │
       │                   ▼                   │
       │            ┌─────────────┐            │
       │            │ Claims      │            │
       │            │ Extraction  │            │
       │            │             │            │
       │            └─────────────┘            │
       │                   │                   │
       │                   ▼                   │
       │            ┌─────────────┐            │
       └────────────►│ Authorized  │◄───────────┘
                    │ Request     │
                    │             │
                    └─────────────┘
```

### Data Protection

- **Encryption at Rest**: Database-level encryption for sensitive data
- **Encryption in Transit**: TLS 1.3 for all external communications
- **Secret Management**: Azure Key Vault or similar for configuration secrets
- **Input Sanitization**: Comprehensive validation at API boundaries
- **SQL Injection Prevention**: Parameterized queries and ORM protection

## Scalability Considerations

### Horizontal Scaling Points

1. **API Tier**: Stateless design enables load balancer distribution
2. **Database**: Read replicas for query scaling, partitioning strategies
3. **Cache**: Redis Cluster for distributed caching
4. **Message Processing**: Multiple consumer instances for event processing

### Performance Optimizations

1. **Caching Strategy**: Multi-level caching (memory, Redis, CDN)
2. **Database Optimization**: Proper indexing, query optimization
3. **Connection Pooling**: Efficient database connection management
4. **Event Compression**: Batching of high-frequency market data events

## Deployment Architecture

### Container Orchestration

```
┌─────────────────────────────────────────────────────────────┐
│                     Kubernetes Cluster                      │
│                                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │   Ingress   │  │   Web App   │  │     API     │        │
│  │ Controller  │  │    Pods     │  │    Pods     │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
│                                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │ PostgreSQL  │  │    Redis    │  │  RabbitMQ   │        │
│  │ StatefulSet │  │ Deployment  │  │ StatefulSet │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
└─────────────────────────────────────────────────────────────┘
```

### Monitoring & Observability

- **Metrics**: Prometheus + Grafana for system metrics
- **Logging**: Structured logging with Serilog + ELK stack
- **Tracing**: Distributed tracing with OpenTelemetry
- **Health Checks**: Kubernetes liveness/readiness probes
- **Alerting**: PagerDuty integration for critical alerts