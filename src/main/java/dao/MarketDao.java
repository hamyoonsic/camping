package dao;

import java.util.List;
import java.util.Map;

import vo.CarpoolVo;
import vo.MarketVo;

public interface MarketDao {

	List<MarketVo> selectList(int m_idx);
	MarketVo selectOne(int market_idx);
	
	//게시글 좋아요 +1
	public int market_insertlike(MarketVo vo);
	
	//게시글 좋아요 -1
	public int market_deletelike(MarketVo vo);

	//전체게시물수
	int		selectRowTotal();
	int		selectRowTotal(Map map);
	
	int 	insert(MarketVo vo);//새글쓰기
	int		reply(MarketVo vo); //담글쓰기
	int     delete(int market_idx);//실제 삭제는 아니다
	
	int		update(MarketVo vo);
	int		update_step(MarketVo vo); //답글 추가시 
	int     update_readhit(int market_idx);//조회수 증가 
	int     modify(MarketVo vo);	

}