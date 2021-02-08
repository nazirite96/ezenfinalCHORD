package com.ezen.chord.project_user.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project_user.dao.ProjectUserDAO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;


@Repository
public class ProjectUserDAOImpl implements ProjectUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	
	@Override
	public List<ProjectDTO> getListByMemNo(int mem_no) {
		// TODO Auto-generated method stub
		List<ProjectDTO> list = sqlMap.selectList("getListByMemNo", mem_no);
		return list;
	}
	
	@Override
	public int updateProUserColor(ProjectUserDTO proUserDTO) {
		// TODO Auto-generated method stub
		return sqlMap.update("updateProUserColor", proUserDTO);
	}
	
	@Override
	public ProjectUserDTO selectProUserByProAndMem(int pro_no, int mem_no) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap<String,Integer>();
		System.out.println(pro_no+":"+mem_no);
		map.put("pro_no", pro_no);
		map.put("mem_no", mem_no);
		return sqlMap.selectOne("selectProUserByProAndMem", map);
	}
	
	
	@Override
	public List<ProjectUserDTO> selectInvitedProUser(int pro_no) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("selectInvitedProUser" , pro_no);
	}
	@Override
	public List<ProjectUserDTO> selectNotInvitedProUser(int pro_no, int com_no) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("pro_no", pro_no);
		map.put("com_no", com_no);
		return sqlMap.selectList("selectNotInvitedProUser", map);
	}
	
	@Override
	public ProjectUserDTO chkProUser(int mem_no, int pro_no) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("pro_no", pro_no);
		map.put("mem_no", mem_no);
		return sqlMap.selectOne("chkProUser", map);
	}
	
	@Override
	public int insertProUser(ProjectUserDTO proUserDTO) {
		return sqlMap.insert("insertProUser",proUserDTO);
	}
	@Override
	public int deleteProUser(int mem_no, int pro_no) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("pro_no", pro_no);
		map.put("mem_no", mem_no);
		return sqlMap.delete("deleteProUser", map);
	}
}
