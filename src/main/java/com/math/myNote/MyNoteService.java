package com.math.myNote;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MyNoteService {

	@Inject
	private MyNoteDAO myNoteDAO;
	
	public List<MyNoteDTO> myNoteList(String id) throws Exception {
		return myNoteDAO.myNoteList(id);
	}
	
	public int myNoteDelete(MyNoteDTO myNoteDTO) throws Exception {
		return myNoteDAO.myNoteDelete(myNoteDTO);
	}
	
	public int myNoteInsert(MyNoteDTO myNoteDTO) throws Exception{
		return myNoteDAO.myNoteInsert(myNoteDTO);
	}
}