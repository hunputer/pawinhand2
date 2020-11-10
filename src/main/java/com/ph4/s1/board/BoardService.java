package com.ph4.s1.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.util.Pager;


public interface BoardService {
		
		//delete
		public int setDelete(BoardDTO boardDTO) throws Exception;
		
		//list
		public List<BoardDTO> getList(Pager pager) throws Exception;
	
		//one
		public BoardDTO getOne(BoardDTO boardDTO) throws Exception;
		
}
