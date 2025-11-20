 -- CUSTOMERS
  CREATE table customers (
    CustomerID INT Primary key,
    country VARCHAR(50)
    );
    -- PRODUCTS
 CREATE table products(
   ProductID INT AUTO_INCREMENT Primary key,
   stockcode VARCHAR(20),
   Description VARCHAR(255)
   );
   -- ORDERS
CREATE table orders(
   OrderID INT AUTO_INCREMENT primary key,
   InvoiceNo VARCHAR(20),
	InvoiceDate datetime,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
    );
-- Fact table
CREATE table orderitems (
    orderitemID INT AUTO_INCREMENT primary key,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Unitprice DECIMAL(10,2),
    Total_amount Decimal(12,2),
    transaction_type VARCHAR(10),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ProductID) References products(ProductID)
    );
