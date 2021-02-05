package com.ezen.chord.files.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FilesDTO {

	private int file_no;  //파일 넘버
	private String file_name;  //파일 이름
	private String file_path;  //파일 경로
	private String file_upload;  //파일 업로드명(파일이름이 중복될수도 있으니)
	private String file_size; // 파일 크기
	private String file_kind; // 파일 종류
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date file_date;  // 업데이트 시간
	private String cont_kind; //컨텐츠 종류
	private int cont_no;  // 컨텐츠 번호
	private int mem_no;  // 맴버 번호
	private int pro_no;  // 프로젝트 번호 
	
	public FilesDTO() {
		// TODO Auto-generated constructor stub
	}

	public FilesDTO(int file_no, String file_name, String file_path, String file_upload, String file_size,
			String file_kind, Date file_date, String cont_kind, int cont_no, int mem_no, int pro_no) {
		super();
		this.file_no = file_no;
		this.file_name = file_name;
		this.file_path = file_path;
		this.file_upload = file_upload;
		this.file_size = file_size;
		this.file_kind = file_kind;
		this.file_date = file_date;
		this.cont_kind = cont_kind;
		this.cont_no = cont_no;
		this.mem_no = mem_no;
		this.pro_no = pro_no;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_upload() {
		return file_upload;
	}

	public void setFile_upload(String file_upload) {
		this.file_upload = file_upload;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public String getFile_kind() {
		return file_kind;
	}

	public void setFile_kind(String file_kind) {
		this.file_kind = file_kind;
	}

	public Date getFile_date() {
		return file_date;
	}

	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}

	public String getCont_kind() {
		return cont_kind;
	}

	public void setCont_kind(String cont_kind) {
		this.cont_kind = cont_kind;
	}

	public int getCont_no() {
		return cont_no;
	}

	public void setCont_no(int cont_no) {
		this.cont_no = cont_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	
}
