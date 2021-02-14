package com.ezen.chord.todo_item.dto;

import java.util.*;
import com.ezen.chord.todo_item.dto.*;

public class MultiTodo {
	
	public List<TodoItemDTO> tiList;
	
	public List<TodoItemDTO> tiUpdateList;
	
	public List<TodoItemDTO> getTiList() {
		return tiList;
	}

	public void setTiList(List<TodoItemDTO> tiList) {
		this.tiList = tiList;
	}

	public List<TodoItemDTO> getTiUpdateList() {
		return tiUpdateList;
	}

	public void setTiUpdateList(List<TodoItemDTO> tiUpdateList) {
		this.tiUpdateList = tiUpdateList;
	}
}
