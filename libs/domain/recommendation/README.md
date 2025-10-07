# Recommendation Domain

This bounded context provides intelligent options strategy recommendations based on market conditions, volatility analysis, and user preferences.

## Domain Concepts

### Aggregates
- **StrategyRecommendation** - Suggested trade with rationale and risk assessment
- **RecommendationCriteria** - User preferences for strategy selection
- **MarketRegime** - Current market conditions affecting recommendations

### Value Objects
- **RecommendationScore** - Confidence rating for suggested strategies
- **MarketBias** - Bullish, Bearish, or Neutral market outlook
- **RiskTolerance** - Conservative, Moderate, or Aggressive risk profile
- **StrategyType** - Directional, Income, or Volatility-based strategies

### Domain Services
- **RecommendationEngine** - Rule-based strategy suggestion logic
- **MarketAnalyzer** - Analyzes current market conditions
- **StrategyFilter** - Filters recommendations by user criteria

### Domain Events
- **StrategyRecommended** - New recommendation generated
- **RecommendationExpired** - Time-sensitive recommendation expired
- **MarketRegimeChanged** - Significant market condition shift detected