package dao;

import java.util.List;
import java.util.Map;

import vo.CarpoolVo;

public interface CarpoolDao {

	List<CarpoolVo> selectList();
	List<CarpoolVo> selectList(int m_idx);
	List<CarpoolVo> selectList(String search_text);
	List<CarpoolVo> selectConditionList(Map map);

	int			  selectRowTotal();
	int			  selectRowTotal(Map map); 


	

	   List<CarpoolVo> selectList(Map map);
	   CarpoolVo selectOne(int carpool_idx);

	   //게시글 좋아요 +1
	   public int carpool_insertlike(CarpoolVo vo);
	   
	   //게시글 좋아요 -1
	   public int carpool_deletelike(CarpoolVo vo);

	   
	   int    insert(CarpoolVo vo);//새글쓰기
	   int      reply(CarpoolVo vo); //담글쓰기
	   int     delete(int carpool_idx);//실제 삭제는 아니다
	   
	   int      update(CarpoolVo vo);
	   int      update_step(CarpoolVo vo); //답글 추가시 
	   int     update_readhit(int carpool_idx);//조회수 증가 
	   int     modify(CarpoolVo vo);   
	   
	   //미영코드
	   //mem_idx에 해당하는 carpool리스트 가져오기 
	   List<CarpoolVo> carpool_mem_list(int mem_idx);
	      
	   
	   
}