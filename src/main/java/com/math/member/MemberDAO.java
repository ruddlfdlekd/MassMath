package com.math.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.math.member.MemberDTO;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	private String NAMESPACE = "MemberMapper.";

	//Join
	public int memberJoin(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
	
	//kakao Login
	public int memberJoin2(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin2", memberDTO);
	}

	//IdCheck
	public MemberDTO memberIdCheck(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", id);
	}

	//FindPW
	public MemberDTO findPw(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"findPw", id);
	}
	
	//Login
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}

	//Login
	public MemberDTO memberLogin2(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberLogin2", memberDTO);
	}

	//MyPage
	public MemberDTO memberMyPage(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberMyPage", id);
	}
	
	//Update
	public int memberUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
	}

	//Delete
	public int memberDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"memberDelete", memberDTO);
	}
	
	public List<String> getRateList(String id)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getRateList", id);
	}
}
