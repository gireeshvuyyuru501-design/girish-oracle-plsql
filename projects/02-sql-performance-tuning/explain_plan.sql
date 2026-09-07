EXPLAIN PLAN FOR
SELECT
    o.customer_id,
    COUNT(*) AS order_count
FROM orders o
WHERE o.order_date >= DATE '2026-09-01'
  AND o.order_date < DATE '2026-09-02'
  AND o.order_status = 'COMPLETE'
GROUP BY o.customer_id;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
