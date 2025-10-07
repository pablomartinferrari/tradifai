# Options Analytics Domain

This bounded context provides options pricing models, Greeks calculations, payoff analysis, and risk metrics for trading strategies.

## Domain Concepts

### Aggregates
- **Strategy** - Multi-leg options strategy with legs, P&L calculations
- **PayoffProfile** - Profit/loss analysis across price and time scenarios
- **VolatilityModel** - Implied volatility calculations and rankings

### Value Objects
- **Greeks** - Delta, Gamma, Theta, Vega, Rho calculations
- **Leg** - Individual option position (calls/puts, long/short)
- **PriceScenario** - Underlying price points for payoff analysis
- **IVRank** - Implied volatility percentile ranking

### Domain Services
- **BlackScholesCalculator** - Option pricing using Black-Scholes model
- **PayoffCalculator** - Multi-leg strategy P&L analysis
- **VolatilityAnalyzer** - IV rank and volatility metrics

### Domain Events
- **StrategyAnalyzed** - Published when payoff analysis completes
- **VolatilityUpdated** - IV rank changes for monitored symbols