package com.math.m1;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.parsing.Problem;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.math.data.ProblemDAO;
import com.math.data.ProblemDTO;
import com.math.data.ProblemService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class SqlTest {

	@Inject
	private SqlSession sqlSession;
	@Inject
	private ProblemDAO problemDAO;
	
	@Test
	public void test() throws Exception{
		int pnum=1;
		ProblemDTO problemDTO=problemDAO.selectOne(pnum);
		
		System.out.println(problemDTO.getData());
		
		
	}

}
