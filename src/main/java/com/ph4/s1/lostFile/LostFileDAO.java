package com.ph4.s1.lostFile;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.lost.LostDTO;

@Repository
public class LostFileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.lostFile.LostFileDAO.";
			
	public int setInsert(LostFileDTO lostFileDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", lostFileDTO);
	}
	
	public List<LostFileDTO> getFiles(LostDTO lostDTO) {
		return sqlSession.selectList(NAMESPACE+"getFiles", lostDTO);
	}
	
	public int setDelete(LostDTO lostDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", lostDTO);
	}
	
	public long getCount(LostDTO lostDTO) {
		return sqlSession.selectOne(NAMESPACE+"getCount", lostDTO);
	}
	
	public LostFileDTO getMain(LostDTO lostDTO) {
		return sqlSession.selectOne(NAMESPACE+"getMain", lostDTO);
	}
}
