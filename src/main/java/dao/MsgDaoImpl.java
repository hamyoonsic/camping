package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.MsgVo;

public class MsgDaoImpl implements MsgDao {

	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public int insert(MsgVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("admin.msg_insert", vo);
	}
	
	@Override
	public int all_msg_insert(MsgVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("admin.all_msg_insert", vo);
	}


	@Override
	public int delete(MsgVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("admin.msg_delete", vo);
	}


	@Override
	public List<MsgVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.msg_list",map);
	}



}
