DROP DATABASE IF EXISTS Testing_System_Assignment_5;
CREATE DATABASE Testing_System_Assignment_5;
USE Testing_System_Assignment_5;
 #### TAO TABLE
CREATE TABLE Department1 (
DepartmentID		INT PRIMARY KEY,
DepartmentName		VARCHAR(50) CHECK (LENGTH(DepartmentName)>=5)
);
###### TAO TABLE POSITION
CREATE TABLE Position1 (
PositionID		TINYINT AUTO_INCREMENT PRIMARY KEY,
PositionName	ENUM('Dev','Test','Scrum Master','PM')
);
###tao table acount1
drop table if exists account1;
CREATE TABLE Account1 (
AccountID		TINYINT AUTO_INCREMENT PRIMARY KEY,
Email			VARCHAR(50),
Username		VARCHAR(20)CHECK (LENGTH(Username)	>=2),
FullName		VARCHAR(50),
DepartmentID	INT NOT NULL,
PositionID		TINYINT ,
CreateDate		DATETIME DEFAULT NOW(),
CONSTRAINT rangbuoc1 FOREIGN KEY (DepartmentID) REFERENCES Department1(DepartmentID),
CONSTRAINT rangbuoc2 FOREIGN KEY (PositionID) REFERENCES Position1(PositionID)
);	
SELECT * FROM Account1;
DESC Account1 ;
###tao table Group1
CREATE TABLE Group1 (
GroupID		TINYINT AUTO_INCREMENT PRIMARY KEY,
GroupName	VARCHAR(50),
CreatorID	INT NOT NULL ,
CreateDate	DATE
);
#### tao table GroupAccount1
CREATE TABLE GroupAccount1 (
GroupID		TINYINT AUTO_INCREMENT PRIMARY KEY,
AccountID	VARCHAR(50),
JoinDate	DATETIME
);
# tao table TypeQuestion1
CREATE TABLE TypeQuestion1 (
TypeID 		TINYINT PRIMARY KEY,
TypeName 	VARCHAR(100)
);
## TAO TABLE CategoryQuestion1
CREATE TABLE CategoryQuestion1 (
CategoryID		INT PRIMARY KEY,
CategoryName	VARCHAR(50)
);
#### tao Table question1
CREATE TABLE Questions1 (
QuestionID	INT PRIMARY KEY AUTO_INCREMENT,
Content		VARCHAR(50),
CategoryID	INT NOT NULL ,
TypeID		INT NOT NULL ,
CreatorID	INT NOT NULL ,
CreateDate	DATETIME
);
CREATE TABLE Answer1 (
AnswerID	TINYINT AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(100),
QuestionID	INT NOT NULL ,
isCorrect	ENUM('T','F')
);

### TAo table Exam1
CREATE TABLE Exam1 (
ExamID		INT AUTO_INCREMENT PRIMARY KEY,
Code1		INT,
Title		VARCHAR(50),
CategoryID	INT,
creatorID	INT,
CreateDate	DATETIME,
Duration int
);

### tao table Exam Question1
CREATE TABLE ExamQuestions1 (
ExamID		INT PRIMARY KEY AUTO_INCREMENT,
QuestionID	INT 
); 
## THEM DU LIEU BANG 1 
INSERT INTO Department1		(DepartmentID,DepartmentName)
VALUES						('1001','phong hanh chinh'),
							('1002','phong giam doc'),
							('1004','phong giam doc'),
							('1003','phong pho giam doc'), 
							('1005','phong an'),
							('1006','phong nhan vien'),
							('1007','phong cham soc khach hang'),
							('1008','phong giu tre'),
							('1009','phong thay do'),
							('1010','phong bao ve');
# them du lieu bang 2
INSERT INTO Position1 	(PositionName)
VALUES					(1),
						('Test'),
						('Scrum Master'),
						('PM'),
						('Test'),
						('Scrum Master'),
						('Test'),
						('Dev'),
						('Scrum Master'),
						('Scrum Master');
# THEM DU LIEU BANG 3
INSERT INTO Account1			(Email,Username,Fullname,DepartmentID,PositionID,Createdate)
VALUES							('sontungmpt@gmail.com','MTP','Nguyen son tung','1001',1,'2000-01-01'),
								('trinhtrangtreo@gmail.com','Nu hoang noi y','Ngoc Trinh','1002',2,'2000-01-01'),
								('hoailinhvo@gmail.com','Anh 4','Vo Hoai Linh'	,'1003',3,'2000-01-01'),
								('thuytienlulut@gmail.com'	,'Tienmientrung','Thuy tien','1004',4,'2000-01-01'),
								('Nguyenvantoan02@gmail.com','Toanbede','Nguyen van toan','1006',6,'2000-01-01'),
								('buihoangvietanh03@gmail.com','Anhsutmoi','bui hoang viet anh','1007',7,'2000-01-01'),
								('nguyenhuuthang@gmail.com','thang tien ve','nguyen huu thang','1008',8,'2000-01-01'),
								('tranvandat@gmail.com','dat tien dao','tran van dat','1009',9,'2000-01-01'),
								('tumatseodeosoai@gmail.com','tu hom hinh','Le xuan tu','1010',10,'2000-01-01');
#THEM DU LIEU BANG 4
INSERT INTO Group1				(GroupName,CreatorID,CreateDate)
VALUES							('BeatVN','1','2019-01-01'),
								('hong bien hoi','2','2019-01-12'),
								('khong so cho','3','2019-01-15'),
								('hong bien duong pho','4','2019-01-20'),
								('hongs','5','2019-01-25'),
								('hong chuyen tam linh','6','2019-02-01'),
								('hong bien hoi','7','2019-01-10'),
								('chuyen tro linh tinh','8','2019-02-15'),
								('otofun', '9', '2019-01-20'),
								('dao meo', '10', '2019-01-19');
#### them u lieu vao bang 5
INSERT INTO GroupAccount1 		(GroupID,AccountID,JoinDate)
VALUES							('1','A1','2021-01-23'),
								('2','A2','2021-01-23'),
								('3','A3','2021-01-23'),
								('4','A4','2021-01-23'),
								('5','A5','2021-01-23'),
								('6','A6','2021-01-23'),
								('7','A7','2021-01-23'),
								('8','A8','2021-01-23'),
								('9','A9','2021-01-23'),
								('10','A10','2021-01-23');
## them du lieu 6
INSERT INTO Questions1			(Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES							('so thich','1','1','1','2021-11-01'),
								('mong muon','2','2','2','2021-11-01'),
								('dinh huong cuoc song','3','3','3','2021-11-01'),
								('muc tieu','4','4','4','2021-11-01'),
								('du dinh','5','5','5','2021-11-01'),
								('bang ke hoach chi tiet','6','6','6','2021-11-01'),
								('muc tieu hang ngay phai dat duoc','7','7','7','2021-11-01'),
								('quan tam den gia dinh','8','8','8','2021-11-01'),
								('so tien tich luy hien tai','9','9','9','2021-11-01'),
								('tien do hoan thanh muc tieu','10','10','10','2021-11-01');
# them du lieu vao bang 7
INSERT INTO TypeQuestion1			(TypeID,TypeName)
VALUES								('1','VUONG'),
									('2','TRON'),
									('3','TAM GIAC'),
									('4','MEO'),
									('5','TRON VUONG'),
									('6','TRU'),
									('7','HOP'),
									('8','CHU NHAT'),
									('9','HOP CHU NHAT'),
									('10','HINH BINH HANH');
### them du lieu 8
INSERT INTO CategoryQuestion1		(CategoryID,CategoryName)
VALUES								('1','danh ba'),
									('2','tin nhan'),
									('3','giai tri'),
									('4','game'),
									('5','du lich'),
									('6','tai lieu hoc'),
									('7','thoi gian'),
									('8','viec lam'),
									('9','quan ly tai chinh'),
									('10','Am nhac');
## them du lieu vao bang 9
INSERT INTO Answer1		(Content,QuestionID,isCorrect)
VALUES					('Tieng nhat',1,'T'),
						('Tieng han',2,'F'),
						('Tieng trung',3,'F'),
						('Tieng anh',4,'F'),
						('Tieng duc',5,'T'),
						('Tieng hoa',6,'T'),
						('Tieng phap',7,'T'),
						('Tieng thuy dien',8,'F'),
						('Tieng tau',9,'F'),
						('Tieng viet',10,'T');
#them du lieu vao bang 10
INSERT INTO Exam1	(Code1,Title,CategoryID,CreatorID,Createdate,Duration)
VALUES				(1, 'bat dong san'	, 1	, 1	, '2012-01-10',1),
					(2, 'chung khoan'	, 2	, 2	 , '2012-01-20',1),
					(1,'kinh doan ho gia dinh', 3, 3, '2012-01-23',2),
					(3,'kinh doan chuoi cua hang', 4, 4, '2012-01-21',2),
					(2,'cua hang nhuong quyen', 5, 5, '2012-01-13',3),
					(1,'chu dau tu', 6, 6 , '2012-02-20',4),
					(4,'so de', 7, 7, '2012-03-20',4),
					(5,'ca do bong da ', 8, 8, '2012-04-20',4),
					(1,'lam an phi phap', 9, 9, '2015-01-20',4),
					(1,'lua dao', 10, 10, '2013-01-20',1);
# Them du lieu bang 11
INSERT INTO ExamQuestions1		(QuestionID)
VALUES							(1),
								(3),
								(2),
								(4),
								(2),
								(1),
								(4),
								(3),
								(2),
(								1);