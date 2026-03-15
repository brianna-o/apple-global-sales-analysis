-- Cleaning data

-- Verifying dataset loaded correctly
SELECT * FROM apple_global_sales_dataset LIMIT 10;
-- Verifying that all 11,500 rows came through
SELECT COUNT(*) AS total_rows FROM apple_global_sales_dataset;
-- Checking for NULL values across key columns
SELECT
  SUM(CASE WHEN sale_id IS NULL THEN 1 ELSE 0 END) AS null_sale_id,
  SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS null_sale_date,
  SUM(CASE WHEN revenue_usd IS NULL THEN 1 ELSE 0 END) AS null_revenue,
  SUM(CASE WHEN customer_rating IS NULL THEN 1 ELSE 0 END) AS null_ratings
FROM apple_global_sales_dataset;
-- Convert empty strings to proper NULLs
UPDATE apple_global_sales_dataset
SET customer_rating = NULL
WHERE customer_rating = '';
-- Verifying fix
SELECT 
  COUNT(*) AS total_rows,
  COUNT(customer_rating) AS non_null_ratings,
  COUNT(*) - COUNT(customer_rating) AS null_ratings
FROM apple_global_sales_dataset;
-- Checking all columns for empty strings 
SELECT
  SUM(CASE WHEN sale_id = '' THEN 1 ELSE 0 END) AS empty_sale_id,
  SUM(CASE WHEN sale_date = '' THEN 1 ELSE 0 END) AS empty_sale_date,
  SUM(CASE WHEN country = '' THEN 1 ELSE 0 END) AS empty_country,
  SUM(CASE WHEN revenue_usd = '' THEN 1 ELSE 0 END)
  AS empty_revenue,
  SUM(CASE WHEN previous_device_os = '' THEN 1 ELSE 0 END) AS empty_prev_os,
  SUM(CASE WHEN storage = '' THEN 1 ELSE 0 END) AS empty_storage
FROM apple_global_sales_dataset;