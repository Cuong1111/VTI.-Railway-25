use Testing_System_Assignment_5;
## LAY RA TAT CA PHONG BAN
##3.2
SELECT * from department1;
##3.3
select * from department1 where DepartmentName ='phong bao ve';
##3.4
select * from account1 ;
select *from account1 where length(fullname)=( select max(length(fullname)) from account1) ;
##3.5
select * from account1 where length(FullName)=( select max(length(FullName)) from account1)	and DepartmentID =1007;
##3.6
select * from group1;
select GroupName,CreateDate from group1 where CreateDate >'2019-02-01'; 

#3.7
select * from questions1;
select * from questions1 where TypeID >=4;

#3.8
select QuestionID from questions1 where CategoryID >=9 and CreateDate <'2021-12-01';

#3.9
select * from group1 order by CreateDate DESC LIMIT 5;

#3.10
select *from department1 where DepartmentID = 1002;

#3.11
select * from account1 where FullName like  'D%o';

#3.12 chua duoc
select * from exam1;
delete from exam1 where CreateDate <'2013-01-01'; 

#3.13
delete
from questions1 
where content like 'muc%';

#3.14

UPDATE 	account1
SET 		Username = 'nguyenbaloc' ,
			Email	 = 'locdeptrai@gmail.com'
where AccountID = 5;

#3.15
update group1
set 	AccountID =5
where 	GroupID =4;

#
