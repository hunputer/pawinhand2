package com.ph4.s1.board.notice;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.board.BoardDTO;
import com.ph4.s1.board.BoardService;
import com.ph4.s1.board.boardFile.BoardFileDAO;
import com.ph4.s1.board.boardFile.BoardFileDTO;
import com.ph4.s1.util.FileSaver;
import com.ph4.s1.util.Pager;

@Service
public class NoticeService implements BoardService {

	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private BoardFileDAO boardFileDAO;
	
	public boolean summernoteDelete(String file, HttpSession session)throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/member");
		File file2 = new File(path, file);
		boolean result = false;
		if(file2.exists()) {
			result=file2.delete();
		}
		
		return result;
	}
	
	public String summernote(MultipartFile file, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/member/");
		File dest = new File(path);
		String fileName = fileSaver.save(dest, file);
		return fileName;
	}
	
	public int setInsert(BoardDTO boardDTO, MultipartFile[] files, HttpSession httpSession) throws Exception {
		
		int result = noticeDAO.setInsert(boardDTO);
		
		String path = httpSession.getServletContext().getRealPath("/resources/upload/notice");
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdir();
		}
		
		for(int i=0;i<files.length;i++) {
			if(i==0) {
				continue;
			}
			MultipartFile multipartFile = files[i];
			if( multipartFile.getSize() !=0) {
				String fileName = fileSaver.save(file, multipartFile);
				BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setFileName(fileName);
				boardFileDTO.setOriName(multipartFile.getOriginalFilename());
				boardFileDTO.setNum(boardDTO.getNum());
				boardFileDAO.setInsert(boardFileDTO);
			}
		}
		
		return result;
	}

	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files, HttpSession httpSession) throws Exception {
		int result = noticeDAO.setUpdate(boardDTO);
		result = boardFileDAO.setDelete(boardDTO);
		
		String path = httpSession.getServletContext().getRealPath("/resources/upload/notice");
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdir();
		}
		
		for(int i=0;i<files.length;i++) {
			if(i==0) {
				continue;
			}
			MultipartFile multipartFile = files[i];
			if( multipartFile.getSize() !=0) {
				String fileName = fileSaver.save(file, multipartFile);
				BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setFileName(fileName);
				boardFileDTO.setOriName(multipartFile.getOriginalFilename());
				boardFileDTO.setNum(boardDTO.getNum());
				boardFileDAO.setInsert(boardFileDTO);
			}
		}
		
		return result;
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		boardFileDAO.setDelete(boardDTO);
		return noticeDAO.setDelete(boardDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.setTotalCount(noticeDAO.getCount(pager));
		pager.makePage();
		return noticeDAO.getList(pager);
	}

	@Override
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception {
		return noticeDAO.getOne(boardDTO);
	}

}
