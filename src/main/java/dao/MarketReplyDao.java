package dao;

import java.util.List;
import java.util.Map;

import vo.MarketReplyVo;

public interface MarketReplyDao {

	
	List<MarketReplyVo> selectList();
	List<MarketReplyVo> selectList(Map map);
	
	int 				delete(int market_idx);
	int					insert(MarketReplyVo vo);
}
