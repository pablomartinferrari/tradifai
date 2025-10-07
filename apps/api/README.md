# Tradifai API

.NET 8 Web API implementing hexagonal architecture with domain-driven design principles.

## Architecture

This API follows hexagonal (ports and adapters) architecture:

- **Domain Core**: Pure business logic isolated from external concerns
- **Application Layer**: Use cases and command/query handlers using MediatR
- **Infrastructure Adapters**: Data access, external services, and cross-cutting concerns
- **Web Adapters**: Controllers, minimal APIs, and web-specific concerns

## Key Technologies

- .NET 8 with minimal APIs
- MediatR for CQRS pattern
- FluentValidation for input validation
- Entity Framework Core for data access
- Dapper for performance-critical queries

## Getting Started

```bash
cd apps/api
dotnet run
```

The API will be available at `https://localhost:5001` with Swagger documentation at `/swagger`.