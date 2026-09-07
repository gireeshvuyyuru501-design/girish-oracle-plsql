# SQL Performance Tuning Lab

**Portfolio demonstration — not employer/client production code.**

This project illustrates a practical Oracle SQL tuning workflow.

## Workflow
1. Identify a high-cost query.
2. Capture the execution plan with `EXPLAIN PLAN`.
3. Remove functions from indexed predicates where possible.
4. Replace correlated row-by-row work with set-based aggregation.
5. Add selective indexes that match join/filter patterns.
6. Re-check the execution plan.

## Key concepts
`EXPLAIN PLAN` · execution-plan analysis · sargable predicates · composite indexes · query rewriting · aggregation before join
