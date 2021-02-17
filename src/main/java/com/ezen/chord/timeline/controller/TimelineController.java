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

import com.ezen.chord.box.dto.BoxDTO;
import com.ezen.chord.box.service.BoxService;
import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.FilesService;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.schedule.dto.SchdDTO;
import com.ezen.chord.schedule.service.SchdService;
import com.ezen.chord.task.dto.TaskDTO;
import com.ezen.chord.task.service.TaskService;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;
import com.ezen.chord.todo.service.TodoService;

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
	private BoxService boxService;
	@Autowired
	private TodoService todoService;
	
	@RequestMapping("/timeLine.do")
	@ResponseBody
	public ModelAndView getTimeline(int pro_no,String pro_name,HttpSession sess,SchdDTO schdDTO) {
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
		List<BoxDTO> boxList = boxService.getBoxList(mem_no);
		List<BoxDTO> setBoxList = boxService.getBoxListJoinPro_no(mem_no,pro_no);
		mav.addObject("boxList", boxList);
		mav.addObject("setBoxList", setBoxList);
		//프로젝트 정보를 받기
		int page = 0; 
		TaskDTO taskDTO = new TaskDTO();
		List<TimelineDTO> list = timService.getTimelineByProNo(pro_no, page,mem_no);
		
		for(int i = 0 ; i < list.size() ; i++) {
			switch (list.get(i).getCont_kind()) {
			case "post":
				
				break;
			case "task":
				list.get(i).setTaskDTO(timService.getTask(list.get(i).getCont_no()));
				
				
				
				break;
				
			case "schd":
				list.get(i).setSchdDTO(schdService.getSchdOne(list.get(i).getCont_no()));
				System.out.println(list.get(i).getSchdDTO().partic.size());
				break;
			case "todo":
				list.get(i).setTodoDTO(null);
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
							@RequestParam(value="tu_mem_list",defaultValue = "1")List<Integer> tu_mem_list,
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
		
		/*시작,마감일*/
		int resultTaskDate = taskService.insertTaskDateService(taskDTO);
		
		if(tu_mem_list.get(0) == 1) {
			
		}else {
		for(int i = 0 ; i < tu_mem_list.size() ; i++) {
			System.out.println(tu_mem_list.get(i));
			taskDTO.setTu_mem_list(tu_mem_list.get(i));
			/*parti테이블관련(담당자)*/
			taskService.insertTaskPiService(taskDTO);
			
		}
		}
		
		
		
		
		
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/insertTimWithSchd.do")
	public String insertTimWithSchd(
							SchdDTO schdDTO,
							
							@RequestParam(value = "datetime",defaultValue = "")String datetime,
							@RequestParam(value = "tu_mem_list",defaultValue = "1")List<Integer> tu_mem_list,
							@RequestParam(value = "pro_no",defaultValue = "1")int pro_no,
							@RequestParam(value = "mem_no",defaultValue = "1")int mem_no ) {
		
		int schd_no = schdService.getSchdSeq();

		schdDTO.setSchd_no(schd_no);
		schdDTO.setCont_kind("schd");
		schdDTO.setCont_no(schd_no);
		schdDTO.setPro_no(pro_no);
		
		
		String start=datetime.substring(0,16);
		String end=datetime.substring(21,37);
	
		schdService.insertSchd(schdDTO);
		schdService.insertTime(schdDTO, start, end);
		schdService.insertTimeLine(schdDTO);
		
		if(tu_mem_list.get(0)==1) {
			
		}else {
			for(int i=0;i<tu_mem_list.size();i++) {
				schdDTO.setMem_no(tu_mem_list.get(i));
				schdService.insertParti(schdDTO); 
			}
		}
		
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
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
	
	@RequestMapping("/insertFix.do")
	public String insertFix(int mem_no,int tim_no,int pro_no) {
		timService.insertFix(mem_no, tim_no, pro_no);
		
		
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/deleteFix.do")
	public String deleteFix(int mem_no,int tim_no,int pro_no) {
		
		timService.deleteFix(mem_no, tim_no, pro_no);
		
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/insertColl.do")
	@ResponseBody
	public String insertColl(int mem_no,int tim_no,int pro_no) {
		timService.insertColl(mem_no, tim_no, pro_no);
		return "1";
	}
	@RequestMapping("/deleteColl.do")
	@ResponseBody
	public String deleteColl(int mem_no,int tim_no,int pro_no) {
		timService.deleteColl(mem_no, tim_no, pro_no);
		return "1";
	}
	
	
	@RequestMapping("/collection.do")
	public ModelAndView collection(HttpSession sess) {
		ModelAndView mav = new ModelAndView();
		int mem_no = (int)(sess.getAttribute("memNo"));
		//업로드 폴더 변경
		List<BoxDTO> boxList = boxService.getBoxList(mem_no);
		mav.addObject("boxList", boxList);
		//프로젝트 정보를 받기
		List<TimelineDTO> list = timService.getCollection(mem_no);
		
		for(int i = 0 ; i < list.size() ; i++) {
			switch (list.get(i).getCont_kind()) {
			case "post":
				
				break;
			case "task":
				list.get(i).setTaskDTO(timService.getTask(list.get(i).getCont_no()));
				break;
				
			case "schd":
				list.get(i).setSchdDTO(schdService.getSchdOne(list.get(i).getCont_no()));
				break;
			case "todo":
				//list.get(i).setTodoDTO(null);
			default:
				break;
			}
		}
		
		mav.addObject("list", list);
		mav.setViewName("project/collection");
		
		
		
		return mav;
	}
	
	
	
	
}
