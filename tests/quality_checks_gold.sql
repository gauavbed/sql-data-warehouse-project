/*
===============================================================================
Gold Layer Validation Checks
===============================================================================

Description:
    This file is used to verify that the Gold layer is ready for reporting
    and analysis. The validation queries help identify data quality issues
    that could impact dashboards or business reports.

Validation Includes:
    - Checking for duplicate keys in dimension tables.
    - Confirming relationships between fact and dimension tables.
    - Detecting missing or unmatched records after joins.

Important:
    - Every validation query should return the expected result.
    - Any unexpected output should be reviewed before using the data
      for analytics.
===============================================================================
*/

-- ====================================================================
-- Checking 'gold.dim_customers'
-- ====================================================================
-- Check for Uniqueness of Customer Key in gold.dim_customers
-- Expectation: No results
SELECT
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.dim_products'
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_products
-- Expectation: No results
SELECT
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.fact_sales'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL
   OR c.customer_key IS NULL;
