import os
from fastapi import FastAPI, HTTPException

app = FastAPI(title="Oracle Customer API", version="1.0.0")


def get_connection():
    import oracledb
    return oracledb.connect(
        user=os.environ["ORACLE_USER"],
        password=os.environ["ORACLE_PASSWORD"],
        dsn=os.environ["ORACLE_DSN"],
    )


@app.get("/customers/{source_customer_id}")
def get_customer(source_customer_id: str):
    sql = """
        SELECT source_customer_id, customer_name, email, source_updated_at
        FROM dim_customer
        WHERE source_customer_id = :source_customer_id
    """

    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute(sql, source_customer_id=source_customer_id)
            row = cursor.fetchone()

    if row is None:
        raise HTTPException(status_code=404, detail="Customer not found")

    return {
        "source_customer_id": row[0],
        "customer_name": row[1],
        "email": row[2],
        "source_updated_at": row[3],
    }
