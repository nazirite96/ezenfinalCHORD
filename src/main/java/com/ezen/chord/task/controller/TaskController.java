package com.ezen.chord.task.controller;

import javax.servlet.http.HttpSession;

import org.apache.naming.java.javaURLContextFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.task.service.imple.*;
import com.ezen.chord.task.dao.TaskDAO;
import com.ezen.chord.task.dto.*;

import com.ezen.chord.timeline.dto.*;
import com.ezen.chord.timeline.service.impl.*;

import java.io.IOException;
import java.util.*;
import java.sql.*;
import java.sql.Date;

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
	
	@RequestMapping("/taskView.do")
	public String TaskView() {
		return "task/taskView";
	}
	@RequestMapping("/taskBasic.do")
	public String taskBasic(@RequestParam(value = "mem_email",required = false,defaultValue = "jj@naver.com")String mem_email, Model model) {
		
		System.out.println(mem_email);
		// 전체 업무 리스트 조회
		List<Map<String, Object>> taskList = taskService.selectAllTask(mem_email);
		model.addAttribute("taskList", taskList);
		
		return "task/taskBasic";
	}
	@Autowired
	private TaskServiceImple taskService;
	
	@Autowired
	private TaskDAO taskDAO;
	
	@Autowired
	private TimelineServiceImpl timelineService;
	
	/** userService 랑 fileService autowried 해와야함
	 * ,@RequestParam(value="mem_id", required = false)List<String> MemIdList
	 * ,@RequestParam(value="articeFile", required = false) List<MultipartFile> fileList
	   ,@RequestParam(value="imageFile", required = false) List<MultipartFile> imgList
	 * */
	
	@RequestMapping("/taskInsert.do")
	public ModelAndView taskInsert(HttpSession session
			,@ModelAttribute TaskDTO taskDTO) throws IllegalStateException, IOException{
		
		ModelAndView mav = new ModelAndView();
		
		int task_no = taskService.getTaskSeq();
		
		taskDTO.setCont_kind("task");
		taskDTO.setTask_no(task_no);
		taskDTO.setCont_no(task_no);
		taskDTO.setMem_no(11);
		taskDTO.setPro_no(49);
		
		/*task테이블관련*/
		int resultTask = taskService.insertTaskService(taskDTO);
		
		/*parti테이블관련*/
		int resultTaskPi = taskService.insertTaskPiService(taskDTO);
		
		/*시작날짜,마감날짜,시작마감일*/
		if(taskDTO.getTask_start_date() != null && taskDTO.getTask_end_date().equals("")) {
			int resultTaskStart = taskService.insertTaskStartDateService(taskDTO);	
		}else if(taskDTO.getTask_end_date() != null && taskDTO.getTask_start_date().equals("")) {
			int resultTaskEnd = taskService.insertTaskEndDateService(taskDTO);	
		}else if(!taskDTO.getTask_start_date().equals("") && !taskDTO.getTask_end_date().equals("")) {
			int resultTaskDate = taskService.insertTaskDateService(taskDTO);
		}
		/*타임라인관련*/
		int resultTaskTim = taskService.insertTaskTimService(taskDTO);
		
		//1. seq.nextval을 가져와
		//2. task insert (taskno 필수)
		// dao.insertTask
		//3. parti insert(taskno 필수)
		// dao.insertpart
		// 3-0. (업데이트) 내용을 지웠을 떄  == > delete
		// 3-1. 담당자 지정했을때
		//4.
		
//		if ( sdate  != null && edate == null ) {
//			// 4-1. s만 있을때
//		} else if ( sdate == null && edate != null )
//			// 4-2. e만 있을 떄
//		else if (s) {
//			//4-3. 둘다 있을때
//		}
		
		
		
		
		mav.addObject("msg", "ㅇㅇㅇㅇㅇㅇㅇㅇ");
		mav.setViewName("taskView.do");
		
		return mav;
		
	}
	
	
}
