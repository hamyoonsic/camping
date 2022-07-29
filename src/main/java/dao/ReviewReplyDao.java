package dao;

import java.util.List;
import java.util.Map;

import vo.CarpoolReplyVo;
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
	

	//미영
	//mem_idx에 해하는 review_replu 리스트 가져오기 
	
	List<ReviewReplyVo> review_reply_mem_list(Map map); 
	

   //게시글 좋아요 +1
   public int review_reply_insertlike(ReviewReplyVo vo);
   
   //게시글 좋아요 -1
   public int review_reply_deletelike(ReviewReplyVo vo);


	
	
}
