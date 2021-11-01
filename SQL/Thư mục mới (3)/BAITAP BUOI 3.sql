DROP DATABASE IF EXISTS Testing_System_Assignment_0;

CREATE DATABASE Testing_System_Assignment_0;
USE Testing_System_Assignment_0;

 #### TAO TABLE
 
CREATE TABLE Department1 (
DepartmentID		TINYINT UNSIGNED NOT NULL PRIMARY KEY,
DepartmentName		VARCHAR(50) CHECK (LENGTH(DepartmentName)>=10)
);


## THEM DU LIEU BANG 1 

INSERT INTO Department1
(DepartmentID,DepartmentName)
VALUES
('D11','phong hanh chinh'),
('D2','phong giam doc'),
('D3','phong pho giam doc'),
('D4','phong nghi trua'),
('D5','phong an'),
('D6','phong nhan vien'),
('D7','phong cham soc khach hang'),
('D8','phong giu tre'),
('D9','phong thay do'),
('D10','phong bao ve');


###### TAO TABLE POSITION

CREATE TABLE Position1 (
PositionID		TINYINT AUTO_INCREMENT PRIMARY KEY,
PositionName	ENUM('Dev','Test','Scrum Master','PM')
);

# them du lieu bang 2

INSERT INTO Position1
(PositionID			,PositionName)
VALUES
('P1'				,'hoi dong quan tri'),
('P2'				,'giam doc nhan su'),
('P3'				,'pho giam doc dieu hanh'),
('P4'				,'pho giam doc dieu hanh'),
('P5'				,'thu ky nguoi mau cua giam doc'),
('P6'				,'thu ky nguoi mau cua pho giam doc'),
('P7'				,'truong phong nhan su'),
('P8'				,'dieu hanh nhan su'),
('P9'				,'nhan vien hanh chinh'),
('P10'				,'thu ngan');

### tao table acount1

CREATE TABLE Account1 (
AccountID		TINYINT AUTO_INCREMENT PRIMARY KEY,
Email			VARCHAR(50),
Username		VARCHAR(20)CHECK (LENGTH(Username)	>=6),
FullName		VARCHAR(50),
DepartmentID	TINYINT UNSIGNED NOT NULL,
PositionID		TINYINT ,
CreateDate		DATETIME DEFAULT NOW()
);	
### tao rang buoc 
ALTER TABLE Account1  ADD CONSTRAINT rangbuoc1 FOREIGN KEY (DepartmentID) REFERENCES `Department1`(DepartmentID);
ALTER TABLE Account1  ADD CONSTRAINT rangbuoc2 FOREIGN KEY (PositionID) REFERENCES `Position1`(PositionID);

# THEM DU LIEU BANG 3

INSERT INTO Account1
(AcountID	,Email					,Username	,Fullname			,DepartmentID	,Createdate)
VALUES
('A1','sontungmpt@gmail.com','MTP','Nguyen son tung','A1','01-01-2000'),
('A2','trinhtrangtreo@gmail.com'	,'Nu hoang noi y'		,'Ngoc Trinh'	,'A2'	,'02-01-2000'),
('A3','hoailinhvo@gmail.com'	,'Anh 4'		,'Vo Hoai Linh'	,'A3','03-01-2000'),
('A4','thuytienlulut@gmail.com'	,'Tienmientrung','Thuy tien','A4','04-01-2000'),
('A5','trinhxuanhoan01@gmail.com','thumondeptrai','Trinh xuan hoang','A5','05-01-2000'),
('A6','Nguyenvantoan02@gmail.com','Toanbede','Nguyen van toan','A6','06-01-2000'),
('A7','buihoangvietanh03@gmail.com','Anhsutmoi','bui hoang viet anh','A7','07-01-2000'),
('A8','nguyenhuuthang@gmail.com','thang tien ve','nguyen huu thang','A8','08-01-2000'),
('A9','tranvandat@gmail.com','dat tien dao','tran van dat','A9','09-01-2000'),
('A10','tumatseodeosoai@gmail.com','tu hom hinh','Le xuan tu','A10','10-01-2000');



DESC Account1 ;

###tao table Group1

CREATE TABLE Group1 (
GroupID		TINYINT AUTO_INCREMENT PRIMARY KEY,
GroupName	VARCHAR(50),
CreatorID	INT NOT NULL ,
CreateDate	DATETIME
);

INSERT INTO Group1
(GroupID,GroupName,CreatorID,CreateDate)
VALUES
('G1','BeatVN','CR1','01-01-2000'),
('G2','hong bien hoi :3','CR2','02-01-2000'),
('G3','khong so cho','CR3','03-01-2000'),
('G4','hong bien duong pho','CR4','04-01-2000'),
('G5','hongs','CR5','05-01-2000'),
('G6','hong chuyen tam linh','CR6','06-01-2000'),
('G7','hong bien hoi','CR7','07-01-2000'),
('G8','chuyen tro linh tinh','CR8','08-01-2000'),
('G9','otofun','CR9','08-01-2000'),
('G10','dao meo','CR10','10-01-2000');

#### tao table GroupAccount1

CREATE TABLE GroupAccount1 (
GroupID		TINYINT AUTO_INCREMENT PRIMARY KEY,
AccountID	VARCHAR(50),
JoinDate	DATETIME
);

#### them du lieu vao bang GRA
INSERT INTO GroupAccount1 
(GroupID,AccountID,JoinDate)
VALUES
('GA1','A1','01-01-2000'),
('GA2','A2','02-01-2000'),
('GA3','A3','03-01-2000'),
('GA4','A4','04-01-2000'),
('GA5','A5','05-01-2000'),
('GA6','A6','06-01-2000'),
('GA7','A7','07-01-2000'),
('GA8','A8','08-01-2000'),
('GA9','A9','09-01-2000'),
('GA10','A10','10-01-2000');

# tao table TypeQuestion1

CREATE TABLE TypeQuestion1 (
TypeID 		TINYINT PRIMARY KEY,
TypeName 	VARCHAR(100)
);

# them du lieu vao bang TQ

INSERT INTO TypeQuestion1
(TypeID,TypeName)
VALUES
('T1','VUONG'),
('T2','TRON'),
('T3','TAM GIAC'),
('T4','MEO'),
('T5','TRON VUONG'),
('T6','TRU'),
('T7','HOP'),
('T8','CHU NHAT'),
('T9','HOP CHU NHAT'),
('T10','HINH BINH HANH');

## TAO TABLE CategoryQuestion1
CREATE TABLE CategoryQuestion1 (
CategoryID		INT PRIMARY KEY,
CategoryName	VARCHAR(50)
);

### them du lieu CG

INSERT INTO CategoryQuestion1
(CategoryID,CategoryName)
VALUES
('CT1','danh ba'),
('CT2','tin nhan'),
('CT3','giai tri'),
('CT4','game'),
('CT5','du lich'),
('CT6','tai lieu hoc'),
('CT7','thoi gian'),
('CT8','viec lam'),
('CT9','quan ly tai chinh'),
('CT10','Am nhac');

#### tao Table question1
CREATE TABLE Questions1 (
QuestionID	INT PRIMARY KEY,
Content		VARCHAR(50),
CategoryID	INT NOT NULL ,
TypeID		INT NOT NULL ,
CreatorID	INT NOT NULL ,
CreateDate	DATETIME
);

# tao rang buoc giua bang 345678

ALTER TABLE `Groupp1` ADD CONSTRAINT rangbuoc3 FOREIGN KEY (CreatorID) REFERENCES `Gruop1`(CreatorID);
ALTER TABLE `TypeQuestion1` ADD CONSTRAINT rangbuoc4 FOREIGN KEY (TypeID) REFERENCES `TypeQuestion1`(TypeID);
ALTER TABLE `CategoryQuestion1` ADD CONSTRAINT rangbuoc5 FOREIGN KEY (CategoryID) REFERENCES `CategoryQuestion1`(CategoryID);

## them du lieu Question 1

INSERT INTO Question1
(QuestionID,Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES
('Q1','so thich','CT1','T1','CR1','01-01-2000'),
('Q2','mong muon','CT2','T2','CR2','02-01-2000'),
('Q3','dinh huong cuoc song','CT3','T3','CR3','03-01-2000'),
('Q4','muc tieu','CT4','T4','CR4','04-01-2000'),
('Q5','du dinh','CT5','T5','CR5','05-01-2000'),
('Q6','bang ke hoach chi tiet','CT6','T6','CR6','06-01-2000'),
('Q7','muc tieu hang ngay phai dat duoc','CT7','T7','CR7','07-01-2000'),
('Q8','quan tam den gia dinh','CT8','T8','CR8','08-01-2000'),
('Q9','so tien tich luy hien tai','CT9','T9','CR9','09-01-2000'),
('Q10','tien do hoan thanh muc tieu','CT10','T10','CR10','10-01-2000');

## tao table anwer1

CREATE TABLE Answer1 (
AnswerID	TINYINT AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(100),
QuestionID	INT NOT NULL ,
isCorrect	ENUM('True','Fales')
);

## them du lieu vao bang Answer1 

INSERT INTO Answer1
(AnswerID,Content,QuestionID,isCorrect)
VALUES
('ASW1','Tieng nhat','QS1','T'),
('ASW2','Tieng han','QS2','F'),
('ASW3','Tieng trung','QS3','T'),
('ASW4','Tieng anh','QS4','T'),
('ASW5','Tieng duc','QS5','F'),
('ASW6','Tieng hoa','QS6','T'),
('ASW7','Tieng phap','QS7','F'),
('ASW8','Tieng thuy dien','QS8','F'),
('ASW9','Tieng tau','QS9','T'),
('ASW10','Tieng viet','QS10','F');

### TAo table Exam1
CREATE TABLE Exam1 (
ExamID		INT PRIMARY KEY,
Code1		TINYINT,
Title		VARCHAR(50),
CategoryID	INT,
Duration	TIME,
creatorID	INT,
CreateDate	DATETIME
);

#them du lieu vao bang Exam1

INSERT INTO Exam1
(ExamID,Code1,Title,CategoryID,Duration,CreatorID,Createdate)
VALUES
('EX1','1001','bat dong san','CT1','60','CR1','01-01-2000'),
('EX2','1002','chung khoan','CT2','15','CR2','02-01-2000'),
('EX3','1003','kinh doan ho gia dinh','CT3','20','CR3','03-01-2000'),
('EX4','1004','kinh doan chuoi cua hang','CT4','30','CR4','04-01-2000'),
('EX5','1005','cua hang nhuong quyen','CT5','40','CR5','05-01-2000'),
('EX6','1006','chu dau tu','CT6','45','CR6','06-01-2000'),
('EX7','1007','so de','CT7','10','CR7','07-01-2000'),
('EX8','1008','ca do bong da ','CT8','5','CR8','08-01-2000'),
('EX9','1009','lam an phi phap','CT9','30','CR9','09-01-2000'),
('EX10','1010','lua dao','CT10','60','CR10','10-01-2000');

### tao table Exam Question1

CREATE TABLE ExamQuestions1 (
ExamID		INT PRIMARY KEY,
QuestionID	INT 
); 

#### tao rang buoc giua bang 91011

ALTER TABLE Exam1 ADD CONSTRAINT rangbuoc6 FOREIGN KEY (ExamID) REFERENCES Exam1(ExamID);
ALTER TABLE Answer1 ADD CONSTRAINT rangbuoc7 FOREIGN KEY (QuestionID) REFERENCES Answer1(QuestionID);

# them du lieu vao bangExam

INSERT INTO ExamQuestion1
(ExamID,QuestionID)
VALUES
('EX1','QS1'),
('EX2','QS2'),
('EX3','QS3'),
('EX4','QS4'),
('EX5','QS5'),
('EX6','QS6'),
('EX7','QS7'),
('EX8','QS8'),
('EX9','QS9'),
('EX10','QS10');







