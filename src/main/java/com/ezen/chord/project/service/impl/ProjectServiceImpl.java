package com.ezen.chord.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.box.dto.BoxDTO;
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
		if(result==2) {
			ProjectUserDTO proUserDTO = new ProjectUserDTO();
			proUserDTO.setPro_no(pro_no);
			proUserDTO.setMem_no(proDTO.getMem_no());
			proUserDTO.setPro_user_man_chk("manager");
			proUserDTO.setPro_user_color("default-back-color");
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
		return projectDAO.updatePro(proDTO);
	}

	@Override
	public ProjectDTO getProDetail(int pro_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectUserDTO> getProAllList(int mem_no) {
		// TODO Auto-generated method stub
		List<ProjectUserDTO> list = proUserDAO.getListByMemNo(mem_no);
		
		return list;
	}
	
	@Override
	public int chkProUser(int mem_no, int pro_no) {
		// TODO Auto-generated method stub
		int result = 0;
		if(proUserDAO.chkProUser(mem_no, pro_no)!=null) {
			result = 1;
		}
		return result;
	}
	
	@Override
	public int deletePro(int pro_no) {
		// TODO Auto-generated method stub
		return projectDAO.deletePro(pro_no);
	}
	
	@Override
	public int deleteBoxPro(BoxDTO boxDTO) {
		// TODO Auto-generated method stub
		return projectDAO.deleteBoxPro(boxDTO);
	}
	@Override
	public int insertBoxPro(BoxDTO boxDTO) {
		// TODO Auto-generated method stub
		return projectDAO.insertBoxPro(boxDTO);
	}
	
}
