package com.ezen.chord.company.dto;

public class CompanyDTO {

	private int com_no;
	private String com_name;
	private String com_pwd;
	private String com_sector;
	
	
	public CompanyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public CompanyDTO(int com_no, String com_name, String com_pwd, String com_sector) {
		super();
		this.com_no = com_no;
		this.com_name = com_name;
		this.com_pwd = com_pwd;
		this.com_sector = com_sector;
	}


	public int getCom_no() {
		return com_no;
	}


	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}


	public String getCom_name() {
		return com_name;
	}


	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}


	public String getCom_pwd() {
		return com_pwd;
	}


	public void setCom_pwd(String com_pwd) {
		this.com_pwd = com_pwd;
	}


	public String getCom_sector() {
		return com_sector;
	}


	public void setCom_sector(String com_sector) {
		this.com_sector = com_sector;
	}
	
	
	
}
