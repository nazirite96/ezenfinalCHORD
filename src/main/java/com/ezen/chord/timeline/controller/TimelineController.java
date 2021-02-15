package com.ezen.chord.timeline.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.FilesService;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.schedule.dto.SchdDTO;
import com.ezen.chord.schedule.service.SchdService;
import com.ezen.chord.task.dto.TaskDTO;
import com.ezen.chord.task.service.TaskService;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;
import com.ezen.chord.todo.dto.TodoDTO;
import com.ezen.chord.todo.service.TodoService;
import com.ezen.chord.todo_item.dto.MultiTodo;
import com.ezen.chord.todo_item.dto.TodoItemDTO;
import com.ezen.chord.todo_item.service.TodoItemService;

@Controller
public class TimelineController {
	
	@Autowired
	private TimelineService timService;
	@Autowired
	private FilesService fileService;
	@Autowired
	private TaskService taskService;
	@Autowired 
	private SchdService schdService;
	@Autowired
	private TodoService todoService;
	@Autowired
	private TodoItemService todoItemService;	
	
	
	@RequestMapping("/timeLine.do")
	@ResponseBody
	public ModelAndView getTimeline(int pro_no,String pro_name,HttpSession sess) {
		ModelAndView mav = new ModelAndView();
		int mem_no = (int)(sess.getAttribute("memNo"));
		int com_no = (int)(sess.getAttribute("comNo"));
		//업로드 폴더 변경
		fileService.changePro(pro_name);
		ProjectUserDTO proUserDTO = timService.getPro(pro_no,mem_no);
		List<ProjectUserDTO> invitedProUserList = timService.invitedProUserList(pro_no);
		List<ProjectUserDTO> notInvitedProUserList = timService.notInvitedProUserList(pro_no, com_no);
		mav.addObject("notInvitedProUserList", notInvitedProUserList);
		mav.addObject("invitedProUserList", invitedProUserList);
		mav.addObject("proUserDTO", proUserDTO);
		//프로젝트 정보를 받기
		int page = 0; 
		
		List<TimelineDTO> list = timService.getTimelineByProNo(pro_no, page);
		for(int i = 0 ; i < list.size() ; i++) {
			switch (list.get(i).getCont_kind()) {
			case "post":
				
				break;
			case "task":
				list.get(i).setTaskDTO(timService.getTask(list.get(i).getCont_no()));
				break;
				
			case "schd":
				list.get(i).setSchdDTO(schdService.getSchdOne(list.get(i).getCont_no()));
			case "todo":
				//
				break;
			default:
				break;
			}
		}
		
		mav.addObject("list", list);
		mav.addObject("mem_no", mem_no);
		mav.setViewName("project/timeLine");
		
		
		
		return mav;
	}
	
	
	@RequestMapping("/insertTim.do")
	public String insertTim(TimelineDTO timDTO ,
							FilesDTO filesDTO ,
							@RequestParam("articleFile")List<MultipartFile> files,
							HttpServletRequest request) {
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		
		String serv =request.getSession().getServletContext().getRealPath("/");
		int tim_no = timService.getTimSeq();
		timDTO.setTim_no(tim_no);
		
		filesDTO.setCont_kind("tim");
		filesDTO.setCont_no(tim_no);
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
		int result = timService.insertTim(timDTO);
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/insertTimWithTask.do")
	public String insertTimWithTask(TimelineDTO timDTO ,
							FilesDTO filesDTO ,
							TaskDTO taskDTO,
							@RequestParam("tu_mem_list")List<Integer> tu_mem_list,
							@RequestParam("articleFile")List<MultipartFile> files,
							HttpServletRequest request) {
		
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		int task_no = taskService.getTaskSeq();
		
		String serv =request.getSession().getServletContext().getRealPath("/");
		int tim_no = timService.getTimSeq();
		timDTO.setTim_no(tim_no);
		timDTO.setCont_no(task_no);
		
		filesDTO.setCont_kind("tim");
		
		filesDTO.setCont_no(tim_no);
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
		int result = timService.insertTim(timDTO);
		
		taskDTO.setTask_no(task_no);
		taskDTO.setCont_no(task_no);
		taskDTO.setTask_title(timDTO.getTim_cont());
		/*task테이블관련*/
		int resultTask = taskService.insertTaskService(taskDTO);
		
		/*parti테이블관련*/
		int resultTaskPi = taskService.insertTaskPiService(taskDTO);
		
		/*시작,마감일*/
		int resultTaskDate = taskService.insertTaskDateService(taskDTO);
		/*타임라인관련*/
		// int resultTaskTim = taskService.insertTaskTimService(taskDTO);
		
		for(int i = 0 ; i < tu_mem_list.size() ; i++) {
			System.out.println(tu_mem_list.get(i));
		}
		
		
		
		
		
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/insertTimWithSchd.do")
	public String insertTimWithSchd(TimelineDTO timDTO ,
							FilesDTO filesDTO ,
							SchdDTO schdDTO,
							@RequestParam(value = "datetime",defaultValue = "")String datetime,
							@RequestParam("tu_mem_list")List<Integer> tu_mem_list,
							@RequestParam("articleFile")List<MultipartFile> files,
							HttpServletRequest request) {
		
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		int schd_no = schdService.getSchdSeq();
		
		String serv =request.getSession().getServletContext().getRealPath("/");
		int tim_no = timService.getTimSeq();
		timDTO.setTim_no(tim_no);
		timDTO.setCont_no(schd_no);
		
		filesDTO.setCont_kind("tim");
		
		filesDTO.setCont_no(tim_no);
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
		int result = timService.insertTim(timDTO);
		
		schdDTO.setSchd_no(schd_no);
		String start=datetime.substring(0,16);
		String end=datetime.substring(21,37);
		schdDTO.setCont_kind("schedul");
		schdDTO.setCont_no(schd_no);
	
		
		for(int i = 0 ; i < tu_mem_list.size() ; i++) {
			System.out.println(tu_mem_list.get(i));
		}
		System.out.println(schdService.insertSchd(schdDTO));
		System.out.println(schdService.insertTime(schdDTO, start, end));
		System.out.println(schdService.insertTimeLine(schdDTO));
		
		
		
		
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	
	@RequestMapping("/timInsertwithTodo.do")
	public String todoInsert(TimelineDTO timDTO,
			TodoDTO todoDTO,
			MultiTodo multiTodo,
			HttpSession session){
		
		int tim_no = timService.getTimSeq();
		int todo_no = todoService.getTodoSeq();
		timDTO.setCont_no(todo_no);
		timDTO.setTim_no(tim_no);
		
		
		todoDTO.setCont_kind("todo");
		todoDTO.setTodo_no(todo_no);
		todoDTO.setCont_no(todo_no);
		todoDTO.setMem_no(timDTO.getMem_no());
		todoDTO.setPro_no(timDTO.getPro_no());		
		int result = timService.insertTim(timDTO);
		System.out.println(result);
		int insertCnt = todoService.insertTodoService(todoDTO);
		
		List<TodoItemDTO> tiList = multiTodo.getTiList();
		
		for(TodoItemDTO tiDTO : tiList) {
			System.out.println(todo_no+"컨트롤러");
			tiDTO.setTodo_no(todo_no);
			System.out.println(tiDTO.getTodo_item_content());
			
			todoItemService.insertTodoItemService(tiDTO);
		}
		
		
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+timDTO.getMem_no();
	}
	
	
	
	
	@RequestMapping("/updateTim.do")
	public String updateTim(TimelineDTO timDTO ,HttpSession sess) {
		int result = timService.updateTim(timDTO);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/deleteTim.do")
	public String deleteTim(TimelineDTO timDTO ,HttpSession sess) {
		int result = timService.deleteTim(timDTO);
		System.out.println(timDTO.getTim_no());
		System.out.println(result);
		
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	
	
	
	
}
