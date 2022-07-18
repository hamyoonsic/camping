package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CarpoolVo;

public class CarpoolDaoImpl implements CarpoolDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CarpoolVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("carpool.carpool_list",m_idx);
	}
	

	@Override
	public int carpool_insertlike(CarpoolVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("carpool.carpool_insertlike",vo);
	}

	@Override
	public int carpool_deletelike(int carpool_idx) {
		// TODO Auto-generated method stub
		return sqlSession.insert("carpool.carpool_deletelike",carpool_idx);
	}

	








}
