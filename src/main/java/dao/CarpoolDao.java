package dao;

import java.util.List;
import java.util.Map;

import vo.CarpoolVo;

public interface CarpoolDao {

	List<CarpoolVo> selectList(int m_idx);
	List<CarpoolVo> selectList(Map map);
	CarpoolVo selectOne(int carpool_idx);

	//게시글 좋아요 +1
	public int carpool_insertlike(CarpoolVo vo);
	
	//게시글 좋아요 -1
	public int carpool_deletelike(CarpoolVo vo);

	//전체게시물수
	int		selectRowTotal();
	int		selectRowTotal(Map map);
	
	int 	insert(CarpoolVo vo);//새글쓰기
	int		reply(CarpoolVo vo); //담글쓰기
	int     delete(int carpool_idx);//실제 삭제는 아니다
	
	int		update(CarpoolVo vo);
	int		update_step(CarpoolVo vo); //답글 추가시 
	int     update_readhit(int carpool_idx);//조회수 증가 
	int     modify(CarpoolVo vo);	
	
}
