-- This script fills our tables with sample data.

-- Add some products
INSERT INTO Products (ProductID, SKU, ProductName, Category, PurchasePrice, PackagingWeightKG) VALUES
(1, 'HB-001', 'Classic Teddy Bear', 'Toys', 8.50, 0.250),
(2, 'TECH-012', 'Wireless Headphones', 'Electronics', 35.00, 0.400),
(3, 'KIT-005', 'Espresso Machine', 'Kitchen', 120.00, 2.500),
(4, 'BOOK-101', 'German Cookbook', 'Books', 12.20, 0.750),
(5, 'HB-002', 'Deluxe Teddy Bear', 'Toys', 15.00, 0.350);

-- Add some customers
INSERT INTO Customers (CustomerID, ShippingCity, ShippingState, ShippingZip, ShippingCountry) VALUES
(101, 'Berlin', 'Berlin', '10115', 'Germany'),
(102, 'Hamburg', 'Hamburg', '20095', 'Germany'),
(103, 'Munich', 'Bavaria', '80331', 'Germany'),
(104, 'Paris', 'Île-de-France', '75001', 'France'),
(105, 'Cologne', 'North Rhine-Westphalia', '50667', 'Germany');

-- Add some orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Platform, OrderStatus) VALUES
(1001, 101, '2025-08-01', 'Amazon.de', 'Shipped'),
(1002, 102, '2025-08-03', 'Otto', 'Shipped'),
(1003, 103, '2025-08-05', 'Shopify', 'Returned'), -- This order was returned
(1004, 101, '2025-08-06', 'Amazon.de', 'Shipped'),
(1005, 104, '2025-08-10', 'Amazon.fr', 'Shipped'),
(1006, 105, '2025-08-12', 'Kaufland', 'Pending'), -- Not yet shipped
(1007, 102, '2025-08-15', 'Otto', 'Shipped');

-- Add items to the orders
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, GrossPrice, NetPrice) VALUES
(1, 1001, 1, 1, 24.99, 21.00),
(2, 1001, 4, 1, 19.99, 16.80),
(3, 1002, 2, 1, 79.99, 67.22),
(4, 1003, 3, 1, 249.99, 210.08), -- This item was returned
(5, 1004, 1, 2, 49.98, 42.00),
(6, 1005, 2, 1, 89.99, 75.62),
(7, 1006, 5, 1, 39.99, 33.61),
(8, 1007, 4, 1, 19.99, 16.80);

-- Add inventory levels
INSERT INTO Inventory (ProductID, StockLevel, Warehouse) VALUES
(1, 150, 'Main'),
(2, 45, 'Main'),
(3, 20, 'Main'),
(4, 200, 'Overflow'),
(5, 80, 'Main');

-- Add purchase orders for incoming stock
INSERT INTO PurchaseOrders (PO_ID, ProductID, Supplier, QuantityOrdered, ExpectedDate, Status) VALUES
(1, 2, 'TechSupplier Inc.', 50, '2025-09-10', 'Open'),
(2, 3, 'KitchenGoods GmbH', 25, '2025-08-25', 'Delayed'),
(3, 5, 'ToyFactory', 100, '2025-09-20', 'Open');