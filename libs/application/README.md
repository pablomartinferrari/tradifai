# Application Layer

This library contains use cases, command/query handlers, and application services that orchestrate domain operations.

## Architecture

The application layer implements the CQRS pattern using MediatR:

- **Commands** - Operations that modify system state
- **Queries** - Operations that retrieve data without side effects
- **Handlers** - Process commands and queries, coordinate domain operations
- **Behaviors** - Cross-cutting concerns like validation, logging, caching

## Structure

### Commands & Queries
- Domain-specific operations grouped by bounded context
- Input validation using FluentValidation
- Authorization checks before execution

### Application Services
- Coordinate multiple domain services
- Manage transactions and unit of work
- Publish domain events to message bus

### DTOs & Mappings
- Data transfer objects for external communication
- Mapping between domain models and DTOs
- API request/response models

## Key Technologies

- MediatR for CQRS implementation
- FluentValidation for input validation
- AutoMapper for object mapping
- Microsoft.Extensions.DependencyInjection for IoC