use myDB

/*회원*/
create table PETMEMBER (
   	UserID	  varchar(30) primary key,
　  Password  varchar(100) not null,
	Name	  varchar(30) not null,
	nickname varchar(30)  ,
	Pnumber	  varchar(30),
	Rnumber varchar(30),
	gender varchar(5),
	email varchar(40),
	smsagree int default 0, 
	emailagree int default 0,
	animal varchar(5)
)
select * from PETMEMBER

insert PETMEMBER(UserID,Password,Name,Pnumber,Rnumber,gender,email,smsagree,emailagree,animal) values('master','1234','관리자','01097290404','170101','여','pet_ah@naver.com',1,1,'유')

/*캘린더*/
Create Table diary (
	seq	    int   Identity(1,1)  Primary Key,
	userID	    nvarchar(30)  not null,
	sDate	    date 	 not null,
	sTime	    nvarchar(12)  not null,
	toDo	    nvarchar(max) not null,
	hasDone  char(1)  Default('N')
)

select * from diary;


/*쪽지보내기*/
create table Message (
msgID		int identity(1,1) primary key,
fromUser	nvarchar(30) not null,
toUser		nvarchar(30) not null,
content	nvarchar(200),
status		int default(0),
sDate		datetime default(getdate( ))
)

select * from Message;


/*한줄채팅*/
create Table petNote (
	nID	int  IDENTITY(1,1) primary key,
	UserID	nvarchar(20),
	content  text,
	nDate 	datetime  default(getDate())
)

select * from petNote;

insert petNote(UserID,content) values('pet_ah','안녕하세요 반갑습니다.')
insert petNote(UserID,content) values('serim','펫플러스 너무 좋은거 같아요.')
insert petNote(UserID,content) values('pona','커뮤니티 짱이예용')

--공지사항 디비추가--
create table notice(
	seq int identity(1,1) primary key,
	userID nvarchar(30),
	title nvarchar(100) not null,
	body nvarchar(max) not null,
	hit int default(0),
	wDate datetime
)
select * from notice

/*톡톡*/
create TABLE TTalk (
	seq 	int  identity(1,1) primary key,
	userID	nvarchar(30),
	title 	nvarchar(100) not null,
	body 	nvarchar(max),
	ref_id	 int ,
	inner_id int ,
	depth 	int ,
	hit 	int default 0,
	rec     int default 0,
	deleted char(1) default'N',
	tDate 	datetime default(getDate()),
	tfile   char(1) default'N',
	fName	nvarchar(50),
	fSize	int default 0
)

insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pet_ah','펫플러스 게시판 너무 좋아요','테스트',1,0,0,'dogs1.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pona','답글 테스트_1','답글 테스트 중입니다',1,1,1,'dog-2217040_960_720.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pona','답글 테스트_1_1','답글 테스트 중입니다',1,2,2,'dog-2217040_960_720.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pet_ah','게시판 테스트','테스트',3,0,0,'dogs1.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pet_ah','게시판 테스트','테스트',4,0,0,'dogs1.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pet_ah','게시판 테스트','테스트',5,0,0,'dogs1.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pet_ah','게시판 테스트_2','테스트',6,0,0,'dogs1.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pona','답글 테스트_2','답글 테스트 중입니다',6,1,1,'dog-2217040_960_720.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pet_ah','게시판 테스트','테스트',7,0,0,'dogs1.jpg')
insert Talk (userID,title,body,ref_id,inner_id,depth,fName)values ('pet_ah','게시판 테스트','테스트',8,0,0,'dogs1.jpg')

--주간펫/핫딜 테이블 생성
create TABLE Weekly (
	seq 	int identity(1,1) primary key,
	category varchar(10),
	userID	nvarchar(30) default'master',
	title 	nvarchar(100) not null,
	hit 	int default 0,
	rec     int default 0,
	deleted char(1) default'N',
	wDate 	datetime default(getDate()),
	wfile   char(1) default'N'
)

create table Hotdeal(
	seq 	int  identity(1,1) primary key,
	category varchar(10),
	userID	nvarchar(30) default'master',
	title1 	nvarchar(100) not null,
	title2  nvarchar(100) not null,
	cName  nvarchar(50) not null,
	hit 	int default 0,
	rec		int default 0,
	deleted char(1) default'N',
	hDate 	datetime default(getDate()),
	hfile  	char(1) default'N'
)

create TABLE pfile (
    seq 	int  identity(1,1) primary key,
	tname   char(3),
	tseq    int ,
	fName	nvarchar(50),
	fSize	int default 0
)
---주간펫,핫딜 실행
select * from weekly
select * from pfile
select * from Hotdeal
--------------
drop table weekly
drop table pfile
drop table Hotdeal




