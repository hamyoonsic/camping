package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDaoImpl implements MemberDao {


   SqlSession sqlSession;
   
   
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }

   
   
   @Override
   public List<MemberVo> selectList() {
      // TODO Auto-generated method stub
      
      List<MemberVo> list = null;
      
      list = sqlSession.selectList("member.member_mypage_adm");
      
      
      return list;
   }



   @Override
   public int insert(MemberVo vo) {
      // TODO Auto-generated method stub
      return sqlSession.insert("member.member_insert",vo);
   }



   @Override
   public int delete(int mem_idx) {
      // TODO Auto-generated method stub
      return sqlSession.delete("member.member_delete",mem_idx);
   }



   @Override
   public int update(MemberVo vo) {
      // TODO Auto-generated method stub
      return sqlSession.update("member.member_update", vo);
   }


   
   @Override
   public MemberVo selectOne(int mem_idx) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("member.member_one_mem_idx", mem_idx);
   }



   @Override
   public MemberVo selectOne(String mem_email) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("member.member_one_mem_email",mem_email);
   }



   @Override
   public MemberVo selectOne1(String mem_nickname) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("member.member_one_mem_nickname",mem_nickname);
   }

//mem_idx에 해당하는 좋아요, 게시글,댓글 수 체크 

   @Override
   public int selectOne_like_count(int mem_idx) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("member.member_like_count",mem_idx);
   }



   @Override
   public int selectOne_reply_count(int mem_idx) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("member.member_reply_count",mem_idx );
   }



   @Override
   public int selectOne_category_count(int mem_idx) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("member.member_category_count",mem_idx );
   }


	//페이징
	
	
	@Override 
	  public int selectRowTotal(Map map) { 
		
		return sqlSession.selectOne("member.member_condition_row_total",map); 
	  
	}
	
	
	
	@Override
	public List<MemberVo> selectConditionList(Map map) {
		// TODO Auto-generated method stub
		
		List<MemberVo> list = null;
		
		//2.실행
		list = sqlSession.selectList("member.member_condition_list", map);
		
		
		return list;
	}



	/*
	 * @Override public int selectRowTotal() { // TODO Auto-generated method stub
	 * return sqlSession.selectOne("member.member_row_total"); }
	 */



	@Override
	public List<MemberVo> selectList(Map map) {
		// TODO Auto-generated method stub
		 return sqlSession.selectList("member.member_mypage_adm",map);
	}



	  @Override
	   public int selectOne_reply_like_count(int mem_idx) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectOne("member.member_reply_like_count",mem_idx);
	   }




	   @Override
	   public int member_update(MemberVo vo) {
	      // TODO Auto-generated method stub
	      return sqlSession.update("member.member_update",vo);
	   }




	   @Override
	   public int member_out(MemberVo vo) {
	      // TODO Auto-generated method stub
	      return sqlSession.update("member.member_out",vo);
	   }




	   public int photo_upload(MemberVo vo) {
		      // TODO Auto-generated method stub
		      return sqlSession.update("member.photo_upload",vo);
		   }


	   @Override
		public int member_getout(MemberVo vo) {
			// TODO Auto-generated method stub
			return sqlSession.update("member.member_getout",vo);
		}

		@Override
		public int member_admin(MemberVo vo) {
			// TODO Auto-generated method stub
			return sqlSession.update("member.member_admin",vo);
		}



		@Override
		public int member_to_silver(MemberVo vo) {
			// TODO Auto-generated method stub
			return sqlSession.update("member.member_to_silver",vo);
		}



		@Override
		public int member_to_gold(MemberVo vo) {
			// TODO Auto-generated method stub
			return sqlSession.update("member.member_to_gold",vo);
		}



		@Override
		public int member_to_ple(MemberVo vo) {
			// TODO Auto-generated method stub
			return sqlSession.update("member.member_to_ple",vo);
		}
	
	

}