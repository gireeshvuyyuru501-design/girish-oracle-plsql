CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150),
    created_at DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    order_status VARCHAR2(20) DEFAULT 'NEW' NOT NULL,
    order_date DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    product_code VARCHAR2(30) NOT NULL,
    quantity NUMBER NOT NULL CHECK (quantity > 0),
    unit_price NUMBER(12,2) NOT NULL CHECK (unit_price >= 0),
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE order_audit (
    audit_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    old_status VARCHAR2(20),
    new_status VARCHAR2(20),
    changed_at DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE seq_order START WITH 1001 INCREMENT BY 1;
CREATE SEQUENCE seq_order_item START WITH 5001 INCREMENT BY 1;
CREATE SEQUENCE seq_order_audit START WITH 9001 INCREMENT BY 1;

CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);
CREATE INDEX idx_order_items_order ON order_items(order_id);
