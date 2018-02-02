package com.math.m1;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.math.member.MemberDTO;
import com.math.member.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	//Join
	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public void memberJoin(){}
	
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO memberDTO, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		String addr = request.getParameter("postal_code ") + request.getParameter("street ") + request.getParameter("street2");		
		memberDTO.setAddress(addr);
		int result=0;
		result = memberService.memberJoin(memberDTO);
		if(result>0){
			mv.addObject("message", "회원가입 성공");
		}else{
			mv.addObject("message", "회원가입 실패");
		}
		
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//ID Check
	@RequestMapping(value="memberIdCheck", method=RequestMethod.GET)
	public ModelAndView memberIdCheck(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = memberService.memberIdCheck(id);
		if(memberDTO==null){
			mv.addObject("result", "사용 가능한 ID 입니다.");
		}else{
			mv.addObject("result", "이미 사용중인 ID 입니다.");
		}
		mv.setViewName("common/memberResult");
		return mv;
	}
	
	//Addr Search
	@RequestMapping(value="memberAddrSearch", method=RequestMethod.GET)
	public void memberAddrSearch() throws Exception{}
	
	
}
