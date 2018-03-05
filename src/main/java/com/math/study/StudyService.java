package com.math.study;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.math.problem.ProblemDTO;

@Service
public class StudyService {

	
	 @Autowired
	StudyDAO studyDAO;
	 
	 public List<ProblemDTO> CheckProblem(String chapter,String id,String rate)throws Exception{
		 List<ProblemDTO> ar = new ArrayList<>();
		 List<ProblemDTO> list = null;
		 ProblemDTO problemDTO = null;
		 list = studyDAO.CheckProblem(chapter, id);
		 if(chapter.charAt(5)=='1'){
			 if(list.size()!=0){
				 for(int i=0; i<list.size(); i++){
				 ar.add(studyDAO.SelectProblemTest(list.get(i).getPnum()));
				 }
			 }
			 else{
				 ar=studyDAO.SelectTest(chapter,rate,id);
				 for(int i=0; i<ar.size(); i++){
					 problemDTO = ar.get(i);
					 problemDTO.setTest(1);
					 problemDTO.setId(id);
					 studyDAO.SaveProblemTest(problemDTO);
					 studyDAO.CountUp(problemDTO);
					 studyDAO.MProblem(problemDTO);
				 }
			 }
		 }
		 else{
			 if(list.size()!=0){
				 for(int i=0; i<list.size(); i++){
					 ar.add(studyDAO.SelectProblem(list.get(i).getPnum()));
				 }
			 }
			 else{
				 ar=studyDAO.SelectConcept(chapter,rate,id);
				 for(int i=0; i<ar.size(); i++){
					 problemDTO = ar.get(i);
					 problemDTO.setTest(2);
					 problemDTO.setId(id);
					 studyDAO.SaveProblem(problemDTO);
					 studyDAO.CountUp(problemDTO);
					 studyDAO.MProblem(problemDTO);
				 }
			 }
			
		 }
		 return ar;
		}
	 public String rateUp(String rate)throws Exception{
			rate = studyDAO.rateUp(rate);
			return rate;
		}
		public String rateDown(String rate)throws Exception{
			rate = studyDAO.rateDown(rate);
			return rate;
		}
	 
	
	public int UpdateCount(int pnum)throws Exception{
		return studyDAO.UpdateCount(pnum);
	}
	
	public int answerCheck(ProblemDTO problemDTO)throws Exception{
		return studyDAO.answerCheck(problemDTO);
	}
	
	public String commentary(String pnum)throws Exception{
		return studyDAO.commentary(pnum);
	}
	
	public void myNote(List<ProblemDTO> ar)throws Exception{
		for(int i=0; i<ar.size(); i++){
		ProblemDTO problemDTO =ar.get(i);	
		ProblemDTO problemDTO2=studyDAO.myNoteCheck(problemDTO);
		if(problemDTO2 == null)
			studyDAO.myNote(problemDTO);
		else
			studyDAO.myNote2(problemDTO);
		
		}
		ProblemDTO problemDTO3 = studyDAO.SelectChapter(ar.get(0).getPnum());
		problemDTO3.setId("iu");
		studyDAO.deleteProblem(problemDTO3);
		
	}	 
	public void right(String pnum)throws Exception{
		studyDAO.right(pnum);
	}
}
