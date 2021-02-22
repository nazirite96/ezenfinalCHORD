package com.ezen.chord.project_user.service.impe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.box.dao.BoxDAO;
import com.ezen.chord.box.dto.BoxDTO;
import com.ezen.chord.project.dao.ProjectDAO;
import com.ezen.chord.project_user.dao.ProjectUserDAO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.project_user.service.ProjectUserService;


@Service
public class projectUserServiceImpl implements ProjectUserService {
	
	@Autowired
	private ProjectUserDAO proUserDAO;
	@Autowired
	private ProjectDAO proDAO;
	@Autowired
	private BoxDAO boxDAO;

	
	@Override
	public int insertProUser(ProjectUserDTO proUserDTO) {
		// TODO Auto-generated method stub
		return proUserDAO.insertProUser(proUserDTO);
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
	
	@Override
	public int deleteProUser(int pro_no, int mem_no) {
		// TODO Auto-generated method stub
		List<BoxDTO> list = boxDAO.selectBox(mem_no);
		for(BoxDTO dto : list) {
			dto.setPro_no(pro_no);
			proDAO.deleteBoxPro(dto);
		}
		return proUserDAO.deleteProUser(mem_no, pro_no);
	}
	
	
}
