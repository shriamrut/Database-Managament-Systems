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

/*1*/
select iname,ccode from instructor,teach where instructor.id=teach.id;
/*2*/
select iname,ccode from instructor natural join teach;
