# ADR Template

Use this template for creating new Architectural Decision Records.

## ADR-000: [Short noun phrase describing the decision]

### Status

What is the status, such as proposed, accepted, rejected, deprecated, superseded, etc.?

### Context

What is the issue that we're seeing that is motivating this decision or change?

### Decision

What is the change that we're proposing or have agreed to implement?

### Consequences

What becomes easier or more difficult to do and any risks introduced by this change?

---

## Template Usage

1. Copy this template to a new file named `ADR-{number}-{short-description}.md`
2. Replace the placeholders with actual content
3. Number ADRs sequentially (001, 002, etc.)
4. Use short, descriptive titles in kebab-case
5. Keep the status updated as decisions evolve

## Example ADRs

- ADR-001-use-hexagonal-architecture.md
- ADR-002-choose-postgresql-over-mongodb.md  
- ADR-003-implement-cqrs-with-mediatr.md
- ADR-004-use-redis-for-caching.md