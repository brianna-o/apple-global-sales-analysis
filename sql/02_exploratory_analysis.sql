-- Performing summary statistics 

-- Summary of revenue and pricing
SELECT
  ROUND(MIN(revenue_usd), 2) AS min_revenue,
  ROUND(MAX(revenue_usd), 2) AS max_revenue,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue,
  ROUND(SUM(revenue_usd), 2) AS total_revenue,
  MIN(sale_date) AS earliest_sale,
  MAX(sale_date) AS latest_sale
FROM apple_global_sales_dataset;
-- Sales volume by category
SELECT 
  category,
  COUNT(*) AS total_transactions,
  SUM(units_sold) AS total_units,
  ROUND(SUM(revenue_usd), 2) AS total_revenue,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue_per_transaction
FROM apple_global_sales_dataset
GROUP BY category
ORDER BY total_revenue DESC;
-- Revenue by region
SELECT
  region,
  COUNT(*) AS transactions,
  ROUND(SUM(revenue_usd), 2) AS total_revenue,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue
FROM apple_global_sales_dataset
GROUP BY region
ORDER BY total_revenue DESC;
-- Revenue by year
SELECT
  year,
  COUNT(*) AS transactions,
  ROUND(SUM(revenue_usd), 2) AS total_revenue,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue
FROM apple_global_sales_dataset
GROUP BY year
ORDER BY year;
-- Sales by channel
SELECT
  sales_channel,
  COUNT(*) AS transactions,
  ROUND(SUM(revenue_usd), 2) AS total_revenue,
  ROUND(AVG(discount_pct), 2) AS avg_discount_pct
FROM apple_global_sales_dataset
GROUP BY sales_channel
ORDER BY total_revenue DESC;
