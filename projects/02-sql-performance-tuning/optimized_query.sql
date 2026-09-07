WITH item_totals AS (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM order_items
    GROUP BY order_id
)
SELECT
    o.customer_id,
    COUNT(*) AS order_count,
    SUM(it.order_total) AS total_value
FROM orders o
JOIN item_totals it ON it.order_id = o.order_id
WHERE o.order_date >= DATE '2026-09-01'
  AND o.order_date < DATE '2026-09-02'
  AND o.order_status = 'COMPLETE'
GROUP BY o.customer_id;
