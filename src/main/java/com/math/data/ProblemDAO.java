package com.math.data;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProblemDAO {
	
	@Inject
	private SqlSession sqlSession ;
	private String namespace = "ProblemMapper.";
	
	public ProblemDTO selectOne(int pnum) throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", pnum);
	}
	

}
