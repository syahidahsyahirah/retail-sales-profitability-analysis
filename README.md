# retail-sales-profitability-analysis
Analyzing product, region, and segment profitability rather than just revenue. Built with SQL and Python.

## Business Problem
Leadership needs to know which products, regions, and customer segments are actually profitable — not just high in revenue — before finalizing next year's budget. This matters because revenue alone can hide the real picture: heavy discounting can make sales numbers look strong while quietly turning profit negative.

## Dataset

- **Source:** [Superstore Sales Dataset (Kaggle)](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Size:** 9,994 rows × 21 columns
- **Contents:** Order-level retail transactions including product, customer, region, date, quantity, sales, discount, and profit fields

## Tools Used

- **Python (Pandas)** — data loading, profiling, and cleaning
- **SQLite + SQL** — business-question analysis via aggregation queries
- **Jupyter Notebook** — development environment

## Data Cleaning

**Profiling results:**
- No missing values in any column
- No duplicate rows
- `Order Date` and `Ship Date` were stored as text (`object`) instead of proper dates — converted using `pd.to_datetime()`
- Category, Sub-Category, Region, and Segment values checked via `.unique()` — all confirmed consistently formatted, no fix needed
- Outlier check on Sales/Discount/Profit via `.describe()`: Discount max was 0.8 (80%) — valid, no data error. Profit had a minimum of −6599.98

**Decision:** Extreme negative-profit values were retained rather than removed, since they represent genuine loss-making transactions — likely driven by heavy discounting — that are directly relevant to the profitability question this analysis investigates. Removing them would hide the exact pattern being studied.
