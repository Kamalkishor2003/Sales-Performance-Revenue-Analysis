CREATE DATABASE sales_project;
USE sales_project;
CREATE TABLE sales_data (
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT,
    profit_margin FLOAT,
    is_loss INT,
    discount_level VARCHAR(30),
    high_value_order INT
);

select * from sales_data;


SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales), 3) AS profit_margin
FROM sales_data;

-- Which regions generate losses?
SELECT
    region,
    SUM(sales) AS sales,
    SUM(profit) AS profit
FROM sales_data
GROUP BY region
ORDER BY profit ASC;

-- Which products are unprofitable?
SELECT
    category,
    SUM(sales) AS sales,
    SUM(profit) AS profit,
    ROUND(SUM(profit) / SUM(sales), 2) AS margin
FROM sales_data
GROUP BY category
ORDER BY margin DESC;

-- How does discount affect profit?
SELECT
    discount_level,
    COUNT(*) AS orders,
    SUM(sales) AS sales,
    SUM(profit) AS profit
FROM sales_data
GROUP BY discount_level
ORDER BY profit ASC;



-- Which ship mode causes higher loss?
SELECT
    ship_mode,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales), 3) AS profit_margin,
    SUM(is_loss) AS loss_orders
FROM sales_data
GROUP BY ship_mode
ORDER BY total_profit ASC;

-- Which categories should be prioritized?
SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales), 3) AS profit_margin
FROM sales_data
GROUP BY category
ORDER BY profit_margin DESC;

-- Which orders are high value but low margin?
SELECT
    ship_mode,
    category,
    sales,
    profit,
    profit_margin
FROM sales_data
WHERE high_value_order = 1
  AND profit_margin < 0.05
ORDER BY profit_margin ASC;
