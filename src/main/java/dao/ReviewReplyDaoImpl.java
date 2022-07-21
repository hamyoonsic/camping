package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewReplyVo;

public class ReviewReplyDaoImpl implements ReviewReplyDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

	@Override
	public List<ReviewReplyVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review_reply.review_reply_list");
	}

	@Override
	public int insert(ReviewReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review_reply.review_reply_insert", vo);
	}

	@Override
	public List<ReviewReplyVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review_reply.review_reply_list_paging", map);
	}

	@Override
	public int delete(int review_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("review_reply.review_reply_delete",review_idx);
	}

}
