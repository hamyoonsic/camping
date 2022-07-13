package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CarpoolVo;
import vo.ReviewVo;

public class ReviewDaoImpl implements ReviewDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public List<ReviewVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("carpool.carpool_list");
	}

	@Override
	public List<ReviewVo> selectList(Map map) {
		// TODO Auto-generated method stub
		List<ReviewVo> list = null;
		
		
		list = sqlSession.selectList("review.review_list_condition", map);
		
		
		return list;
	}

	@Override
	public ReviewVo selectOne(int review_idx) {
		// TODO Auto-generated method stub


		ReviewVo vo = null;
		
		vo = sqlSession.selectOne("carpool.carpool_one", review_idx);
		
		return vo;
	}

}
