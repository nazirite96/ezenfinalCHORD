package com.ezen.chord.files.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.files.service.impl.FilesServiceImpl;


@Controller
public class FilesController {
	
	FilesServiceImpl fileSerImp;

	@RequestMapping("/files.do")
	public ModelAndView filesForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("files/files");
		return mav;
	}
	@RequestMapping("/getAllFiles.do")
	public ModelAndView getAllFiles(MultipartFile upload) {
		ModelAndView mav = new ModelAndView();
		File f = new File("C:\\JSP\\upload");
		File files[] = f.listFiles();
		mav.addObject("files", files);
		mav.setViewName("jsonView");
		return mav;
	}
}