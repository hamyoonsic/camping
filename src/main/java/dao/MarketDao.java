package dao;

import java.util.List;
import java.util.Map;

import vo.MarketVo;

public interface MarketDao {

	List<MarketVo> selectList();
	List<MarketVo> selectList(int m_idx);
	List<MarketVo> selectList(String search_text);
	List<MarketVo> selectConditionList(Map map);

	int			  selectRowTotal();
	int			  selectRowTotal(Map map); 

	
	MarketVo selectOne(int market_idx);
	
	//게시글 좋아요 +1
	   public int market_insertlike(MarketVo vo);
	   
	   //게시글 좋아요 -1
	   public int market_deletelike(MarketVo vo);

	 
	   int    insert(MarketVo vo);//새글쓰기
	   int      reply(MarketVo vo); //담글쓰기
	   int     delete(int market_idx);//실제 삭제는 아니다
	   
	   int      update(MarketVo vo);
	   int      update_step(MarketVo vo); //답글 추가시 
	   int     update_readhit(int market_idx);//조회수 증가 
	   int     modify(MarketVo vo);   
	   
	   //미영코드
	    //mem_idx에 해당하는 market리스트 가져오기 
	      List<MarketVo> market_mem_list(int mem_idx);

}