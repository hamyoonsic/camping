package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CarpoolVo;

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
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("carpool.carpool_row_total");
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("carpool.carpool_condition_row_total",map);
	}

	@Override
	public List<CarpoolVo> selectList(Map map) {
		// TODO Auto-generated method stub
		List<CarpoolVo> list = null;
		
		//2.½ÇÇà
		list = sqlSession.selectList("carpool.carpool_condition_list", map);
		
		
		return list;

	}

	@Override
	public List<CarpoolVo> selectList(String search_text) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("carpool.carpool_condition_total",search_text);
	}


}