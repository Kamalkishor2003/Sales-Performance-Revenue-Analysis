# Sales Performance & Revenue Analysis

This repository contains an end‑to‑end sales analytics project built on the Sample Superstore dataset. It covers data cleaning, feature engineering, cohort analysis, SQL reporting, and a simple machine learning model for loss prediction.[file:3][file:2]

## Project Overview

- Clean and prepare transactional sales data for analysis and SQL loading.[file:3]
- Engineer business features such as profit margin, discount cohorts, loss flags, and high‑value orders.[file:3][file:2]
- Explore how discounts, regions, categories, and ship modes impact profitability.[file:3][file:2]
- Build a Random Forest model to predict loss‑making orders using key commercial drivers.[file:3]

## Dataset

Source: `SampleSuperstore.csv` (classic retail sales dataset). The cleaned dataset is exported as `sales_cleaned_featured.csv` and `sales_ml_ready.csv`.[file:3]

Main columns after processing:[file:3]

- `ship_mode`, `segment`, `country`, `city`, `state`, `region`
- `category`, `sub-category`
- `sales`, `quantity`, `discount`, `profit`
- Engineered: `profit_margin`, `is_loss`, `discount_level`, `high_value_order`[file:3][file:2]

There are 9,977 rows and 16 columns in the final processed dataset.[file:3]

## Repository Structure

- `sales_analysic.ipynb` or `sales_analysic.pdf` – Python notebook with EDA, feature engineering, cohort analysis, scenario testing, and ML model.[file:3]
- `sql.sql` / `sql.txt` – SQL schema and analytical queries for MySQL.[file:2]
- `sales_cleaned_featured.csv` – Cleaned dataset ready for analytics and SQL loading.[file:3]
- `sales_ml_ready.csv` – Encoded dataset ready for machine learning.[file:3]
- `image.jpg` – Power BI / dashboard screenshot used for visualization of key metrics.[file:1]

## Key Analyses

1. **Data Cleaning & Feature Engineering**[file:3]  
   - Standardized column names, removed nulls in `sales` and `profit`, filled missing `discount` with 0, and dropped duplicates.[file:3]  
   - Created `profit_margin` as `profit / sales`, `is_loss` flag, and `discount_level` buckets: No, Low (≤0.2), Medium (≤0.5), High (>0.5).[file:3]

2. **Discount Cohort Analysis**[file:3][file:2]  
   - Aggregated sales, profit, margin, and loss rate by `discount_level` to understand impact of discounting strategy.[file:3][file:2]  
   - Tested a what‑if scenario reducing high discounts by 5% and estimated profit uplift.[file:3]

3. **SQL Business Reporting**[file:2]  
   - Created `sales_data` table with engineered fields for downstream BI.[file:2]  
   - Wrote queries to answer questions such as:
     - Overall sales, profit, and profit margin
     - Regions and categories generating losses or high margins
     - Impact of discount levels on profit
     - Ship modes associated with higher loss orders
     - High‑value, low‑margin orders for optimization

4. **Machine Learning – Loss Prediction**[file:3]  
   - Encoded categorical variables (`ship_mode`, `category`, `region`, `discount_level`) and trained a `RandomForestClassifier` to predict `is_loss`.[file:3]  
   - Used features: `sales`, `quantity`, `discount`, `profit_margin`, `ship_mode`, `category`, `region`; evaluated accuracy and feature importance.[file:3]

## Getting Started

### Requirements

- Python 3.x with:
  - `pandas`, `numpy`, `matplotlib`, `scikit-learn`, `mysql-connector-python`[file:3]
- MySQL server for running the SQL scripts.[file:2]

### Setup
**Clone the repository**
```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>
