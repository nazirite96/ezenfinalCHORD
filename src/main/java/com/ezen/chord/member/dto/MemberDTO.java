package com.ezen.chord.member.dto;

import java.sql.Date;

public class MemberDTO {

	private int mem_no;
	private String mem_email;
	private String mem_name;
	private String mem_pwd;
	private Date mem_date;
	private int com_no;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int mem_no, String mem_email, String mem_name, String mem_pwd, Date mem_date, int com_no) {
		super();
		this.mem_no = mem_no;
		this.mem_email = mem_email;
		this.mem_name = mem_name;
		this.mem_pwd = mem_pwd;
		this.mem_date = mem_date;
		this.com_no = com_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public Date getMem_date() {
		return mem_date;
	}

	public void setMem_date(Date mem_date) {
		this.mem_date = mem_date;
	}

	public int getCom_no() {
		return com_no;
	}

	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	
	
	
	
}
