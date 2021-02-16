package com.ezen.chord.box.dto;

public class BoxDTO {
	
	private int box_no;//박스번호
	private String box_name;//박스이름
	private java.sql.Date box_date;//박스 생성일
	private int mem_no; //박스주인
	
	
	private int pro_no; //조인으로 확인
	
	public BoxDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	
	
	public int getBox_no() {
		return box_no;
	}
	public void setBox_no(int box_no) {
		this.box_no = box_no;
	}
	public String getBox_name() {
		return box_name;
	}
	public void setBox_name(String box_name) {
		this.box_name = box_name;
	}
	public java.sql.Date getBox_date() {
		return box_date;
	}
	public void setBox_date(java.sql.Date box_date) {
		this.box_date = box_date;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

}
