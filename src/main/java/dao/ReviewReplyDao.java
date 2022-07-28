package dao;

import java.util.List;
import java.util.Map;

import vo.ReviewReplyVo;

public interface ReviewReplyDao {

	
	List<ReviewReplyVo> selectList();
	List<ReviewReplyVo> selectList(Map map);
	
	ReviewReplyVo 		selectOne(int review_reply_idx);
	
	int 				delete(int review_idx);
	int					insert(ReviewReplyVo vo);
	int 				update_step(ReviewReplyVo baseVo);
	int 				reply(ReviewReplyVo vo);
	
	
	//전체 댓글 수 구하기
	int 				selectRowTotal();
	
	
	
	
	
}
