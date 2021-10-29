DROP DATABASE IF EXISTS Testing_System_Assignment_0;

CREATE DATABASE Testing_System_Assignment_0;
USE Testing_System_Assignment_0;


CREATE TABLE `Department1` (
DepartmentID		TINYINT UNSIGNED NOT NULL PRIMARY KEY,
DepartmentName		VARCHAR(50)
);

# them du lieu bang  1
INSERT INTO `Department1`(DepartmentID,DepartmentName) VALUES ('2001','VU VAN TUNG');
INSERT INTO `Department1`(DepartmentID,DepartmentName) VALUES ('2002','LE NGOC HAI');

CREATE TABLE `Position1` (
PositionID		TINYINT AUTO_INCREMENT PRIMARY KEY,
PositionName	ENUM('Dev','Test','Scrum Master','PM')
);

# them du lieu bang 2
INSERT INTO `Position1`(PositionID,PositionName) VALUES ('1''VU VAN TUNG');
INSERT INTO `Position1`(PositionID,PositionName) VALUES ('2''LE NGOC HAI');


CREATE TABLE Account1 (
AccountID		TINYINT AUTO_INCREMENT PRIMARY KEY,
Email			VARCHAR(50),
Username		VARCHAR(20),
FullName		VARCHAR(50),
DepartmentID	TINYINT UNSIGNED NOT NULL,
PositionID		TINYINT ,
CreateDate		DATETIME
);	
### tao rang buoc 
ALTER TABLE `Account1`  ADD CONSTRAINT rangbuoc1 FOREIGN KEY (DepartmentID) REFERENCES `Department1`(DepartmentID);
ALTER TABLE `Account1`  ADD CONSTRAINT rangbuoc2 FOREIGN KEY (PositionID) REFERENCES `Position1`(PositionID);

# THEM DU LIEU BANG 3


DESC `Account1` ;


CREATE TABLE `Groupp1` (
GroupID		TINYINT AUTO_INCREMENT PRIMARY KEY,
GroupName	VARCHAR(50),
CreatorID	INT NOT NULL ,
CreateDate	DATETIME
);


CREATE TABLE `GroupAccount1` (
GroupID		TINYINT AUTO_INCREMENT PRIMARY KEY,
AccountID	VARCHAR(50),
JoinDate	DATETIME
);

CREATE TABLE `TypeQuestion1` (
TypeID 		TINYINT PRIMARY KEY,
TypeName 	VARCHAR(100)
);

CREATE TABLE `CategoryQuestion1` (
CategoryID		INT PRIMARY KEY,
CategoryName	VARCHAR(50)
);

CREATE TABLE `Questions1` (
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

CREATE TABLE `Answer1` (
AnswerID	TINYINT AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(100),
QuestionID	INT NOT NULL ,
isCorrect	ENUM('True','Fales')
);

CREATE TABLE `Exam1` (
ExamID		INT PRIMARY KEY,
Code1		TINYINT,
Title		VARCHAR(50),
CategoryID	INT,
Duration	TIME,
creatorID	INT,
CreateDate	DATETIME
);

CREATE TABLE `ExamQuestions1` (
ExamID		INT PRIMARY KEY,
QuestionID	INT 
); 

#### tao rang buoc giua bang 91011

ALTER TABLE `Exam1` ADD CONSTRAINT rangbuoc6 FOREIGN KEY (ExamID) REFERENCES `Exam1`(ExamID);
ALTER TABLE `Answer1` ADD CONSTRAINT rangbuoc7 FOREIGN KEY (QuestionID) REFERENCES `Answer1`(QuestionID);

################# them du lieu vao bang









