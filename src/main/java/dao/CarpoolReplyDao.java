package dao;

import java.util.List;
import java.util.Map;

import vo.CarpoolReplyVo;
import vo.MarketReplyVo;

public interface CarpoolReplyDao {

	
	List<CarpoolReplyVo> selectList();
	List<CarpoolReplyVo> selectList(Map map);
	
	CarpoolReplyVo 		selectOne(int carpool_reply_idx);
	
	int 				delete(int carpool_idx);
	int					insert(CarpoolReplyVo vo);
	int 				update_step(CarpoolReplyVo baseVo);
	int 				reply(CarpoolReplyVo vo);
	
	int 				selectRowTotal();
	
   //게시글 좋아요 +1
   public int carpool_reply_insertlike(CarpoolReplyVo vo);
   
   //게시글 좋아요 -1
   public int carpool_reply_deletelike(CarpoolReplyVo vo);
}
