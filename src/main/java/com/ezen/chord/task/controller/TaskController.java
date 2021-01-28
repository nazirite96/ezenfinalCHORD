package com.ezen.chord.task.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.chord.task.service.imple.*;
import com.ezen.chord.task.dto.*;

import java.io.IOException;
import java.util.*;

@Controller
public class TaskController {

	
	@RequestMapping("/taskTest.do")
	public String TaskTest() {
		
		return "task/taskTest";
	}
	
	@RequestMapping("/taskTest2.do")
	public String TaskTest2() {
		
		return "task/taskTest2";
	}
	
	@Autowired
	private TaskServiceImple taskService;
	
	/** userService 랑 fileService autowried 해와야함
	 * ,@RequestParam(value="mem_id", required = false)List<String> MemIdList
	 * ,@RequestParam(value="articeFile", required = false) List<MultipartFile> fileList
							,@RequestParam(value="imageFile", required = false) List<MultipartFile> imgList
	 * */
	
	@RequestMapping("/taskInsert.do")
	public String taskInsert(TaskDTO taskDTO,HttpSession session) throws IllegalStateException, IOException{
		
		// 업무 시퀀스 조회
		int task_no = taskService.getTaskSeq();
		
		int resultCnt = taskService.insertTask(taskDTO);
		
		return "redirect:/";
		
	}
	
	
}
