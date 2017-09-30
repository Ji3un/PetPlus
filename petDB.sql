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


insert Weekly (category,title,hit,rec,wfile) values ('예방','"반려동물" 입양 전 꼭 체크해야 하는 사항 5가지',40,5,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('질병','고양이가 좋아하는 의외의 물건 7가지',30,3,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('예방','반려견이 먹으면 독이 되는 사람이 먹는 7가지 건강식품',86,34,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('예방','반려견도 걸릴 수 있는 "우울증" 증상 6가지',11,1,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('헬스','반려견, 얼마나 자주 씻겨야 할까',22,4,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('헬스','반려동물을 구하는 응급처치',35,2,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('예방','반려동물의 비만,사람보다 더 치명적!',63,29,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('뷰티','강아지 마사지 방법',29,3,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('뷰티','반려동물 잠자는 자세에 따른 성격과 수면시간',32,6,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('뷰티','반려동물의 중성화수술 꼭 필요한가?',14,2,'Y')
insert Weekly (category,title,hit,rec,wfile) values ('예방','반려동물 배변 실수 대처',1,0,'Y')
--weekly 폴더에 사진이 다 있어야함
insert pfile (tname,tseq,fName) values('W',1,'week1.jpg')
insert pfile (tname,tseq,fName) values('W',1,'week2.jpg')
insert pfile (tname,tseq,fName) values('W',2,'week2.jpg')
insert pfile (tname,tseq,fName) values('W',2,'week1.jpg')
insert pfile (tname,tseq,fName) values('W',2,'week3.jpg')
insert pfile (tname,tseq,fName) values('W',3,'week4.jpg')
insert pfile (tname,tseq,fName) values('W',3,'week3.jpg')
insert pfile (tname,tseq,fName) values('W',4,'week5.jpg')
insert pfile (tname,tseq,fName) values('W',4,'week6.jpg')
insert pfile (tname,tseq,fName) values('W',5,'week6.jpg')
insert pfile (tname,tseq,fName) values('W',5,'week2.jpg')
insert pfile (tname,tseq,fName) values('W',6,'week7.jpg')
insert pfile (tname,tseq,fName) values('W',6,'week4.jpg')
insert pfile (tname,tseq,fName) values('W',7,'week8.jpg')
insert pfile (tname,tseq,fName) values('W',7,'week3.jpg')
insert pfile (tname,tseq,fName) values('W',8,'week9.jpg')
insert pfile (tname,tseq,fName) values('W',8,'week5.jpg')
insert pfile (tname,tseq,fName) values('W',9,'week10.jpg')
insert pfile (tname,tseq,fName) values('W',9,'week7.jpg')
insert pfile (tname,tseq,fName) values('W',10,'week11.jpg')
insert pfile (tname,tseq,fName) values('W',10,'week9.jpg')
insert pfile (tname,tseq,fName) values('W',11,'week12.jpg')

--------------
drop table weekly
drop table pfile
drop table Hotdeal




