package com.ph4.s1.lost;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.lostFile.LostFileDAO;
import com.ph4.s1.lostFile.LostFileDTO;
import com.ph4.s1.lostFile.LostFileService;
import com.ph4.s1.lostReply.LostReplyPager;
import com.ph4.s1.lostReply.LostReplyService;

@Controller
@RequestMapping("/lost/**")
public class LostController {
	
	@Autowired
	private LostService lostService;
	@Autowired
	private LostFileService lostFileService;
	@Autowired
	private LostReplyService lostReplyService;
	
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
		LostReplyPager pager = new LostReplyPager();
		pager.setLostNum(lostDTO.getNum());
		long replyCount = lostReplyService.getCount(pager);
		mv.addObject("replyCount", replyCount);
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
	
	@GetMapping("lostList")
	public ModelAndView lostList(LostDTO lostDTO, String sDate, String eDate) {
		ModelAndView mv = new ModelAndView();
		if(lostDTO.getLostProvince() == null) {
			lostDTO.setLostProvince("");
		}
		if(lostDTO.getAnimalSpecies() == null) {
			lostDTO.setAnimalSpecies("");
		}
		if(sDate != null) {
			if(!sDate.equals("")) {
				System.out.println(1111);
				lostDTO.setStartDate(Date.valueOf(sDate));
			}
		}
		if(eDate != null) {
			if(!eDate.equals("")) {
				System.out.println(2222);
				lostDTO.setEndDate(Date.valueOf(eDate));
			}
		}
		System.out.println(sDate);
		System.out.println(eDate);
		List<LostDTO> ar = lostService.getList(lostDTO);
		mv.addObject("lostDTO", lostDTO);
		mv.addObject("lists", ar);
		mv.setViewName("lost/lostList");
		return mv;
	}
	
}
