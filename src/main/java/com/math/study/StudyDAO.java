package com.math.study;

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
}
