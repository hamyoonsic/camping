package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CarpoolReplyVo;

public class CarpoolReplyDaoImpl implements CarpoolReplyDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	@Override
	public List<CarpoolReplyVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("carpool_reply.carpool_reply_list");
	}

	@Override
	public int insert(CarpoolReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("carpool_reply.carpool_reply_insert", vo);
	}

	@Override
	public List<CarpoolReplyVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("carpool_reply.carpool_reply_list_paging", map);
	}

	@Override
	public int delete(int carpool_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("carpool_reply.carpool_reply_delete",carpool_idx);
	}

}
