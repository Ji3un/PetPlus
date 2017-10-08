use myDB /*꼭 실행*/

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
drop table PETMEMBER

insert PETMEMBER(UserID,Password,Name,Pnumber,Rnumber,gender,email,smsagree,emailagree,animal) values('master','1234','관리자','01012345678','170101','여','pet_ah@naver.com',1,1,'유')
insert PETMEMBER(UserID,Password,Name,Pnumber,Rnumber,gender,email,smsagree,emailagree,animal) values('pona','1234','이현아','01097290404','960404','여','pona04@naver.com',1,1,'유')

/*캘린더T*/
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


/*온라인캠페인*/
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

/*톡톡T*/
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
	tfile   char(1) default'N'
)
SELECT * FROM TTalk

insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('pet_ah','훈련하는 법 알려줌','...',1,0,0,30,8,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('PONA','강아지도 쌍수하는거 알고 있엇?','...',1,0,0,53,14,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('serim','열대어키우고싶다','...',1,0,0,7,1,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('penny','다들 펫플러스 어떻게 오셨어요?','...',1,0,0,23,12,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('fishman','애견 다이어트 하시나여??','...',1,0,0,85,37,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('ehdgk','고슴도치 키우시는 분들','...',1,0,0,14,4,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('young7','이번주 고양이 학대 진실','...',1,0,0,102,77,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('jihu','강아지 친구 만들고 싶으신분?','...',1,0,0,52,23,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('wldms','덧글 놀이~~','...',1,0,0,36,2,'Y')
insert TTalk(UserID,title,body,ref_id,inner_id,depth,hit,rec,tfile) values('pet_ah','들어와ㄱㄱ','...',1,0,0,61,7,'Y')

insert pfile (tname,tseq,fName) values('T',1,'week1.jpg')
insert pfile (tname,tseq,fName) values('T',1,'week2.jpg')
insert pfile (tname,tseq,fName) values('T',2,'week2.jpg')
insert pfile (tname,tseq,fName) values('T',3,'week1.jpg')
insert pfile (tname,tseq,fName) values('T',3,'week3.jpg')
insert pfile (tname,tseq,fName) values('T',4,'week4.jpg')
insert pfile (tname,tseq,fName) values('T',5,'week3.jpg')
insert pfile (tname,tseq,fName) values('T',6,'week5.jpg')
insert pfile (tname,tseq,fName) values('T',7,'week6.jpg')
/*톡톡 댓글T*/
create Table Tcomment (
	seq	 int  IDENTITY(1,1) primary key,
	tseq int,
	UserID	nvarchar(20),
	content  text,
	nDate 	datetime  default(getDate())
)

select * from Tcomment;

DROP TABLE Tcomment

insert Tcomment(tseq,UserID,content) values(1,'pet_ah','안녕하세요 반갑습니다.')
insert Tcomment(tseq,UserID,content) values(1,'serim','펫플러스 너무 좋은거 같아요.')
insert Tcomment(tseq,UserID,content) values(1,'pona','커뮤니티 짱이예용')


--주간펫T 생성
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

--핫딜T 생성
create table Hotdeal(
	seq 	int  identity(1,1) primary key,
	category varchar(10),
	userID	nvarchar(30) default'master',
	title1 	nvarchar(100) not null,
	title2  nvarchar(100) not null,
	cName  nvarchar(50) not null,
	contents nvarchar(300) not null,
	hit 	int default 0,
	rec		int default 0,
	deleted char(1) default'N',
	hDate 	datetime default(getDate()),
	hfile  	char(1) default'N'
)

