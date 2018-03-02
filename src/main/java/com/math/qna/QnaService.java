package com.math.qna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.math.board.BoardDTO;
import com.math.board.BoardService;
import com.math.file.FileDAO;
import com.math.file.FileDTO;
import com.math.util.FileSaver;
import com.math.util.ListData;
import com.math.util.PageMaker;

@Service
public class QnaService{
	
	@Inject
	private QnaDAO qnaDAO;
	@Inject
	private FileDAO fileDAO;
	
	
	public List<BoardDTO> selectList(ListData listData) throws Exception {
		int totalCount=qnaDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		return qnaDAO.selectList(listData);
	}

	
	public ModelAndView selectOne(int num) throws Exception {
		BoardDTO boardDTO=qnaDAO.selectOne(num);
		FileDTO fileDTO = fileDAO.selectOne(num);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("board", boardDTO);
		mv.addObject("file", fileDTO);
		
		return mv;
	}

	
	public int insert(QnaDTO qnaDTO, MultipartFile f1, HttpSession session) throws Exception {
		System.out.println("QnaService");
		FileSaver fileSaver = new FileSaver();
		String filepath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filepath);
		if(!f.exists()){
			f.mkdirs();
		}
		int result = qnaDAO.insert(qnaDTO);
		String name = fileSaver.saver(f1, filepath);
		System.out.println(name);
		System.out.println("fileName:");
		
		if(!f1.getOriginalFilename().equals("")){
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFname(name);
			fileDTO.setOname(f1.getOriginalFilename());
			fileDTO.setNum(qnaDTO.getNum());
			fileDAO.insert(fileDTO);
		}else{
			
		}
		return result;
	}


	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	public int delete(int num, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
