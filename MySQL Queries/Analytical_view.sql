-- Analytical fact view --
CREATE OR  REPLACE VIEW sales_fact as
SELECT 
  o.OrderID,
  o.InvoiceNo,
  o.InvoiceDate,
  c.CustomerID,
  c.Country,
  p.ProductID,
  p.stockcode,
  p.Description as Product_name,
  f.Quantity,
  f.UnitPrice,
  f.Total_amount,
  f.transaction_type
from orderitems f
Join orders o ON f.orderID=o.OrderID
LEFT JOIN customers c ON O.CustomerID=c.CustomerID
JOIN products p ON f.ProductID=p.ProductID; 

-- Monthly sales view --
CREATE OR REPLACE VIEW monthly_sales as
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') as month,
    SUM(CASE WHEN transaction_type='Sale' THEN Total_amount ELSE 0 END) as Total_revenue,
    SUM(CASE WHEN transaction_type='Return' THEN Total_amount ELSE 0 END) as return_amount,
    COUNT(CASE WHEN transaction_type='Sale' THEN OrderID ELSE 0 END) as orders,
    COUNT(DISTINCT CustomerID) as customers
from sales_fact
Group By month
Order By month;

-- CUSTOMER REVENUE VIEW--

CREATE OR REPLACE VIEW customer_view as
SELECT
   CustomerID,
   Country,
   SUM(CASE WHEN transaction_type='Sale' THEN Total_amount ELSE 0 END) as Total_revenue,
   COUNT(CASE WHEN transaction_type='Sale' Then OrderID ELSE 0 END) as Orders
from sales_fact
Where CustomerID IS NOT NULL
Group By CustomerID,Country;

-- Product Performance View --
CREATE OR REPLACE VIEW product_performance as
SELECT
   ProductID,
   Product_name,
   SUM(CASE WHEN transaction_type='Sale' THEN Quantity Else 0 END) as units_sold,
   SUM(CASE WHEN transaction_type='Sale' THEN Total_amount Else 0 END) as revenue,
   SUM(CASE WHEN transaction_type='Return' THEN Quantity Else 0 END) as units_return,
   SUM(CASE WHEN transaction_type='Return' THEN Total_amount Else 0 END) as return_value
from sales_fact
Group BY ProductID,Product_name;

-- Country Performance View --
CREATE OR REPLACE VIEW country_performance AS
SELECT
   Country,
   SUM(CASE WHEN transaction_type='Sale' THEN Total_amount ELSE 0 END) AS revenue,
   SUM(CASE WHEN transaction_type='Return' THEN Total_amount ELSE 0 END) AS return_amount,
   COUNT(DISTINCT CASE WHEN transaction_type='Sale' THEN OrderID ELSE NULL END) AS orders,
   COUNT(DISTINCT CustomerID) AS customers
FROM sales_fact
GROUP BY Country
ORDER BY revenue DESC;

