package com.math.data;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.math.util.ListData;

@Repository
public class ProblemDAO {
	
	@Inject
	private SqlSession sqlSession ;
	private String namespace = "ProblemMapper.";
	
	public int updatePer(ProblemDTO problemDTO) throws Exception{
		return sqlSession.update(namespace+"updatePer", problemDTO);
	}
	
	public int delete(int pnum) throws Exception{
		return sqlSession.delete(namespace+"delete", pnum);
	}
	
	public int update(ProblemDTO problemDTO) throws Exception{
		return sqlSession.update(namespace+"update", problemDTO);
	}
	
	public int totalCount(ListData listData) throws Exception{
		return sqlSession.selectOne(namespace+"totalCount", listData);
	}
	
	public List<ProblemDTO> selectList(ListData listData) throws Exception{
		System.out.println("DAO");
		System.out.println(listData.getKind());
		System.out.println(listData.getSearch());
		return sqlSession.selectList(namespace+"selectList", listData);
	}
	
	public ProblemDTO selectOne(int pnum) throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", pnum);
	}
	
	public int insert(ProblemDTO problemDTO) throws Exception{
		return sqlSession.insert(namespace+"insert", problemDTO);
	}
	

}
