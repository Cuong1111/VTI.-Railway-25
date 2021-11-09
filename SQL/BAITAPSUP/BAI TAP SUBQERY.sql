USE EXAMPLE_RW25_DEMO_TEST;
select * from exam;

select * from `group`;

select * 
from account a
inner join department d
on a.departmentid = d.departmentid;	

select *
from `position` p
inner join account a 
on a.positionid=p.positionid
where  p.positionname like  '%Developer%';


select D.DepartmentName,count(ac.DepartmentID) as 'so_luongnv'
from `Account` ac
left join Department D
on D.DepartmentID = ac.DepartmentID
group by ac.DepartmentID
having count(ac.DepartmentID) >1 
;
#4.5
select Q.content,EQ.QuestionID  ,count(Q.QuestionID) as so_dem
from Question Q
inner join ExamQuestion EQ
on Q.QuestionID=EQ.QuestionID
group by Q.QuestionID
having count(Q.questionID) = (select  MAx(so_luong) as aaa
from (
select count(Ex.QuestionID) as so_luong 
from ExamQuestion Ex
Group by Ex.QuestionID) as cuongdep_trai);

#4.6
select cq.CategoryID, count(Q.CategoryID) as ques_sudung
from Question Q
inner join Categoryquestion CQ
on Q.CategoryID = CQ.CategoryID
group by Q.CategoryID;

#4.7
USE EXAMPLE_RW25_DEMO_TEST;

select EXQ.QuestionID, count(Q.QuestionID) as solanquesdcsudung
from question Q
inner join Examquestion EXQ
on Q.QuestionID = EXQ.QuestionID
group by Q.QuestionID;

#4.8 Lấy ra Question có nhiều câu trả lời nhất
USE EXAMPLE_RW25_DEMO_TEST;
select Qs.questionID ,count(QS.QuestionID) as socauhoi
from Question QS
inner join Answer AN
on QS.questionID = AN.questionID
group by QS.questionID

having count(QS.QuestionID) = (select max(solan_1) as aa
from 	(
select count(AN.QuestionID) as solan_1
from Answer AN 
GROUP BY AN.QuestionID )as caigido );

#4.9 Thống kê số lượng account trong mỗi group

SELECT 		Gra.GroupID , count(Gra.AccountID) as so_ac_trongmoigr
FROM 		`Account` Acc
INNER JOIN 	GroupAccount Gra
ON 			Acc.AccountID = Gra.AccountID
GROUP BY 	Gra.AccountID
ORDER BY  	Gra.AccountID DESC;

#4.10 Tìm chức vụ có ít người nhất
## join bảng chuc vu va người >> GROUP cái chung lại >> đếm số người trong mỗi chức vụ


SELECT				 P.PositionID  ,count(Acc.AccountID) as songuoi_trongchuvvu
FROM  				Position P 
JOIN 				 `Account` Acc
ON 					Acc.PositionID=P.PositionID
GROUP BY 			P.PositionID
HAVING 				count(Acc.AccountID) = (SELECT MIN(abc) as so_dem
										FROM (
                                        SELECT count(Acc.AccountID) abc FROM `Account` Acc
                                        GROUP BY Acc.PositionID)as aa);
							
#4.11 Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

select * from position ;
SELECT  d.DepartmentName , d.DepartmentID , p.PositionName, count(p.PositionName) as thong_kesochucvutrongphong
FROM Account a
INNER JOIN Department d on d.DepartmentID = a.DepartmentID
INNER JOIN Position p on p.PositionID= a.PositionID
group by 	d.DepartmentID , p.PositionID;
						
## 4.12 Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...                        
 
 SELECT 	Q.QuestionID,Q.Content,Q.TypeId,A.Username,AN.AnswerID,AN.Content
 FROM 		Question Q
 INNER JOIN TypeQuestion TQ		On 		TQ.TypeID=Q.TypeID
 INNER JOIN Account 	A 		ON		A.AccountID=Q.CreatorID
 INNER JOIN Answer AN 			ON		AN.QuestionID=Q.QuestionID;
 
 #4.13 Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
 
 SELECT TQ.TypeID,TQ.TypeName ,count(TQ.TypeID) as soluongcauhoi
FROM  		Question Q
INNER JOIN	TypeQuestion TQ 		ON Q.TypeID = TQ.TypeID
GROUP BY 	TQ.TypeID
;

# 4.14 14:Lấy ra group không có account nào

SELECT G.GroupName,G.GroupID
FROM 			`Group` G
LEFT JOIN 		GroupAccount  GA
ON				GA.GroupID = G.GroupID
WHERE 			GA.AccountID IS NULL ;


#4.16 Lấy ra question không có answer nào

SELECT 			Q.QuestionID
FROM 			Answer A
RIGHT  JOIN 	Question Q
ON				Q.QuestionID=A.QuestionID
WHERE 			A.AnswerID IS NULL ; 

#4.17 a) Lấy các account thuộc nhóm thứ 1b) Lấy các account thuộc nhóm thứ 2 c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau

SELECT 			A.AccountID , A.FullName
FROM 		 Account A 
JOIN 		GroupAccount GA
WHERE 		GroupID = 1
UNION
SELECT 			A.AccountID  , A.FullName
FROM 		 Account A 
JOIN 		GroupAccount GA
WHERE 		GroupID = 2;

##Question 18a) Lấy các group có lớn hơn 5 thành viên) Lấy các group có nhỏ hơn 7 thành viênc) Ghép 2 kết quả từ câu a) và câu b)

SELECT 		G.GroupID,G.GroupName ,count(A.AccountID) as so_tv
FROM 		`Group` G
JOIN		`Account` A
ON			A.AccountID=G.CreatorID
GROUP BY 	A.AccountID
HAVING 		so_tv >1

UNION


SELECT 		G.GroupID,G.GroupName ,count(A.AccountID) as so_tv
FROM 		`Group` G
JOIN		`Account` A
ON			A.AccountID=G.CreatorID
GROUP BY 	A.AccountID
HAVING 		so_tv <3