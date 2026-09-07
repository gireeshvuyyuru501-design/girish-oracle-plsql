SELECT
    (SELECT COUNT(*)
       FROM stg_customer
      WHERE NVL(load_status, 'READY') <> 'ERROR') AS valid_stage_rows,
    (SELECT COUNT(*)
       FROM dim_customer) AS target_rows
FROM dual;

SELECT s.source_customer_id
FROM stg_customer s
LEFT JOIN dim_customer d
  ON d.source_customer_id = s.source_customer_id
WHERE NVL(s.load_status, 'READY') <> 'ERROR'
  AND d.source_customer_id IS NULL;
