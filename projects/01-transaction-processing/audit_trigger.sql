CREATE OR REPLACE TRIGGER trg_orders_status_audit
AFTER UPDATE OF order_status ON orders
FOR EACH ROW
WHEN (OLD.order_status <> NEW.order_status)
BEGIN
    INSERT INTO order_audit(
        audit_id, order_id, old_status, new_status, changed_at
    )
    VALUES (
        seq_order_audit.NEXTVAL,
        :NEW.order_id,
        :OLD.order_status,
        :NEW.order_status,
        SYSDATE
    );
END;
/
