drop table course cascade;
drop table department cascade;
drop table student cascade;
drop table instructor cascade;
drop table teach cascade;
drop table section cascade;
drop table take cascade;
/*Data base schema creation*/
create table Department
(
	depname varchar(15),
	location varchar(15),
	budget numeric(10,2),
	primary key(depname)
);
create table Course
(
CCode varchar(5),
ctitle varchar(15),
credits numeric(2),
depname varchar(15),
primary key(CCode),
foreign key(depname) references Department
);
create table Section
(
section_id varchar(5),
CCode varchar(5),
SEM numeric(2),
year numeric(4),
room_no varchar(4),
primary key(section_id,CCode,SEM,year),
foreign key(CCode) references Course
);
create table Teach
(
	id varchar(15),
	section_id varchar(5),
	CCode varchar(5),
	SEM numeric(2),
	year numeric(4),
	primary key(id,section_id,CCode,SEM,year),
	foreign key(section_id,CCode,SEM,year) references Section(section_id,CCode,SEM,year)
);
create table Student
(
	Sid varchar(4),
	sname varchar(15),
	date_of_birth date,
	depname varchar(15),
	primary key(Sid),
	foreign key(depname) references Department
);
create table Take
(
Sid varchar(4),
section_id varchar(5),
CCode varchar(5),
SEM numeric(2),
year numeric(4),
grade varchar(2),
primary key(Sid,section_id,SEM,year),
foreign key(section_id,CCode,SEM,year) references Section(section_id,CCode,SEM,year)
);
create table Instructor
(
	id varchar(15),
	iname varchar(20),
	designation varchar(10),
	salary numeric(10,3),
	depname varchar(15),
	primary key(id),
	foreign key(depname) references Department
);


select * from course;
select * from department
select * from student;
select * from instructor;
select * from teach;
select * from section;
select * from take;

insert into department(depname,location,budget)
values('CS and AI','Block A',1500000),('Electronics','Block B',125000),
('Physics','Block A',200000),('Mathematics','Block B',250000);

insert into course(ccode,ctitle,credits,depname)
values('CS100','Data Structures',4,'CS and AI'),
('MAT01','Linear Algebra',4,'Mathematics'),
('MAT02','Discrete Math',3,'Mathematics'),
('CS101','Algorithms',4,'CS and AI'),
('CS102','OS',4,'CS and AI'),
('EC101','Chip Design',4,'Electronics'),
('EC102','EM Waves',4,'Electronics');

insert into instructor(id,iname,designation,salary,depname)
values('123','Dr.Ramesh','AProfessor',100000,'CS and AI'),
('125','Dr.Gopi','AProfessor',124000,'CS and AI'),
('124','Dr.Suresh','AProfessor',120000,'Mathematics'),
('126','Dr.Ghatak','Professor',145000,'Mathematics'),
('127','Maya','Professor',150000,'Electronics'),
('128','Ashwarya','TA',125000,'Electronics');

insert into section(section_id,ccode,sem,year,room_no)
values('101','CS100',4,2005,130),
('102','MAT01',3,2005,131),
('103','CS101',2,2005,132),
('104','CS102',3,2005,133),
('106','EC101',4,2005,135),
('107','EC102',5,2006,136),
('108','MAT02',6,2007,137);

insert into teach(id,section_id,ccode,sem,year)
values('123','103','CS101',2,2005),
('124','102','MAT01',3,2005);

insert into student(sid,sname,date_of_birth,depname)
values('0000','Rahul','1999-11-02','CS and AI'),
('0001','Rohan','1999-05-03','CS and AI'),
('0002','Anandhu','1999-04-02','Mathematics'),
('0003','Laxman','1998-03-03','Electronics'),
('0004','Kumble','1997-02-02','CS and AI'),
('0005','Dravid','1999-05-30','Mathematics');

insert into take(sid,section_id,ccode,sem,year,grade)
values('0000','101','CS100',4,2005,'A+'),
('0001','102','MAT01',3,2005,'O'),
('0003','106','EC101',4,2005,'A'),
('0004','108','MAT02',6,2007,'O');
/*a*/
select iname,location from instructor natural join department;
/*b*/
select iname,ctitle from instructor natural join teach natural join course;
/*c*/
alter table instructor
add column gender varchar(1); 
update instructor 
set gender='M' where id='123';
update instructor
set gender='M' where id='125';
update instructor 
set gender='M' where id='124';
update instructor
set gender='M' where id='126';
update instructor
set gender='F' where id='127';
update instructor
set gender='F' where id='128';
/*d*/
insert into teach(id,section_id,ccode,sem,year)
values('127','103','CS101',2,2005),('128','104','CS102',3,2005);
select iname, ctitle from (instructor natural join teach) join course using (ccode) 
where instructor.gender='F';
/*e*/
select ctitle,budget from course natural join department;
/*f*/
select iname from (instructor natural join teach) join course 
using(ccode) where ctitle='OS';
/*g*/
select * from instructor;
select depname,count(*) from instructor
group by depname
having count(*)>=2
order by depname;
/*h*/
select iname,ctitle from (instructor natural join teach) join course using(ccode) where teach.year='2005';
/*i*/
select iname,ctitle from (instructor natural join teach) join course using(ccode) where teach.year='2005' 
and instructor.depname='CS and AI';
/*j*/
insert into course(ccode,ctitle,credits,depname)
values('CS150','DBMS',4,'CS and AI');
insert into section(section_id,ccode,sem,year,room_no)
values('109','CS150',4,2005,'136');
insert into take(sid,section_id,ccode,sem,year,grade)
values('0001','109','CS150',4,2005,'A'),('0002','109','CS150',4,2005,'A');

select sname from student natural join take join course using(ccode) where take.grade='A'
and course.ctitle='DBMS';
/*k*/
insert into section(section_id,ccode,sem,year,room_no)
values('109','CS150',4,2017,'136');
insert into take(sid,section_id,ccode,sem,year,grade)
values('0003','109','CS150',4,2017,'O');
select sid from student natural join take join course using(ccode) where take.year=2017
and course.ctitle='DBMS';
/*l*/
select iname,count(*) from instructor natural join teach
group by iname;
/*m*/
select iname,count(case when teach.year = 2017 then 1 else null end) from instructor natural join teach
group by iname;
/*n*/
insert into department(depname,location,budget)
values('TBI','Main',10000);
insert into instructor(id,iname,designation,salary,depname)
values(130,'Dr.Gogoi','Professor',10000,'TBI');
select iname from instructor natural join department where location='Main';
/*o*/
insert into course(ccode,ctitle,credits,depname)
values('CS501','C Programming',4,'CS and AI');
insert into section(section_id,ccode,sem,year,room_no)
values('109','CS501',2,2017,130);
insert into teach(id,section_id,ccode,sem,year)
values(125,'109','CS501',2,2017);
select iname from instructor natural join teach join course using(ccode)
where ctitle='C Programming' and teach.sem=2 and teach.year=2017;
/*p*/
select ccode,count(*) from teach group by ccode;


