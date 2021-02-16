package com.ezen.chord.project.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.box.dto.BoxDTO;
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
	
	@Override
	public ProjectDTO getPro(int pro_no) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getPro", pro_no);
	}
	
	@Override
	public int deletePro(int pro_no) {
		// TODO Auto-generated method stub
		return sqlMap.delete("deletePro", pro_no);
	}
	@Override
	public int updatePro(ProjectDTO proDTO) {
		// TODO Auto-generated method stub
		return sqlMap.update("updatePro", proDTO);
	}
	
	@Override
	public int deleteBoxPro(BoxDTO boxDTO) {
		// TODO Auto-generated method stub
		return sqlMap.insert("deleteBoxPro", boxDTO);
	}
	
	@Override
	public int insertBoxPro(BoxDTO boxDTO) {
		// TODO Auto-generated method stub
		return sqlMap.insert("insertBoxPro", boxDTO);
	}
}
