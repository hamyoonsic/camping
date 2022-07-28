package dao;

import java.util.List;
import java.util.Map;

import vo.CarpoolReplyVo;
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
	
   //게시글 좋아요 +1
   public int market_reply_insertlike(MarketReplyVo vo);
   
   //게시글 좋아요 -1
   public int market_reply_deletelike(MarketReplyVo vo);
}
