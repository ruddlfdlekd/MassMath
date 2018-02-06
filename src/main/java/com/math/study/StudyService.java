package com.math.study;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.math.problem.ProblemDTO;

@Service
public class StudyService {

	
	 @Autowired
	StudyDAO studyDAO;

	public List<ProblemDTO> SelectConcept(String chapter)throws Exception{
		return studyDAO.SelectConcept(chapter);
	}


}
