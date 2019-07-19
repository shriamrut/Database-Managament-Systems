create table employee320
(
	employee_id varchar(15), 
	ename varchar(20), 
	date_of_birth date, 
	salary numeric(9,2),
	primary key(employee_id)	
);

insert into employee320(employee_id,ename,date_of_birth,salary)
values('151',' Rithik Goswamy','1999/07/23',500000.25),('155','Nikhil Gupta ','1994/05/11',700000.65),('160','Saumya Sarkar','1992/03/11',900000),
('171','Rohan','1999/10/14',600000.85),('198','Vaisakh ','1999/09/06',800000.95);
/*1*/
select ceiling(salary) from employee320;
/*2*/
select floor(salary) from employee320;
/*3*/
select round(salary,2) from employee320;
/*4*/
select power(salary,2) from employee320;
/*5*/
select lower(ename) from employee320;
/*6*/
select ename,length(ename) from employee320;
/*7*/
select Lpad(ename,15,'*') from employee320;
/*8*/
select Rpad(ename,15,'*') from employee320;
/*9*/
select Ltrim(ename,' ') from employee320;
/*10*/
select Rtrim(ename,' ') from employee320;
/*11*/
select substring(ename,2,3) from employee320;
/*12*/
select to_char(date_of_birth,'dd/mm/yyyy') from employee320;
/*13*/
select to_date('20170103','YYYYMMDD');
/*14*/
select to_date('2017 Feb 20','YYYY Mon DD');
/*15*/
select * from employee320 where to_char(date_of_birth,'month')='september';

/*Create Tables*/
create table Department
(
	depname varchar(15),
	location varchar(15),
	budget numeric(10,2),
	primary key(depname)
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
