package dao;

import java.util.List;
import java.util.Map;

import vo.MarketVo;

public interface MarketDao {

	List<MarketVo> selectList();
	List<MarketVo> selectList(String search_text);
	List<MarketVo> selectList(Map map);

	int			  selectRowTotal();
	int			  selectRowTotal(Map map); 


}