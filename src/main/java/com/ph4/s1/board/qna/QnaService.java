package com.ph4.s1.board.qna;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.board.BoardDTO;
import com.ph4.s1.board.BoardService;
import com.ph4.s1.board.boardFile.BoardFileDTO;
import com.ph4.s1.util.FileSaver;
import com.ph4.s1.util.Pager;

@Service
public class QnaService implements BoardService {

	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private FileSaver fileSaver;
	
	public boolean summernoteDelete(String file, HttpSession session)throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/qna");
		File file2 = new File(path, file);
		boolean result = false;
		if(file2.exists()) {
			result=file2.delete();
		}
		
		return result;
	}
	
	public String summernote(MultipartFile file, HttpSession session)throws Exception{
		//파일을 하드 디스크에 저장하고 저장된 파일명을 리턴
		String path = session.getServletContext().getRealPath("/resources/upload/qna");
		System.out.println(path);
		File dest = new File(path);
		String fileName = fileSaver.save(dest, file);
		return fileName;
	}
	
	public int setReply(BoardDTO boardDTO)throws Exception{
		int result = qnaDAO.setReplyUpdate(boardDTO);
		result = qnaDAO.setReply(boardDTO);
		return result;
	}


	public int setInsert(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		int result = qnaDAO.setInsert(boardDTO);
		
		String path = session.getServletContext().getRealPath("/resources/upload/qna/");
		File file = new File(path);
		
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
				qnaDAO.setInsertFile(boardFileDTO);
			}
		}
		
		return result;
	}
	
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = qnaDAO.setUpdate(boardDTO);
		result = qnaDAO.setDeleteFile(boardDTO);
		System.out.println(result);
		
		List<BoardFileDTO> ar = boardDTO.getBoardFileDTOs();
		
		String path = session.getServletContext().getRealPath("/resources/upload/qna/");
		File file = new File(path);
		
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
				qnaDAO.setInsertFile(boardFileDTO);
			}
		}
		
		return result;
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		int result = qnaDAO.setDeleteFile(boardDTO);
		result = qnaDAO.setDelete(boardDTO);
		return result;
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.setTotalCount(qnaDAO.getCount(pager));
		pager.makePage();
		return qnaDAO.getList(pager);
	}

	@Override
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getOne(boardDTO);
	}

}
