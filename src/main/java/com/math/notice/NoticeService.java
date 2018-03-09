package com.math.notice;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.math.board.BoardDTO;
import com.math.board.BoardService;
import com.math.file.FileDAO;
import com.math.file.FileDTO;
import com.math.util.FileSaver;
import com.math.util.ListData;
import com.math.util.PageMaker;

@Service
public class NoticeService {
	
	@Inject
	private NoticeDAO noticeDAO;
	
	public List<BoardDTO> topView() throws Exception{
		return noticeDAO.topView();
	}
	
	public int hitUpdate(BoardDTO boardDTO) throws Exception{
		return noticeDAO.hitUpdate(boardDTO);
	}
	
	public int delete(int num) throws Exception{
		return noticeDAO.delete(num);
	}
	
	public int update(BoardDTO boardDTO) throws Exception{
		return noticeDAO.update(boardDTO);
	} 
	
	public BoardDTO selectOne(int num) throws Exception{
		return noticeDAO.selectOne(num);
	}
	
	public List<BoardDTO> selectList(ListData listData) throws Exception{
		int totalCount=noticeDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		return noticeDAO.selectList(listData);
	}
	
	public int insert(BoardDTO boardDTO) throws Exception{
		return noticeDAO.insert(boardDTO);
	}
	
	

}
