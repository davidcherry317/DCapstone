-- Task 2
prepare GetOrderDetail from 'SELECT OrderID, Quantity, TotalCost FROM orders WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;