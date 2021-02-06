package com.ezen.chord.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SchdController {

	
	@RequestMapping("/fullCalender.do")
	public ModelAndView fullCalender () {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/fullCalender");
		return mav;
	}
	@RequestMapping("/addCal.do")
	public ModelAndView addCal () {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/addCal");
		return mav;
	}
}
