-- This query provides the data for our Order Status Overview.
-- It pulls all orders that are currently in the fulfillment process.

SELECT
    OrderID,
    OrderDate,
    Platform,
    OrderStatus -- This is the key field: Pending, Picked, Packed, etc.
FROM
    Orders
-- In a real system, you'd filter for orders within the last 30-60 days
-- to keep the dashboard focused on current operations.
WHERE
    OrderStatus IN ('Pending', 'Picked', 'Packed', 'Shipped'); -- Shipped is included to see what just left.
