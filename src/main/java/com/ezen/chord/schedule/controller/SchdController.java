package com.ezen.chord.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.schedule.dto.SchdDTO;
import com.ezen.chord.schedule.sevice.impl.SchdServiceImpl;

@Controller
public class SchdController {

	@Autowired
	SchdServiceImpl schdSerImpl;
	
	@RequestMapping("/fullCalender.do")
	public ModelAndView fullCalender () {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/fullCalender");
		return mav;
	}
	@RequestMapping("/addCal.do")
	public ModelAndView addCal () {
		ModelAndView mav=new ModelAndView();
		String testmems[]= {"사람","터미네이터","사이코","장첸","뽀삐"};
		mav.addObject("members",testmems);
		mav.setViewName("schedule/addCal");
		return mav;
	}
	@RequestMapping("/taktest.do")
	public ModelAndView addCal (SchdDTO dto,
			@RequestParam(value = "participants",defaultValue = "")List<String> participants,
			@RequestParam(value = "datetime",defaultValue = "")String datetime) {
		System.out.println(datetime);
		int seq=schdSerImpl.getSchdSeq();
		System.out.println(schdSerImpl.insertSchd(dto,seq));
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/addCal");
		return mav;
	}
}
