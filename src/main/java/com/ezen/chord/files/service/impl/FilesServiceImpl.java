package com.ezen.chord.files.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.chord.files.dao.FilesDAO;
import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.FilesService;

@Service
public class FilesServiceImpl implements FilesService {

	FilesDAO filedao;
	
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
	public int insertFile(FilesDTO filedto) {
		// TODO Auto-generated method stub
		return 0;
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
	public String checkName(MultipartFile upload) {
		int count = 0;
		String name =upload.getOriginalFilename();
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
		 File f=new File("c:/JSP/upload/"+name);
		 for(int i = 0;i<999;i++) {
			 if(f.exists()) {
				 count++;
				 name=body+"("+count+")"+ext;
				 f=new File("c:/JSP/upload/"+name);
				 i--;
			 }else {
				 break;
			 }
		 } 
		 return name;
	}
	@Override
	public void copyInto(String writer, MultipartFile upload, String checkName) {
		System.out.println("작성자:"+writer);
		System.out.println("작성자:"+checkName);
		try {
			byte bytes[]=upload.getBytes();
			File outFile=new File("c:/JSP/upload/"+checkName);
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
