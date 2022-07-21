package dao;

import java.util.List;
import java.util.Map;

import vo.ReviewReplyVo;

public interface ReviewReplyDao {

	
	List<ReviewReplyVo> selectList();
	List<ReviewReplyVo> selectList(Map map);
	
	int 				delete(int review_idx);
	int					insert(ReviewReplyVo vo);
}
