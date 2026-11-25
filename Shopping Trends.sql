
--View All Records
SELECT *
FROM shopping_trends;


--Total Number of Customers
SELECT 
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM shopping_trends;
--Total Number of Customers = 3900


--Total Revenue Generated
SELECT 
    SUM(Purchase_Amount_USD) AS Total_Revenue
FROM shopping_trends;
--Total Revenue Generated  = 233081 USD


--Average Purchase Amount
SELECT 
    ROUND(AVG(Purchase_Amount_USD), 2) AS Avg_Purchase
FROM shopping_trends;
--Average Purchase Amount  = 59 USD


--Number of Customers by Gender
SELECT 
   Gender,
   COUNT(*) AS Customer_Count
FROM shopping_trends
GROUP BY Gender;
--Number of Customers by Gender  Male = 2652, Female = 1248


--Average Spending by Gender
SELECT 
   Gender,
   ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Spending
FROM shopping_trends
GROUP BY Gender;
--Average Spending by Gender   Male = 59 USD, Female = 60 USD


--Top Age Group by Spending
SELECT 
    Age,
    SUM(Purchase_Amount_USD) AS Total_Spent
FROM shopping_trends
GROUP BY Age
ORDER BY Total_Spent DESC;
--Top Age Group by Spending  Age 49 years = 5552 USD


--Top Selling Categories
SELECT 
    Category,
    COUNT(*) AS Total_Purchases
FROM shopping_trends
GROUP BY Category
ORDER BY Total_Purchases DESC;
--Top Selling Categories  Clothing=1737, Accessories=1240, Footwear=599, Outerwear=324


--Revenue by Category
SELECT 
   Category,
   SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_trends
GROUP BY Category
ORDER BY Revenue DESC;
--Revenue by Category  Clothing=104264 USD, Accessories=74200 USD, Footwear=36093 USD, Outerwear=18524 USD


--Most Purchased Items
SELECT 
     Item_Purchased,
     COUNT(*) AS Purchase_Count
FROM shopping_trends
GROUP BY Item_Purchased
ORDER BY Purchase_Count DESC;
--Most Purchased Items   Blouse, Pants and Jewelry = 171 each


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
--The table will display list of customer ID and purchase amount USD whose spending is above average of 59 USD


--Subscription vs Non-Subscription Spending
SELECT 
   Subscription_Status,
   ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Spending
FROM shopping_trends
GROUP BY Subscription_Status;
--Subscription vs Non-Subscription Spending   Yes=59 Avg spending and No=59 Avg spending


--Purchase Frequency Analysis
SELECT 
    Frequency_of_Purchases,
    COUNT(*) AS Customer_Count
FROM shopping_trends
GROUP BY Frequency_of_Purchases
ORDER BY Customer_Count DESC; 
--The table will display list of Frequency of purchase and customer count


--Revenue by Location
SELECT 
   Location,
   SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_trends
GROUP BY Location
ORDER BY Revenue DESC;
--The table will display list of Location and Revenue


--Top 10 Locations by Sales
SELECT 
   Location,
   SUM(Purchase_Amount_USD) AS Total_Sales
FROM shopping_trends
GROUP BY Location
ORDER BY Total_Sales DESC;
--The table will display list of Location and Total sales


--Sales by Season
SELECT 
   Season,
   SUM(Purchase_Amount_USD) AS Total_Revenue
FROM shopping_trends
GROUP BY Season
ORDER BY Total_Revenue DESC;
--Sales by Season  Fall=60018 USD, Spring=58679 USD, Winter=58607 USD, Summer=55777 USD


--Best-Selling Category in Each Season
SELECT 
   Season,
   Category,
COUNT(*) AS Total_Sales
FROM shopping_trends
GROUP BY Season, Category
ORDER BY Season, Total_Sales DESC;
--The table will display list of season, category and total sales


--Impact of Discounts on Sales
SELECT 
   Discount_Applied,
   ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Order_Value
FROM shopping_trends
GROUP BY Discount_Applied;
--Discount Applied Yes = 59 AOV and No = 60 AOV


--Promo Code Usage
SELECT 
    Promo_Code_Used,
    COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY Promo_Code_Used;
--Promo Code Usage   Yes = 1677 usage count and No = 2223 usage count


--Most Popular Payment Methods
SELECT 
    Payment_Method,
    COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;
--Most Popular Payment Methods PayPal=677, Credit Card=671, Cash=670, Debit Card= 636, Venmo=634, Bank Transfer=612


--Revenue by Payment Method
SELECT 
   Payment_Method,
   SUM(Purchase_Amount_USD) AS Revenue
FROM shopping_trends
GROUP BY Payment_Method
ORDER BY Revenue DESC;
--Revenue by Payment Method Credit Card=40310USD, PayPal=40109USD, Cash=40002USD, Debit Card=38742USD, Venmo=37374USD, Bank Transfer=36544USD


--Top 5 Highest Spending Customers
SELECT 
   Customer_ID,
   SUM(Purchase_Amount_USD) AS Total_Spent
FROM shopping_trends
GROUP BY Customer_ID
ORDER BY Total_Spent DESC;
--Top 5 Highest Spending Customers with IDs are 1457, 770, 43,1480 and 616 with each 100 USD


--Customer Ranking by Spending
SELECT 
    Customer_ID,
    SUM(Purchase_Amount_USD) AS Total_Spent,
RANK() OVER(
ORDER BY SUM(Purchase_Amount_USD) DESC
) AS Customer_Rank
FROM shopping_trends
GROUP BY Customer_ID;
--Customer Ranking by Spending with IDs are 1457, 770, 43,1480 and 616 with each have rank 1


--Category Contribution Percentage
SELECT 
   Category,
   ROUND(SUM(Purchase_Amount_USD) * 100.0 /(SELECT SUM(Purchase_Amount_USD) FROM shopping_trends), 2) AS Revenue_Percentage
FROM shopping_trends
GROUP BY Category
ORDER BY Revenue_Percentage DESC;
--Category Contribution Percentage Clothing=44.73%, Accessories=31.83%, Footwear=15.49%, Outerwear=7.95%


--Repeat Customer Analysis
SELECT 
   Customer_ID,
   COUNT(*) AS Total_Orders
FROM shopping_trends
GROUP BY Customer_ID 
HAVING COUNT(*) > 1
ORDER BY Total_Orders DESC;
-- There is no repeat customer ID




