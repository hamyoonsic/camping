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
	public int delete(int review_reply_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("review_reply.review_reply_delete",review_reply_idx);
	}

	@Override
	public ReviewReplyVo selectOne(int review_reply_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review_reply.review_reply_one", review_reply_idx);
	}

	@Override
	public int update_step(ReviewReplyVo baseVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("review_reply.review_reply_step", baseVo);
	}

	@Override
	public int reply(ReviewReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review_reply.review_reply_re", vo);
	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review_reply.review_reply_row_total");
	}

	@Override
	public int review_reply_insertlike(ReviewReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review_reply.review_reply_insertlike",vo);
	}

	@Override
	public int review_reply_deletelike(ReviewReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("review_reply.review_reply_deletelike",vo);
	}

}
