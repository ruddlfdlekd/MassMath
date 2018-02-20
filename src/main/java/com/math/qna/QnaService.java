package com.math.qna;

import java.io.File;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.math.board.BoardDTO;
import com.math.board.BoardService;
import com.math.file.FileDAO;
import com.math.file.FileDTO;
import com.math.util.FileSaver;
import com.math.util.ListData;
import com.math.util.PageMaker;

@Service
public class QnaService implements BoardService {

	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private FileDAO fileDAO;

	@Override
	public List<BoardDTO> selectList(ListData listData) throws Exception {
		int totalCount=qnaDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		return qnaDAO.selectList(listData);
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		return qnaDAO.selectOne(num);
	}

	
	public int insert(BoardDTO boardDTO, MultipartFile[] file, HttpSession session) throws Exception {
	 String filepath = session.getServletContext().getRealPath("resources/upload");
	 File f = new File(filepath);
	 if(!f.exists()){
		 f.mkdirs();
		 
	 }
	 int result=qnaDAO.insert(boardDTO);
		FileSaver fs = new FileSaver();
		for(int i=0;i<file.length;i++){
			FileDTO fileDTO=new FileDTO();
			String fname=fs.saver(file[i], filepath);
			fileDTO.setFname(fname);
			fileDTO.setOname(file[i].getOriginalFilename());
			fileDTO.setNum(boardDTO.getNum());
			int result2=fileDAO.insert(fileDTO);
		}
		
		
		return result;
	}


	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return qnaDAO.update(boardDTO);
	}

	@Override
	public int delete(int num, HttpSession session) throws Exception {
		return qnaDAO.delete(num);
	}

	public int replyInsert(BoardDTO boardDTO) throws Exception{
		qnaDAO.replyUpdate(boardDTO);
		return qnaDAO.replyInsert(boardDTO, boardDTO);
	}

	
	

	

	
	}

	


	
		
	

