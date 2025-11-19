CREATE OR REPLACE VIEW Clean_Transactions as
SELECT *,
   (Quantity*UnitPrice) as Total_amount,
   CASE 
	  WHEN Quantity<0 THEN 'Return'
      ELSE 'Sale'
   END AS transaction_type
from raw_online_retail
where 
   InvoiceNo IS NOT NULL
   AND InvoiceDate IS NOT NULL
   AND stockcode IS NOT NULL
   AND Description IS NOT NULL
   AND Unitprice>0
   AND Quantity<>0
   AND InvoiceNo NOT like 'C%' 
   
-- To get pure sales transactions
CREATE OR REPLACE VIEW sales_data AS
SELECT *
FROM Clean_Transactions
WHERE transaction_type = 'Sale';
