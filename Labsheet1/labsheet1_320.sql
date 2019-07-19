create table department320
(dept_name varchar(20),
building varchar(15),
budget numeric(12,2),
primary key(dept_name));


create table course320
(course_id varchar(7),
title varchar(50),
dept_name varchar(20),
credits numeric(2,0),
primary key(course_id),
foreign key(dept_name) references department320);

create table instructor320
( ID varchar(5),
  name varchar(20) not null,
  dept_name varchar(20),
  salary numeric(8,2),
  primary key(ID),
  foreign key(dept_name) references department320);

insert into department320(dept_name,building,budget)
values('CSE','BlockA',20000),('ME','BlockB',250000),('EEE','BlockC',30000);
insert into department320
values('ECE','BlockB',230000);

insert into course320(course_id,title,dept_name,credits)
values('15CSE23','DBMS','CSE',4),('15CSE24','TOC','CSE',4),('15ME22','FLUID','ME',4),('15ECE25','DIGITAL LOGIC','ECE',4),('15EEE26','SEMICONDUCTORS','EEE',4);

insert into course320
values('15CSE32','DSA','CSE',3);
insert into instructor320(ID,name,dept_name,salary)
values('101','Jayakumar P','EEE',25000),('102','Dr.Ramkishan','ECE',30000),('103','Dr.Krishna','EEE',25000);
insert into instructor320
values('104','Dr.Swamy','CSE',240000);

select * from department320;
select * from course320;
select * from instructor320;
select name from instructor320;
select dept_name from instructor320;
select name,salary*1.1 from instructor320;
select * from instructor320 where salary between 10000 and 26000;

update instructor320
set salary=salary+100 where salary < 30000;
update instructor320
set salary=salary+200 where name='Dr.Krishna';

delete from instructor320;
delete from instructor320 where dept_name='CSE';
 


--Exercise

select * from department320;
select * from student320;
select * from course320 where dept_name='CSE'
select * from course320 where dept_name='CSE' and credits=3;
update course320 set credits=2 where title='FLUID';
delete from course320 where credits<3;
create table student320
(
roll varchar(20),
name varchar(20),
place varchar(10),
phone numeric(10),
primary key(roll)
);
insert into student320(roll,name,place,phone)
values('ENU4100','Rakesh','Kerala',123456789),('ENU4120','Lenard','Tamil Nadu',24681999),('ENU4321','Raju','Delhi',12341400);

alter table student320
add column cgpa numeric(3,2); 
update student320
set cgpa=9.5 where name='Lenard';
update student320
set cgpa=9.74 where roll='ENU4100';
update student320
set cgpa=9.8 where roll='ENU4321';


