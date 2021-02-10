package com.ezen.chord.timeline.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.FilesService;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;

@Controller
public class TimelineController {
	
	@Autowired
	private TimelineService timService;
	@Autowired
	private FilesService fileService;
	
	
	@RequestMapping("/timeLine.do")
	@ResponseBody
	public ModelAndView getTimeline(int pro_no,String pro_name,HttpSession sess) {
		ModelAndView mav = new ModelAndView();
		int mem_no = (int)(sess.getAttribute("memNo"));
		int com_no = (int)(sess.getAttribute("comNo"));
		//업로드 폴더 변경
		fileService.changePro(pro_name);
		ProjectUserDTO proUserDTO = timService.getPro(pro_no,mem_no);
		List<ProjectUserDTO> invitedProUserList = timService.invitedProUserList(pro_no);
		List<ProjectUserDTO> notInvitedProUserList = timService.notInvitedProUserList(pro_no, com_no);
		mav.addObject("notInvitedProUserList", notInvitedProUserList);
		mav.addObject("invitedProUserList", invitedProUserList);
		mav.addObject("proUserDTO", proUserDTO);
		//프로젝트 정보를 받기
		int page = 0; 
		
		List<TimelineDTO> list = timService.getTimelineByProNo(pro_no, page);
		for(int i = 0 ; i < list.size() ; i++) {
			switch (list.get(i).getCont_kind()) {
			case "post":
				
				break;
			case "task":
				list.get(i).setTaskDTO(timService.getTask(list.get(i).getCont_no()));
				break;
			default:
				break;
			}
		}
		
		mav.addObject("list", list);
		mav.addObject("mem_no", mem_no);
		mav.setViewName("project/timeLine");
		
		
		
		return mav;
	}
	
	
	@RequestMapping("/insertTim.do")
	public String insertTim(TimelineDTO timDTO ,
							FilesDTO filesDTO ,
							@RequestParam("articleFile")List<MultipartFile> files,
							HttpServletRequest request) {
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		
		String serv =request.getSession().getServletContext().getRealPath("/");
		int tim_no = timService.getTimSeq();
		timDTO.setTim_no(tim_no);
		
		filesDTO.setCont_kind("tim");
		filesDTO.setCont_no(tim_no);
		filesDTO.setPro_no(timDTO.getPro_no());
		filesDTO.getFile();
		if(files != null) {
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					String name=fileService.checkName(file);
					String original=file.getOriginalFilename();
					Long number=file.getSize();
					String size=fileService.returnFileSize(number);
					fileService.copyInto(file, name,serv);
					fileService.insertFile(filesDTO, original, name, size, mem_no);
				}
			}
		}
		int result = timService.insertTim(timDTO);
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	
	@RequestMapping("/updateTim.do")
	public String updateTim(TimelineDTO timDTO ,HttpSession sess) {
		int result = timService.updateTim(timDTO);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/deleteTim.do")
	public String deleteTim(TimelineDTO timDTO ,HttpSession sess) {
		int result = timService.deleteTim(timDTO);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	
}
