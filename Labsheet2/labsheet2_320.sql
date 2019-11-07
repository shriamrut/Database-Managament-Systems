/*a*/
create table Doctor320
(
Did int,
Dname varchar(25),
Specialization varchar(20) default 'general',
Aadhar_no varchar(12) unique,
Consultation_fee numeric(5,2),
constraint c3 check(Consultation_fee>50),
primary key(Did));

create table Treat320
(
Did int,
Pid int,
Diagnosis varchar(30) not null,
Treat_id int,
Treat_date date,
foreign key(Did) references Doctor320 on delete cascade,
foreign key(Pid) references Patient320 on delete set null,
primary key(Treat_id)
);
create table Patient320
(
Pid int,
Pname varchar(25),
Date_of_birth date,
Address varchar(20),
primary key(Pid)
);
/*Printing tables*/
select * from Doctor320;
select * from Patient320;
select * from Treat320;
/*b*/
alter table Doctor320
add special_fee numeric(5,2);
/*c*/
alter table Doctor320
add constraint c2 check(special_fee>Consultation_fee);
/*d*/
alter table Doctor320
drop constraint c3;/*c1 is renamed as c3*/
/*e*/
alter table Patient320
add Aadhar_no varchar(12) unique;
/*f*/
alter table Patient320
add constraint c4 check(date_of_birth is not null);
/*g*/
alter table Treat320
add constraint cond1 unique(Treat_id,Treat_date);
/*h*/
insert into Doctor320(Did,Dname,Specialization,Aadhar_no,Consultation_fee,special_fee)
values(1234,'Dr.Ramu',default,123456789101,100,101),(5412,'Dr.Rohan','Neuroscience',123456789102,150,160),(7100,'Dr.Vaishak','Gastrology',123456789103,150,170);

insert into Patient320(Pid,Pname,Date_of_birth,Address,Aadhar_no)
values(121,'Kishan','1952-11-20','B10,P.Avenue,UP',123456789104),(123,'SK.Bansal','1953-10-15','A10,Baker St,Kerala',123456789105),(412,'BK.Sharma','1948-05-21','A20 Streot St,TN',123456789106);

insert into Treat320(Did,Pid,Diagnosis,Treat_id,Treat_date)
values(1234,121,'Bleeding',200,'2019-11-20'),(7100,123,'Stomach Pain',201,'2019-11-10'),(5412,412,'Tumour',202,'2019-10-19');
/*i*/
select * from Doctor320
where Specialization='general';
/*j*/
delete from Doctor320
where did=1234;
/*k*/
delete from Patient320
where pid=123;
/*l*/
alter table Doctor320
add column city varchar(14);
update Doctor320
set city='Bhillai' where did=5412;
update Doctor320
set city='Kannur' where did=7100;
/*m*/
insert into Doctor320
values(7101,'Krishnan',default,123456789104,200,250,'Chennai');
select * from Doctor320
where dname like 'K%n';
/*n*/
insert into Patient320
values(321,'Ash','1957-05-20','A10,RK.Center,BG,KA',123456789108);
select * from Patient320
where pname like 'A__';
/*o*/
insert into Doctor320(did,dname,specialization,aadhar_no,consultation_fee,special_fee,city)
values(7102,'Jolly','Cardiology',123456789106,200,220,'Bihar'),(7103,'Loki','Psychology',123456789105,240,242,'Asgar');
select * from Doctor320
where dname like 'J%' or dname like 'L%';
/*p*/
insert into Doctor320
values(7104,'ER.Babu','E.N.T',123456789107,200,210,'Kota');
select * from Doctor320
where specialization='E.N.T' and consultation_fee > 60;
/*q*/
select * from Doctor320
where specialization='E.N.T' or consultation_fee > 60;
/*r*/
insert into Doctor320
values(7105,'Bruce Wayne','Bones',123456789108,100,101,'Mumbai');
select * from Doctor320
where consultation_fee between 50 and 100;
/*s*/
select * from Doctor320
order by dname desc;
/*t*/
select * from Doctor320
order by dname desc,city desc;
/*u*/
insert into Doctor320
values(7108,'Clark Kent',default,123456789109,150,160,'Delhi');
select specialization from Doctor320;
/*v*/
select distinct specialization from Doctor320;
/*w*/
select count(*) from Doctor320;
/*x*/
select count(*) from Doctor320
where specialization='E.N.T';
/*y*/
update Doctor320
set did=1 where did=7108;
insert into Treat320
values(1,321,'Cold',203,'2019-10-19');
select count(*) from Treat320
where did=1;
/*z*/
select max(consultation_fee) from Doctor320;
/*aa*/
select * from Doctor320
where specialization in('E.N.T','Cardiology','Paediatrics');
/*bb*/
select max(consultation_fee),min(consultation_fee) from Doctor320;
/*cc*/
select round(avg(consultation_fee),3) from Doctor320;
/*dd*/
insert into Doctor320
values(2,'Mark','Paediatrics',123456789110,160,180,'Chandigarh');
insert into Doctor320
values(3,'Zuck','Paediatrics',123456789111,170,190,'Hyderabad');
select sum(special_fee) from Doctor320
where specialization='Paediatrics';
/*ee*/
select dname as "Doctor_name" 
from Doctor320;
/*ff*/
select dname,sum(consultation_fee+special_fee) Totalfee
from Doctor320
group by dname;
/*gg*/
select count(*) from Doctor320
where aadhar_no is null;
/*hh*/
select count(*) from Doctor320
where aadhar_no is not null;
/*ii*/
insert into Doctor320
values(5,'Shankara','E.N.T',123456789112,155,200,'Kollam');
select * from Doctor320
where (consultation_fee>100 and (specialization='Accounts' or city='Kollam')); 
/*jj*/
select * from Doctor320
where (specialization='Accounts' and city='Kollam') or consultation_fee<100 ;
/*kk*/
select * from Doctor320 order by 3;/*order by column 3,by default in ascending order*/
/*ll*/
select concat(dname,' is specialized in ',specialization) from Doctor320;
