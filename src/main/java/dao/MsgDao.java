package dao;

import java.util.List;
import java.util.Map;

import vo.MsgVo;

public interface MsgDao {

	 int	insert(MsgVo vo);
	 int	all_msg_insert(MsgVo vo);
	 int	delete(MsgVo vo);
	 
	 List<MsgVo> selectList(Map map);
	
}
