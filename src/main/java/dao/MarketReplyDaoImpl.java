package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.MarketReplyVo;

public class MarketReplyDaoImpl implements MarketReplyDao {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	@Override
	public List<MarketReplyVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("market_reply.market_reply_list");
	}

	@Override
	public int insert(MarketReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("market_reply.market_reply_insert", vo);
	}

	@Override
	public List<MarketReplyVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("market_reply.market_reply_list_paging", map);
	}

	@Override
	public int delete(int market_reply_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("market_reply.market_reply_delete",market_reply_idx);
	}

	@Override
	public MarketReplyVo selectOne(int market_reply_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market_reply.market_reply_one", market_reply_idx);
	}

	@Override
	public int update_step(MarketReplyVo baseVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("market_reply.market_reply_step", baseVo);
	}

	@Override
	public int reply(MarketReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("market_reply.market_reply_re", vo);
	}
	
	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market_reply.market_reply_row_total");
	}

	@Override
	public int market_reply_insertlike(MarketReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("market_reply.market_reply_insertlike",vo);
	}

	@Override
	public int market_reply_deletelike(MarketReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("market_reply.market_reply_deletelike",vo);
	}

}
