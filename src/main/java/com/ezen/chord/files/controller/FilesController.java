package com.ezen.chord.files.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.impl.FilesServiceImpl;


@Controller
public class FilesController {
	
	@Autowired
	FilesServiceImpl fileSerImp;
	
	
	/**
	 * 파일전체 리스트 화면으로 가기위함
	 * memNo
	 * */
	@RequestMapping("/files.do")
	public ModelAndView filesForm(@RequestParam(value = "foldername", defaultValue = "")String foldername,
			@RequestParam(value = "del", defaultValue = "")String del,
			HttpServletRequest request) {
		
		File f = new File(fileSerImp.PATH+File.separator+fileSerImp.CRPATH);
		List<FilesDTO> test=null;
		
		
		if(!foldername.equals("")) {
			f = new File(fileSerImp.PATH+File.separator+fileSerImp.CRPATH+File.separator+foldername);
			if(f.exists()) {
				fileSerImp.CRPATH+=File.separator+foldername;
			}
		}else {
			fileSerImp.CRPATH=fileSerImp.CRPATH;
		}
		
		
		if(fileSerImp.CRPATH.equals("")) {
			test=fileSerImp.getAllFiles();
			del="";
		}
		if(!del.equals("")) {	
			int fullindex=fileSerImp.CRPATH.lastIndexOf("\\");
			String lastpath=fileSerImp.CRPATH.substring(0,fullindex);// 마지막 결로를 누르면 이자식이 저장되면됨
			fileSerImp.CRPATH=lastpath;
		}
		
		f = new File(fileSerImp.PATH+File.separator+fileSerImp.CRPATH);
		File files[] = f.listFiles();
		ModelAndView mav = new ModelAndView();
			ArrayList<String> list= new ArrayList<String>();
			ArrayList<String> folder= new ArrayList<String>();
			for(int i=0;i<files.length;i++) {
				String name = files[i].getName();
				if(!fileSerImp.fileExt(name).equals("")) {
					list.add(name);
				}else {
					folder.add(name);
				}
			}
			mav.addObject("list", list);
			mav.addObject("test", test);
			mav.addObject("folder", folder);
			mav.addObject("foldername",foldername);
			mav.addObject("crpath", fileSerImp.CRPATH);
			mav.setViewName("files/files");
		return mav;
	}
	@RequestMapping("/pageReload.do")
	public ModelAndView uploadfiles() {
		fileSerImp.CRPATH="";
		System.out.println("야실행안되냐?");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:files.do");
		return mav;
	}
	/**
	 * 파일 업로드관련 해당위치레 파일 업로드 및 DB에 저장
	 * */
	@RequestMapping("/upload.do")
	public ModelAndView uploadfiles(FilesDTO filedto,
			@RequestParam("files")List<MultipartFile> files) {
		
		for(int i=0;i<files.size();i++) {
			String name=fileSerImp.checkName(files.get(i));
			String original=files.get(i).getOriginalFilename();
			Long number=files.get(i).getSize();
			String size=fileSerImp.returnFileSize(number);
			fileSerImp.copyInto(files.get(i), name);
			int result = fileSerImp.insertFile(filedto, original, name, size);
			System.out.println(result);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("files/insertFiles");
		return mav;
	}


//	session.setAttribute("mem_no", 2);// 이건 충연이가 올리면 삭제
//	int mem_no = (Integer) session.getAttribute("mem_no");// 테스트 테스트
	/**
	 * 업로드파일 화면단 (타임라인 쪽으로 이전 예정)
	 * */
	@RequestMapping("/insertFiles.do")
	public ModelAndView insertFiles() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("files/insertFiles");
		return mav;
	}
	
	/**
	 *  파일 리스트 출력해주기
	 * */
	@RequestMapping("/getAllFiles.do")
	public ModelAndView getAllFiles(@RequestParam(value="foldername",defaultValue = "")String foldername) {
		ModelAndView mav = new ModelAndView();
		String test=fileSerImp.PATH+File.separator;
		if(!foldername.equals("")) {
			test+=foldername;
		}
		File f = new File(test);
		File files[] = f.listFiles();
		ArrayList<String> list= new ArrayList<String>();
		ArrayList<String> folder= new ArrayList<String>();
		for(int i=0;i<files.length;i++) {
			String name = files[i].getName();
			if(!fileSerImp.fileExt(name).equals("")) {
				list.add(name);
			}else {
				folder.add(name);
			}
		}
		mav.addObject("list", list);
		mav.addObject("folder", folder);
		mav.setViewName("chordView");
		return mav;
	}
	/**
	 * 폴더 add
	 * */
	@RequestMapping("/folderAdd.do")
	public ModelAndView getAllFolder(
			@RequestParam(value = "createfolder",defaultValue ="")String createfolder) {
		ModelAndView mav = new ModelAndView();
		System.out.println(createfolder);
		if(createfolder.equals("")) {
			createfolder="새 폴더";
		}
		File f = new File(fileSerImp.PATH+File.separator+fileSerImp.CRPATH+File.separator+createfolder);
		if(f.exists()){
			String body=createfolder;
			for(int i =1;i<999;i++) {
				createfolder=body+" ("+i+")";
				f = new File(fileSerImp.PATH+File.separator+fileSerImp.CRPATH+File.separator+createfolder);
				if(f.mkdir()) {
					f.mkdir();
					break;
				}
			}
		}else {
			f.mkdir();
		}
		mav.setViewName("chordView");
		return mav;
	}
	/**
	 * 다운로드 뷰 
	 * */
	@RequestMapping("/filedownload")
	public ModelAndView filedwnload(
			@RequestParam("filename")String filename) {
		File f = new File(fileSerImp.getPath(filename)+filename);
		ModelAndView mav = new ModelAndView();
		if(f.isDirectory()){
			mav.addObject("foldername", filename);
			mav.setViewName("redirect:files.do");
			return mav;
		}else {
		mav.addObject("downloadFile", f);
		mav.setViewName("chordDownload");
		}
		
		return mav;
	}
}