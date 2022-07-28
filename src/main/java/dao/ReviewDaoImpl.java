package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVo;

public class ReviewDaoImpl implements ReviewDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public List<ReviewVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.review_list");
	}
	
	@Override
	public List<ReviewVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.review_list",m_idx);
	}

	
	@Override
	public List<ReviewVo> selectConditionList(Map map) {
		
		List<ReviewVo> list = null;
		
		//2.실행
		list = sqlSession.selectList("review.review_condition_list", map);
		
		
		return list;

	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review.review_row_total");
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review.review_condition_row_total",map);
	}


	@Override
	public List<ReviewVo> selectList(String search_text) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.review_condition_total",search_text);
	}

	
	@Override
	   public ReviewVo selectOne(int review_idx) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectOne("review.review_one",review_idx);
	   }

	   @Override
	   public int review_insertlike(ReviewVo vo) {
	      // TODO Auto-generated method stub
	      return sqlSession.insert("review.review_insertlike",vo);
	   }

	   @Override
	   public int review_deletelike(ReviewVo vo) {
	      // TODO Auto-generated method stub
	      return sqlSession.delete("review.review_deletelike",vo);

	   }
	   
      @Override
      public int update_readhit(int review_idx) {
         // TODO Auto-generated method stub
         return sqlSession.update("review.review_update_readhit", review_idx);
      }


	@Override
	public int insert(ReviewVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review.review_insert", vo);	}


	@Override
	public int reply(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int delete(int review_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("review.review_delete",review_idx);
	}


	@Override
	public int update(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int update_step(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int modify(ReviewVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("review.review_modify",vo);
	}   
      
   //mem_idx에 해당하는 review리스트 가져오기 
   @Override
   public List<ReviewVo> review_mem_list(int mem_idx) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("review.review_mem_list",mem_idx);
   }        
}
