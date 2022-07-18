package dao;

import java.util.List;

import vo.CarpoolVo;

public interface CarpoolDao {

	List<CarpoolVo> selectList(int m_idx);

	//게시글 좋아요 +1
	public int carpool_insertlike(CarpoolVo vo);
	
	//게시글 좋아요 -1
	public int carpool_deletelike(int carpool_idx);

		
	
}
