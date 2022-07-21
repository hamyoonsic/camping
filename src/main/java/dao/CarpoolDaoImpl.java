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
	public int carpool_deletelike(CarpoolVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("carpool.carpool_deletelike",vo);
	}

	@Override
	public CarpoolVo selectOne(int carpool_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("carpool.carpool_one",carpool_idx);
	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(CarpoolVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reply(CarpoolVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int carpool_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(CarpoolVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update_step(CarpoolVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update_readhit(int carpool_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("carpool.carpool_update_readhit", carpool_idx);
	}

	@Override
	public int modify(CarpoolVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CarpoolVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("carpool.carpool_list",map);
	}

	








}
