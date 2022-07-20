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
	public List<MarketVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("market.market_list");
	}
	
	@Override
	public List<MarketVo> selectList(Map map) {
		// TODO Auto-generated method stub
		
		List<MarketVo> list = null;
		
		//2.½ÇÇà
		list = sqlSession.selectList("market.market_condition_list", map);
		
		
		return list;
		
	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market.market_row_total");
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("market.market_condition_row_total",map);
	}

	@Override
	public List<MarketVo> selectList(String search_text) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("market.market_condition_total",search_text);
	}



}