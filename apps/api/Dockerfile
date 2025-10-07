# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project files for restore
COPY apps/api/Tradifai.Api/*.csproj ./apps/api/Tradifai.Api/
COPY libs/domain/marketdata/Tradifai.Domain.MarketData/*.csproj ./libs/domain/marketdata/Tradifai.Domain.MarketData/
COPY libs/domain/options-analytics/Tradifai.Domain.OptionsAnalytics/*.csproj ./libs/domain/options-analytics/Tradifai.Domain.OptionsAnalytics/
COPY libs/domain/paper-broker/Tradifai.Domain.PaperBroker/*.csproj ./libs/domain/paper-broker/Tradifai.Domain.PaperBroker/
COPY libs/domain/recommendation/Tradifai.Domain.Recommendation/*.csproj ./libs/domain/recommendation/Tradifai.Domain.Recommendation/
COPY libs/domain/education/Tradifai.Domain.Education/*.csproj ./libs/domain/education/Tradifai.Domain.Education/
COPY libs/domain/identity/Tradifai.Domain.Identity/*.csproj ./libs/domain/identity/Tradifai.Domain.Identity/
COPY libs/application/Tradifai.Application/*.csproj ./libs/application/Tradifai.Application/
COPY libs/infrastructure/Tradifai.Infrastructure/*.csproj ./libs/infrastructure/Tradifai.Infrastructure/
COPY libs/contracts/Tradifai.Contracts/*.csproj ./libs/contracts/Tradifai.Contracts/

# Restore dependencies for API project only
WORKDIR /src/apps/api/Tradifai.Api
RUN dotnet restore

# Copy source code
WORKDIR /src
COPY apps/ ./apps/
COPY libs/ ./libs/

# Build the application
WORKDIR /src/apps/api/Tradifai.Api
RUN dotnet build -c Release -o /app/build --no-restore

# Publish stage
FROM build AS publish
RUN dotnet publish -c Release -o /app/publish --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Create logs directory
RUN mkdir -p /app/logs

# Copy published app
COPY --from=publish /app/publish .

# Create non-root user for security
RUN adduser --disabled-password --home /app --gecos '' appuser && chown -R appuser /app
USER appuser

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

ENTRYPOINT ["dotnet", "Tradifai.Api.dll"]