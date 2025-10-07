# Identity Domain

This bounded context handles user authentication, authorization, profile management, and parental guardrails for teen accounts.

## Domain Concepts

### Aggregates
- **User** - Base user account with authentication and profile data
- **TeenAccount** - Special account type with parental oversight
- **ParentAccount** - Account with supervisory privileges over teen accounts
- **GuardrailPolicy** - Risk and trading limits for teen accounts

### Value Objects
- **UserId** - Unique user identifier
- **Email** - Validated email address
- **Role** - User permissions (Teen, Parent, Admin)
- **RiskLimit** - Maximum position size, loss limits, strategy restrictions

### Domain Services
- **AuthenticationService** - Login, password management, session handling
- **AuthorizationService** - Permission checks and access control
- **GuardrailEnforcer** - Validates teen account actions against policies

### Domain Events
- **UserRegistered** - New account created
- **GuardrailPolicyUpdated** - Parent modified teen restrictions
- **UnauthorizedActionAttempted** - Teen exceeded guardrail limits
- **ParentNotificationRequired** - Alert parent of teen activity