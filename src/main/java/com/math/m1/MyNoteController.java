package com.math.m1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.math.member.MemberDTO;
import com.math.myNote.MyNoteDTO;
import com.math.myNote.MyNoteService;
import com.math.util.MyNoteListData;

@Controller
@RequestMapping(value="/myNote/**")
public class MyNoteController {
	
	@Inject
	private MyNoteService myNoteService;
	
	@RequestMapping(value="myNoteFilter")
	public String myNoteFilter(String id, String reason, @RequestParam(value="books[]") List<String> books, Model model, HttpSession session) throws Exception {

		MyNoteListData myNoteListData = new MyNoteListData();
		System.out.println("=====param -> controller=====");
		System.out.println("id : "+id);
		System.out.println("reason : "+reason);
		System.out.println("books.size() : "+books.size());
		
		myNoteListData.setId(id);
		myNoteListData.setBooks(books);
		myNoteListData.setReason(reason);
		
		List<MyNoteDTO> mynotelist = myNoteService.myNoteFilter(myNoteListData);
		model.addAttribute("result", mynotelist);
		return "common/myNoteResult";
	}
	
	
	@RequestMapping(value="myNoteList")
	public ModelAndView myNoteList(MyNoteListData myNoteListData, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(session.getId()!=null){
			
			List<MyNoteDTO> myNoteList = myNoteService.myNoteList(myNoteListData);
			mv.addObject("result", myNoteList);
			mv.setViewName("myNote/myNoteList");
		}else{
			mv.setViewName("member/memberLogin");
		}
		
		return mv;
	}
	
	@RequestMapping(value="myNoteDelete")
	public String myNoteDelete(MyNoteDTO myNoteDTO, HttpSession session, Model model) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		System.out.println(memberDTO.getId());
		System.out.println(myNoteDTO.getNum());
		int result = myNoteService.myNoteDelete(myNoteDTO);
		System.out.println("최종 result : "+result);
		model.addAttribute("result", result);
		return "common/fileResult";
	}

	@RequestMapping(value="myNoteInsert")
	public String myNoteInsert(MyNoteDTO myNoteDTO, HttpSession session) throws Exception {
		int result = myNoteService.myNoteInsert(myNoteDTO);
		System.out.println(result);
		return "redirect:../myNote/myNoteList?id="+myNoteDTO.getId();
	}
}
