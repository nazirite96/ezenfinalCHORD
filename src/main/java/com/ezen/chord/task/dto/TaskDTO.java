package com.ezen.chord.task.dto;

import java.sql.*;

public class TaskDTO {
	
	private int task_no;				//업무번호
	private String task_title;			//업무명
	private String task_content;		//업무내용
	private String task_state;			//업무진행상황
	private String task_priority;		//업무우선순위
	private String time_kind;			//시작일,마감일
	private int mem_no;					//멤버번호
	private Date time_date;				//작성시간
	private int cont_no;				//컨텐츠번호
	
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


	public String getTime_kind() {
		return time_kind;
	}

	public void setTime_kind(String time_kind) {
		this.time_kind = time_kind;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}


	public TaskDTO(int task_no, String task_title, String task_content, String task_state, String task_priority,
			String time_kind, int mem_no, Date time_date, int cont_no) {
		super();
		this.task_no = task_no;
		this.task_title = task_title;
		this.task_content = task_content;
		this.task_state = task_state;
		this.task_priority = task_priority;
		this.time_kind = time_kind;
		this.mem_no = mem_no;
		this.time_date = time_date;
		this.cont_no = cont_no;
	}

	public Date getTime_date() {
		return time_date;
	}

	public void setTime_date(Date time_date) {
		this.time_date = time_date;
	}

	public int getCont_no() {
		return cont_no;
	}

	public void setCont_no(int cont_no) {
		this.cont_no = cont_no;
	}

	
	
	
	
}
