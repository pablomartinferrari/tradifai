# Tests

This directory contains all automated tests for the Tradifai platform.

## Structure

- **unit/** - Unit tests for individual classes and methods
- **integration/** - Integration tests for system components and external dependencies

## Test Strategy

### Unit Tests
- Fast, isolated tests for domain logic
- Mock external dependencies
- High code coverage for business rules
- Property-based testing for complex calculations

### Integration Tests
- Test database interactions with test containers
- API endpoint testing with WebApplicationFactory
- Message bus integration testing
- External service contract validation

## Running Tests

```bash
# Run all tests
dotnet test

# Run only unit tests
dotnet test --filter Category=Unit

# Run only integration tests
dotnet test --filter Category=Integration

# Generate coverage report
dotnet test --collect:"XPlat Code Coverage"
```

## Test Libraries

- xUnit for test framework
- FluentAssertions for readable assertions
- Moq for mocking dependencies
- Testcontainers for integration testing
- Bogus for test data generation