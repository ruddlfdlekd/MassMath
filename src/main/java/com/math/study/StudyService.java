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
		 ProblemDTO problemDTO = null;
		 list = studyDAO.CheckProblem(chapter, id);
		 if(list.size()!=0){
			 for(int i=0; i<list.size(); i++){
				 problemDTO = new ProblemDTO();
				 ar.add(studyDAO.SelectProblem(list.get(i).getPnum()));
			 }
		 }
		 else{
			 ar=studyDAO.SelectConcept(chapter);
			 for(int i=0; i<ar.size(); i++){
				 problemDTO = ar.get(i);
				 studyDAO.SaveProblem(problemDTO);
			 }
		 }
		 return ar;
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
	public ProblemDTO myNoteCheck(ProblemDTO problemDTO)throws Exception{
		return studyDAO.myNoteCheck(problemDTO);
	}
	public void myNote(ProblemDTO problemDTO)throws Exception{
		studyDAO.myNote(problemDTO);
	}
	public void myNote2(ProblemDTO problemDTO)throws Exception{
		studyDAO.myNote2(problemDTO);
	}


}
