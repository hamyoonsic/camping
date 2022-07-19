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
	public List<ReviewVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.review_list",m_idx);
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
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reply(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int review_idx) {
		// TODO Auto-generated method stub
		return 0;
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
	public int update_readhit(int review_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify(ReviewVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	


}
