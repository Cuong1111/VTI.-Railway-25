DROP DATABASE IF EXISTS Testing_System_Assignment_1;

CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department (
DepartmentID		INT,
DepartmentName		VARCHAR(50)
);

CREATE TABLE Position (
PositionID		VARCHAR(50),
PositionName	VARCHAR(50)
);

CREATE TABLE Account (
AccountID		VARCHAR(50),
Email			VARCHAR(50),
Username		VARCHAR(50),
FullName		VARCHAR(50),
DepartmentID	VARCHAR(50),
PositionID		VARCHAR(50),
CreateDate		DATE
);

CREATE TABLE Groupp (
GroupID		VARCHAR(100),
GroupName	VARCHAR(50),
CreatorID	VARCHAR(50),
CreateDate	DATE
);

CREATE TABLE GroupAccount (
GroupID		VARCHAR(50),
AccountID	VARCHAR(50),
JoinDate	DATE
);

CREATE TABLE TypeQuestion (
TypeID 		VARCHAR(100),
TypeName 	VARCHAR(100)
);

CREATE TABLE CategoryQuestion (
CategoryID		INT,
CategoryName	VARCHAR(50)
);

CREATE TABLE Questions (
QuestionID	VARCHAR(50),
Content		VARCHAR(50),
CategoryID	INT,
TypeID		INT,
CreatorID	INT,
CreateDate	DATE
);

CREATE TABLE Answer (
AnswerID	VARCHAR(50),
Content		VARCHAR(100),
QuestionID	VARCHAR(200),
isCorrect	VARCHAR(10)
);

CREATE TABLE Exam (
ExamID		VARCHAR(50),
Code		VARCHAR(10),
Title		VARCHAR(50),
CategoryID	VARCHAR(50),
Duration	INT,
creatorID	INT,
CreateDate	DATE
);

CREATE TABLE ExamQuestions (
ExamID		INT,
QuestionID	INT
);