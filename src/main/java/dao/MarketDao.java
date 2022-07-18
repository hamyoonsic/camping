package dao;

import java.util.List;

import vo.MarketVo;

public interface MarketDao {

	List<MarketVo> selectList(int m_idx);
	
	//게시글 좋아요 +1
	public int market_insertlike(MarketVo vo);
	
	//게시글 좋아요 -1
	public int market_deletelike(MarketVo vo);

}