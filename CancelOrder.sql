-- Task 3
delimiter //
create procedure CancelOrder(ID int)
begin
delete from orders where OrderID = ID;
select concat('Order ', ID, ' has been cancelled') as Confirmation;
end //
delimiter ;

SET SQL_SAFE_UPDATES = 0;
call CancelOrder(3);