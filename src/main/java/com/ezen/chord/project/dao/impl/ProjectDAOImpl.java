package com.ezen.chord.project.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.project.dao.ProjectDAO;
import com.ezen.chord.project.dto.ProjectDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO{
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	public int getProSeq() {
		return sqlMap.selectOne("getProSeq");
	}
	
	@Override
	public int insertPro(ProjectDTO proDTO) {
		// TODO Auto-generated method stub
		System.out.println(proDTO.toString());
		return sqlMap.insert("insertPro",proDTO);
	}
	
}
