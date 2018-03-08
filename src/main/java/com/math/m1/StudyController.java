package com.math.m1;
import java.util.ArrayList;
import java.util.List;
import com.math.member.MemberDTO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.math.data.ProblemDTO;
import com.math.study.StudyService;

@Controller
@RequestMapping(value="study/**")
public class StudyController {
	
	 @Autowired
	StudyService studyService;		
	
	@RequestMapping(value = "studyLevel")
	public void Level(String chapter,String id){
	}
	
	@RequestMapping(value="studyView")
	public ModelAndView View(String chapter,HttpSession session)throws Exception{
		ProblemDTO problemDTO = new ProblemDTO();
		problemDTO.setId(((MemberDTO)session.getAttribute("member")).getId());
		problemDTO.setBook(chapter.charAt(0)+"");
		problemDTO.setChapter(chapter.charAt(1)+"");
		String rate = studyService.getRate(problemDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("chapter", chapter);
		mv.addObject("rate", rate);
		return mv;
	}
	@RequestMapping(value="studyConcept")
	public String studyConcept(String chapter){
		String move = "study/study"+chapter;
		return move;
	}
	
	@RequestMapping(value="studyCustom")
	public ModelAndView studyCustom(String chapter,HttpSession session)throws Exception{
		ProblemDTO problemDTO = new ProblemDTO();
		problemDTO.setBook(chapter.charAt(0)+"");
		problemDTO.setChapter(chapter.charAt(1)+"");
		problemDTO.setChapter_m(chapter.charAt(2)+"");
		problemDTO.setChapter_s("1");
		problemDTO.setType(chapter.charAt(4)+"");
		problemDTO.setTest(2);
		problemDTO.setId(((MemberDTO) session.getAttribute("member")).getId());
		problemDTO.setRate(studyService.getRate(problemDTO));
		
		List<ProblemDTO> ar = null;
		ar = studyService.CheckProblem(problemDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		return mv;
	}
	
	@RequestMapping(value="studyTest")
	public ModelAndView studyTest(String chapter,String rate,HttpSession session)throws Exception{
		ProblemDTO problemDTO = new ProblemDTO();
		problemDTO.setBook(chapter.charAt(0)+"");
		problemDTO.setChapter(chapter.charAt(1)+"");
		problemDTO.setChapter_m("0");
		problemDTO.setChapter_s("0");
		problemDTO.setType("0");
		problemDTO.setTest(1);
		problemDTO.setRate(rate);
		problemDTO.setId(((MemberDTO) session.getAttribute("member")).getId());
		List<ProblemDTO> ar = null;
		ar = studyService.CheckProblem(problemDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		mv.addObject("rate", rate);
		mv.addObject("chapter",chapter);
		return mv;
		
	}
	
	
	@RequestMapping(value="studyMain")
	public ModelAndView studyMain(String chapter,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		ProblemDTO problemDTO = new ProblemDTO();
		problemDTO.setId(((MemberDTO) session.getAttribute("member")).getId());
		problemDTO.setBook(chapter);
		List<String> ar = studyService.bookRate(problemDTO);
		mv.addObject("ar",ar);
		mv.addObject("chpater",chapter);
		return mv;
	}
	
	
	
	
	@RequestMapping(value="AnswerCheck", method=RequestMethod.POST)
	public ModelAndView study1(String rate, String chapter,String[] pnum,String[] answer,String ma,String test, String type,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		ProblemDTO problemDTO = new ProblemDTO();
		problemDTO.setBook(chapter.charAt(0)+"");
		problemDTO.setChapter(chapter.charAt(1)+"");
		problemDTO.setChapter_m(chapter.charAt(2)+"");
		problemDTO.setType(type);
		problemDTO.setRate(rate);
		System.out.println(chapter);
		problemDTO.setId(((MemberDTO) session.getAttribute("member")).getId());		
		String[] check = new String[10];
		String[] commentary = new String[10];
		String[] my_answer = new String[10];
		int count = 0;
		for(int i=0; i<10; i++){
			if(answer[i].equals(ma.charAt(i)+"")){
				check[i]="O";
				studyService.right(pnum[i]);
				count++;
			}
			else{
				check[i]="X";
				commentary[i]=studyService.commentary(pnum[i]);
			} 
			my_answer[i] = ma.charAt(i)+"";
		}
		if(test!=null){
			problemDTO.setChapter_m("0");
			problemDTO.setType("0");
			if(count>=8)
			  studyService.rateChange(problemDTO);
			else
				studyService.rateChange2(problemDTO);
		}
		
		studyService.deleteProblem(problemDTO);
		mv.addObject("check", check);
		mv.addObject("c", commentary);
		mv.addObject("pnum", pnum);
		mv.addObject("answer", answer);
		mv.addObject("my_answer", my_answer);
		mv.setViewName("./study/AnswerCheck");
		return mv;
	}
	
	

	
	@RequestMapping(value="my_answer")
	public void answerCheck(ProblemDTO problemDTO)throws Exception{
		problemDTO.setId("iu");
		studyService.answerCheck(problemDTO);
	}
	
	
	@RequestMapping(value="myNote", method=RequestMethod.POST)
	public void myNote(String[] a,HttpSession session)throws Exception{
		ArrayList<ProblemDTO> ar = new ArrayList<>();
		System.out.println(a.length);
		if(a.length>3){
		for(int i =0; i<a.length; i+=3){
		ProblemDTO problemDTO = new ProblemDTO();
		problemDTO.setId(((MemberDTO) session.getAttribute("member")).getId());
		problemDTO.setReason(a[i]);
		problemDTO.setMy_answer(Integer.parseInt(a[i+1]));
		problemDTO.setPnum(Integer.parseInt(a[i+2]));
		ar.add(problemDTO);
		}
		studyService.myNote(ar);
		}
}
}
