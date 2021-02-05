package com.ezen.chord.project_user.service.impe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.project_user.dao.ProjectUserDAO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.project_user.service.ProjectUserService;


@Service
public class projectUserServiceImpl implements ProjectUserService {
	
	@Autowired
	private ProjectUserDAO proUserDAO;

	
	@Override
	public int insertProUser(ProjectUserDTO proUserDTO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int updateProUserColor(ProjectUserDTO proUserDTO) {
		// TODO Auto-generated method stub
		return proUserDAO.updateProUserColor(proUserDTO);
	}
	
	@Override
	public ProjectUserDTO getProUser(int pro_no, int mem_no) {
		// TODO Auto-generated method stub
		return proUserDAO.selectProUserByProAndMem(pro_no, mem_no);
	}

}
