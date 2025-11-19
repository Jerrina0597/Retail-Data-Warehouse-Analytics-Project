LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/Online Retail.csv'
INTO TABLE raw_online_retail
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(InvoiceNo, StockCode, Description, Quantity,
 @InvoiceDate, UnitPrice,@CustomerID, Country)
SET
  InvoiceDate=STR_TO_DATE(@InvoiceDate, '%m/%d/%Y %H:%i'),
  CustomerID=NULLIF(@CustomerID,'');