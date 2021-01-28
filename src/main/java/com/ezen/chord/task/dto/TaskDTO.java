package com.ezen.chord.task.dto;

import java.sql.*;

public class TaskDTO {
	
	private int task_no;				//업무번호
	private String task_title;			//업무명
	private String task_content;		//업무내용
	private String task_state;			//업무진행상황
	private String task_priority;		//업무우선순위
	
	public TaskDTO() {
		super();
	}

	public TaskDTO(int task_no, String task_title, String task_content, String task_state, String task_priority) {
		super();
		this.task_no = task_no;
		this.task_title = task_title;
		this.task_content = task_content;
		this.task_state = task_state;
		this.task_priority = task_priority;
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
	
	
}
