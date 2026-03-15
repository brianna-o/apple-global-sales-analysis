-- Exploring anomalies

-- Why is North America's volume so low? 
SELECT country, COUNT(*) AS transactions
FROM apple_global_sales_dataset
WHERE region = 'North America'
GROUP BY country
ORDER BY transactions DESC;
-- How many cities are represented per country?
SELECT country, 
  COUNT(DISTINCT city) AS unique_cities,
  COUNT(*) AS transactions,
  ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT city), 1) AS transactions_per_city
FROM apple_global_sales_dataset
WHERE region = 'North America'
GROUP BY country;
-- Ranking cities
SELECT country,
  COUNT(DISTINCT city) AS unique_cities,
  COUNT(*) AS transactions,
  ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT city), 1) AS transactions_per_city,
  ROUND(SUM(revenue_usd), 2) AS total_revenue,
  ROUND(SUM(revenue_usd) / COUNT(DISTINCT city), 2) AS revenue_per_city
FROM apple_global_sales_dataset
WHERE region = 'North America'
GROUP BY country;
-- Checking average transaction value by country
SELECT country,
  ROUND(AVG(revenue_usd), 2) AS avg_transaction_value,
  ROUND(AVG(units_sold), 2) AS avg_units_per_transaction,
  ROUND(AVG(discount_pct), 2) AS avg_discount
FROM apple_global_sales_dataset
WHERE region = 'North America'
GROUP BY country;
-- Verifying that US is buying cheaper items
SELECT country, category,
  COUNT(*) AS transactions,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue
FROM apple_global_sales_dataset
WHERE region = 'North America'
GROUP BY country, category
ORDER BY country, avg_revenue DESC;
-- Investigating US Mac sales compared to CA and MX
SELECT country, product_name,
  COUNT(*) AS transactions,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue
FROM apple_global_sales_dataset
WHERE region = 'North America'
AND category = 'Mac'
GROUP BY country, product_name
ORDER BY country, avg_revenue DESC;
-- US has zero Mac Pro sales
-- Investigating the impact: What would Canada and Mexico's Mac avg look like without Mac Pro?
SELECT country,
  ROUND(AVG(CASE WHEN product_name != 'Mac Pro (M2 Ultra)' 
    THEN revenue_usd END), 2) AS avg_revenue_excl_macpro,
  ROUND(AVG(revenue_usd), 2) AS avg_revenue_incl_macpro,
  COUNT(CASE WHEN product_name = 'Mac Pro (M2 Ultra)' 
    THEN 1 END) AS macpro_transactions
FROM apple_global_sales_dataset
WHERE region = 'North America'
AND category = 'Mac'
GROUP BY country;
