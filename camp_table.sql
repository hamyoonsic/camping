/*
  
-----------------------[  MEMBER ]------------------------------------------
 
--시퀀스
create sequence seq_member_mem_idx;

create table member
(
mem_idx				int,							--멤버일련번호
grade_idx			int				not null,		--등급일련번호
mem_email			varchar2(200)	not null,		--멤버이메일
mem_pwd				varchar2(200)	not null,		--멤버비밀번호
mem_gender			varchar2(200)	not null,		--멤버성별
mem_nickname		varchar2(200)	not null,		--멤버닉네임
mem_birth			varchar2(200),					--멤버생일
mem_regdate			date,							--가입일자
mem_pic_filename	varchar2(200),					--프로필사진
mem_profile			varchar2(100),					--자기소개글
mem_status			int				not null		--탈퇴계정관리
)


--기본키
alter table member
 add constraint pk_member_mem_idx primary key(mem_idx);

 
--alter table member drop constraint fk_member_mem_idx;--삭제용코드
 
--외래키
alter table member
 add constraint fk_member_mem_idx foreign key(grade_idx)
          							references grade(grade_idx);
--이메일 유니크 제약  
alter table member
       add constraint unique_mem_email unique(mem_email);
       
--성별 체크 제약       
alter table member 
	add constraint check_mem_gender check(mem_gender='남자'or mem_gender='여자');
 
--닉네임 유니크 제약 
alter table member
       add constraint unique_mem_nickname unique(mem_nickname);
 
-----------------------[  MEM_OUT ]------------------------------------------ 

 create sequence seq_mem_out_idx;
 
 create table mem_out
 (
 mem_out_idx		int,				--탈퇴회원 일련번호
 mem_idx			int,				--멤버일련번호
 mem_out_regdate	date	not null	--탈퇴일자
 )
 
--기본키
alter table mem_out
 add constraint pk_mem_out_idx primary key(mem_out_idx);
 
 --외래키
 alter table mem_out
 add constraint fk_mem_out_idx foreign key(mem_out_idx)
          references member(mem_idx);
 
 
 
 
-----------------------[  GRADE ]------------------------------------------ 

--시퀀스 없음

create table grade
(
grade_idx			int,									--등급일련번호
grade_name			varchar2(100)	default '브론즈' not null --등급별이름
)

--기본키
alter table grade
 add constraint pk_grade_grade_idx primary key(grade_idx);

-----------------------[  GRADEUP ]------------------------------------------ 

--시퀀스
create sequence seq_gradeup_idx;

create table gradeup
(
gradeup_idx			int,							--등급일련번호
mem_idx				int,							--멤버일련번호
gradeup_reply_count	int		default 0 not null,		--해당 멤버의 총 댓글 수
gradeup_post_count	int		default 0 not null,		--해당 멤버의 총 게시글 수
gradeup_like_count	int		default 0 not null		--해당 멤버의 총 좋아요 수
)

--기본키
alter table gradeup
 add constraint pk_gradeup_gradeup_idx primary key(gradeup_idx);

--외래키 
alter table gradeup
 add constraint fk_gradeup_gradeup_idx foreign key(gradeup_idx)
          references member(mem_idx);

-----------------------[  MSG ]------------------------------------------ 

--시퀀스
create sequence seq_msg_idx;

create table msg	
(
msg_idx				int,										--메세지 일련번호
msg_content			varchar2(200)	not null,					--메세지내용
msg_sender			int				not null,					--메세지 보낸사람
msg_receiver		int				not null,					--메세지 받는사람
msg_sendtime		date			not null,					--메세지 보낸시간
msg_opentime		date,										--메세지 연 시간
msg_read_check		varchar2(50)	default '읽지 않음' not null	--메세지 열었는지 확인
)

--기본키
alter table msg
 add constraint pk_msg_msg_idx primary key(msg_idx);

-----------------------[  CATEGORY ]------------------------------------------ 

--시퀀스없음

create table category
(
category_idx		int,							--카테고리일련번호
category_type		varchar2(50) default '리뷰게시판'	--카테고리 종류
)

--기본키
alter table category
 add constraint pk_category_category_idx primary key(category_idx);

-----------------------[  REVIEW ]------------------------------------------ 

--시퀀스
create sequence seq_review_idx;

create table review
(
review_idx			int,									--리뷰글 일련번호
category_idx		int,									--카테고리 일련번호
mem_idx				int,									--멤버 일련번호
review_title		varchar2(100)	not null,				--리뷰글 제목
review_content		varchar2(100)	not null,				--리뷰글 내용
review_regdate		date			not null,				--리뷰글 등록일
review_hit_count	int				default 0 not null,		--리뷰글 조회소
review_like_count	int				default 0 not null,		--리뷰글 좋아요 수
review_thumbnail	varchar2(500),							--리뷰글 썸네일
review_ip			varchar2(100)	not null				--글쓸 당시ip
)

--기본키
alter table review
 add constraint pk_review_review_idx primary key(review_idx);

--외래키
alter table review
 add constraint fk_review_review_idx foreign key(review_idx)
          references category(category_idx);
          
--외래키  
alter table review
 add constraint fk_review_review_mem_idx foreign key(review_idx)
          references member(mem_idx);
          
-----------------------[  REVIEW_REPLY ]------------------------------------------ 

--시퀀스
create sequence seq_review_reply_idx;

create table review_reply
(
review_reply_idx		int,							--리뷰 댓글 일련번호
mem_idx					int				not null,		--멤버 일련번호
review_idx				int				not null,		--리뷰글 일련번호
review_reply_content 	varchar2(500)	not null,		--리뷰댓글 내용
review_reply_regdate 	date			not null,		--리뷰댓글 등록시간
review_reply_ip			varchar2(100)	not null		--리뷰댓글ip
)

--기본키
alter table review_reply
 add constraint pk_review_review_reply_idx primary key(review_reply_idx);
 
--외래키
alter table review_reply
 add constraint fk_review_reply_idx foreign key(review_reply_idx)
          references member(mem_idx);
          
--외래키
alter table review_reply
 add constraint fk_review_reply__idx foreign key(review_reply_idx)
          references review(review_idx);
          
-----------------------[  REVIEW_LIKE ]------------------------------------------ 

--시퀀스
create sequence seq_review_like_idx;
		
create table review_like
(
review_like_idx		int,							--리뷰글 좋아요 일련번호
mem_idx				int		not null,				--멤버 일련번호
review_idx			int		not null,				--리뷰글 일련번호
review_like_check	int		default 0 not null		--리뷰글 좋아요 체크
)

--기본키
alter table review_like
 add constraint pk_review_like_review_like_idx primary key(review_like_idx);
--외래키
alter table review_like
 add constraint fk_review_like_mem_idx foreign key(review_like_idx)
          references member(mem_idx);
          
--외래키
alter table review_like
 add constraint fk_review_like_idx foreign key(review_like_idx)
          references review(review_idx);
          
-----------------------[  REVIEW_REPLY_LIKE ]------------------------------------------           

--시퀀스
create sequence seq_review_reply_like_idx;          

create table review_reply_like
(
review_reply_like_idx	int,						--리뷰댓글 좋아요 일련번호
mem_idx					int		not null,			--멤버일련번호
review_reply_idx		int		not null,			--리뷰댓글 일련번호
review_reply_like_check int		default 0 not null	--리뷰글 좋아요 체크
)

--기본기
alter table review_reply_like
 add constraint pk_review_reply_like_idx primary key(review_reply_like_idx);

--외래키
alter table review_reply_like
 add constraint fk_review_reply_like_mem_idx foreign key(review_reply_like_idx)
          references member(mem_idx);
          
--외래키
alter table review_reply_like
 add constraint fk_review_reply_like_idx foreign key(review_reply_like_idx)
          references review_reply(review_reply_idx);
          
-----------------------[  CARPOOL ]------------------------------------------ 

--시퀀스
create sequence seq_carpool_idx;

create table carpool
(
carpool_idx			int,								--카풀글 일련번호
category_idx		int,								--카테고리 일련번호
mem_idx				int,								--멤버 일련번호
carpool_title		varchar2(100)	not null,			--카풀글 제목
carpool_content		varchar2(2000)	not null,			--카풀글 내용
carpool_regdate		date			not null,			--카풀글 등록일
carpool_hit_count	int				default 0 not null,	--카풀글 조회수
carpool_like_count	int				default 0 not null,	--카풀글 좋아요 수
carpool_ip			varchar2(100)	not null			--글쓸 당시 ip
)

--기본기
alter table carpool
 add constraint pk_carpool_carpool_idx primary key(carpool_idx);

--외래키
alter table carpool
 add constraint fk_carpool_carpool_idx foreign key(carpool_idx)
          references category(category_idx);
         
--외래키
alter table carpool
 add constraint fk_carpool_carpool_mem_idx foreign key(carpool_idx)
          references member(mem_idx);
          
-----------------------[  CARPOOL_REPLY ]------------------------------------------ 
 
--시퀀스 
create sequence seq_carpool_reply_idx; 
                 
create table carpool_reply
(
carpool_reply_idx		int,							--카풀 댓글 일련번호
mem_idx					int		not null,				--멤버 일련번호
carpool_idx				int		not null,				--카풀글 일련번호
carpool_reply_content 	varchar2(500)	not null,		--카풀댓글 내용
carpool_reply_regdate 	date	not null,				--카풀댓글 등록시간
carpool_reply_ip		varchar2(100)	not null		--카풀댓글ip
)

--기본키
alter table carpool_reply
 add constraint pk_carpool_carpool_reply_idx primary key(carpool_reply_idx);

--외래키
alter table carpool_reply
 add constraint fk_carpool_reply_mem_idx foreign key(carpool_reply_idx)
          references member(mem_idx);
          
--외래키
alter table carpool_reply
 add constraint fk_carpool_reply_idx foreign key(carpool_reply_idx)
          references carpool(carpool_idx);
   
-----------------------[  CARPOOL_LIKE ]------------------------------------------ 
      
--시퀀스
create sequence seq_carpool_like_idx;    

create table carpool_like
(
carpool_like_idx	int,							--카풀글 좋아요 일련번호
mem_idx				int		not null,				--멤버 일련번호
carpool_idx			int		not null,				--카풀글 일련번호
carpool_like_check	int		default 0 not null		--카풀글 좋아요 체크
)

--기본키
alter table carpool_like
 add constraint pk_carpool_like_idx primary key(carpool_like_idx);
 
--외래키
alter table carpool_like
 add constraint fk_carpool_like_mem_idx foreign key(carpool_like_idx)
          references member(mem_idx);
 
--외래키
alter table carpool_like
 add constraint fk_carpool_like_idx foreign key(carpool_like_idx)
          references carpool(carpool_idx);
          
-----------------------[  CAPPOOL_REPLY_LIKE ]------------------------------------------ 
 
--시퀀스
create sequence seq_carpool_reply_like_idx;
 
create table carpool_reply_like
(
carpool_reply_like_idx		int,						--카풀댓글 좋아요 일련번호
mem_idx						int		not null,			--멤버일련번호
carpool_reply_idx			int		not null,			--카풀댓글 일련번호
carpool_reply_like_check	int		default 0 not null	--카풀글 좋아요 체크
)

--기본키
alter table carpool_reply_like
 add constraint pk_carpool_reply_like_idx primary key(carpool_reply_like_idx);
 
--외래키
alter table carpool_reply_like
 add constraint fk_carpool_reply_like_mem_idx foreign key(carpool_reply_like_idx)
          references member(mem_idx);
          
--외래키
alter table carpool_reply_like
 add constraint fk_carpool_reply_like_idx foreign key(carpool_reply_like_idx)
          references carpool_reply(carpool_reply_idx);
          
-----------------------[  MARKET ]------------------------------------------ 

--시퀀스
create sequence seq_market_idx;

create table market
(
market_idx			int,								--마켓글 일련번호
category_idx		int,								--카테고리 일련번호
mem_idx				int,								--멤버 일련번호
market_title		varchar2(100)	not null,			--마켓글 제목
market_content		varchar2(2000)	not null,			--마켓글 내용
market_regdate		date			not null,			--마켓글 등록일
market_hit_count	int				default 0 not null,	--마켓글 조회수
market_like_count	int				default 0 not null,	--마켓글 좋아요 수
market_thumbnail	varchar2(500),						--마켓글 썸네일
market_ip			varchar2(100)	not null,			--글쓸 당시ip
market_buy_sell		varchar2(50)	not null			--삽니다/팝니다/나눔
)

--기본키
alter table market
 add constraint pk_market_market_idx primary key(market_idx);
 
--외래키
alter table market
 add constraint fk_market_idx foreign key(market_idx)
          references category(category_idx);
          
--외래키
alter table market
 add constraint fk_market_mem_idx foreign key(market_idx)
          references member(mem_idx);
          
--삽니다 팝니다 나눔 체크제약
alter table market 
add constraint check_market_buy_sell check(market_buy_sell='삽니다'or market_buy_sell='팝니다' or market_buy_sell='나눔');

-----------------------[  MARKET_REPLY ]------------------------------------------ 

--시퀀스
create sequence seq_market_reply_idx;

create table market_reply
(
market_reply_idx		int,							--마켓 댓글 일련번호
mem_idx					int		not null,				--멤버 일련번호
market_idx				int		not null,				--마켓글 일련번호
market_reply_content 	varchar2(500)	not null,		--마켓댓글 내용
market_reply_regdate 	date	not null,				--마켓댓글 등록시간
market_reply_ip			varchar2(100)	not null		--마켓댓글ip
)

--기본키
alter table market_reply
 add constraint pk_market_reply_idx primary key(market_reply_idx);
 
--외래키
alter table market_reply
 add constraint fk_market_reply_mem_idx foreign key(market_reply_idx)
          references member(mem_idx);
 
--외래키
alter table market_reply
 add constraint fk_market_reply_idx foreign key(market_reply_idx)
          references market(market_idx);
          
-----------------------[ MARKET_LIKE ]------------------------------------------ 

--시퀀스
create sequence seq_market_like_idx;

create table market_like
(
market_like_idx		int,							--마켓글 좋아요 일련번호
mem_idx				int		not null,				--멤버 일련번호
market_idx			int		not null,				--마켓글 일련번호
market_like_check	int		default 0  not null		--마켓글 좋아요 체크
)

--기본키
alter table market_like
 add constraint pk_market_like_idx primary key(market_like_idx);
 
--외래키
alter table market_like
 add constraint fk_market_like_mem_idx foreign key(market_like_idx)
          references member(mem_idx);

--외래키
alter table market_like
 add constraint fk_market_like_idx foreign key(market_like_idx)
          references market(market_idx);
          
-----------------------[ MARKET_REPLY_LIKE ]------------------------------------------ 

--시퀀스
create sequence seq_market_reply_like_idx;

create table market_reply_like
(
market_reply_like_idx		int,						--마켓댓글 좋아요 일련번호
mem_idx						int		not null,			--멤버일련번호
market_reply_idx			int		not null,			--마켓댓글 일련번호
market_reply_like_check		int		default 0 not null	--마켓글 좋아요 체크
)

--기본키
alter table market_reply_like
 add constraint pk_market_reply_like_idx primary key(market_reply_like_idx);

--외래키
alter table market_reply_like
 add constraint fk_market_reply_like_mem_idx foreign key(market_reply_like_idx)
          references member(mem_idx);
          
--외래키
alter table market_reply_like
 add constraint fk_market_reply_like_idx foreign key(market_reply_like_idx)
          references market_reply(market_reply_idx);
*/