package com.math.data;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;

import com.math.util.ListData;
import com.math.util.PageMaker;


@Service
public class ProblemService {
	
	@Inject
	private ProblemDAO problemDAO;
	
	public int updatePer(ProblemDTO problemDTO) throws Exception{
		return problemDAO.updatePer(problemDTO);
	}
	
	public int update(ProblemDTO problemDTO) throws Exception{
		return problemDAO.update(problemDTO);
	}
	
	public List<ProblemDTO> selectList(ListData listData) throws Exception{
		int totalCount = problemDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		if(totalCount == 0){
			listData.setLastNum(1);
		}
		System.out.println("Search:"+listData.getSearch());
		System.out.println("kind:"+listData.getKind());
		
		return problemDAO.selectList(listData);
	}
	
	public ProblemDTO selectOne(int pnum) throws Exception{
		return problemDAO.selectOne(pnum);
	}
	
	public int insert(ProblemDTO problemDTO) throws Exception{
		return problemDAO.insert(problemDTO); 
	}
}
