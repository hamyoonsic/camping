package dao;

import java.util.List;

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
	
		 
	
}
