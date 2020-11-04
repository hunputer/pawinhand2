package com.ph4.s1.lostFile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ph4.s1.lost.LostDTO;

@Service
public class LostFileService {
	
	@Autowired
	private LostFileDAO lostFileDAO;
	
	public List<LostFileDTO> getFiles(LostDTO lostDTO) {
		return lostFileDAO.getFiles(lostDTO);
	}
	
	public int setInsert(LostFileDTO lostFileDTO) {
		return lostFileDAO.setInsert(lostFileDTO);
	}
	
	public int setDelete(LostDTO lostDTO) {
		return lostFileDAO.setDelete(lostDTO);
	}
	
	public long getCount(LostDTO lostDTO) {
		return lostFileDAO.getCount(lostDTO);
	}
}
