-- This is our main query for the dashboard.
-- It joins everything related to sales into one clean view.
-- This is the "magic sorter" at work.

SELECT
    oi.OrderItemID,
    o.OrderID,
    o.OrderDate,
    o.Platform,
    o.OrderStatus,
    c.ShippingCity,
    c.ShippingState,
    c.ShippingZip,
    c.ShippingCountry,
    p.SKU,
    p.ProductName,
    p.Category,
    oi.Quantity,
    oi.NetPrice, -- Netto price per item
    (oi.NetPrice * oi.Quantity) AS NetRevenue, -- Total Net Revenue for this line item
    p.PurchasePrice, -- Cost of one item
    (p.PurchasePrice * oi.Quantity) AS TotalCostOfGoods,
    ((oi.NetPrice - p.PurchasePrice) * oi.Quantity) AS GrossProfit -- The profit for this line item
FROM OrderItems oi
JOIN Orders o ON oi.OrderID = o.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Customers c ON o.CustomerID = c.CustomerID
-- We only want to analyze completed or returned orders for financial KPIs
WHERE o.OrderStatus IN ('Shipped', 'Returned');