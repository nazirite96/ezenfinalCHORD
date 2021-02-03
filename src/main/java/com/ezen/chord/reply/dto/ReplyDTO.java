package com.ezen.chord.reply.dto;

import java.sql.Date;

public class ReplyDTO {
	
	private int rep_no;				//댓글번호
	private String rep_cont;		//댓글내용
	private java.sql.Date rep_date;	//작성일시
	private int mem_no;				//멤버넘버
	private int tim_no;				//타임라인 인덱스
	
	
	
	public ReplyDTO() {
		super();
	}
	
	
	public ReplyDTO(int rep_no, String rep_cont, Date rep_date, int mem_no, int tim_no) {
		super();
		this.rep_no = rep_no;
		this.rep_cont = rep_cont;
		this.rep_date = rep_date;
		this.mem_no = mem_no;
		this.tim_no = tim_no;
	}


	public int getRep_no() {
		return rep_no;
	}
	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}
	public String getRep_cont() {
		return rep_cont;
	}
	public void setRep_cont(String rep_cont) {
		this.rep_cont = rep_cont;
	}
	public java.sql.Date getRep_date() {
		return rep_date;
	}
	public void setRep_date(java.sql.Date rep_date) {
		this.rep_date = rep_date;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getTim_no() {
		return tim_no;
	}
	public void setTim_no(int tim_no) {
		this.tim_no = tim_no;
	}
	
	
}
