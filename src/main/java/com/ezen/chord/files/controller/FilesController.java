package com.ezen.chord.files.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FilesController {

	@RequestMapping("/files.do")
	public ModelAndView filesForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("files/files");
		return mav;
	}
	@RequestMapping("/getAllFiles.do")
	public ModelAndView getAllFiles() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("files", "files");
		mav.setViewName("chordJson");
		return mav;
	}
}