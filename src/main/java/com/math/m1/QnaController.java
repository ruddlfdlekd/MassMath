package com.math.m1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.math.board.BoardDTO;
import com.math.qna.QnaDTO;
import com.math.qna.QnaService;
import com.math.util.ListData;

@Controller
@RequestMapping(value="/qna/**")
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	
	@RequestMapping(value="qnaList")
	public ModelAndView selectList(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<BoardDTO> ar = qnaService.selectList(listData);
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.addObject("board", "qna");
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public String insert(Model model) throws Exception{
		model.addAttribute("board", "qna");
		return "board/boardWrite";
	}

	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	public String insert(QnaDTO qnaDTO,MultipartFile[] file,HttpSession session, RedirectAttributes re) throws Exception{
		int result=qnaService.insert(qnaDTO, file,session );
		String message="Write Fail";
		if(result>0){
			message="Write Success";
		}
		
		re.addFlashAttribute("message", message);
		return "redirect:./qnaList";
	}


}
