package com.ezen.chord.project.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.box.dto.BoxDTO;
import com.ezen.chord.project.dao.ProjectDAO;
import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;

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
	
	@Override
	public List<ProjectUserDTO> selectBoxPro(int mem_no, int box_no) {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("mem_no", mem_no);
		map.put("box_no", box_no);
		return sqlMap.selectList("selectSepBoxPro", map);
	}
}
