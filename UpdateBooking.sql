-- Task 2
delimiter //
create procedure UpdateBooking(p_BookingID int, p_BookingDate date)
begin
	update bookings
    set BookingDate = p_BookingDate
    where BookingID = p_BookingID;
    
    select concat('Booking ', p_BookingID, ' updated') as 'Confirmation';
end //
delimiter ;

call UpdateBooking(5, '2022-12-17');