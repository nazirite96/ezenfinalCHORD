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
	public int delFile(int fileno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFile(int fileno) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public Map<String, Object> updateFatch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FilesDTO> getAllFiles() {
		// TODO Auto-generated method stub
		List<FilesDTO> AllFiles=sqlMap.selectList("getAllFiles");
		return AllFiles;
	}
	@Override
	public String getPath(String filename) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getpath",filename);
	}

}
