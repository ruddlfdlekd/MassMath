package com.math.study;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.math.data.ProblemDTO;

@Service
public class StudyService {

	
	 @Autowired
	StudyDAO studyDAO;
	 
	 public List<ProblemDTO> CheckProblem(ProblemDTO problemDTO)throws Exception{
		 List<ProblemDTO> ar = new ArrayList<>();
		 List<ProblemDTO> list = null;
		 ProblemDTO problemDTO2 = null;
		 list = studyDAO.CheckProblem(problemDTO);
		 if(problemDTO.getTest()==1){
			 if(list.size()!=0){
				 ar= list;
			 }
			 else{
				 ar=studyDAO.SelectTest(problemDTO);
				 for(int i=0; i<ar.size(); i++){
					 problemDTO2 = ar.get(i);
					 problemDTO2.setTest(1);
					 problemDTO2.setId(problemDTO.getId());
					 problemDTO2.setRate(problemDTO.getRate());
					 studyDAO.SaveProblemTest(problemDTO2);
					 studyDAO.CountUp(problemDTO2);
					 studyDAO.MProblem(problemDTO2);
				 }
			 }
		 }
		 else{
			 if(list.size()!=0){
				 ar= list;
				 /*for(int i=0; i<list.size(); i++){
					 ar.add(studyDAO.SelectProblem(list.get(i).getPnum()));
				 }*/
			 }
			 else{
				 ar=studyDAO.SelectConcept(problemDTO);
				 for(int i=0; i<ar.size(); i++){
					 problemDTO2 = ar.get(i);
					 problemDTO2.setTest(2);
					 problemDTO2.setId(problemDTO.getId());
					 problemDTO2.setRate(problemDTO.getRate());
					 studyDAO.SaveProblem(problemDTO2);
					 studyDAO.CountUp(problemDTO2);
					 studyDAO.MProblem(problemDTO2);
				 }
			 }
			
		 }
		 return ar;
		}

	 public void rateChange(ProblemDTO problemDTO)throws Exception{
			studyDAO.rateChange(problemDTO);
		}
	 public void rateChange2(ProblemDTO problemDTO)throws Exception{
			studyDAO.rateChange2(problemDTO);
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
			studyDAO.myNote(problemDTO);
		}
	}	 
	public void deleteProblem(ProblemDTO problemDTO)throws Exception{
		studyDAO.deleteProblem(problemDTO);
	}
	public void right(String pnum)throws Exception{
		studyDAO.right(pnum);
	}
	public String getRate(ProblemDTO problemDTO)throws Exception{
		return studyDAO.getRate(problemDTO);
	}
	
	public List<String> bookRate(ProblemDTO problemDTO)throws Exception{
		return studyDAO.bookRate(problemDTO);
	}
	
}
