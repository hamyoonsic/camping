package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDaoImpl implements MemberDao {


	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
	@Override
	public List<MemberVo> selectList() {
		// TODO Auto-generated method stub
		
		List<MemberVo> list = null;
		
		list = sqlSession.selectList("member.member_list_adm");
		
		
		return list;
	}



	@Override
	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.member_insert",vo);
	}



	@Override
	public int delete(int mem_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.member_delete",mem_idx);
	}



	@Override
	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.member_update", vo);
	}


	
	@Override
	public MemberVo selectOne(int mem_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_mem_idx", mem_idx);
	}



	@Override
	public MemberVo selectOne(String mem_email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_mem_email",mem_email);
	}



	@Override
	public MemberVo selectOne1(String mem_nickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_one_mem_nickname",mem_nickname);
	}

}
