package com.math.file;


import java.util.List;


import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;


import com.math.file.FileDTO;
import com.math.member.MemberDTO;

@Repository
public class FileDAO {
	
	private SqlSession sqlSession;
	private final String NAMESPACE="FileMapper.";
	public FileDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int delete(int num)throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public int delete2(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"delete2", memberDTO);
	}
	
	public int deleteFnum(int fnum)throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteFnum", fnum);
	}
	
	public int insert(FileDTO fileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", fileDTO);
	}
	
	public int insert2(FileDTO fileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insert2", fileDTO);
	}
	
	public List<FileDTO> selectList(int num)throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", num);
	}
	
	public FileDTO selectOne(int num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	public int update(FileDTO fileDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"update", fileDTO);
	}

}
