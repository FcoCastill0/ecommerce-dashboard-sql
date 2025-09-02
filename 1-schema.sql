-- This script creates the basic tables for our e-commerce business.

-- Products Table: Information about each item we sell
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    SKU VARCHAR(50),
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    PurchasePrice DECIMAL(10, 2), -- How much it costs us to buy
    PackagingWeightKG DECIMAL(10, 3) -- For LUCID compliance
);

-- Customers Table: Where our customers live (shipping addresses)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    ShippingCity VARCHAR(100),
    ShippingState VARCHAR(100),
    ShippingZip VARCHAR(20),
    ShippingCountry VARCHAR(50)
);

-- Orders Table: The main record of each sale
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Platform VARCHAR(50), -- Amazon, Otto, Shopify, etc.
    OrderStatus VARCHAR(50), -- Shipped, Pending, Returned
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderItems Table: The specific products inside each order
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    GrossPrice DECIMAL(10, 2), -- Price with tax (Brutto)
    NetPrice DECIMAL(10, 2),   -- Price without tax (Netto)
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inventory Table: How much stock we have
CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    StockLevel INT,
    Warehouse VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- PurchaseOrders Table: Orders we've placed with our suppliers
CREATE TABLE PurchaseOrders (
    PO_ID INT PRIMARY KEY,
    ProductID INT,
    Supplier VARCHAR(100),
    QuantityOrdered INT,
    ExpectedDate DATE,
    Status VARCHAR(50), -- Open, Delayed, Received
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);