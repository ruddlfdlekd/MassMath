package com.math.m1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.math.board.BoardDTO;
import com.math.file.FileDAO;
import com.math.file.FileDTO;
import com.math.qna.QnaDTO;
import com.math.qna.QnaService;
import com.math.reply.ReplyDTO;
import com.math.util.ListData;

@Controller
@RequestMapping(value="/qna/**")
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	@Inject
	private FileDAO fileDAO;
	
	@RequestMapping(value="ReplyInsert2", method=RequestMethod.GET)
	public String replyInsert2(Model model) throws Exception{
		model.addAttribute("qna", "qna");
		
		return "qna/qnaWrite";
	}
	
	
	@RequestMapping(value="ReplyInsert2",method=RequestMethod.POST)
	public ModelAndView replyInsert2(BoardDTO boardDTO)throws Exception{
		ModelAndView mv=new ModelAndView();
		int result=qnaService.replyInsert2(boardDTO);
		String s="fail";
		if(result>0){
			s="success";
		}
		mv.addObject("result", s);
		mv.setViewName("common/fileResult");
		return mv;
	}
	
	
	@RequestMapping(value="qnaUpdate",method=RequestMethod.GET)
	public String update(int num,Model model)throws Exception{
		BoardDTO boardDTO=qnaService.selectOne(num);
		List<FileDTO> far=fileDAO.selectList(num);
		
		model.addAttribute("view",boardDTO);
		model.addAttribute("files",far);
		
		return "qna/qnaUpdate";
	}
	
	@RequestMapping(value="qnaDelete")
	public String delete(int num, HttpSession session)throws Exception{
		int result=qnaService.delete(num, session);
		
		return "redirect:./qnaList";
		
	}

	
	@RequestMapping(value="qnaList")
	public ModelAndView selectList(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = qnaService.selectList(listData);
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.addObject("qna", "qna");
		mv.setViewName("qna/qnaList");
		
		return mv;
	}
	@RequestMapping(value="qnaView")
	public ModelAndView selectOne(int num)throws Exception{
		BoardDTO boardDTO=qnaService.selectOne(num);
		List<FileDTO> far=fileDAO.selectList(num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("view",boardDTO);
		mv.addObject("files", far);
		mv.addObject("qna","qna");
		mv.setViewName("qna/qnaView");
		return mv;
	}

	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public String insert(Model model) throws Exception{
		model.addAttribute("qna", "qna");
		
		return "qna/qnaWrite";
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
