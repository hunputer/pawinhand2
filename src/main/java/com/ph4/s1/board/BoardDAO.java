package com.ph4.s1.board;

import java.util.List;

import com.ph4.s1.util.Pager;


public interface BoardDAO {
	//abstract 메서드의 선언부
	
	//insert
	public int setInsert(BoardDTO boardDTO) throws Exception;
	
	//update
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	
	//delete
	public int setDelete(BoardDTO boardDTO) throws Exception;
	
	//list
	public List<BoardDTO> getList(Pager pager) throws Exception;
	
	//selectOne
	public BoardDTO getOne(BoardDTO boardDTO) throws Exception;
	
	//count
	public long getCount(Pager pager) throws Exception;
	
}
