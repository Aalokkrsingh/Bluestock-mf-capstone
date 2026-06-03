-- DIMESION TABLES FOR FUND AND DATE

CREATE TABLE dim_fund(
    amfi_code TEXT PRIMARY KEY, 
    fund_house TEXT,
    scheme_name TEXT, 
    category TEXT,
    sub_category TEXT,
    plan TEXT,
    benchmark TEXT,
    expense_ratio_pct REAL,
    risk_category TEXT
);


create table dim_date(
    date_id INTEGER PRIMARY KEY,
    date DATE,
    day INTEGER,
    month INTEGER,
    year INTEGER,
    quarter INTEGER,
    is_weekend INTEGER,
);


-- FACT TABLES

CREATE TABLE fact_nav (
    nav_id INTEGER PRIMARY KEY AUTOINCREMENT,
    amfi_code TEXT,
    nav_date DATE,
    nav REAL,
    FOREIGN KEY (amfi_code) 
       REFERENCES dim_fund(amfi_code), 
);


CREATE TABLE fact_transaction (
    tx_id INTEGER PRIMARY KEY AUTOINCREMENT,
    investor_id TEXT,
    amfi_code TEXT,
    transaction_date DATE,
    transaction_type TEXT,
    amount_inr REAL,
    state TEXT,
    city TEXT,
    age_group TEXT,
    gender TEXT,
    kyc_status TEXT,
    FOREIGN KEY (amfi_code)
        REFERENCES dim_fund(amfi_code)
);


CREATE TABLE fact_performance (
    perf_id INTEGER PRIMARY KEY AUTOINCREMENT,
    amfi_code TEXT,
    return_1yr_pct REAL,
    return_3yr_pct REAL,
    return_5yr_pct REAL,
    alpha REAL,
    beta REAL,
    sharpe_ratio REAL,
    sortino_ratio REAL,
    max_drawdown_pct REAL,
    FOREIGN KEY (amfi_code)
        REFERENCES dim_fund(amfi_code)
);