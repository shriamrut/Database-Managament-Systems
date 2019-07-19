create table cust
(
custid varchar(3),
Lname varchar(15),
Fname varchar(15),
area varchar(2),
phoneno numeric(8,0),
primary key(custid));
create table movie
(
mvno numeric(2,0),
title varchar(25),
type varchar(10),
star varchar(25),
price numeric(8,2),
primary key(mvno)
);
create table invoice
(
invno varchar(3),
mvno numeric(2),
custid varchar(3),
issueDate Date,
retDate Date,
foreign key(custid) references cust,
foreign key(mvno) references movie,
primary key(invno)
);
insert into cust(custid,Lname,Fname,area,phoneno)
values('A01','Bayross','Ivan','sa',6125467),
('A02','Saitwal','Vandana','mu',5560379),
('A03','Jaguste','Pramada','da',4563891),
('A04','Navindgi','Basu','ba',6125401),
('A05','Sreedhar','Ravi','va',NULL),
('A06',NULL,'Rukmini','gh',5125274);

insert into movie(mvno,title,type,star,price)
values
(1,'Bloody Vengeance','action','Jackie Chan',100.00),
(2,'The Firm','thriller','Tom cruise',200.00),
(3,'Pretty Woman','romance','Richard Gere',150.00),
(4,'Home Alone','Comedy','Macaulay Culkin',150.55),
(5,'The Fugitive','Thriller','Harrison Ford',200.00),
(6,'Coma','Suspense','Michael Douglas',100.00),
(7,'Dracula','Horror','Gary Oldman',150.25),
(8,'Quick change','Comedy','Bill Murray',100.00),
(9,'Gone with the wind','Drama','Clarke Gable',200.00),
(10,'Carry on Doctor','Comedy','Leslie Phillips',100.00);

insert into invoice(invno,mvno,custid,issueDate,retDate)
values
('i01',4,'A01','23-jul-2012','25-jul-2012'),
('i02',3,'A02','12-aug-2012','15-aug-2012'),
('i03',1,'A02','15-aug-2012','18-aug-2012'),
('i04',6,'A03','10-sep-2012','13-sep-2012'),
('i05',7,'A04','05-aug-2012','08-aug-2012'),
('i06',2,'A06','18-sep-2012','20-sep-2012'),
('i07',9,'A05','07-jul-2012','10-jul-2012'),
('i08',9,'A01','11-aug-2012','14-aug-2012'),
('i09',5,'A03','06-jul-2012','09-jul-2012'),
('i10',8,'A06','03-sep-2012','06-sep-2012');
select * from movie;
select * from cust;
select * from invoice;
/*1*/
select concat(Fname,' ',Lname) as "Name" from cust;
/*2*/
select * from cust;
/*3*/
select Fname,area from cust;
/*4*/
select distinct type from movie;
/*5*/
select concat(Fname,' ',Lname) as "Name" from cust
where Fname like '_a%';
/*6*/
select Lname from cust
where Lname like 'S%' or Lname like 'J%';
/*7*/
select * from cust;
select Lname from cust
where Lname like '[B-S]%';
/*8*/
select * from cust
where area like '_a%';
/*9*/
select * from cust
where area in ('ba','mu','gh');
/*10*/
select * from cust
where phoneno>5550000;

select concat(Fname,' ',Lname) as "Name" from cust
where phoneno is NULL;
/*11*/
select * from invoice
where extract(month from issuedate)=9;
/*12*/
select * from invoice
where custid in('A01','A02');
/*13*/
select * from movie
where type in('action','Comedy');
/*14*/
select * from movie
where price>150 and price<=200;
/*15*/
update movie
set price=price*15 where price>159;
/*16*/
alter table movie
rename price to newprice;
/*17*/
select * from movie
order by title;
/*18*/
select * from movie
order by type,title;
/*19*/
select title,type from movie
where type<>'Horror';
/*20*/
select *,sqrt(newprice) as "Square root price"
from movie;
/*21*/
select distinct(type),avg(newprice) from movie
group by type;
/*22 Error*/
select * from movie
group by(type);
/*23 Aggregate functions are not allowed in where*/
select count(mvno) from movie where count(mvno)>2;
/*24 ?*/
select Fname,title from cust,movie,invoice
where invoice.custid=cust.custid and movie.mvno=invoice.mvno;
/*25*/
select custid,Fname,Lname,area from cust
where phoneno is null;
/*26*/
delete from invoice
where retDate < '10-jul-1993';
/*27*/
update cust
set area='vs' where custid='A05';
/*28*/
select custid,mvno from invoice;
/*29*/
select custid,to_char(retDate, 'Month') as "Month"
from invoice;
/*30*/
select * from movie,invoice
where invoice.mvno=movie.mvno and movie.star='Amir';
/*31 */
select title from cust,movie,invoice
where invoice.mvno=movie.mvno and invoice.custid=cust.custid and cust.Fname='Vandana';
/*32*/
alter table invoice
add column remark varchar(25);
update invoice
set remark='Good';
/*33*/
select mvno from invoice,cust
where cust.custid=invoice.custid and cust.Fname='Pramada';
/*34*/
update cust
set phoneno=466389 where Fname='Pramada';
/*35*/
update invoice
set issuedate='24-jul-1993' where custid='A01';
/*36*/
update movie
set newprice=250.00 where title='Gone with the wind';
/*37*/
delete from invoice
where invno='i05';
/*38*/
delete from invoice 
where retDate < '10-july-1993';
/*39*/
update cust
set area='vs' where custid='A05';
/*40*/
select * from cust;
update cust
set Lname='Rani' where Fname='Rukmini';
/*41*/
update movie
set newprice=newprice+100;
/*42*/
update cust
set area='LA' where Fname like '_r%';
/*43*/
delete from cust
where area='ba';