package com.math.m1;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//Login
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public void memberLogin(){}
	
	@RequestMapping(value="memberLogin", method=RequestMethod.POST)
	public ModelAndView memberLogin(MemberDTO memberDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.memberLogin(memberDTO);
		if(memberDTO!=null){
			session.setAttribute("member", memberDTO);
			mv.addObject("message", "로그인되었습니다.");
		}else{
			mv.addObject("message", "로그인에 실패하였습니다.");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");		
		return mv;
	}
	
	//MyPage
	@RequestMapping(value="memberMyPage")
	public void memberMyPage(HttpSession session) throws Exception{}
	
	//Update
	@RequestMapping(value="memberUpdate", method=RequestMethod.GET)
	public void memberUpdate(){}
	
	@RequestMapping(value="memberUpdate", method=RequestMethod.POST)
	public ModelAndView memberUpdate(MemberDTO memberDTO, HttpSession session) throws Exception{
		int result = memberService.memberUpdate(memberDTO);
		String message = "수정 실패";
		if(result > 0){
			session.setAttribute("member", memberDTO);
			message = "수정 성공";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("path", "memberMyPage");
		mv.setViewName("common/result");
		return mv;
	}
	
	//Delete
	@RequestMapping(value="memberDelete")
	public ModelAndView memberDelete(HttpSession session, RedirectAttributes rd)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = memberService.memberDelete(memberDTO);
		ModelAndView mv  = new ModelAndView();
		if(result > 0){
			mv.addObject("message", "삭제되었습니다.");
			session.invalidate();
		}else{
			mv.addObject("message", "삭제에 실패하였습니다.");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	//LogOut
	@RequestMapping(value="memberLogOut")
	public ModelAndView memberLogOut(HttpSession session){
		ModelAndView mv  = new ModelAndView();
		mv.addObject("message", "로그아웃 되었습니다.");
		session.invalidate();
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	
}
