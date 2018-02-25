package com.math.member;


import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.math.member.MemberDTO;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;

	// Join
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberJoin(memberDTO);
	}
	
	// api Login
	public int memberJoin2(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberJoin2(memberDTO);
	}

	// ID Check
	public MemberDTO memberIdCheck(String id) throws Exception {
		return memberDAO.memberIdCheck(id);
	}

	// Login
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberLogin(memberDTO);
	}
	// Login
	public MemberDTO memberLogin2(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberLogin2(memberDTO);
	}

	// MyPage
	public MemberDTO memberMyPage(String id) throws Exception {
		return memberDAO.memberMyPage(id);
	}

	// Update
	public int memberUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberUpdate(memberDTO);
	}

	// Delete
	public int memberDelete(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberDelete(memberDTO);
	}

}
