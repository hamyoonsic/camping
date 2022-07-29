package dao;

import java.util.List;
import java.util.Map;

import vo.MemberVo;


public interface MemberDao {

   //전체조회
    List<MemberVo> selectList();

   
    int insert(MemberVo vo);
    int delete(int mem_idx);
    int update(MemberVo vo);
    //mem_idx에 해당되는 객체 1건 구하기 
       MemberVo selectOne(int mem_idx);
   //mem_email에 해당되는 객체 1건 구하기   
       MemberVo selectOne(String mem_email);
   //mem_nickname 중복확인
       MemberVo selectOne1(String mem_nickname);
       
   //mem_idx에 해당하는 like 카운트 수  구하기 
      int selectOne_like_count(int mem_idx);
      
   //mem_idx에 해당하는 reply 카운트 수  구하기 
   int selectOne_reply_count(int mem_idx);
   
      
   //mem_idx에 해당하는 게시물 카운트 수  구하기 
   int selectOne_category_count(int mem_idx);

   //페이징&검색관련
   int selectRowTotal(Map map); 
   List<MemberVo> selectConditionList(Map map);
  // int			  selectRowTotal();
   List<MemberVo> selectList(Map map);


   
   //mem_idx에 해당하는 댓글 좋아요  카운트 수  구하기 
   int selectOne_reply_like_count(int mem_idx);
   
   //mem_idx에 해당하는 개인 정보 수정
   int member_update(MemberVo vo);
   
   //mem_idx에 해당하는 회원 탈퇴 
   int member_out(MemberVo vo);
   
   //photo_upload
   int photo_upload(MemberVo vo);
   
   //mem_idx에 해당하는 회원 휴면계정으로 전환
   int member_getout(MemberVo vo);
   
   //mem_idx에 해당하는 회원 관리자로 등업
   int member_admin(MemberVo vo); 
   
   //브론즈를 실버로 전환
   int member_to_silver(MemberVo vo);
   
   //실버를 골드로 전환
   int member_to_gold(MemberVo vo);
   
   //골드를 플레티넘으로 전환
   int member_to_ple(MemberVo vo);
   
}