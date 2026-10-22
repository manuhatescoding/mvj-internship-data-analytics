-- MVJ Internship: Day 5 SQL Aggregation Analysis
-- Dataset: UCI Online Retail II
-- Initial sales filter excludes cancellations, non-positive quantity/price,
-- and missing invoice dates.

-- 1. Data quality

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE InvoiceDate IS NULL
    ) AS missing_dates,
    COUNT(*) FILTER (
        WHERE Quantity IS NULL
    ) AS missing_quantities,
    COUNT(*) FILTER (
        WHERE Price IS NULL
    ) AS missing_prices,
    COUNT(*) FILTER (
        WHERE "Customer ID" IS NULL
    ) AS missing_customer_ids,
    COUNT(DISTINCT Invoice) AS distinct_invoices,
    MIN(InvoiceDate) AS first_transaction,
    MAX(InvoiceDate) AS last_transaction
FROM online_retail
;

-- 2. Monthly KPIs

SELECT
    strftime(InvoiceDate, '%Y-%m') AS sales_month,
    COUNT(DISTINCT Invoice) AS total_orders,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(
        SUM(Revenue) / NULLIF(COUNT(DISTINCT Invoice), 0),
        2
    ) AS average_order_value
FROM retail_sales
GROUP BY sales_month
ORDER BY sales_month
;

-- 3. Country KPIs

SELECT
    Country,
    COUNT(DISTINCT Invoice) AS total_orders,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(
        SUM(Revenue) / NULLIF(COUNT(DISTINCT Invoice), 0),
        2
    ) AS average_order_value
FROM retail_sales
GROUP BY Country
ORDER BY total_revenue DESC
;

-- 4. Monthly country KPIs

SELECT
    strftime(InvoiceDate, '%Y-%m') AS sales_month,
    Country,
    COUNT(DISTINCT Invoice) AS total_orders,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(
        SUM(Revenue) / NULLIF(COUNT(DISTINCT Invoice), 0),
        2
    ) AS average_order_value
FROM retail_sales
GROUP BY sales_month, Country
ORDER BY sales_month, total_revenue DESC
;
