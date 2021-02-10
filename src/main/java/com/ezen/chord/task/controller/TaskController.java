package com.ezen.chord.task.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.task.service.imple.*;
import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project.service.ProjectService;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.task.dao.TaskDAO;
import com.ezen.chord.task.dto.*;

import com.ezen.chord.timeline.dto.*;
import com.ezen.chord.timeline.service.TimelineService;
import com.ezen.chord.timeline.service.impl.*;

import java.io.IOException;
import java.util.*;
import java.sql.*;
import java.sql.Date;

@Controller
public class TaskController {
	
	@Autowired
	private TimelineService timService;
	
	@Autowired
	private ProjectService proService;
	
	@RequestMapping("/taskTest.do")
	public ModelAndView getProList(int mem_no,HttpSession session) {
		
		
		ModelAndView mav = new ModelAndView();
		List<ProjectDTO> proList = proService.getProAllList(mem_no);
		mav.addObject("mem_no", mem_no);
		
		mav.addObject("proList", proList);
		mav.setViewName("task/taskTest");
		
		return mav;
	}
	
	@RequestMapping("/taskTest_1.do")
	public ModelAndView getTimeline(int pro_no,HttpSession sess) {
		ModelAndView mav = new ModelAndView();
		int mem_no = (int)(sess.getAttribute("memNo"));
		int com_no = (int)(sess.getAttribute("comNo"));
		ProjectUserDTO proUserDTO = timService.getPro(pro_no,mem_no);
		List<ProjectUserDTO> invitedProUserList = timService.invitedProUserList(pro_no);
		List<ProjectUserDTO> notInvitedProUserList = timService.notInvitedProUserList(pro_no, com_no);
		mav.addObject("notInvitedProUserList", notInvitedProUserList);
		mav.addObject("invitedProUserList", invitedProUserList);
		mav.addObject("proUserDTO", proUserDTO);
		//프로젝트 정보를 받기
		int page = 0; 
		
		List<TimelineDTO> list = timService.getTimelineByProNo(pro_no, page);
		mav.addObject("list", list);
		mav.addObject("mem_no", mem_no);
		mav.setViewName("task/taskTest_1");
		
		
		
		return mav;
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
	public String taskBasic(Model model) {
		
		// 전체 업무 리스트 조회
		List<TaskDTO> taskList = taskService.selectAllTask();
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
		
		/*시작,마감일*/
		int resultTaskDate = taskService.insertTaskDateService(taskDTO);
		
		/*타임라인관련*/
		int resultTaskTim = taskService.insertTaskTimService(taskDTO);
		
		/*시작날짜,마감날짜,시작마감일
		if(taskDTO.getTask_start_date() != null && taskDTO.getTask_end_date().equals("")) {
			int resultTaskStart = taskService.insertTaskStartDateService(taskDTO);	
		}else if(taskDTO.getTask_end_date() != null && taskDTO.getTask_start_date().equals("")) {
			int resultTaskEnd = taskService.insertTaskEndDateService(taskDTO);	
		}else if(!taskDTO.getTask_start_date().equals("") && !taskDTO.getTask_end_date().equals("")) {
			
		}*/
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
		
		mav.setViewName("taskView.do");
		
		return mav;
		
	}
	
	
}
