# Libraries

Shared libraries implementing domain-driven design principles for the Tradifai platform.

## Structure

### Domain Libraries
- **marketdata/** - Market data aggregates, value objects, and domain services
- **options-analytics/** - Options pricing, Greeks calculations, and payoff analysis
- **paper-broker/** - Portfolio management, order lifecycle, and execution simulation
- **recommendation/** - Strategy recommendation engine with rule-based logic
- **education/** - Educational content, tutorials, quizzes, and progress tracking
- **identity/** - User management, authentication, and authorization

### Cross-Cutting Libraries
- **application/** - Use cases, MediatR handlers, and application services
- **infrastructure/** - Data access, external service adapters, and infrastructure concerns
- **contracts/** - DTOs, domain events, and shared message contracts

## Principles

Each domain library follows DDD principles:
- Rich domain models with behavior
- Domain events for cross-bounded context communication
- Repository patterns for data access abstraction
- Domain services for complex business logic