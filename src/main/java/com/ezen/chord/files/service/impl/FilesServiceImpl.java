package com.ezen.chord.files.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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

}
