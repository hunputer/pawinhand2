package com.ph4.s1.lostReply;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class LostReplyDTO {
	
	private long num;
	private long lostNum;
	private String id;
	private String contents;
	private Date regDate;
	private long ref;
	private long step;
	private long depth;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getLostNum() {
		return lostNum;
	}
	public void setLostNum(long lostNum) {
		this.lostNum = lostNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getRef() {
		return ref;
	}
	public void setRef(long ref) {
		this.ref = ref;
	}
	public long getStep() {
		return step;
	}
	public void setStep(long step) {
		this.step = step;
	}
	public long getDepth() {
		return depth;
	}
	public void setDepth(long depth) {
		this.depth = depth;
	}
	
}
