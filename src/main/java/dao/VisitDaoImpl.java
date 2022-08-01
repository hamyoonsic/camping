package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.VisitVo;

public class VisitDaoImpl implements VisitDao {

	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public int insert(VisitVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("visit.visit_insert", vo);
	}


	@Override
	public int delete(VisitVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("visit.visit_delete", vo);
	}


	@Override
	public List<VisitVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("visit.visit_list");
	}

}
