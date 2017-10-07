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
	contents nvarchar(300) not null,
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



insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('용품','반려동물을 최선의 선택','빠른배송 로얄 캐닌 2+1 증정','2+1','영양성분 걱정되신다구요? 그렇다면 펫플러스에서 한정기간 동안 제공하는 로얄 캐닌 2+1을 놓치지마세요! 나의 반려동물의 건강을 생각한다면 바로 쿠폰을 겟하세요!',30,5,'Y')
insert pfile(tName,tseq,fName) values ('H',6,'feed_1.jpg')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('용품','귀엽고 아기자기한 디자인!','애견의류 한정기간 핫딜 진행중!','20%','새롭게 가을을 맞이하여 반려동물의 패션도 바꿔보면 어떨까요? 이쁘고 다양한 후드티와 티셔츠 등 나의 반려동물을 패셔니스타로 만들어보세요!',10,3,'Y')
insert pfile(tName,tseq,fName) values ('H',6,'cloth_1.jpg')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('호텔','아늑하고 편안한 서비스!','애견호텔 예약 특가 진행','30%','긴 연휴나 휴가동안 반려동물이 외로울까 걱정하셨죠? 반려동물에게 편안함과 아늑함을 제공하는 애견 호텔 핫딜 쿠폰을 겟하세요♥',10,3,'Y')
insert pfile(tName,tseq,fName) values ('H',6,'hotel_1.jpg')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('미용','산뜻하고 이쁘게 스타일 연출!','추가비용 없이 미용할인 쿠폰','30%','사랑스러운 나의 반려동물을 더 사랑스럽게 만들어보고 싶지 않으신가요? 사랑스러움에 빠질 수 없는 것은 바로 미용이죠!♡',5,3,'Y')
insert pfile(tName,tseq,fName) values ('H',6,'beauty_1.jpg')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('진료비','반려동물의 건강을 위한','심장사상충 예방접종 할인쿠폰','20%','반려동물의 건강이 제일 우선입니다! 그러기 위해서는 주기적인 예방접종이 필요해요! 이번 핫딜 쿠폰을 통해서 예방 접종을 좀 더 저렴하게 받아보세요~',12,4,'Y')
insert pfile(tName,tseq,fName) values ('H',6,'medical_1.jpg')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('용품','하우스와 스트레칭을 한번에!','고양이용품 냥이박스 1+! 쿠폰','1+1','냥이를 키우시는 냥이 집사님들에게는 필수! 이번 기회에 일본에서 유명한 냥이박스를 1+1 쿠폰을 통해서 겟하세요!',15,3,'Y')
insert pfile(tName,tseq,fName) values ('H',6,'toy_1.jpg')


-- 주간펫 내용 삽입
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


select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category = '예방' order by hit desc;
select top 1 w.seq from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) order by hit desc;
select top 1 fname from pfile where tseq = 5 and tname='h'