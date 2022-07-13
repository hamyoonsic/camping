package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CarpoolVo;
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
		
		
		list = sqlSession.selectList("market.market_list_condition", map);
		
		
		return list;
	}

	@Override
	public MarketVo selectOne(int market_idx) {
		// TODO Auto-generated method stub
		 	
		MarketVo vo = null;
			
		vo = sqlSession.selectOne("market.market_one",market_idx);
		
		return vo;
	}

}
