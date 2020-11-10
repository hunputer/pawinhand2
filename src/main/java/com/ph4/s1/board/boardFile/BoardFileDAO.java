package com.ph4.s1.board.boardFile;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.board.BoardDTO;


@Repository
public class BoardFileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.board.boardFile.BoardFileDAO.";
	
	public int setInsert(BoardFileDTO boardFileDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert",boardFileDTO);
	}
	
	public List<BoardFileDTO> getFiles(BoardDTO boardDTO) {
		return sqlSession.selectList(NAMESPACE+"getFiles", boardDTO);
	}
	
	public int setDelete(BoardDTO boardDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete",boardDTO);
	}
}
