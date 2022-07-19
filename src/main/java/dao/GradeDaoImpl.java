package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GradeVo;

public class GradeDaoImpl implements GradeDao {

	SqlSession sqlSession;
	
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}




	@Override
	public List<GradeVo> selectList() {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public GradeVo selectOne(int grade_idx) {
		// TODO Auto-generated method stub
		return null;
	}



}
