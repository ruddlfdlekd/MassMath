package com.math.study;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.math.problem.ProblemDTO;

@Repository
public class StudyDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="StudyMapper.";
	
	public List<ProblemDTO> SelectConcept(String chapter)throws Exception{
		ProblemDTO problemDTO= new ProblemDTO();
		problemDTO.setBook(Integer.parseInt(chapter.charAt(0)+""));
		problemDTO.setChapter(Integer.parseInt(chapter.charAt(1)+""));
		problemDTO.setChapter_m(Integer.parseInt(chapter.charAt(2)+""));
		problemDTO.setChapter_s(Integer.parseInt(chapter.charAt(3)+""));
		problemDTO.setRate(1);
		
		return sqlSession.selectList(NAMESPACE+"SelectConcept", problemDTO);
	}
	
	public List<ProblemDTO> CheckProblem(String chapter,String id)throws Exception{
		ProblemDTO problemDTO= new ProblemDTO();
		problemDTO.setBook(Integer.parseInt(chapter.charAt(0)+""));
		problemDTO.setChapter(Integer.parseInt(chapter.charAt(1)+""));
		problemDTO.setChapter_m(Integer.parseInt(chapter.charAt(2)+""));
		problemDTO.setChapter_s(Integer.parseInt(chapter.charAt(3)+""));
		problemDTO.setRate(1);
		HashMap<String, Object> map =  new HashMap<>();
		 map.put("problem", problemDTO);
		 map.put("id", id);
		
		return sqlSession.selectList(NAMESPACE+"CheckProblem", map);
	}
	
	public ProblemDTO SelectProblem(int pnum)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"SelectProblem", pnum);
		
	}
	
	public int SaveProblem(ProblemDTO problemDTO)throws Exception{

		return sqlSession.insert(NAMESPACE+"SaveProblem", problemDTO);
	}
	
	
	
	public int answerCheck(ProblemDTO problemDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"answerCheck",problemDTO);
	}
	
	public int UpdateCount(int pnum)throws Exception{
		return sqlSession.update(NAMESPACE+"UpdateCount", pnum);
	}
	
	
}
