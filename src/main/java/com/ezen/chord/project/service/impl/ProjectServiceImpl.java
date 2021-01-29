package com.ezen.chord.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.project.dao.ProjectDAO;
import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project.service.ProjectService;
import com.ezen.chord.project_user.dao.ProjectUserDAO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;

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
		System.out.println(proDTO.getPro_no());
		//프로젝트 등록
		int result = projectDAO.insertPro(proDTO);
		
		
		//// 프로젝트 참여자 등록
		if(result==1) {
			ProjectUserDTO proUserDTO = new ProjectUserDTO();
			proUserDTO.setPro_no(pro_no);
			proUserDTO.setMem_no(proDTO.getMem_no());
			proUserDTO.setPro_user_man_chk("manager");
			proUserDTO.setPro_user_color("blue");
			result = proUserDAO.insertProUser(proUserDTO);
			if(result == 1) {
				return 1;
			}
		}
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
		List<ProjectDTO> list = proUserDAO.getListByMemNo(mem_no);
		
		return list;
	}
}
