package com.math.m1;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.math.study.StudyService;

@Controller
@RequestMapping(value="/ajax/**")
public class AjaxController {
	
	  @Autowired
		StudyService studyService;		
}
