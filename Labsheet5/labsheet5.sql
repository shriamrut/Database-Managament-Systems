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

/*1 Fetch iname from instructor and ccode from teach,where instructor.id=teach.id*/
select iname,ccode from instructor,teach where instructor.id=teach.id;

/*2 Return a table having iname,ccode, where equality of common colomns are evaluated,if not normal cross product */
select iname,ccode from instructor natural join teach;

/*3 Same as above,except that table name where iname,ccode to be fetched using dot operation*/
select instructor.iname, teach.ccode from instructor natural join teach;

/*4 Rows where sid ins student and sid in take  merged,hence sid is repeated*/
select * from student join take on student.sid=take.sid;

/*5 Select entire rows from both tables, where students.sid=take.sid*/
select * from student,take where student.sid=take.sid;

/*6 display sid,sname,depname,ccode,section_id,sem,year,grade from join of student and take where sid in students equals sid in take */
select student.sid as ID, sname, depname,ccode, section_id, sem, year, grade
from student join take on student.sid= take.sid;

/*7 Add a record in teach table where an instructor teaches a course belonging to another department and not his department.
Making professor with id (124) who is from math department to teach a CS course*/
insert into teach(id,section_id,ccode,sem,year)
values('124','101','CS100',4,2005);

/*8 display name and designation of professor from join of teach,course,and instructor,where teach.ccode=course.ccode,
inturn display about people who are teaching a course currently*/
select iname,designation from instructor natural join teach,course where teach.ccode=course.ccode;

/*9 fetch name and designation where common columns  have same value from tables instructor,
teach and course.*/
select iname,designation from instructor natural join teach natural join course;

/*10 Here natural join table is made using instructor and teach , and join with course is made using
ccode,ie you are specifiying the attribute on its basis the join has to be done*/
select iname,designation from (instructor natural join teach) join course using(ccode);

/*11 Already,two anandhu and dravid have not taken any courses, people included in student 
as well as take as well*/
select  * from student natural left outer join take;

/*12 only in student and entry is not in take hence their ccode will be null*/
select sid from student natural left outer join take where ccode is null;

/*13 entries in join, only present in table take*/
select * from take natural right outer join student;








