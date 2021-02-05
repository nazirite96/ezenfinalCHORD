package com.ezen.chord.timeline.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.project_user.service.ProjectUserService;
import com.ezen.chord.reply.dto.ReplyDTO;
import com.ezen.chord.reply.service.ReplyService;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;

@Controller
public class TimelineController {
	
	@Autowired
	private TimelineService timService;
	
	@Autowired
	private ReplyService repService;
	
	
	
	@RequestMapping("/timeLine.do")
	public ModelAndView getTimeline(int pro_no,int mem_no) {
		ModelAndView mav = new ModelAndView();
		ProjectUserDTO proUserDTO = timService.getPro(pro_no,mem_no);
		mav.addObject("proUserDTO", proUserDTO);
		//프로젝트 정보를 받기
		int page = 0; 
		
		List<TimelineDTO> list = timService.getTimelineByProNo(pro_no, page);
		mav.addObject("list", list);
		mav.addObject("mem_no", mem_no);
		mav.setViewName("project/timeLine");
		
		
		
		return mav;
	}
	
	
	@RequestMapping("/insertTim.do")
	public String insertTim(TimelineDTO timDTO ,HttpSession sess) {
		
		int result = timService.insertTim(timDTO);
		int mem_no = (int)sess.getAttribute("memNo");
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
	
	
	@RequestMapping("/insertRep.do")
	public String insertRep(ReplyDTO repDTO,int pro_no,HttpSession sess) {
		int result = repService.insertRep(repDTO);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/updateRep.do")
	public String updateRep(ReplyDTO repDTO,int pro_no,HttpSession sess) {
		int result = repService.updateRep(repDTO);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/deleteRep.do")
	public String deleteRep(int rep_no,int pro_no,HttpSession sess) {
		int result = repService.deleteRep(rep_no);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
	
	
}
