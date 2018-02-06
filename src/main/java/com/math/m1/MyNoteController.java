package com.math.m1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.math.myNote.MyNoteDTO;
import com.math.myNote.MyNoteService;

@Controller
@RequestMapping(value="/myNote/**")
public class MyNoteController {
	
	@Inject
	private MyNoteService myNoteService;
	
	@RequestMapping(value="myNoteList")
	public ModelAndView myNoteList(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MyNoteDTO> ar = myNoteService.myNoteList(id);
		//경일이 문제 db에서 긁어오기
		mv.addObject("note", ar);
		mv.setViewName("./myNote/myNoteList");
		
		return mv;
	}
	
	@RequestMapping(value="myNoteDelete")
	public String myNoteDelete(MyNoteDTO myNoteDTO) throws Exception {
		int result = myNoteService.myNoteDelete(myNoteDTO);
		System.out.println(result);
		return "redirect:../myNote/myNoteList?id=ii";
	}

	@RequestMapping(value="myNoteInsert")
	public String myNoteInsert(MyNoteDTO myNoteDTO) throws Exception {
		int result = myNoteService.myNoteInsert(myNoteDTO);
		System.out.println(result);
		return "redirect:../myNote/myNoteList?id=ii";
	}
}
