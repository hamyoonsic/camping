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
}
