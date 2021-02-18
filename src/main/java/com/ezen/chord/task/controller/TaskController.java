package com.ezen.chord.task.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.FilesService;
import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project.service.ProjectService;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.task.dao.TaskDAO;
import com.ezen.chord.task.dto.TaskDTO;
import com.ezen.chord.task.service.TaskService;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;


@Controller
public class TaskController {
	
	@Autowired
	private TimelineService timService;
	
	@Autowired
	private ProjectService proService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private FilesService fileService;
	
	@Autowired
	private TaskDAO taskDAO; 
	

	@RequestMapping("/taskTest.do")
	public ModelAndView getProList(int mem_no,HttpSession session) {
		
		
		ModelAndView mav = new ModelAndView();
		List<ProjectUserDTO> proList = proService.getProAllList(mem_no);
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
		// 전체 업무 리스트 조회
		List<TaskDTO> taskList = taskService.selectAllTask();
		mav.addObject("taskList", taskList);
		
		List<TimelineDTO> list = timService.getTimelineByProNo(pro_no, page,mem_no);
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
	
	@RequestMapping("/taskUpdate.do")
	public String updateTimWithTask(TimelineDTO timDTO ,
							FilesDTO filesDTO ,
							TaskDTO editDTO,
							@RequestParam(value="tu_mem_list", defaultValue = "1")List<Integer> tu_mem_list,
							@RequestParam("articleFile")List<MultipartFile> files,
							@RequestParam(value="del_task_user_no", required=false)List<Integer> delTuList,
							HttpServletRequest request) {
		
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		
		TaskDTO taskDTO = taskDAO.getTaskDTO(editDTO.getTask_no());
		
		taskDTO.setCont_kind("task");
		
		
		// 업무 담당자 삭제
//		if (delTuList != null) {
//			for (Integer task_user_no : delTuList) {
//				taskService.deleteTaskUserService(task_user_no);
//			}			
//		}
		
		System.out.println(editDTO.getTim_cont()+"수정된 제목");
		System.out.println(editDTO.getTask_state()+"수정된 진행상황");
		System.out.println(editDTO.getTask_start_date()+"수정된 시작일");
		System.out.println(editDTO.getTask_end_date()+"수정된 마감일");
		System.out.println(editDTO.getTu_mem_list()+"담당자 들어온거");
		System.out.println(editDTO.getTask_priority()+"우선순위 들어온거");
		System.out.println(editDTO.getTask_content()+"글내용 들어온거");
		
		
		if(editDTO.getTask_state() != null ) {
			taskDTO.setTask_state(editDTO.getTask_state());
		}
		
		
		
		/*시작일 수정*/
		if(!editDTO.getTask_start_date().equals("") || editDTO.getTask_start_date() != null) {
			
			if(editDTO.getTask_start_date() == null || editDTO.getTask_start_date().equals("")) {
				editDTO.setTask_start_date("1990-01-01");
			}
			
			taskDTO.setTask_start_date(editDTO.getTask_start_date());
			
			int result = taskDAO.updateTaskStartDateDAO(taskDTO);
		}
		
		/*마감일 수정*/
		if(!editDTO.getTask_end_date().equals("") || editDTO.getTask_end_date() != null) {
			
			if(editDTO.getTask_end_date() == null || editDTO.getTask_end_date().equals("")) {
				editDTO.setTask_end_date("1990-01-01");
			}
			taskDTO.setTask_end_date(editDTO.getTask_end_date());
			
			int result = taskDAO.updateTaskEndDateDAO(taskDTO);
		}

		// 우선순위
		if (!editDTO.getTask_priority().equals("") && editDTO.getTask_priority() != null) {
			taskDTO.setTask_priority(editDTO.getTask_priority());
		}else { 			
			taskDTO.setTask_priority("");			
		}
		
		// 내용
		if(!editDTO.getTask_content().equals("") && editDTO.getTask_content() != null) {
			taskDTO.setTask_content(editDTO.getTask_content());
		}else {
			taskDTO.setTask_content("");			
		}		
		
		
		
		String serv =request.getSession().getServletContext().getRealPath("/");
		
		filesDTO.setCont_kind("tim");
		
		filesDTO.setPro_no(timDTO.getPro_no());
		filesDTO.getFile();
		if(files != null) {
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					String name=fileService.checkName(file);
					String original=file.getOriginalFilename();
					Long number=file.getSize();
					String size=fileService.returnFileSize(number);
					fileService.copyInto(file, name,serv);
					fileService.insertFile(filesDTO, original, name, size, mem_no);
				}
			}
		}
		timDTO.setTim_cont(editDTO.getTim_cont());
		timDTO.setTim_no(editDTO.getTim_no());
		int result2 = timService.updateTim(timDTO);
		
		
		int resultCnt = taskService.updateTaskService(taskDTO);
//
//		if(resultCnt == 1) {
//			
//			for(int i = 0 ; i < tu_mem_list.size() ; i++) {
//				System.out.println(tu_mem_list.get(i));
//				taskDTO.setTu_mem_list(tu_mem_list.get(i));
//				/*parti테이블관련(담당자)*/
//				taskService.insertTaskPiService(taskDTO);
//				
//			}
//		}
//	
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
}
	
	@RequestMapping("/updateTaskState.do")
	public String taskStateUpdate(@RequestParam("task_no")int task_no
							 , @RequestParam("task_state")String task_state
							 , @RequestParam("pro_no")int pro_no
							 , TimelineDTO timDTO
							 , HttpSession session
							 , HttpServletRequest request){
		
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		
		
		// 업무글 상세조회
		TaskDTO taskDTO = taskDAO.getTaskDTO(task_no);
		taskDTO.setTask_state(task_state);	// 업무상태
		
		if (taskDTO.getTask_start_date() == null) {
			taskDTO.setTask_start_date("");
		}
		if (taskDTO.getTask_end_date() == null) {
			taskDTO.setTask_end_date("");
		}
		if (taskDTO.getTask_priority() == null) {
			taskDTO.setTask_priority("");
		}
		if (taskDTO.getTask_content() == null) {
			taskDTO.setTask_content("");
		}
		
		// 업무글 수정
		int resultCnt = taskService.updateTaskService(taskDTO);
		
		if (resultCnt == 1) {
			
			session.setAttribute("msg", "상태값이 변경되었습니다.");
			session.setAttribute("className", "alert-warning");
		}
		
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}	
	
	
	
	
}
