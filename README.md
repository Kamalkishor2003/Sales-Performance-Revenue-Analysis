# Sales Performance & Revenue Analysis

This repository contains an end‑to‑end sales analytics project built on the Sample Superstore dataset. It covers data cleaning, feature engineering, cohort analysis, SQL reporting, and a simple machine learning model for loss prediction.

## Project Overview

- Clean and prepare transactional sales data for analysis and SQL loading.
- Engineer business features such as profit margin, discount cohorts, loss flags, and high‑value orders.
- Explore how discounts, regions, categories, and ship modes impact profitability.
- Build a Random Forest model to predict loss‑making orders using key commercial drivers.

## Dataset

Source: `SampleSuperstore.csv` (classic retail sales dataset). The cleaned dataset is exported as `sales_cleaned_featured.csv` and `sales_ml_ready.csv`.

Main columns after processing:

- `ship_mode`, `segment`, `country`, `city`, `state`, `region`
- `category`, `sub-category`
- `sales`, `quantity`, `discount`, `profit`
- Engineered: `profit_margin`, `is_loss`, `discount_level`, `high_value_order`

There are 9,977 rows and 16 columns in the final processed dataset.

## Repository Structure

- `sales_analysic.ipynb` or `sales_analysic.pdf` – Python notebook with EDA, feature engineering, cohort analysis, scenario testing, and ML model.
- `sql.sql` / `sql.txt` – SQL schema and analytical queries for MySQL.
- `sales_cleaned_featured.csv` – Cleaned dataset ready for analytics and SQL loading.
- `sales_ml_ready.csv` – Encoded dataset ready for machine learning.
- `image.jpg` – Power BI / dashboard screenshot used for visualization of key metrics.

## Key Analyses

1. **Data Cleaning & Feature Engineering**
   - Standardized column names, removed nulls in `sales` and `profit`, filled missing `discount` with 0, and dropped duplicates.
   - Created `profit_margin` as `profit / sales`, `is_loss` flag, and `discount_level` buckets: No, Low (≤0.2), Medium (≤0.5), High (>0.5).

2. **Discount Cohort Analysis**
   - Aggregated sales, profit, margin, and loss rate by `discount_level` to understand impact of discounting strategy.
   - Tested a what‑if scenario reducing high discounts by 5% and estimated profit uplift.

3. **SQL Business Reporting**  
   - Created `sales_data` table with engineered fields for downstream BI.
   - Wrote queries to answer questions such as:
     - Overall sales, profit, and profit margin
     - Regions and categories generating losses or high margins
     - Impact of discount levels on profit
     - Ship modes associated with higher loss orders
     - High‑value, low‑margin orders for optimization

4. **Machine Learning – Loss Prediction**
   - Encoded categorical variables (`ship_mode`, `category`, `region`, `discount_level`) and trained a `RandomForestClassifier` to predict `is_loss`.[file:3]  
   - Used features: `sales`, `quantity`, `discount`, `profit_margin`, `ship_mode`, `category`, `region`; evaluated accuracy and feature importance.[file:3]

## Getting Started

### Requirements

- Python 3.x with:
  - `pandas`, `numpy`, `matplotlib`, `scikit-learn`, `mysql-connector-python`
- MySQL server for running the SQL scripts.

