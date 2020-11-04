package com.ph4.s1.lost;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LostDAO {

	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.lost.LostDAO.";
	
	public int setInsert(LostDTO lostDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert",lostDTO);
	}
	
	public LostDTO getOne(LostDTO lostDTO) {
		return sqlSession.selectOne(NAMESPACE+"getOne", lostDTO);
	}
	
	public int setDelete(LostDTO lostDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", lostDTO);
	}
	
	public int setUpdate(LostDTO lostDTO) {
		return sqlSession.update(NAMESPACE+"setUpdate", lostDTO);
	}
}
