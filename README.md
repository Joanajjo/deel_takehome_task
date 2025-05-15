# DEEL Take-Home Task – Joana Jo
This repository contains the deliverables for the DEEL take-home analytics challenge. It includes data transformations using dbt (on Snowflake), SQL analysis, and a business presentation summarizing key insights and recommendations.
---
## 📌 Task Overview
Deel clients can fund their accounts using credit and debit cards, processed via Globepay. Deel is experiencing a **decline in acceptance rates** for these payments.
As an analytics candidate, your challenge is to investigate this issue and provide insights, SQL solutions, and data modeling strategies.
---
## 📊 Task #1 – Analytics & Recommendations
Prepare a report (presentation/PDF) that:
- 📉 Presents the **volume of declined payments in USD**
- 🔍 Analyzes **root causes** for the decline in the acceptance rate
- 💡 Provides **recommendations** and **next steps** based on available data, and outlines what you'd do with more time or deeper business context
Deliverable: **Presentation with charts, root cause analysis, and strategic insights**
---
## 🧮 Task #2 – SQL-Based Analysis
Using SQL (dbt models), answer:
1. 📈 **Acceptance Rate Over Time**  
  Trend analysis using transactional timestamps
2. 🌍 **Countries with >$25M in Declined Transactions (USD)**  
  Aggregated and filtered by country
3. ❗ **Transactions Missing Chargeback Data**  
  Left join on external references between acceptance and chargeback datasets
Deliverable: **SQL queries** included as dbt models, viewable in this repo under `models/`
---
## 🏗️ Task #3 – Data Modeling with dbt
Design a production-style data pipeline using dbt. This includes:
- **Source Models**: Raw `acceptance` and `chargeback` data (as if ingested from external systems)
- **Staging Models**: Cleaned and standardized versions (`stg_acceptance`, `stg_chargeback`)
- **Analytics Models**: Final, analysis-ready tables:
 - `fct_transactions`: Core transaction table with normalized amounts
 - `transactions_w_chargeback`: Joins transaction and chargeback info
Deliverable: **Modular dbt models** with documented logic and lineage
---
## 📁 Data Provided
- `acceptance.csv` – Credit/debit transaction data  
- `chargeback.csv` – Chargeback records  
- `globepay_api.html` – Supporting API documentation
---
## 📂 Repository Contents
- `models/` – dbt SQL models (source, staging, analytics)
- `dbt_project.yml` – Project configuration
- `README.md` – This file
- `presentation.pdf` – Business report (included separately)
---
## ✅ Outcome
The goal is to demonstrate:
- Analytical depth and problem-solving
- SQL fluency and transformation logic
- Clear business storytelling in your final presentation
Thank you for the opportunity to complete this challenge!
—
Joana Jo
