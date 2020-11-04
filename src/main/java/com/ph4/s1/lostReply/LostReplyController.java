package com.ph4.s1.lostReply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lostReply/**")
public class LostReplyController {
	
	@Autowired
	private LostReplyService lostReplyService;
	
	@GetMapping("lostReplyList")
	public ModelAndView getList(LostReplyPager lostReplyPager) {
		ModelAndView mv = new ModelAndView();
		System.out.println(lostReplyPager.getCurPage());
		List<LostReplyDTO> ar = lostReplyService.getList(lostReplyPager);
		mv.addObject("lists", ar);
		mv.addObject("pager", lostReplyPager);
		mv.setViewName("lost/lostReply/lostReplyList");
		return mv;
	}
	
	@GetMapping("lostReplyDelete")
	public ModelAndView setDelete(LostReplyDTO lostReplyDTO) {
		ModelAndView mv = new ModelAndView();
		int result = lostReplyService.setDelete(lostReplyDTO);
		long num = lostReplyDTO.getLostNum();
		mv.setViewName("redirect:../lost/lostSelect?num="+num);
		return mv;
	}
	
	@PostMapping("lostReplyInsert")
	public ModelAndView setInsert(LostReplyDTO lostReplyDTO) {
		ModelAndView mv = new ModelAndView();
		int result = lostReplyService.setInsert(lostReplyDTO);
		long num = lostReplyDTO.getLostNum();
		mv.setViewName("redirect:../lost/lostSelect?num="+num);
		return mv;
	}
	
	@GetMapping("reply")
	public ModelAndView setReply(LostReplyDTO lostReplyDTO) {
		ModelAndView mv = new ModelAndView();
		String contents = lostReplyDTO.getContents();
		String id = lostReplyDTO.getId();
		LostReplyDTO dto = lostReplyService.getOne(lostReplyDTO);
		dto.setContents(contents);
		dto.setId(id);
		int result = lostReplyService.setReply(dto);
		long num = dto.getLostNum();
		mv.setViewName("redirect:../lost/lostSelect?num="+num);
		return mv;
	}
	
	
}
