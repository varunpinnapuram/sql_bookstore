# Bookstore Inventory (SQL) — Portfolio Project

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)]()
[![SQLite](https://img.shields.io/badge/DB-SQLite-orange.svg)]()

## Summary
A compact relational database schema for a small bookstore, with sample data and example queries designed to demonstrate:
- Schema design and normalization
- Primary/foreign keys and constraints
- Joins, aggregation, indexing and transactions
- Writing clear documentation suitable for a GitHub portfolio

## Files
- `bookstore.sql` — schema + sample data (SQLite-compatible)
- `sample_queries.sql` — useful queries to run against the database
- `screenshot.png` — simple visual preview
- `.github/workflows/sql-check.yml` — CI workflow to validate schema runs in SQLite
- `README.md`

## Quick start (local)
```bash
# create SQLite DB and import schema
sqlite3 bookstore.db < bookstore.sql

# run example queries (prints results)
sqlite3 -header -column bookstore.db < sample_queries.sql
```

## Example outputs
1. List of books with authors (example row):
```
book_id|title               |author          |price |stock
1      |1984                |George Orwell   |9.99  |12
```

2. Low stock books:
```
title               |stock
Pride and Prejudice |3
Animal Farm         |5
```

## CI checks (GitHub Actions)
The included workflow runs on push and pull_request: it installs `sqlite3` and tries to execute `bookstore.sql` and `sample_queries.sql`. If SQL execution fails the CI will fail.

## Customize license
Replace `Your Name` in `LICENSE` with your real name and optionally add an email in the README.

