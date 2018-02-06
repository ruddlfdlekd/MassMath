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
	 
	 public List<ProblemDTO> CheckProblem(String chapter,String id)throws Exception{
		 List<ProblemDTO> ar = new ArrayList<>();
		 List<ProblemDTO> list = null;
		 list = studyDAO.CheckProblem(chapter, id);
		 if(list.size()!=0){
			 for(int i=0; i<list.size(); i++){
				 ProblemDTO problemDTO = new ProblemDTO();
				 ar.add(studyDAO.SelectProblem(list.get(i).getPnum()));
			 }
		 }
		 else{
			 ar=studyDAO.SelectConcept(chapter);
		 }
		 return ar;
		}
	 
	
	public int UpdateCount(int pnum)throws Exception{
		return studyDAO.UpdateCount(pnum);
	}
	


}
