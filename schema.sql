CREATE TABLE stg_customer (
    source_customer_id VARCHAR2(50),
    customer_name VARCHAR2(100),
    email VARCHAR2(150),
    source_updated_at DATE,
    load_status VARCHAR2(20),
    load_error VARCHAR2(4000)
);

CREATE TABLE dim_customer (
    customer_id NUMBER PRIMARY KEY,
    source_customer_id VARCHAR2(50) NOT NULL UNIQUE,
    customer_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150),
    source_updated_at DATE,
    warehouse_updated_at DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE seq_dim_customer START WITH 1 INCREMENT BY 1;
