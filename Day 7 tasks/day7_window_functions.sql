-- MVJ Internship - Day 7
-- SQL 3: Window functions for analytics
-- Dataset: UCI Online Retail II
-- Prerequisite: retail_sales view created in Day 5.

-- 1. Monthly running revenue

WITH monthly AS (
    SELECT
        DATE_TRUNC('month', InvoiceDate)::DATE AS sales_month,
        COUNT(DISTINCT Invoice) AS total_orders,
        SUM(Revenue) AS monthly_revenue
    FROM retail_sales
    GROUP BY 1
)
SELECT
    sales_month,
    total_orders,
    ROUND(monthly_revenue, 2) AS monthly_revenue,
    ROUND(
        monthly_revenue / NULLIF(total_orders, 0),
        2
    ) AS average_order_value,
    ROUND(
        SUM(monthly_revenue) OVER (
            ORDER BY sales_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS running_revenue
FROM monthly
ORDER BY sales_month
;

-- 2. Month-on-month revenue growth with LAG

WITH monthly AS (
    SELECT
        DATE_TRUNC('month', InvoiceDate)::DATE AS sales_month,
        SUM(Revenue) AS monthly_revenue
    FROM retail_sales
    GROUP BY 1
),
with_previous AS (
    SELECT
        sales_month,
        monthly_revenue,
        LAG(monthly_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly
)
SELECT
    sales_month,
    ROUND(monthly_revenue, 2) AS monthly_revenue,
    ROUND(previous_month_revenue, 2) AS previous_month_revenue,
    ROUND(monthly_revenue - previous_month_revenue, 2)
        AS revenue_change,
    ROUND(
        100.0 * (monthly_revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS mom_growth_pct
FROM with_previous
ORDER BY sales_month
;

-- 3. Top 5 products by revenue within each month

WITH product_monthly AS (
    SELECT
        DATE_TRUNC('month', InvoiceDate)::DATE AS sales_month,
        COALESCE(
            NULLIF(TRIM(CAST(Description AS VARCHAR)), ''),
            'Unknown product'
        ) AS product_name,
        SUM(Revenue) AS product_revenue,
        SUM(Quantity) AS units_sold
    FROM retail_sales
    GROUP BY 1, 2
),
ranked AS (
    SELECT
        sales_month,
        product_name,
        ROUND(product_revenue, 2) AS product_revenue,
        units_sold,
        ROW_NUMBER() OVER (
            PARTITION BY sales_month
            ORDER BY product_revenue DESC, product_name
        ) AS revenue_rank
    FROM product_monthly
)
SELECT *
FROM ranked
WHERE revenue_rank <= 5
ORDER BY sales_month, revenue_rank
;

-- 4. First purchase month per identified customer

WITH customer_first_purchase AS (
    SELECT
        TRY_CAST("Customer ID" AS BIGINT) AS customer_id,
        MIN(InvoiceDate) AS first_purchase_date
    FROM retail_sales
    WHERE TRY_CAST("Customer ID" AS BIGINT) IS NOT NULL
    GROUP BY 1
)
SELECT
    customer_id,
    first_purchase_date,
    DATE_TRUNC('month', first_purchase_date)::DATE
        AS first_purchase_month
FROM customer_first_purchase
ORDER BY first_purchase_date, customer_id
;

-- 5. First-purchase cohort summary

WITH customer_first_purchase AS (
    SELECT
        TRY_CAST("Customer ID" AS BIGINT) AS customer_id,
        DATE_TRUNC('month', MIN(InvoiceDate))::DATE
            AS cohort_month
    FROM retail_sales
    WHERE TRY_CAST("Customer ID" AS BIGINT) IS NOT NULL
    GROUP BY 1
)
SELECT
    cohort_month,
    COUNT(*) AS new_customers
FROM customer_first_purchase
GROUP BY cohort_month
ORDER BY cohort_month
;

-- 6. Cohort activity by months since first purchase

WITH customer_cohorts AS (
    SELECT
        TRY_CAST("Customer ID" AS BIGINT) AS customer_id,
        DATE_TRUNC('month', MIN(InvoiceDate))::DATE AS cohort_month
    FROM retail_sales
    WHERE TRY_CAST("Customer ID" AS BIGINT) IS NOT NULL
    GROUP BY 1
),
customer_active_months AS (
    SELECT DISTINCT
        TRY_CAST("Customer ID" AS BIGINT) AS customer_id,
        DATE_TRUNC('month', InvoiceDate)::DATE AS active_month
    FROM retail_sales
    WHERE TRY_CAST("Customer ID" AS BIGINT) IS NOT NULL
)
SELECT
    c.cohort_month,
    a.active_month,
    DATE_DIFF('month', c.cohort_month, a.active_month)
        AS months_since_first_purchase,
    COUNT(DISTINCT c.customer_id) AS active_customers
FROM customer_cohorts c
JOIN customer_active_months a
    ON c.customer_id = a.customer_id
GROUP BY 1, 2, 3
ORDER BY 1, 3
;
