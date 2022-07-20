package dao;

import java.util.List;

import vo.GradeVo;

public interface GradeDao {
	
	List<GradeVo> selectList();
	
	GradeVo selectOne(int grade_idx);
	

}
