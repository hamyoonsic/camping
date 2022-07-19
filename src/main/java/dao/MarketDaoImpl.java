package dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public MarketVo selectOne(int market_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market.market_one",market_idx);
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
	public int insert(MarketVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reply(MarketVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int market_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MarketVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update_step(MarketVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update_readhit(int market_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("market.market_update_readhit", market_idx);
	}

	@Override
	public int modify(MarketVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}


}