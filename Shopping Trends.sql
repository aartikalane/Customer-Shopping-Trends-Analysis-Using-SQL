
--View All Records
SELECT *
FROM shopping_trends;


--Total Number of Customers
SELECT 
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM shopping_trends;



--Total Revenue Generated
SELECT 
    SUM(Purchase_Amount_USD) AS Total_Revenue
FROM shopping_trends;



--Average Purchase Amount
SELECT 
    ROUND(AVG(Purchase_Amount_USD), 2) AS Avg_Purchase
FROM shopping_trends;



--Number of Customers by Gender
SELECT 
   Gender,
   COUNT(*) AS Customer_Count
FROM shopping_trends
GROUP BY Gender;



--Average Spending by Gender
SELECT 
   Gender,
   ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Spending
FROM shopping_trends
GROUP BY Gender;



--Top Age Group by Spending
SELECT 
    Age,
    SUM(Purchase_Amount_USD) AS Total_Spent
FROM shopping_trends
GROUP BY Age
ORDER BY Total_Spent DESC;



--Top Selling Categories
SELECT 
    Category,
    COUNT(*) AS Total_Purchases
FROM shopping_trends
GROUP BY Category
ORDER BY Total_Purchases DESC;



--Revenue by Category
SELECT 
   Category,
   SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_trends
GROUP BY Category
ORDER BY Revenue DESC;



--Most Purchased Items
SELECT 
     Item_Purchased,
     COUNT(*) AS Purchase_Count
FROM shopping_trends
GROUP BY Item_Purchased
ORDER BY Purchase_Count DESC;



--Customers Spending Above Average
SELECT 
     Customer_ID,
     Purchase_Amount_USD
FROM shopping_trends
WHERE Purchase_Amount_USD >
(
SELECT AVG(Purchase_Amount_USD)
FROM shopping_trends
);



--Subscription vs Non-Subscription Spending
SELECT 
   Subscription_Status,
   ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Spending
FROM shopping_trends
GROUP BY Subscription_Status;



--Purchase Frequency Analysis
SELECT 
    Frequency_of_Purchases,
    COUNT(*) AS Customer_Count
FROM shopping_trends
GROUP BY Frequency_of_Purchases
ORDER BY Customer_Count DESC; 



--Revenue by Location
SELECT 
   Location,
   SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_trends
GROUP BY Location
ORDER BY Revenue DESC;



--Top 10 Locations by Sales
SELECT 
   Location,
   SUM(Purchase_Amount_USD) AS Total_Sales
FROM shopping_trends
GROUP BY Location
ORDER BY Total_Sales DESC;



--Sales by Season
SELECT 
   Season,
   SUM(Purchase_Amount_USD) AS Total_Revenue
FROM shopping_trends
GROUP BY Season
ORDER BY Total_Revenue DESC;


--Best-Selling Category in Each Season
SELECT 
   Season,
   Category,
COUNT(*) AS Total_Sales
FROM shopping_trends
GROUP BY Season, Category
ORDER BY Season, Total_Sales DESC;



--Impact of Discounts on Sales
SELECT 
   Discount_Applied,
   ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Order_Value
FROM shopping_trends
GROUP BY Discount_Applied;



--Promo Code Usage
SELECT 
    Promo_Code_Used,
    COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY Promo_Code_Used;



--Most Popular Payment Methods
SELECT 
    Payment_Method,
    COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;



--Revenue by Payment Method
SELECT 
   Payment_Method,
   SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_trends
GROUP BY Payment_Method
ORDER BY Revenue DESC;



--Top 5 Highest Spending Customers
SELECT 
   Customer_ID,
   SUM(Purchase_Amount_USD) AS Total_Spent
FROM shopping_trends
GROUP BY Customer_ID
ORDER BY Total_Spent DESC;



--Customer Ranking by Spending
SELECT 
    Customer_ID,
    SUM(Purchase_Amount_USD) AS Total_Spent,
RANK() OVER(
ORDER BY SUM(Purchase_Amount_USD) DESC
) AS Customer_Rank
FROM shopping_trends
GROUP BY Customer_ID;



--Category Contribution Percentage
SELECT 
   Category,
   ROUND(SUM(Purchase_Amount_USD) * 100.0 /(SELECT SUM(Purchase_Amount_USD) FROM shopping_trends), 2) AS Revenue_Percentage
FROM shopping_trends
GROUP BY Category
ORDER BY Revenue_Percentage DESC;



--Repeat Customer Analysis
SELECT 
   Customer_ID,
   COUNT(*) AS Total_Orders
FROM shopping_trends
GROUP BY Customer_ID 
HAVING COUNT(*) > 1
ORDER BY Total_Orders DESC;





