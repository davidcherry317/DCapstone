-- Task 1
delimiter //
create procedure AddBooking(p_BookingID int, p_BookingDate date, p_TableNumber int, p_CustomerID int)
begin
	insert into bookings(BookingID, BookingDate, TableNumber, CustomerID)
    values (p_BookingID, p_BookingDate, p_TableNumber, p_CustomerID);
    
    select 'New booking added' as 'Confirmation';
end //
delimiter ;

call AddBooking(5, '2022-12-30', 3, 2);
