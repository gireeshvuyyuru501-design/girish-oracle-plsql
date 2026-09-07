from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED = [
    "README.md",
    "projects/01-transaction-processing/order_pkg.sql",
    "projects/02-sql-performance-tuning/optimized_query.sql",
    "projects/03-etl-data-migration-python/etl_package.sql",
    "projects/03-etl-data-migration-python/app.py",
]

def test_required_files_exist():
    missing = [path for path in REQUIRED if not (ROOT / path).exists()]
    assert not missing, f"Missing required files: {missing}"

def test_disclosure_present():
    text = (ROOT / "README.md").read_text(encoding="utf-8").lower()
    assert "portfolio demonstrations" in text
    assert "not presented as employer or client production code" in text

def test_recruiter_keywords_present():
    text = (ROOT / "README.md").read_text(encoding="utf-8")
    for keyword in ["PL/SQL", "Performance Tuning", "ETL", "Data Migration", "Python"]:
        assert keyword in text
