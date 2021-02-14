package com.ezen.chord.todo.dto;

import java.sql.Date;

public class TodoDTO {

	private int todo_no;
	private String todo_title;
	
	
	private int mem_no;					//멤버번호
	private int cont_no;				//컨텐츠번호
	private String cont_kind;			//컨텐츠분류
	private int tim_no;					//타임라인 인덱스
	private String tim_cont;			//업무시 업무 제목
	private Date tim_date;				//게시글 작성시간
	private int pro_no;					//프로젝트번호
	private String mem_email;			//멤버이메일
	private String mem_name;			//멤버이름
	private String pro_name;			//프로젝트명
	
	public TodoDTO() {
		super();
	}
	
	public int getTodo_no() {
		return todo_no;
	}
	public void setTodo_no(int todo_no) {
		this.todo_no = todo_no;
	}
	public String getTodo_title() {
		return todo_title;
	}
	public void setTodo_title(String todo_title) {
		this.todo_title = todo_title;
	}
	
	
	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getCont_no() {
		return cont_no;
	}

	public void setCont_no(int cont_no) {
		this.cont_no = cont_no;
	}

	public String getCont_kind() {
		return cont_kind;
	}

	public void setCont_kind(String cont_kind) {
		this.cont_kind = cont_kind;
	}

	public int getTim_no() {
		return tim_no;
	}

	public void setTim_no(int tim_no) {
		this.tim_no = tim_no;
	}

	public String getTim_cont() {
		return tim_cont;
	}

	public void setTim_cont(String tim_cont) {
		this.tim_cont = tim_cont;
	}

	public Date getTim_date() {
		return tim_date;
	}

	public void setTim_date(Date tim_date) {
		this.tim_date = tim_date;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
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

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public TodoDTO(int todo_no, String todo_title, int mem_no, int cont_no, String cont_kind, int tim_no,
			String tim_cont, Date tim_date, int pro_no, String mem_email, String mem_name, String pro_name) {
		super();
		this.todo_no = todo_no;
		this.todo_title = todo_title;
		this.mem_no = mem_no;
		this.cont_no = cont_no;
		this.cont_kind = cont_kind;
		this.tim_no = tim_no;
		this.tim_cont = tim_cont;
		this.tim_date = tim_date;
		this.pro_no = pro_no;
		this.mem_email = mem_email;
		this.mem_name = mem_name;
		this.pro_name = pro_name;
	}

	
	
	
}
