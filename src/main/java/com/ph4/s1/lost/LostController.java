package com.ph4.s1.lost;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.lostFile.LostFileDAO;
import com.ph4.s1.lostFile.LostFileDTO;
import com.ph4.s1.lostFile.LostFileService;

@Controller
@RequestMapping("/lost/**")
public class LostController {
	
	@Autowired
	private LostService lostService;
	@Autowired
	private LostFileService lostFileService;
	
	@GetMapping("lostWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lost/lostWrite");
		return mv;
	}
	
	@PostMapping("lostWrite")
	public ModelAndView setInsert(LostDTO lostDTO, String date, String[] files) throws Exception{
		ModelAndView mv = new ModelAndView();
		lostDTO.setLostDate(Date.valueOf(date));
		int result = lostService.setInsert(lostDTO, files);
		mv.setViewName("lost/lostInsertClose");
		return mv;
	}
	
	@GetMapping("lostSelect")
	public ModelAndView getOne(LostDTO lostDTO) {
		ModelAndView mv = new ModelAndView();
		LostDTO dto = lostService.getOne(lostDTO);
		List<LostFileDTO> files = lostFileService.getFiles(lostDTO);
		mv.addObject("dto", dto);
		mv.addObject("files", files);
		mv.setViewName("lost/lostSelect");
		return mv;
	}
	
	@GetMapping("lostDelete")
	public ModelAndView setDelete(LostDTO lostDTO, HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		int result = lostService.setDelete(lostDTO, httpSession);
		mv.setViewName("redirect:./lostList");
		return mv;
	}
	
	@GetMapping("lostUpdate")
	public ModelAndView setUpdate(LostDTO lostDTO) {
		ModelAndView mv = new ModelAndView();
		LostDTO dto = lostService.getOne(lostDTO);
		mv.addObject("dto", dto);
		mv.setViewName("/lost/lostUpdate");
		return mv;
	}
	
	@PostMapping("lostUpdate")
	public ModelAndView setUpdate2(LostDTO lostDTO, String[] files, String date) {
		ModelAndView mv = new ModelAndView();
		lostDTO.setLostDate(Date.valueOf(date));
		int result = lostService.setUpdate(lostDTO);
		long num = lostDTO.getNum();
		
		long count = lostFileService.getCount(lostDTO);
		
		if(count > 0) {
			result = lostFileService.setDelete(lostDTO);
		}
		LostFileDTO lostFileDTO = new LostFileDTO();
		lostFileDTO.setNum(num);
		for(String fileName : files) {
			lostFileDTO.setFileName(fileName);
			String oriName = fileName.substring(fileName.lastIndexOf("_")+1);
			lostFileDTO.setOriName(oriName);
			System.out.println(oriName);
			result = lostFileService.setInsert(lostFileDTO);
		}
		mv.setViewName("lost/lostUpdateClose");
		return mv;
	}
	
	@PostMapping("fileSave")
	public ModelAndView fileSave(LostFileDTO lostFileDTO, MultipartFile file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("fileSave");
		String fileName = lostService.fileSave(lostFileDTO, file, session);
		mv.addObject("fileName", fileName);
		mv.setViewName("lost/lostFileName");
		return mv;
	}
}
