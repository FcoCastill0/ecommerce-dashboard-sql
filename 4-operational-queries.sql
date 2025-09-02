-- These are simpler queries for our operational views, like inventory and purchase orders.
-- We keep them separate to keep things fast and simple.

-- Query 1: Current Inventory Value
SELECT
    p.SKU,
    p.ProductName,
    p.Category,
    i.StockLevel,
    p.PurchasePrice,
    (i.StockLevel * p.PurchasePrice) AS InventoryValue,
    i.Warehouse
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
WHERE i.StockLevel > 0;

-- Query 2: Open & Delayed Purchase Orders
SELECT
    po.PO_ID,
    po.Supplier,
    p.SKU,
    p.ProductName,
    po.QuantityOrdered,
    po.ExpectedDate,
    po.Status,
    (po.QuantityOrdered * p.PurchasePrice) as OpenPO_Value
FROM PurchaseOrders po
JOIN Products p ON po.ProductID = p.ProductID
WHERE po.Status IN ('Open', 'Delayed');

-- Query 3: Open Customer Orders (Not yet shipped)
SELECT
    o.OrderID,
    o.OrderDate,
    o.Platform,
    c.ShippingCity,
    c.ShippingCountry,
    p.SKU,
    p.ProductName,
    oi.Quantity,
    (oi.NetPrice * oi.Quantity) AS OrderValue
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderStatus = 'Pending';