package dao;

import java.util.List;
import java.util.Map;

import vo.CarpoolVo;

public interface CarpoolDao {

	List<CarpoolVo> selectList();
	List<CarpoolVo> selectList(String search_text);
	List<CarpoolVo> selectList(Map map);

	int			  selectRowTotal();
	int			  selectRowTotal(Map map); 


}