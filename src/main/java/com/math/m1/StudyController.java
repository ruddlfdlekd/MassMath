package com.math.m1;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
		ModelAndView mv = new ModelAndView();
		if(((MemberDTO)session.getAttribute("member")).getId()==null){
			mv.setViewName("/member/memberLogin");
		}else{
			ProblemDTO problemDTO = new ProblemDTO();
			problemDTO.setId(((MemberDTO)session.getAttribute("member")).getId());
			problemDTO.setBook(chapter.charAt(0)+"");
			problemDTO.setChapter(chapter.charAt(1)+"");
			String rate = studyService.getRate(problemDTO);
			mv.addObject("chapter", chapter);
			mv.addObject("rate", rate);	
		}
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
		
		
		ArrayList<String> contents1 = null;
		ArrayList<String> answerList1 = null;
		ArrayList<ArrayList<String>> con = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> ans = new ArrayList<ArrayList<String>>();
		
		for(int i=0; i<ar.size(); i++){
			
			String contents=ar.get(i).getContents();
			String answerList=ar.get(i).getAnswerlist();

			//Contents 한글과 식 나누는작업
			StringTokenizer st = new StringTokenizer(contents, "*");
			
			contents1 = new ArrayList<String>();
			while(st.hasMoreElements()){
				contents1.add(st.nextToken());
			}
			
			con.add(contents1); //contents 배열을 ArrayList형식으로 한번 더 넣어줌
			
			
			//contents 배열에 담은
			
			//answerList 나누는작업
			st = new StringTokenizer(answerList, ",");
			
			answerList1 = new ArrayList<String>();
			while(st.hasMoreElements()){
				answerList1.add(st.nextToken());
			}
			
			ans.add(answerList1);
			
		} //for문 끝
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		mv.addObject("chapter",chapter);
		mv.addObject("con", con);
		mv.addObject("ans", ans);
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
		rate = ar.get(0).getRate();
	
		
		ArrayList<String> contents1 = null;
		ArrayList<String> answerList1 = null;
		ArrayList<ArrayList<String>> con = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> ans = new ArrayList<ArrayList<String>>();
		
		for(int i=0; i<ar.size(); i++){
			
			String contents=ar.get(i).getContents();
			String answerList=ar.get(i).getAnswerlist();

			//Contents 한글과 식 나누는작업
			StringTokenizer st = new StringTokenizer(contents, "*");
			
			contents1 = new ArrayList<String>();
			while(st.hasMoreElements()){
				contents1.add(st.nextToken());
			}
			
			con.add(contents1); //contents 배열을 ArrayList형식으로 한번 더 넣어줌
			
			
			//contents 배열에 담은
			
			//answerList 나누는작업
			st = new StringTokenizer(answerList, ",");
	
			answerList1 = new ArrayList<String>();
			while(st.hasMoreElements()){
				answerList1.add(st.nextToken());
			}
			
			ans.add(answerList1);
			
		} //for문 끝
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar", ar);
		mv.addObject("rate", rate);
		mv.addObject("chapter",chapter);
		mv.addObject("con", con);
		mv.addObject("ans", ans);
		return mv;
		
	}
	
	
	@RequestMapping(value="studyMain")
	public ModelAndView studyMain(String chapter,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		ProblemDTO problemDTO = new ProblemDTO();
		if((MemberDTO) session.getAttribute("member") != null){
			problemDTO.setId(((MemberDTO) session.getAttribute("member")).getId());
			problemDTO.setBook(chapter);
			List<String> ar = studyService.bookRate(problemDTO);
			mv.addObject("ar",ar);
			mv.addObject("chpater",chapter);			
		}
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
		problemDTO.setId(((MemberDTO) session.getAttribute("member")).getId());	
		ArrayList<ArrayList<String>> commentary = new ArrayList<>();
		String[] check = new String[10];
		String[] my_answer = new String[10];
		int count = 0;
		for(int i=0; i<10; i++){
			if(answer[i].equals(ma.charAt(i)+"")){
				ArrayList<String> com = new ArrayList<>();
				check[i]="O";
				studyService.right(pnum[i]);
				commentary.add(com);
				count++;
			}
			else{
				check[i]="X";
				StringTokenizer st = new StringTokenizer(studyService.commentary(pnum[i]), "*");
				ArrayList<String> com = new ArrayList<>();
				while(st.hasMoreElements()){
					com.add(st.nextToken());
				}
				commentary.add(com);
			} 
			my_answer[i] = ma.charAt(i)+"";
		}
		if(test!=null){
			problemDTO.setChapter_m("0");
			problemDTO.setType("0");
			if(count>=8){
				studyService.rateChange(problemDTO);
			}
			else{
				studyService.rateChange2(problemDTO);
			}
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
	public void answerCheck(ProblemDTO problemDTO,HttpSession session)throws Exception{
		problemDTO.setId(((MemberDTO) session.getAttribute("member")).getId());
		studyService.answerCheck(problemDTO);
	}
	
	
	@RequestMapping(value="myNote", method=RequestMethod.POST)
	public void myNote(String[] a,HttpSession session)throws Exception{
		ArrayList<ProblemDTO> ar = new ArrayList<>();
		if(a!=null){
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
