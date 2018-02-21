package com.math.myNote;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.math.util.MyNoteListData;
import com.math.util.MyNotePageMaker;

@Service
public class MyNoteService {

	@Inject
	private MyNoteDAO myNoteDAO;
	
	public List<MyNoteDTO> myNoteFilter(MyNoteListData myNoteListData) throws Exception {
		return myNoteDAO.myNoteFilter(myNoteListData);
	}
	
	public List<MyNoteDTO> myNoteList(MyNoteListData myNoteListData) throws Exception {
		int totalCount = myNoteDAO.totalCount(myNoteListData);
		System.out.println("totalCount:"+totalCount);
		MyNotePageMaker myNotepageMaker = new MyNotePageMaker();
		myNotepageMaker.pageMaker(totalCount, myNoteListData);
		return myNoteDAO.myNoteList(myNoteListData);
	}
	
	public int myNoteDelete(MyNoteDTO myNoteDTO) throws Exception {
		return myNoteDAO.myNoteDelete(myNoteDTO);
	}
	
	public int myNoteInsert(MyNoteDTO myNoteDTO) throws Exception{
		return myNoteDAO.myNoteInsert(myNoteDTO);
	}
}