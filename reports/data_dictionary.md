# Data Dictionary

* **Prepared By:** Aalok Kumar Singh
* **Date:** June 2, 2026

## Overview

This document describes the datasets, columns, data types, and meanings used in the Bluestock Mutual Fund Analytics Capstone Project.

---

# 1. dim_fund

Description:
Contains master information about all mutual fund schemes.

| Column Name       | Data Type | Description                                   |
| ----------------- | --------- | --------------------------------------------- |
| amfi_code         | TEXT      | Unique AMFI scheme code                       |
| fund_house        | TEXT      | Mutual fund company name                      |
| scheme_name       | TEXT      | Full mutual fund scheme name                  |
| category          | TEXT      | Fund category (Equity/Debt/Hybrid)            |
| sub_category      | TEXT      | Specific fund type (Large Cap, Mid Cap, etc.) |
| plan              | TEXT      | Direct or Regular plan                        |
| benchmark         | TEXT      | Benchmark index                               |
| expense_ratio_pct | REAL      | Annual expense ratio percentage               |
| risk_category     | TEXT      | SEBI risk classification                      |

---

# 2. fact_nav

Description:
Stores historical NAV values for all schemes.

| Column Name | Data Type | Description             |
| ----------- | --------- | ----------------------- |
| amfi_code   | TEXT      | Mutual fund scheme code |
| nav_date    | DATE      | NAV date                |
| nav         | REAL      | Net Asset Value         |

---

# 3. fact_transactions

Description:
Contains investor transaction records.

| Column Name      | Data Type | Description               |
| ---------------- | --------- | ------------------------- |
| investor_id      | TEXT      | Unique investor ID        |
| amfi_code        | TEXT      | Mutual fund code          |
| transaction_date | DATE      | Transaction date          |
| transaction_type | TEXT      | SIP/Lumpsum/Redemption    |
| amount_inr       | REAL      | Transaction amount in INR |
| state            | TEXT      | Investor state            |
| city             | TEXT      | Investor city             |
| age_group        | TEXT      | Investor age category     |
| gender           | TEXT      | Investor gender           |
| kyc_status       | TEXT      | KYC verification status   |

---

# 4. fact_performance

Description:
Contains mutual fund performance metrics.

| Column Name      | Data Type | Description                   |
| ---------------- | --------- | ----------------------------- |
| amfi_code        | TEXT      | Mutual fund scheme code       |
| return_1yr_pct   | REAL      | 1-year return percentage      |
| return_3yr_pct   | REAL      | 3-year CAGR                   |
| return_5yr_pct   | REAL      | 5-year CAGR                   |
| alpha            | REAL      | Risk-adjusted excess return   |
| beta             | REAL      | Market sensitivity            |
| sharpe_ratio     | REAL      | Risk-adjusted return metric   |
| sortino_ratio    | REAL      | Downside risk-adjusted return |
| max_drawdown_pct | REAL      | Maximum historical decline    |

---

# Data Sources

* AMFI India
* mfapi.in
* NSE/BSE public datasets
* Simulated investor transaction datasets

---

# Notes

* Missing NAV values were forward-filled.
* Duplicate records were removed during cleaning.
* Invalid transaction amounts were filtered out.
* Dates were converted to datetime format.
* This database schema was designed for analytical querying and dashboard integration using SQLite and Power BI.
