drop table R
drop table S
drop table B
create table S(
said int primary key,
sname varchar(20),
rating int,
age int
)
create table B(
bid int primary key,
bname varchar(20),
color varchar(10)
)
create table R(
said int FOREIGN KEY REFERENCES S(said),
bid int FOREIGN KEY REFERENCES B(bid),
dag date
)
insert into S values
(22,'Dustin', 7, 45),
(29,'Brutus', 1, 33),
(31,'Lubber', 8, 55),
(32,'Andy', 8, 25),
(58,'Rysty', 10, 35),
(64,'Horatio', 7, 35),
(71,'Zorba', 10, 16),
(74,'Horatio', 9, 35),
(85,'Art', 3, 25),
(95,'Bob', 3, 63)
insert into B values
(101,'Interlake', 'blue'),
(102,'Interlake', 'red'),
(103,'Clipper', 'green'),
(104,'Marine', 'red')
insert into R values
(22, 101, '1998-10-10'),
(22, 102, '1998-10-10'),
(22, 103, '1998-08-10'),
(22, 104, '1998-07-10'),
(31, 102, '1998-10-11'),
(31, 103, '1998-06-11'),
(31, 104, '1998-12-11'),
(64, 101, '1998-05-09'),
(64, 102, '1998-08-10'),
(74, 103, '1998-08-09')