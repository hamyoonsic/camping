package dao;

import java.util.List;
import java.util.Map;

import vo.CarpoolReplyVo;

public interface CarpoolReplyDao {

	
	List<CarpoolReplyVo> selectList();
	List<CarpoolReplyVo> selectList(Map map);
	
	int 				delete(int carpool_idx);
	int					insert(CarpoolReplyVo vo);
}
