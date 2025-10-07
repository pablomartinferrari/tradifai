# Apps

This directory contains the main applications of the Tradifai monorepo.

## Structure

- **api/** - .NET 8 Web API implementing hexagonal architecture with domain-driven design
- **web/** - Next.js frontend application with TypeScript and App Router

Each application is designed to be independently deployable while sharing common domain and infrastructure libraries from the `libs/` directory.