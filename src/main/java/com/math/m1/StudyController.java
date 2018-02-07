package com.math.m1;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.math.problem.ProblemDTO;
import com.math.study.StudyService;

@Controller
@RequestMapping(value="study/**")
public class StudyController {
	
	 @Autowired
	StudyService studyService;		
	
	
	@RequestMapping(value ="studyPage")
	public void Page() {
	
	}
	@RequestMapping(value="studyView")
	public ModelAndView View(int chapter){
		ModelAndView mv = new ModelAndView();
		mv.addObject("chapter", chapter);
		return mv;
	}
	
	
	@RequestMapping(value="study1")
	public ModelAndView study1(String chapter,String id)throws Exception{
		
		chapter +="1";
		System.out.println(chapter);
		id="iu";
		List<ProblemDTO> ar = null;
		ar = studyService.CheckProblem(chapter, id);
	/*	if(ar!=null){
			for(int i=0; i<ar.size(); i++)
			studyService.UpdateCount(ar.get(i).getPnum());
		}*/
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		return mv;
	}
	
	
	
	@RequestMapping(value="study1",method=RequestMethod.POST)
	public void study1(ProblemDTO problemDTO)throws Exception{
		System.out.println(problemDTO.getPnum());
		System.out.println("asdf");
	}
	
	/*@RequestMapping(value="study2")
	public ModelAndView study2(String chapter)throws Exception{
		chapter +="2";
		System.out.println(chapter);
		List<ProblemDTO> ar = new ArrayList<>();
		ar = studyService.SelectConcept(chapter);
		System.out.println("asdf");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("chapter", chapter);
		return mv;
	}
	@RequestMapping(value="study3")
	public ModelAndView study3(String chapter)throws Exception{
		chapter +="3";
		System.out.println(chapter);
		List<ProblemDTO> ar = new ArrayList<>();
		ar = studyService.SelectConcept(chapter);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("chapter", chapter);
		return mv;
	}*/
	
	
	@RequestMapping(value="answerCheck")
	public void answerCheck(ProblemDTO problemDTO)throws Exception{
		problemDTO.setId("iu");
		studyService.answerCheck(problemDTO);
	}
	
	
}
