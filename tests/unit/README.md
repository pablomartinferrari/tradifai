# Unit Tests

Fast, isolated tests for individual classes and methods without external dependencies.

## Organization

Tests are organized by bounded context matching the domain structure:

```
unit/
├── Domain/
│   ├── MarketData/
│   ├── OptionsAnalytics/
│   ├── PaperBroker/
│   ├── Recommendation/
│   ├── Education/
│   └── Identity/
├── Application/
└── Infrastructure/
```

## Test Principles

- **Fast** - Tests complete in milliseconds
- **Isolated** - No external dependencies (database, network, file system)
- **Repeatable** - Consistent results across environments
- **Self-Validating** - Clear pass/fail with descriptive error messages
- **Timely** - Written alongside production code (TDD encouraged)

## Domain Test Patterns

- **Aggregate Tests** - Verify business rules and invariants
- **Value Object Tests** - Test immutability and equality
- **Domain Service Tests** - Complex business logic validation
- **Event Tests** - Domain event publication and handling

## Example Structure

```csharp
public class PortfolioTests
{
    [Fact]
    public void AddPosition_WithValidOrder_ShouldIncreasePositionCount() { }
    
    [Theory]
    [InlineData(-1000, 500)] // Exceeds loss limit
    public void PlaceOrder_ViolatingGuardrails_ShouldThrowException(decimal currentPnL, decimal orderValue) { }
}
```