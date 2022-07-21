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
	public List<MarketVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("market.market_list",m_idx);
	}
	
	@Override
	public List<MarketVo> selectConditionList(Map map) {
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
	      public int update_readhit(int market_idx) {
	         // TODO Auto-generated method stub
	         return sqlSession.update("market.market_update_readhit", market_idx);
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
		public int modify(MarketVo vo) {
			// TODO Auto-generated method stub
			return 0;
		}

}