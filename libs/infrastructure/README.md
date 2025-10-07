# Infrastructure Layer

This library provides concrete implementations of domain ports and handles external system integration.

## Responsibilities

### Data Access
- Entity Framework Core for relational data
- Dapper for high-performance queries
- Repository pattern implementations
- Database migrations and seeding

### External Services
- Market data provider integrations
- Message bus implementations (ServiceBus, RabbitMQ)
- Caching with Redis
- Email and notification services

### Cross-Cutting Concerns
- Logging and monitoring
- Configuration management
- Health checks
- Background services and hosted services

## Structure

### Adapters
- **Persistence** - EF Core DbContext, repositories, configurations
- **MessageBus** - Event publishing and subscription handlers
- **ExternalApis** - HTTP clients for third-party services
- **Caching** - Redis and in-memory cache implementations

### Configuration
- Dependency injection container setup
- Database connection strings
- External service endpoints
- Feature flags and environment settings

## Key Technologies

- Entity Framework Core 8
- Dapper for optimized queries
- Azure Service Bus / RabbitMQ
- Redis for distributed caching
- Polly for resilience patterns