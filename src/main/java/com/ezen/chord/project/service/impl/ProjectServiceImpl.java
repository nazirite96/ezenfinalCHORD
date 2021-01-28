package com.ezen.chord.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.project.dao.ProjectDAO;
import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project.service.ProjectService;
import com.ezen.chord.project_user.dao.ProjectUserDAO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	@Autowired
	private ProjectUserDAO proUserDAO;

	@Override
	public int insertPro(ProjectDTO proDTO) {
		// TODO Auto-generated method stub
		
		int pro_no = projectDAO.getProSeq();
		proDTO.setPro_no(pro_no);
		
		
		int result = projectDAO.insertPro(proDTO);
		
		
		return 0;
	}

	@Override
	public int updatePro(ProjectDTO proDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProjectDTO getProDetail(int pro_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectDTO> getProAllList(int mem_no) {
		// TODO Auto-generated method stub
		return null;
	}
}
