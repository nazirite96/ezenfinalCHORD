package com.ezen.chord.task_user.dto;

public class TaskUserDTO {
	
	private int task_no;	//업무번호

	public int getTask_no() {
		return task_no;
	}

	public void setTask_no(int task_no) {
		this.task_no = task_no;
	}

	public TaskUserDTO(int task_no) {
		super();
		this.task_no = task_no;
	}
	
	
}
