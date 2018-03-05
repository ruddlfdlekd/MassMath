package com.math.study;


import java.util.HashMap;
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
	
	public List<ProblemDTO> SelectConcept(String chapter,String rate,String id)throws Exception{
		ProblemDTO problemDTO= new ProblemDTO();
		problemDTO.setId(id);
		problemDTO.setBook(chapter.charAt(0)+"");
		problemDTO.setChapter(chapter.charAt(1)+"");
		problemDTO.setChapter_m(chapter.charAt(2)+"");
		problemDTO.setChapter_s(chapter.charAt(3)+"");
		problemDTO.setType(chapter.charAt(4)+"");
		problemDTO.setRate(rate);
		return sqlSession.selectList(NAMESPACE+"SelectConcept", problemDTO);
	}
	public List<ProblemDTO> SelectTest(String chapter,String rate,String id)throws Exception{
		ProblemDTO problemDTO= new ProblemDTO();
		problemDTO.setId(id);
		problemDTO.setBook(Integer.parseInt(chapter.charAt(0)+"")+"");
		problemDTO.setChapter(Integer.parseInt(chapter.charAt(1)+"")+"");
		problemDTO.setTest(Integer.parseInt(chapter.charAt(5)+""));
		problemDTO.setRate(rate);
		return sqlSession.selectList(NAMESPACE+"SelectTest", problemDTO);
	}
	
	public List<ProblemDTO> CheckProblem(String chapter,String id)throws Exception{
		ProblemDTO problemDTO= new ProblemDTO();
		problemDTO.setBook(chapter.charAt(0)+"");
		problemDTO.setChapter(chapter.charAt(1)+"");
		problemDTO.setChapter_m(chapter.charAt(2)+"");
		problemDTO.setChapter_s(chapter.charAt(3)+"");
		problemDTO.setType(chapter.charAt(4)+"");
		problemDTO.setTest(Integer.parseInt(chapter.charAt(5)+""));
		HashMap<String, Object> map =  new HashMap<>();
		 map.put("problem", problemDTO);
		 map.put("id", id);
		
		return sqlSession.selectList(NAMESPACE+"CheckProblem", map);
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
	public void myNote2(ProblemDTO problemDTO)throws Exception{
		sqlSession.update(NAMESPACE+"MyNote2",problemDTO);
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
	public String rateUp(String rate)throws Exception{
		if(rate!="A")
		rate = ((char)(rate.charAt(0)-1))+"";
		sqlSession.update(NAMESPACE+"rateUp", rate);
		return rate;
	}
	public String rateDown(String rate)throws Exception{
		if(rate!="E")
		rate = ((char)(rate.charAt(0)+1))+"";
		sqlSession.update(NAMESPACE+"rateDown", rate);
		return rate;
	}
	public void CountUp(ProblemDTO problemDTO)throws Exception{
		sqlSession.update(NAMESPACE+"CountUp",problemDTO);
	}
	public void MProblem(ProblemDTO problemDTO)throws Exception{
		sqlSession.insert(NAMESPACE+"MProblem", problemDTO);
	}
}
