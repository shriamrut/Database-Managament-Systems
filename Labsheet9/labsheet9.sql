delete from course;
delete from department;
delete from section;
delete from student; 
delete from instructor;
delete from take;
delete from teach;

select * from student;
select * from section;
select * from course;
select * from instructor;
select * from department;
select * from teach;
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

/*1*/
insert into section
values(112,'EC101',4,2010,'133');
select ccode from section where 
sem=4 and year=2010 or year=2009;

/*2*/
insert into section
values(113,'EC102',2,2009,'132');
select ccode from section where
(sem=2 and year=2009) and ccode not in (select ccode from section where sem=4 
and year=2010);

/*3*/
insert into department
values('Biology','Block A',200000);
insert into instructor
values(129,'Dr.Renuka','AProfessor',124000,'Biology');
select iname from instructor where salary > some (select salary from instructor 
where depname='Biology');

/*4*/
select iname from instructor where salary > all (select salary from instructor 
where depname='Biology');

/*5*/
select ccode from section where exists(select ccode from 
section where sem=4 and year=2010) and (sem=2 and year=2009);

/*6*/
insert into department
values('Geology','Block B',200000);
insert into instructor
values(130,'Dr.Bert','Professor',13000,'Geology');
select depname,round(avg(salary),2) as "salary" from instructor
group by depname
having avg(salary) > 42000;

/*7*/
/*Method 1*/
with new_table as (select depname,round(avg(salary),2) salary from instructor group by depname)
select iname,new_table.salary average from instructor,new_table where instructor.depname=new_table.depname;

/*Method 2*/
select a.iname,round(avg(b.salary),2) from instructor a,instructor b where a.depname=b.depname
group by a.iname;

/*8*/
with sal_details as (select depname,avg(salary) sal from instructor group by depname having avg(salary) > 20000)
select depname from sal_details where sal>20000;

/*9*/
insert into instructor
values(131,'Dr.Sheldon','Professor',150000,'Physics');
with max_salary as (select iname,salary from instructor where salary=(select max(salary) from instructor))
select instructor.iname,max_salary.salary from instructor,max_salary where max_salary.iname=instructor.iname;


/*10*/
with sal_details as (select depname,avg(salary) sal from instructor group by depname)
select depname,sal from sal_details where sal>(select avg(sal) from sal_details);

/*11 ?*/
with sal_details_sum as (select depname,sum(salary) sal2 from instructor group by depname),sal_details_avg as (select avg(sal2) as av_sal from sal_details_sum)
select sal_details_sum.depname from sal_details_avg,sal_details_sum where sal_details_sum.sal2 >= sal_details_avg.av_sal;

/*12*/
select depname,(select count(*) from instructor where instructor.depname=department.depname) from department;

select depname,count(*) from instructor group by depname;

/*13*/
with sal_details as (select depname,avg(salary) sal from instructor group by depname)
select A.iname from instructor A where A.salary> 2*(select sal from sal_details where sal_details.depname=A.depname);

/*14*/
update instructor
set salary=9999999 where iname='Dr.Bert';
with sal_details as (select depname,avg(salary) sal from instructor group by depname)
select A.depname from instructor A where A.salary> 2*(select sal from sal_details where sal_details.depname=A.depname);

/*15*/
select * from instructor;
select * from department;
insert into department
values('RLC','Watson Building',99999999);
insert into instructor
values('131','Dr.Howard','Professor',1000223,'RLC');

delete from instructor
where depname in (select depname from department where location='Watson Building');

/*16*/

select avg(salary) from instructor;
delete from instructor
where salary < (select round(avg(salary),2) from instructor);

/*17*/
select * from student;
select * from take;
select * from section;
select * from course;
insert into department
values('History','Block B',250000);
insert into student 
values(0006,'Indiana Jones','1996-11-01','History');

alter table course
alter column credits type numeric(3);
insert into course
values('HI101','Great History',150,'History');

insert into section
values(114,'HI101','5',2009,132);
insert into take
values(0006,'114','HI101',5,2009,'O');

alter table student
add column tot_credits numeric(3);

update student
set tot_credits=151 where sid='6';
insert into instructor
select sid,sname,depname,20000 from student where depname='History' and tot_credits>150;

/*18*/
update instructor 
set salary=case
	when salary<=100000 then salary * 1.05
	else salary*1.03
	end
/*19*/
select * from student;
alter table student
alter column tot_credits set default 0;
update student s
set tot_credits=(select sum(credits) from course natural join take where S.sid=take.sid
and take.grade<>'F')

/*20*/
with dep_avg as (select depname,round(avg(salary),2) sal from instructor group by depname)
select sal from dep_avg where sal=(select max(sal) from dep_avg);

/*21*/
with dep_avg as (select depname,round(avg(salary),2) sal from instructor group by depname)
select depname from dep_avg where sal=(select max(sal) from dep_avg);

/*22*/
insert into course
values('CS103','TOC',4,'CS and AI');
select c.ccode,(select count(*) from section where c.ccode=section.ccode ) from course c;

/*23*/
with sal_without_max as (select iname,salary from instructor where salary <> (select max(salary) from instructor))
select iname from sal_without_max
where salary=(select max(salary) from sal_without_max);
