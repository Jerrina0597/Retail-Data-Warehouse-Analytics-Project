-- count fact table
Select count(*) from orderitems;

-- Check if any orders missing Customer
Select * from orderitems f
LEFT JOIN orders o ON f.OrderID=o.OrderID
where CustomerID IS NOT NULL;

-- check top 10 customers
SELECT *
FROM customer_view
ORDER BY Total_revenue DESC
LIMIT 10;

--  Check monthly sales trend
select * from monthly_sales
Order By month;