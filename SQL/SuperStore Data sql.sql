Create database SuperstoreDB;
use SuperstoreDB;
CREATE TABLE superstore (
Ship_Mode VARCHAR(50),
Segment VARCHAR(50),
Country VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Postal_Code INT,
Region VARCHAR(50),
Category VARCHAR(50),
Sub_Category VARCHAR(50),
Sales DECIMAL(10,2),
Quantity INT,
Discount DECIMAL(10,2),
Profit DECIMAL(10,2)
);
 select*from superstore;
 
 select count(*) from superstore;


# Sales & Profit Analysis Queries

# 1. Total Sales
 select sum(Sales) As Total_Sales
 from superstore;
 
 # 2. Total Profit
 Select sum(Profit) As Total_Profit
 from superstore;
 
# 3. Top Performing Region
select Region, sum(Sales) As Total_Sales
from superstore
group by Region
order by Total_Sales desc;

# 4.Most Profitable Category
select Category, sum(profit) As Total_Profit
from superstore
group by Category
order by Total_Profit desc;

# 5. Loss Making Sub-Categories
select Sub_Category,sum(Profit) As Total_Profit
from superstore
group by Sub_Category
having sum(profit)<0;

# 6. Top 10 Highest Sales Cities
select City,sum(Sales) As Total_Sales
from superstore
group by city
order by Total_Sales desc
limit 10;

#.7 Top 5 Profitable States
select State, sum(profit) As Total_Profit
from superstore
group by State
order by Total_Profit desc
limit 5;

# 8.Category Wise Sales & Profit
select Category,
sum(Sales) AS Total_Sales,
sum(Profit) As Total_Profit
from superstore
group by Category;

# 9.Average Discount by Category
select Category,
avg(Discount) As Avg_Discount 
from superstore
group by Category;

# 10. Highest Loss-Making Products
select Sub_Category,
sum(Profit) As Total_Profit
from superstore
group by Sub_Category
ORDER BY Total_Profit ASC
LIMIT 5;

# Customer / Segment Analysis

# 11. Sales by Segment
select Segment,
sum(Sales) As Total_Sales
from superstore
group by Segment;

# 12. Most Profitable Segment
select Segment,
sum(Profit) As Total_Profit
from superstore
group by Segment
order by Total_Profit desc;

# Regional Analysis
# 13. Region Wise Profit Margin
select Region,
  SUM(Sales) AS Total_Sales,
 SUM(Profit) AS Total_Profit,
 (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin
 from superstore
group by Region;

# 14. State with Highest Discount
select State,
avg(Discount) As Avg_Discount 
from superstore
group by State
order by  Avg_Discount  desc;

# Business Insight Queries
# 15. Orders with High Discount but Low Profit
select* from superstore
where Discount >0.3
and Profit <0;

# 16. Which Category Gives Highest Quantity Sold
select Category,
sum(Quantity) As Total_Quantity
from superstore
group by Category
order by Total_Quantity desc;

# 17. Profit Percentage by Category
select Category,
SUM(Sales) AS Total_Sales,
 SUM(Profit) AS Total_Profit,
 (SUM(Sales) / SUM(Profit)) * 100 AS Profit_Percentage
 from superstore
 group by Category;
 
 # 18. Rank Regions by Sales
 SELECT Region,
       SUM(Sales) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM superstore
GROUP BY Region;

# 19. Running Total of Sales
SELECT City, Sales,
SUM(Sales) OVER (ORDER BY Sales) AS Running_Total
FROM superstore;
