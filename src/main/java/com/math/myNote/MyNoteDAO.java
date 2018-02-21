package com.math.myNote;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.math.util.ListData;
import com.math.util.MyNoteListData;

@Repository
public class MyNoteDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="MyNoteMapper.";
	
	public List<MyNoteDTO> myNoteFilter(MyNoteListData myNoteListData) throws Exception {
		System.out.println("=====DAO=====");
		System.out.println("id : "+myNoteListData.getId());
		System.out.println("reason : "+myNoteListData.getReason());
		System.out.println("books.size() : "+myNoteListData.getBooks().size());
		List<MyNoteDTO> test = sqlSession.selectList(NAMESPACE+"myNoteFilter", myNoteListData);
		
		System.out.println(test.size());
		return test;
	}
	
	public int totalCount(MyNoteListData myNoteListData) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"totalCount", myNoteListData);
	}
	
	
	public List<MyNoteDTO> myNoteList(MyNoteListData myNoteListData) throws Exception {
		return sqlSession.selectList(NAMESPACE+"myNoteList", myNoteListData);
	}
	
	public int myNoteDelete(MyNoteDTO myNoteDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"myNoteDelete", myNoteDTO);
	}
	
	public int myNoteInsert(MyNoteDTO myNoteDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"myNoteInsert", myNoteDTO);
	}

}
