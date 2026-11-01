#!/bin/bash
set -e

# Start PostgreSQL
service postgresql start

# Wait until PostgreSQL is ready
until su - postgres -c "pg_isready" > /dev/null 2>&1; do
	sleep 1
done

# Create the database if it doesn't exist
su - postgres -c "psql -tc \"SELECT 1 FROM pg_database WHERE datname = 'sql_injection'\"" \
	| grep -q 1 || su - postgres -c "createdb sql_injection"

# Execute the database setup SQL
su - postgres -c "psql -v ON_ERROR_STOP=1 -d sql_injection -f /sql-injection-demo/schema.sql"

echo "Database setup complete."
