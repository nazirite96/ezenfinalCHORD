package com.ezen.chord.project_user.service;

import com.ezen.chord.project_user.dto.ProjectUserDTO;

public interface ProjectUserService {
	
	public int insertProUser(ProjectUserDTO proUserDTO);
	
	public int updateProUserColor(ProjectUserDTO proUserDTO);
	
	public ProjectUserDTO getProUser(int pro_no, int mem_no);

}
