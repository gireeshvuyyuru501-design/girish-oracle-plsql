SELECT
    o.customer_id,
    COUNT(*) AS order_count,
    SUM(
        (SELECT SUM(oi.quantity * oi.unit_price)
           FROM order_items oi
          WHERE oi.order_id = o.order_id)
    ) AS total_value
FROM orders o
WHERE TRUNC(o.order_date) = DATE '2026-09-01'
  AND o.order_status = 'COMPLETE'
GROUP BY o.customer_id;
