# Integration Tests

Tests that verify system components working together with real or realistic external dependencies.

## Test Categories

### API Integration Tests
- Full HTTP request/response cycle testing
- Authentication and authorization flows
- Input validation and error handling
- OpenAPI specification validation

### Database Integration Tests
- Entity Framework migrations and configurations
- Repository pattern implementations
- Complex queries and performance validation
- Transaction handling and concurrency

### Message Bus Integration Tests
- Event publishing and subscription
- Message serialization/deserialization
- Dead letter queue handling
- Event ordering and duplicate detection

### External Service Integration Tests
- Market data provider contract validation
- Third-party API integration testing
- Circuit breaker and retry policies
- Service availability and failover scenarios

## Test Infrastructure

### Test Containers
- PostgreSQL container for database tests
- Redis container for caching tests
- RabbitMQ container for messaging tests
- Isolated test environments per test class

### Test Configuration
- Separate connection strings and settings
- Environment-specific feature flags
- Mock external services with WireMock
- Test data seeding and cleanup

## Running Integration Tests

```bash
# Ensure Docker is running for test containers
docker --version

# Run integration tests
dotnet test --filter Category=Integration

# Run specific test class
dotnet test --filter FullyQualifiedName~MarketDataIntegrationTests
```