package com.ph4.s1.lostReply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LostReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.lostReply.LostReplyDAO.";
	
	public List<LostReplyDTO> getList(LostReplyPager lostReplyPager){
		return sqlSession.selectList(NAMESPACE+"getList", lostReplyPager);
	}
	
	public long getCount(LostReplyPager lostReplyPager) {
		return sqlSession.selectOne(NAMESPACE+"getCount", lostReplyPager);
	}
	
	public int setDelete(LostReplyDTO lostReplyDTO) {
		return sqlSession.update(NAMESPACE+"setDelete", lostReplyDTO);
	}
	
	public int setInsert(LostReplyDTO lostReplyDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", lostReplyDTO);
	}
	
	public LostReplyDTO getOne(LostReplyDTO lostReplyDTO) {
		return sqlSession.selectOne(NAMESPACE+"getOne", lostReplyDTO);
	}
	
	public int setReplyUpdate(LostReplyDTO lostReplyDTO) {
		return sqlSession.update(NAMESPACE+"setReplyUpdate", lostReplyDTO);
	}
	
	public int setReply(LostReplyDTO lostReplyDTO) {
		return sqlSession.insert(NAMESPACE+"setReply", lostReplyDTO);
	}
	
}
