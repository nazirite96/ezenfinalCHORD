package com.ezen.chord.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project.service.ProjectService;
import com.ezen.chord.project_user.service.ProjectUserService;

@Controller
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	
	//프로젝트 참여자 정보
	@Autowired
	private ProjectUserService proUserService;
	//프로젝트 정보
	@Autowired
	private ProjectService proService;
	//보관함 정보
	
	//중요한 정보
	
	
	@RequestMapping("/proList.do")
	public ModelAndView getProList(int mem_no) {
		
		mem_no=2;
		ModelAndView mav = new ModelAndView();
		List<ProjectDTO> proList = proService.getProAllList(mem_no);
		mav.addObject("proList", proList);
		mav.setViewName("project/projectList");
		
		return mav;
	}
	
	@RequestMapping("/insertPro.do")
	public String insertPro(ProjectDTO proDTO) {
		proService.insertPro(proDTO);
		
		return "project/projectList";
	}
	
	
}
