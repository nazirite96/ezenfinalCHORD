package com.ezen.chord.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pro")
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@RequestMapping("/list")
	public ModelAndView getProList() {
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("project/projectList");
		
		
		return mav;
	}
	

}
