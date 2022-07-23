package dao;

import java.util.List;
import java.util.Map;

import vo.MarketReplyVo;
import vo.ReviewReplyVo;

public interface MarketReplyDao {

	
	List<MarketReplyVo> selectList();
	List<MarketReplyVo> selectList(Map map);
	
	MarketReplyVo 		selectOne(int market_reply_idx);
	
	int 				delete(int market_idx);
	int					insert(MarketReplyVo vo);
	int 				update_step(MarketReplyVo baseVo);
	int 				reply(MarketReplyVo vo);
	
	int 				selectRowTotal();
}
