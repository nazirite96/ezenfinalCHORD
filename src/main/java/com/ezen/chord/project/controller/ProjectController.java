package com.ezen.chord.project.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.box.dto.BoxDTO;
import com.ezen.chord.box.service.BoxService;
import com.ezen.chord.files.service.FilesService;
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
	@Autowired
	private BoxService boxService;
	//중요한 정보
	
	@Autowired
	private FilesService filesSerivce;
	
	
	@RequestMapping("/proList.do")
	public ModelAndView getProList(int mem_no,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		List<ProjectUserDTO> proList = proService.getProAllList(mem_no);
		mav.addObject("mem_no", mem_no);
		List<BoxDTO> boxList = boxService.getBoxList(mem_no);
		mav.addObject("boxList", boxList);
		mav.addObject("proList", proList);
		mav.setViewName("project/projectList");
		
		return mav;
	}
	@RequestMapping("/seperateList.do")
	public ModelAndView seperateList(int box_no,int mem_no) {
		
		ModelAndView mav = new ModelAndView();
		List<BoxDTO> boxList = boxService.getBoxList(mem_no);
		mav.addObject("boxList", boxList);
		mav.addObject("mem_no", mem_no);
		List<ProjectUserDTO> proList = proService.getSepProList(mem_no, box_no);
		mav.addObject("proList", proList);
		mav.setViewName("project/seperList");
		return mav;
	}
	
	
	
	
	@RequestMapping("/insertPro.do")
	public String insertPro(ProjectDTO proDTO) {
		java.sql.Date date = new java.sql.Date(12);
		proDTO.setPro_date(date);
		filesSerivce.createProfolder(proDTO.getPro_name());
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
	
	
	@RequestMapping("/deleteProUser.do")
	public String deleteProUser(int mem_no, int pro_no) {
		int result = proUserService.deleteProUser(pro_no, mem_no);
		return "redirect:/proList.do?mem_no="+mem_no;
	}
	
	@RequestMapping("/deleteProject.do")
	public String deleteProject(int pro_no,String pro_name,HttpSession sess) {
		int mem_no = (int)sess.getAttribute("memNo");	
		int result = proService.deletePro(pro_no);
		//폴더 삭제
		filesSerivce.delProfolder(pro_name);
		return "redirect:/proList.do?mem_no="+mem_no;
	}
	
	@RequestMapping("/updatePro.do")
	public String updatePro(ProjectDTO proDTO) {
		int result = proService.updatePro(proDTO);
		return "redirect:/timeLine.do?pro_no="+proDTO.getPro_no()+"&mem_no="+proDTO.getMem_no();
	}
	
	@RequestMapping("/insertBox.do")
	public String insertBox(BoxDTO boxDTO) {
		java.sql.Date date = new Date(0);
		boxDTO.setBox_date(date);
		boxDTO.setBox_no(0);
		boxService.insertBox(boxDTO);
		
		return "redirect:/proList.do?mem_no="+boxDTO.getMem_no();
	}
	
	@RequestMapping("/insertBoxPro.do")
	@ResponseBody
	public String insertBoxPro(BoxDTO boxDTO) {
		java.sql.Date date = new Date(0);
		boxDTO.setBox_date(date);
		boxDTO.setBox_name("s");
		proService.insertBoxPro(boxDTO);
		return "1";
	}
	
	@RequestMapping("/deleteBoxPro.do")
	@ResponseBody
	public String deleteBoxPro(BoxDTO boxDTO) {
		java.sql.Date date = new Date(0);
		boxDTO.setBox_date(date);
		boxDTO.setBox_name("s");
		proService.deleteBoxPro(boxDTO);
		return "1";
	}
	@RequestMapping("/deleteBox.do")
	public String deleteBox(int box_no ,
			HttpServletRequest request) {
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		
		boxService.deleteBox(box_no);
		return "redirect:/proList.do?mem_no="+mem_no;
	}
	
}
