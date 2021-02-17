package com.ezen.chord.schedule.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.files.service.impl.FilesServiceImpl;
import com.ezen.chord.schedule.dto.SchdDTO;
import com.ezen.chord.schedule.service.SchdService;
import com.ezen.chord.task.dto.TaskDTO;
import com.google.gson.Gson;

@Controller
public class SchdController {

	@Autowired
	SchdService schdService;
	
	@Autowired
	FilesServiceImpl file;
	
	@RequestMapping("/fullCalender.do")
	public ModelAndView fullCalender () {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/fullCalender");
		return mav;
	}
	@RequestMapping("/callCalender.do")
	@ResponseBody
	public void callCalender (@RequestParam(value = "mem_id",defaultValue = "0")int mem_id,
			HttpServletResponse response) {
		
		Map<String,Object> map = schdService.groupCalendarList(mem_id);
		Gson gson = new Gson();
		String json = "";
		json = gson.toJson(map);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/addCal.do")
	public ModelAndView addCal () {
		ModelAndView mav=new ModelAndView();
		String testmems[]= {"사람","터미네이터","사이코","장첸","뽀삐"};
		mav.addObject("members",testmems);
		mav.setViewName("schedule/addCal");
		return mav;
	}
	
	@RequestMapping("/schdUpdate.do")
	public ModelAndView schdUpdate (@RequestParam(value = "schd_no",defaultValue = "1")int schd_no,
			@RequestParam(value = "pro_no",defaultValue = "1") int pro_no,
			@RequestParam(value = "tu_mem_no",defaultValue = "1")int tu_mem_no,
			@RequestParam(value = "tim_cont",defaultValue = "")String tim_cont,
			@RequestParam(value = "datetime",defaultValue = "")String datetime,
			@RequestParam(value = "schd_loc",defaultValue = "")String schd_loc,
			@RequestParam(value = "schd_memo",defaultValue = "")String schd_memo,
			@RequestParam(value = "defaultDate",defaultValue = "")String defaultDate
			) {
		String start=null;
		String end=null;
		
		if(datetime.length()+12==defaultDate.length()||datetime.length()+10==defaultDate.length()) {
			 start=datetime.substring(0,16);
			 end=datetime.substring(21,37);
		}else {
			 start=defaultDate.substring(0,16);
			 end=defaultDate.substring(28,44);
		}
		
	
		schdService.updateTitle(schd_no, tim_cont);
		schdService.updateLocMemo(schd_no, schd_loc, schd_memo);
		schdService.updateTime(schd_no, start, end);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/listCal");
		return mav;
	}
	
	@RequestMapping("/listCal.do")
	public ModelAndView listCalender () {
		ModelAndView mav=new ModelAndView();
		SchdDTO schdDto=schdService.getSchdOne(49);
		mav.addObject("schdDto",schdDto);
		mav.setViewName("schedule/listCal");
		return mav;
	}
	
	
	
	@RequestMapping("/taktest.do")
	public ModelAndView addCal (@ModelAttribute SchdDTO dto ,
			@RequestParam(value = "participants",defaultValue = "")List<String> participants,
			@RequestParam(value = "datetime",defaultValue = "")String datetime
			){

		int seq=schdService.getSchdSeq();
		String start=datetime.substring(0,16);
		String end=datetime.substring(21,37);

		dto.setSchd_no(seq);
		dto.setCont_kind("schd");
		dto.setCont_no(seq);
		dto.setPro_no(19);
		
		System.out.println(participants);
		
		System.out.println(schdService.insertSchd(dto));
		System.out.println(schdService.insertTime(dto, start, end));
		System.out.println(schdService.insertTimeLine(dto));
		for(int i=0;i<participants.size();i++) {
			System.out.println(schdService.insertParti(dto)); ////////요건아직
		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/addCal");
		return mav;
	}

}
