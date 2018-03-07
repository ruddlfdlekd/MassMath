package com.math.data;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.math.util.ListData;

@Repository
public class ProblemDAO {
	
	@Inject
	private SqlSession sqlSession ;
	private String namespace = "ProblemMapper.";
	
	
	
	public ProblemDTO save(ProblemDTO problemDTO) throws Exception {
		switch(problemDTO.getBook()){
		case "상":
			problemDTO.setBook("1");
			break;
		case "하":
			problemDTO.setBook("2");
			break;
		case "수1":
			problemDTO.setBook("3");
			break;
		case "수2":
			problemDTO.setBook("4");
			break;
		case "미적분":
			problemDTO.setBook("5");
			break;
		case "확률과 통계":
			problemDTO.setBook("6");
			break;
		case "기하":
			problemDTO.setBook("7");
			break;
	}
	switch(problemDTO.getChapter()){
	case "다항식":
		problemDTO.setChapter("1");
		
		switch(problemDTO.getChapter_m()){
		case "다항식의 연산":
			problemDTO.setChapter_m("1");
			break;
		case "항등식과 나머지정리":
			problemDTO.setChapter_m("2");
			break;
		case "인수분해":
			problemDTO.setChapter_m("3");
			break;
	}
		break;
	case "방정식":
		problemDTO.setChapter("2");
		switch(problemDTO.getChapter_m()){
		case "복소수":
			problemDTO.setChapter_m("1");
			break;
		case "이차방정식과 이차함수":
			problemDTO.setChapter_m("2");
			break;
		case "여러 가지 방정식":
			problemDTO.setChapter_m("3");
			break;
	}
		break;
	case "부등식":
		problemDTO.setChapter("3");
		switch(problemDTO.getChapter_m()){
		case "평면좌표":
			problemDTO.setChapter_m("1");
			break;
		case "직선의 방정식":
			problemDTO.setChapter_m("2");
			break;
		case "원의 방정식":
			problemDTO.setChapter_m("3");
			break;
	}
		break;
}
	switch(problemDTO.getType()) {
	case "A":
		problemDTO.setType("1");
		break;
	case "B":
		problemDTO.setType("2");
		break;
	case "C":
		problemDTO.setType("3");
		break;
	default :
		problemDTO.setType("1");
		break;
	}
	
	return problemDTO;
	}
	
	public List<ProblemDTO> change(List<ProblemDTO> ar) throws Exception{
		List<ProblemDTO>ar2 = new ArrayList<>();
		for(int i=0; i<ar.size(); i++){
			ProblemDTO problemDTO = new ProblemDTO();
			problemDTO=change2(ar.get(i));
			ar2.add(problemDTO);
		}
		return ar2;
	}
	
	public ProblemDTO change2(ProblemDTO problemDTO) throws Exception {
		switch(problemDTO.getBook()){
		case "1":
			problemDTO.setBook("상");
			break;
		case "2":
			problemDTO.setBook("하");
			break;
		case "3":
			problemDTO.setBook("수1");
			break;
		case "4":
			problemDTO.setBook("수2");
			break;
		case "5":
			problemDTO.setBook("미적분");
			break;
		case "6":
			problemDTO.setBook("확률과 통계");
			break;
		case "7":
			problemDTO.setBook("기하");
			break;
	}
	switch(problemDTO.getChapter()){
	case "1":
		problemDTO.setChapter("다항식");
		switch(problemDTO.getChapter_m()){
		case "1":
			problemDTO.setChapter_m("다항식의 연산");
			break;
		case "2":
			problemDTO.setChapter_m("항등식과 나머지정리");
			break;
		case "3":
			problemDTO.setChapter_m("인수분해");
			break;
	}
		break;
	case "2":
		problemDTO.setChapter("방정식");
		switch(problemDTO.getChapter_m()){
		case "1":
			problemDTO.setChapter_m("복소수");
			break;
		case "2":
			problemDTO.setChapter_m("이차방정식과 이차함수");
			break;
		case "3":
			problemDTO.setChapter_m("여러 가지 방정식");
			break;
	}
		break;
	case "3":
		problemDTO.setChapter("부등식");
		switch(problemDTO.getChapter_m()){
		case "1":
			problemDTO.setChapter_m("평면좌표");
			break;
		case "2":
			problemDTO.setChapter_m("직선의 방정식");
			break;
		case "3":
			problemDTO.setChapter_m("원의 방정식");
			break;
	}
		break;
	}
		switch(problemDTO.getType()) {
		case "1":
			problemDTO.setType("A");
			break;
		case "2":
			problemDTO.setType("B");
			break;
		case "3":
			problemDTO.setType("C");
			break;
		default :
			problemDTO.setType("A");
			break;
		
}
	return problemDTO;
	}
	
	public int updatePer(ProblemDTO problemDTO) throws Exception{
		return sqlSession.update(namespace+"updatePer", problemDTO);
	}
	
	public int delete(int pnum) throws Exception{
		return sqlSession.delete(namespace+"delete", pnum);
	}
	
	public int update(ProblemDTO problemDTO) throws Exception{
		problemDTO=save(problemDTO);
		return sqlSession.update(namespace+"update", problemDTO);
	}
	
	public int totalCount(ListData listData) throws Exception{
		return sqlSession.selectOne(namespace+"totalCount", listData);
	}
	
	public List<ProblemDTO> selectList(ListData listData) throws Exception{
		List<ProblemDTO>ar=change(sqlSession.selectList(namespace+"selectList", listData));

		return ar;
	}
	
	public ProblemDTO selectOne(int pnum) throws Exception{
		ProblemDTO problemDTO = change2(sqlSession.selectOne(namespace+"selectOne", pnum));
		return problemDTO;
	}
	
	public int insert(ProblemDTO problemDTO) throws Exception{
		problemDTO=save(problemDTO);
		return sqlSession.insert(namespace+"insert", problemDTO);
	}
	
}
