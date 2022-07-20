package dao;

import java.util.List;
import java.util.Map;

import vo.ReviewVo;
import vo.ReviewVo;

public interface ReviewDao {
	
	
	List<ReviewVo> selectList(int m_idx);
	ReviewVo selectOne(int review_idx);

	//게시글 좋아요 +1
	public int review_insertlike(ReviewVo vo);
	
	//게시글 좋아요 -1
	public int review_deletelike(ReviewVo vo);

	//전체게시물수
	int		selectRowTotal();
	int		selectRowTotal(Map map);
	
	int 	insert(ReviewVo vo);//새글쓰기
	int		reply(ReviewVo vo); //담글쓰기
	int     delete(int review_idx);//실제 삭제는 아니다
	
	int		update(ReviewVo vo);
	int		update_step(ReviewVo vo); //답글 추가시 
	int     update_readhit(int review_idx);//조회수 증가 
	int     modify(ReviewVo vo);	
	
	

}
