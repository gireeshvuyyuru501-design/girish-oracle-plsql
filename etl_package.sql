CREATE OR REPLACE PACKAGE customer_etl_pkg AS
    PROCEDURE load_customers;
END customer_etl_pkg;
/

CREATE OR REPLACE PACKAGE BODY customer_etl_pkg AS
    PROCEDURE load_customers AS
    BEGIN
        UPDATE stg_customer
           SET load_status = 'ERROR',
               load_error = 'Missing source customer id or customer name'
         WHERE source_customer_id IS NULL
            OR TRIM(customer_name) IS NULL;

        MERGE INTO dim_customer d
        USING (
            SELECT
                source_customer_id,
                TRIM(customer_name) AS customer_name,
                LOWER(TRIM(email)) AS email,
                source_updated_at
            FROM stg_customer
            WHERE NVL(load_status, 'READY') <> 'ERROR'
        ) s
        ON (d.source_customer_id = s.source_customer_id)
        WHEN MATCHED THEN UPDATE SET
            d.customer_name = s.customer_name,
            d.email = s.email,
            d.source_updated_at = s.source_updated_at,
            d.warehouse_updated_at = SYSDATE
        WHEN NOT MATCHED THEN INSERT (
            customer_id,
            source_customer_id,
            customer_name,
            email,
            source_updated_at,
            warehouse_updated_at
        ) VALUES (
            seq_dim_customer.NEXTVAL,
            s.source_customer_id,
            s.customer_name,
            s.email,
            s.source_updated_at,
            SYSDATE
        );

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END load_customers;
END customer_etl_pkg;
/
