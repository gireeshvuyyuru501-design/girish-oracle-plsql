WITH order_totals AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    GROUP BY o.order_id, o.customer_id, o.order_date
)
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(ot.order_id) AS order_count,
    SUM(ot.order_total) AS total_spend,
    AVG(ot.order_total) AS average_order_value
FROM customers c
LEFT JOIN order_totals ot ON ot.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC NULLS LAST;
