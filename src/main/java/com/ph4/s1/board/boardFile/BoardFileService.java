package com.ph4.s1.board.boardFile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ph4.s1.board.BoardDTO;

@Service
public class BoardFileService {
	
	@Autowired
	private BoardFileDAO boardFileDAO;
	
	public List<BoardFileDTO> getFile(BoardDTO boardDTO) {
		return boardFileDAO.getFiles(boardDTO);
	}
}
