package com.ezen.chord.project.dao;

import com.ezen.chord.project.dto.ProjectDTO;

public interface ProjectDAO {
	
	
	public int getProSeq();
	public int insertPro(ProjectDTO proDTO);
	public ProjectDTO getPro(int pro_no);
	public int deletePro(int pro_no);
	public int updatePro(ProjectDTO proDTO);
	
}
