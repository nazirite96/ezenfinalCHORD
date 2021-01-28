package com.ezen.chord.project_user.dto;

public class ProjectUserDTO {
	
	private int pro_no; //프로젝트 번호
	private int mem_no; //참석자
	private String pro_user_man_chk;//참여자가 관리자인지 체크
	private java.util.Date pro_user_date; //프로젝트 참여일;
	private String pro_user_color; //프로젝트 개인 설정;
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getPro_user_man_chk() {
		return pro_user_man_chk;
	}
	public void setPro_user_man_chk(String pro_user_man_chk) {
		this.pro_user_man_chk = pro_user_man_chk;
	}
	public java.util.Date getPro_user_date() {
		return pro_user_date;
	}
	public void setPro_user_date(java.util.Date pro_user_date) {
		this.pro_user_date = pro_user_date;
	}
	public String getPro_user_color() {
		return pro_user_color;
	}
	public void setPro_user_color(String pro_user_color) {
		this.pro_user_color = pro_user_color;
	}
	
	
	
	//PRO_NO, MEM_NO, PRO_USER_MAN_CHK, PRO_USER_DATE, PRO_USER_COLOR
}
