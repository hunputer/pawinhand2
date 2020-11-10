package com.ph4.s1.board.notice;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.board.BoardDTO;
import com.ph4.s1.board.boardFile.BoardFileDTO;
import com.ph4.s1.board.boardFile.BoardFileService;
import com.ph4.s1.util.Pager;

@Controller
@RequestMapping(value = "/notice/**")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private BoardFileService boardFileService;
	
	@PostMapping("summernoteDelete")
	public ModelAndView summernoteDelete(String file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = noticeService.summernoteDelete(file, session);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("noticeWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardWrite");
		mv.addObject("board", "notice");
		
		return mv;
	}
	
	@GetMapping("noticeList")
	public ModelAndView getList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = noticeService.getList(pager);
		
		mv.addObject("board", "notice");
		mv.addObject("lists", ar);
		mv.addObject("pager", pager);
		System.out.println("Notice List");
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	@PostMapping("summernote")
	public ModelAndView summernote(MultipartFile file, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		
		String fileName = noticeService.summernote(file, session);
		String name = session.getServletContext().getContextPath()+File.separator;
		name = name+"resources"+File.separator+"upload"+File.separator;
		name = name+"member"+File.separator+fileName;
		mv.addObject("msg", name);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("noticeWrite")
	public ModelAndView setInsert(NoticeDTO noticeDTO, MultipartFile[] files, HttpSession httpSession) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setInsert(noticeDTO, files, httpSession);
		String msg = "insert fail";
		if(result > 0) {
			msg = "insert Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "./noticeList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("noticeSelect")
	public ModelAndView getOne(NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = noticeService.getOne(noticeDTO);
		List<BoardFileDTO> boardFileDTOs = boardFileService.getFile(boardDTO); 
		mv.addObject("board", "notice");
		mv.addObject("dto", boardDTO);
		mv.addObject("files", boardFileDTOs);
		mv.addObject("path", "./noticeList");
		mv.setViewName("board/boardSelect");
		
		return mv;
	}
	
	@GetMapping("noticeUpdate")
	public ModelAndView setUpdate(long num) throws Exception{
		ModelAndView mv = new ModelAndView();
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNum(num);
		BoardDTO boardDTO = noticeService.getOne(noticeDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/boardUpdate");
		mv.addObject("board", "notice");
		
		return mv;
		
	}
	
	@PostMapping("noticeUpdate")
	public ModelAndView setUpdate(NoticeDTO noticeDTO, MultipartFile[] files, HttpSession httpSession ) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setUpdate(noticeDTO, files, httpSession);
		String msg = "update fail";
		if(result > 0) {
			msg = "update Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "./noticeList");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("noticeDelete")
	public ModelAndView setDelete(NoticeDTO noticeDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setDelete(noticeDTO);
		String msg = "delete fail";
		if(result > 0) {
			msg = "delete Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "./noticeList");
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("fileDown")
	public ModelAndView fileDown(BoardFileDTO boardFileDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "notice");
		mv.addObject("fileDTO", boardFileDTO);
		mv.setViewName("fileDown");
		return mv;
	}
}
