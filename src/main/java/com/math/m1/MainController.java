package com.math.m1;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.math.member.MemberDTO;
import com.math.member.MemberService;
@Controller
public class MainController {
	@Autowired
	MemberService memberService;			


	@RequestMapping(value="/main/mainPage")
	public ModelAndView main(HttpSession session)throws Exception{
		List<String> ar = memberService.getRateList(((MemberDTO)session.getAttribute("member")).getId());
		int s =0;
		for(int i=0; i<ar.size(); i++){
			s += ar.get(i).charAt(0);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("rate", (char) Math.round((double)s/(double)ar.size())+"");
		return mv;
	}
}