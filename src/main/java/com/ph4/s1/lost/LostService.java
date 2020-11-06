package com.ph4.s1.lost;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.lostFile.LostFileDAO;
import com.ph4.s1.lostFile.LostFileDTO;
import com.ph4.s1.util.FileSaver;

@Service
public class LostService {
	
	@Autowired
	private LostDAO lostDAO;
	@Autowired
	private LostFileDAO lostFileDAO;
	@Autowired
	private FileSaver fileSaver;
	
	public int setInsert(LostDTO lostDTO, String[] files) throws Exception{
		int result = lostDAO.setInsert(lostDTO);
		LostFileDTO lostFileDTO = new LostFileDTO();
		lostFileDTO.setNum(lostDTO.getNum());
		for(String fileName : files) {
			if(fileName != "") {
				lostFileDTO.setFileName(fileName);
			    String oriName = fileName.substring(fileName.lastIndexOf("_")+1);
				lostFileDTO.setOriName(oriName);
				result = lostFileDAO.setInsert(lostFileDTO);
			}
		}
		return result;
	}
	
	public LostDTO getOne(LostDTO lostDTO) {
		return lostDAO.getOne(lostDTO);
	}
	
	public int setDelete(LostDTO lostDTO, HttpSession httpSession) {
		
		List<LostFileDTO> files = lostFileDAO.getFiles(lostDTO);
		String path = httpSession.getServletContext().getRealPath("/resources/upload/lost/");
		File dest = new File(path);
		
		for(LostFileDTO dto : files) {
			File file = new File(dest,dto.getFileName());
			if(file.exists()) {
				file.delete();
			}
		}
		
		int result = lostFileDAO.setDelete(lostDTO);
		result = lostDAO.setDelete(lostDTO);
		
		return result;
	}
	
	public int setUpdate(LostDTO lostDTO) {
		return lostDAO.setUpdate(lostDTO);
	}
	
	public String fileSave(LostFileDTO lostFileDTO, MultipartFile file, HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/lost/");
		System.out.println(path);
		File file2 = new File(path);
		String fileName = "";
		
		if(!file2.exists()) {
			file2.mkdir();
		}
		
		int	result = 0;
		if(file.getOriginalFilename() != "") {
			fileName = fileSaver.save(file2, file);
		}
		
		return fileName;
	}
	
	public List<LostDTO> getList(){
		List<LostDTO> ar = lostDAO.getList();
		for(LostDTO dto : ar) {
			LostFileDTO fileDTO = lostFileDAO.getMain(dto);
			dto.setFileName(fileDTO.getFileName());
		}
		return ar;
	}
	
}
