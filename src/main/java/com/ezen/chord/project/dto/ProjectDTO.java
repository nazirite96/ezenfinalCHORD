package com.ezen.chord.project.dto;

import java.sql.Date;

public class ProjectDTO {
	
	private int pro_no; 			//프로젝트 번호
	private String pro_name;		//프로젝트 명
	private String pro_cont;		//프로젝트 설명
	private java.sql.Date pro_date;	//프로젝트 등록일
	private int kind_no;			//분류코드
	private int mem_no;				//개설자
	
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_cont() {
		return pro_cont;
	}
	public void setPro_cont(String pro_cont) {
		this.pro_cont = pro_cont;
	}
	public java.sql.Date getPro_date() {
		return pro_date;
	}
	public void setPro_date(java.sql.Date pro_date) {
		this.pro_date = pro_date;
	}
	public int getKind_no() {
		return kind_no;
	}
	public void setKind_no(int kind_no) {
		this.kind_no = kind_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	@Override
	public String toString() {
		return pro_no+" "+pro_name+" "+pro_cont+" "+pro_date+" "+kind_no+" "+mem_no;
	}

}
