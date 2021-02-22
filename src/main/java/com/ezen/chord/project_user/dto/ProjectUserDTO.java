package com.ezen.chord.project_user.dto;

import java.sql.Date;

public class ProjectUserDTO {
	
	
	private int pro_no; //프로젝트 번호
	private int mem_no; //참석자
	private String pro_user_man_chk;	//참여자가 관리자인지 체크
	private java.sql.Date pro_user_date; //프로젝트 참여일;
	private String pro_user_color; //프로젝트 개인 설정;
	private String pro_name;		//조인 프로젝트 - 프로젝트 이름
	private String pro_cont;		//조인 프로젝트 - 프로젝트 내용
	private java.sql.Date pro_date; //조인 프로젝트 - 프로젝트 생성
	
	private int imp_chk;			//중요 체크
	private int cont_no;
	private String mem_name;
	
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public ProjectUserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectUserDTO(int pro_no, int mem_no, String pro_user_man_chk, Date pro_user_date, String pro_user_color) {
		super();
		this.pro_no = pro_no;
		this.mem_no = mem_no;
		this.pro_user_man_chk = pro_user_man_chk;
		this.pro_user_date = pro_user_date;
		this.pro_user_color = pro_user_color;
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
	public void setPro_user_date(java.sql.Date pro_user_date) {
		this.pro_user_date = pro_user_date;
	}
	public String getPro_user_color() {
		return pro_user_color;
	}
	public void setPro_user_color(String pro_user_color) {
		this.pro_user_color = pro_user_color;
	}
	public int getImp_chk() {
		return imp_chk;
	}
	public void setImp_chk(int imp_chk) {
		this.imp_chk = imp_chk;
	}
	public int getCont_no() {
		return cont_no;
	}
	public void setCont_no(int cont_no) {
		this.cont_no = cont_no;
	}
	
}
