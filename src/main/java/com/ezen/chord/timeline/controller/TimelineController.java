package com.ezen.chord.timeline.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.FilesService;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;

@Controller
public class TimelineController {
	
	@Autowired
	private TimelineService timService;
	@Autowired
	FilesService fileService;
	
	
	@RequestMapping("/timeLine.do")
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
		for(int i = 0 ; i < list.size() ; i++) {
			switch (list.get(i).getCont_kind()) {
			case "post":
				
				break;
			case "task":
				list.get(i).setTaskDTO(timService.getTask(list.get(i).getCont_no()));
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
							
							HttpServletRequest request) {
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		
		int result = timService.insertTim(timDTO);
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
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
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	
}
