package com.math.m1;

import java.util.Date;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.math.member.MemberDTO;
import com.math.member.MemberService;
import com.math.member.MyAuthentication;

@Controller
@RequestMapping(value = "/member/**")
public class MemberController {

	@Inject
	private MemberService memberService;
	
	// kakao Login
	@RequestMapping(value = "kakaoLogin", method = RequestMethod.GET)
	public ModelAndView kakaoLogin(MemberDTO memberDTO, HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO.setPw("kakao");
		int result=0;
		MemberDTO memberDTO2 = memberService.memberLogin(memberDTO);
		if(memberDTO2==null){		
			session.setAttribute("member", memberDTO);
			result = memberService.memberJoin2(memberDTO);
			mv.addObject("path", "apiMemberUpdate");
			if (result > 0) {
				mv.addObject("message", "로그인 성공");
			} else {
				mv.addObject("message", "로그인 실패");
			}
		}else {
			session.setAttribute("member", memberDTO);
			mv.addObject("message", "로그인 성공");
			mv.addObject("path", "../");
		}
		
		mv.setViewName("common/result");
		
		return mv;
	}

	// Api Member Update
	@RequestMapping(value = "apiMemberUpdate", method = RequestMethod.GET)
	public void apiMemberUpdate() {
	}
	
	// Join
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void memberJoin() {
	}

	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO memberDTO, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		String addr = request.getParameter("postal_code") + " " + request.getParameter("street") + " "
				+ request.getParameter("street2");
		memberDTO.setAddress(addr);
		int result = 0;
		result = memberService.memberJoin(memberDTO);
		if (result > 0) {
			mv.addObject("message", "회원가입 성공");
		} else {
			mv.addObject("message", "회원가입 실패");
		}

		mv.addObject("path", "../");
		mv.setViewName("common/result");

		return mv;
	}

	// ID Check
	@RequestMapping(value = "memberIdCheck", method = RequestMethod.GET)
	public ModelAndView memberIdCheck(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = memberService.memberIdCheck(id);
		if (memberDTO == null) {
			mv.addObject("result", "사용 가능한 ID 입니다.");
		} else {
			mv.addObject("result", "이미 사용중인 ID 입니다.");
		}
		mv.setViewName("common/memberResult");
		return mv;
	}

	// Addr Search
	@RequestMapping(value = "memberAddrSearch", method = RequestMethod.GET)
	public void memberAddrSearch() throws Exception {
	}

	// Send Email
	@RequestMapping(value = "sendMail", method = RequestMethod.GET)
	public ModelAndView sendMail(MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		String checkmsg = "";
		try {
			System.out.println(memberDTO.getId());
			mv.addObject("id", memberDTO.getId());

		} catch (Exception e) {
			// TODO: handle exception
		}

		String mailserver = "mw-002.cafe24.com";
		Properties props = new Properties();
		props.put("mail.smtp.host", mailserver);
		props.put("mail.smtp.auth", "true");

		// 메일 인증 계정 및 비번
		Authenticator myauth = new MyAuthentication(); // 다형성

		// 메일서버에서 계정 인증 검사
		Session sess = Session.getInstance(props, myauth);

		// 인증번호
		int number = (int) (Math.random() * 10000);
		mv.addObject("number", number);

		// 사용자 입력 요청한 정보 가져오기

		String to = memberDTO.getId();
		String from = "loveiesus27@naver.com";
		String subject = "MassMath 인증번호입니다";
		String msgText = "안녕하세요. MassMath 입니다 인증번호는" + number + "입니다."; // 내용
		msgText = msgText.replace("\n", "<br/>");

		// 메일 보내기
		try {
			Message msg = new MimeMessage(sess);
			msg.setFrom(new InternetAddress(from)); // 보낸사람

			// 받는사람(한명)
			InternetAddress[] address = { new InternetAddress(to) };

			// 여러명 수신인
			/*
			 * InternetAddress[] address={new InternetAddress(to), new
			 * InternetAddress(to2), new InternetAddress(to3) };
			 */

			msg.setRecipients(Message.RecipientType.TO, address); // 받는사람

			msg.setSubject(subject); // 메일 제목

			msg.setContent(msgText, "text/html;charset=UTF-8"); // 메일 내용

			msg.setSentDate(new Date()); // 보낸날짜

			Transport.send(msg); // 전송

			checkmsg = to + "님에게 인증번호발송";
			mv.addObject("checkmsg", checkmsg);

		} catch (Exception e) {
			checkmsg = "메일전송 실패";
			mv.addObject("checkmsg", checkmsg);
		}
		mv.setViewName("member/sendMail");
		return mv;
	}

	// Login
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void memberLogin() {
	}

	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public ModelAndView memberLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.memberLogin(memberDTO);
		if (memberDTO != null) {
			session.setAttribute("member", memberDTO);
			mv.addObject("message", "로그인되었습니다.");
		} else {
			mv.addObject("message", "로그인에 실패하였습니다.");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}

	// MyPage
	@RequestMapping(value = "memberMyPage")
	public void memberMyPage(HttpSession session) throws Exception {
	}

	// Update
	@RequestMapping(value = "memberUpdate", method = RequestMethod.GET)
	public void memberUpdate() {
	}

	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(MemberDTO memberDTO, HttpServletRequest request, HttpSession session)
			throws Exception {
		String addr = request.getParameter("postal_code") + " " + request.getParameter("street") + " "
				+ request.getParameter("street2");
		System.out.println(addr);
		memberDTO.setAddress(addr);
		int result = memberService.memberUpdate(memberDTO);
		String message = "수정 실패";
		if (result > 0) {
			session.setAttribute("member", memberDTO);
			message = "수정 성공";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	

	// Delete
	@RequestMapping(value = "memberDelete")
	public ModelAndView memberDelete(HttpSession session, RedirectAttributes rd) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		int result = memberService.memberDelete(memberDTO);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("message", "삭제되었습니다.");
			session.invalidate();
		} else {
			mv.addObject("message", "삭제에 실패하였습니다.");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}

	// LogOut
	@RequestMapping(value = "memberLogOut")
	public ModelAndView memberLogOut(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "로그아웃 되었습니다.");
		session.invalidate();
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}

}
