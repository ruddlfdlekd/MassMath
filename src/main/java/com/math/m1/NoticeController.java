package com.math.m1;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.math.board.BoardDTO;
import com.math.notice.NoticeService;
import com.math.util.ListData;

@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;
	
	
	
	@RequestMapping(value="noticeDelete")
	public String delete(int num,  RedirectAttributes re)throws Exception{
		int result= noticeService.delete(num);
		String message="Delete Fail";
		if(result>0){
			message="Delete Success";
		}
		
		re.addFlashAttribute("message", message);
		return "redirect:./noticeList";
		
	}
	
	@RequestMapping(value="noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(BoardDTO boardDTO, RedirectAttributes re) throws Exception{
		System.out.println("update");
		System.out.println(boardDTO.getTop_view());
		int result=noticeService.update(boardDTO);
		String message="Update fail";
		if(result>0){
			message="Update success";
		}
		
		re.addFlashAttribute("message", message);
		re.addFlashAttribute("board", "notice");
		
		return "redirect:./noticeList";
	}
	
	
	@RequestMapping(value="noticeUpdate", method=RequestMethod.GET)
	public ModelAndView noticeUpdate(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO=noticeService.selectOne(num);
		mv.addObject("board", "notice");
		mv.addObject("view", boardDTO);
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	
	@RequestMapping(value="noticeView", method=RequestMethod.GET)
	public ModelAndView noticeView(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO=noticeService.selectOne(num);
		noticeService.hitUpdate(boardDTO);
	
		mv.addObject("board", "notice");
		mv.addObject("view", boardDTO);
		mv.setViewName("board/boardView");
		
		
		return mv;
	}
	
	@RequestMapping(value="noticeWrite", method=RequestMethod.POST)
	public String noticeInsert(BoardDTO boardDTO,RedirectAttributes re) throws Exception{
		int result=noticeService.insert(boardDTO);
		return "redirect:./noticeList";
				
	}
	
	@RequestMapping(value="noticeWrite", method=RequestMethod.GET)
	public String noticeInsert(Model model) throws Exception{
		model.addAttribute("board", "notice");
		return "board/boardWrite";
	}
	@RequestMapping(value="noticeList")
	public ModelAndView selectList(ListData listData) throws Exception{
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yy/MM/dd");
		String today = simpleDate.format(date);
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = noticeService.selectList(listData);
		List<BoardDTO> ar2 = noticeService.topView();
		if(ar2 != null){
			mv.addObject("top", ar2);
		}
		mv.addObject("today", today);
		mv.addObject("list", ar);
		mv.addObject("page",listData);
		mv.setViewName("board/boardList");
		return mv;
	}
	

}
