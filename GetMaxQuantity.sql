-- Task 1
create procedure GetMaxQuantity()
select max(Quantity) as 'Max Quantity in Order' from orders;

call GetMaxQuantity;

-- Task 2
prepare GetOrderDetail from 'SELECT OrderID, Quantity, TotalCost FROM orders WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;