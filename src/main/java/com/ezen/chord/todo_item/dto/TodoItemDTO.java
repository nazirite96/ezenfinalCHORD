package com.ezen.chord.todo_item.dto;

import java.util.List;

import com.ezen.chord.project_user.dto.ProjectUserDTO;

public class TodoItemDTO {
	
	private int todo_item_no;				//할일항목번호
	private String todo_item_content; 		//할일항목 내용
	private	String todo_item_chk;			//할일항목 체크
	private String todo_item_date;			//할힐항목 시간
	private int ti_mem_no;					//담당자테이블 mem_no 번호
	private int todo_no;					//할일번호
	private int ti_mem_id;					//담당자테이블 mem_no 번호
	
	private String mem_name;
		
	
	
	public TodoItemDTO() {
		super();
	}

	public int getTodo_item_no() {
		return todo_item_no;
	}

	public void setTodo_item_no(int todo_item_no) {
		this.todo_item_no = todo_item_no;
	}

	public String getTodo_item_content() {
		return todo_item_content;
	}

	public void setTodo_item_content(String todo_item_content) {
		this.todo_item_content = todo_item_content;
	}

	public String getTodo_item_chk() {
		return todo_item_chk;
	}

	public void setTodo_item_chk(String todo_item_chk) {
		this.todo_item_chk = todo_item_chk;
	}

	public String getTodo_item_date() {
		return todo_item_date;
	}

	public void setTodo_item_date(String todo_item_date) {
		this.todo_item_date = todo_item_date;
	}

	public int getTodo_no() {
		return todo_no;
	}

	public void setTodo_no(int todo_no) {
		this.todo_no = todo_no;
	}
	
	

	public int getTi_mem_no() {
		return ti_mem_no;
	}

	public void setTi_mem_no(int ti_mem_no) {
		this.ti_mem_no = ti_mem_no;
	}

	public int getTi_mem_id() {
		return ti_mem_id;
	}

	public void setTi_mem_id(int ti_mem_id) {
		this.ti_mem_id = ti_mem_id;
	}


	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	

	public TodoItemDTO(int todo_item_no, String todo_item_content, String todo_item_chk, String todo_item_date,
			int ti_mem_no, int todo_no, int ti_mem_id, String mem_name) {
		super();
		this.todo_item_no = todo_item_no;
		this.todo_item_content = todo_item_content;
		this.todo_item_chk = todo_item_chk;
		this.todo_item_date = todo_item_date;
		this.ti_mem_no = ti_mem_no;
		this.todo_no = todo_no;
		this.ti_mem_id = ti_mem_id;
		this.mem_name = mem_name;
	}

	






	
	
}
