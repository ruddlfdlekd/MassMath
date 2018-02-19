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
	
	
	
	
	@RequestMapping(value="AnswerCheck", method=RequestMethod.POST)
	public ModelAndView study1(String[] pnum,String[] answer,String ma)throws Exception{
		ModelAndView mv = new ModelAndView();
		String[] check = new String[10];
		String[] commentary = new String[10];
		String[] my_answer = new String[10];
		for(int i=0; i<10; i++){
			if(answer[i].equals(ma.charAt(i)+"")){
				check[i]="O";
				studyService.right(pnum[i]);
			}
			else{
				check[i]="X";
				commentary[i]=studyService.commentary(pnum[i]);
			} 
			my_answer[i] = ma.charAt(i)+"";
		}
		mv.addObject("check", check);
		mv.addObject("c", commentary);
		mv.addObject("pnum", pnum);
		mv.addObject("answer", answer);
		mv.addObject("my_answer", my_answer);
		mv.setViewName("./study/AnswerCheck");
		return mv;
	}
	
	
	/*@RequestMapping(value="study2")
	public ModelAndView study2(String chapter)throws Exception{
		chapter +="2";
		System.out.println(chapter);
		List<ProblemDTO> ar = new .ArrayList<>();
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
	
	
	@RequestMapping(value="my_answer")
	public void answerCheck(ProblemDTO problemDTO)throws Exception{
		problemDTO.setId("iu");
		studyService.answerCheck(problemDTO);
	}
	
	
	@RequestMapping(value="myNote", method=RequestMethod.POST)
	public void myNote(String[] a)throws Exception{
		ArrayList<ProblemDTO> ar = new ArrayList<>();
		for(int i =0; i<a.length; i+=3){
		ProblemDTO problemDTO = new ProblemDTO();
		problemDTO.setId("iu");
		problemDTO.setReason(a[i]);
		problemDTO.setMy_answer(Integer.parseInt(a[i+1]));
		problemDTO.setPnum(Integer.parseInt(a[i+2]));
		ar.add(problemDTO);
		}
		studyService.myNote(ar);
}
}
