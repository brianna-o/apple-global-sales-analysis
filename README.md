# Apple Global Sales Analysis

## Project Overview
End-to-end data analysis project exploring 11,500 synthetic Apple Inc. 
global sales transactions across 2022–2024. The project covers the full 
analyst workflow — from raw data validation and cleaning in SQLite 
to exploratory analysis and an interactive Tableau dashboard.

> **Dataset Disclaimer:** All figures are synthetically generated for 
> educational purposes and do not represent actual Apple Inc. financial 
> data. Dataset sourced from Kaggle.

---

## Tools Used
- **SQLite** (via DBeaver) — data cleaning and analysis
- **Tableau Public** — interactive dashboard
- **GitHub** — version control and documentation

---

## Dataset
| Property | Detail |
|---|---|
| Source | Kaggle |
| Rows | 11,500 |
| Columns | 27 |
| Period | 2022–2024 |
| Coverage | Global — city level transactions |

---

## Project Structure
```
apple-global-sales-analysis/
├── data/
│   ├── raw/
│   │   └── apple_global_sales_dataset.csv
│   └── cleaned/
│       └── apple_global_sales_cleaned.csv
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_exploratory_analysis.sql
│   ├── 03_regional_analysis.sql
│   └── 04_product_analysis.sql
└── README.md
```

---

## Methodology

### 1. Data Cleaning & Validation
- Audited all 27 columns for NULL values and duplicates
- Discovered missing values stored as empty strings rather 
  than SQL NULLs — a common SQLite CSV import issue
- Corrected 3,360 rows in `customer_rating` using UPDATE statements
- Confirmed no duplicates across 11,500 unique transaction IDs

### 2. Exploratory Data Analysis
- Revenue range: $23.00 (min) to $59,529.52 (max), avg $1,568.32
- Total revenue across dataset: $18,035,669.25
- Europe leads global transactions (3,898) while North America 
  ranks 5th despite being Apple's primary market
- Mac category dominates revenue despite lower transaction volume 
  than iPhone

### 3. Regional Analysis — North America Deep Dive
Conducted a five-layer root cause investigation into why North 
America ranked 5th globally despite being Apple's home market:

| Layer | Finding |
|---|---|
| 1 | US has most cities (25) but fewest transactions per city (9.1) |
| 2 | US generates least revenue per city — 4x lower than Mexico |
| 3 | Discounts ruled out — US has lowest avg discount (3.56%) |
| 4 | Units per transaction nearly identical across all three countries |
| 5 | Root cause confirmed — US has zero Mac Pro (M2 Ultra) sales |

**Conclusion:** Excluding Mac Pro, all three North American countries 
converge within $568 of each other — confirming the entire revenue 
gap was driven by 18 Mac Pro transactions in Canada and Mexico.

### 4. Product Analysis
- Mac Pro (M2 Ultra) generates $3,724,222.55 — nearly 3x the 
  next highest product
- iPhone buyers are discount resistant — revenue stays flat from 
  0–7% discount before dropping at 10%+
- Apple Watch is the most discount sensitive — 34% revenue decline 
  from 0% to 15% discount
- Return rates are remarkably consistent across all categories — 
  only a 1.6 percentage point band (6.8%–8.4%)
- Storage variant has no meaningful impact on revenue across 
  iPhone, Mac or iPad categories

---

## Key Findings

1. **Mac Pro drives disproportionate revenue** — a single product 
   accounts for $3.7M and distorts regional comparisons
   
2. **iPhone buyers are discount resistant** — small discounts have 
   negligible impact on iPhone revenue, unlike Apple Watch which 
   shows a clear sensitivity to discounting

3. **Return rates are surprisingly uniform** — all six product 
   categories fall within 6.8%–8.4%, suggesting consistent 
   post-purchase satisfaction regardless of price point

4. **North America is underrepresented** — US transaction density 
   is significantly lower than Canada and Mexico, reflecting 
   synthetic data sampling patterns rather than real market dynamics

---

## Dashboard
View the interactive Tableau dashboard here:
[Apple Global Sales Analysis Dashboard](https://public.tableau.com/views/AppleGlobalSalesAnalysis2022-2024/AppleGlobalSalesAnalysis?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## How to Run the SQL Scripts
1. Download `data/raw/apple_global_sales_dataset.csv`
2. Import into SQLite using DBeaver or any SQLite client
3. Run scripts in order: 01 → 02 → 03 → 04
4. Note: Run `01_data_cleaning.sql` first — subsequent scripts 
   depend on the NULL corrections applied in step 1

---

## Author
**Brianna Owens**
[LinkedIn](www.linkedin.com/in/brianna-owens-42253223a)
[Tableau Public](https://public.tableau.com/app/profile/brianna.owens)
