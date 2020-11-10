package com.ph4.s1.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.ph4.s1.board.boardFile.BoardFileDTO;


@Component
public class FileDown extends AbstractView {
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		
		String board = (String)model.get("board");
		BoardFileDTO boardFileDTO = (BoardFileDTO)model.get("fileDTO");

		String path = request.getSession().getServletContext().getRealPath("/resources/upload/"+board+"/");
		System.out.println(boardFileDTO.getOriName());
		File file = new File(path, boardFileDTO.getFileName());
		
		//파일 한글 처리 
		response.setCharacterEncoding("UTF-8");
		
		//파일의 크기
		response.setContentLength((int)file.length());
		
		//다운로드시 파일 이름 인코딩
		String downName = URLEncoder.encode(boardFileDTO.getOriName(), "UTF-8");
		
		//header 설정
		response.setHeader("Content-Disposition", "attachment;fileName=\""+downName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//Client 전송
		FileInputStream fi = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fi, os);
		
		os.close();
		fi.close();
	}
	
}
