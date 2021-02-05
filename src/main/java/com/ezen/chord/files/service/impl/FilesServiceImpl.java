package com.ezen.chord.files.service.impl;

import java.io.File;
import java.io.FileInputStream;
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
	public String PRONAME="";
	public String STATE="";
	
	@Autowired
	private FilesDAO filedao;
	private ProjectDTO proDTO;
	
	@Override
	public List<FilesDTO> getAllFiles() {
		// TODO Auto-generated method stub
		//
		return filedao.getAllFiles();
	}
	@Override
	public String getPath(String filename) {
		// TODO Auto-generated method stub
		return filedao.getPath(filename);
	}
	@Override
	public List<String> getproName(int memNo) {
		// TODO Auto-generated method stub
		return filedao.getproName(memNo);
	}
	@Override
	public int delDBPath(String fullPath) {
		// TODO Auto-generated method stub
		return filedao.delDBPath(fullPath);
	}
	@Override
	public int updateFatch(String filename, String pathRoot) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String, String>();
		map.put("filename", filename);
		map.put("pathRoot", pathRoot);
		return filedao.updateFatch(map);
	}
	@Override
	public List<FilesDTO> getDBPath(String fullPath) {
		// TODO Auto-generated method stub
		return filedao.getDBPath(fullPath);
	}
	@Override
	public int updateFile(int fileno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertFile(FilesDTO filedto,String original,String name,String size,int mem_no) {
		// TODO Auto-generated method stub
		filedto.setFile_name(name);
		filedto.setFile_path(PATH+File.separator+PRONAME+File.separator+CRPATH);
		filedto.setFile_upload(original);
		filedto.setFile_size(size);
		filedto.setFile_kind(fileExt(name));
		filedto.setCont_kind("baisc"); // 타임라인에서 가져올 타입
		filedto.setCont_no(0); // 타임라인에서 가져올 컨텐츠 타입 번호
		filedto.setMem_no(mem_no); 
		filedto.setPro_no(20); // 사용자 속해있는 프로젝트 번호
		int result=filedao.insertFile(filedto)>0?1:0;
		return result;
	}

	@Override
	public int delFile(String filename) {
		// TODO Auto-generated method stub
		return filedao.delFile(filename);
	}

	@Override
	public List<FilesDTO> etcList(String etc) {
		// TODO Auto-generated method stub
		return filedao.etcList(etc);
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
		 File f=new File(PATH+File.separator+PRONAME+File.separator+CRPATH+File.separator+name);
		 for(int i = 0;i<999;i++) {
			 if(f.exists()) {
				 count++;
				 name=body+"("+count+")"+ext;
				 f=new File(PATH+File.separator+PRONAME+File.separator+CRPATH+File.separator+name);
				 i--;
			 }else {
				 break;
			 }
		 } 
		 return name;
	}
	@Override
	public void copyInto( MultipartFile upload, String checkName) {
		System.out.println(PATH+File.separator+PRONAME+File.separator+CRPATH+File.separator+checkName);
		try {
			byte bytes[]=upload.getBytes();
			File outFile=new File(PATH+File.separator+PRONAME+File.separator+CRPATH+File.separator+checkName);
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//
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
	@Override
	public void fileMove(String inFileName, String outFileName) {
		// TODO Auto-generated method stub
		try {
			   FileInputStream fis = new FileInputStream(inFileName);
			   FileOutputStream fos = new FileOutputStream(outFileName);
			   
			   int data = 0;
			   while((data=fis.read())!=-1) {
			    fos.write(data);
			   }
			   fis.close();
			   fos.close();
			   
			   //복사한뒤 원본파일을 삭제함
			   fileDelete(inFileName);
			   
			  } catch (IOException e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
			  }
	}
	@Override
	public void fileDelete(String deleteFileName ) {
		// TODO Auto-generated method stub
		File f = new File(deleteFileName);
				f.delete();
			
	}
	@Override
	public void folderDel(String deleteFolderName, String path) {
		// TODO Auto-generated method stub
		File f = new File(path+File.separator+deleteFolderName);
		if(f.isFile()) {
			f.delete();
		}else {
			File files[]=f.listFiles();
			for(int i=0;i<files.length;i++) {
				if(files[i].isFile()) {
					files[i].delete();
				}else {
					String test=deleteFolderName+File.separator+files[i].getName();
					folderDel(test, path);
				}
			}
			f.delete();
		}
	}
	/*
	 * String
	 * original=PATH+File.separator+PRONAME+File.separator+CRPATH+File.separator+
	 * deleteFileName; File f = new File(original); if(f.isFile()) { //f가 파일이라면,
	 * f.delete();
	 * 
	 * System.out.println("파일 삭제");
	 * 
	 * 
	 * }else { //f가 파일이 아니라면, CRPATH+=File.separator+deleteFileName; File files[] =
	 * f.listFiles(); for(int i=0;i<files.length;i++) { if(files[i].isFile()) {
	 * //파일이라면, files[i].delete();
	 * 
	 * }else { fileDelete(File.separator+files[i].getName()); } } f = new
	 * File(original); //이미 폴더인게 확정된것. f.delete(); }
	 */
}
