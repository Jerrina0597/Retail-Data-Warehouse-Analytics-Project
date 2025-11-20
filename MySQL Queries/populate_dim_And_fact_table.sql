 -- CUSTOMER TABLE --
INSERT INTO customers(CustomerID, Country)
SELECT DISTINCT ct.CustomerID, ct.Country
FROM Clean_Transactions ct
LEFT JOIN customers c
    ON ct.CustomerID = c.CustomerID
WHERE ct.CustomerID IS NOT NULL
  AND ct.CustomerID <> 0
  AND c.CustomerID IS NULL;
  
-- PRODUCT TABLE --
INSERT INTO products(stockcode,Description)
SELECT DISTINCT
     stockcode,
     Description
from Clean_Transactions;

-- ORDER TABLE --
INSERT INTO orders(InvoiceNo,InvoiceDate,CustomerID)
SELECT distinct
      InvoiceNo,
      InvoiceDate,
      CustomerID
from Clean_Transactions;

-- Fact table --
INSERT INTO orderitems (OrderID,ProductID,Quantity,Unitprice,Total_amount,transaction_type)
select 
   o.OrderID,
   p.ProductID,
   t.Quantity,
   t.UnitPrice,
   t.Total_amount,
   t.transaction_type
from Clean_Transactions t
JOIN orders o 
   ON t.InvoiceNo   = o.InvoiceNo
  AND t.InvoiceDate = o.InvoiceDate
  AND ( (t.CustomerID IS NULL AND o.CustomerID IS NULL)
        OR t.CustomerID = o.CustomerID )
JOIN products p 
   ON t.stockcode = p.stockcode
Limit 5000 offset 5000;
