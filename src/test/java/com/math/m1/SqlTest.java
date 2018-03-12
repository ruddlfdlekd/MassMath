package com.math.m1;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.math.member.MemberDAO;
import com.math.member.MemberDTO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class SqlTest {

	@Inject
	private SqlSession sqlSession;
	
	@Inject
	private MemberDAO memberDAO;
	
	@Test
	public void test() throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("daniel");
		memberDAO.memberJoin(memberDTO);
	}
}

