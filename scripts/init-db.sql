-- Tradifai Database Initialization Script
-- This script sets up the initial database schema for development

-- Create application user with limited privileges
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'tradifai_app') THEN
        CREATE ROLE tradifai_app WITH LOGIN PASSWORD 'tradifai123';
    END IF;
END $$;

-- Grant necessary permissions
GRANT CONNECT ON DATABASE tradifai TO tradifai_app;
GRANT USAGE ON SCHEMA public TO tradifai_app;
GRANT CREATE ON SCHEMA public TO tradifai_app;

-- Create audit table for tracking changes
CREATE TABLE IF NOT EXISTS audit_log (
    id BIGSERIAL PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    operation VARCHAR(10) NOT NULL,
    old_values JSONB,
    new_values JSONB,
    changed_by VARCHAR(255),
    changed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create event store table for domain events
CREATE TABLE IF NOT EXISTS domain_events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    aggregate_id UUID NOT NULL,
    aggregate_type VARCHAR(255) NOT NULL,
    event_type VARCHAR(255) NOT NULL,
    event_data JSONB NOT NULL,
    event_version INTEGER NOT NULL DEFAULT 1,
    occurred_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    processed_at TIMESTAMP WITH TIME ZONE
);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_domain_events_aggregate ON domain_events(aggregate_id);
CREATE INDEX IF NOT EXISTS idx_domain_events_type ON domain_events(event_type);
CREATE INDEX IF NOT EXISTS idx_domain_events_occurred ON domain_events(occurred_at);
CREATE INDEX IF NOT EXISTS idx_domain_events_processed ON domain_events(processed_at) WHERE processed_at IS NULL;

-- Create read model tables (will be managed by EF Core migrations)
-- These are placeholder comments for the main bounded contexts:

-- Market Data Read Models
-- - OptionChains
-- - MarketSnapshots
-- - SymbolMetadata

-- Portfolio Read Models
-- - Portfolios
-- - Positions
-- - Orders
-- - Transactions

-- Education Read Models
-- - Courses
-- - UserProgress
-- - Achievements

-- Analytics Read Models
-- - StrategyAnalysis
-- - PerformanceMetrics
-- - RiskMetrics

COMMIT;