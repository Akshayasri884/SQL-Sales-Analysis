-- SQL Sales Analysis Project
-- Dataset: Sales Data Sample
-- Author: Nandyala Akshaya Sri

USE sales_analysis;

-- Q1: Total Sales Revenue
SELECT ROUND(SUM(SALES), 2) AS Total_Revenue FROM sales;

-- Q2: Sales by Product Category
SELECT PRODUCTLINE, ROUND(SUM(SALES), 2) AS Total_Sales,
COUNT(ORDERNUMBER) AS Total_Orders
FROM sales GROUP BY PRODUCTLINE ORDER BY Total_Sales DESC;

-- Q3: Top 10 Customers by Revenue
SELECT CUSTOMERNAME, COUNTRY, ROUND(SUM(SALES), 2) AS Total_Revenue,
COUNT(ORDERNUMBER) AS Total_Orders
FROM sales GROUP BY CUSTOMERNAME, COUNTRY
ORDER BY Total_Revenue DESC LIMIT 10;

-- Q4: Monthly Sales Trend
SELECT MONTH_ID, YEAR_ID, ROUND(SUM(SALES), 2) AS Monthly_Sales,
COUNT(ORDERNUMBER) AS Total_Orders
FROM sales GROUP BY YEAR_ID, MONTH_ID ORDER BY YEAR_ID, MONTH_ID;

-- Q5: Best Performing Country
SELECT COUNTRY, ROUND(SUM(SALES), 2) AS Total_Sales,
COUNT(ORDERNUMBER) AS Total_Orders
FROM sales GROUP BY COUNTRY ORDER BY Total_Sales DESC LIMIT 10;

-- Q6: Average Order Value
SELECT ROUND(AVG(SALES), 2) AS Average_Order_Value,
ROUND(MIN(SALES), 2) AS Minimum_Sale,
ROUND(MAX(SALES), 2) AS Maximum_Sale FROM sales;

-- Q7: Sales by Deal Size
SELECT DEALSIZE, COUNT(ORDERNUMBER) AS Total_Orders,
ROUND(SUM(SALES), 2) AS Total_Sales,
ROUND(AVG(SALES), 2) AS Avg_Sale
FROM sales GROUP BY DEALSIZE ORDER BY Total_Sales DESC;

-- Q8: Top 5 Products by Sales
SELECT PRODUCTCODE, PRODUCTLINE, ROUND(SUM(SALES), 2) AS Total_Sales,
SUM(QUANTITYORDERED) AS Total_Quantity
FROM sales GROUP BY PRODUCTCODE, PRODUCTLINE
ORDER BY Total_Sales DESC LIMIT 5;

-- Q9: Year-wise Revenue Comparison
SELECT YEAR_ID, ROUND(SUM(SALES), 2) AS Total_Revenue,
COUNT(ORDERNUMBER) AS Total_Orders
FROM sales GROUP BY YEAR_ID ORDER BY YEAR_ID;

-- Q10: Orders by Status
SELECT STATUS, COUNT(ORDERNUMBER) AS Total_Orders,
ROUND(SUM(SALES), 2) AS Total_Sales
FROM sales GROUP BY STATUS ORDER BY Total_Orders DESC;