-- Count Rows
  Select COUNT(*) from raw_online_retail;
  -- Duplicate invoices from rows
  select InvoiceNo,stockcode,  count(*)
    from raw_online_retail
    GROUP BY 1,2
    HAVING COUNT(*)>1;
    -- check missing values
    SELECT
    SUM(CASE WHEN InvoiceNo   IS NULL THEN 1 ELSE 0 END) AS missing_invoiceno,
    SUM(CASE WHEN InvoiceDate IS NULL THEN 1 ELSE 0 END) AS missing_invoicedate,
    SUM(CASE WHEN StockCode   IS NULL THEN 1 ELSE 0 END) AS missing_stockcode,
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS missing_description,
    SUM(CASE WHEN UnitPrice   IS NULL THEN 1 ELSE 0 END) AS missing_unitprice,
    SUM(CASE WHEN Quantity    IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN Country     IS NULL THEN 1 ELSE 0 END) AS missing_country,
    SUM(CASE WHEN CustomerID  IS NULL THEN 1 ELSE 0 END) AS missing_customerid
FROM raw_online_retail;
-- set customerID null value with 0
UPDATE raw_online_retail
SET CustomerID=0
where CustomerID IS NULL;
-- check for cancellation invoice
select InvoiceNo, Count(*) as rows_per_invoice
from raw_online_retail
where InvoiceNo like 'C%'
Group By InvoiceNo
Order By rows_per_invoice DESC;
-- check for returns
select Description, ABS(SUM(quantity)) as total_returns
from raw_online_retail
where quantity<0
Group By Description
Order By total_returns DESC
Limit 10;

-- Analyse based on price distribution
select
   MIN(UnitPrice) as min_price,
   MAX(UnitPrice) as max_price,
   AVG(UnitPrice) as Avg_price,
   Min(Quantity) as min_quantity,
   MAX(Quantity) as max_quantity,
  AVG(Quantity) as Avg_quantity
from raw_online_retail;

--  Basic sales metrics
select (Quantity*UnitPrice) as gross_amount
from raw_online_retail;
-- Revenue per_month(rough)
select DATE_FORMAT(InvoiceDate, '%Y-%m') as month,
  SUM(Quantity*UnitPrice) as revenue
from raw_online_retail
group by month
Order By month;
-- revenue per country(rough)
select Country,
   SUM(Quantity*UnitPrice) as revenue
from raw_online_retail
group by Country
Order By revenue DESC;