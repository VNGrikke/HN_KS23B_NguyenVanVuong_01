create database de01;
use de01;

create table Flight(
	flight_id varchar(10) primary key,
    airline_name varchar(100) not null,
    departure_airport  varchar(100) not null,
    arrival_airport varchar(100) not null,
    departure_time datetime,
    arrival_time datetime,
    ticket_price decimal 
);

create table Passenger(
	passenger_id varchar(10) primary key,
	passenger_full_name varchar(150) not null,
	passenger_email varchar(255) unique not null,
	passenger_phone varchar(15) unique not null,
	passenger_bod date
);

create table Booking(
	booking_id int auto_increment primary key,
	passenger_id varchar(10),
	flight_id varchar(10),
	booking_date datetime default(current_timestamp),
	booking_status enum( 'Confirmed','Cancelled', 'Pending'),
    foreign key(passenger_id) references Passenger(passenger_id),
	foreign key(flight_id) references Flight(flight_id)
);

create table Payment(
	payment_id int auto_increment primary key,
	booking_id int not null,
	payment_method enum('Credit Card', 'Bank Transfer', 'Cash'),
	payment_amount decimal,
	payment_date datetime default(current_timestamp),
	payment_status enum('Success', 'Failed', 'Pending'),
    foreign key(booking_id) references booking(booking_id)
);

-- PHAN 2
-- 2
alter table Passenger add column passenger_gender enum('Nam', 'Nu');

-- 3
alter table Booking add column ticket_quantity int default(1);

-- 4
alter table Payment modify column payment_amount decimal(10,2) check(payment_amount>0);


-- PHAN 3
-- 1
insert into Passenger(
	passenger_id,
	passenger_full_name,
	passenger_email,
	passenger_phone,
	passenger_bod,
	passenger_gender
)
values 
('P0001', 'Nguyen Anh Tuan', 'tuan.nguyen@example.com', '0901234567', '1995-05-15', 'Nam'),
('P0002', 'Tran Thi Mai', 'mai.tran@example.com', '0912345678', '1996-06-16', 'Nu'),
('P0003', 'Le Minh Tuan', 'tuan.le@example.com', '0923456789', '1997-07-17', 'Nam'),
('P0004', 'Pham Hong Son', 'son.pham@example.com', '0934567890', '1998-08-18', 'Nam'),
('P0005', 'Nguyen Thi Lan', 'lan.nguyen@example.com', '0945678901', '1999-09-19','Nu'),
('P0006', 'Vu Thi Bao', 'bao.vu@example.com', '0956789012', '2000-10-20', 'Nu'),
('P0007', 'Doan Minh Hoang', 'hoang.doan@example.com', '0967890123', '2001-11-21', 'Nam'),
('P0008', 'Nguyen Thi Thanh', 'thanh.nguyen@example.com',' 0978901234', '2002-12-22', 'Nu'),
('P0009', 'Trinh Bao Vy', 'vy.trinh@example.com', '0989012345', '2003-01-23', 'Nu'),
('P0010', 'Bui Hoang Nam', 'nam.bui@example.com', '0990123456', '2004-02-24', 'Nam');


insert into Flight(
flight_id,
airline_name,
departure_airport,
arrival_airport,
departure_time,
arrival_time,
ticket_price
)
values
('F001', 'VietJet Air', 'Tan Son Nhat', 'Nha Trang', '2025/03/01 08:00:00 ', '2025/03/01 10:00:00 ', '150.5'),
('F002', 'Vietnam Airlines', 'Noi Bai', 'Hanoi', '2025/03/01 09:00:00', '2025/03/01 11:30:00 ', '200.0'),
('F003', 'Bamboo Airways', 'Da Nang', 'Phu Quoc ', '2025/03/01 10:00:00', '2025/03/01 12:00:00 ', '120.8'),
('F004', 'Vietravel Airlines', 'Can Tho', 'Ho Chi Minh', '2025/03/01 11:00:00', '2025/03/01 12:30:00', ' 180.0');

insert into Booking(
passenger_id,
flight_id,
booking_date,
booking_status,
ticket_quantity
)
values
('P0001', 'F001', '2025-02-20', 'Confirmed', 1),
('P0002', 'F002', '2025-02-21', 'Cancelled', 2),
('P0003', 'F003', '2025-02-22', 'Pending', 1),
('P0004', 'F004', '2025-02-23', 'Confirmed',3),
('P0005', 'F001', '2025-02-24', 'Pending',1),
('P0006', 'F002', '2025-02-25', 'Confirmed',2),
('P0007', 'F003', '2025-02-26', 'Cancelled',1),
('P0008', 'F004', '2025-02-27', 'Pending',4),
('P0009', 'F001', '2025-02-28', 'Confirmed',1),
('P0010', 'F002', '2025-02-28', 'Pending',1),
('P0001', 'F003', '2025-03-01', 'Confirmed',3),
('P0002', 'F004', '2025-03-02', 'Cancelled',1),
('P0003', 'F001', '2025-03-03', 'Pending',2),
('P0004', 'F002', '2025-03-04', 'Confirmed',1),
('P0005', 'F003', '2025-03-05', 'Cancelled',2),
('P0006', 'F004', '2025-03-06', 'Pending',1),
('P0007', 'F001', '2025-03-07', 'Confirmed',3),
('P0008', 'F002', '2025-03-08', 'Cancelled',2),
('P0009', 'F003', '2025-03-09', 'Pending',1),
('P0010', 'F004', '2025-03-10', 'Confirmed',1);


insert into Payment( 
booking_id,
payment_method,
payment_amount,
payment_date,
payment_status
)
values
(1, 'Credit Card', 150.5, '2025-02-20', 'Success'),
(2, 'Bank Transfer', 200.0, '2025-02-21', 'Failed'),
(3, 'Cash', 120.8, '2025-02-22', 'Pending'),
(4, 'Credit Card', 180.0, '2025-02-23', 'Success'),
(5, 'Bank Transfer', 150.5, '2025-02-24', 'Pending'),
(6, 'Cash', 200.0, '2025-02-25', 'Success'),
(7, 'Credit Card', 120.8, '2025-02-26', 'Failed'),
(8, 'Bank Transfer', 180.0, '2025-02-27', 'Pending'),
(9, 'Cash', 150.5, '2025-02-28', 'Success'),
(10, 'Credit Card', 200.0, '2025-03-01', 'Pending');


-- 2
set SQL_SAFE_UPDATES = 0;



update Payment p
set p.payment_status = 'Success'
where p.payment_amount>0 and payment_method = 'Credit Card';

update Payment p
set p.payment_status = 'Pending'
where p.payment_amount<100 and payment_method = 'Bank Transfer';

update Payment p
set p.payment_status = 'Success'
where 
	year(p.payment_date) <= year(current_date()) 
    and month(p.payment_date) <= month(current_date())
    and day(p.payment_date) <= day(current_date());

-- 3
delete from Payment p where p.payment_status = 'Pending' and p.payment_method = 'Cash';


-- PHAN 4
-- 1
select 
	p.passenger_id,
	p.passenger_full_name,
	p.passenger_email,
	p.passenger_bod,
	p.passenger_gender
from Passenger p
order by p.passenger_full_name asc 
limit 5;


-- 2
select 
	flight_id,
	airline_name,
	departure_airport,
	arrival_airport,
	ticket_price
from Flight
order by ticket_price desc;


-- 3
select
	b.passenger_id,
    p.passenger_full_name,
    concat(f.departure_airport,' - ',f.arrival_airport, ' - ', f.departure_time) as 'flight'
from Booking b
join passenger p on p.passenger_id = b.passenger_id
join flight f on f.flight_id = b.flight_id
where booking_status = 'Cancelled';

-- 4
select 
	b.booking_id,
    b.passenger_id,
    concat(f.departure_airport,' - ',f.arrival_airport, ' - ', f.departure_time) as 'flight',
	b.ticket_quantity
from booking b
join flight f on f.flight_id = b.flight_id
where booking_status = 'Confirmed'
order by b.ticket_quantity desc;


-- 5
select 
	b.booking_id,
	p.passenger_full_name,
    concat(f.departure_airport,' - ',f.arrival_airport, ' - ', f.departure_time) as 'flight',
	b.ticket_quantity
from booking b
join flight f on f.flight_id = b.flight_id
join passenger p on p.passenger_id = b.passenger_id
where b.ticket_quantity between 2 and 3
order by p.passenger_full_name desc;

-- 6
select 
	b.passenger_id,
	p.passenger_full_name,
	b.ticket_quantity
from booking b
join passenger p on p.passenger_id = b.passenger_id
where b.ticket_quantity >= 2 and b.booking_status = 'Pending';

-- 7
select
	b.passenger_id,
    p.passenger_full_name,
	sum(pm.payment_amount)
from booking b
join passenger p on p.passenger_id = b.passenger_id
join payment pm on pm.booking_id = b.booking_id
where pm.payment_status = 'Success'
group by b.passenger_id;

-- 8
select
	b.passenger_id,
    p.passenger_full_name,
    b.ticket_quantity,
    b.booking_status
from booking b
join passenger p on p.passenger_id = b.passenger_id
order by b.ticket_quantity desc
limit 5;


-- 9
select 
    b.flight_id,
    f.airline_name,
    sum(b.ticket_quantity) as total_ticket
from booking b
join flight f on f.flight_id = b.flight_id
group by b.flight_id, f.airline_name
having sum(b.ticket_quantity) = (
    select max(total_tickets)
    from (
        select sum(b2.ticket_quantity) as total_tickets
        from booking b2
        group by b2.flight_id
    ) subquery
);


-- 10
select
	p.passenger_full_name,
    pm.payment_amount,
    pm.payment_status
from booking b
join passenger p on p.passenger_id = b.passenger_id
join payment pm on pm.booking_id = b.booking_id
where year(p.passenger_bod) < 2000;


-- PHAN 5
-- 1
create view view_all_passenger_booking as
select
    p.passenger_id,
    p.passenger_full_name,
    b.booking_id,
    b.flight_id,
    b.ticket_quantity
from passenger p
join booking b on p.passenger_id = b.passenger_id;

select * from view_all_passenger_booking;


-- 2
create view view_successful_payment as
select
	b.passenger_id,
    p.passenger_full_name,
    pm.payment_amount
from booking b
join passenger p on p.passenger_id = b.passenger_id
join payment pm on pm.booking_id = b.booking_id
where pm.payment_status = 'Success';

select * from view_successful_payment;

-- PHAN 6
-- 1
delimiter //
set autocommit = 0;
create trigger check_ticket
before insert on Booking
for each row
begin
    if new.ticket_quantity < 1 then
        signal sqlstate '45000'
        set message_text = 'So luong ve khong duoc nho hon 1';
    end if;
end;
//
delimiter ;

-- 2
delimiter //
set autocommit = 0;
create trigger auto_update
after insert on payment
for each row
begin
    if (select payment_status from payment where payment_id = LAST_INSERT_ID()) <> 'Success' then
		signal sqlstate '45000'
        set message_text = 'Da cap nhat thanh cong';
    else
		update Booking
        set Booking.booking_status = 'Confirmed'
        where (select booking_id from payment where payment_id = LAST_INSERT_ID()) = Booking.booking_id
	end if;
end;
//
delimiter ;


-- PHAN 7
-- 1
delimiter //
create procedure GetAllPassengerBookings()
begin
	select 
    	b.passenger_id,
		p.passenger_full_name,
        b.booking_id,
        b.flight_id,
        b.ticket_quantity
    from booking b
    join passenger p on p.passenger_id = b.passenger_id;
end;
// delimiter ;

call GetAllPassengerBookings();


-- 2
delimiter //
create procedure AddBooking(p_booking_id int, p_passenger_id varchar(10), p_flight_id varchar(10), p_ticket_quantity int)
begin
	update booking b
    set b.passenger_id = p_passenger_id, b.flight_id = p_flight_id, b.ticket_quantity = p_ticket_quantity
    where b.booking_id = p_booking_id;
end
// delimiter ;

