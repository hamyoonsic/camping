package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MarketVo;

public class MarketDaoImpl implements MarketDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MarketVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("market.market_list",m_idx);
	}
	
	@Override
	public int market_insertlike(MarketVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("market.market_insertlike",vo);
	}

	@Override
	public int market_deletelike(MarketVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("market.market_deletelike",vo);
	}


}