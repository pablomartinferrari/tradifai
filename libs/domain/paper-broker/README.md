# Paper Broker Domain

This bounded context manages simulated trading portfolios, order lifecycle, and execution simulation for educational and testing purposes.

## Domain Concepts

### Aggregates
- **Portfolio** - Root aggregate managing positions, cash, and risk metrics
- **Order** - Order lifecycle from placement to execution or cancellation
- **Position** - Individual option or equity holdings with P&L tracking

### Value Objects
- **OrderId** - Unique identifier for orders
- **Quantity** - Position size with validation
- **OrderType** - Market, Limit, Stop orders
- **OrderStatus** - New, Working, Filled, Canceled, Rejected

### Domain Services
- **ExecutionEngine** - Simulates order fills based on market data
- **PortfolioCalculator** - Real-time P&L and risk calculations
- **GuardrailValidator** - Pre-trade risk and policy validation

### Domain Events
- **OrderPlaced** - New order submitted to system
- **OrderFilled** - Order execution completed
- **PositionOpened** / **PositionClosed** - Position lifecycle events
- **GuardrailViolated** - Risk limit or policy violation detected

### Ports (Interfaces)
- **IPaperExecutionVenue** - Simulated order execution
- **IPortfolioRepository** - Portfolio persistence
- **IRiskCalculator** - Portfolio risk metrics