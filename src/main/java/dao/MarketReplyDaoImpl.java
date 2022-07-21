package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.MarketReplyVo;
import vo.ReviewReplyVo;

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
	public int delete(int market_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("market_reply.market_reply_delete",market_idx);
	}

}
