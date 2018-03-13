package com.math.m1;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.math.data.ProblemDTO;
import com.math.data.ProblemService;
import com.math.util.ListData;

@Controller
@RequestMapping(value="/problem/**")
public class ProblemController {
	
	@Inject
	private ProblemService problemService;
	
	@RequestMapping(value="problemDelete")
		public String delete(int pnum, RedirectAttributes rs) throws Exception{
		int result=problemService.delete(pnum);
		if(result>0){
			rs.addFlashAttribute("message", "삭제성공");
		}else{
			rs.addFlashAttribute("message", "삭제실패");
		}
		
		return "redirect:./problemList";
		
	}
	
	@RequestMapping(value="problemUpdate", method=RequestMethod.POST)
		public ModelAndView update(ProblemDTO problemDTO, boolean check) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(check==true){
				problemDTO.setCommentary(" "+problemDTO.getCommentary());
				int result=problemService.update(problemDTO);
				if(result>0){
					System.out.println("성공");
					mv.setViewName("problem/result");
				}
			}else{
				problemDTO.setContents(" "+problemDTO.getContents());
				problemDTO.setCommentary(problemDTO.getCommentary().trim());
				mv.addObject("problemDTO", problemDTO);
				StringTokenizer st= new StringTokenizer(problemDTO.getAnswerlist(), ",");
				ArrayList<String> ar = new ArrayList<String>();
				while(st.hasMoreElements()){
					ar.add(st.nextToken());
				}
				mv.addObject("answer_ar", ar);
				mv.setViewName("problem/commentaryUpdate");
			}
			return mv;
		}
	
	
	@RequestMapping(value="problemUpdate", method=RequestMethod.GET)
	public ModelAndView update(ProblemDTO problemDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		problemDTO.setContents(problemDTO.getContents().trim());
		StringTokenizer st = new StringTokenizer(problemDTO.getAnswerlist(), ",");
		ArrayList<String> answerList = new ArrayList<String>();
		while(st.hasMoreElements()){
			answerList.add(st.nextToken());
		}
		mv.addObject("answerlist", answerList);
		mv.addObject("problemDTO", problemDTO);
		
		return mv;
		
	}
	
	@RequestMapping(value="test1", method=RequestMethod.GET)
	public void test()throws Exception{
	}
	
	@RequestMapping(value="listAjax", method=RequestMethod.GET)
	public ModelAndView problemList(ListData listData)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<ProblemDTO> ar = problemService.selectList(listData);
		
		if(ar.size() != 0){
			
		
		for(int i=0; i<ar.size(); i++){
			
			ar.get(i).setPercentage((double)ar.get(i).getRightCount()/ar.get(i).getCount()*100);
			ProblemDTO pDTO = new ProblemDTO();
				pDTO.setPnum(ar.get(i).getPnum());
				pDTO.setPercentage(ar.get(i).getPercentage());
				problemService.updatePer(pDTO);
			
		}
		
		ArrayList<String> contents1 = null;
		ArrayList<String> answerList1 = null;
		ArrayList<String> commentary1 = null;
		ArrayList<ArrayList<String>> con = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> ans = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> com = new ArrayList<ArrayList<String>>();
		
		for(int i=0; i<ar.size(); i++){
			
			String commentary=ar.get(i).getCommentary();
			String contents=ar.get(i).getContents();
			String answerList=ar.get(i).getAnswerlist();
			if(commentary==null){
				commentary = "해설없음";
			}
			
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
			
			//Commentary 한글과 식 나누는작업
			st = new StringTokenizer(commentary, "*");
			
			
			commentary1 = new ArrayList<String>();
			while(st.hasMoreElements()){
				commentary1.add(st.nextToken());
			}
			
			com.add(commentary1);
			
		} //for문 끝
		
		mv.addObject("contents", con);
		mv.addObject("answerList", ans);
		mv.addObject("commentary", com);
		mv.addObject("dto", ar);
		mv.addObject("page", listData);
		}; // if 문 끝
		
		return mv;
	}

	@RequestMapping(value="problemView", method=RequestMethod.GET)
	public ModelAndView view(int pnum) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		ProblemDTO problemDTO=problemService.selectOne(pnum);
		mv.addObject("problem", problemDTO);
		//Contents 한글과 식 나누는작업
		StringTokenizer st = new StringTokenizer(problemDTO.getContents(), "*");
		ArrayList<String> contents = new ArrayList<String>();
		while(st.hasMoreElements()){
			contents.add(st.nextToken());
		}
		//contents 배열에 담은
		
		//answerList 나누는작업
		st = new StringTokenizer(problemDTO.getAnswerlist(), ",");
		ArrayList<String> answerList = new ArrayList<String>();
		
		while(st.hasMoreElements()){
			answerList.add(st.nextToken());
		}
		
		ArrayList<String> commentary = null;
		if(problemDTO.getCommentary() != null){
		st = new StringTokenizer(problemDTO.getCommentary(), "*");
			commentary = new ArrayList<String>();
		
		
		
			while(st.hasMoreElements()){
			commentary.add(st.nextToken());
			}
		}
		
		mv.addObject("contents", contents);
		mv.addObject("answerList", answerList);
		mv.addObject("commentary", commentary);
		mv.setViewName("problem/view");
		return mv;
	}
	
	@RequestMapping(value="makeProblem")
	public void makeProblem(){}
	
	@RequestMapping(value="answerAjax", method=RequestMethod.GET)
	public ModelAndView answerAjax(String answerlist) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", answerlist);
		return mv;
	}
	
	@RequestMapping(value="problemAjax", method=RequestMethod.GET)
	public ModelAndView problemAjax(String contents) throws Exception{
		contents = " "+contents;
		StringTokenizer st = new StringTokenizer(contents,"*");
		String [] array = new String[st.countTokens()];
		int i=0;
		ArrayList<String> ar = new ArrayList<String>();
		while(st.hasMoreElements()){
			array[i++] = st.nextToken();
		}
				
		for(i=0; i < array.length; i++){
			ar.add(array[i]);
					}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", ar);
		
		
		return mv;
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public ModelAndView write(ProblemDTO problemDTO)throws Exception{
		problemDTO.setContents(" "+problemDTO.getContents());
		ModelAndView mv= new ModelAndView();
		if(problemDTO.getCommentary()==null){
			StringTokenizer st = new StringTokenizer(problemDTO.getAnswerlist(), ",");
			String [] array = new String[st.countTokens()];
			int i=0;
			ArrayList<String>ar = new ArrayList<String>();
			while(st.hasMoreElements()){
				array[i++] = st.nextToken();
			}
			for(i=0; i< array.length; i++){
				ar.add(array[i]);
			}
			mv.addObject("answer_ar", ar);
			mv.addObject("problemDTO", problemDTO);
			mv.setViewName("problem/commentary");
		}else{//글등록후 등록된 문제 보여주기
			problemDTO.setCommentary(" "+problemDTO.getCommentary());
			int result=problemService.insert(problemDTO);
			
			if(result>0){				
				//Contents 한글과 식 나누는작업
				StringTokenizer st = new StringTokenizer(problemDTO.getContents(), "*");
				String [] ar = new String[st.countTokens()];
				ArrayList<String> contents = new ArrayList<String>();
				int i=0;
				while(st.hasMoreElements()){
					ar[i++] = st.nextToken();
				}
				
				for(i=0; i< ar.length; i++){
					contents.add(ar[i]);
				}
				//contents 배열에 담은
				
				//answerList 나누는작업
				st = new StringTokenizer(problemDTO.getAnswerlist(), ",");
				ar = new String[st.countTokens()];
				ArrayList<String> answerList = new ArrayList<String>();
				i=0;
				while(st.hasMoreElements()){
					ar[i++] = st.nextToken();
				}
				for(i=0; i<ar.length;i++){
					answerList.add(ar[i]);
				}
				
				//Commentary 한글과 식 나누는작업
				st = new StringTokenizer(problemDTO.getCommentary(), "*");
				ar = new String[st.countTokens()];
				ArrayList<String> commentary = new ArrayList<String>();
				i=0;
				while(st.hasMoreElements()){
					ar[i++] = st.nextToken();
				}
				
				for(i=0; i< ar.length; i++){
					commentary.add(ar[i]);
				}
				
				mv.addObject("contents", contents);
				mv.addObject("answerList", answerList);
				mv.addObject("commentary", commentary);
				mv.addObject("view", problemDTO);
				mv.addObject("message", "완료");
			}else{
				mv.addObject("message", "실패");
			}
			mv.setViewName("problem/insert_result");
		}
		return mv;
	}
	
	@RequestMapping(value="problemList")
	public void selectList()throws Exception{
	}

}
