package com.ezen.chord.task.dto;

import java.sql.*;

import org.springframework.format.annotation.DateTimeFormat;

public class TaskDTO {
	
	private int task_no;				//업무번호
	private String task_title;			//업무명
	private String task_content;		//업무내용
	private String task_state;			//업무진행상황
	private String task_priority;		//업무우선순위
	
	private String task_start_date;		//시작일 시간
	private String task_end_date;		//마감일 시간
	
	
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
	
	public TaskDTO() {
		super();
	}

	public int getTask_no() {
		return task_no;
	}

	public void setTask_no(int task_no) {
		this.task_no = task_no;
	}

	public String getTask_title() {
		return task_title;
	}

	public void setTask_title(String task_title) {
		this.task_title = task_title;
	}

	public String getTask_content() {
		return task_content;
	}

	public void setTask_content(String task_content) {
		this.task_content = task_content;
	}

	public String getTask_state() {
		return task_state;
	}

	public void setTask_state(String task_state) {
		this.task_state = task_state;
	}

	public String getTask_priority() {
		return task_priority;
	}

	public void setTask_priority(String task_priority) {
		this.task_priority = task_priority;
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

	

	public String getTask_start_date() {
		return task_start_date;
	}

	public void setTask_start_date(String task_start_date) {
		this.task_start_date = task_start_date;
	}

	public String getTask_end_date() {
		return task_end_date;
	}

	public void setTask_end_date(String task_end_date) {
		this.task_end_date = task_end_date;
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

	public TaskDTO(int task_no, String task_title, String task_content, String task_state, String task_priority,
			String task_start_date, String task_end_date, int mem_no, int cont_no, String cont_kind, int tim_no,
			String tim_cont, Date tim_date, int pro_no, String mem_email, String mem_name, String pro_name) {
		super();
		this.task_no = task_no;
		this.task_title = task_title;
		this.task_content = task_content;
		this.task_state = task_state;
		this.task_priority = task_priority;
		this.task_start_date = task_start_date;
		this.task_end_date = task_end_date;
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
