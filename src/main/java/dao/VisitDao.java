package dao;

import java.util.List;

import vo.VisitVo;

public interface VisitDao {

	 int	insert(VisitVo vo);
	 int	delete(VisitVo vo);
	 
	 List<VisitVo> selectList();
	
}
