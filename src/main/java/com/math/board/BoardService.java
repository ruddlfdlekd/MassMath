package com.math.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.math.util.ListData;

public interface BoardService {

	//list
	public List<BoardDTO> selectList(ListData listData) throws Exception;
	
	//one
	public BoardDTO selectOne(int num) throws Exception;
	
	//insert
	public int insert(BoardDTO boardDTO,MultipartFile [] file, HttpSession session) throws Exception;
	
	//update
	public int update(BoardDTO boardDTO) throws Exception;
	
	//delete
	public int delete(int num, HttpSession session) throws Exception;

	
}
