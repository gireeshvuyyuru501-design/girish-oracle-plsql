CREATE INDEX idx_orders_status_date
    ON orders(order_status, order_date);

CREATE INDEX idx_order_items_order
    ON order_items(order_id);
