-- Task 1
insert into bookings
values
(1,'2022-10-10',5,1),
(2,'2022-11-12',3,3),
(3,'2022-10-11',2,2),
(4,'2022-10-13',2,1);

-- Task 2
delimiter //
create procedure CheckBooking(Booking_Date date, Table_Number int)
begin
declare BookedTable int default 0;
    
    select count(BookedTable) into BookedTable from bookings
    where BookingDate = Booking_Date and TableNumber = Table_Number;
    
    if BookedTable > 0 then
		select concat('Table ', Table_Number, ' is already booked') as 'Booking status';
	else
        select concat('Table ', Table_Number, " isn't booked") as 'Booking status';
    end if;
end //
delimiter ;

call CheckBooking('2022-11-12', 3);

-- Task 3

delimiter //
create procedure AddValidBooking(p_BookingDate date, p_TableNumber int)
begin
declare BookedTable int default 0;
start transaction;
	insert into bookings (BookingDate, TableNumber, CustomerID) values (p_BookingDate, p_TableNumber, 2);
	select count(BookedTable) into BookedTable from bookings where BookingDate = p_BookingDate and TableNumber = p_TableNumber;
    
    if BookedTable > 1 then
		rollback;
        select concat('Table ', p_TableNumber, ' is already booked - booking cancelled') as 'Booking status';
	else
		commit;
        select concat('Table ', p_TableNumber, ' is now booked') as 'Booking status';
    end if;
end //
delimiter ;

call AddValidBooking('2022-12-17', 6);
