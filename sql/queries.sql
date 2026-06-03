-- Query 1 - Top 5 Funds By Expense Ratio

SELECT
    scheme_name,
    expense_ratio_pct
FROM dim_fund
ORDER BY expense_ratio_pct DESC
LIMIT 5;

-- Query 2 - Average NAV By AMFI Code

SELECT
    amfi_code,
    AVG(nav) AS avg_nav
FROM fact_nav
GROUP BY amfi_code;

-- Query 3 - Total Transactions By State

SELECT
    state,
    COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- Query 4 - Funds With Expense Ratio Below 1%

SELECT
    scheme_name,
    expense_ratio_pct
FROM dim_fund
WHERE expense_ratio_pct < 1;

-- Query 5 - Average Sharpe Ratio

SELECT
    AVG(sharpe_ratio) AS avg_sharpe
FROM fact_performance;

-- Query 6 - Total Investment Amount

SELECT
    SUM(amount_inr) AS total_investment
FROM fact_transactions;

-- Query 7 Transactions By Type

SELECT
    transaction_type,
    COUNT(*) AS total_count
FROM fact_transactions
GROUP BY transaction_type;

-- Query 8 - Top 5 Funds By 3-Year Return

SELECT
    amfi_code,
    return_3yr_pct
FROM fact_performance
ORDER BY return_3yr_pct DESC
LIMIT 5;

-- Query 9 - Risk Categories 

SELECT
    risk_category,
    COUNT(*) AS total_funds
FROM dim_fund
GROUP BY risk_category;

-- Query 10 - Average Transaction Amount By State

SELECT
    state,
    AVG(amount_inr) AS avg_amount
FROM fact_transactions
GROUP BY state
ORDER BY avg_amount DESC;