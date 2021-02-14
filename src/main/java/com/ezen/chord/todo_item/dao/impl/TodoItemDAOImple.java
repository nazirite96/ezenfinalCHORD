package com.ezen.chord.todo_item.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.todo_item.dao.TodoItemDAO;
import com.ezen.chord.todo_item.dto.TodoItemDTO;

@Repository("todoItemDAO")
public class TodoItemDAOImple implements TodoItemDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TodoItemDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int insertTodoItemDAO(TodoItemDTO tiDTO) {
		int result = sqlMap.insert("insertTodoItem", tiDTO);
		return result;
	}
	
	@Override
	public List<TodoItemDTO> getTodoItemListDAO(int todo_no) {
		
		return sqlMap.selectList("getTodoItemList", todo_no);
	}
}
