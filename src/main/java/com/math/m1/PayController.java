package com.math.m1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="pay/**")
public class PayController {
	
@RequestMapping(value="pay3")
public void pay(){

}


@RequestMapping(value="payment",method=RequestMethod.GET)
public void pay1(String price,Model model)throws Exception{
	model.addAttribute("amount", price);

}
}

