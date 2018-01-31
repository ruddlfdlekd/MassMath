package com.math.m1;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.math.study.StudyDAO;

@Controller
@RequestMapping(value="/ajax/**")
public class AjaxController {
	
		
		StudyDAO studyDAO;
	
		@RequestMapping(value="view")
		public void ajaxView(){
		}
		
		
		@RequestMapping(value="select")
		public ModelAndView select(String id)throws Exception{
			
			ModelAndView mv = new ModelAndView();

			mv.setViewName("ajax/result_1");
			return mv;
		}
		
		
		@RequestMapping(value="selectJson", method=RequestMethod.POST)
		@ResponseBody
		public void selectJson(String id)throws Exception{
	
		
		}
		
}
