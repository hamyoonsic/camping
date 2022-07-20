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
	public List<ReviewVo> selectList(Map map) {
		
		List<ReviewVo> list = null;
		
		//2.½ÇÇà
		list = sqlSession.selectList("review.review_condition_list", map);
		
		
		return list;

	}

	@Override
	public ReviewVo selectOne(int review_idx) {
		// TODO Auto-generated method stub
		return null;
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


}
