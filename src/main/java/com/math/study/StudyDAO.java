package com.math.study;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.math.data.ProblemDTO;

@Repository
public class StudyDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="StudyMapper.";
	
	public List<ProblemDTO> SelectConcept(ProblemDTO problemDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"SelectConcept", problemDTO);
	}
	public List<ProblemDTO> SelectTest(ProblemDTO problemDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"SelectTest", problemDTO);
	}
	
	public List<ProblemDTO> CheckProblem(ProblemDTO problemDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"CheckProblem", problemDTO);
	}
	
	public ProblemDTO SelectProblem(int pnum)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"SelectProblem", pnum);
		
	}
	public ProblemDTO SelectProblemTest(int pnum)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"SelectProblemTest", pnum);
		
	}
	
	public int SaveProblem(ProblemDTO problemDTO)throws Exception{

		return sqlSession.insert(NAMESPACE+"SaveProblem", problemDTO);
	}
	
	public int SaveProblemTest(ProblemDTO problemDTO)throws Exception{

		return sqlSession.insert(NAMESPACE+"SaveProblemTest", problemDTO);
	}
	
	
	public int answerCheck(ProblemDTO problemDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"AnswerCheck",problemDTO);
	}
	
	public int UpdateCount(int pnum)throws Exception{
		return sqlSession.update(NAMESPACE+"UpdateCount", pnum);
	}
	
	public String commentary(String pnum)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"Commentary", Integer.parseInt(pnum));
	}
	
	public ProblemDTO myNoteCheck(ProblemDTO problemDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"MyNoteCheck",problemDTO);
	}
	public void myNote(ProblemDTO problemDTO)throws Exception{
		sqlSession.insert(NAMESPACE+"MyNote",problemDTO);
	}
	public ProblemDTO SelectChapter(int pnum)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"SelectChapter", pnum);
	}
	
	public void deleteProblem(ProblemDTO problemDTO)throws Exception{
		sqlSession.delete(NAMESPACE+"DeleteProblem",problemDTO);
	}
	public void right(String pnum)throws Exception{
		sqlSession.update(NAMESPACE+"Right", Integer.parseInt(pnum));
	}
	public void rateChange(ProblemDTO problemDTO)throws Exception{
		if(getRate(problemDTO)==null)
			sqlSession.insert(NAMESPACE+"insertRate",problemDTO);
		else{
			if(getRate(problemDTO).charAt(0)>problemDTO.getRate().charAt(0))
				sqlSession.update(NAMESPACE+"rateChange", problemDTO);
		}
	}
	public void rateChange2(ProblemDTO problemDTO)throws Exception{
		if(getRate(problemDTO)==null)
			sqlSession.insert(NAMESPACE+"insertRate2",problemDTO);
	}

	public void CountUp(ProblemDTO problemDTO)throws Exception{
		sqlSession.update(NAMESPACE+"CountUp",problemDTO);
	}
	public void MProblem(ProblemDTO problemDTO)throws Exception{
		sqlSession.insert(NAMESPACE+"MProblem", problemDTO);
	}
	public String getRate(ProblemDTO problemDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getRate", problemDTO);
	}
	
	public List<String> bookRate(ProblemDTO problemDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"bookRate", problemDTO);
	}
}
