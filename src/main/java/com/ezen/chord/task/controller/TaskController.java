package com.ezen.chord.task.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@Autowired
	private TimelineServiceImpl timelineService;
	
	/** userService 랑 fileService autowried 해와야함
	 * ,@RequestParam(value="mem_id", required = false)List<String> MemIdList
	 * ,@RequestParam(value="articeFile", required = false) List<MultipartFile> fileList
							,@RequestParam(value="imageFile", required = false) List<MultipartFile> imgList
	 * */
	
	@RequestMapping("/taskInsert.do")
	public ModelAndView taskInsert(HttpSession session
			,@RequestParam(value="time_start_date",required = false,defaultValue = " ")String time_start_date
			,@RequestParam(value="time_end_date",required = false,defaultValue = " ")String time_end_date
			,@RequestParam(value="task_priority",required = false,defaultValue = " ")String task_priority
			,@RequestParam(value="task_content",required = false,defaultValue = " ")String task_content
			,@ModelAttribute TaskDTO taskDTO) throws IllegalStateException, IOException{
		
		ModelAndView mav = new ModelAndView();
		
		int task_no = taskService.getTaskSeq();
		
		taskDTO.setCont_kind("업무");
		
		taskDTO.setTask_no(task_no);
		taskDTO.setCont_no(task_no);
		
		int resultCnt = taskService.insertTaskService(taskDTO);
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
		mav.setViewName("task/taskView");
		
		return mav;
		
	}
	
	
}
