package com.ph4.s1.lostReply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LostReplyService {
	
	@Autowired
	private LostReplyDAO lostReplyDAO;
	
	public List<LostReplyDTO> getList(LostReplyPager lostReplyPager){
		lostReplyPager.makeRow();
		lostReplyPager.setTotalCount(lostReplyDAO.getCount(lostReplyPager));
		lostReplyPager.makePage();
		
		return lostReplyDAO.getList(lostReplyPager);
	}
	
	public int setDelete(LostReplyDTO lostReplyDTO) {
		return lostReplyDAO.setDelete(lostReplyDTO);
	}
	
	public int setInsert(LostReplyDTO lostReplyDTO) {
		return lostReplyDAO.setInsert(lostReplyDTO);
	}
	
	public LostReplyDTO getOne(LostReplyDTO lostReplyDTO) {
		return lostReplyDAO.getOne(lostReplyDTO);
	}
	
	public int setReply(LostReplyDTO lostReplyDTO) {
		int result = lostReplyDAO.setReplyUpdate(lostReplyDTO);
		result = lostReplyDAO.setReply(lostReplyDTO);
		return result;
	}
	
	public long getCount(LostReplyPager lostReplyPager) {
		return lostReplyDAO.getCount(lostReplyPager);
	}
}
