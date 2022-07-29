package dao;

import java.util.List;
import java.util.Map;

import vo.ReviewVo;

public interface ReviewDao {
	
	
	public List<ReviewVo> selectList();
	public List<ReviewVo> selectList(int m_idx);
	public List<ReviewVo> selectList(String search_text);

	public List<ReviewVo> selectConditionList(Map map);

	// idx에 해당되는 객체 1건 구하기
	public ReviewVo selectOne(int review_idx);

	
	int			  selectRowTotal();
	int			  selectRowTotal(Map map); 

 //게시글 좋아요 +1
   public int review_insertlike(ReviewVo vo);
   
   //게시글 좋아요 -1
   public int review_deletelike(ReviewVo vo);


   int    insert(ReviewVo vo);//새글쓰기
   int      reply(ReviewVo vo); //담글쓰기
   int     delete(int review_idx);//실제 삭제는 아니다
   
   int      update(ReviewVo vo);
   int      update_step(ReviewVo vo); //답글 추가시 
   int     update_readhit(int review_idx);//조회수 증가 
   int     modify(ReviewVo vo);   
	   
   //미영
   //mem_idx에 해당하는 review리스트 가져오기 
   
   List<ReviewVo> review_mem_list(Map map);
	
 //mem_idx에 해당하는 carpool 게시글 좋아요한 리스트 
   List<ReviewVo> review_like_mem_list(Map map);

}
