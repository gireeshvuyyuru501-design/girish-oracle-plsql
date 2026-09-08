# Girish V — Oracle PL/SQL Portfolio

**Senior Oracle Developer** · PL/SQL · Advanced SQL · Performance Tuning · ETL & Data Migration · Python

![Oracle](https://img.shields.io/badge/Oracle-Database-F80000?logo=oracle&logoColor=white)
![PL/SQL](https://img.shields.io/badge/PL%2FSQL-Packages%20%7C%20Triggers%20%7C%20Cursors-C74634)
![SQL](https://img.shields.io/badge/SQL-CTEs%20%7C%20Analytics%20%7C%20Tuning-336791)
![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB?logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-REST%20API-009688?logo=fastapi&logoColor=white)

Oracle PL/SQL portfolio showcasing advanced SQL, database development, performance tuning, ETL/data migration, and Python/FastAPI integration.

> These are independent technical demonstrations written for this repository. They are **not** employer or client production code, and contain no proprietary data.

---

## Portfolio at a glance

| # | Demonstration | Focus | Code |
|---|---------------|-------|------|
| 1 | Transaction Processing & Reporting | Packages, procedures, functions, audit triggers, analytical reporting SQL | [`projects/01-transaction-processing`](projects/01-transaction-processing) |
| 2 | SQL Performance Tuning Lab | `EXPLAIN PLAN`, sargable predicates, query rewriting, selective indexing | [`projects/02-sql-performance-tuning`](projects/02-sql-performance-tuning) |
| 3 | ETL, Data Migration & Python API | Staging-to-target loads, `MERGE` upserts, reconciliation, FastAPI integration | [`projects/03-etl-data-migration-python`](projects/03-etl-data-migration-python) |

## Repository structure

```text
girish-oracle-plsql/
├── projects/
│   ├── 01-transaction-processing/
│   │   ├── schema.sql              -- tables, constraints, indexes, sequences
│   │   ├── order_pkg.sql           -- package spec + body (procedures, functions)
│   │   ├── audit_trigger.sql       -- trigger-based audit logging
│   │   └── reporting_queries.sql   -- CTEs and analytical functions
│   ├── 02-sql-performance-tuning/
│   │   ├── baseline_query.sql      -- the high-cost starting point
│   │   ├── explain_plan.sql        -- capturing and reading the plan
│   │   ├── optimized_query.sql     -- rewritten, set-based version
│   │   └── indexes.sql             -- selective / composite indexes
│   └── 03-etl-data-migration-python/
│       ├── schema.sql              -- staging and target (dimension) tables
│       ├── etl_package.sql         -- PL/SQL ETL: cleanse, validate, MERGE
│       ├── reconciliation.sql      -- source-to-target row and value checks
│       ├── app.py                  -- FastAPI service over the target schema
│       └── requirements.txt
└── tests/
    └── test_portfolio_structure.py -- validates the portfolio layout
```

---

## 1. Transaction Processing & Reporting

A compact Oracle design for processing orders and reporting on them.

**Demonstrates:** table design with constraints, indexes and sequences · package specification and body · procedure and function design · exception handling · trigger-based audit logging · reporting SQL with CTEs and analytical functions.

[`schema.sql`](projects/01-transaction-processing/schema.sql) · [`order_pkg.sql`](projects/01-transaction-processing/order_pkg.sql) · [`audit_trigger.sql`](projects/01-transaction-processing/audit_trigger.sql) · [`reporting_queries.sql`](projects/01-transaction-processing/reporting_queries.sql)

## 2. SQL Performance Tuning Lab

A tuning workflow taken end to end on a deliberately slow query.

1. Identify a high-cost query.
2. Capture the execution plan with `EXPLAIN PLAN`.
3. Remove functions from indexed predicates so they stay sargable.
4. Replace correlated, row-by-row work with set-based aggregation.
5. Add selective indexes that match the join and filter patterns.
6. Re-check the execution plan and compare.

[`baseline_query.sql`](projects/02-sql-performance-tuning/baseline_query.sql) · [`explain_plan.sql`](projects/02-sql-performance-tuning/explain_plan.sql) · [`optimized_query.sql`](projects/02-sql-performance-tuning/optimized_query.sql) · [`indexes.sql`](projects/02-sql-performance-tuning/indexes.sql)

## 3. ETL, Data Migration & Python API

A staging-to-target migration pattern with validation, reconciliation and a REST layer.

**Demonstrates:** staging and target table design · PL/SQL ETL package · data cleansing and validation · `MERGE`-based upsert · reconciliation SQL · Python/FastAPI database integration with bind variables.

[`schema.sql`](projects/03-etl-data-migration-python/schema.sql) · [`etl_package.sql`](projects/03-etl-data-migration-python/etl_package.sql) · [`reconciliation.sql`](projects/03-etl-data-migration-python/reconciliation.sql) · [`app.py`](projects/03-etl-data-migration-python/app.py)

---

## Running the demonstrations

**Oracle objects** — connect to a demo schema (Oracle Database XE or any 19c+ instance) in SQL*Plus or SQL Developer and run the scripts in order:

```sql
@projects/01-transaction-processing/schema.sql
@projects/01-transaction-processing/order_pkg.sql
@projects/01-transaction-processing/audit_trigger.sql
```

**Python / FastAPI service** — from `projects/03-etl-data-migration-python`:

```bash
python -m venv .venv
.venv\Scripts\activate          # macOS/Linux: source .venv/bin/activate
pip install -r requirements.txt

set ORACLE_USER=your_user       # macOS/Linux: export ORACLE_USER=...
set ORACLE_PASSWORD=your_password
set ORACLE_DSN=host:1521/service_name

uvicorn app:app --reload
```

Then call `GET /customers/{source_customer_id}`, or open the generated docs at `http://127.0.0.1:8000/docs`.

**Structure check:**

```bash
pytest tests/test_portfolio_structure.py
```

---

## Core skills

| Area | Detail |
|------|--------|
| PL/SQL | Stored procedures, functions, packages, triggers, cursors, REF cursors, exception handling |
| Advanced SQL | Complex joins, CTEs, analytical/window functions, set-based rewrites |
| Performance | `EXPLAIN PLAN`, execution-plan analysis, indexing strategy, query optimization |
| Data engineering | ETL design, data migration, cleansing, validation, reconciliation |
| Database engineering | Schema and constraint design, database support, troubleshooting |
| Integration | Python, FastAPI, REST APIs, `oracledb` driver |

<details>
<summary>Keywords</summary>

Oracle Database · Oracle SQL · PL/SQL · SQL Developer · Stored Procedures · Functions · Packages · Triggers · Cursors · REF Cursors · Complex SQL · CTEs · Analytical Functions · EXPLAIN PLAN · Performance Tuning · Indexing · ETL · Data Migration · Data Reconciliation · Python · FastAPI · REST API

</details>

## Profile

**Location:** Greater Houston, Texas  
**Target roles:** Senior Oracle Developer · Oracle PL/SQL Developer · Oracle Database Developer · Oracle Data/ETL Developer

Portfolio demonstrations for technical evaluation and learning purposes.
