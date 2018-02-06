package com.math.myNote;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyNoteDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="MyNoteMapper.";
	
	public List<MyNoteDTO> myNoteList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"myNoteList", id);
	}
	
	public int myNoteDelete(MyNoteDTO myNoteDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"myNoteDelete", myNoteDTO);
	}
	
	public int myNoteInsert(MyNoteDTO myNoteDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"myNoteInsert", myNoteDTO);
	}

}
