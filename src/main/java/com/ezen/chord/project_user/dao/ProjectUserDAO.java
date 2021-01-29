package com.ezen.chord.project_user.dao;

import java.util.List;

import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;

public interface ProjectUserDAO {
	
	
	public int insertProUser(ProjectUserDTO proUserDTO);	
	
	public List<ProjectDTO> getListByMemNo(int mem_no);
}
