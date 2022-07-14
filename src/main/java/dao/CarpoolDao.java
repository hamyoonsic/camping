package dao;

import java.util.List;

import vo.CarpoolVo;

public interface CarpoolDao {

	List<CarpoolVo> selectList();

	//게시글 좋아요 +1
	public int carpool_insertlike(int carpool_idx);
	
	//게시글 좋아요 -1
	public int carpool_deletelike(int carpool_idx);	
	
}
