-- ============================================
-- Apple Global Sales Analysis
-- Script: 04 - Product Analysis
-- Author: Brianna Owens
-- Date: March 2026
-- Description: Analyses product performance
-- including revenue, discount behaviour,
-- storage variants and return rates
-- ============================================

-- Query 1: Top 10 Products by Total Revenue
SELECT product_name, category,
  COUNT(*) AS transactions,
  SUM(units_sold) AS total_units,
  ROUND(SUM(revenue_usd), 2) AS total_revenue,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue
FROM apple_global_sales_dataset
GROUP BY product_name, category
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 2: Discount Impact on Revenue by Category
-- Finding: iPhone buyers discount resistant, Apple Watch most sensitive
SELECT category,
  discount_pct,
  COUNT(*) AS transactions,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue,
  ROUND(SUM(revenue_usd), 2) AS total_revenue
FROM apple_global_sales_dataset
GROUP BY category, discount_pct
ORDER BY category, discount_pct;

-- Query 3: Storage Variant Revenue Impact
-- Finding: No meaningful revenue correlation across storage tiers
SELECT category, storage,
  COUNT(*) AS transactions,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue,
  ROUND(SUM(revenue_usd), 2) AS total_revenue
FROM apple_global_sales_dataset
WHERE storage != 'N/A'
GROUP BY category, storage
ORDER BY category, avg_revenue DESC;

-- Query 4: Return Rate by Category
-- Finding: Narrow 1.6% band across all categories (6.8% - 8.4%)
SELECT category,
  COUNT(*) AS total_transactions,
  SUM(CASE WHEN return_status = 'Returned' THEN 1 ELSE 0 END) AS returned,
  SUM(CASE WHEN return_status = 'Exchanged' THEN 1 ELSE 0 END) AS exchanged,
  ROUND(SUM(CASE WHEN return_status = 'Returned' THEN 1 ELSE 0 END) * 100.0
    / COUNT(*), 1) AS return_rate_pct
FROM apple_global_sales_dataset
GROUP BY category
ORDER BY return_rate_pct DESC;
