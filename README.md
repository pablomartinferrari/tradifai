# Tradifai

> **Learn, simulate, and trade smarter** — A risk-aware options strategy platform blending education, analytics, and paper trading.

[![CI/CD Pipeline](https://github.com/your-org/tradifai/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/your-org/tradifai/actions/workflows/ci-cd.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🎯 Mission

Tradifai empowers traders and investors to learn options strategies through interactive education, sophisticated analytics, and risk-controlled paper trading. Built with parental guardrails for teen accounts, it provides a safe environment to master complex financial instruments before risking real capital.

## 🏗️ Architecture

This project implements a **hexagonal (ports and adapters)** architecture with **domain-driven design** principles in a .NET 8 + Next.js monorepo structure.

```
tradifai/
├── apps/
│   ├── api/          # .NET 8 Web API (hexagonal core + adapters)
│   └── web/          # Next.js frontend with TypeScript
├── libs/
│   ├── domain/       # Domain models for each bounded context
│   ├── application/  # Use cases and MediatR handlers
│   ├── infrastructure/ # Data access and external service adapters
│   └── contracts/    # DTOs, events, and API contracts
├── tests/
│   ├── unit/         # Fast, isolated unit tests
│   └── integration/  # Database and service integration tests
└── docs/             # Architecture docs and ADRs
```

### Bounded Contexts

- **Market Data** - Real-time options chains, quotes, and market statistics
- **Options Analytics** - Payoff calculations, Greeks, and volatility analysis
- **Paper Broker** - Portfolio management, order execution simulation
- **Recommendation** - Strategy suggestions based on market conditions
- **Education** - Interactive tutorials, quizzes, and progress tracking
- **Identity** - User management with parental guardrails for teen accounts

## 🚀 Getting Started

### Prerequisites

- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Node.js 18+](https://nodejs.org/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)

### Quick Start with Docker

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/tradifai.git
   cd tradifai
   ```

2. **Start all services**
   ```bash
   docker-compose up -d
   ```

3. **Access the application**
   - Frontend: http://localhost:3000
   - API: http://localhost:8080
   - API Documentation: http://localhost:8080/swagger
   - RabbitMQ Management: http://localhost:15672 (tradifai/tradifai123)

### Local Development

1. **Start infrastructure services**
   ```bash
   docker-compose up postgres redis servicebus -d
   ```

2. **Run the API**
   ```bash
   cd apps/api/Tradifai.Api
   dotnet run
   ```

3. **Run the frontend** (in a new terminal)
   ```bash
   cd apps/web
   npm install
   npm run dev
   ```

## 🧪 Testing

### Run All Tests
```bash
dotnet test
```

### Run Specific Test Categories
```bash
# Unit tests only
dotnet test --filter Category=Unit

# Integration tests only
dotnet test --filter Category=Integration

# Generate coverage report
dotnet test --collect:"XPlat Code Coverage"
```

### Frontend Tests
```bash
cd apps/web
npm test           # Run tests once
npm run test:watch # Run in watch mode
```

## 📊 Key Technologies

### Backend (.NET 8)
- **ASP.NET Core 8** - Minimal APIs and dependency injection
- **MediatR** - CQRS pattern implementation
- **FluentValidation** - Input validation
- **Entity Framework Core** - Data access layer
- **Dapper** - High-performance queries
- **SignalR** - Real-time updates
- **xUnit** - Unit and integration testing

### Frontend (Next.js)
- **Next.js 14+** - React framework with App Router
- **TypeScript** - Type-safe JavaScript
- **Tailwind CSS** - Utility-first styling
- **React Query** - Server state management
- **Recharts** - Data visualization
- **React Hook Form** - Form validation

### Infrastructure
- **PostgreSQL** - Primary database
- **Redis** - Caching and session storage  
- **RabbitMQ** - Message broker for events
- **Docker** - Containerization
- **GitHub Actions** - CI/CD pipeline

## 🎓 Educational Features

- **Interactive Payoff Diagrams** - Visual strategy analysis
- **Options Chain Explorer** - Live market data visualization
- **Strategy Templates** - Pre-built spreads with explanations
- **Risk Calculators** - Greeks and scenario modeling
- **Progress Tracking** - Badges and achievement system
- **Parental Controls** - Guardrails for teen accounts

## 🛡️ Security & Compliance

- **Authentication** - JWT-based with refresh tokens
- **Authorization** - Role-based access control
- **Data Protection** - Encrypted sensitive information
- **Audit Logging** - Comprehensive activity tracking
- **Guardrails** - Configurable trading limits for minors
- **Input Validation** - Server-side validation for all inputs

## 📈 Development Roadmap

See our [Product Backlog Items (PBIs)](https://github.com/your-org/tradifai/issues) for planned features:

- ✅ **PBI-001**: Hexagonal Architecture Foundation
- 🚧 **PBI-010**: Market Data Integration
- 📋 **PBI-020**: Options Analytics Engine
- 📋 **PBI-030**: Paper Trading System
- 📋 **PBI-040**: Strategy Recommendation Engine
- 📋 **PBI-050**: API Endpoints & Read Models
- 📋 **PBI-060**: Educational Content System
- 📋 **PBI-070**: Parental Guardrails
- 📋 **PBI-080**: Event Processing Optimization
- 📋 **PBI-090**: Frontend MVP

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please read our [Contributing Guide](CONTRIBUTING.md) and [Code of Conduct](CODE_OF_CONDUCT.md).

## 📚 Documentation

- [Architecture Overview](docs/architecture.md)
- [API Documentation](http://localhost:8080/swagger) (when running)
- [Architectural Decision Records (ADRs)](docs/ADRs/)
- [Development Setup Guide](docs/development.md)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Options pricing models based on Black-Scholes-Merton framework
- Market data visualization inspired by professional trading platforms
- Educational content structure influenced by modern learning management systems

---

**Disclaimer**: This is an educational platform for learning options trading strategies. It does not provide financial advice. All paper trading is simulated and for educational purposes only.