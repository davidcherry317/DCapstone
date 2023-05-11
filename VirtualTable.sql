-- Task 1 
create view OrdersView as
select OrderID, Quantity, TotalCost
from orders
where Quantity > 2;

-- Task 2
select 
	customers.CustomerID,
    customers.FullName,
    orders.OrderID,
    orders.TotalCost,
    menus.MenuName, 
    menuitems.CourseName
from customers
join orders on customers.CustomerID=orders.CustomerID
join menus on orders.MenuID=menus.MenuID
join menuitems on menuitems.MenuItemsID=menus.MenuItemsID
order by orders.TotalCost;

-- Task 3
select MenuName
from menus
where MenuID = ANY(select MenuID from orders where Quantity > 2);