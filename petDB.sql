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


/*포토랭킹*/
create TABLE petphoto (
	seq 	int  identity(1,1) primary key,
	userID	nvarchar(30) not null,
	menu nvarchar(10) not null,
	category nvarchar(10) not null,
	title 	nvarchar(100) not null,
	body 	nvarchar(max),
	hit 	int default(0),
	wDate 	datetime Default(getdate()),
	fName	nvarchar(50),
	fSize	int default(0),
	hitDown  int default(0)
)

SELECT * FROM petphoto

insert petphoto(userID,menu,category,title,body,fName) values ('pet_ah','포토랭킹','패션왕','뽀로 모자 귀엽죠','우리 뽀로가 모자가 제일 잘어울리는거 같죠?. 뽀로도 생각보다 마음에 들어하는 거 같아요ㅋㅋㅋㅋ','facat.jpg')
insert petphoto(userID,menu,category,title,body,fName) values ('pona','포토랭킹','러브하우스','한번 실력 발휘 했습니다~','똘이가 방석에서만 잠들곤했는데 한번 똘이 집을 만들어 보았습니다. 괜찮나요? ','hodogg.jpg')
insert petphoto(userID,menu,category,title,body,fName) values ('pet_ah','포토랭킹','얼짱펫','고양이계의 수지','볼터치 너무 귀엽지 않나요ㅋㅋㅋㅋㅋ 걸그룹같아요','bucat.jpg')
insert petphoto(userID,menu,category,title,body,fName) values ('serim','포토랭킹','러브하우스','별이 캣타워 구매했습니다','별이가 정착할 수 있는 캣타워 구매 ㅎㅎ 만드는 건 힘들꺼같아서 구매했는데 디자인 너무 이쁘네요','hocat.jpg')
insert petphoto(userID,menu,category,title,body,fName) values ('pennybenny','포토랭킹','패션왕','핑크 곤듀','하루가 좋아하는 핑크색옷을 입고 산책가자고 쳐다보네요ㅠㅠ','fadog.jpg')
insert petphoto(userID,menu,category,title,body,fName) values ('i931105','포토랭킹','패션왕','복순이 이미지 찍고 왔어요~','사진사분도 이렇게 예쁜 고양이는 처음 보셨다구 ㅎㅎ 복순이 연예묘 같지요?','facatt.jpg')
insert petphoto(userID,menu,category,title,body,fName) values ('kikoa','포토랭킹','얼짱펫','오늘 미용하고 온 둥이','둥이 동그랗게 미용했더니 너무 귀여워서 심장에 무리가 오네요. 다들 심장 조심','budog.jpg')
insert petphoto(userID,menu,category,title,body,fName) values ('pet_ah','포토랭킹','러브하우스','미흡하지만 하우스만들어 봤어요','처음으로 우리 순이 하우스 만들었는데 아직 미흡하죠? 허허 다음엔 더 이쁘게 만들어야 겠어요.','hodog.jpg')


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



/*톡톡*/
create TABLE Talk (
	seq 	int  identity(1,1) primary key,
	userID	nvarchar(30),
	title 	nvarchar(100) not null,
	body 	nvarchar(max),
	ref_id	 int ,
	inner_id int ,
	depth 	int ,
	hit 	int default 0,
	deleted char(1) default'N',
	wDate 	datetime default(getDate()),
	fName	nvarchar(50),
	fSize	int default 0,
	hitDown  int default 0
)

--이 테이블 생성
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
	tName char(3),
	tseq    int,
	fName	nvarchar(50),
	fSize	int default 0
)

create TABLE rec(
    seq 	int  identity(1,1) primary key,
	tName char(3),
	tseq int,
	userID nvarchar(30)
	)
--------------
use myDB

select * from weekly

select * from Hotdeal
select * from pfile

drop table Hotdeal
drop table pfile

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


insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('용품','반려동물을 최선의 선택','빠른배송 로얄 캐닌 2+1 증정','2+1','영양성분 걱정되신다구요? 그렇다면 펫플러스에서 한정기간 동안 제공하는 로얄 캐닌 2+1을 놓치지마세요! 나의 반려동물의 건강을 생각한다면 바로 쿠폰을 겟하세요!',30,5,'Y')
insert pfile(tName,tseq,fName) values ('H',1,'feed_1.png')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('용품','귀엽고 아기자기한 디자인!','애견의류 한정기간 핫딜 진행중!','20%','새롭게 가을을 맞이하여 반려동물의 패션도 바꿔보면 어떨까요? 이쁘고 다양한 후드티와 티셔츠 등 나의 반려동물을 패셔니스타로 만들어보세요!',10,3,'Y')
insert pfile(tName,tseq,fName) values ('H',1,'cloth_1.png')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('호텔','아늑하고 편안한 서비스!','애견호텔 예약 특가 진행','30%','긴 연휴나 휴가동안 반려동물이 외로울까 걱정하셨죠? 반려동물에게 편안함과 아늑함을 제공하는 애견 호텔 핫딜 쿠폰을 겟하세요♥',10,3,'Y')
insert pfile(tName,tseq,fName) values ('H',1,'hotel_1.png')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('미용','산뜻하고 이쁘게 스타일 연출!','추가비용 없이 미용할인 쿠폰','30%','사랑스러운 나의 반려동물을 더 사랑스럽게 만들어보고 싶지 않으신가요? 사랑스러움에 빠질 수 없는 것은 바로 미용이죠!♡',5,3,'Y')
insert pfile(tName,tseq,fName) values ('H',1,'beauty_1.png')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('진료비','반려동물의 건강을 위한','심장사상충 예방접종 할인쿠폰','20%','반려동물의 건강이 제일 우선입니다! 그러기 위해서는 주기적인 예방접종이 필요해요! 이번 핫딜 쿠폰을 통해서 예방 접종을 좀 더 저렴하게 받아보세요~',12,4,'Y')
insert pfile(tName,tseq,fName) values ('H',1,'medical_1.png')
insert Hotdeal (category,title1,title2,cName,contents,hit,rec,hfile) values ('용품','하우스와 스트레칭을 한번에!','고양이용품 냥이박스 1+! 쿠폰','1+1','냥이를 키우시는 냥이 집사님들에게는 필수! 이번 기회에 일본에서 유명한 냥이박스를 1+1 쿠폰을 통해서 겟하세요!',15,3,'Y')
insert pfile(tName,tseq,fName) values ('H',1,'toy_1.png')
