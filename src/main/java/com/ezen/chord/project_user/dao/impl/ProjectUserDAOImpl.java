package com.ezen.chord.project_user.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.project_user.dao.ProjectUserDAO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;


@Repository
public class ProjectUserDAOImpl implements ProjectUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	@Override
	public int insertProUser(ProjectUserDTO proUserDTO) {
		// TODO Auto-generated method stub
		return sqlMap.insert("insertProUser", proUserDTO);
	}
}
