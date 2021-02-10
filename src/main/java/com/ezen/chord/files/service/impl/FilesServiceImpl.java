package com.ezen.chord.files.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.chord.files.dao.FilesDAO;
import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.files.service.FilesService;
import com.ezen.chord.project.dto.ProjectDTO;

@Service
public class FilesServiceImpl implements FilesService {
	HttpServletRequest rs;
	String realpath="";
	public final String PATH="resources/files";
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
		filedto.setMem_no(mem_no); 
		int result=filedao.insertFile(filedto)>0?1:0;
		System.out.println("insertFileDB result:"+result);
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
	public int fileNo(String name) {
		// TODO Auto-generated method stub
		return filedao.fileNo(name);
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
	public int log_fileInsert( int file_no, int mem_no) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("file_no", file_no);
		map.put("mem_no", mem_no);
		return filedao.log_fileInsert(map);
	}
	@Override
	public List<String> pathList() {
		// TODO Auto-generated method stub
		return filedao.pathList();
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
	public void copyInto( MultipartFile upload, String checkName,String serv) {
		try {
			byte bytes[]=upload.getBytes();
			File outFile=new File(serv+PATH+File.separator+PRONAME+File.separator+CRPATH+File.separator+checkName);
			FileOutputStream fos=new FileOutputStream(outFile);
			System.out.println(outFile.toString());
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
	@Override
	public void createProfolder(String pro_name) {
		// TODO Auto-generated method stub
		realpath=rs.getSession().getServletContext().getRealPath("/");
	File f= new File(realpath+PATH+File.separator+pro_name);
			f.mkdir();
	}
	@Override
	public void delProfolder(String pro_name) {
		// TODO Auto-generated method stub
		realpath=rs.getSession().getServletContext().getRealPath("/");
		File f = new File(realpath+PATH+File.separator+pro_name);
		if(f.isFile()) {
			f.delete();
		}else {
			File files[]=f.listFiles();
			for(int i=0;i<files.length;i++) {
				if(files[i].isFile()) {
					files[i].delete();
				}else {
					String test=pro_name+File.separator+files[i].getName();
					delProfolder(test);
				}
			}
			f.delete();
		}
		delDBPath(PATH+File.separator+pro_name+File.separator);	
	}
	@Override
	public void changePro(String pro_name) {
		// TODO Auto-generated method stub
		CRPATH="";
		STATE="";
		PRONAME=pro_name;
		
	}
	//폴더명 바꾸기 
//	public void reProfor(String rename,String realpath) {
//		File file = new File("D:\\Test.java");
//		File file2 = new File("D:\\Testaaa.java");
//	//변경
//	if(file.exists()) {
//		file.renameTo(file2); //변경 
//		} 
//	}
}
