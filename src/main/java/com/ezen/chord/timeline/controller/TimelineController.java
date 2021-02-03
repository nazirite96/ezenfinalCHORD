package com.ezen.chord.timeline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView getTimeline(int pro_no) {
		ModelAndView mav = new ModelAndView();
		//프로젝트 정보를 받기
		int page =0;
		int mem_no=2;
		List<TimelineDTO> list = timService.getTimelineByProNo(pro_no, page);
		mav.addObject("list", list);
		mav.addObject("pro_no", pro_no);
		mav.addObject("mem_no", mem_no);
		
		mav.setViewName("project/timeLine");
		
		
		
		return mav;
	}
	
	
	@RequestMapping("/insertTim.do")
	public String insertTim(TimelineDTO timDTO) {
		
		timDTO.setMem_no(2);
		int result = timService.insertTim(timDTO);
		
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no();
	}
	
	
	@RequestMapping("/updateTim.do")
	public String updateTim(TimelineDTO timDTO) {
		int result = timService.updateTim(timDTO);
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no();
	}
	
	@RequestMapping("/deleteTim.do")
	public String deleteTim(TimelineDTO timDTO) {
		int result = timService.deleteTim(timDTO);
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no();
	}
	
	
	@RequestMapping("/insertRep.do")
	public String insertRep(ReplyDTO repDTO,int pro_no) {
		int result = repService.insertRep(repDTO);
		return "redirect:/timeLine.do?pro_no="+pro_no;
	}
	
	@RequestMapping("/updateRep.do")
	public String updateRep(ReplyDTO repDTO,int pro_no) {
		int result = repService.updateRep(repDTO);
		return "redirect:/timeLine.do?pro_no="+pro_no;
	}
	
	
	
	
}
