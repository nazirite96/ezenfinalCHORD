package com.ezen.chord.task.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.task.service.imple.*;
import com.ezen.chord.task.dao.TaskDAO;
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
	
	@RequestMapping("/taskTest3.do")
	public String TaskTest3() {
		
		return "task/taskTest3";
	}
	
	@Autowired
	private TaskServiceImple taskService;
	
	@Autowired
	private TaskDAO taskDAO;
	
	/** userService 랑 fileService autowried 해와야함
	 * ,@RequestParam(value="mem_id", required = false)List<String> MemIdList
	 * ,@RequestParam(value="articeFile", required = false) List<MultipartFile> fileList
							,@RequestParam(value="imageFile", required = false) List<MultipartFile> imgList
	 * */
	
	@RequestMapping("/taskInsert.do")
	public ModelAndView taskInsert(TaskDTO taskDTO,HttpSession session) throws IllegalStateException, IOException{
		
		ModelAndView mav = new ModelAndView();
		
		
		// 업무 시퀀스 조회
		int task_no = taskService.getTaskSeq();
		System.out.println(task_no+"컨트롤러");
		taskDTO.setTask_no(task_no);		
		int resultCnt = taskService.insertTaskService(taskDTO);
		if(resultCnt==1) {

			System.out.println(resultCnt+"컨트롤러");
			mav.addObject("msg", "글이 등록되었습니다.");
			mav.setViewName("task/taskTest3");
			
		}
		
		return mav;
		
	}
	
	
}
