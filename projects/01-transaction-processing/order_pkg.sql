CREATE OR REPLACE PACKAGE order_pkg AS
    PROCEDURE create_order(
        p_customer_id IN NUMBER,
        p_order_id OUT NUMBER
    );

    PROCEDURE add_order_item(
        p_order_id IN NUMBER,
        p_product_code IN VARCHAR2,
        p_quantity IN NUMBER,
        p_unit_price IN NUMBER
    );

    FUNCTION get_order_total(
        p_order_id IN NUMBER
    ) RETURN NUMBER;
END order_pkg;
/

CREATE OR REPLACE PACKAGE BODY order_pkg AS
    PROCEDURE create_order(
        p_customer_id IN NUMBER,
        p_order_id OUT NUMBER
    ) AS
    BEGIN
        p_order_id := seq_order.NEXTVAL;
        INSERT INTO orders(order_id, customer_id, order_status, order_date)
        VALUES (p_order_id, p_customer_id, 'NEW', SYSDATE);
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Unable to create order: ' || SQLERRM);
    END create_order;

    PROCEDURE add_order_item(
        p_order_id IN NUMBER,
        p_product_code IN VARCHAR2,
        p_quantity IN NUMBER,
        p_unit_price IN NUMBER
    ) AS
    BEGIN
        IF p_quantity <= 0 OR p_unit_price < 0 THEN
            RAISE_APPLICATION_ERROR(-20003, 'Invalid quantity or unit price.');
        END IF;

        INSERT INTO order_items(
            order_item_id, order_id, product_code, quantity, unit_price
        )
        VALUES (
            seq_order_item.NEXTVAL, p_order_id, p_product_code, p_quantity, p_unit_price
        );
    END add_order_item;

    FUNCTION get_order_total(
        p_order_id IN NUMBER
    ) RETURN NUMBER AS
        v_total NUMBER;
    BEGIN
        SELECT NVL(SUM(quantity * unit_price), 0)
          INTO v_total
          FROM order_items
         WHERE order_id = p_order_id;

        RETURN v_total;
    END get_order_total;
END order_pkg;
/
