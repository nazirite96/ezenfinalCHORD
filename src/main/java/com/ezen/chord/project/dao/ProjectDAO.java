package com.ezen.chord.project.dao;

import java.util.List;

import com.ezen.chord.box.dto.BoxDTO;
import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;

public interface ProjectDAO {
	
	
	public int getProSeq();
	public int insertPro(ProjectDTO proDTO);
	public ProjectDTO getPro(int pro_no);
	public int deletePro(int pro_no);
	public int updatePro(ProjectDTO proDTO);
	public int insertBoxPro(BoxDTO boxDTO);
	public int deleteBoxPro(BoxDTO boxDTO);
	public List<ProjectUserDTO> selectBoxPro(int mem_no , int box_no);
	
}
