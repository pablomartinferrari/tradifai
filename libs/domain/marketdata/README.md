# Market Data Domain

This bounded context handles real-time and historical market data for options chains, underlying assets, and market statistics.

## Domain Concepts

### Aggregates
- **OptionChain** - Complete options chain for an underlying symbol with expiration dates
- **MarketSnapshot** - Point-in-time market data for options and underlying assets
- **HistoricalData** - Time-series data for backtesting and analysis

### Value Objects
- **Symbol** - Ticker symbol with validation
- **Strike** - Option strike price with precision handling
- **Expiration** - Option expiration date with business day logic
- **Quote** - Bid/ask prices with timestamp and volume

### Domain Events
- **ChainUpdated** - Published when option chain data changes
- **MarketOpened** / **MarketClosed** - Trading session events
- **DataFeedConnected** / **DataFeedDisconnected** - Feed status events

### Ports (Interfaces)
- **IMarketDataFeed** - External market data provider abstraction
- **IMarketDataRepository** - Historical data storage
- **IMarketDataPublisher** - Real-time data distribution