package com.ezen.chord.files.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
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
			@RequestParam(value = "projectName", defaultValue = "")String projectName,
			HttpServletRequest request) {
		HttpSession session=request.getSession();
		
		session.setAttribute("memNo", 2);/////////////////////////////이건 지울거
		File f = new File(fileSerImp.PATH+File.separator+fileSerImp.CRPATH);
		
		List<FilesDTO> allFileList=null;
		List<FilesDTO> partFileList=null;
		
		if(projectName.equals("")) {
			
		}else {
			fileSerImp.PRONAME=projectName;
			new File(fileSerImp.PATH+File.separator+fileSerImp.PRONAME);
		}
		
		if(!foldername.equals("")) {
			f = new File(fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH+File.separator+foldername);
			if(f.exists()) {
				fileSerImp.CRPATH+=File.separator+foldername;
			}
		}else {
			fileSerImp.CRPATH=fileSerImp.CRPATH;
		}
		System.out.println(fileSerImp.STATE);
		
		if(fileSerImp.CRPATH.equals("")) {
			allFileList=fileSerImp.getAllFiles();
			//int state1=Integer.parseInt(state);
			del="";
		}
		
		if(!del.equals("")) {	
			int fullindex=fileSerImp.CRPATH.lastIndexOf("\\");
			String lastpath=fileSerImp.CRPATH.substring(0,fullindex);// 마지막 결로를 누르면 이자식이 저장되면됨
			fileSerImp.CRPATH=lastpath;
		}
		String dbpath=fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH;
		System.out.println(dbpath);
		partFileList=fileSerImp.getDBPath(dbpath);
		f = new File(dbpath);
		File files[] = f.listFiles();
		ModelAndView mav = new ModelAndView();
			ArrayList<String> folder= new ArrayList<String>();
			for(int i=0;i<files.length;i++) {
				String name = files[i].getName();
				if(fileSerImp.fileExt(name).equals("")) {
					folder.add(name);
				}
			}
			mav.addObject("folder", folder);
			mav.addObject("allFileList", allFileList);
			mav.addObject("partFileList", partFileList);
			mav.addObject("foldername",foldername);
			mav.addObject("crpath", fileSerImp.CRPATH);
			mav.addObject("clickproject", fileSerImp.PRONAME);
			mav.addObject("proName",fileSerImp.getproName(2));
			mav.setViewName("files/files");
		return mav;
	}
	@RequestMapping("/pageReload.do")
	public ModelAndView uploadfiles() {
		fileSerImp.CRPATH="";
		fileSerImp.PRONAME="";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("files/files");
		return mav;
	}
	/**
	 * 파일 업로드관련 해당위치레 파일 업로드 및 DB에 저장
	 * */
	@RequestMapping("/upload.do")
	public ModelAndView uploadfiles(FilesDTO filedto,
			HttpServletRequest request,
			@RequestParam("files")List<MultipartFile> files) {
		
		HttpSession session=request.getSession();
		session.setAttribute("memNo", 2);/////////////////////////////이건 지울거
		int mem_no = (Integer) session.getAttribute("memNo");
		
		for(int i=0;i<files.size();i++) {
			String name=fileSerImp.checkName(files.get(i));
			String original=files.get(i).getOriginalFilename();
			Long number=files.get(i).getSize();
			String size=fileSerImp.returnFileSize(number);
			fileSerImp.copyInto(files.get(i), name);
			fileSerImp.insertFile(filedto, original, name, size, mem_no);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("files/insertFiles");
		return mav;
	}

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
	 * 요소들을 보여줄 거임
	 * */
	@RequestMapping("/etclist.do")
	public ModelAndView etclist(@RequestParam(value = "state", defaultValue = "1")int state) {
		List<FilesDTO> allFileList=null;
		fileSerImp.CRPATH="";
		fileSerImp.PRONAME="";
		switch (state) {
		case 1:fileSerImp.STATE=""; break; // 전체리스트
		case 2:fileSerImp.STATE=".txt"; break; // 텍스트보여줄 화면
		case 3:fileSerImp.STATE=".xlsx"; break; // 엑셀형식
		case 4:fileSerImp.STATE=".docx"; break; // 문서형식
		default : fileSerImp.STATE=".pptx";//파워포인트
			break;
		}
		switch (fileSerImp.STATE) {
		case "": allFileList=fileSerImp.getAllFiles(); break; // 전체리스트
		case ".txt":allFileList=fileSerImp.etcList(fileSerImp.STATE); break; // 텍스트보여줄 화면
		case ".xlsx":allFileList=fileSerImp.etcList(fileSerImp.STATE); break; // 엑셀형식
		case ".docx":allFileList=fileSerImp.etcList(fileSerImp.STATE); break; // 문서형식
		default : allFileList=fileSerImp.etcList(fileSerImp.STATE);//파워포인트
			break;
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("etclist",allFileList);
		mav.setViewName("chordView");
		return mav;
	}
	
	/**
	 *  파일 이동 관련 메섯흐
	 * */
	@RequestMapping("/moveList.do")
	public ModelAndView getAllFiles(@RequestParam(value="chkList",defaultValue = "")List<String> chkList,
			@RequestParam(value="foldername",defaultValue = "")String foldername,
			@RequestParam(value="state",defaultValue = "")int state) {
		
		String beforePath=null;
		String afterPath=null;
		if(state==1) {
			beforePath =fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH+File.separator;
			afterPath=fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH+File.separator+foldername+File.separator;
			for(int i=0;i<chkList.size();i++) {
				fileSerImp.fileMove(beforePath+chkList.get(i),afterPath+chkList.get(i));
				fileSerImp.updateFatch(chkList.get(i), fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH+File.separator+foldername);
			}
		}else {
			beforePath=fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH+File.separator;
			
			afterPath =fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator;
			for(int i=0;i<chkList.size();i++) {
				fileSerImp.fileMove(beforePath+chkList.get(i),afterPath+chkList.get(i));
				fileSerImp.updateFatch(chkList.get(i), fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator);
			}
		}
			ModelAndView mav=null;
			mav = new ModelAndView();
			mav.setViewName("files/files");
		return mav;
	}
	/**
	 * 자자 너는 삭제를 시킬것이다.
	 * */
	@RequestMapping("/delFileAndFolder.do")
	public ModelAndView delfileAndfolder(
			@RequestParam(value="filename",defaultValue = "")String filename,
			@RequestParam(value="state",defaultValue = "")int state) {
		//1은 파일
		String path=fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH;
		if(state==1) {
			fileSerImp.delFile(filename);
			fileSerImp.fileDelete(filename);
		}else{
			fileSerImp.delDBPath(path+File.separator+filename+File.separator);
			fileSerImp.folderDel(filename, path);
		}
			ModelAndView mav=new ModelAndView();
			mav.setViewName("files/files");
		return mav;
	}
	
	/**
	 * 폴더 add
	 * */
	@RequestMapping("/folderAdd.do")
	public ModelAndView getAllFolder(
			@RequestParam(value = "createfolder",defaultValue ="")String createfolder) {
		ModelAndView mav = new ModelAndView();
		if(createfolder.equals("")) {
			createfolder="새 폴더";
		}
		File f = new File(fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH+File.separator+createfolder);
		if(f.exists()){
			String body=createfolder;
			for(int i =1;i<999;i++) {
				createfolder=body+" ("+i+")";
				f = new File(fileSerImp.PATH+File.separator+fileSerImp.PRONAME+File.separator+fileSerImp.CRPATH+File.separator+createfolder);
				if(f.mkdir()) {
					f.mkdir();
					break;
				}
			}
		}else {
			f.mkdir();
		}
		mav.setViewName("files/files");
		return mav;
	}
	
	/**
	 * 다운로드 뷰 
	 * */
	@RequestMapping("/filedownload")
	public ModelAndView filedwnload(
			@RequestParam("filename")String filename,
			HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		int mem_no = (Integer) session.getAttribute("memNo");
		
		File f = new File(fileSerImp.getPath(filename)+filename);
		ModelAndView mav = new ModelAndView();
		if(f.isDirectory()){
			mav.addObject("foldername", filename);
			mav.setViewName("redirect:files.do");
			return mav;
		}else {
		int fileNo=fileSerImp.fileNo(filename);
		int result=fileSerImp.log_fileInsert(fileNo, mem_no);
		System.out.println(result);
		mav.addObject("downloadFile", f);
		mav.setViewName("chordDownload");
		}
		
		return mav;
	}
}