package dao;

import java.util.List;

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

}
