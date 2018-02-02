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
	@Inject
	private FileDAO fileDAO;
	
	public int delete(int num, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		List<FileDTO> ar= fileDAO.selectList(num);
		int result=noticeDAO.delete(num);
		result = fileDAO.delete(num);
		for(FileDTO fileDTO: ar){
			try{
				File file = new File(filePath, fileDTO.getFname());
				file.delete();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
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
	
	public int insert(BoardDTO boardDTO, MultipartFile [] f1, HttpSession session) throws Exception{
		FileSaver fileSaver = new FileSaver();
		String filepath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filepath);
		if(!f.exists()){
			f.mkdirs();
		}
		int result = noticeDAO.insert(boardDTO);
		List<String> names = fileSaver.saver(f1, filepath);
		for(int i=0; i<names.size(); i++){
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFname(names.get(i));
			fileDTO.setOname(f1[i].getOriginalFilename());
			fileDTO.setNum(boardDTO.getNum());
			fileDAO.insert(fileDTO);
		}
		return result;
	}
	
	public int insert2(BoardDTO boardDTO, MultipartFile [] file, HttpSession session) throws Exception {
		FileSaver fileSaver = new FileSaver();
		int result = 0;
		String filepath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filepath);
		if(!f.exists()){
			f.mkdirs();
		}
		List<String> names = fileSaver.saver(file, filepath);
		for(int i=0; i<names.size(); i++){
			if(names.get(i)!=""){
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFname(names.get(i));
			fileDTO.setOname(file[i].getOriginalFilename());
			fileDTO.setNum(boardDTO.getNum());
			result = fileDAO.insert(fileDTO);
			}
		}
		return result;
	}

}
