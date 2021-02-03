package com.ezen.chord.files.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.files.dao.FilesDAO;
import com.ezen.chord.files.dto.FilesDTO;

@Repository
public class FilesDAOImpl implements FilesDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;

	@Override
	public int insertFile(FilesDTO filedto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("insertFile", filedto);
		return result;
	}

	@Override
	public int delFile(String filename) {
		// TODO Auto-generated method stub
		int result = sqlMap.delete("delFile", filename);
		return result;
	}

	@Override
	public int updateFile(int fileno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFatch(Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = sqlMap.update("updateFatch", map);
		return result;
	}

	@Override
	public List<FilesDTO> getAllFiles() {
		// TODO Auto-generated method stub
		List<FilesDTO> AllFiles=sqlMap.selectList("getAllFiles");
		return AllFiles;
	}
	@Override
	public List<FilesDTO> getDBPath(String fullPath) {
		// TODO Auto-generated method stub
		List<FilesDTO> getDBPath=sqlMap.selectList("getDBPath", fullPath);
		return getDBPath;
	}
	
	@Override
	public String getPath(String filename) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getpath",filename);
	}
	@Override
	public List<String> getproName(int memNo) {
		List<String> getproName=sqlMap.selectList("getproName", memNo);
		return getproName;
	}
}
