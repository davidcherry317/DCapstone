-- Task 3
delimiter //
create procedure CancelBooking(p_BookingID int)
begin
	delete from bookings where BookingID = p_BookingID;
    select concat('Booking ', p_BookingID, 'cancelled') as 'Confirmation';
end //
delimiter ;

call CancelBooking(5);