# Contracts Library

This library contains shared DTOs, domain events, and message contracts used for communication between bounded contexts and external systems.

## Structure

### Domain Events
- **MarketData** - ChainUpdated, MarketOpened, DataFeedConnected events
- **Trading** - OrderPlaced, OrderFilled, PositionChanged events
- **Education** - LessonCompleted, BadgeEarned, ProgressUpdated events
- **Identity** - UserRegistered, GuardrailViolated, PolicyUpdated events

### Data Transfer Objects (DTOs)
- **API Requests/Responses** - HTTP endpoint contracts
- **Query Results** - Read model projections
- **Command Payloads** - Input validation models

### Integration Events
- **Message Bus Contracts** - Inter-service communication
- **Webhook Payloads** - External system notifications
- **Event Sourcing** - Event store schemas

## Principles

- **Immutable** - All DTOs and events are immutable value objects
- **Versioned** - Support for schema evolution and backward compatibility
- **Validated** - Input validation attributes for API contracts
- **Serializable** - JSON/XML serialization support for messaging

## Usage

This library is referenced by:
- API layer for request/response models
- Application layer for command/query DTOs
- Infrastructure layer for event publishing
- Frontend applications for API integration