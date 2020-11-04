package com.ph4.s1.lostFile;

import org.springframework.stereotype.Component;

@Component
public class LostFileDTO {
	private long num;
	private String fileName;
	private String oriName;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	
}
