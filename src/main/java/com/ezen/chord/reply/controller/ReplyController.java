package com.ezen.chord.reply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.chord.reply.dto.ReplyDTO;
import com.ezen.chord.reply.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyService repService;
	
	
	@RequestMapping("/insertRep.do")
	public String insertRep(ReplyDTO repDTO,int pro_no,HttpSession sess) {
		int result = repService.insertRep(repDTO);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/updateRep.do")
	public String updateRep(ReplyDTO repDTO,int pro_no,HttpSession sess) {
		int result = repService.updateRep(repDTO);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
	@RequestMapping("/deleteRep.do")
	public String deleteRep(int rep_no,int pro_no,HttpSession sess) {
		int result = repService.deleteRep(rep_no);
		int mem_no = (int)sess.getAttribute("memNo");
		return "redirect:/timeLine.do?pro_no="+pro_no+"&mem_no="+mem_no;
	}
	
	
	

}
