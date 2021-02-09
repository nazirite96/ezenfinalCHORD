package com.ezen.chord.schedule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.schedule.dto.SchdDTO;
import com.ezen.chord.schedule.sevice.impl.SchdServiceImpl;
import com.ezen.chord.task.dto.TaskDTO;

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
	public ModelAndView addCal (@ModelAttribute SchdDTO dto ,
			@RequestParam(value = "participants",defaultValue = "")String participants,
			@RequestParam(value = "datetime",defaultValue = "")String datetime
			){

		int seq=schdSerImpl.getSchdSeq();
		String start=datetime.substring(0,16);
		String end=datetime.substring(21,37);

		dto.setSchd_no(seq);
		dto.setCont_kind("schedule");
		dto.setCont_no(seq);
		dto.setPro_no(19);
		
		
//		System.out.println(schdSerImpl.insertSchd(dto));
//		System.out.println(schdSerImpl.insertTime(dto, start, end));
//		System.out.println(schdSerImpl.insertTimeLine(dto));
//		String listno[]=participants.split(",");
//		for(int i=0;i<listno.length;i++) {
//			System.out.println(schdSerImpl.insertParti(dto));
//		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/addCal");
		return mav;
	}

}
