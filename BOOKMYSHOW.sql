create database BookMyShow

create table Customer(
CID     int         primary key,
Cname   varchar(30) not null,
mobile  int         not null,
email   varchar(40) null,
city    varchar(40) not null,
)

insert into Customer values(101,'Rohan',1234789008,'qwerty@gmail.com','HDP')
insert into Customer values(102,'Shiva',1234789045,'shiva@gmail.com','TPT')
insert into Customer values(103,'Prabhas',1245789008,'prabhas@gmail.com','HDP')
insert into Customer values(104,'Koushik',1234785608,'koushik@gmail.com','HDP')
insert into Customer values(105,'Gowd',1234789008,'gowd@gmail.com','HDP')
insert into Customer values(106,'Gokul',1234784900,'gokul@gmail.com','TPT')
insert into Customer values(107,'Yesh',1434789008,'yesh@gmail.com','HDP')
insert into Customer values(108,'Anil',7569082245,'anil@gmail.com','HDP')
insert into Customer values(109,'Uttam',1234789808,'uttam@gmail.com','HDP')
insert into Customer values(110,'Rohit',1234789132,'rohit@gmail.com','HDP')
insert into Customer values(111,'Deva',9876789008,'deva@gmail.com','HDP')
insert into Customer values(112,'Me',1234784567,'Me@gmail.com','HDP')
insert into Customer values(113,'Hemanth',1234781233,'hemanth@gmail.com','HDP')
insert into Customer values(114,'Gopal',12987654234,'gopal@gmail.com','HDP')
insert into Customer values(115,'King',12341234567,'king@gmail.com','HDP')
select * from Customer
drop table Customer

create table Movie(
MID       int          primary key,
Mname     varchar(20)  not null,
Language  varchar(20)  not null,
Genre     varchar(10)  not null,
duration  int          not null,
)
insert into Movie values(201,'KGF','Telugu','Action',2)
insert into Movie values(202,'KGF2','Telugu','Action',3)
insert into Movie values(203,'BRO','Telugu','Comedy',3)
insert into Movie values(204,'OG','Telugu','Action',4)
insert into Movie values(205,'OG2','Telugu','Action',3)
select * from Movie
drop table Movie

create table Theatre (
TID        int          primary key,
Tname      varchar(30)  not null,
Tlocation  varchar(40)  not null,
city       varchar(30)  not null,
screens    int          null,
)
insert into Theatre values(301,'PVR','Busstand','TPT',1)
insert into Theatre values(302,'CS','Circle','TPT',3)
insert into Theatre values(303,'PGR','Busstand','TPT',2)
insert into Theatre values(304,'Sandhya','Busstand','TPT',4)
insert into Theatre values(305,'Jayam','Circle','TPT',5)
insert into Theatre values(306,'Pratap','Circle','TPT',3)
insert into Theatre values(307,'Palani','Busstand','TPT',2)
insert into Theatre values(308,'CS','Chandragiri','TPT',2)
insert into Theatre values(309,'PVR2','Busstand','TPT',4)
insert into Theatre values(310,'Jaya','Busstand','TPT',3)
select * from Theatre
drop table Theatre

create table Show(
SID      int           primary key,
MID      int           foreign key references Movie(MID),
TID      int           foreign key references Theatre(TID),
show     varchar(50)   not null,
date     date          not null,
time     time          not null,
)
insert into Show values(401,201,301,'MRG','2026-08-13','1:00PM')
insert into Show values(402,202,302,'EVNG','2026-08-15','6:00PM')
insert into Show values(403,203,303,'AFN','2026-08-21','4:00PM')
insert into Show values(404,204,304,'MRG','2026-08-16','7:00PM')
insert into Show values(405,205,305,'MRG','2026-08-18','8:00PM')
insert into Show values(406,206,306,'MRG','2026-08-13','1:00PM')
insert into Show values(407,207,307,'EVENG','2026-09-13','7:00PM')
insert into Show values(408,208,308,'AFN','2026-08-13','1:00PM')
insert into Show values(409,209,309,'AFN','2026-07-15','7:00PM')
insert into Show values(410,210,310,'AFN','2026-12-13','2:00PM')
select * from Show
drop table Show

create table Booking(
BID				int    primary key,
CID				int    foreign key references Customer(CID),
SID				int    foreign key references Show(SID),
seats           int    not null,
Booking_date    date  not null,
)
insert into Booking values(501,101,401,3,'2026-08-14')
insert into Booking values(502,102,402,2,'2026-08-13')
insert into Booking values(503,103,403,3,'2026-08-15')
insert into Booking values(504,104,404,6,'2026-09-14')
insert into Booking values(505,105,405,3,'2026-08-24')
insert into Booking values(506,106,406,7,'2026-08-18')
insert into Booking values(507,107,407,3,'2026-08-14')
insert into Booking values(508,108,408,9,'2026-08-21')
insert into Booking values(509,109,409,5,'2026-08-30')
insert into Booking values(510,110,410,3,'2026-08-16')
select * from Booking
drop table Booking

create table Payment(
PID				int			   primary key,
BID				int			   foreign key references Booking(BID),
Amount			int            not null,
ptype           varchar(10)    not null,
pstatus         varchar(10)    not null,
)

insert into Payment values(601,501,399,'card','success')
insert into Payment values(602,502,499,'cash','success')
insert into Payment values(603,503,3999,'UPI','success')
insert into Payment values(604,504,2999,'card','success')
insert into Payment values(605,505,3969,'UPI','success')
insert into Payment values(606,506,3299,'cash','fail')
insert into Payment values(607,507,3929,'card','success')
insert into Payment values(608,508,4993,'UPI','process')
insert into Payment values(609,509,3997,'cash','success')

select * from Payment
drop table Payment

 select * from Customer
 where city = 'TPT'

/* 102	Shiva	1234789045	shiva@gmail.com	TPT */

select Cname , mobile from Customer
where city = 'HDP'

/* Rohan	1234789008
Prabhas	1245789008
Koushik	1234785608
Gowd	1234789008
Gokul	1234784900 */

select * from Movie
where Language = 'Telugu'

/* 201	KGF	Telugu	Action	2
202	KGF2	Telugu	Action	3
203	BRO	Telugu	Comedy	3
204	OG	Telugu	Action	4
205	OG2	Telugu	Action	3 */

select Mname , Genre from Movie
where Genre = 'Action'

/* KGF	Action
KGF2	Action
OG	Action
OG2	Action */

select Mname from Movie
where duration > 2

/* KGF2
BRO
OG
OG2 */

select * from Theatre 
where Tlocation = 'Circle'

/* 302	CS	Circle	TPT	3
305	Jayam	Circle	TPT	5
306	Pratap	Circle	TPT	3 */

select Tname , Tlocation from Theatre
where screens < 3

/* PVR	Busstand
PGR	Busstand
Palani	Busstand
CS	Chandragiri */

select show from Show
where date = '2026-09-13'

select SID , MID , time from Show
where time > '6:00PM'

/* 404	204	19:00:00.0000000
405	205	20:00:00.0000000 */

select * from Booking 
where seats > 3

/* 504	104	404	6	2026-09-14 */

select BID , CID , seats from Booking
where Booking_date < '2026-08-14'

/* 502	102	2 */

select Amount from Payment
where Amount > 500 

/* 5991
5999
5949
5399 */

select PID,BID,ptype from Payment
where ptype = 'UPI'

select * from Payment
where pstatus = 'success'

select Cname,email from Customer
where city = 'TPT'

select Mname from Movie
where Language = 'telugu' and Genre = 'Action'

select Mname from Movie
where duration > 120 and duration < 180

select * from Customer
where city = 'TPT'

select * from Theatre
where city = 'TPT'

select Tname from Theatre
where screens < 2 and city = 'TPT'

select BID,CID from Booking
where date = '2026-08-16' or seats > 4

 select * from Payment
 where Amount > 500 and pstatus = 'success'

 select PID,Amount,ptype from Payment
 where ptype = 'UPI' or ptype = 'card'

 select Cname from Customer
 where city = 'TPT' or city = 'HYD'

 select CID,Cname from Customer
 where city = 'TPT'

 select Mname,Language ,Genre from Movie
 where duration < 120

 select Tname,city,screens from Theatre
 where screens > 3

 select SID,MID,time from Show
 where time > '6 PM'