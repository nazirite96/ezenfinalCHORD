package com.ezen.chord.project.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project.service.ProjectService;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
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
	public ModelAndView getProList(int mem_no,HttpSession session) {
		
		
		ModelAndView mav = new ModelAndView();
		List<ProjectDTO> proList = proService.getProAllList(mem_no);
		mav.addObject("mem_no", mem_no);
		
		mav.addObject("proList", proList);
		mav.setViewName("project/projectList");
		
		return mav;
	}
	
	@RequestMapping("/insertPro.do")
	public String insertPro(ProjectDTO proDTO) {
		java.sql.Date date = new java.sql.Date(12);
		proDTO.setPro_date(date);
		
		proService.insertPro(proDTO);
		return "project/projectList";
	}
	
	@RequestMapping("/updateProUserColor.do")
	@ResponseBody
	public int updateProUserColor(ProjectUserDTO proDTO) {
		int result = 0;
		if(proDTO.getPro_user_color().equals("select-color")) {
			result = 2;
		}else {
			result = proUserService.updateProUserColor(proDTO);
		}
		System.out.println(proDTO.getPro_no());
		System.out.println(proDTO.getMem_no());
		
		
		return result;
	}
	@RequestMapping("/chkProUser.do")
	@ResponseBody
	public int chkProUser(int pro_no,int mem_no) {
		int result=0;
		result = proService.chkProUser(pro_no, mem_no);
		return result;
	}
	@RequestMapping("/insertProUser.do")
	public String insertProUser(@RequestParam("mem_no")List<Integer> memList
								,int pro_no
								,HttpSession sess) {
		java.sql.Date date = new java.sql.Date(12);
		ProjectUserDTO proUserDTO = new ProjectUserDTO(pro_no, 0, "normal",date ,"default-back-color");
		for(int i = 0 ; i < memList.size(); i++) {
			proUserDTO.setMem_no(memList.get(i));
			proUserService.insertProUser(proUserDTO);
		}
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
}
