package com.ph4.s1.util;

import java.io.File;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	//save 메서드명
	public String save(File dest, MultipartFile photo) throws Exception{
		if(!dest.exists()) {
			dest.mkdir();
		}
		
		Calendar ca = Calendar.getInstance();
		long time = ca.getTimeInMillis();
		String name = time + "_" + photo.getOriginalFilename();
		dest = new File(dest, name);
		
		
		photo.transferTo(dest);
		
		return name;
	}
}
