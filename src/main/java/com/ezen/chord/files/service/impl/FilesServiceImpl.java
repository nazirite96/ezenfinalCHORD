package com.ezen.chord.files.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.chord.files.dao.FilesDAO;
import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.FilesService;
import com.ezen.chord.project.dto.ProjectDTO;

@Service
public class FilesServiceImpl implements FilesService {
	
	public final String PATH="C:\\JSP\\upload";
	public String CRPATH="";	
	
	@Autowired
	private FilesDAO filedao;
	private ProjectDTO proDTO;
	
	@Override
	public List<FilesDTO> getAllFiles(FilesDTO filedto) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Map<String, Object> updateFatch(int fileno,String fatch) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("fatch", fatch);
		map.put("fileno", fileno);
		return filedao.updateFatch(map);
	}
	@Override
	public int updateFile(int fileno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertFile(FilesDTO filedto,String original,String name,String size) {
		// TODO Auto-generated method stub
		filedto.setFile_name(name);
		filedto.setFile_path(PATH+File.separator+CRPATH+File.separator);
		filedto.setFile_upload(original);
		filedto.setFile_size(size);
		filedto.setFile_kind("kind"); // 타임라인에서 가져올거임
		filedto.setCont_kind("baisc"); // 타임라인에서 가져올 타입
		filedto.setCont_no(0); // 타임라인에서 가져올 컨텐츠 타입 번호
		filedto.setMem_no(4); // 사용자 맴버번호
		filedto.setPro_no(20); // 사용자 속해있는 프로젝트 번호
		int result=filedao.insertFile(filedto)>0?1:0;
		return result;
	}

	@Override
	public int delFile(int filenO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void addFolder(String foldername) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delFolder(String foldername) {
		// TODO Auto-generated method stub

	}
	@Override
	public String checkName(MultipartFile files) {
		int count = 0;
		String name =files.getOriginalFilename();
		System.out.println(name);
		if(name.equals("")) {
			return "";
		}
		String body = null;
	    String ext = null;
	    
	    int dot = name.lastIndexOf(".");
	    if (dot != -1) { //확장자가 없을때
	      body = name.substring(0, dot);
	      ext = name.substring(dot);
	    } else {   //확장자가 있을때
	      body = name;
	      ext = "";
	    }
		 File f=new File(PATH+File.separator+CRPATH+File.separator+name);
		 for(int i = 0;i<999;i++) {
			 if(f.exists()) {
				 count++;
				 name=body+"("+count+")"+ext;
				 f=new File(PATH+File.separator+CRPATH+File.separator+name);
				 i--;
			 }else {
				 break;
			 }
		 } 
		 return name;
	}
	@Override
	public void copyInto( MultipartFile upload, String checkName) {
		System.out.println("작성자:"+checkName);
		try {
			byte bytes[]=upload.getBytes();
			File outFile=new File(PATH+File.separator+CRPATH+File.separator+checkName);
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String returnFileSize(Long number) {
		if(number < 1024) {
			return number + "bytes";
		} else if(number >= 1024 && number < 1048576) {
			return (number/1024) + "KB";
		} else if(number >= 1048576) {
			return (number/1048576) + "MB";
		}
		return null;
	}
	@Override
	public String fileExt(String name) {
		if(name.equals("")) {
			return null;
		}
	    String ext = null;
	    
	    int dot = name.lastIndexOf(".");
	    if (dot != -1) { //확장자가 없을때
	      ext = name.substring(dot);
	      return ext;
	    } else {   //확장자가 있을때
	      ext = "";
	      return ext;
	    }
	}
}
