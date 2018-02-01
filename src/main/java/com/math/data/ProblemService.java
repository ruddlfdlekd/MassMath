package com.math.data;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;

@Service
public class ProblemService {
	
	@Inject
	private ProblemDAO problemDAO;
	
	public ProblemDTO selectOne(int pnum) throws Exception{
		return problemDAO.selectOne(pnum);
	}
}
