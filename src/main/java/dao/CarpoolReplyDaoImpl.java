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
	public int delete(int carpool_reply_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("carpool_reply.carpool_reply_delete",carpool_reply_idx);
	}

	@Override
	public CarpoolReplyVo selectOne(int carpool_reply_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("carpool_reply.carpool_reply_one", carpool_reply_idx);
	}

	@Override
	public int update_step(CarpoolReplyVo baseVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("carpool_reply.carpool_reply_step", baseVo);
	}

	@Override
	public int reply(CarpoolReplyVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("carpool_reply.carpool_reply_re", vo);
	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("carpool_reply.carpool_reply_row_total");
	}

	@Override
	public List<CarpoolReplyVo> carpool_reply_mem_list(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("carpool_reply.carpool_reply_mem_list",map);
	}

}
