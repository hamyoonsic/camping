package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CarpoolVo;
import vo.Carpool_likeVo;

public class CarpoolDaoImpl implements CarpoolDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CarpoolVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("carpool.carpool_list");
	}

	@Override
	public int carpool_insertlike(int carpool_idx) {
		// TODO Auto-generated method stub
		return sqlSession.insert("carpool.carpool_insertlike");
	}

	@Override
	public int carpool_deletelike(int carpool_idx) {
		// TODO Auto-generated method stub
		return 0;
	}








}
