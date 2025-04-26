CREATE DATABASE alcoholsales_db;
USE alcoholsales_db;

CREATE TABLE alcohol_sales (
    Invoice_ID VARCHAR(20),
    Branch VARCHAR(10),
    City VARCHAR(50),
    Customer_Type VARCHAR(50),
    Gender VARCHAR(10),
    Product_Line VARCHAR(100),
    Unit_Price FLOAT,
    Quantity INT,
    Tax FLOAT,
    Total FLOAT,
    Date DATE,
    Time TIME,
    Payment VARCHAR(50),
    COGS FLOAT,
    Gross_Margin_Percentage FLOAT,
    Gross_Income FLOAT,
    Rating FLOAT
);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM alcohol_sales
WHERE Invoice_ID IS NULL OR Product_Line IS NULL OR Total IS NULL;

SELECT 
    Product_Line,
    SUM(Total) AS Total_Sales,
    SUM(COGS) AS Total_COGS,
    SUM(Gross_Income) AS Profit,
    ROUND(SUM(Gross_Income)/SUM(COGS)*100, 2) AS Profit_Margin_Percent
FROM alcohol_sales
GROUP BY Product_Line
ORDER BY Profit_Margin_Percent ASC;

SELECT 
    MONTH(Date) AS Sale_Month,
    Product_Line,
    SUM(Total) AS Monthly_Sales
FROM alcohol_sales
GROUP BY MONTH(Date), Product_Line
ORDER BY Sale_Month;


USE alcoholsales_db;

SHOW TABLES;

SELECT COUNT(*) FROM supermarket_sales;
SELECT * FROM supermarket_sales LIMIT 10;

SELECT * FROM supermarket_sales;
