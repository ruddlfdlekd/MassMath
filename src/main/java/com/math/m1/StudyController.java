package com.math.m1;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView study1(String chapter)throws Exception{
		chapter +="1";
		System.out.println(chapter);
		List<ProblemDTO> ar = new ArrayList<>();
		ar = studyService.SelectConcept(chapter);
		System.out.println(ar.size());
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		return mv;
	}
	@RequestMapping(value="study2")
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
	}
}
