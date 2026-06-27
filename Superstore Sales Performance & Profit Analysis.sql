Create Database Superstore_db;
use Superstore_db;
select * from superstore_db;
ALTER TABLE superstore_db
CHANGE COLUMN `ï»¿Order ID` OrderID VARCHAR(50);
# Monthly Revenue for the Last 12 Months #
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM superstore_db
GROUP BY Month
ORDER BY Month DESC
LIMIT 12;
#==================================================================#
# Top 10 Products by Total Sales #
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_db
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
#==========================================================================#
# Revenue by Region #
SELECT 
    Region,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM superstore_db
GROUP BY Region
ORDER BY Total_Revenue DESC;
#==============================================================================#
# Customers Who Placed More Than 3 Orders #
SELECT 
    `Customer ID`,
    COUNT(`OrderID`) AS Total_Orders
FROM superstore_db
GROUP BY `Customer ID`
HAVING COUNT(`OrderID`) > 3
ORDER BY Total_Orders DESC;

