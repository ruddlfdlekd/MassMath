package com.math.m1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.math.data.ProblemDTO;
import com.math.data.ProblemService;

@Controller
@RequestMapping(value="/problem/**")
public class ProblemController {
	
	@Inject
	private ProblemService problemService;
	
	@RequestMapping(value="result")
	public ModelAndView selectOne(int pnum)throws Exception{
		ModelAndView mv = new ModelAndView();
		ProblemDTO problemDTO=problemService.selectOne(pnum);
		System.out.println(problemDTO.getData());
		mv.addObject("data", problemDTO);
		
		return mv;
	}

}
