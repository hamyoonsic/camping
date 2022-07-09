/*


grade

insert into grade values('1','브론즈');
insert into grade values('2','실버');
insert into grade values('3','골드');
insert into grade values('4','플래티넘');
insert into grade values('5','관리자');



 member

insert  into member values(seq_member_mem_idx.nextVal,5,'admin@campus.com','1234','남자','관리자임당','2022.07.07',sysdate,null,'반갑습니당',1);
insert  into member values(seq_member_mem_idx.nextVal,3,'one@campus.com','1234','여자','one임당','2022.07.08',sysdate,null,'사랑합니다',1);
insert  into member values(seq_member_mem_idx.nextVal,4,'two@campus.com','1234','남자','two임당','2022.07.09',sysdate,null,'힘내용',0);
insert  into member values(seq_member_mem_idx.nextVal,2,'three@campus.com','1234','여자','three임당','2022.07.10',sysdate,null,'잘부탁드립니당',1);
insert  into member values(seq_member_mem_idx.nextVal,1,'four@campus.com','1234','남자','four임당','2022.07.10',sysdate,null,'졸려용',1);

mem_out

insert into mem_out values(seq_mem_out_idx.nextVal,32,'2022.07.10');



 gradeup

insert into gradeup values(seq_gradeup_gradeup_idx.nextVal,2,5,1,10);
insert into gradeup values(seq_gradeup_gradeup_idx.nextVal,5,0,0,0);
insert into gradeup values(seq_gradeup_gradeup_idx.nextVal,4,3,1,3);

 msg

insert into msg values(seq_msg_msg_idx.nextVal,'안녕하세요!주원님',2,5,sysdate,null,'읽지않음')

category

insert into grade values('1','리뷰게시판')
insert into grade values('2','거래게시판')
insert into grade values('3','카풀게시판')

review

insert into review values(seq_review_idx.nextVal,1,2,'첫번째리뷰','첫번째리뷰관련내용','2022.07.07',26,3,null,'100.100.100.100')
insert into review values(seq_review_idx.nextVal,2,4,'한강 난지공원 다녀왔어요','한강가고싶다',sysdate,50,3,null,'100.100.100.100')
insert into review values(seq_review_idx.nextVal,3,5,'오늘디비끝내네..','리뷰관련','2022.07.09',40,1,null,'100.100.100.100')

 review_reply

insert into review_reply values(seq_review_reply_idx.nextVal,5,1,'오 멋있어요',sysdate,'100.100.100.100')
insert into review_reply values(seq_review_reply_idx.nextVal,2,2,'저도 꼭 가봐야겠네요,,~',sysdate,'100.100.100.100')
insert into review_reply values(seq_review_reply_idx.nextVal,4,3,'wow',sysdate,'100.100.100.100')

review_like

insert into review_like values(seq_review_like_idx.nextVal,4,3,0)
insert into review_like values(seq_review_like_idx.nextVal,2,1,2)
insert into review_like values(seq_review_like_idx.nextVal,5,2,1)

review_reply_like
 
 insert into review_reply_like values(seq_review_reply_llike_idx.nextVal,4,3,0)
insert into review_reply_like values(seq_review_reply_llike_idx.nextVal,2,1,1)
insert into review_reply_like values(seq_review_reply_llike_idx.nextVal,5,2,0)

carpool

insert into carpool values(seq_carpool_idx.nextVal,2,2,'양양갈사람','쪽지주세요','2022.07.07',2,0,'100.100.100.100')
insert into carpool values(seq_carpool_idx.nextVal,2,4,'8월15일 동행구해요','어디가실래요',sysdate,5,1,'100.100.100.100')
insert into carpool values(seq_carpool_idx.nextVal,2,5,'을왕리 같이가요','잠실출발','2022.07.01',16,3,'100.100.100.100')

carpool_reply

 insert into carpool_reply values(seq_carpool_reply_idx.nextVal,2,2,null,null,null)
insert into carpool_reply values(seq_carpool_reply_idx.nextVal,4,1,'저요',sysdate,'100.100.100.100')
insert into carpool_reply values(seq_carpool_reply_idx.nextVal,5,3,'쪽지드렸어요',sysdate,'100.100.100.100')

carpool_like

insert into carpool_like values(seq_carpool_like_idx.nextVal,5,3,1)
insert into carpool_like values(seq_carpool_like_idx.nextVal,2,1,0)
insert into carpool_like values(seq_carpool_like_idx.nextVal,4,2,1)

carpool_reply_like

insert into carpool_reply_like values(seq_carpool_reply_like_idx.nextVal,4,2,1)
insert into carpool_reply_like values(seq_carpool_reply_like_idx.nextVal,2,1,1)
insert into carpool_reply_like values(seq_carpool_reply_like_idx.nextVal,5,3,1)

market

insert into market values(seq_market_idx.nextVal,3,5,'아이스박스 15년사용 500원','아이스박스를 제가 15년 썼는데 너무 차가워요',sysdate,25,20,null,'192.168.0.2','팝니다');
insert into market values(seq_market_idx.nextVal,3,4,'캠핑의자 삽니다','캠핑의자를 꼭 사고싶어요',sysdate,17,119,null,'192.168.0.2','삽니다');
insert into market values(seq_market_idx.nextVal,3,1,'수면양말 무료나눔합니다','3년 사용한 수면양말 무료나눔합니다',sysdate,64,81,null,'192.168.0.2','나눔');


market_reply

insert into market_reply values(seq_market_Reply_idx.nextVal,2,1,'아이스박스 제가 삽니다',sysdate,'192.168.3.7');
insert into market_reply values(seq_market_Reply_idx.nextVal,1,2,'캠핑의자 꼭 사시길 바랍니다',sysdate,'192.168.3.7');
insert into market_reply values(seq_market_Reply_idx.nextVal,3,3,'수면양말 받으러 어디로 가면 될까여?',sysdate,'192.168.3.7');

market_like

insert into market_like values(seq_market_like_idx.nextVal,1,1,1);
insert into market_like values(seq_market_like_idx.nextVal,2,2,1);
insert into market_like values(seq_market_like_idx.nextVal,3,3,1);

market_reply_like

insert into market_reply_like values(seq_market_reply_like_idx.nextVal,1,1,1);
insert into market_reply_like values(seq_market_reply_like_idx.nextVal,2,1,1);
insert into market_reply_like values(seq_market_reply_like_idx.nextVal,3,1,1);




































*/