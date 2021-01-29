package com.ezen.chord.timeline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TimelineController {

	
	@RequestMapping("timeLine.do")
	public ModelAndView getTimeline(int pro_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/timeLine");
		
		return mav;
	}
	
}
